   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  58                     ; 40 procinit_init(void)
  58                     ; 41 {
  60                     	switch	.text
  61  0000               _procinit_init:
  63  0000 89            	pushw	x
  64       00000002      OFST:	set	2
  67                     ; 44   for(i = 0; procinit[i] != NULL; ++i) {
  69  0001 5f            	clrw	x
  70  0002 1f01          	ldw	(OFST-1,sp),x
  72  0004 2012          	jra	L33
  73  0006               L72:
  74                     ; 45     process_start((struct process *)procinit[i], NULL);
  76  0006 5f            	clrw	x
  77  0007 89            	pushw	x
  78  0008 1e03          	ldw	x,(OFST+1,sp)
  79  000a 58            	sllw	x
  80  000b ee00          	ldw	x,(_procinit,x)
  81  000d cd0000        	call	_process_start
  83  0010 85            	popw	x
  84                     ; 44   for(i = 0; procinit[i] != NULL; ++i) {
  86  0011 1e01          	ldw	x,(OFST-1,sp)
  87  0013 1c0001        	addw	x,#1
  88  0016 1f01          	ldw	(OFST-1,sp),x
  89  0018               L33:
  92  0018 1e01          	ldw	x,(OFST-1,sp)
  93  001a 58            	sllw	x
  94  001b e601          	ld	a,(_procinit+1,x)
  95  001d ea00          	or	a,(_procinit,x)
  96  001f 26e5          	jrne	L72
  97                     ; 47 }
 100  0021 85            	popw	x
 101  0022 81            	ret
 114                     	xref.b	_procinit
 115                     	xdef	_procinit_init
 116                     	xref	_process_start
 135                     	end
