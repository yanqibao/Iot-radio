/**
*/
#include <stdio.h>
#include "contiki.h"
#include "sensors.h"
#include "adc-sensor.h"

PROCESS(adc_sensor_p, "adc-sensor-p");

PROCESS_THREAD(adc_sensor_p, ev, data)
{
    PROCESS_BEGIN();
    
    SENSORS_ACTIVATE(adc_sensor);
    
    while (1)
    {
        PROCESS_WAIT_EVENT_UNTIL((ev==sensors_event)&&((struct sensors_sensor *)data==&adc_sensor));
        //printf("the rw is %d, the pho is %d\r\n", adc_sensor.value(ADC_TYPE_RW), adc_sensor.value(ADC_TYPE_PHO));
        printf("the rw is %d\r\n", adc_sensor.value(ADC_TYPE_RW));
    }
    PROCESS_END();
}