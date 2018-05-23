   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     	switch	.data
  17  0000               _button_sensor_p:
  18  0000 0000          	dc.w	0
  19  0002 0041          	dc.w	L5
  21  0004 0000          	dc.w	L3_process_thread_button_sensor_p
  22  0006 00000000      	ds.b	4
  23  000a               L7_cnt:
  24  000a 0000          	dc.w	0
 117                     ; 12 PROCESS_THREAD(button_sensor_p, ev, data)
 117                     ; 13 {
 119                     	switch	.text
 120  0000               L3_process_thread_button_sensor_p:
 122  0000 89            	pushw	x
 123  0001 88            	push	a
 124       00000001      OFST:	set	1
 127                     ; 15     PROCESS_BEGIN();
 129  0002 a601          	ld	a,#1
 130  0004 6b01          	ld	(OFST+0,sp),a
 135  0006 fe            	ldw	x,(x)
 137                     ; 21         printf("button-sensor wakeup the cnt is %d\r\n", (int)cnt++);
 138  0007 5d            	tnzw	x
 139  0008 2707          	jreq	L11
 140  000a 1d0014        	subw	x,#20
 141  000d 271d          	jreq	L31
 142  000f 2048          	jra	L56
 143  0011               L11:
 144                     ; 16     printf("button-sensor is start...\r\n");
 147  0011 ae0025        	ldw	x,#L76
 148  0014 cd0000        	call	_printf
 150                     ; 17     SENSORS_ACTIVATE(button_sensor);
 152  0017 ae0001        	ldw	x,#1
 153  001a 89            	pushw	x
 154  001b ae0081        	ldw	x,#129
 155  001e 72cd0004      	call	[_button_sensor+4.w]
 157  0022 85            	popw	x
 158  0023               L57:
 159                     ; 20         PROCESS_WAIT_EVENT_UNTIL((ev==sensors_event)&&((struct sensors_sensor*)data==&button_sensor));
 161  0023 0f01          	clr	(OFST+0,sp)
 165  0025 1e02          	ldw	x,(OFST+1,sp)
 166  0027 90ae0014      	ldw	y,#20
 167  002b ff            	ldw	(x),y
 168  002c               L31:
 172  002c 0d01          	tnz	(OFST+0,sp)
 173  002e 270e          	jreq	L301
 175  0030 7b06          	ld	a,(OFST+5,sp)
 176  0032 c10000        	cp	a,_sensors_event
 177  0035 2607          	jrne	L301
 179  0037 1e07          	ldw	x,(OFST+6,sp)
 180  0039 a30000        	cpw	x,#_button_sensor
 181  003c 2704          	jreq	L101
 182  003e               L301:
 185  003e a601          	ld	a,#1
 187  0040 201e          	jra	L01
 188  0042               L101:
 189                     ; 21         printf("button-sensor wakeup the cnt is %d\r\n", (int)cnt++);
 191  0042 ce000a        	ldw	x,L7_cnt
 192  0045 725c000b      	inc	L7_cnt+1
 193  0049 2604          	jrne	L6
 194  004b 725c000a      	inc	L7_cnt
 195  004f               L6:
 196  004f 89            	pushw	x
 197  0050 ae0000        	ldw	x,#L701
 198  0053 cd0000        	call	_printf
 200  0056 85            	popw	x
 202  0057 20ca          	jra	L57
 203  0059               L56:
 204                     ; 23     PROCESS_END();
 209  0059 1e02          	ldw	x,(OFST+1,sp)
 210  005b 905f          	clrw	y
 211  005d ff            	ldw	(x),y
 215  005e a603          	ld	a,#3
 217  0060               L01:
 219  0060 5b03          	addw	sp,#3
 220  0062 81            	ret
 309                     	xdef	_button_sensor_p
 310                     	xref	_printf
 311                     	xref	_button_sensor
 312                     	xref	_sensors_event
 313                     .const:	section	.text
 314  0000               L701:
 315  0000 627574746f6e  	dc.b	"button-sensor wake"
 316  0012 757020746865  	dc.b	"up the cnt is %d",13
 317  0023 0a00          	dc.b	10,0
 318  0025               L76:
 319  0025 627574746f6e  	dc.b	"button-sensor is s"
 320  0037 746172742e2e  	dc.b	"tart...",13
 321  003f 0a00          	dc.b	10,0
 322  0041               L5:
 323  0041 627574746f6e  	dc.b	"button-sensor",0
 343                     	end
