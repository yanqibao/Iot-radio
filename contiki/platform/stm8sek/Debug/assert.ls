   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  64                     ; 35 _xassert(const char *file, int lineno)
  64                     ; 36 {
  66                     	switch	.text
  67  0000               __xassert:
  69  0000 89            	pushw	x
  70       00000000      OFST:	set	0
  73                     ; 37   printf("Assertion failed: file %s, line %d.\n", file, lineno);
  75  0001 1e05          	ldw	x,(OFST+5,sp)
  76  0003 89            	pushw	x
  77  0004 1e03          	ldw	x,(OFST+3,sp)
  78  0006 89            	pushw	x
  79  0007 ae0000        	ldw	x,#L13
  80  000a cd0000        	call	_printf
  82  000d 5b04          	addw	sp,#4
  83                     ; 42 }
  86  000f 85            	popw	x
  87  0010 81            	ret
 130                     ; 44 void assert_failed(uint8_t* file, uint32_t line)
 130                     ; 45 {
 131                     	switch	.text
 132  0011               _assert_failed:
 134  0011 89            	pushw	x
 135       00000000      OFST:	set	0
 138                     ; 46     printf("Assertion failed: file %s, line %d.\n", file, line);
 140  0012 1e07          	ldw	x,(OFST+7,sp)
 141  0014 89            	pushw	x
 142  0015 1e07          	ldw	x,(OFST+7,sp)
 143  0017 89            	pushw	x
 144  0018 1e05          	ldw	x,(OFST+5,sp)
 145  001a 89            	pushw	x
 146  001b ae0000        	ldw	x,#L13
 147  001e cd0000        	call	_printf
 149  0021 5b06          	addw	sp,#6
 150                     ; 47 }
 153  0023 85            	popw	x
 154  0024 81            	ret
 167                     	xdef	__xassert
 168                     	xdef	_assert_failed
 169                     	xref	_printf
 170                     .const:	section	.text
 171  0000               L13:
 172  0000 417373657274  	dc.b	"Assertion failed: "
 173  0012 66696c652025  	dc.b	"file %s, line %d.",10,0
 193                     	end
