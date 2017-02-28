#include "constants.h"
#include "channel.h"

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
	Decision(1, 1, 1, 72, 161, 1, -1, 18, 5, 0); // Values learned from running parameter learning algorithm on this data
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
