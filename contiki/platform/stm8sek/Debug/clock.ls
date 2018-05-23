   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  50                     ; 16 void clock_init(void)
  50                     ; 17 {
  52                     	switch	.text
  53  0000               _clock_init:
  57                     ; 18     TIM4_DeInit();
  59  0000 cd0000        	call	_TIM4_DeInit
  61                     ; 20     TIM4_TimeBaseInit(TIM4_PRESCALER_128, RELOAD);
  63  0003 ae07bb        	ldw	x,#1979
  64  0006 cd0000        	call	_TIM4_TimeBaseInit
  66                     ; 22     TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  68  0009 a601          	ld	a,#1
  69  000b cd0000        	call	_TIM4_ClearFlag
  71                     ; 24     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  73  000e ae0101        	ldw	x,#257
  74  0011 cd0000        	call	_TIM4_ITConfig
  76                     ; 26     TIM4_Cmd(ENABLE);
  78  0014 a601          	ld	a,#1
  79  0016 cd0000        	call	_TIM4_Cmd
  81                     ; 28     s_clock = 0;
  83  0019 5f            	clrw	x
  84  001a cf0006        	ldw	L3_s_clock,x
  85                     ; 29 }
  88  001d 81            	ret
 121                     ; 34 CCIF clock_time_t clock_time(void)
 121                     ; 35 {
 122                     	switch	.text
 123  001e               _clock_time:
 125  001e 89            	pushw	x
 126       00000002      OFST:	set	2
 129  001f               L14:
 130                     ; 39         clock = s_clock;
 132  001f ce0006        	ldw	x,L3_s_clock
 133  0022 1f01          	ldw	(OFST-1,sp),x
 135                     ; 41     while (clock!=s_clock);
 137  0024 1e01          	ldw	x,(OFST-1,sp)
 138  0026 c30006        	cpw	x,L3_s_clock
 139  0029 26f4          	jrne	L14
 140                     ; 43     return (clock);
 142  002b 1e01          	ldw	x,(OFST-1,sp)
 145  002d 5b02          	addw	sp,#2
 146  002f 81            	ret
 179                     ; 49 CCIF unsigned long clock_seconds(void)
 179                     ; 50 {
 180                     	switch	.text
 181  0030               _clock_seconds:
 183  0030 5204          	subw	sp,#4
 184       00000004      OFST:	set	4
 187  0032               L36:
 188                     ; 54         s = s_sec;
 190  0032 ce0004        	ldw	x,L5_s_sec+2
 191  0035 1f03          	ldw	(OFST-1,sp),x
 192  0037 ce0002        	ldw	x,L5_s_sec
 193  003a 1f01          	ldw	(OFST-3,sp),x
 195                     ; 56     while (s!=s_sec);
 197  003c 96            	ldw	x,sp
 198  003d 1c0001        	addw	x,#OFST-3
 199  0040 cd0000        	call	c_ltor
 201  0043 ae0002        	ldw	x,#L5_s_sec
 202  0046 cd0000        	call	c_lcmp
 204  0049 26e7          	jrne	L36
 205                     ; 58     return (s);
 207  004b 96            	ldw	x,sp
 208  004c 1c0001        	addw	x,#OFST-3
 209  004f cd0000        	call	c_ltor
 213  0052 5b04          	addw	sp,#4
 214  0054 81            	ret
 247                     ; 66 void clock_set_seconds(unsigned long sec)
 247                     ; 67 {
 248                     	switch	.text
 249  0055               _clock_set_seconds:
 251       00000000      OFST:	set	0
 254  0055               L501:
 255                     ; 70         s_sec = sec;
 257  0055 1e05          	ldw	x,(OFST+5,sp)
 258  0057 cf0004        	ldw	L5_s_sec+2,x
 259  005a 1e03          	ldw	x,(OFST+3,sp)
 260  005c cf0002        	ldw	L5_s_sec,x
 261                     ; 72     while (sec!=s_sec);
 263  005f 96            	ldw	x,sp
 264  0060 1c0003        	addw	x,#OFST+3
 265  0063 cd0000        	call	c_ltor
 267  0066 ae0002        	ldw	x,#L5_s_sec
 268  0069 cd0000        	call	c_lcmp
 270  006c 26e7          	jrne	L501
 271                     ; 73 }
 274  006e 81            	ret
 314                     ; 75 void clock_wait(clock_time_t t)
 314                     ; 76 {
 315                     	switch	.text
 316  006f               _clock_wait:
 318  006f 89            	pushw	x
 319  0070 5204          	subw	sp,#4
 320       00000004      OFST:	set	4
 323                     ; 77     clock_time_t stop = clock_time()+t;
 325  0072 adaa          	call	_clock_time
 327  0074 72fb05        	addw	x,(OFST+1,sp)
 328  0077 1f03          	ldw	(OFST-1,sp),x
 331  0079               L531:
 332                     ; 78     while (stop-clock_time());
 334  0079 ada3          	call	_clock_time
 336  007b 1f01          	ldw	(OFST-3,sp),x
 338  007d 1e03          	ldw	x,(OFST-1,sp)
 339  007f 72f001        	subw	x,(OFST-3,sp)
 340  0082 26f5          	jrne	L531
 341                     ; 79 }
 344  0084 5b06          	addw	sp,#6
 345  0086 81            	ret
 378                     ; 81 void clock_delay_usec(uint16_t dt)
 378                     ; 82 {
 379                     	switch	.text
 380  0087               _clock_delay_usec:
 384                     ; 83     clock_wait(dt);
 386  0087 ade6          	call	_clock_wait
 388                     ; 84 }
 391  0089 81            	ret
 424                     ; 87 void clock_delay(unsigned int delay)
 424                     ; 88 {
 425                     	switch	.text
 426  008a               _clock_delay:
 430                     ; 89     clock_wait(delay);
 432  008a ade3          	call	_clock_wait
 434                     ; 90 }
 437  008c 81            	ret
 440                     	switch	.bss
 441  0000               L171_reg:
 442  0000 0000          	ds.b	2
 476                     .const:	section	.text
 477  0000               L42:
 478  0000 000003ea      	dc.l	1002
 479                     ; 96 @interrupt void tim4_isr(void)
 479                     ; 97 {
 480                     	switch	.text
 481  008d               _tim4_isr:
 483  008d 8a            	push	cc
 484  008e 84            	pop	a
 485  008f a4bf          	and	a,#191
 486  0091 88            	push	a
 487  0092 86            	pop	cc
 488  0093 3b0002        	push	c_x+2
 489  0096 be00          	ldw	x,c_x
 490  0098 89            	pushw	x
 491  0099 3b0002        	push	c_y+2
 492  009c be00          	ldw	x,c_y
 493  009e 89            	pushw	x
 494  009f be02          	ldw	x,c_lreg+2
 495  00a1 89            	pushw	x
 496  00a2 be00          	ldw	x,c_lreg
 497  00a4 89            	pushw	x
 500                     ; 99     s_clock++;
 502  00a5 ce0006        	ldw	x,L3_s_clock
 503  00a8 1c0001        	addw	x,#1
 504  00ab cf0006        	ldw	L3_s_clock,x
 505                     ; 100     reg++;
 507  00ae ce0000        	ldw	x,L171_reg
 508  00b1 1c0001        	addw	x,#1
 509  00b4 cf0000        	ldw	L171_reg,x
 510                     ; 101     if (reg>=1002ul)
 512  00b7 ce0000        	ldw	x,L171_reg
 513  00ba cd0000        	call	c_uitolx
 515  00bd ae0000        	ldw	x,#L42
 516  00c0 cd0000        	call	c_lcmp
 518  00c3 250c          	jrult	L702
 519                     ; 103         reg = 0;
 521  00c5 5f            	clrw	x
 522  00c6 cf0000        	ldw	L171_reg,x
 523                     ; 104         s_sec++;
 525  00c9 ae0002        	ldw	x,#L5_s_sec
 526  00cc a601          	ld	a,#1
 527  00ce cd0000        	call	c_lgadc
 529  00d1               L702:
 530                     ; 106     etimer_request_poll();
 532  00d1 cd0000        	call	_etimer_request_poll
 534                     ; 108     TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 536  00d4 a601          	ld	a,#1
 537  00d6 cd0000        	call	_TIM4_ClearITPendingBit
 539                     ; 109 }
 542  00d9 85            	popw	x
 543  00da bf00          	ldw	c_lreg,x
 544  00dc 85            	popw	x
 545  00dd bf02          	ldw	c_lreg+2,x
 546  00df 85            	popw	x
 547  00e0 bf00          	ldw	c_y,x
 548  00e2 320002        	pop	c_y+2
 549  00e5 85            	popw	x
 550  00e6 bf00          	ldw	c_x,x
 551  00e8 320002        	pop	c_x+2
 552  00eb 80            	iret
 585                     	xdef	_tim4_isr
 586                     	switch	.bss
 587  0002               L5_s_sec:
 588  0002 00000000      	ds.b	4
 589  0006               L3_s_clock:
 590  0006 0000          	ds.b	2
 591                     	xref	_etimer_request_poll
 592                     	xdef	_clock_delay
 593                     	xdef	_clock_delay_usec
 594                     	xdef	_clock_wait
 595                     	xdef	_clock_set_seconds
 596                     	xdef	_clock_seconds
 597                     	xdef	_clock_time
 598                     	xdef	_clock_init
 599                     	xref	_TIM4_ClearITPendingBit
 600                     	xref	_TIM4_ClearFlag
 601                     	xref	_TIM4_ITConfig
 602                     	xref	_TIM4_Cmd
 603                     	xref	_TIM4_TimeBaseInit
 604                     	xref	_TIM4_DeInit
 605                     	xref.b	c_lreg
 606                     	xref.b	c_x
 607                     	xref.b	c_y
 627                     	xref	c_lgadc
 628                     	xref	c_uitolx
 629                     	xref	c_lcmp
 630                     	xref	c_ltor
 631                     	end
