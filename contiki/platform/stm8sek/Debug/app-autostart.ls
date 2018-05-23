   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     .const:	section	.text
  17  0000               _autostart_processes:
  18  0000 0000          	dc.w	_period_p
  19  0002 0000          	dc.w	_adc_sensor_p
  20  0004 0000          	dc.w	0
 133                     	xref	_adc_sensor_p
 134                     	xref	_period_p
 135                     	xdef	_autostart_processes
 154                     	end
