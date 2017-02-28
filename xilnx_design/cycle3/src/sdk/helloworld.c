#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "utilities.h"
#include "maximDeviceSpecificUtilities.h"

int main()
{
    init_platform();

    xil_printf("-------STARTING sampling--------\r\n");
    continuous_sampling(10);
    xil_printf("-------EXITING PROGRAM-----------\r\n");
    cleanup_platform();
    return 0;
}


