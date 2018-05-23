/**
 * stm8sek uart1驱动，将其作为prinf输入映射
*/
#include "stm8s.h"
#include "stm8s_uart1.h"
#include "stm8s_clk.h"

char putchar(char ch)
{
    UART1_SendData8(ch);
    while (UART1_GetFlagStatus(UART1_FLAG_TC)==RESET);
    
    return (ch);
}

void putchar_init(void)
{
    /*High speed internal clock prescaler: 1*/
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    UART1_DeInit();
    /* UART1 configuration ------------------------------------------------------*/
    /* UART1 configured as follow:
        - BaudRate = 115200 baud  
        - Word Length = 8 Bits
        - One Stop Bit
        - No parity
        - Receive and transmit enabled
        - UART1 Clock disabled
    */
    UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
              UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
}