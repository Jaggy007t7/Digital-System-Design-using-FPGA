#include <stdio.h>
#include "xil_printf.h"
#include "xv_tpg.h"
#include "xparameters.h"
#include "xstatus.h"

XV_tpg tpg_inst;
int Status;

int main()
{
    xil_printf("Hello World\r\n");

    /* TPG Initialization */
    Status = XV_tpg_Initialize(&tpg_inst,
                               XPAR_V_TPG_0_BASEADDR);

    if (Status != XST_SUCCESS)
    {
        xil_printf("TPG configuration failed\r\n");
        return XST_FAILURE;
    }

    /* Set Resolution to 1920x1080 */
    XV_tpg_Set_height(&tpg_inst, 1080);
    XV_tpg_Set_width(&tpg_inst, 1920);

    /* Set Color Space to RGB */
    XV_tpg_Set_colorFormat(&tpg_inst, 0);

    /* Set pattern to color bar */
    XV_tpg_Set_bckgndId(&tpg_inst,
                        XTPG_BKGND_COLOR_BARS);

    /* Start the TPG */
    XV_tpg_EnableAutoRestart(&tpg_inst);
    XV_tpg_Start(&tpg_inst);

    xil_printf("TPG started!\r\n");

    while (1);

    return 0;
}
