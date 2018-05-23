/**
* hello world
*/
#include "contiki.h"

#include <stdio.h> /* For printf() */
/*---------------------------------------------------------------------------*/
PROCESS(hello_world_process, "Hello world process");

/*---------------------------------------------------------------------------*/
PROCESS_THREAD(hello_world_process, ev, data)
{
    static struct etimer s_wait;
    PROCESS_BEGIN();
    etimer_set(&s_wait, CLOCK_SECOND*60);
    while (1)
    {
        PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&s_wait));
        printf("Hello, world, the ev is: %d, the sec is %d\r\n", (int)ev, (int)clock_seconds());
        etimer_reset(&s_wait);
    }
    PROCESS_END();
}