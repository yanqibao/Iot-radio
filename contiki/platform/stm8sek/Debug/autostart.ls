   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 145                     ; 52 autostart_start(struct process * const processes[])
 145                     ; 53 {
 147                     	switch	.text
 148  0000               _autostart_start:
 150  0000 89            	pushw	x
 151  0001 89            	pushw	x
 152       00000002      OFST:	set	2
 155                     ; 56   for(i = 0; processes[i] != NULL; ++i) {
 157  0002 5f            	clrw	x
 158  0003 1f01          	ldw	(OFST-1,sp),x
 161  0005 2014          	jra	L77
 162  0007               L37:
 163                     ; 57     process_start(processes[i], NULL);
 165  0007 5f            	clrw	x
 166  0008 89            	pushw	x
 167  0009 1e03          	ldw	x,(OFST+1,sp)
 168  000b 58            	sllw	x
 169  000c 72fb05        	addw	x,(OFST+3,sp)
 170  000f fe            	ldw	x,(x)
 171  0010 cd0000        	call	_process_start
 173  0013 85            	popw	x
 174                     ; 56   for(i = 0; processes[i] != NULL; ++i) {
 177  0014 1e01          	ldw	x,(OFST-1,sp)
 178  0016 1c0001        	addw	x,#1
 179  0019 1f01          	ldw	(OFST-1,sp),x
 181  001b               L77:
 184  001b 1e01          	ldw	x,(OFST-1,sp)
 185  001d 58            	sllw	x
 186  001e 72fb03        	addw	x,(OFST+1,sp)
 187  0021 e601          	ld	a,(1,x)
 188  0023 fa            	or	a,(x)
 189  0024 26e1          	jrne	L37
 190                     ; 60 }
 193  0026 5b04          	addw	sp,#4
 194  0028 81            	ret
 240                     ; 63 autostart_exit(struct process * const processes[])
 240                     ; 64 {
 241                     	switch	.text
 242  0029               _autostart_exit:
 244  0029 89            	pushw	x
 245  002a 89            	pushw	x
 246       00000002      OFST:	set	2
 249                     ; 67   for(i = 0; processes[i] != NULL; ++i) {
 251  002b 5f            	clrw	x
 252  002c 1f01          	ldw	(OFST-1,sp),x
 255  002e 2011          	jra	L131
 256  0030               L521:
 257                     ; 68     process_exit(processes[i]);
 259  0030 1e01          	ldw	x,(OFST-1,sp)
 260  0032 58            	sllw	x
 261  0033 72fb03        	addw	x,(OFST+1,sp)
 262  0036 fe            	ldw	x,(x)
 263  0037 cd0000        	call	_process_exit
 265                     ; 67   for(i = 0; processes[i] != NULL; ++i) {
 268  003a 1e01          	ldw	x,(OFST-1,sp)
 269  003c 1c0001        	addw	x,#1
 270  003f 1f01          	ldw	(OFST-1,sp),x
 272  0041               L131:
 275  0041 1e01          	ldw	x,(OFST-1,sp)
 276  0043 58            	sllw	x
 277  0044 72fb03        	addw	x,(OFST+1,sp)
 278  0047 e601          	ld	a,(1,x)
 279  0049 fa            	or	a,(x)
 280  004a 26e4          	jrne	L521
 281                     ; 71 }
 284  004c 5b04          	addw	sp,#4
 285  004e 81            	ret
 298                     	xdef	_autostart_exit
 299                     	xdef	_autostart_start
 300                     	xref	_process_exit
 301                     	xref	_process_start
 320                     	end
