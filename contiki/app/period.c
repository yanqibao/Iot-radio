/**
 * 建立一个周期性的任务，用来触发其它事件
 *
*/
#include <stdio.h>
#include "contiki.h"
#include "sensors.h"
#include "adc-sensor.h"

PROCESS(period_p, "period_p");
PROCESS_THREAD(period_p, ev, data)
{
    static struct etimer s_wait;
    PROCESS_BEGIN();
    etimer_set(&s_wait, CLOCK_SECOND*5);

    while (1)
    {
        PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&s_wait));
        etimer_reset(&s_wait);
        sensors_changed(&adc_sensor);
        //printf("trigger the adc sensor\r\n");
    }
    PROCESS_END();
}