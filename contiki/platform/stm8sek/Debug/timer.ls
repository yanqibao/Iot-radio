   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  87                     ; 64 timer_set(struct timer *t, clock_time_t interval)
  87                     ; 65 {
  89                     	switch	.text
  90  0000               _timer_set:
  92  0000 89            	pushw	x
  93       00000000      OFST:	set	0
  96                     ; 66   t->interval = interval;
  98  0001 1605          	ldw	y,(OFST+5,sp)
  99  0003 ef02          	ldw	(2,x),y
 100                     ; 67   t->start = clock_time();
 102  0005 cd0000        	call	_clock_time
 104  0008 1601          	ldw	y,(OFST+1,sp)
 105  000a 90ff          	ldw	(y),x
 106                     ; 68 }
 109  000c 85            	popw	x
 110  000d 81            	ret
 147                     ; 85 timer_reset(struct timer *t)
 147                     ; 86 {
 148                     	switch	.text
 149  000e               _timer_reset:
 153                     ; 87   t->start += t->interval;
 155  000e e601          	ld	a,(1,x)
 156  0010 eb03          	add	a,(3,x)
 157  0012 e701          	ld	(1,x),a
 158  0014 f6            	ld	a,(x)
 159  0015 e902          	adc	a,(2,x)
 160  0017 f7            	ld	(x),a
 161                     ; 88 }
 164  0018 81            	ret
 202                     ; 105 timer_restart(struct timer *t)
 202                     ; 106 {
 203                     	switch	.text
 204  0019               _timer_restart:
 206  0019 89            	pushw	x
 207       00000000      OFST:	set	0
 210                     ; 107   t->start = clock_time();
 212  001a cd0000        	call	_clock_time
 214  001d 1601          	ldw	y,(OFST+1,sp)
 215  001f 90ff          	ldw	(y),x
 216                     ; 108 }
 219  0021 85            	popw	x
 220  0022 81            	ret
 265                     ; 122 timer_expired(struct timer *t)
 265                     ; 123 {
 266                     	switch	.text
 267  0023               _timer_expired:
 269  0023 89            	pushw	x
 270  0024 89            	pushw	x
 271       00000002      OFST:	set	2
 274                     ; 126   clock_time_t diff = (clock_time() - t->start) + 1;
 276  0025 cd0000        	call	_clock_time
 278  0028 1603          	ldw	y,(OFST+1,sp)
 279  002a 01            	rrwa	x,a
 280  002b 90e001        	sub	a,(1,y)
 281  002e 01            	rrwa	x,a
 282  002f 90f2          	sbc	a,(y)
 283  0031 01            	rrwa	x,a
 284  0032 5c            	incw	x
 285  0033 1f01          	ldw	(OFST-1,sp),x
 287                     ; 127   return t->interval < diff;
 289  0035 1e03          	ldw	x,(OFST+1,sp)
 290  0037 9093          	ldw	y,x
 291  0039 51            	exgw	x,y
 292  003a ee02          	ldw	x,(2,x)
 293  003c 1301          	cpw	x,(OFST-1,sp)
 294  003e 51            	exgw	x,y
 295  003f 2405          	jruge	L41
 296  0041 ae0001        	ldw	x,#1
 297  0044 2001          	jra	L61
 298  0046               L41:
 299  0046 5f            	clrw	x
 300  0047               L61:
 303  0047 5b04          	addw	sp,#4
 304  0049 81            	ret
 342                     ; 142 timer_remaining(struct timer *t)
 342                     ; 143 {
 343                     	switch	.text
 344  004a               _timer_remaining:
 346  004a 89            	pushw	x
 347  004b 89            	pushw	x
 348       00000002      OFST:	set	2
 351                     ; 144   return t->start + t->interval - clock_time();
 353  004c cd0000        	call	_clock_time
 355  004f 1f01          	ldw	(OFST-1,sp),x
 357  0051 1e03          	ldw	x,(OFST+1,sp)
 358  0053 ee02          	ldw	x,(2,x)
 359  0055 1603          	ldw	y,(OFST+1,sp)
 360  0057 01            	rrwa	x,a
 361  0058 90eb01        	add	a,(1,y)
 362  005b 01            	rrwa	x,a
 363  005c 90f9          	adc	a,(y)
 364  005e 01            	rrwa	x,a
 365  005f 72f001        	subw	x,(OFST-1,sp)
 368  0062 5b04          	addw	sp,#4
 369  0064 81            	ret
 382                     	xdef	_timer_remaining
 383                     	xdef	_timer_expired
 384                     	xdef	_timer_restart
 385                     	xdef	_timer_reset
 386                     	xdef	_timer_set
 387                     	xref	_clock_time
 406                     	end
