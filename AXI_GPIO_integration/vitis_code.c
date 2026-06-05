// Code for integrating Hardware and software;
#include "xil_io.h"
#include "xil_printf.h"
#include "xuartps_hw.h"
#include <stdlib.h>

// AXI GPIO base addresses
#define GPIO_A_BASE 0x41200000
#define GPIO_B_BASE 0x41210000
#define GPIO_Y_BASE 0x41220000

// GPIO register offsets
#define GPIO_DATA_OFFSET 0x0
#define GPIO_TRI_OFFSET  0x4

// UART base address
#define UART_BASEADDR 0xE0000000

// Function to receive string from UART
void uart_gets(char *buffer, int max_len)
{
    int i = 0;
    char c;

    while(i < (max_len - 1))
    {
        // Wait for character
        while(!(XUartPs_IsReceiveData(UART_BASEADDR)));

        c = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET);

        // Enter key
        if(c == '\r' || c == '\n')
        {
            xil_printf("\r\n");
            break;
        }

        // Echo character
        xil_printf("%c", c);

        buffer[i++] = c;
    }

    buffer[i] = '\0';
}

int main()
{
    char input[20];

    xil_printf("\r\n");
    xil_printf("====================================\r\n");
    xil_printf(" Interactive Multiplier Test\r\n");
    xil_printf("====================================\r\n");

    // Configure GPIO directions

    // GPIO A -> output
    Xil_Out32(GPIO_A_BASE + GPIO_TRI_OFFSET, 0x00);

    // GPIO B -> output
    Xil_Out32(GPIO_B_BASE + GPIO_TRI_OFFSET, 0x00);

    // GPIO Y -> input
    Xil_Out32(GPIO_Y_BASE + GPIO_TRI_OFFSET, 0xFFFF);

    while(1)
    {
        int a, b;
        int result;

        // Get A
        xil_printf("\r\nEnter A (0-255): ");

        uart_gets(input, 20);

        a = atoi(input);

        // Get B
        xil_printf("Enter B (0-255): ");

        uart_gets(input, 20);

        b = atoi(input);

        // Send to multiplier
        Xil_Out32(GPIO_A_BASE + GPIO_DATA_OFFSET, a);
        Xil_Out32(GPIO_B_BASE + GPIO_DATA_OFFSET, b);

        // Small delay
        for(volatile int i = 0; i < 10000; i++);

        // Read result
        result = Xil_In32(GPIO_Y_BASE + GPIO_DATA_OFFSET);

        xil_printf("\r\n");
        xil_printf("====================================\r\n");
        xil_printf("A      = %d\r\n", a);
        xil_printf("B      = %d\r\n", b);
        xil_printf("Result = %d\r\n", result);
        xil_printf("====================================\r\n");
    }

    return 0;
}
