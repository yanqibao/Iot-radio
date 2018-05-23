   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     	switch	.data
  17  0000               _leds_process:
  18  0000 0000          	dc.w	0
  19  0002 0034          	dc.w	L5
  21  0004 0009          	dc.w	L3_process_thread_leds_process
  22  0006 00000000      	ds.b	4
  23                     .const:	section	.text
  24  0000               _message:
  25  0000 746865206461  	dc.b	"the date is 2017-0"
  26  0012 362d31380d    	dc.b	"6-18",13
  27  0017 0a00          	dc.b	10,0
  69                     ; 21 void show(char *s)
  69                     ; 22 {
  71                     	switch	.text
  72  0000               _show:
  76                     ; 23     printf("show function is called %s", s);
  78  0000 89            	pushw	x
  79  0001 ae0019        	ldw	x,#L33
  80  0004 cd0000        	call	_printf
  82  0007 85            	popw	x
  83                     ; 24 }
  86  0008 81            	ret
  89                     	switch	.bss
  90  0000               L53_s_wait:
  91  0000 000000000000  	ds.b	8
  92  0008               L14_cnt:
  93  0008 0000          	ds.b	2
  94  000a               L73_s_ct:
  95  000a 000000000000  	ds.b	16
 374                     ; 28 PROCESS_THREAD(leds_process, ev, data)
 374                     ; 29 {
 375                     	switch	.text
 376  0009               L3_process_thread_leds_process:
 378  0009 89            	pushw	x
 379  000a 88            	push	a
 380       00000001      OFST:	set	1
 383                     ; 33     PROCESS_BEGIN();
 385  000b a601          	ld	a,#1
 386  000d 6b01          	ld	(OFST+0,sp),a
 391  000f fe            	ldw	x,(x)
 393                     ; 42         etimer_reset(&s_wait);
 394  0010 5d            	tnzw	x
 395  0011 2707          	jreq	L34
 396  0013 1d0026        	subw	x,#38
 397  0016 272a          	jreq	L54
 398  0018 2046          	jra	L532
 399  001a               L34:
 400                     ; 34     etimer_set(&s_wait, CLOCK_SECOND*3);
 403  001a ae0bb8        	ldw	x,#3000
 404  001d 89            	pushw	x
 405  001e ae0000        	ldw	x,#L53_s_wait
 406  0021 cd0000        	call	_etimer_set
 408  0024 85            	popw	x
 409                     ; 35     ctimer_set(&s_ct, CLOCK_SECOND*10, show, (void *)message);
 411  0025 ae0000        	ldw	x,#_message
 412  0028 89            	pushw	x
 413  0029 ae0000        	ldw	x,#_show
 414  002c 89            	pushw	x
 415  002d ae2710        	ldw	x,#10000
 416  0030 89            	pushw	x
 417  0031 ae000a        	ldw	x,#L73_s_ct
 418  0034 cd0000        	call	_ctimer_set
 420  0037 5b06          	addw	sp,#6
 421  0039               L342:
 422                     ; 38         PROCESS_WAIT_EVENT();
 424  0039 0f01          	clr	(OFST+0,sp)
 428  003b 1e02          	ldw	x,(OFST+1,sp)
 429  003d 90ae0026      	ldw	y,#38
 430  0041 ff            	ldw	(x),y
 431  0042               L54:
 435  0042 0d01          	tnz	(OFST+0,sp)
 436  0044 2604          	jrne	L742
 439  0046 a601          	ld	a,#1
 441  0048 201d          	jra	L01
 442  004a               L742:
 443                     ; 40         cnt++;
 446  004a ce0008        	ldw	x,L14_cnt
 447  004d 1c0001        	addw	x,#1
 448  0050 cf0008        	ldw	L14_cnt,x
 449                     ; 41         leds_toggle(LEDS_GREEN);
 451  0053 a601          	ld	a,#1
 452  0055 cd0000        	call	_leds_toggle
 454                     ; 42         etimer_reset(&s_wait);
 456  0058 ae0000        	ldw	x,#L53_s_wait
 457  005b cd0000        	call	_etimer_reset
 460  005e 20d9          	jra	L342
 461  0060               L532:
 462                     ; 44     PROCESS_END();
 467  0060 1e02          	ldw	x,(OFST+1,sp)
 468  0062 905f          	clrw	y
 469  0064 ff            	ldw	(x),y
 473  0065 a603          	ld	a,#3
 475  0067               L01:
 477  0067 5b03          	addw	sp,#3
 478  0069 81            	ret
 513                     	xdef	_show
 514                     	xdef	_message
 515                     	xdef	_leds_process
 516                     	xref	_printf
 517                     	xref	_leds_toggle
 518                     	xref	_ctimer_set
 519                     	xref	_etimer_reset
 520                     	xref	_etimer_set
 521                     	switch	.const
 522  0019               L33:
 523  0019 73686f772066  	dc.b	"show function is c"
 524  002b 616c6c656420  	dc.b	"alled %s",0
 525  0034               L5:
 526  0034 6c6564732d70  	dc.b	"leds-process",0
 546                     	end
