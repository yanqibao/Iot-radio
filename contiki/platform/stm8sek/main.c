/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "sys_clock.h"
#include "contiki.h"
#include <stdio.h>
#include "leds.h"
#include "uart1.h"
#include "sensors.h"


void board_init(void);
void contiki_init(void);

void main(void)
{
    uint8_t i;
    board_init();
    contiki_init();
    
    enableInterrupts();
    
    while(1) 
    {
        do
        {
        
        }
        while(process_run() > 0);
    }
}
void putc_init(void);
/**
* @硬件初始化
*
*/
void board_init(void)
{
    //cpu初始化
    sys_clock_init(HSE);//24000000Hz系统时钟
    putchar_init();     //printf 通过uart1输出
    clock_init();       //时间基准
    //platform初始化
    leds_init();
    //
    
}

/**
*/
void contiki_init(void)
{
    clock_init();
    process_init();
    process_start(&etimer_process, NULL);//启动etimer_process
    process_start(&sensors_process, NULL);
    ctimer_init();                       //定时任务ctimer初始化
    autostart_start(autostart_processes);
    printf("Processes running\n");
}

