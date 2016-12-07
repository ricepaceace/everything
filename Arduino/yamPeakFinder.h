#include "detections.h"
#include "constants.h"
#ifdef NO_ARDUINO
#include "arduinocompat.h"
#else
#include "Arduino.h"
#endif

void yamPeakFinder(detections * d)
{
	//VENTRICAL
	int datapointV = d->recentdatapoints.head();
	int i;
	int sum = d->recentVBools.sum;
	d->recentVBools.push((d->vflip * datapointV) > d->v_thresh);
	sum += d->recentVBools.head();
	
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
	int datapointA = d->recentdatapoints.ftail();
	sum = d->recentABools.sum;
	
	d->recentABools.push((d->aflip * datapointA) > d->a_thresh);
	sum += d->recentABools.head();

  //Serial.print("sum: ");
  //Serial.println(sum);
  /*
  Serial.print(", vbeatdelay: ");
  Serial.print(d->VbeatDelay);
  Serial.print(", vbeatfalldelay: ");
  Serial.println(d->VbeatFallDelay);*/
	if(sum > A_LENGTH/2 && d->VbeatDelay > d->VbeatFallDelay)// && d->VbeatFallDelay > PREVARP+POSTVARP)
	{
    //Serial.println("We got into this statement which it should never get into");
		if(!d->last_sample_is_A)
		{
			d->AbeatDelay = 0;
			d->last_sample_is_A = 1;
		}
	}
	
	else if(d->last_sample_is_A)
		d->last_sample_is_A = 0;
}
