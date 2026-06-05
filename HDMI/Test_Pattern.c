#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xv_tpg.h"
XV_tpg tpg_inst;
int Status;
int main()
{
init_platform();
print("Hello World\n\r");
/* TPG Initialization */
Status = XV_tpg_Initialize(&tpg_inst, XPAR_V_TPG_0_DEVICE_ID);
if(Status!= XST_SUCCESS)
{
xil_printf("TPG configuration failed\r\n");
return(XST_FAILURE);
}
// Set Resolution to 1920x1080
XV_tpg_Set_height(&tpg_inst, 1080);
XV_tpg_Set_width(&tpg_inst, 1920);
// Set Color Space to RGB
XV_tpg_Set_colorFormat(&tpg_inst, 0x0);
//Set pattern to color bar
XV_tpg_Set_bckgndId(&tpg_inst, XTPG_BKGND_COLOR_BARS);
//Start the TPG
XV_tpg_EnableAutoRestart(&tpg_inst);
XV_tpg_Start(&tpg_inst);
xil_printf("TPG started!\r\n");
/* End of TPG code*/
cleanup_platform();
return 0;
}
