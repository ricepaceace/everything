#include "detections.h"
#include "constants.h"

void yamPeakFinder(detections * d)
{
	//VENTRICAL
	int datapointV = d->recentdatapoints[PREVARP - 1];
	int i;
	int sum = 0;
	for(i = 0; i < V_LENGTH-1; i++)
	{
		sum += d->recentVBools[i];
		d->recentVBools[i] = d->recentVBools[i+1];
	}
	
	d->recentVBools[V_LENGTH-1] = (d->vflip *datapointV) > d->v_thresh;
	sum += d->recentVBools[V_LENGTH-1];
	
	if(sum > V_LENGTH/2)
	{
		if(!d->last_sample_is_V)
		{
			d->VbeatDelay = 0;
			d->last_sample_is_V = 1;
		}
	}
	else if(d->last_sample_is_V)
	{
		d->VbeatFallDelay = 0;
		d->last_sample_is_V = 0;
	}
	
	// ATRIAL
	int datapointA = d->recentdatapoints[0];
	sum = 0;
	for(i = 0; i < A_LENGTH-1; i++)
	{
		sum += d->recentABools[i];
		d->recentABools[i] = d->recentABools[i+1];
	}
	
	d->recentABools[A_LENGTH-1] = (d->aflip *datapointA) > d->a_thresh;
	sum += d->recentABools[A_LENGTH-1];
	
	if(sum > A_LENGTH/2 && d->VbeatDelay > d->VbeatFallDelay && d->VbeatFallDelay > PREVARP+POSTVARP)
	{
		if(!d->last_sample_is_A)
		{
			d->AbeatDelay = 0;
			d->last_sample_is_A = 1;
		}
	}
	
	else if(d->last_sample_is_A)
		d->last_sample_is_A = 0;
}
