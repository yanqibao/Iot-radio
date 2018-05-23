/**
* button-sensor.c
*
*/


#include "contiki.h"
#include "button-sensor.h"
#include <stdio.h>

PROCESS(button_sensor_p, "button-sensor");
PROCESS_THREAD(button_sensor_p, ev, data)
{
    static int cnt=0;
    PROCESS_BEGIN();
    printf("button-sensor is start...\r\n");
    SENSORS_ACTIVATE(button_sensor);
    while (1)
    {
        PROCESS_WAIT_EVENT_UNTIL((ev==sensors_event)&&((struct sensors_sensor*)data==&button_sensor));
        printf("button-sensor wakeup the cnt is %d\r\n", (int)cnt++);
    }
    PROCESS_END();
}