   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     	switch	.data
  17  0000               _adc_sensor_p:
  18  0000 0000          	dc.w	0
  19  0002 000f          	dc.w	L5
  21  0004 0000          	dc.w	L3_process_thread_adc_sensor_p
  22  0006 00000000      	ds.b	4
 108                     ; 10 PROCESS_THREAD(adc_sensor_p, ev, data)
 108                     ; 11 {
 110                     	switch	.text
 111  0000               L3_process_thread_adc_sensor_p:
 113  0000 89            	pushw	x
 114  0001 88            	push	a
 115       00000001      OFST:	set	1
 118                     ; 12     PROCESS_BEGIN();
 120  0002 a601          	ld	a,#1
 121  0004 6b01          	ld	(OFST+0,sp),a
 126  0006 fe            	ldw	x,(x)
 128                     ; 20         printf("the rw is %d\r\n", adc_sensor.value(ADC_TYPE_RW));
 129  0007 5d            	tnzw	x
 130  0008 2707          	jreq	L7
 131  000a 1d0012        	subw	x,#18
 132  000d 2717          	jreq	L11
 133  000f 203c          	jra	L16
 134  0011               L7:
 135                     ; 14     SENSORS_ACTIVATE(adc_sensor);
 138  0011 ae0001        	ldw	x,#1
 139  0014 89            	pushw	x
 140  0015 ae0081        	ldw	x,#129
 141  0018 72cd0004      	call	[_adc_sensor+4.w]
 143  001c 85            	popw	x
 144  001d               L76:
 145                     ; 18         PROCESS_WAIT_EVENT_UNTIL((ev==sensors_event)&&((struct sensors_sensor *)data==&adc_sensor));
 147  001d 0f01          	clr	(OFST+0,sp)
 151  001f 1e02          	ldw	x,(OFST+1,sp)
 152  0021 90ae0012      	ldw	y,#18
 153  0025 ff            	ldw	(x),y
 154  0026               L11:
 158  0026 0d01          	tnz	(OFST+0,sp)
 159  0028 270e          	jreq	L57
 161  002a 7b06          	ld	a,(OFST+5,sp)
 162  002c c10000        	cp	a,_sensors_event
 163  002f 2607          	jrne	L57
 165  0031 1e07          	ldw	x,(OFST+6,sp)
 166  0033 a30000        	cpw	x,#_adc_sensor
 167  0036 2704          	jreq	L37
 168  0038               L57:
 171  0038 a601          	ld	a,#1
 173  003a 2018          	jra	L6
 174  003c               L37:
 175                     ; 20         printf("the rw is %d\r\n", adc_sensor.value(ADC_TYPE_RW));
 177  003c ae0009        	ldw	x,#9
 178  003f 72cd0002      	call	[_adc_sensor+2.w]
 180  0043 89            	pushw	x
 181  0044 ae0000        	ldw	x,#L101
 182  0047 cd0000        	call	_printf
 184  004a 85            	popw	x
 186  004b 20d0          	jra	L76
 187  004d               L16:
 188                     ; 22     PROCESS_END();
 193  004d 1e02          	ldw	x,(OFST+1,sp)
 194  004f 905f          	clrw	y
 195  0051 ff            	ldw	(x),y
 199  0052 a603          	ld	a,#3
 201  0054               L6:
 203  0054 5b03          	addw	sp,#3
 204  0056 81            	ret
 293                     	xdef	_adc_sensor_p
 294                     	xref	_adc_sensor
 295                     	xref	_sensors_event
 296                     	xref	_printf
 297                     .const:	section	.text
 298  0000               L101:
 299  0000 746865207277  	dc.b	"the rw is %d",13
 300  000d 0a00          	dc.b	10,0
 301  000f               L5:
 302  000f 6164632d7365  	dc.b	"adc-sensor-p",0
 322                     	end
