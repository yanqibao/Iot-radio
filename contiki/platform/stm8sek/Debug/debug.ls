   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  57                     ; 23 static void print_s(char  *s)
  57                     ; 24 {
  59                     	switch	.text
  60  0000               L3_print_s:
  62  0000 89            	pushw	x
  63       00000000      OFST:	set	0
  66  0001 200d          	jra	L33
  67  0003               L13:
  68                     ; 27         putchar(*s);
  70  0003 1e01          	ldw	x,(OFST+1,sp)
  71  0005 f6            	ld	a,(x)
  72  0006 cd0000        	call	_putchar
  74                     ; 28         s++;
  76  0009 1e01          	ldw	x,(OFST+1,sp)
  77  000b 1c0001        	addw	x,#1
  78  000e 1f01          	ldw	(OFST+1,sp),x
  79  0010               L33:
  80                     ; 25     while (*s != '\0')
  82  0010 1e01          	ldw	x,(OFST+1,sp)
  83  0012 7d            	tnz	(x)
  84  0013 26ee          	jrne	L13
  85                     ; 30 }
  88  0015 85            	popw	x
  89  0016 81            	ret
 146                     ; 35 static void print_dec(unsigned short num)
 146                     ; 36 {
 147                     	switch	.text
 148  0017               L73_print_dec:
 150  0017 89            	pushw	x
 151  0018 5208          	subw	sp,#8
 152       00000008      OFST:	set	8
 155                     ; 40     if (num==0)
 157  001a a30000        	cpw	x,#0
 158  001d 2605          	jrne	L56
 159                     ; 42         putchar('0');
 161  001f a630          	ld	a,#48
 162  0021 cd0000        	call	_putchar
 164  0024               L56:
 165                     ; 44     for (i=0; i<5; i++)
 167  0024 0f08          	clr	(OFST+0,sp)
 169  0026               L76:
 170                     ; 46         buff[4-i] = num%10;
 172  0026 96            	ldw	x,sp
 173  0027 1c0003        	addw	x,#OFST-5
 174  002a 1f01          	ldw	(OFST-7,sp),x
 176  002c a600          	ld	a,#0
 177  002e 97            	ld	xl,a
 178  002f a604          	ld	a,#4
 179  0031 1008          	sub	a,(OFST+0,sp)
 180  0033 2401          	jrnc	L01
 181  0035 5a            	decw	x
 182  0036               L01:
 183  0036 02            	rlwa	x,a
 184  0037 72fb01        	addw	x,(OFST-7,sp)
 185  003a 1609          	ldw	y,(OFST+1,sp)
 186  003c a60a          	ld	a,#10
 187  003e 9062          	div	y,a
 188  0040 905f          	clrw	y
 189  0042 9097          	ld	yl,a
 190  0044 9001          	rrwa	y,a
 191  0046 f7            	ld	(x),a
 192  0047 9002          	rlwa	y,a
 193                     ; 47         num = num/10;
 195  0049 1e09          	ldw	x,(OFST+1,sp)
 196  004b a60a          	ld	a,#10
 197  004d 62            	div	x,a
 198  004e 1f09          	ldw	(OFST+1,sp),x
 199                     ; 44     for (i=0; i<5; i++)
 201  0050 0c08          	inc	(OFST+0,sp)
 205  0052 7b08          	ld	a,(OFST+0,sp)
 206  0054 a105          	cp	a,#5
 207  0056 25ce          	jrult	L76
 208                     ; 49     for (i=0; i<5; i++)
 210  0058 0f08          	clr	(OFST+0,sp)
 212  005a               L57:
 213                     ; 51         if (buff[i] != 0)
 215  005a 96            	ldw	x,sp
 216  005b 1c0003        	addw	x,#OFST-5
 217  005e 9f            	ld	a,xl
 218  005f 5e            	swapw	x
 219  0060 1b08          	add	a,(OFST+0,sp)
 220  0062 2401          	jrnc	L21
 221  0064 5c            	incw	x
 222  0065               L21:
 223  0065 02            	rlwa	x,a
 224  0066 7d            	tnz	(x)
 225  0067 2608          	jrne	L101
 226                     ; 53             break;
 228                     ; 49     for (i=0; i<5; i++)
 230  0069 0c08          	inc	(OFST+0,sp)
 234  006b 7b08          	ld	a,(OFST+0,sp)
 235  006d a105          	cp	a,#5
 236  006f 25e9          	jrult	L57
 237  0071               L101:
 238                     ; 56     for (j=i; j<5; j++)
 240  0071 7b08          	ld	a,(OFST+0,sp)
 241  0073 6b08          	ld	(OFST+0,sp),a
 244  0075 2014          	jra	L111
 245  0077               L501:
 246                     ; 58         putchar('0'+buff[j]);
 248  0077 96            	ldw	x,sp
 249  0078 1c0003        	addw	x,#OFST-5
 250  007b 9f            	ld	a,xl
 251  007c 5e            	swapw	x
 252  007d 1b08          	add	a,(OFST+0,sp)
 253  007f 2401          	jrnc	L41
 254  0081 5c            	incw	x
 255  0082               L41:
 256  0082 02            	rlwa	x,a
 257  0083 f6            	ld	a,(x)
 258  0084 ab30          	add	a,#48
 259  0086 cd0000        	call	_putchar
 261                     ; 56     for (j=i; j<5; j++)
 263  0089 0c08          	inc	(OFST+0,sp)
 265  008b               L111:
 268  008b 7b08          	ld	a,(OFST+0,sp)
 269  008d a105          	cp	a,#5
 270  008f 25e6          	jrult	L501
 271                     ; 60 }
 274  0091 5b0a          	addw	sp,#10
 275  0093 81            	ret
 308                     ; 66 static void print_hex(uint8_t num)
 308                     ; 67 {
 309                     	switch	.text
 310  0094               L511_print_hex:
 312  0094 88            	push	a
 313       00000000      OFST:	set	0
 316                     ; 68     putchar('0');
 318  0095 a630          	ld	a,#48
 319  0097 cd0000        	call	_putchar
 321                     ; 69     putchar('x');
 323  009a a678          	ld	a,#120
 324  009c cd0000        	call	_putchar
 326                     ; 70     putchar(CHAR2HEX(num>>4));
 328  009f 9c            	rvf
 329  00a0 7b01          	ld	a,(OFST+1,sp)
 330  00a2 4e            	swap	a
 331  00a3 a40f          	and	a,#15
 332  00a5 5f            	clrw	x
 333  00a6 97            	ld	xl,a
 334  00a7 a3000a        	cpw	x,#10
 335  00aa 2f09          	jrslt	L02
 336  00ac 7b01          	ld	a,(OFST+1,sp)
 337  00ae 4e            	swap	a
 338  00af a40f          	and	a,#15
 339  00b1 ab57          	add	a,#87
 340  00b3 2007          	jra	L22
 341  00b5               L02:
 342  00b5 7b01          	ld	a,(OFST+1,sp)
 343  00b7 4e            	swap	a
 344  00b8 a40f          	and	a,#15
 345  00ba ab30          	add	a,#48
 346  00bc               L22:
 347  00bc cd0000        	call	_putchar
 349                     ; 71     putchar(CHAR2HEX(num&0x0f));
 351  00bf 7b01          	ld	a,(OFST+1,sp)
 352  00c1 a40f          	and	a,#15
 353  00c3 a10a          	cp	a,#10
 354  00c5 2508          	jrult	L42
 355  00c7 7b01          	ld	a,(OFST+1,sp)
 356  00c9 a40f          	and	a,#15
 357  00cb ab57          	add	a,#87
 358  00cd 2006          	jra	L62
 359  00cf               L42:
 360  00cf 7b01          	ld	a,(OFST+1,sp)
 361  00d1 a40f          	and	a,#15
 362  00d3 ab30          	add	a,#48
 363  00d5               L62:
 364  00d5 cd0000        	call	_putchar
 366                     ; 72 }
 369  00d8 84            	pop	a
 370  00d9 81            	ret
 419                     ; 78 void print(char *s, ...)
 419                     ; 79 {
 420                     	switch	.text
 421  00da               _print:
 423  00da 89            	pushw	x
 424  00db 89            	pushw	x
 425       00000002      OFST:	set	2
 428                     ; 81     va_start(var_arg, s);
 430  00dc 96            	ldw	x,sp
 431  00dd 1c0007        	addw	x,#OFST+5
 432  00e0 1f01          	ldw	(OFST-1,sp),x
 435  00e2 206a          	jra	L171
 436  00e4               L761:
 437                     ; 84         if (*s != '%')
 439  00e4 1e03          	ldw	x,(OFST+1,sp)
 440  00e6 f6            	ld	a,(x)
 441  00e7 a125          	cp	a,#37
 442  00e9 2708          	jreq	L571
 443                     ; 86             putchar(*s);
 445  00eb 1e03          	ldw	x,(OFST+1,sp)
 446  00ed f6            	ld	a,(x)
 447  00ee cd0000        	call	_putchar
 450  00f1 2054          	jra	L771
 451  00f3               L571:
 452                     ; 90             s++;
 454  00f3 1e03          	ldw	x,(OFST+1,sp)
 455  00f5 1c0001        	addw	x,#1
 456  00f8 1f03          	ldw	(OFST+1,sp),x
 457                     ; 91             switch (*s)
 459  00fa 1e03          	ldw	x,(OFST+1,sp)
 460  00fc f6            	ld	a,(x)
 462                     ; 107                 return;
 463  00fd a063          	sub	a,#99
 464  00ff 273f          	jreq	L141
 465  0101 4a            	dec	a
 466  0102 271b          	jreq	L531
 467  0104 a004          	sub	a,#4
 468  0106 2728          	jreq	L731
 469  0108 a00b          	sub	a,#11
 470  010a 2702          	jreq	L331
 471  010c               L341:
 472                     ; 105                 default:
 472                     ; 106                     va_end(var_arg);
 474                     ; 107                 return;
 476  010c 2045          	jra	L23
 477  010e               L331:
 478                     ; 93                 case 's':
 478                     ; 94                     print_s(va_arg(var_arg, char *));
 480  010e 1e01          	ldw	x,(OFST-1,sp)
 481  0110 1c0002        	addw	x,#2
 482  0113 1f01          	ldw	(OFST-1,sp),x
 484  0115 1e01          	ldw	x,(OFST-1,sp)
 485  0117 5a            	decw	x
 486  0118 5a            	decw	x
 487  0119 fe            	ldw	x,(x)
 488  011a cd0000        	call	L3_print_s
 490                     ; 95                 break;
 492  011d 2028          	jra	L302
 493  011f               L531:
 494                     ; 96                 case 'd':
 494                     ; 97                     print_dec(va_arg(var_arg, short));
 496  011f 1e01          	ldw	x,(OFST-1,sp)
 497  0121 1c0002        	addw	x,#2
 498  0124 1f01          	ldw	(OFST-1,sp),x
 500  0126 1e01          	ldw	x,(OFST-1,sp)
 501  0128 5a            	decw	x
 502  0129 5a            	decw	x
 503  012a fe            	ldw	x,(x)
 504  012b cd0017        	call	L73_print_dec
 506                     ; 98                 break;
 508  012e 2017          	jra	L302
 509  0130               L731:
 510                     ; 99                 case 'h':
 510                     ; 100                     print_hex(va_arg(var_arg, char));
 512  0130 1e01          	ldw	x,(OFST-1,sp)
 513  0132 1c0001        	addw	x,#1
 514  0135 1f01          	ldw	(OFST-1,sp),x
 516  0137 1e01          	ldw	x,(OFST-1,sp)
 517  0139 5a            	decw	x
 518  013a f6            	ld	a,(x)
 519  013b cd0094        	call	L511_print_hex
 521                     ; 101                 break;
 523  013e 2007          	jra	L302
 524  0140               L141:
 525                     ; 102                 case 'c':
 525                     ; 103                     putchar(*(s+1));
 527  0140 1e03          	ldw	x,(OFST+1,sp)
 528  0142 e601          	ld	a,(1,x)
 529  0144 cd0000        	call	_putchar
 531                     ; 104                 break;
 533  0147               L302:
 534  0147               L771:
 535                     ; 110         s++;
 537  0147 1e03          	ldw	x,(OFST+1,sp)
 538  0149 1c0001        	addw	x,#1
 539  014c 1f03          	ldw	(OFST+1,sp),x
 540  014e               L171:
 541                     ; 82     while (*s != '\0')
 543  014e 1e03          	ldw	x,(OFST+1,sp)
 544  0150 7d            	tnz	(x)
 545  0151 2691          	jrne	L761
 546                     ; 112     va_end(var_arg);
 548                     ; 113 }
 549  0153               L23:
 552  0153 5b04          	addw	sp,#4
 553  0155 81            	ret
 566                     	xref	_putchar
 567                     	xdef	_print
 586                     	end
