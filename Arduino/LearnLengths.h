
#pragma once
#define MAX_EXTREMA (MAX_EDGES * 2)
#include "constants.h"
#include <limits.h>

long long int ddatadt[PARAM_LEARN_SIZE];
#define EXTREME_OVER 100
CircularBuffer<int, 2*EXTREME_OVER> nearby;

int nextrema = 0;
int wall_times[MAX_EXTREMA];
short wall_steeps[MAX_EXTREMA];
int npeaks = 0;
int peak_lengths[MAX_EXTREMA];
int peak_heights[MAX_EXTREMA];

#include "kmeans.h"

#define SIGN(x) ((x) > 0 ? 1 : -1)
struct peak_lengths {
	int v_length;
	int a_length;
};

struct peak_lengths LearnLengths(void) // learns from ldata
{
	ddatadt[0] = 0;
	int maxdata = ldata[0], maxddatadt = 0;
	for (int i = 1; i < PARAM_LEARN_SIZE; i++) {
		long long int diff = ldata[i]-ldata[i-1];
		double _diff = diff;
		double t = _diff * _diff * ldata[i] *SIGN(ldata[i]) * SIGN(diff);
		ddatadt[i] = diff*diff * ldata[i] * SIGN(ldata[i]) * SIGN(diff);
		if (abs(t - ddatadt[i]) > 2)
			printf("Double: %f, int: %d\n", t, ddatadt[i]);
		maxdata = max(maxdata, ldata[i]);
		maxddatadt = max(maxddatadt, ddatadt[i]);
	}

	for (int i = 1; i < PARAM_LEARN_SIZE; i++) {
		bool divided = false;

		// We just want to compute ddatadt[i] * maxdata * 100 / maxddatadt without overflowing
#if DEBUG_OVERFLOW
		double before = ddatadt[i];
#endif
		if (abs(ddatadt[i]) > INT_MAX/100) {
			ddatadt[i] /= maxddatadt;
			divided = true;
		}
		ddatadt[i] *= 100;
		if (!divided && abs(ddatadt[i]) > INT_MAX/maxdata) {
			ddatadt[i] /= maxddatadt;
			divided = true;
		}
		ddatadt[i] *= maxdata;
		if (!divided)
			ddatadt[i] /= maxddatadt;

#if DEBUG_OVERFLOW
		double t = before * 100.0 * maxdata / maxddatadt;
		if (abs(t-ddatadt[i]) > 2 && max(t, ddatadt[i])/min(t, ddatadt[i]) > 1.01) 
			printf("#2:Before: %f Double: %f, int: %d\n", before, t, ddatadt[i]);
#endif

	}

	// Pos and neg
	for (int s = 1; s >= -1; s -= 2) {
		for (int add = 1; add < PARAM_LEARN_SIZE + EXTREME_OVER; add++) {
			if (add >= PARAM_LEARN_SIZE)
				nearby.pop();
			else if (SIGN(ldata[add]) == s)
				nearby.push(ddatadt[add]);
			else
				nearby.push(0);

			int i = add - EXTREME_OVER; // The index we are checking to see if it is an extrema
			// Because we never explicitly pop, this iteration is in order until it is full, in which case it no longer matters
			if (i >= 0 && SIGN(ldata[i]) == s && ddatadt[i] != 0) {
				bool stillMax = true, stillMin = true;
				for (int j = 0; (stillMax || stillMin) && j < nearby.len; j++) {
					if (ddatadt[i] < nearby.data[j] && (i != j))
						stillMax = false;
					if (ddatadt[i] > nearby.data[j] && (i != j))
						stillMin = false;
				}
				if ((stillMax || stillMin) && nextrema < MAX_EXTREMA) {
					// We found an extrema
					wall_times[nextrema] = i;
					wall_steeps[nextrema] = ddatadt[i];
					nextrema++;
				}
			}
		}
		
		int lengthsum = 0, heightsum = 0;
		for (int i = 1; i < nextrema; i++) {
			int len = wall_times[i] - wall_times[i-1];
			short max_winpeak = 0;
			for (int j = wall_times[i-1]; j <= wall_times[i]; j++) {
				max_winpeak = max(max_winpeak, abs(ldata[j]));
			}
			short height = SIGN(ldata[wall_times[i-1]])*max_winpeak - (ldata[wall_times[i-1]] + ldata[wall_times[i]])/2;
			if( (SIGN(wall_steeps[i-1]) != SIGN(wall_steeps[i]))  && 
						(SIGN(ldata[wall_times[i-1]]) == s) && 
						(SIGN(ldata[wall_times[i]]) == s) && 
						(SIGN(wall_steeps[i-1]) == s) && 
						(SIGN(wall_steeps[i]) != s) &&
						len < 75 && //TODO: Make sample-rate invariant
						len > 2 &&
						npeaks < MAX_EXTREMA) 				
					{
						peak_lengths[npeaks] = len;
						peak_heights[npeaks] = height;
						npeaks++;

						lengthsum += len;
						heightsum += height;
					}
		}
		for (int i = 0; i < npeaks; i++) {
			peak_lengths[i] = (peak_lengths[i] * npeaks * 100) / lengthsum;
			peak_heights[i] = (peak_heights[i] * npeaks * 100) / heightsum;
		}
		struct means pl = kmeans(npeaks);
		struct peak_lengths toReturn;
		if (pl.c1x < pl.c2x) {
			toReturn.v_length = (pl.c1x * lengthsum) / (npeaks * 100);
			toReturn.a_length = (pl.c2x * lengthsum) / (npeaks * 100);
		} else {
			toReturn.v_length = (pl.c2x * lengthsum) / (npeaks * 100);
			toReturn.a_length = (pl.c1x * lengthsum) / (npeaks * 100);
		}
		// TODO: Consider s = -1 case
		return toReturn;

	}

}
