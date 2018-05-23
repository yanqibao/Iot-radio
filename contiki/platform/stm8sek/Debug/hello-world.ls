   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     	switch	.data
  17  0000               _hello_world_process:
  18  0000 0000          	dc.w	0
  19  0002 002d          	dc.w	L5
  21  0004 0000          	dc.w	L3_process_thread_hello_world_process
  22  0006 00000000      	ds.b	4
  23                     	switch	.bss
  24  0000               L7_s_wait:
  25  0000 000000000000  	ds.b	8
 238                     ; 11 PROCESS_THREAD(hello_world_process, ev, data)
 238                     ; 12 {
 240                     	switch	.text
 241  0000               L3_process_thread_hello_world_process:
 243  0000 89            	pushw	x
 244  0001 88            	push	a
 245       00000001      OFST:	set	1
 248                     ; 14     PROCESS_BEGIN();
 250  0002 a601          	ld	a,#1
 251  0004 6b01          	ld	(OFST+0,sp),a
 256  0006 fe            	ldw	x,(x)
 258                     ; 20         etimer_reset(&s_wait);
 259  0007 5d            	tnzw	x
 260  0008 2707          	jreq	L11
 261  000a 1d0012        	subw	x,#18
 262  000d 2716          	jreq	L31
 263  000f 2042          	jra	L151
 264  0011               L11:
 265                     ; 15     etimer_set(&s_wait, CLOCK_SECOND*60);
 268  0011 aeea60        	ldw	x,#60000
 269  0014 89            	pushw	x
 270  0015 ae0000        	ldw	x,#L7_s_wait
 271  0018 cd0000        	call	_etimer_set
 273  001b 85            	popw	x
 274  001c               L751:
 275                     ; 18         PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&s_wait));
 277  001c 0f01          	clr	(OFST+0,sp)
 281  001e 1e02          	ldw	x,(OFST+1,sp)
 282  0020 90ae0012      	ldw	y,#18
 283  0024 ff            	ldw	(x),y
 284  0025               L31:
 288  0025 0d01          	tnz	(OFST+0,sp)
 289  0027 270b          	jreq	L561
 291  0029 ae0000        	ldw	x,#L7_s_wait
 292  002c cd0000        	call	_etimer_expired
 294  002f a30000        	cpw	x,#0
 295  0032 2604          	jrne	L361
 296  0034               L561:
 299  0034 a601          	ld	a,#1
 301  0036 2022          	jra	L6
 302  0038               L361:
 303                     ; 19         printf("Hello, world, the ev is: %d, the sec is %d\r\n", (int)ev, (int)clock_seconds());
 305  0038 cd0000        	call	_clock_seconds
 307  003b be02          	ldw	x,c_lreg+2
 308  003d 89            	pushw	x
 309  003e 7b08          	ld	a,(OFST+7,sp)
 310  0040 5f            	clrw	x
 311  0041 97            	ld	xl,a
 312  0042 89            	pushw	x
 313  0043 ae0000        	ldw	x,#L761
 314  0046 cd0000        	call	_printf
 316  0049 5b04          	addw	sp,#4
 317                     ; 20         etimer_reset(&s_wait);
 319  004b ae0000        	ldw	x,#L7_s_wait
 320  004e cd0000        	call	_etimer_reset
 323  0051 20c9          	jra	L751
 324  0053               L151:
 325                     ; 22     PROCESS_END();
 330  0053 1e02          	ldw	x,(OFST+1,sp)
 331  0055 905f          	clrw	y
 332  0057 ff            	ldw	(x),y
 336  0058 a603          	ld	a,#3
 338  005a               L6:
 340  005a 5b03          	addw	sp,#3
 341  005c 81            	ret
 367                     	xdef	_hello_world_process
 368                     	xref	_printf
 369                     	xref	_etimer_expired
 370                     	xref	_etimer_reset
 371                     	xref	_etimer_set
 372                     	xref	_clock_seconds
 373                     .const:	section	.text
 374  0000               L761:
 375  0000 48656c6c6f2c  	dc.b	"Hello, world, the "
 376  0012 65762069733a  	dc.b	"ev is: %d, the sec"
 377  0024 206973202564  	dc.b	" is %d",13
 378  002b 0a00          	dc.b	10,0
 379  002d               L5:
 380  002d 48656c6c6f20  	dc.b	"Hello world proces"
 381  003f 7300          	dc.b	"s",0
 382                     	xref.b	c_lreg
 402                     	end
