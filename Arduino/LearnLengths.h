
#pragma once

short ddatadt[PARAM_LEARN_SIZE];
#define EXTREME_OVER 100
CircularBuffer<int, 2*EXTREME_OVER> nearby;

#define MAX_EXTREMA (MAX_EDGES * 2)
int nextrema = 0;
int wall_times[MAX_EXTREMA];
short wall_steeps[MAX_EXTREMA];
int npeaks = 0;
int peak_lengths[MAX_EXTREMA];
int peak_heights[MAX_EXTREMA];


#define SIGN(x) ((x) > 0 ? 1 : -1)
struct peak_lengths {
	int v_length[2];
	int a_length[2];
};

struct peak_lengths LearnLengths(void) // learns from ldata
{
	ddatadt[0] = 0;
	int maxdata = data[0], maxddatadt = 0;
	for (int i = 1; i < PARAM_LEARN_SIZE; i++) {
		int diff = ldata[i]-ldata[i-1];
		ddatadt[i] = diff*diff*diff*diff*diff * ldata[i] * SIGN(ldata[i]);
		maxdata = max(maxdata, data[i]);
		maxddatadt = max(maxddatadt, ddatadt[i]);
	}
	for (int i = 1; i < PARAM_LEARN_SIZE; i++) {
		ddatadt[i] = (ddatadt[i] * maxdata) / maxddatadt;
	}

	// Pos and neg
	for (int s = -1; s <= 1; s += 2) {
		for (int i = 1; i < PARAM_LEARN_SIZE; i++) {
			if (SIGN(ddatadt[i]) == s)
				nearby.push(ddatadt[i]);
			else
				nearby.push(0);

			// Because we never explicitly pop, this iteration is in order until it is full, in which case it no longer matters
			if (SIGN(data[i]) == s) {
				bool stillMax = true, stillMin = true;
				for (int j = 0; (stillMax || stillMin) && j < nearby.len; j++) {
					if (ddatadt[i] < nearby.data[j])
						stillMax = false;
					if (ddatadt[i] > nearby.data[j])
						stillMin = false;
				}
				if (stillMax || stillMin && nextrema < MAX_EXTREMA) {
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
			if( ((SIGN(wall_steeps[i-1]) != SIGN(wall_steeps[i]))  && 
						(SIGN(ldata[wall_times[i-1]]) == s) && 
						(SIGN(ldata[wall_times[i]]) == s) && 
						(SIGN(wall_steeps[i-1]) == s) && 
						(SIGN(wall_steeps[i]) != s) &&
						len < 75 && //TODO: Make sample-rate invariant
						npeaks < MAX_EXTREMA) 				
					{
						peak_length[npeaks] = len;
						peak_heights[npeaks] = height;
						npeaks++;

						lengthsum += len;
						heightsum += height;
					}
		}
		for (int i = 0; i < npeaks; i++) {
			peak_lengths[i] = (peak_lengths[i] * npeaks) / lengthsum;
			peak_heights[i] = (peak_heights[i] * npeaks) / heightsum;
		}

	}

}
