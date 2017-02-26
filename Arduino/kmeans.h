char cluster[MAX_EXTREMA];

// squared dist between point #i and (cent_x, cent_y)
#define P_DIST2(i, cent_x, cent_y) ((peak_lengths[i] - cent_x) * (peak_lengths[i] - cent_x) + (peak_heights[i] - cent_y) * (peak_heights[i] - cent_y))
// Because we are using integers, k-means may not converge
#define MAX_ITER 20

struct means {
	int c1x, c1y;
	int c2x, c2y;
};

struct means kmeans(int npts) {
	int firstCenterIdx	= npts/2; // This should be a random int between 0 and npts-1 but this is close enough
	int c1x = peak_lengths[firstCenterIdx];
	int c1y = peak_heights[firstCenterIdx];

	long long sum = 0;
	for (int i = 0; i < npts; i++)
		sum += P_DIST2(i, c1x, c1y);
	long long randomVal = sum/2; // This should be a random int < sum
	int ii; // index of second center
	for (ii = 0; randomVal > 0 && ii < npts; ii++)
		randomVal -= P_DIST2(ii, c1x, c1y);

	int c2x = peak_lengths[ii];
	int c2y = peak_heights[ii];

	int iter = 0;
	while (iter++ < MAX_ITER) {
		bool converged = true;
		for (int i = 0; i < npts; i++) {
			char closestCluster;
			if (P_DIST2(i, c1x, c1y) < P_DIST2(i, c2x, c2y))
				closestCluster = 1;
			else
				closestCluster = 2;
			if (closestCluster != cluster[i])
				converged = false;
			cluster[i] = closestCluster;
		}
		if (converged)
			break;
		c1x = c1y = c2x = c2y = 0;
		int c1count = 0, c2count = 0;
		for (int i = 0; i < npts; i++) {
			if (cluster[i] == 1) {
				c1x += peak_lengths[i];
				c1y += peak_heights[i];
				c1count++;
			}
			else {
				c2x += peak_lengths[i];
				c2y += peak_heights[i];
				c2count++;
			}
		}
		c1x /= c1count;
		c1y /= c1count;
		c2x /= c2count;
		c2y /= c2count;

		printf("C1: (%d, %d) # = %d; C2: (%d, %d) # = %d\n", c1x, c1y, c1count, c2x, c2y, c2count);


	}
	struct means toReturn = {c1x, c1y, c2x, c2y};
	return toReturn;

}
