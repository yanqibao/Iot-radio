   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 85 arg_init(void)
  45                     ; 86 {
  47                     	switch	.text
  48  0000               _arg_init:
  52                     ; 87   bufs[0].used = 0;
  54  0000 725f0080      	clr	L3_bufs+128
  55                     ; 88 }
  58  0004 81            	ret
  92                     ; 103 char *
  92                     ; 104 arg_alloc(char size)
  92                     ; 105 {
  93                     	switch	.text
  94  0005               _arg_alloc:
  98                     ; 106   if(bufs[0].used == 0) {
 100  0005 725d0080      	tnz	L3_bufs+128
 101  0009 2608          	jrne	L73
 102                     ; 107     bufs[0].used = 1;
 104  000b 35010080      	mov	L3_bufs+128,#1
 105                     ; 108     return bufs[0].buf;
 107  000f ae0000        	ldw	x,#L3_bufs
 110  0012 81            	ret
 111  0013               L73:
 112                     ; 110   return 0;
 114  0013 5f            	clrw	x
 117  0014 81            	ret
 153                     ; 125 arg_free(char *arg)
 153                     ; 126 {
 154                     	switch	.text
 155  0015               _arg_free:
 159                     ; 127   if(arg == bufs[0].buf) {
 161  0015 a30000        	cpw	x,#L3_bufs
 162  0018 2604          	jrne	L75
 163                     ; 128     bufs[0].used = 0;
 165  001a 725f0080      	clr	L3_bufs+128
 166  001e               L75:
 167                     ; 130 }
 170  001e 81            	ret
 221                     	switch	.bss
 222  0000               L3_bufs:
 223  0000 000000000000  	ds.b	129
 224                     	xdef	_arg_free
 225                     	xdef	_arg_alloc
 226                     	xdef	_arg_init
 246                     	end
