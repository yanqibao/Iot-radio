   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  62                     ; 40 show_leds(unsigned char new_leds)
  62                     ; 41 {
  64                     	switch	.text
  65  0000               L5_show_leds:
  67  0000 88            	push	a
  68  0001 88            	push	a
  69       00000001      OFST:	set	1
  72                     ; 43   changed = leds ^ new_leds;
  74  0002 c80000        	xor	a,L3_leds
  75  0005 6b01          	ld	(OFST+0,sp),a
  77                     ; 44   leds = new_leds;
  79  0007 7b02          	ld	a,(OFST+1,sp)
  80  0009 c70000        	ld	L3_leds,a
  81                     ; 46   if(changed & LEDS_GREEN) {
  83  000c 7b01          	ld	a,(OFST+0,sp)
  84  000e a501          	bcp	a,#1
  85  0010 2705          	jreq	L33
  86                     ; 48     if(leds & LEDS_GREEN) {
  88  0012 c60000        	ld	a,L3_leds
  89  0015 a501          	bcp	a,#1
  90  0017               L33:
  91                     ; 54   if(changed & LEDS_YELLOW) {
  93  0017 7b01          	ld	a,(OFST+0,sp)
  94  0019 a502          	bcp	a,#2
  95  001b 2705          	jreq	L15
  96                     ; 55     if(leds & LEDS_YELLOW) {
  98  001d c60000        	ld	a,L3_leds
  99  0020 a502          	bcp	a,#2
 100  0022               L15:
 101                     ; 61   if(changed & LEDS_RED) {
 103  0022 7b01          	ld	a,(OFST+0,sp)
 104  0024 a504          	bcp	a,#4
 105  0026 2705          	jreq	L76
 106                     ; 62     if(leds & LEDS_RED) {
 108  0028 c60000        	ld	a,L3_leds
 109  002b a504          	bcp	a,#4
 110  002d               L76:
 111                     ; 68   leds_arch_set(leds);
 113  002d c60000        	ld	a,L3_leds
 114  0030 cd0000        	call	_leds_arch_set
 116                     ; 69 }
 119  0033 85            	popw	x
 120  0034 81            	ret
 145                     ; 72 leds_init(void)
 145                     ; 73 {
 146                     	switch	.text
 147  0035               _leds_init:
 151                     ; 74   leds_arch_init();
 153  0035 cd0000        	call	_leds_arch_init
 155                     ; 75   leds = 0;
 157  0038 725f0000      	clr	L3_leds
 158                     ; 76 }
 161  003c 81            	ret
 196                     ; 79 leds_blink(void)
 196                     ; 80 {
 197                     	switch	.text
 198  003d               _leds_blink:
 200  003d 88            	push	a
 201       00000001      OFST:	set	1
 204                     ; 83   blink = ~leds;
 206  003e c60000        	ld	a,L3_leds
 207  0041 43            	cpl	a
 208  0042 6b01          	ld	(OFST+0,sp),a
 210                     ; 84   leds_toggle(blink);
 212  0044 7b01          	ld	a,(OFST+0,sp)
 213  0046 ad20          	call	_leds_toggle
 215                     ; 86   clock_delay(400);
 217  0048 ae0190        	ldw	x,#400
 218  004b cd0000        	call	_clock_delay
 220                     ; 88   leds_toggle(blink);
 222  004e 7b01          	ld	a,(OFST+0,sp)
 223  0050 ad16          	call	_leds_toggle
 225                     ; 89 }
 228  0052 84            	pop	a
 229  0053 81            	ret
 253                     ; 92 leds_get(void) {
 254                     	switch	.text
 255  0054               _leds_get:
 259                     ; 93   return leds_arch_get();
 261  0054 cd0000        	call	_leds_arch_get
 265  0057 81            	ret
 298                     ; 97 leds_set(unsigned char ledv)
 298                     ; 98 {
 299                     	switch	.text
 300  0058               _leds_set:
 304                     ; 99   show_leds(ledv);
 306  0058 ada6          	call	L5_show_leds
 308                     ; 100 }
 311  005a 81            	ret
 345                     ; 103 leds_on(unsigned char ledv)
 345                     ; 104 {
 346                     	switch	.text
 347  005b               _leds_on:
 351                     ; 105   show_leds(leds | ledv);
 353  005b ca0000        	or	a,L3_leds
 354  005e ada0          	call	L5_show_leds
 356                     ; 106 }
 359  0060 81            	ret
 393                     ; 109 leds_off(unsigned char ledv)
 393                     ; 110 {
 394                     	switch	.text
 395  0061               _leds_off:
 399                     ; 111   show_leds(leds & ~ledv);
 401  0061 43            	cpl	a
 402  0062 c40000        	and	a,L3_leds
 403  0065 ad99          	call	L5_show_leds
 405                     ; 112 }
 408  0067 81            	ret
 442                     ; 115 leds_toggle(unsigned char ledv)
 442                     ; 116 {
 443                     	switch	.text
 444  0068               _leds_toggle:
 448                     ; 117   show_leds(leds ^ ledv);
 450  0068 c80000        	xor	a,L3_leds
 451  006b ad93          	call	L5_show_leds
 453                     ; 118 }
 456  006d 81            	ret
 478                     	switch	.bss
 479  0000               L3_leds:
 480  0000 00            	ds.b	1
 481                     	xref	_clock_delay
 482                     	xref	_leds_arch_set
 483                     	xref	_leds_arch_get
 484                     	xref	_leds_arch_init
 485                     	xdef	_leds_toggle
 486                     	xdef	_leds_off
 487                     	xdef	_leds_on
 488                     	xdef	_leds_set
 489                     	xdef	_leds_get
 490                     	xdef	_leds_blink
 491                     	xdef	_leds_init
 511                     	end
