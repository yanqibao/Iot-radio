   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     	switch	.data
  17  0000               _sensors:
  18  0000 0000          	dc.w	_button_sensor
  19  0002 0000          	dc.w	_adc_sensor
  20  0004 0000          	dc.w	0
 114                     	switch	.bss
 115  0000               _sensors_flags:
 116  0000 000000        	ds.b	3
 117                     	xdef	_sensors_flags
 118                     	xdef	_sensors
 119                     	xref	_adc_sensor
 120                     	xref	_button_sensor
 140                     	end
