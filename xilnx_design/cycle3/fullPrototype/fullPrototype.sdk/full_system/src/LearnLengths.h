#pragma once
#include "constants.h"
#include "circularBuffer.h"


struct means
{
	int c1x, c1y;
	int c2x, c2y;
};



static long long  ddatadt[PARAM_LEARN_SIZE];

static struct means kmeans(int npts, int * peak_lengths, int * peak_heights);


void learnLengths(short * ldata, int * v_length, int * a_length)
{
	CircularBuffer<int, 2*EXTREME_OVER> nearby;
	int nextrema = 0;
	int wall_times[MAX_EXTREMA];
	short wall_steeps[MAX_EXTREMA];
	int npeaks = 0;
	int peak_lengths[MAX_EXTREMA];
	int peak_heights[MAX_EXTREMA];

	ddatadt[0] = 0;
	int maxdata = ldata[0], maxddatadt = 0, i, j, add;
	for (i = 1; i < PARAM_LEARN_SIZE; i++)
	{
		long long diff = ldata[i]-ldata[i-1];
		ddatadt[i] = diff*diff * ldata[i] * SIGN(ldata[i]) * SIGN(diff);

		maxdata = MAX(maxdata, ldata[i]);
		maxddatadt = MAX(maxddatadt, ddatadt[i]);
	}

	for (i = 1; i < PARAM_LEARN_SIZE; i++)
		ddatadt[i] = (ddatadt[i] * 100 * maxdata) /maxddatadt;

	for (add = 1; add < PARAM_LEARN_SIZE + EXTREME_OVER; add++)
	{
		if (add >= PARAM_LEARN_SIZE)
			nearby.pop();
		else if (SIGN(ldata[add]) == 1)
			nearby.push(ddatadt[add]);
		else
			nearby.push(0);

		i = add - EXTREME_OVER; // The index we are checking to see if it is an extrema
		// Because we never explicitly pop, this iteration is in order until it is full, in which case it no longer matters
		if (i >= 0 && SIGN(ldata[i]) == 1 && ddatadt[i] != 0)
		{
			bool stillMax = true, stillMin = true;
			for (j = 0; (stillMax || stillMin) && j < nearby.len; j++)
			{
				if (ddatadt[i] < nearby.data[j] && (i != j))
					stillMax = false;
				if (ddatadt[i] > nearby.data[j] && (i != j))
					stillMin = false;
			}
			if ((stillMax || stillMin) && nextrema < MAX_EXTREMA)
			{
				// We found an extrema
				wall_times[nextrema] = i;
				wall_steeps[nextrema] = ddatadt[i];
				nextrema++;
			}
		}
	}

	int lengthsum = 0, heightsum = 0;
	for (i = 1; i < nextrema; i++)
	{
		int len = wall_times[i] - wall_times[i-1];
		short max_winpeak = 0;
		for (j = wall_times[i-1]; j <= wall_times[i]; j++)
		{
			max_winpeak = MAX(max_winpeak, ABS(ldata[j]));
		}
		short height = SIGN(ldata[wall_times[i-1]])*max_winpeak - (ldata[wall_times[i-1]] + ldata[wall_times[i]])/2;
		if((SIGN(wall_steeps[i-1]) != SIGN(wall_steeps[i]))  &&
					(SIGN(ldata[wall_times[i-1]]) == 1) &&
					(SIGN(ldata[wall_times[i]]) == 1) &&
					(SIGN(wall_steeps[i-1]) == 1) &&
					(SIGN(wall_steeps[i]) != 1) &&
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

	for (i = 0; i < npeaks; i++)
	{
		peak_lengths[i] = (peak_lengths[i] * npeaks * 100) / lengthsum;
		peak_heights[i] = (peak_heights[i] * npeaks * 100) / heightsum;
	}

	struct means pl = kmeans(npeaks,peak_lengths, peak_heights);

	if (pl.c1x < pl.c2x) {
		*v_length = (pl.c1x * lengthsum) / (npeaks * 100);
		*a_length = (pl.c2x * lengthsum) / (npeaks * 100);
	}
	else
	{
		*v_length = (pl.c2x * lengthsum) / (npeaks * 100);
		*a_length = (pl.c1x * lengthsum) / (npeaks * 100);
	}

}



char cluster[MAX_EXTREMA];

// squared dist between point #i and (cent_x, cent_y)
#define P_DIST2(i, x, y) ((peak_lengths[i] - x) * (peak_lengths[i] - x) + (peak_heights[i] - y) * (peak_heights[i] - y))
// Because we are using integers, k-means may not converge
#define MAX_ITER 20



static struct means kmeans(int npts, int * peak_lengths, int * peak_heights)
{

	int firstCenterIdx	= npts/2; // This should be a random int between 0 and npts-1 but this is close enough
	int c1x = peak_lengths[firstCenterIdx];
	int c1y = peak_heights[firstCenterIdx];
	int i ,ii, c1count ,c2count;

	unsigned char iter = 0;
	long long sum = 0;
	for (i = 0; i < npts; i++)
		sum += P_DIST2(i, c1x, c1y);

	long long randomVal = sum/2; // This should be a random int < sum

	for (ii = 0; randomVal > 0 && ii < npts; ii++)
		randomVal -= P_DIST2(ii, c1x, c1y);

	int c2x = peak_lengths[ii];
	int c2y = peak_heights[ii];


	while (iter++ < MAX_ITER)
	{
		bool converged = true;
		for (i = 0; i < npts; i++)
		{
			char closestCluster;
			if (P_DIST2(i, c1x, c1y) < P_DIST2(i, c2x, c2y))
			{
				closestCluster = 1;
			}
			else
			{
				closestCluster = 2;
			}
			if (closestCluster != cluster[i])
				converged = false;

			cluster[i] = closestCluster;
		}
		if (converged)
			break;

		c1x = 0;
		c1y = 0;
		c2x = 0;
		c2y = 0;

		c1count = 0;
		c2count = 0;
		for (i = 0; i < npts; i++)
		{
			if (cluster[i] == 1)
			{
				c1x += peak_lengths[i];
				c1y += peak_heights[i];
				c1count++;
			}
			else
			{
				c2x += peak_lengths[i];
				c2y += peak_heights[i];
				c2count++;
			}
		}
		c1x /= c1count;
		c1y /= c1count;
		c2x /= c2count;
		c2y /= c2count;


	}
	struct means toReturn = {c1x, c1y, c2x, c2y};
	return toReturn;

}

