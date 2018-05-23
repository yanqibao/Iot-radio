/**
 *leds-process
*/

#include "contiki.h"
#include "leds.h"
#include<stdio.h>

#define DEBUG 0
#if DEBUG
#include <stdio.h>
#define PRINTF(...) printf(__VA_ARGS__)
#else
#define PRINTF(...)
#endif
/**
*/
PROCESS(leds_process, "leds-process");
//
const char message[] = "the date is 2017-06-18\r\n";
void show(char *s)
{
    printf("show function is called %s", s);
}


//
PROCESS_THREAD(leds_process, ev, data)
{
    static struct etimer s_wait;
    static struct ctimer s_ct;
    static int cnt;
    PROCESS_BEGIN();
    etimer_set(&s_wait, CLOCK_SECOND*3);
    ctimer_set(&s_ct, CLOCK_SECOND*10, show, (void *)message);
    while (1)
    {
        PROCESS_WAIT_EVENT();
        PRINTF("leds-process %d\r\n", (int)cnt);
        cnt++;
        leds_toggle(LEDS_GREEN);
        etimer_reset(&s_wait);
    }
    PROCESS_END();
}