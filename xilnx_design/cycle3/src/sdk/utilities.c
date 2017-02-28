#include "utilities.h"

void delay(int nStopValue)
/**
* \brief       Loop for nStopValue iterations to provide a delay.
* \par         Details
*              It is commonly used with the constant 'ABOUT_ONE_SECOND' defined in maximPMOD.h for
*              setting approximate delays
*
* \param[in]   nStopValue    - number of iterations to loop
*
* \retval      None
*/
{
	int i=0;
	int a=0;

	for(i=0;i<nStopValue;i++)
	{
		a=i;
	}
}

int number_raised_to_power(int nBase, int nExponent)
/**
* \brief       Raise nBase to the nExponent power (operates with integers only).
* \par         Details
*              Many Microblaze applications will not have math.h included due to limited memory space.
*              This is a simple functions to implement (nBase ^ nExponent)
*              Some Maxim devices (such as MAX44009) return values in mantissa + (power of 2) exponent format.
*
* \param[in]   nBase             - base
* \param[in]   nExponent         - exponent
*
* \retval      Base^Exponent
*/
{
	int i=0;
	int nValue=0;
	if(nExponent==0)
		nValue=1;
	else
	{
		nValue = nBase;
		for(i=1;i<nExponent;i++)
		{
			nValue = nValue * nBase;
		}
	}
	return(nValue);
}
