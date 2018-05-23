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
* @Ӳ����ʼ��
*
*/
void board_init(void)
{
    //cpu��ʼ��
    sys_clock_init(HSE);//24000000Hzϵͳʱ��
    putchar_init();     //printf ͨ��uart1���
    clock_init();       //ʱ���׼
    //platform��ʼ��
    leds_init();
    //
    
}

/**
*/
void contiki_init(void)
{
    clock_init();
    process_init();
    process_start(&etimer_process, NULL);//����etimer_process
    process_start(&sensors_process, NULL);
    ctimer_init();                       //��ʱ����ctimer��ʼ��
    autostart_start(autostart_processes);
    printf("Processes running\n");
}

