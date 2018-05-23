   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  44                     ; 53 void UART1_DeInit(void)
  44                     ; 54 {
  46                     	switch	.text
  47  0000               _UART1_DeInit:
  51                     ; 57   (void)UART1->SR;
  53  0000 c65230        	ld	a,21040
  54                     ; 58   (void)UART1->DR;
  56  0003 c65231        	ld	a,21041
  57                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  59  0006 725f5233      	clr	21043
  60                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  62  000a 725f5232      	clr	21042
  63                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  65  000e 725f5234      	clr	21044
  66                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  68  0012 725f5235      	clr	21045
  69                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  71  0016 725f5236      	clr	21046
  72                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  74  001a 725f5237      	clr	21047
  75                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  77  001e 725f5238      	clr	21048
  78                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  80  0022 725f5239      	clr	21049
  81                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  83  0026 725f523a      	clr	21050
  84                     ; 71 }
  87  002a 81            	ret
 385                     .const:	section	.text
 386  0000               L21:
 387  0000 00098969      	dc.l	625001
 388  0004               L25:
 389  0004 00000064      	dc.l	100
 390                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 390                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 390                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 390                     ; 93 {
 391                     	switch	.text
 392  002b               _UART1_Init:
 394  002b 520c          	subw	sp,#12
 395       0000000c      OFST:	set	12
 398                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 402                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 404  002d 96            	ldw	x,sp
 405  002e 1c000f        	addw	x,#OFST+3
 406  0031 cd0000        	call	c_ltor
 408  0034 ae0000        	ldw	x,#L21
 409  0037 cd0000        	call	c_lcmp
 411  003a 2403          	jruge	L01
 412  003c 4f            	clr	a
 413  003d 2010          	jra	L41
 414  003f               L01:
 415  003f ae0061        	ldw	x,#97
 416  0042 89            	pushw	x
 417  0043 ae0000        	ldw	x,#0
 418  0046 89            	pushw	x
 419  0047 ae0008        	ldw	x,#L561
 420  004a cd0000        	call	_assert_failed
 422  004d 5b04          	addw	sp,#4
 423  004f               L41:
 424                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 426  004f 0d13          	tnz	(OFST+7,sp)
 427  0051 2706          	jreq	L02
 428  0053 7b13          	ld	a,(OFST+7,sp)
 429  0055 a110          	cp	a,#16
 430  0057 2603          	jrne	L61
 431  0059               L02:
 432  0059 4f            	clr	a
 433  005a 2010          	jra	L22
 434  005c               L61:
 435  005c ae0062        	ldw	x,#98
 436  005f 89            	pushw	x
 437  0060 ae0000        	ldw	x,#0
 438  0063 89            	pushw	x
 439  0064 ae0008        	ldw	x,#L561
 440  0067 cd0000        	call	_assert_failed
 442  006a 5b04          	addw	sp,#4
 443  006c               L22:
 444                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 446  006c 0d14          	tnz	(OFST+8,sp)
 447  006e 2712          	jreq	L62
 448  0070 7b14          	ld	a,(OFST+8,sp)
 449  0072 a110          	cp	a,#16
 450  0074 270c          	jreq	L62
 451  0076 7b14          	ld	a,(OFST+8,sp)
 452  0078 a120          	cp	a,#32
 453  007a 2706          	jreq	L62
 454  007c 7b14          	ld	a,(OFST+8,sp)
 455  007e a130          	cp	a,#48
 456  0080 2603          	jrne	L42
 457  0082               L62:
 458  0082 4f            	clr	a
 459  0083 2010          	jra	L03
 460  0085               L42:
 461  0085 ae0063        	ldw	x,#99
 462  0088 89            	pushw	x
 463  0089 ae0000        	ldw	x,#0
 464  008c 89            	pushw	x
 465  008d ae0008        	ldw	x,#L561
 466  0090 cd0000        	call	_assert_failed
 468  0093 5b04          	addw	sp,#4
 469  0095               L03:
 470                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 472  0095 0d15          	tnz	(OFST+9,sp)
 473  0097 270c          	jreq	L43
 474  0099 7b15          	ld	a,(OFST+9,sp)
 475  009b a104          	cp	a,#4
 476  009d 2706          	jreq	L43
 477  009f 7b15          	ld	a,(OFST+9,sp)
 478  00a1 a106          	cp	a,#6
 479  00a3 2603          	jrne	L23
 480  00a5               L43:
 481  00a5 4f            	clr	a
 482  00a6 2010          	jra	L63
 483  00a8               L23:
 484  00a8 ae0064        	ldw	x,#100
 485  00ab 89            	pushw	x
 486  00ac ae0000        	ldw	x,#0
 487  00af 89            	pushw	x
 488  00b0 ae0008        	ldw	x,#L561
 489  00b3 cd0000        	call	_assert_failed
 491  00b6 5b04          	addw	sp,#4
 492  00b8               L63:
 493                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 495  00b8 7b17          	ld	a,(OFST+11,sp)
 496  00ba a108          	cp	a,#8
 497  00bc 2730          	jreq	L24
 498  00be 7b17          	ld	a,(OFST+11,sp)
 499  00c0 a140          	cp	a,#64
 500  00c2 272a          	jreq	L24
 501  00c4 7b17          	ld	a,(OFST+11,sp)
 502  00c6 a104          	cp	a,#4
 503  00c8 2724          	jreq	L24
 504  00ca 7b17          	ld	a,(OFST+11,sp)
 505  00cc a180          	cp	a,#128
 506  00ce 271e          	jreq	L24
 507  00d0 7b17          	ld	a,(OFST+11,sp)
 508  00d2 a10c          	cp	a,#12
 509  00d4 2718          	jreq	L24
 510  00d6 7b17          	ld	a,(OFST+11,sp)
 511  00d8 a10c          	cp	a,#12
 512  00da 2712          	jreq	L24
 513  00dc 7b17          	ld	a,(OFST+11,sp)
 514  00de a144          	cp	a,#68
 515  00e0 270c          	jreq	L24
 516  00e2 7b17          	ld	a,(OFST+11,sp)
 517  00e4 a1c0          	cp	a,#192
 518  00e6 2706          	jreq	L24
 519  00e8 7b17          	ld	a,(OFST+11,sp)
 520  00ea a188          	cp	a,#136
 521  00ec 2603          	jrne	L04
 522  00ee               L24:
 523  00ee 4f            	clr	a
 524  00ef 2010          	jra	L44
 525  00f1               L04:
 526  00f1 ae0065        	ldw	x,#101
 527  00f4 89            	pushw	x
 528  00f5 ae0000        	ldw	x,#0
 529  00f8 89            	pushw	x
 530  00f9 ae0008        	ldw	x,#L561
 531  00fc cd0000        	call	_assert_failed
 533  00ff 5b04          	addw	sp,#4
 534  0101               L44:
 535                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 537  0101 7b16          	ld	a,(OFST+10,sp)
 538  0103 a488          	and	a,#136
 539  0105 a188          	cp	a,#136
 540  0107 271b          	jreq	L64
 541  0109 7b16          	ld	a,(OFST+10,sp)
 542  010b a444          	and	a,#68
 543  010d a144          	cp	a,#68
 544  010f 2713          	jreq	L64
 545  0111 7b16          	ld	a,(OFST+10,sp)
 546  0113 a422          	and	a,#34
 547  0115 a122          	cp	a,#34
 548  0117 270b          	jreq	L64
 549  0119 7b16          	ld	a,(OFST+10,sp)
 550  011b a411          	and	a,#17
 551  011d a111          	cp	a,#17
 552  011f 2703          	jreq	L64
 553  0121 4f            	clr	a
 554  0122 2010          	jra	L05
 555  0124               L64:
 556  0124 ae0066        	ldw	x,#102
 557  0127 89            	pushw	x
 558  0128 ae0000        	ldw	x,#0
 559  012b 89            	pushw	x
 560  012c ae0008        	ldw	x,#L561
 561  012f cd0000        	call	_assert_failed
 563  0132 5b04          	addw	sp,#4
 564  0134               L05:
 565                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 567  0134 72195234      	bres	21044,#4
 568                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 570  0138 c65234        	ld	a,21044
 571  013b 1a13          	or	a,(OFST+7,sp)
 572  013d c75234        	ld	21044,a
 573                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 575  0140 c65236        	ld	a,21046
 576  0143 a4cf          	and	a,#207
 577  0145 c75236        	ld	21046,a
 578                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 580  0148 c65236        	ld	a,21046
 581  014b 1a14          	or	a,(OFST+8,sp)
 582  014d c75236        	ld	21046,a
 583                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 585  0150 c65234        	ld	a,21044
 586  0153 a4f9          	and	a,#249
 587  0155 c75234        	ld	21044,a
 588                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 590  0158 c65234        	ld	a,21044
 591  015b 1a15          	or	a,(OFST+9,sp)
 592  015d c75234        	ld	21044,a
 593                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 595  0160 725f5232      	clr	21042
 596                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 598  0164 c65233        	ld	a,21043
 599  0167 a40f          	and	a,#15
 600  0169 c75233        	ld	21043,a
 601                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 603  016c c65233        	ld	a,21043
 604  016f a4f0          	and	a,#240
 605  0171 c75233        	ld	21043,a
 606                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 608  0174 96            	ldw	x,sp
 609  0175 1c000f        	addw	x,#OFST+3
 610  0178 cd0000        	call	c_ltor
 612  017b a604          	ld	a,#4
 613  017d cd0000        	call	c_llsh
 615  0180 96            	ldw	x,sp
 616  0181 1c0001        	addw	x,#OFST-11
 617  0184 cd0000        	call	c_rtol
 620  0187 cd0000        	call	_CLK_GetClockFreq
 622  018a 96            	ldw	x,sp
 623  018b 1c0001        	addw	x,#OFST-11
 624  018e cd0000        	call	c_ludv
 626  0191 96            	ldw	x,sp
 627  0192 1c0009        	addw	x,#OFST-3
 628  0195 cd0000        	call	c_rtol
 631                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 633  0198 96            	ldw	x,sp
 634  0199 1c000f        	addw	x,#OFST+3
 635  019c cd0000        	call	c_ltor
 637  019f a604          	ld	a,#4
 638  01a1 cd0000        	call	c_llsh
 640  01a4 96            	ldw	x,sp
 641  01a5 1c0001        	addw	x,#OFST-11
 642  01a8 cd0000        	call	c_rtol
 645  01ab cd0000        	call	_CLK_GetClockFreq
 647  01ae a664          	ld	a,#100
 648  01b0 cd0000        	call	c_smul
 650  01b3 96            	ldw	x,sp
 651  01b4 1c0001        	addw	x,#OFST-11
 652  01b7 cd0000        	call	c_ludv
 654  01ba 96            	ldw	x,sp
 655  01bb 1c0005        	addw	x,#OFST-7
 656  01be cd0000        	call	c_rtol
 659                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 661  01c1 96            	ldw	x,sp
 662  01c2 1c0009        	addw	x,#OFST-3
 663  01c5 cd0000        	call	c_ltor
 665  01c8 a664          	ld	a,#100
 666  01ca cd0000        	call	c_smul
 668  01cd 96            	ldw	x,sp
 669  01ce 1c0001        	addw	x,#OFST-11
 670  01d1 cd0000        	call	c_rtol
 673  01d4 96            	ldw	x,sp
 674  01d5 1c0005        	addw	x,#OFST-7
 675  01d8 cd0000        	call	c_ltor
 677  01db 96            	ldw	x,sp
 678  01dc 1c0001        	addw	x,#OFST-11
 679  01df cd0000        	call	c_lsub
 681  01e2 a604          	ld	a,#4
 682  01e4 cd0000        	call	c_llsh
 684  01e7 ae0004        	ldw	x,#L25
 685  01ea cd0000        	call	c_ludv
 687  01ed b603          	ld	a,c_lreg+3
 688  01ef a40f          	and	a,#15
 689  01f1 ca5233        	or	a,21043
 690  01f4 c75233        	ld	21043,a
 691                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 693  01f7 96            	ldw	x,sp
 694  01f8 1c0009        	addw	x,#OFST-3
 695  01fb cd0000        	call	c_ltor
 697  01fe a604          	ld	a,#4
 698  0200 cd0000        	call	c_lursh
 700  0203 b603          	ld	a,c_lreg+3
 701  0205 a4f0          	and	a,#240
 702  0207 b703          	ld	c_lreg+3,a
 703  0209 3f02          	clr	c_lreg+2
 704  020b 3f01          	clr	c_lreg+1
 705  020d 3f00          	clr	c_lreg
 706  020f b603          	ld	a,c_lreg+3
 707  0211 ca5233        	or	a,21043
 708  0214 c75233        	ld	21043,a
 709                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 711  0217 c65232        	ld	a,21042
 712  021a 1a0c          	or	a,(OFST+0,sp)
 713  021c c75232        	ld	21042,a
 714                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 716  021f c65235        	ld	a,21045
 717  0222 a4f3          	and	a,#243
 718  0224 c75235        	ld	21045,a
 719                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 721  0227 c65236        	ld	a,21046
 722  022a a4f8          	and	a,#248
 723  022c c75236        	ld	21046,a
 724                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 724                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 726  022f 7b16          	ld	a,(OFST+10,sp)
 727  0231 a407          	and	a,#7
 728  0233 ca5236        	or	a,21046
 729  0236 c75236        	ld	21046,a
 730                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 732  0239 7b17          	ld	a,(OFST+11,sp)
 733  023b a504          	bcp	a,#4
 734  023d 2706          	jreq	L761
 735                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 737  023f 72165235      	bset	21045,#3
 739  0243 2004          	jra	L171
 740  0245               L761:
 741                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 743  0245 72175235      	bres	21045,#3
 744  0249               L171:
 745                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 747  0249 7b17          	ld	a,(OFST+11,sp)
 748  024b a508          	bcp	a,#8
 749  024d 2706          	jreq	L371
 750                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 752  024f 72145235      	bset	21045,#2
 754  0253 2004          	jra	L571
 755  0255               L371:
 756                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 758  0255 72155235      	bres	21045,#2
 759  0259               L571:
 760                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 762  0259 7b16          	ld	a,(OFST+10,sp)
 763  025b a580          	bcp	a,#128
 764  025d 2706          	jreq	L771
 765                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 767  025f 72175236      	bres	21046,#3
 769  0263 200a          	jra	L102
 770  0265               L771:
 771                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 773  0265 7b16          	ld	a,(OFST+10,sp)
 774  0267 a408          	and	a,#8
 775  0269 ca5236        	or	a,21046
 776  026c c75236        	ld	21046,a
 777  026f               L102:
 778                     ; 176 }
 781  026f 5b0c          	addw	sp,#12
 782  0271 81            	ret
 837                     ; 184 void UART1_Cmd(FunctionalState NewState)
 837                     ; 185 {
 838                     	switch	.text
 839  0272               _UART1_Cmd:
 843                     ; 186   if (NewState != DISABLE)
 845  0272 4d            	tnz	a
 846  0273 2706          	jreq	L132
 847                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 849  0275 721b5234      	bres	21044,#5
 851  0279 2004          	jra	L332
 852  027b               L132:
 853                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 855  027b 721a5234      	bset	21044,#5
 856  027f               L332:
 857                     ; 196 }
 860  027f 81            	ret
 982                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 982                     ; 212 {
 983                     	switch	.text
 984  0280               _UART1_ITConfig:
 986  0280 89            	pushw	x
 987  0281 89            	pushw	x
 988       00000002      OFST:	set	2
 991                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 995                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 997  0282 a30100        	cpw	x,#256
 998  0285 2719          	jreq	L26
 999  0287 a30277        	cpw	x,#631
1000  028a 2714          	jreq	L26
1001  028c a30266        	cpw	x,#614
1002  028f 270f          	jreq	L26
1003  0291 a30205        	cpw	x,#517
1004  0294 270a          	jreq	L26
1005  0296 a30244        	cpw	x,#580
1006  0299 2705          	jreq	L26
1007  029b a30346        	cpw	x,#838
1008  029e 2603          	jrne	L06
1009  02a0               L26:
1010  02a0 4f            	clr	a
1011  02a1 2010          	jra	L46
1012  02a3               L06:
1013  02a3 ae00d8        	ldw	x,#216
1014  02a6 89            	pushw	x
1015  02a7 ae0000        	ldw	x,#0
1016  02aa 89            	pushw	x
1017  02ab ae0008        	ldw	x,#L561
1018  02ae cd0000        	call	_assert_failed
1020  02b1 5b04          	addw	sp,#4
1021  02b3               L46:
1022                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1024  02b3 0d07          	tnz	(OFST+5,sp)
1025  02b5 2706          	jreq	L07
1026  02b7 7b07          	ld	a,(OFST+5,sp)
1027  02b9 a101          	cp	a,#1
1028  02bb 2603          	jrne	L66
1029  02bd               L07:
1030  02bd 4f            	clr	a
1031  02be 2010          	jra	L27
1032  02c0               L66:
1033  02c0 ae00d9        	ldw	x,#217
1034  02c3 89            	pushw	x
1035  02c4 ae0000        	ldw	x,#0
1036  02c7 89            	pushw	x
1037  02c8 ae0008        	ldw	x,#L561
1038  02cb cd0000        	call	_assert_failed
1040  02ce 5b04          	addw	sp,#4
1041  02d0               L27:
1042                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
1044  02d0 7b03          	ld	a,(OFST+1,sp)
1045  02d2 6b01          	ld	(OFST-1,sp),a
1047                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
1049  02d4 7b04          	ld	a,(OFST+2,sp)
1050  02d6 a40f          	and	a,#15
1051  02d8 5f            	clrw	x
1052  02d9 97            	ld	xl,a
1053  02da a601          	ld	a,#1
1054  02dc 5d            	tnzw	x
1055  02dd 2704          	jreq	L47
1056  02df               L67:
1057  02df 48            	sll	a
1058  02e0 5a            	decw	x
1059  02e1 26fc          	jrne	L67
1060  02e3               L47:
1061  02e3 6b02          	ld	(OFST+0,sp),a
1063                     ; 224   if (NewState != DISABLE)
1065  02e5 0d07          	tnz	(OFST+5,sp)
1066  02e7 272a          	jreq	L703
1067                     ; 227     if (uartreg == 0x01)
1069  02e9 7b01          	ld	a,(OFST-1,sp)
1070  02eb a101          	cp	a,#1
1071  02ed 260a          	jrne	L113
1072                     ; 229       UART1->CR1 |= itpos;
1074  02ef c65234        	ld	a,21044
1075  02f2 1a02          	or	a,(OFST+0,sp)
1076  02f4 c75234        	ld	21044,a
1078  02f7 2045          	jra	L123
1079  02f9               L113:
1080                     ; 231     else if (uartreg == 0x02)
1082  02f9 7b01          	ld	a,(OFST-1,sp)
1083  02fb a102          	cp	a,#2
1084  02fd 260a          	jrne	L513
1085                     ; 233       UART1->CR2 |= itpos;
1087  02ff c65235        	ld	a,21045
1088  0302 1a02          	or	a,(OFST+0,sp)
1089  0304 c75235        	ld	21045,a
1091  0307 2035          	jra	L123
1092  0309               L513:
1093                     ; 237       UART1->CR4 |= itpos;
1095  0309 c65237        	ld	a,21047
1096  030c 1a02          	or	a,(OFST+0,sp)
1097  030e c75237        	ld	21047,a
1098  0311 202b          	jra	L123
1099  0313               L703:
1100                     ; 243     if (uartreg == 0x01)
1102  0313 7b01          	ld	a,(OFST-1,sp)
1103  0315 a101          	cp	a,#1
1104  0317 260b          	jrne	L323
1105                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
1107  0319 7b02          	ld	a,(OFST+0,sp)
1108  031b 43            	cpl	a
1109  031c c45234        	and	a,21044
1110  031f c75234        	ld	21044,a
1112  0322 201a          	jra	L123
1113  0324               L323:
1114                     ; 247     else if (uartreg == 0x02)
1116  0324 7b01          	ld	a,(OFST-1,sp)
1117  0326 a102          	cp	a,#2
1118  0328 260b          	jrne	L723
1119                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
1121  032a 7b02          	ld	a,(OFST+0,sp)
1122  032c 43            	cpl	a
1123  032d c45235        	and	a,21045
1124  0330 c75235        	ld	21045,a
1126  0333 2009          	jra	L123
1127  0335               L723:
1128                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
1130  0335 7b02          	ld	a,(OFST+0,sp)
1131  0337 43            	cpl	a
1132  0338 c45237        	and	a,21047
1133  033b c75237        	ld	21047,a
1134  033e               L123:
1135                     ; 257 }
1138  033e 5b04          	addw	sp,#4
1139  0340 81            	ret
1176                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1176                     ; 266 {
1177                     	switch	.text
1178  0341               _UART1_HalfDuplexCmd:
1180  0341 88            	push	a
1181       00000000      OFST:	set	0
1184                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1186  0342 4d            	tnz	a
1187  0343 2704          	jreq	L401
1188  0345 a101          	cp	a,#1
1189  0347 2603          	jrne	L201
1190  0349               L401:
1191  0349 4f            	clr	a
1192  034a 2010          	jra	L601
1193  034c               L201:
1194  034c ae010b        	ldw	x,#267
1195  034f 89            	pushw	x
1196  0350 ae0000        	ldw	x,#0
1197  0353 89            	pushw	x
1198  0354 ae0008        	ldw	x,#L561
1199  0357 cd0000        	call	_assert_failed
1201  035a 5b04          	addw	sp,#4
1202  035c               L601:
1203                     ; 269   if (NewState != DISABLE)
1205  035c 0d01          	tnz	(OFST+1,sp)
1206  035e 2706          	jreq	L153
1207                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1209  0360 72165238      	bset	21048,#3
1211  0364 2004          	jra	L353
1212  0366               L153:
1213                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1215  0366 72175238      	bres	21048,#3
1216  036a               L353:
1217                     ; 277 }
1220  036a 84            	pop	a
1221  036b 81            	ret
1279                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1279                     ; 286 {
1280                     	switch	.text
1281  036c               _UART1_IrDAConfig:
1283  036c 88            	push	a
1284       00000000      OFST:	set	0
1287                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1289  036d a101          	cp	a,#1
1290  036f 2703          	jreq	L411
1291  0371 4d            	tnz	a
1292  0372 2603          	jrne	L211
1293  0374               L411:
1294  0374 4f            	clr	a
1295  0375 2010          	jra	L611
1296  0377               L211:
1297  0377 ae011f        	ldw	x,#287
1298  037a 89            	pushw	x
1299  037b ae0000        	ldw	x,#0
1300  037e 89            	pushw	x
1301  037f ae0008        	ldw	x,#L561
1302  0382 cd0000        	call	_assert_failed
1304  0385 5b04          	addw	sp,#4
1305  0387               L611:
1306                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1308  0387 0d01          	tnz	(OFST+1,sp)
1309  0389 2706          	jreq	L304
1310                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1312  038b 72145238      	bset	21048,#2
1314  038f 2004          	jra	L504
1315  0391               L304:
1316                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1318  0391 72155238      	bres	21048,#2
1319  0395               L504:
1320                     ; 297 }
1323  0395 84            	pop	a
1324  0396 81            	ret
1360                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1360                     ; 306 {
1361                     	switch	.text
1362  0397               _UART1_IrDACmd:
1364  0397 88            	push	a
1365       00000000      OFST:	set	0
1368                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1370  0398 4d            	tnz	a
1371  0399 2704          	jreq	L421
1372  039b a101          	cp	a,#1
1373  039d 2603          	jrne	L221
1374  039f               L421:
1375  039f 4f            	clr	a
1376  03a0 2010          	jra	L621
1377  03a2               L221:
1378  03a2 ae0134        	ldw	x,#308
1379  03a5 89            	pushw	x
1380  03a6 ae0000        	ldw	x,#0
1381  03a9 89            	pushw	x
1382  03aa ae0008        	ldw	x,#L561
1383  03ad cd0000        	call	_assert_failed
1385  03b0 5b04          	addw	sp,#4
1386  03b2               L621:
1387                     ; 310   if (NewState != DISABLE)
1389  03b2 0d01          	tnz	(OFST+1,sp)
1390  03b4 2706          	jreq	L524
1391                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1393  03b6 72125238      	bset	21048,#1
1395  03ba 2004          	jra	L724
1396  03bc               L524:
1397                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1399  03bc 72135238      	bres	21048,#1
1400  03c0               L724:
1401                     ; 320 }
1404  03c0 84            	pop	a
1405  03c1 81            	ret
1465                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1465                     ; 330 {
1466                     	switch	.text
1467  03c2               _UART1_LINBreakDetectionConfig:
1469  03c2 88            	push	a
1470       00000000      OFST:	set	0
1473                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1475  03c3 4d            	tnz	a
1476  03c4 2704          	jreq	L431
1477  03c6 a101          	cp	a,#1
1478  03c8 2603          	jrne	L231
1479  03ca               L431:
1480  03ca 4f            	clr	a
1481  03cb 2010          	jra	L631
1482  03cd               L231:
1483  03cd ae014b        	ldw	x,#331
1484  03d0 89            	pushw	x
1485  03d1 ae0000        	ldw	x,#0
1486  03d4 89            	pushw	x
1487  03d5 ae0008        	ldw	x,#L561
1488  03d8 cd0000        	call	_assert_failed
1490  03db 5b04          	addw	sp,#4
1491  03dd               L631:
1492                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1494  03dd 0d01          	tnz	(OFST+1,sp)
1495  03df 2706          	jreq	L754
1496                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1498  03e1 721a5237      	bset	21047,#5
1500  03e5 2004          	jra	L164
1501  03e7               L754:
1502                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1504  03e7 721b5237      	bres	21047,#5
1505  03eb               L164:
1506                     ; 341 }
1509  03eb 84            	pop	a
1510  03ec 81            	ret
1546                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1546                     ; 350 {
1547                     	switch	.text
1548  03ed               _UART1_LINCmd:
1550  03ed 88            	push	a
1551       00000000      OFST:	set	0
1554                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1556  03ee 4d            	tnz	a
1557  03ef 2704          	jreq	L441
1558  03f1 a101          	cp	a,#1
1559  03f3 2603          	jrne	L241
1560  03f5               L441:
1561  03f5 4f            	clr	a
1562  03f6 2010          	jra	L641
1563  03f8               L241:
1564  03f8 ae015f        	ldw	x,#351
1565  03fb 89            	pushw	x
1566  03fc ae0000        	ldw	x,#0
1567  03ff 89            	pushw	x
1568  0400 ae0008        	ldw	x,#L561
1569  0403 cd0000        	call	_assert_failed
1571  0406 5b04          	addw	sp,#4
1572  0408               L641:
1573                     ; 353   if (NewState != DISABLE)
1575  0408 0d01          	tnz	(OFST+1,sp)
1576  040a 2706          	jreq	L105
1577                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1579  040c 721c5236      	bset	21046,#6
1581  0410 2004          	jra	L305
1582  0412               L105:
1583                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1585  0412 721d5236      	bres	21046,#6
1586  0416               L305:
1587                     ; 363 }
1590  0416 84            	pop	a
1591  0417 81            	ret
1627                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1627                     ; 372 {
1628                     	switch	.text
1629  0418               _UART1_SmartCardCmd:
1631  0418 88            	push	a
1632       00000000      OFST:	set	0
1635                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1637  0419 4d            	tnz	a
1638  041a 2704          	jreq	L451
1639  041c a101          	cp	a,#1
1640  041e 2603          	jrne	L251
1641  0420               L451:
1642  0420 4f            	clr	a
1643  0421 2010          	jra	L651
1644  0423               L251:
1645  0423 ae0175        	ldw	x,#373
1646  0426 89            	pushw	x
1647  0427 ae0000        	ldw	x,#0
1648  042a 89            	pushw	x
1649  042b ae0008        	ldw	x,#L561
1650  042e cd0000        	call	_assert_failed
1652  0431 5b04          	addw	sp,#4
1653  0433               L651:
1654                     ; 375   if (NewState != DISABLE)
1656  0433 0d01          	tnz	(OFST+1,sp)
1657  0435 2706          	jreq	L325
1658                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1660  0437 721a5238      	bset	21048,#5
1662  043b 2004          	jra	L525
1663  043d               L325:
1664                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1666  043d 721b5238      	bres	21048,#5
1667  0441               L525:
1668                     ; 385 }
1671  0441 84            	pop	a
1672  0442 81            	ret
1709                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1709                     ; 395 {
1710                     	switch	.text
1711  0443               _UART1_SmartCardNACKCmd:
1713  0443 88            	push	a
1714       00000000      OFST:	set	0
1717                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1719  0444 4d            	tnz	a
1720  0445 2704          	jreq	L461
1721  0447 a101          	cp	a,#1
1722  0449 2603          	jrne	L261
1723  044b               L461:
1724  044b 4f            	clr	a
1725  044c 2010          	jra	L661
1726  044e               L261:
1727  044e ae018c        	ldw	x,#396
1728  0451 89            	pushw	x
1729  0452 ae0000        	ldw	x,#0
1730  0455 89            	pushw	x
1731  0456 ae0008        	ldw	x,#L561
1732  0459 cd0000        	call	_assert_failed
1734  045c 5b04          	addw	sp,#4
1735  045e               L661:
1736                     ; 398   if (NewState != DISABLE)
1738  045e 0d01          	tnz	(OFST+1,sp)
1739  0460 2706          	jreq	L545
1740                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1742  0462 72185238      	bset	21048,#4
1744  0466 2004          	jra	L745
1745  0468               L545:
1746                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1748  0468 72195238      	bres	21048,#4
1749  046c               L745:
1750                     ; 408 }
1753  046c 84            	pop	a
1754  046d 81            	ret
1812                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1812                     ; 417 {
1813                     	switch	.text
1814  046e               _UART1_WakeUpConfig:
1816  046e 88            	push	a
1817       00000000      OFST:	set	0
1820                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1822  046f 4d            	tnz	a
1823  0470 2704          	jreq	L471
1824  0472 a108          	cp	a,#8
1825  0474 2603          	jrne	L271
1826  0476               L471:
1827  0476 4f            	clr	a
1828  0477 2010          	jra	L671
1829  0479               L271:
1830  0479 ae01a2        	ldw	x,#418
1831  047c 89            	pushw	x
1832  047d ae0000        	ldw	x,#0
1833  0480 89            	pushw	x
1834  0481 ae0008        	ldw	x,#L561
1835  0484 cd0000        	call	_assert_failed
1837  0487 5b04          	addw	sp,#4
1838  0489               L671:
1839                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1841  0489 72175234      	bres	21044,#3
1842                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1844  048d c65234        	ld	a,21044
1845  0490 1a01          	or	a,(OFST+1,sp)
1846  0492 c75234        	ld	21044,a
1847                     ; 422 }
1850  0495 84            	pop	a
1851  0496 81            	ret
1888                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1888                     ; 431 {
1889                     	switch	.text
1890  0497               _UART1_ReceiverWakeUpCmd:
1892  0497 88            	push	a
1893       00000000      OFST:	set	0
1896                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1898  0498 4d            	tnz	a
1899  0499 2704          	jreq	L402
1900  049b a101          	cp	a,#1
1901  049d 2603          	jrne	L202
1902  049f               L402:
1903  049f 4f            	clr	a
1904  04a0 2010          	jra	L602
1905  04a2               L202:
1906  04a2 ae01b0        	ldw	x,#432
1907  04a5 89            	pushw	x
1908  04a6 ae0000        	ldw	x,#0
1909  04a9 89            	pushw	x
1910  04aa ae0008        	ldw	x,#L561
1911  04ad cd0000        	call	_assert_failed
1913  04b0 5b04          	addw	sp,#4
1914  04b2               L602:
1915                     ; 434   if (NewState != DISABLE)
1917  04b2 0d01          	tnz	(OFST+1,sp)
1918  04b4 2706          	jreq	L516
1919                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1921  04b6 72125235      	bset	21045,#1
1923  04ba 2004          	jra	L716
1924  04bc               L516:
1925                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1927  04bc 72135235      	bres	21045,#1
1928  04c0               L716:
1929                     ; 444 }
1932  04c0 84            	pop	a
1933  04c1 81            	ret
1956                     ; 451 uint8_t UART1_ReceiveData8(void)
1956                     ; 452 {
1957                     	switch	.text
1958  04c2               _UART1_ReceiveData8:
1962                     ; 453   return ((uint8_t)UART1->DR);
1964  04c2 c65231        	ld	a,21041
1967  04c5 81            	ret
1999                     ; 461 uint16_t UART1_ReceiveData9(void)
1999                     ; 462 {
2000                     	switch	.text
2001  04c6               _UART1_ReceiveData9:
2003  04c6 89            	pushw	x
2004       00000002      OFST:	set	2
2007                     ; 463   uint16_t temp = 0;
2009                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
2011  04c7 c65234        	ld	a,21044
2012  04ca 5f            	clrw	x
2013  04cb a480          	and	a,#128
2014  04cd 5f            	clrw	x
2015  04ce 02            	rlwa	x,a
2016  04cf 58            	sllw	x
2017  04d0 1f01          	ldw	(OFST-1,sp),x
2019                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
2021  04d2 c65231        	ld	a,21041
2022  04d5 5f            	clrw	x
2023  04d6 97            	ld	xl,a
2024  04d7 01            	rrwa	x,a
2025  04d8 1a02          	or	a,(OFST+0,sp)
2026  04da 01            	rrwa	x,a
2027  04db 1a01          	or	a,(OFST-1,sp)
2028  04dd 01            	rrwa	x,a
2029  04de 01            	rrwa	x,a
2030  04df a4ff          	and	a,#255
2031  04e1 01            	rrwa	x,a
2032  04e2 a401          	and	a,#1
2033  04e4 01            	rrwa	x,a
2036  04e5 5b02          	addw	sp,#2
2037  04e7 81            	ret
2069                     ; 474 void UART1_SendData8(uint8_t Data)
2069                     ; 475 {
2070                     	switch	.text
2071  04e8               _UART1_SendData8:
2075                     ; 477   UART1->DR = Data;
2077  04e8 c75231        	ld	21041,a
2078                     ; 478 }
2081  04eb 81            	ret
2113                     ; 486 void UART1_SendData9(uint16_t Data)
2113                     ; 487 {
2114                     	switch	.text
2115  04ec               _UART1_SendData9:
2117  04ec 89            	pushw	x
2118       00000000      OFST:	set	0
2121                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2123  04ed 721d5234      	bres	21044,#6
2124                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2126  04f1 54            	srlw	x
2127  04f2 54            	srlw	x
2128  04f3 9f            	ld	a,xl
2129  04f4 a440          	and	a,#64
2130  04f6 ca5234        	or	a,21044
2131  04f9 c75234        	ld	21044,a
2132                     ; 493   UART1->DR   = (uint8_t)(Data);
2134  04fc 7b02          	ld	a,(OFST+2,sp)
2135  04fe c75231        	ld	21041,a
2136                     ; 494 }
2139  0501 85            	popw	x
2140  0502 81            	ret
2163                     ; 501 void UART1_SendBreak(void)
2163                     ; 502 {
2164                     	switch	.text
2165  0503               _UART1_SendBreak:
2169                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
2171  0503 72105235      	bset	21045,#0
2172                     ; 504 }
2175  0507 81            	ret
2208                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
2208                     ; 512 {
2209                     	switch	.text
2210  0508               _UART1_SetAddress:
2212  0508 88            	push	a
2213       00000000      OFST:	set	0
2216                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2218  0509 a110          	cp	a,#16
2219  050b 2403          	jruge	L422
2220  050d 4f            	clr	a
2221  050e 2010          	jra	L622
2222  0510               L422:
2223  0510 ae0202        	ldw	x,#514
2224  0513 89            	pushw	x
2225  0514 ae0000        	ldw	x,#0
2226  0517 89            	pushw	x
2227  0518 ae0008        	ldw	x,#L561
2228  051b cd0000        	call	_assert_failed
2230  051e 5b04          	addw	sp,#4
2231  0520               L622:
2232                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2234  0520 c65237        	ld	a,21047
2235  0523 a4f0          	and	a,#240
2236  0525 c75237        	ld	21047,a
2237                     ; 519   UART1->CR4 |= UART1_Address;
2239  0528 c65237        	ld	a,21047
2240  052b 1a01          	or	a,(OFST+1,sp)
2241  052d c75237        	ld	21047,a
2242                     ; 520 }
2245  0530 84            	pop	a
2246  0531 81            	ret
2278                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2278                     ; 529 {
2279                     	switch	.text
2280  0532               _UART1_SetGuardTime:
2284                     ; 531   UART1->GTR = UART1_GuardTime;
2286  0532 c75239        	ld	21049,a
2287                     ; 532 }
2290  0535 81            	ret
2322                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2322                     ; 557 {
2323                     	switch	.text
2324  0536               _UART1_SetPrescaler:
2328                     ; 559   UART1->PSCR = UART1_Prescaler;
2330  0536 c7523a        	ld	21050,a
2331                     ; 560 }
2334  0539 81            	ret
2478                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2478                     ; 569 {
2479                     	switch	.text
2480  053a               _UART1_GetFlagStatus:
2482  053a 89            	pushw	x
2483  053b 88            	push	a
2484       00000001      OFST:	set	1
2487                     ; 570   FlagStatus status = RESET;
2489                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2491  053c a30080        	cpw	x,#128
2492  053f 272d          	jreq	L042
2493  0541 a30040        	cpw	x,#64
2494  0544 2728          	jreq	L042
2495  0546 a30020        	cpw	x,#32
2496  0549 2723          	jreq	L042
2497  054b a30010        	cpw	x,#16
2498  054e 271e          	jreq	L042
2499  0550 a30008        	cpw	x,#8
2500  0553 2719          	jreq	L042
2501  0555 a30004        	cpw	x,#4
2502  0558 2714          	jreq	L042
2503  055a a30002        	cpw	x,#2
2504  055d 270f          	jreq	L042
2505  055f a30001        	cpw	x,#1
2506  0562 270a          	jreq	L042
2507  0564 a30101        	cpw	x,#257
2508  0567 2705          	jreq	L042
2509  0569 a30210        	cpw	x,#528
2510  056c 2603          	jrne	L632
2511  056e               L042:
2512  056e 4f            	clr	a
2513  056f 2010          	jra	L242
2514  0571               L632:
2515  0571 ae023d        	ldw	x,#573
2516  0574 89            	pushw	x
2517  0575 ae0000        	ldw	x,#0
2518  0578 89            	pushw	x
2519  0579 ae0008        	ldw	x,#L561
2520  057c cd0000        	call	_assert_failed
2522  057f 5b04          	addw	sp,#4
2523  0581               L242:
2524                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2526  0581 1e02          	ldw	x,(OFST+1,sp)
2527  0583 a30210        	cpw	x,#528
2528  0586 2611          	jrne	L3301
2529                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2531  0588 c65237        	ld	a,21047
2532  058b 1503          	bcp	a,(OFST+2,sp)
2533  058d 2706          	jreq	L5301
2534                     ; 582       status = SET;
2536  058f a601          	ld	a,#1
2537  0591 6b01          	ld	(OFST+0,sp),a
2540  0593 202b          	jra	L1401
2541  0595               L5301:
2542                     ; 587       status = RESET;
2544  0595 0f01          	clr	(OFST+0,sp)
2546  0597 2027          	jra	L1401
2547  0599               L3301:
2548                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2550  0599 1e02          	ldw	x,(OFST+1,sp)
2551  059b a30101        	cpw	x,#257
2552  059e 2611          	jrne	L3401
2553                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2555  05a0 c65235        	ld	a,21045
2556  05a3 1503          	bcp	a,(OFST+2,sp)
2557  05a5 2706          	jreq	L5401
2558                     ; 595       status = SET;
2560  05a7 a601          	ld	a,#1
2561  05a9 6b01          	ld	(OFST+0,sp),a
2564  05ab 2013          	jra	L1401
2565  05ad               L5401:
2566                     ; 600       status = RESET;
2568  05ad 0f01          	clr	(OFST+0,sp)
2570  05af 200f          	jra	L1401
2571  05b1               L3401:
2572                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2574  05b1 c65230        	ld	a,21040
2575  05b4 1503          	bcp	a,(OFST+2,sp)
2576  05b6 2706          	jreq	L3501
2577                     ; 608       status = SET;
2579  05b8 a601          	ld	a,#1
2580  05ba 6b01          	ld	(OFST+0,sp),a
2583  05bc 2002          	jra	L1401
2584  05be               L3501:
2585                     ; 613       status = RESET;
2587  05be 0f01          	clr	(OFST+0,sp)
2589  05c0               L1401:
2590                     ; 617   return status;
2592  05c0 7b01          	ld	a,(OFST+0,sp)
2595  05c2 5b03          	addw	sp,#3
2596  05c4 81            	ret
2632                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2632                     ; 647 {
2633                     	switch	.text
2634  05c5               _UART1_ClearFlag:
2636  05c5 89            	pushw	x
2637       00000000      OFST:	set	0
2640                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2642  05c6 a30020        	cpw	x,#32
2643  05c9 2705          	jreq	L052
2644  05cb a30210        	cpw	x,#528
2645  05ce 2603          	jrne	L642
2646  05d0               L052:
2647  05d0 4f            	clr	a
2648  05d1 2010          	jra	L252
2649  05d3               L642:
2650  05d3 ae0288        	ldw	x,#648
2651  05d6 89            	pushw	x
2652  05d7 ae0000        	ldw	x,#0
2653  05da 89            	pushw	x
2654  05db ae0008        	ldw	x,#L561
2655  05de cd0000        	call	_assert_failed
2657  05e1 5b04          	addw	sp,#4
2658  05e3               L252:
2659                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2661  05e3 1e01          	ldw	x,(OFST+1,sp)
2662  05e5 a30020        	cpw	x,#32
2663  05e8 2606          	jrne	L5701
2664                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2666  05ea 35df5230      	mov	21040,#223
2668  05ee 2004          	jra	L7701
2669  05f0               L5701:
2670                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2672  05f0 72195237      	bres	21047,#4
2673  05f4               L7701:
2674                     ; 660 }
2677  05f4 85            	popw	x
2678  05f5 81            	ret
2753                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2753                     ; 676 {
2754                     	switch	.text
2755  05f6               _UART1_GetITStatus:
2757  05f6 89            	pushw	x
2758  05f7 89            	pushw	x
2759       00000002      OFST:	set	2
2762                     ; 677   ITStatus pendingbitstatus = RESET;
2764                     ; 678   uint8_t itpos = 0;
2766                     ; 679   uint8_t itmask1 = 0;
2768                     ; 680   uint8_t itmask2 = 0;
2770                     ; 681   uint8_t enablestatus = 0;
2772                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2774  05f8 a30277        	cpw	x,#631
2775  05fb 271e          	jreq	L062
2776  05fd a30266        	cpw	x,#614
2777  0600 2719          	jreq	L062
2778  0602 a30255        	cpw	x,#597
2779  0605 2714          	jreq	L062
2780  0607 a30244        	cpw	x,#580
2781  060a 270f          	jreq	L062
2782  060c a30235        	cpw	x,#565
2783  060f 270a          	jreq	L062
2784  0611 a30346        	cpw	x,#838
2785  0614 2705          	jreq	L062
2786  0616 a30100        	cpw	x,#256
2787  0619 2603          	jrne	L652
2788  061b               L062:
2789  061b 4f            	clr	a
2790  061c 2010          	jra	L262
2791  061e               L652:
2792  061e ae02ac        	ldw	x,#684
2793  0621 89            	pushw	x
2794  0622 ae0000        	ldw	x,#0
2795  0625 89            	pushw	x
2796  0626 ae0008        	ldw	x,#L561
2797  0629 cd0000        	call	_assert_failed
2799  062c 5b04          	addw	sp,#4
2800  062e               L262:
2801                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2803  062e 7b04          	ld	a,(OFST+2,sp)
2804  0630 a40f          	and	a,#15
2805  0632 5f            	clrw	x
2806  0633 97            	ld	xl,a
2807  0634 a601          	ld	a,#1
2808  0636 5d            	tnzw	x
2809  0637 2704          	jreq	L462
2810  0639               L662:
2811  0639 48            	sll	a
2812  063a 5a            	decw	x
2813  063b 26fc          	jrne	L662
2814  063d               L462:
2815  063d 6b01          	ld	(OFST-1,sp),a
2817                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2819  063f 7b04          	ld	a,(OFST+2,sp)
2820  0641 4e            	swap	a
2821  0642 a40f          	and	a,#15
2822  0644 6b02          	ld	(OFST+0,sp),a
2824                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2826  0646 7b02          	ld	a,(OFST+0,sp)
2827  0648 5f            	clrw	x
2828  0649 97            	ld	xl,a
2829  064a a601          	ld	a,#1
2830  064c 5d            	tnzw	x
2831  064d 2704          	jreq	L072
2832  064f               L272:
2833  064f 48            	sll	a
2834  0650 5a            	decw	x
2835  0651 26fc          	jrne	L272
2836  0653               L072:
2837  0653 6b02          	ld	(OFST+0,sp),a
2839                     ; 695   if (UART1_IT == UART1_IT_PE)
2841  0655 1e03          	ldw	x,(OFST+1,sp)
2842  0657 a30100        	cpw	x,#256
2843  065a 261c          	jrne	L3311
2844                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2846  065c c65234        	ld	a,21044
2847  065f 1402          	and	a,(OFST+0,sp)
2848  0661 6b02          	ld	(OFST+0,sp),a
2850                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2852  0663 c65230        	ld	a,21040
2853  0666 1501          	bcp	a,(OFST-1,sp)
2854  0668 270a          	jreq	L5311
2856  066a 0d02          	tnz	(OFST+0,sp)
2857  066c 2706          	jreq	L5311
2858                     ; 704       pendingbitstatus = SET;
2860  066e a601          	ld	a,#1
2861  0670 6b02          	ld	(OFST+0,sp),a
2864  0672 2041          	jra	L1411
2865  0674               L5311:
2866                     ; 709       pendingbitstatus = RESET;
2868  0674 0f02          	clr	(OFST+0,sp)
2870  0676 203d          	jra	L1411
2871  0678               L3311:
2872                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2874  0678 1e03          	ldw	x,(OFST+1,sp)
2875  067a a30346        	cpw	x,#838
2876  067d 261c          	jrne	L3411
2877                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2879  067f c65237        	ld	a,21047
2880  0682 1402          	and	a,(OFST+0,sp)
2881  0684 6b02          	ld	(OFST+0,sp),a
2883                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2885  0686 c65237        	ld	a,21047
2886  0689 1501          	bcp	a,(OFST-1,sp)
2887  068b 270a          	jreq	L5411
2889  068d 0d02          	tnz	(OFST+0,sp)
2890  068f 2706          	jreq	L5411
2891                     ; 721       pendingbitstatus = SET;
2893  0691 a601          	ld	a,#1
2894  0693 6b02          	ld	(OFST+0,sp),a
2897  0695 201e          	jra	L1411
2898  0697               L5411:
2899                     ; 726       pendingbitstatus = RESET;
2901  0697 0f02          	clr	(OFST+0,sp)
2903  0699 201a          	jra	L1411
2904  069b               L3411:
2905                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2907  069b c65235        	ld	a,21045
2908  069e 1402          	and	a,(OFST+0,sp)
2909  06a0 6b02          	ld	(OFST+0,sp),a
2911                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2913  06a2 c65230        	ld	a,21040
2914  06a5 1501          	bcp	a,(OFST-1,sp)
2915  06a7 270a          	jreq	L3511
2917  06a9 0d02          	tnz	(OFST+0,sp)
2918  06ab 2706          	jreq	L3511
2919                     ; 737       pendingbitstatus = SET;
2921  06ad a601          	ld	a,#1
2922  06af 6b02          	ld	(OFST+0,sp),a
2925  06b1 2002          	jra	L1411
2926  06b3               L3511:
2927                     ; 742       pendingbitstatus = RESET;
2929  06b3 0f02          	clr	(OFST+0,sp)
2931  06b5               L1411:
2932                     ; 747   return  pendingbitstatus;
2934  06b5 7b02          	ld	a,(OFST+0,sp)
2937  06b7 5b04          	addw	sp,#4
2938  06b9 81            	ret
2975                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2975                     ; 776 {
2976                     	switch	.text
2977  06ba               _UART1_ClearITPendingBit:
2979  06ba 89            	pushw	x
2980       00000000      OFST:	set	0
2983                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2985  06bb a30255        	cpw	x,#597
2986  06be 2705          	jreq	L003
2987  06c0 a30346        	cpw	x,#838
2988  06c3 2603          	jrne	L672
2989  06c5               L003:
2990  06c5 4f            	clr	a
2991  06c6 2010          	jra	L203
2992  06c8               L672:
2993  06c8 ae0309        	ldw	x,#777
2994  06cb 89            	pushw	x
2995  06cc ae0000        	ldw	x,#0
2996  06cf 89            	pushw	x
2997  06d0 ae0008        	ldw	x,#L561
2998  06d3 cd0000        	call	_assert_failed
3000  06d6 5b04          	addw	sp,#4
3001  06d8               L203:
3002                     ; 780   if (UART1_IT == UART1_IT_RXNE)
3004  06d8 1e01          	ldw	x,(OFST+1,sp)
3005  06da a30255        	cpw	x,#597
3006  06dd 2606          	jrne	L5711
3007                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
3009  06df 35df5230      	mov	21040,#223
3011  06e3 2004          	jra	L7711
3012  06e5               L5711:
3013                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
3015  06e5 72195237      	bres	21047,#4
3016  06e9               L7711:
3017                     ; 789 }
3020  06e9 85            	popw	x
3021  06ea 81            	ret
3034                     	xdef	_UART1_ClearITPendingBit
3035                     	xdef	_UART1_GetITStatus
3036                     	xdef	_UART1_ClearFlag
3037                     	xdef	_UART1_GetFlagStatus
3038                     	xdef	_UART1_SetPrescaler
3039                     	xdef	_UART1_SetGuardTime
3040                     	xdef	_UART1_SetAddress
3041                     	xdef	_UART1_SendBreak
3042                     	xdef	_UART1_SendData9
3043                     	xdef	_UART1_SendData8
3044                     	xdef	_UART1_ReceiveData9
3045                     	xdef	_UART1_ReceiveData8
3046                     	xdef	_UART1_ReceiverWakeUpCmd
3047                     	xdef	_UART1_WakeUpConfig
3048                     	xdef	_UART1_SmartCardNACKCmd
3049                     	xdef	_UART1_SmartCardCmd
3050                     	xdef	_UART1_LINCmd
3051                     	xdef	_UART1_LINBreakDetectionConfig
3052                     	xdef	_UART1_IrDACmd
3053                     	xdef	_UART1_IrDAConfig
3054                     	xdef	_UART1_HalfDuplexCmd
3055                     	xdef	_UART1_ITConfig
3056                     	xdef	_UART1_Cmd
3057                     	xdef	_UART1_Init
3058                     	xdef	_UART1_DeInit
3059                     	xref	_assert_failed
3060                     	xref	_CLK_GetClockFreq
3061                     	switch	.const
3062  0008               L561:
3063  0008 2e2e5c2e2e5c  	dc.b	"..\..\..\driver\st"
3064  001a 6d38735f7374  	dc.b	"m8s_stdperiph_lib\"
3065  002c 6c6962726172  	dc.b	"libraries\stm8s_st"
3066  003e 647065726970  	dc.b	"dperiph_driver\src"
3067  0050 5c73746d3873  	dc.b	"\stm8s_uart1.c",0
3068                     	xref.b	c_lreg
3069                     	xref.b	c_x
3089                     	xref	c_lursh
3090                     	xref	c_lsub
3091                     	xref	c_smul
3092                     	xref	c_ludv
3093                     	xref	c_rtol
3094                     	xref	c_llsh
3095                     	xref	c_lcmp
3096                     	xref	c_ltor
3097                     	end
