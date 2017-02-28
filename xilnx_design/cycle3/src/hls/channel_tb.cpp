#include <stdio.h>
#include "constants.h"
#include "channel.h"

//#include "test.h"
const short data[10000] = {
#include "good-ch2.h"
};

int check(void);

int main()
{
	return check();

}

int check()
{
	char apeaks =0;
	char vpeaks = 0;
	int result;
	Decision(1, 1, 1, 161, 72, 1, -1, 18, 5, 0);
	int i;
	for(i = 0; i < 10000; i++)
	{
		result = Decision(0,0,0, 0, 0, 0, 0, 0, 0, data[i]);
		if(result == -4096)
		{
			apeaks ++;
		}
		else if(result == 240)
		{
			vpeaks ++;
		}
	}
	if(apeaks !=18) return 1;
	if(vpeaks !=17) return 1;

	return 0;
}
