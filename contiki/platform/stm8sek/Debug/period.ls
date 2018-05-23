   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     	switch	.data
  17  0000               _period_p:
  18  0000 0000          	dc.w	0
  19  0002 0000          	dc.w	L5
  21  0004 0000          	dc.w	L3_process_thread_period_p
  22  0006 00000000      	ds.b	4
  23                     	switch	.bss
  24  0000               L7_s_wait:
  25  0000 000000000000  	ds.b	8
 231                     ; 11 PROCESS_THREAD(period_p, ev, data)
 231                     ; 12 {
 233                     	switch	.text
 234  0000               L3_process_thread_period_p:
 236  0000 89            	pushw	x
 237  0001 88            	push	a
 238       00000001      OFST:	set	1
 241                     ; 14     PROCESS_BEGIN();
 243  0002 a601          	ld	a,#1
 244  0004 6b01          	ld	(OFST+0,sp),a
 249  0006 fe            	ldw	x,(x)
 251                     ; 21         sensors_changed(&adc_sensor);
 252  0007 5d            	tnzw	x
 253  0008 2707          	jreq	L11
 254  000a 1d0013        	subw	x,#19
 255  000d 2716          	jreq	L31
 256  000f 2035          	jra	L741
 257  0011               L11:
 258                     ; 15     etimer_set(&s_wait, CLOCK_SECOND*5);
 261  0011 ae1388        	ldw	x,#5000
 262  0014 89            	pushw	x
 263  0015 ae0000        	ldw	x,#L7_s_wait
 264  0018 cd0000        	call	_etimer_set
 266  001b 85            	popw	x
 267  001c               L551:
 268                     ; 19         PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&s_wait));
 270  001c 0f01          	clr	(OFST+0,sp)
 274  001e 1e02          	ldw	x,(OFST+1,sp)
 275  0020 90ae0013      	ldw	y,#19
 276  0024 ff            	ldw	(x),y
 277  0025               L31:
 281  0025 0d01          	tnz	(OFST+0,sp)
 282  0027 270b          	jreq	L361
 284  0029 ae0000        	ldw	x,#L7_s_wait
 285  002c cd0000        	call	_etimer_expired
 287  002f a30000        	cpw	x,#0
 288  0032 2604          	jrne	L161
 289  0034               L361:
 292  0034 a601          	ld	a,#1
 294  0036 2015          	jra	L6
 295  0038               L161:
 296                     ; 20         etimer_reset(&s_wait);
 298  0038 ae0000        	ldw	x,#L7_s_wait
 299  003b cd0000        	call	_etimer_reset
 301                     ; 21         sensors_changed(&adc_sensor);
 303  003e ae0000        	ldw	x,#_adc_sensor
 304  0041 cd0000        	call	_sensors_changed
 307  0044 20d6          	jra	L551
 308  0046               L741:
 309                     ; 24     PROCESS_END();
 314  0046 1e02          	ldw	x,(OFST+1,sp)
 315  0048 905f          	clrw	y
 316  004a ff            	ldw	(x),y
 320  004b a603          	ld	a,#3
 322  004d               L6:
 324  004d 5b03          	addw	sp,#3
 325  004f 81            	ret
 350                     	xdef	_period_p
 351                     	xref	_adc_sensor
 352                     	xref	_sensors_changed
 353                     	xref	_etimer_expired
 354                     	xref	_etimer_reset
 355                     	xref	_etimer_set
 356                     .const:	section	.text
 357  0000               L5:
 358  0000 706572696f64  	dc.b	"period_p",0
 378                     	end
