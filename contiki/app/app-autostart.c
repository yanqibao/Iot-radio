/**
* app-autostart.c
*/

#include "contiki.h"

PROCESS_NAME(hello_world_process);
PROCESS_NAME(leds_process);
PROCESS_NAME(button_sensor_p);
PROCESS_NAME(period_p);
PROCESS_NAME(adc_sensor_p);

//AUTOSTART_PROCESSES(&hello_world_process, &leds_process, &button_sensor_p, 
//                    &period_p, &adc_sensor_p);

AUTOSTART_PROCESSES(&period_p, &adc_sensor_p);