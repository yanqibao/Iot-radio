   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  87                     ; 67 stimer_set(struct stimer *t, unsigned long interval)
  87                     ; 68 {
  89                     	switch	.text
  90  0000               _stimer_set:
  92  0000 89            	pushw	x
  93       00000000      OFST:	set	0
  96                     ; 69   t->interval = interval;
  98  0001 7b08          	ld	a,(OFST+8,sp)
  99  0003 e707          	ld	(7,x),a
 100  0005 7b07          	ld	a,(OFST+7,sp)
 101  0007 e706          	ld	(6,x),a
 102  0009 7b06          	ld	a,(OFST+6,sp)
 103  000b e705          	ld	(5,x),a
 104  000d 7b05          	ld	a,(OFST+5,sp)
 105  000f e704          	ld	(4,x),a
 106                     ; 70   t->start = clock_seconds();
 108  0011 cd0000        	call	_clock_seconds
 110  0014 1e01          	ldw	x,(OFST+1,sp)
 111  0016 cd0000        	call	c_rtol
 113                     ; 71 }
 116  0019 85            	popw	x
 117  001a 81            	ret
 154                     ; 87 stimer_reset(struct stimer *t)
 154                     ; 88 {
 155                     	switch	.text
 156  001b               _stimer_reset:
 160                     ; 89   t->start += t->interval;
 162  001b 9093          	ldw	y,x
 163  001d 90e607        	ld	a,(7,y)
 164  0020 b703          	ld	c_lreg+3,a
 165  0022 90e606        	ld	a,(6,y)
 166  0025 b702          	ld	c_lreg+2,a
 167  0027 90e605        	ld	a,(5,y)
 168  002a b701          	ld	c_lreg+1,a
 169  002c 90e604        	ld	a,(4,y)
 170  002f b700          	ld	c_lreg,a
 171  0031 cd0000        	call	c_lgadd
 173                     ; 90 }
 176  0034 81            	ret
 214                     ; 107 stimer_restart(struct stimer *t)
 214                     ; 108 {
 215                     	switch	.text
 216  0035               _stimer_restart:
 218  0035 89            	pushw	x
 219       00000000      OFST:	set	0
 222                     ; 109   t->start = clock_seconds();
 224  0036 cd0000        	call	_clock_seconds
 226  0039 1e01          	ldw	x,(OFST+1,sp)
 227  003b cd0000        	call	c_rtol
 229                     ; 110 }
 232  003e 85            	popw	x
 233  003f 81            	ret
 271                     .const:	section	.text
 272  0000               L61:
 273  0000 7fffffff      	dc.l	2147483647
 274                     ; 124 stimer_expired(struct stimer *t)
 274                     ; 125 {
 275                     	switch	.text
 276  0040               _stimer_expired:
 278  0040 89            	pushw	x
 279  0041 5204          	subw	sp,#4
 280       00000004      OFST:	set	4
 283                     ; 126   return SCLOCK_GEQ(clock_seconds(), t->start + t->interval);
 285  0043 1c0004        	addw	x,#4
 286  0046 cd0000        	call	c_ltor
 288  0049 1e05          	ldw	x,(OFST+1,sp)
 289  004b cd0000        	call	c_ladd
 291  004e 96            	ldw	x,sp
 292  004f 1c0001        	addw	x,#OFST-3
 293  0052 cd0000        	call	c_rtol
 296  0055 cd0000        	call	_clock_seconds
 298  0058 96            	ldw	x,sp
 299  0059 1c0001        	addw	x,#OFST-3
 300  005c cd0000        	call	c_lsub
 302  005f ae0000        	ldw	x,#L61
 303  0062 cd0000        	call	c_lcmp
 305  0065 2405          	jruge	L41
 306  0067 ae0001        	ldw	x,#1
 307  006a 2001          	jra	L02
 308  006c               L41:
 309  006c 5f            	clrw	x
 310  006d               L02:
 313  006d 5b06          	addw	sp,#6
 314  006f 81            	ret
 352                     ; 140 stimer_remaining(struct stimer *t)
 352                     ; 141 {
 353                     	switch	.text
 354  0070               _stimer_remaining:
 356  0070 89            	pushw	x
 357  0071 5204          	subw	sp,#4
 358       00000004      OFST:	set	4
 361                     ; 142   return t->start + t->interval - clock_seconds();
 363  0073 cd0000        	call	_clock_seconds
 365  0076 96            	ldw	x,sp
 366  0077 1c0001        	addw	x,#OFST-3
 367  007a cd0000        	call	c_rtol
 370  007d 1e05          	ldw	x,(OFST+1,sp)
 371  007f 1c0004        	addw	x,#4
 372  0082 cd0000        	call	c_ltor
 374  0085 1e05          	ldw	x,(OFST+1,sp)
 375  0087 cd0000        	call	c_ladd
 377  008a 96            	ldw	x,sp
 378  008b 1c0001        	addw	x,#OFST-3
 379  008e cd0000        	call	c_lsub
 383  0091 5b06          	addw	sp,#6
 384  0093 81            	ret
 422                     ; 156 stimer_elapsed(struct stimer *t)
 422                     ; 157 {
 423                     	switch	.text
 424  0094               _stimer_elapsed:
 426  0094 89            	pushw	x
 427       00000000      OFST:	set	0
 430                     ; 158   return clock_seconds() - t->start;
 432  0095 cd0000        	call	_clock_seconds
 434  0098 1e01          	ldw	x,(OFST+1,sp)
 435  009a cd0000        	call	c_lsub
 439  009d 5b02          	addw	sp,#2
 440  009f 81            	ret
 453                     	xdef	_stimer_elapsed
 454                     	xdef	_stimer_remaining
 455                     	xdef	_stimer_expired
 456                     	xdef	_stimer_restart
 457                     	xdef	_stimer_reset
 458                     	xdef	_stimer_set
 459                     	xref	_clock_seconds
 460                     	xref.b	c_lreg
 479                     	xref	c_lcmp
 480                     	xref	c_lsub
 481                     	xref	c_ladd
 482                     	xref	c_ltor
 483                     	xref	c_lgadd
 484                     	xref	c_rtol
 485                     	end
