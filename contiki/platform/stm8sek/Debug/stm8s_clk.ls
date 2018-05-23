   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     .const:	section	.text
  17  0000               _HSIDivFactor:
  18  0000 01            	dc.b	1
  19  0001 02            	dc.b	2
  20  0002 04            	dc.b	4
  21  0003 08            	dc.b	8
  22  0004               _CLKPrescTable:
  23  0004 01            	dc.b	1
  24  0005 02            	dc.b	2
  25  0006 04            	dc.b	4
  26  0007 08            	dc.b	8
  27  0008 0a            	dc.b	10
  28  0009 10            	dc.b	16
  29  000a 14            	dc.b	20
  30  000b 28            	dc.b	40
  59                     ; 72 void CLK_DeInit(void)
  59                     ; 73 {
  61                     	switch	.text
  62  0000               _CLK_DeInit:
  66                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  68  0000 350150c0      	mov	20672,#1
  69                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  71  0004 725f50c1      	clr	20673
  72                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  74  0008 35e150c4      	mov	20676,#225
  75                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  77  000c 725f50c5      	clr	20677
  78                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  80  0010 351850c6      	mov	20678,#24
  81                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  83  0014 35ff50c7      	mov	20679,#255
  84                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  86  0018 35ff50ca      	mov	20682,#255
  87                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  89  001c 725f50c8      	clr	20680
  90                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  92  0020 725f50c9      	clr	20681
  94  0024               L52:
  95                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  97  0024 c650c9        	ld	a,20681
  98  0027 a501          	bcp	a,#1
  99  0029 26f9          	jrne	L52
 100                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 102  002b 725f50c9      	clr	20681
 103                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 105  002f 725f50cc      	clr	20684
 106                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 108  0033 725f50cd      	clr	20685
 109                     ; 88 }
 112  0037 81            	ret
 169                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 169                     ; 100 {
 170                     	switch	.text
 171  0038               _CLK_FastHaltWakeUpCmd:
 173  0038 88            	push	a
 174       00000000      OFST:	set	0
 177                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 179  0039 4d            	tnz	a
 180  003a 2704          	jreq	L21
 181  003c a101          	cp	a,#1
 182  003e 2603          	jrne	L01
 183  0040               L21:
 184  0040 4f            	clr	a
 185  0041 2010          	jra	L41
 186  0043               L01:
 187  0043 ae0066        	ldw	x,#102
 188  0046 89            	pushw	x
 189  0047 ae0000        	ldw	x,#0
 190  004a 89            	pushw	x
 191  004b ae000c        	ldw	x,#L75
 192  004e cd0000        	call	_assert_failed
 194  0051 5b04          	addw	sp,#4
 195  0053               L41:
 196                     ; 104   if (NewState != DISABLE)
 198  0053 0d01          	tnz	(OFST+1,sp)
 199  0055 2706          	jreq	L16
 200                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 202  0057 721450c0      	bset	20672,#2
 204  005b 2004          	jra	L36
 205  005d               L16:
 206                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 208  005d 721550c0      	bres	20672,#2
 209  0061               L36:
 210                     ; 114 }
 213  0061 84            	pop	a
 214  0062 81            	ret
 250                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 250                     ; 122 {
 251                     	switch	.text
 252  0063               _CLK_HSECmd:
 254  0063 88            	push	a
 255       00000000      OFST:	set	0
 258                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 260  0064 4d            	tnz	a
 261  0065 2704          	jreq	L22
 262  0067 a101          	cp	a,#1
 263  0069 2603          	jrne	L02
 264  006b               L22:
 265  006b 4f            	clr	a
 266  006c 2010          	jra	L42
 267  006e               L02:
 268  006e ae007c        	ldw	x,#124
 269  0071 89            	pushw	x
 270  0072 ae0000        	ldw	x,#0
 271  0075 89            	pushw	x
 272  0076 ae000c        	ldw	x,#L75
 273  0079 cd0000        	call	_assert_failed
 275  007c 5b04          	addw	sp,#4
 276  007e               L42:
 277                     ; 126   if (NewState != DISABLE)
 279  007e 0d01          	tnz	(OFST+1,sp)
 280  0080 2706          	jreq	L301
 281                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 283  0082 721050c1      	bset	20673,#0
 285  0086 2004          	jra	L501
 286  0088               L301:
 287                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 289  0088 721150c1      	bres	20673,#0
 290  008c               L501:
 291                     ; 136 }
 294  008c 84            	pop	a
 295  008d 81            	ret
 331                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 331                     ; 144 {
 332                     	switch	.text
 333  008e               _CLK_HSICmd:
 335  008e 88            	push	a
 336       00000000      OFST:	set	0
 339                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 341  008f 4d            	tnz	a
 342  0090 2704          	jreq	L23
 343  0092 a101          	cp	a,#1
 344  0094 2603          	jrne	L03
 345  0096               L23:
 346  0096 4f            	clr	a
 347  0097 2010          	jra	L43
 348  0099               L03:
 349  0099 ae0092        	ldw	x,#146
 350  009c 89            	pushw	x
 351  009d ae0000        	ldw	x,#0
 352  00a0 89            	pushw	x
 353  00a1 ae000c        	ldw	x,#L75
 354  00a4 cd0000        	call	_assert_failed
 356  00a7 5b04          	addw	sp,#4
 357  00a9               L43:
 358                     ; 148   if (NewState != DISABLE)
 360  00a9 0d01          	tnz	(OFST+1,sp)
 361  00ab 2706          	jreq	L521
 362                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 364  00ad 721050c0      	bset	20672,#0
 366  00b1 2004          	jra	L721
 367  00b3               L521:
 368                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 370  00b3 721150c0      	bres	20672,#0
 371  00b7               L721:
 372                     ; 158 }
 375  00b7 84            	pop	a
 376  00b8 81            	ret
 412                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 412                     ; 167 {
 413                     	switch	.text
 414  00b9               _CLK_LSICmd:
 416  00b9 88            	push	a
 417       00000000      OFST:	set	0
 420                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 422  00ba 4d            	tnz	a
 423  00bb 2704          	jreq	L24
 424  00bd a101          	cp	a,#1
 425  00bf 2603          	jrne	L04
 426  00c1               L24:
 427  00c1 4f            	clr	a
 428  00c2 2010          	jra	L44
 429  00c4               L04:
 430  00c4 ae00a9        	ldw	x,#169
 431  00c7 89            	pushw	x
 432  00c8 ae0000        	ldw	x,#0
 433  00cb 89            	pushw	x
 434  00cc ae000c        	ldw	x,#L75
 435  00cf cd0000        	call	_assert_failed
 437  00d2 5b04          	addw	sp,#4
 438  00d4               L44:
 439                     ; 171   if (NewState != DISABLE)
 441  00d4 0d01          	tnz	(OFST+1,sp)
 442  00d6 2706          	jreq	L741
 443                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 445  00d8 721650c0      	bset	20672,#3
 447  00dc 2004          	jra	L151
 448  00de               L741:
 449                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 451  00de 721750c0      	bres	20672,#3
 452  00e2               L151:
 453                     ; 181 }
 456  00e2 84            	pop	a
 457  00e3 81            	ret
 493                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 493                     ; 190 {
 494                     	switch	.text
 495  00e4               _CLK_CCOCmd:
 497  00e4 88            	push	a
 498       00000000      OFST:	set	0
 501                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 503  00e5 4d            	tnz	a
 504  00e6 2704          	jreq	L25
 505  00e8 a101          	cp	a,#1
 506  00ea 2603          	jrne	L05
 507  00ec               L25:
 508  00ec 4f            	clr	a
 509  00ed 2010          	jra	L45
 510  00ef               L05:
 511  00ef ae00c0        	ldw	x,#192
 512  00f2 89            	pushw	x
 513  00f3 ae0000        	ldw	x,#0
 514  00f6 89            	pushw	x
 515  00f7 ae000c        	ldw	x,#L75
 516  00fa cd0000        	call	_assert_failed
 518  00fd 5b04          	addw	sp,#4
 519  00ff               L45:
 520                     ; 194   if (NewState != DISABLE)
 522  00ff 0d01          	tnz	(OFST+1,sp)
 523  0101 2706          	jreq	L171
 524                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 526  0103 721050c9      	bset	20681,#0
 528  0107 2004          	jra	L371
 529  0109               L171:
 530                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 532  0109 721150c9      	bres	20681,#0
 533  010d               L371:
 534                     ; 204 }
 537  010d 84            	pop	a
 538  010e 81            	ret
 574                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 574                     ; 214 {
 575                     	switch	.text
 576  010f               _CLK_ClockSwitchCmd:
 578  010f 88            	push	a
 579       00000000      OFST:	set	0
 582                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 584  0110 4d            	tnz	a
 585  0111 2704          	jreq	L26
 586  0113 a101          	cp	a,#1
 587  0115 2603          	jrne	L06
 588  0117               L26:
 589  0117 4f            	clr	a
 590  0118 2010          	jra	L46
 591  011a               L06:
 592  011a ae00d8        	ldw	x,#216
 593  011d 89            	pushw	x
 594  011e ae0000        	ldw	x,#0
 595  0121 89            	pushw	x
 596  0122 ae000c        	ldw	x,#L75
 597  0125 cd0000        	call	_assert_failed
 599  0128 5b04          	addw	sp,#4
 600  012a               L46:
 601                     ; 218   if (NewState != DISABLE )
 603  012a 0d01          	tnz	(OFST+1,sp)
 604  012c 2706          	jreq	L312
 605                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 607  012e 721250c5      	bset	20677,#1
 609  0132 2004          	jra	L512
 610  0134               L312:
 611                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 613  0134 721350c5      	bres	20677,#1
 614  0138               L512:
 615                     ; 228 }
 618  0138 84            	pop	a
 619  0139 81            	ret
 656                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 656                     ; 239 {
 657                     	switch	.text
 658  013a               _CLK_SlowActiveHaltWakeUpCmd:
 660  013a 88            	push	a
 661       00000000      OFST:	set	0
 664                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 666  013b 4d            	tnz	a
 667  013c 2704          	jreq	L27
 668  013e a101          	cp	a,#1
 669  0140 2603          	jrne	L07
 670  0142               L27:
 671  0142 4f            	clr	a
 672  0143 2010          	jra	L47
 673  0145               L07:
 674  0145 ae00f1        	ldw	x,#241
 675  0148 89            	pushw	x
 676  0149 ae0000        	ldw	x,#0
 677  014c 89            	pushw	x
 678  014d ae000c        	ldw	x,#L75
 679  0150 cd0000        	call	_assert_failed
 681  0153 5b04          	addw	sp,#4
 682  0155               L47:
 683                     ; 243   if (NewState != DISABLE)
 685  0155 0d01          	tnz	(OFST+1,sp)
 686  0157 2706          	jreq	L532
 687                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 689  0159 721a50c0      	bset	20672,#5
 691  015d 2004          	jra	L732
 692  015f               L532:
 693                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 695  015f 721b50c0      	bres	20672,#5
 696  0163               L732:
 697                     ; 253 }
 700  0163 84            	pop	a
 701  0164 81            	ret
 861                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 861                     ; 264 {
 862                     	switch	.text
 863  0165               _CLK_PeripheralClockConfig:
 865  0165 89            	pushw	x
 866       00000000      OFST:	set	0
 869                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 871  0166 9f            	ld	a,xl
 872  0167 4d            	tnz	a
 873  0168 2705          	jreq	L201
 874  016a 9f            	ld	a,xl
 875  016b a101          	cp	a,#1
 876  016d 2603          	jrne	L001
 877  016f               L201:
 878  016f 4f            	clr	a
 879  0170 2010          	jra	L401
 880  0172               L001:
 881  0172 ae010a        	ldw	x,#266
 882  0175 89            	pushw	x
 883  0176 ae0000        	ldw	x,#0
 884  0179 89            	pushw	x
 885  017a ae000c        	ldw	x,#L75
 886  017d cd0000        	call	_assert_failed
 888  0180 5b04          	addw	sp,#4
 889  0182               L401:
 890                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 892  0182 0d01          	tnz	(OFST+1,sp)
 893  0184 274e          	jreq	L011
 894  0186 7b01          	ld	a,(OFST+1,sp)
 895  0188 a101          	cp	a,#1
 896  018a 2748          	jreq	L011
 897  018c 7b01          	ld	a,(OFST+1,sp)
 898  018e a103          	cp	a,#3
 899  0190 2742          	jreq	L011
 900  0192 7b01          	ld	a,(OFST+1,sp)
 901  0194 a103          	cp	a,#3
 902  0196 273c          	jreq	L011
 903  0198 7b01          	ld	a,(OFST+1,sp)
 904  019a a102          	cp	a,#2
 905  019c 2736          	jreq	L011
 906  019e 7b01          	ld	a,(OFST+1,sp)
 907  01a0 a104          	cp	a,#4
 908  01a2 2730          	jreq	L011
 909  01a4 7b01          	ld	a,(OFST+1,sp)
 910  01a6 a105          	cp	a,#5
 911  01a8 272a          	jreq	L011
 912  01aa 7b01          	ld	a,(OFST+1,sp)
 913  01ac a105          	cp	a,#5
 914  01ae 2724          	jreq	L011
 915  01b0 7b01          	ld	a,(OFST+1,sp)
 916  01b2 a104          	cp	a,#4
 917  01b4 271e          	jreq	L011
 918  01b6 7b01          	ld	a,(OFST+1,sp)
 919  01b8 a106          	cp	a,#6
 920  01ba 2718          	jreq	L011
 921  01bc 7b01          	ld	a,(OFST+1,sp)
 922  01be a107          	cp	a,#7
 923  01c0 2712          	jreq	L011
 924  01c2 7b01          	ld	a,(OFST+1,sp)
 925  01c4 a117          	cp	a,#23
 926  01c6 270c          	jreq	L011
 927  01c8 7b01          	ld	a,(OFST+1,sp)
 928  01ca a113          	cp	a,#19
 929  01cc 2706          	jreq	L011
 930  01ce 7b01          	ld	a,(OFST+1,sp)
 931  01d0 a112          	cp	a,#18
 932  01d2 2603          	jrne	L601
 933  01d4               L011:
 934  01d4 4f            	clr	a
 935  01d5 2010          	jra	L211
 936  01d7               L601:
 937  01d7 ae010b        	ldw	x,#267
 938  01da 89            	pushw	x
 939  01db ae0000        	ldw	x,#0
 940  01de 89            	pushw	x
 941  01df ae000c        	ldw	x,#L75
 942  01e2 cd0000        	call	_assert_failed
 944  01e5 5b04          	addw	sp,#4
 945  01e7               L211:
 946                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 948  01e7 7b01          	ld	a,(OFST+1,sp)
 949  01e9 a510          	bcp	a,#16
 950  01eb 2633          	jrne	L323
 951                     ; 271     if (NewState != DISABLE)
 953  01ed 0d02          	tnz	(OFST+2,sp)
 954  01ef 2717          	jreq	L523
 955                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 957  01f1 7b01          	ld	a,(OFST+1,sp)
 958  01f3 a40f          	and	a,#15
 959  01f5 5f            	clrw	x
 960  01f6 97            	ld	xl,a
 961  01f7 a601          	ld	a,#1
 962  01f9 5d            	tnzw	x
 963  01fa 2704          	jreq	L411
 964  01fc               L611:
 965  01fc 48            	sll	a
 966  01fd 5a            	decw	x
 967  01fe 26fc          	jrne	L611
 968  0200               L411:
 969  0200 ca50c7        	or	a,20679
 970  0203 c750c7        	ld	20679,a
 972  0206 2049          	jra	L133
 973  0208               L523:
 974                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 976  0208 7b01          	ld	a,(OFST+1,sp)
 977  020a a40f          	and	a,#15
 978  020c 5f            	clrw	x
 979  020d 97            	ld	xl,a
 980  020e a601          	ld	a,#1
 981  0210 5d            	tnzw	x
 982  0211 2704          	jreq	L021
 983  0213               L221:
 984  0213 48            	sll	a
 985  0214 5a            	decw	x
 986  0215 26fc          	jrne	L221
 987  0217               L021:
 988  0217 43            	cpl	a
 989  0218 c450c7        	and	a,20679
 990  021b c750c7        	ld	20679,a
 991  021e 2031          	jra	L133
 992  0220               L323:
 993                     ; 284     if (NewState != DISABLE)
 995  0220 0d02          	tnz	(OFST+2,sp)
 996  0222 2717          	jreq	L333
 997                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 999  0224 7b01          	ld	a,(OFST+1,sp)
1000  0226 a40f          	and	a,#15
1001  0228 5f            	clrw	x
1002  0229 97            	ld	xl,a
1003  022a a601          	ld	a,#1
1004  022c 5d            	tnzw	x
1005  022d 2704          	jreq	L421
1006  022f               L621:
1007  022f 48            	sll	a
1008  0230 5a            	decw	x
1009  0231 26fc          	jrne	L621
1010  0233               L421:
1011  0233 ca50ca        	or	a,20682
1012  0236 c750ca        	ld	20682,a
1014  0239 2016          	jra	L133
1015  023b               L333:
1016                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1018  023b 7b01          	ld	a,(OFST+1,sp)
1019  023d a40f          	and	a,#15
1020  023f 5f            	clrw	x
1021  0240 97            	ld	xl,a
1022  0241 a601          	ld	a,#1
1023  0243 5d            	tnzw	x
1024  0244 2704          	jreq	L031
1025  0246               L231:
1026  0246 48            	sll	a
1027  0247 5a            	decw	x
1028  0248 26fc          	jrne	L231
1029  024a               L031:
1030  024a 43            	cpl	a
1031  024b c450ca        	and	a,20682
1032  024e c750ca        	ld	20682,a
1033  0251               L133:
1034                     ; 295 }
1037  0251 85            	popw	x
1038  0252 81            	ret
1225                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1225                     ; 310 {
1226                     	switch	.text
1227  0253               _CLK_ClockSwitchConfig:
1229  0253 89            	pushw	x
1230  0254 5204          	subw	sp,#4
1231       00000004      OFST:	set	4
1234                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1236  0256 aeffff        	ldw	x,#65535
1237  0259 1f03          	ldw	(OFST-1,sp),x
1239                     ; 313   ErrorStatus Swif = ERROR;
1241                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1243  025b 7b06          	ld	a,(OFST+2,sp)
1244  025d a1e1          	cp	a,#225
1245  025f 270c          	jreq	L041
1246  0261 7b06          	ld	a,(OFST+2,sp)
1247  0263 a1d2          	cp	a,#210
1248  0265 2706          	jreq	L041
1249  0267 7b06          	ld	a,(OFST+2,sp)
1250  0269 a1b4          	cp	a,#180
1251  026b 2603          	jrne	L631
1252  026d               L041:
1253  026d 4f            	clr	a
1254  026e 2010          	jra	L241
1255  0270               L631:
1256  0270 ae013c        	ldw	x,#316
1257  0273 89            	pushw	x
1258  0274 ae0000        	ldw	x,#0
1259  0277 89            	pushw	x
1260  0278 ae000c        	ldw	x,#L75
1261  027b cd0000        	call	_assert_failed
1263  027e 5b04          	addw	sp,#4
1264  0280               L241:
1265                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1267  0280 0d05          	tnz	(OFST+1,sp)
1268  0282 2706          	jreq	L641
1269  0284 7b05          	ld	a,(OFST+1,sp)
1270  0286 a101          	cp	a,#1
1271  0288 2603          	jrne	L441
1272  028a               L641:
1273  028a 4f            	clr	a
1274  028b 2010          	jra	L051
1275  028d               L441:
1276  028d ae013d        	ldw	x,#317
1277  0290 89            	pushw	x
1278  0291 ae0000        	ldw	x,#0
1279  0294 89            	pushw	x
1280  0295 ae000c        	ldw	x,#L75
1281  0298 cd0000        	call	_assert_failed
1283  029b 5b04          	addw	sp,#4
1284  029d               L051:
1285                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1287  029d 0d09          	tnz	(OFST+5,sp)
1288  029f 2706          	jreq	L451
1289  02a1 7b09          	ld	a,(OFST+5,sp)
1290  02a3 a101          	cp	a,#1
1291  02a5 2603          	jrne	L251
1292  02a7               L451:
1293  02a7 4f            	clr	a
1294  02a8 2010          	jra	L651
1295  02aa               L251:
1296  02aa ae013e        	ldw	x,#318
1297  02ad 89            	pushw	x
1298  02ae ae0000        	ldw	x,#0
1299  02b1 89            	pushw	x
1300  02b2 ae000c        	ldw	x,#L75
1301  02b5 cd0000        	call	_assert_failed
1303  02b8 5b04          	addw	sp,#4
1304  02ba               L651:
1305                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1307  02ba 0d0a          	tnz	(OFST+6,sp)
1308  02bc 2706          	jreq	L261
1309  02be 7b0a          	ld	a,(OFST+6,sp)
1310  02c0 a101          	cp	a,#1
1311  02c2 2603          	jrne	L061
1312  02c4               L261:
1313  02c4 4f            	clr	a
1314  02c5 2010          	jra	L461
1315  02c7               L061:
1316  02c7 ae013f        	ldw	x,#319
1317  02ca 89            	pushw	x
1318  02cb ae0000        	ldw	x,#0
1319  02ce 89            	pushw	x
1320  02cf ae000c        	ldw	x,#L75
1321  02d2 cd0000        	call	_assert_failed
1323  02d5 5b04          	addw	sp,#4
1324  02d7               L461:
1325                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1327  02d7 c650c3        	ld	a,20675
1328  02da 6b01          	ld	(OFST-3,sp),a
1330                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1332  02dc 7b05          	ld	a,(OFST+1,sp)
1333  02de a101          	cp	a,#1
1334  02e0 264b          	jrne	L544
1335                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1337  02e2 721250c5      	bset	20677,#1
1338                     ; 331     if (ITState != DISABLE)
1340  02e6 0d09          	tnz	(OFST+5,sp)
1341  02e8 2706          	jreq	L744
1342                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1344  02ea 721450c5      	bset	20677,#2
1346  02ee 2004          	jra	L154
1347  02f0               L744:
1348                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1350  02f0 721550c5      	bres	20677,#2
1351  02f4               L154:
1352                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1354  02f4 7b06          	ld	a,(OFST+2,sp)
1355  02f6 c750c4        	ld	20676,a
1357  02f9 2007          	jra	L754
1358  02fb               L354:
1359                     ; 346       DownCounter--;
1361  02fb 1e03          	ldw	x,(OFST-1,sp)
1362  02fd 1d0001        	subw	x,#1
1363  0300 1f03          	ldw	(OFST-1,sp),x
1365  0302               L754:
1366                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1368  0302 c650c5        	ld	a,20677
1369  0305 a501          	bcp	a,#1
1370  0307 2704          	jreq	L364
1372  0309 1e03          	ldw	x,(OFST-1,sp)
1373  030b 26ee          	jrne	L354
1374  030d               L364:
1375                     ; 349     if(DownCounter != 0)
1377  030d 1e03          	ldw	x,(OFST-1,sp)
1378  030f 2706          	jreq	L564
1379                     ; 351       Swif = SUCCESS;
1381  0311 a601          	ld	a,#1
1382  0313 6b02          	ld	(OFST-2,sp),a
1385  0315 2002          	jra	L174
1386  0317               L564:
1387                     ; 355       Swif = ERROR;
1389  0317 0f02          	clr	(OFST-2,sp)
1391  0319               L174:
1392                     ; 390   if(Swif != ERROR)
1394  0319 0d02          	tnz	(OFST-2,sp)
1395  031b 2767          	jreq	L515
1396                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1398  031d 0d0a          	tnz	(OFST+6,sp)
1399  031f 2645          	jrne	L715
1401  0321 7b01          	ld	a,(OFST-3,sp)
1402  0323 a1e1          	cp	a,#225
1403  0325 263f          	jrne	L715
1404                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1406  0327 721150c0      	bres	20672,#0
1408  032b 2057          	jra	L515
1409  032d               L544:
1410                     ; 361     if (ITState != DISABLE)
1412  032d 0d09          	tnz	(OFST+5,sp)
1413  032f 2706          	jreq	L374
1414                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1416  0331 721450c5      	bset	20677,#2
1418  0335 2004          	jra	L574
1419  0337               L374:
1420                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1422  0337 721550c5      	bres	20677,#2
1423  033b               L574:
1424                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1426  033b 7b06          	ld	a,(OFST+2,sp)
1427  033d c750c4        	ld	20676,a
1429  0340 2007          	jra	L305
1430  0342               L774:
1431                     ; 376       DownCounter--;
1433  0342 1e03          	ldw	x,(OFST-1,sp)
1434  0344 1d0001        	subw	x,#1
1435  0347 1f03          	ldw	(OFST-1,sp),x
1437  0349               L305:
1438                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1440  0349 c650c5        	ld	a,20677
1441  034c a508          	bcp	a,#8
1442  034e 2704          	jreq	L705
1444  0350 1e03          	ldw	x,(OFST-1,sp)
1445  0352 26ee          	jrne	L774
1446  0354               L705:
1447                     ; 379     if(DownCounter != 0)
1449  0354 1e03          	ldw	x,(OFST-1,sp)
1450  0356 270a          	jreq	L115
1451                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1453  0358 721250c5      	bset	20677,#1
1454                     ; 383       Swif = SUCCESS;
1456  035c a601          	ld	a,#1
1457  035e 6b02          	ld	(OFST-2,sp),a
1460  0360 20b7          	jra	L174
1461  0362               L115:
1462                     ; 387       Swif = ERROR;
1464  0362 0f02          	clr	(OFST-2,sp)
1466  0364 20b3          	jra	L174
1467  0366               L715:
1468                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1470  0366 0d0a          	tnz	(OFST+6,sp)
1471  0368 260c          	jrne	L325
1473  036a 7b01          	ld	a,(OFST-3,sp)
1474  036c a1d2          	cp	a,#210
1475  036e 2606          	jrne	L325
1476                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1478  0370 721750c0      	bres	20672,#3
1480  0374 200e          	jra	L515
1481  0376               L325:
1482                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1484  0376 0d0a          	tnz	(OFST+6,sp)
1485  0378 260a          	jrne	L515
1487  037a 7b01          	ld	a,(OFST-3,sp)
1488  037c a1b4          	cp	a,#180
1489  037e 2604          	jrne	L515
1490                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1492  0380 721150c1      	bres	20673,#0
1493  0384               L515:
1494                     ; 406   return(Swif);
1496  0384 7b02          	ld	a,(OFST-2,sp)
1499  0386 5b06          	addw	sp,#6
1500  0388 81            	ret
1639                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1639                     ; 416 {
1640                     	switch	.text
1641  0389               _CLK_HSIPrescalerConfig:
1643  0389 88            	push	a
1644       00000000      OFST:	set	0
1647                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1649  038a 4d            	tnz	a
1650  038b 270c          	jreq	L271
1651  038d a108          	cp	a,#8
1652  038f 2708          	jreq	L271
1653  0391 a110          	cp	a,#16
1654  0393 2704          	jreq	L271
1655  0395 a118          	cp	a,#24
1656  0397 2603          	jrne	L071
1657  0399               L271:
1658  0399 4f            	clr	a
1659  039a 2010          	jra	L471
1660  039c               L071:
1661  039c ae01a2        	ldw	x,#418
1662  039f 89            	pushw	x
1663  03a0 ae0000        	ldw	x,#0
1664  03a3 89            	pushw	x
1665  03a4 ae000c        	ldw	x,#L75
1666  03a7 cd0000        	call	_assert_failed
1668  03aa 5b04          	addw	sp,#4
1669  03ac               L471:
1670                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1672  03ac c650c6        	ld	a,20678
1673  03af a4e7          	and	a,#231
1674  03b1 c750c6        	ld	20678,a
1675                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1677  03b4 c650c6        	ld	a,20678
1678  03b7 1a01          	or	a,(OFST+1,sp)
1679  03b9 c750c6        	ld	20678,a
1680                     ; 425 }
1683  03bc 84            	pop	a
1684  03bd 81            	ret
1820                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1820                     ; 437 {
1821                     	switch	.text
1822  03be               _CLK_CCOConfig:
1824  03be 88            	push	a
1825       00000000      OFST:	set	0
1828                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1830  03bf 4d            	tnz	a
1831  03c0 2730          	jreq	L202
1832  03c2 a104          	cp	a,#4
1833  03c4 272c          	jreq	L202
1834  03c6 a102          	cp	a,#2
1835  03c8 2728          	jreq	L202
1836  03ca a108          	cp	a,#8
1837  03cc 2724          	jreq	L202
1838  03ce a10a          	cp	a,#10
1839  03d0 2720          	jreq	L202
1840  03d2 a10c          	cp	a,#12
1841  03d4 271c          	jreq	L202
1842  03d6 a10e          	cp	a,#14
1843  03d8 2718          	jreq	L202
1844  03da a110          	cp	a,#16
1845  03dc 2714          	jreq	L202
1846  03de a112          	cp	a,#18
1847  03e0 2710          	jreq	L202
1848  03e2 a114          	cp	a,#20
1849  03e4 270c          	jreq	L202
1850  03e6 a116          	cp	a,#22
1851  03e8 2708          	jreq	L202
1852  03ea a118          	cp	a,#24
1853  03ec 2704          	jreq	L202
1854  03ee a11a          	cp	a,#26
1855  03f0 2603          	jrne	L002
1856  03f2               L202:
1857  03f2 4f            	clr	a
1858  03f3 2010          	jra	L402
1859  03f5               L002:
1860  03f5 ae01b7        	ldw	x,#439
1861  03f8 89            	pushw	x
1862  03f9 ae0000        	ldw	x,#0
1863  03fc 89            	pushw	x
1864  03fd ae000c        	ldw	x,#L75
1865  0400 cd0000        	call	_assert_failed
1867  0403 5b04          	addw	sp,#4
1868  0405               L402:
1869                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1871  0405 c650c9        	ld	a,20681
1872  0408 a4e1          	and	a,#225
1873  040a c750c9        	ld	20681,a
1874                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1876  040d c650c9        	ld	a,20681
1877  0410 1a01          	or	a,(OFST+1,sp)
1878  0412 c750c9        	ld	20681,a
1879                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1881  0415 721050c9      	bset	20681,#0
1882                     ; 449 }
1885  0419 84            	pop	a
1886  041a 81            	ret
1952                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1952                     ; 460 {
1953                     	switch	.text
1954  041b               _CLK_ITConfig:
1956  041b 89            	pushw	x
1957       00000000      OFST:	set	0
1960                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1962  041c 9f            	ld	a,xl
1963  041d 4d            	tnz	a
1964  041e 2705          	jreq	L212
1965  0420 9f            	ld	a,xl
1966  0421 a101          	cp	a,#1
1967  0423 2603          	jrne	L012
1968  0425               L212:
1969  0425 4f            	clr	a
1970  0426 2010          	jra	L412
1971  0428               L012:
1972  0428 ae01ce        	ldw	x,#462
1973  042b 89            	pushw	x
1974  042c ae0000        	ldw	x,#0
1975  042f 89            	pushw	x
1976  0430 ae000c        	ldw	x,#L75
1977  0433 cd0000        	call	_assert_failed
1979  0436 5b04          	addw	sp,#4
1980  0438               L412:
1981                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1983  0438 7b01          	ld	a,(OFST+1,sp)
1984  043a a10c          	cp	a,#12
1985  043c 2706          	jreq	L022
1986  043e 7b01          	ld	a,(OFST+1,sp)
1987  0440 a11c          	cp	a,#28
1988  0442 2603          	jrne	L612
1989  0444               L022:
1990  0444 4f            	clr	a
1991  0445 2010          	jra	L222
1992  0447               L612:
1993  0447 ae01cf        	ldw	x,#463
1994  044a 89            	pushw	x
1995  044b ae0000        	ldw	x,#0
1996  044e 89            	pushw	x
1997  044f ae000c        	ldw	x,#L75
1998  0452 cd0000        	call	_assert_failed
2000  0455 5b04          	addw	sp,#4
2001  0457               L222:
2002                     ; 465   if (NewState != DISABLE)
2004  0457 0d02          	tnz	(OFST+2,sp)
2005  0459 271a          	jreq	L527
2006                     ; 467     switch (CLK_IT)
2008  045b 7b01          	ld	a,(OFST+1,sp)
2010                     ; 475     default:
2010                     ; 476       break;
2011  045d a00c          	sub	a,#12
2012  045f 270a          	jreq	L166
2013  0461 a010          	sub	a,#16
2014  0463 2624          	jrne	L337
2015                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
2015                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
2017  0465 721450c5      	bset	20677,#2
2018                     ; 471       break;
2020  0469 201e          	jra	L337
2021  046b               L166:
2022                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
2022                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
2024  046b 721450c8      	bset	20680,#2
2025                     ; 474       break;
2027  046f 2018          	jra	L337
2028  0471               L366:
2029                     ; 475     default:
2029                     ; 476       break;
2031  0471 2016          	jra	L337
2032  0473               L137:
2034  0473 2014          	jra	L337
2035  0475               L527:
2036                     ; 481     switch (CLK_IT)
2038  0475 7b01          	ld	a,(OFST+1,sp)
2040                     ; 489     default:
2040                     ; 490       break;
2041  0477 a00c          	sub	a,#12
2042  0479 270a          	jreq	L766
2043  047b a010          	sub	a,#16
2044  047d 260a          	jrne	L337
2045                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
2045                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2047  047f 721550c5      	bres	20677,#2
2048                     ; 485       break;
2050  0483 2004          	jra	L337
2051  0485               L766:
2052                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
2052                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2054  0485 721550c8      	bres	20680,#2
2055                     ; 488       break;
2056  0489               L337:
2057                     ; 493 }
2060  0489 85            	popw	x
2061  048a 81            	ret
2062  048b               L176:
2063                     ; 489     default:
2063                     ; 490       break;
2065  048b 20fc          	jra	L337
2066  048d               L737:
2067  048d 20fa          	jra	L337
2103                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
2103                     ; 501 {
2104                     	switch	.text
2105  048f               _CLK_SYSCLKConfig:
2107  048f 88            	push	a
2108       00000000      OFST:	set	0
2111                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
2113  0490 4d            	tnz	a
2114  0491 272c          	jreq	L032
2115  0493 a108          	cp	a,#8
2116  0495 2728          	jreq	L032
2117  0497 a110          	cp	a,#16
2118  0499 2724          	jreq	L032
2119  049b a118          	cp	a,#24
2120  049d 2720          	jreq	L032
2121  049f a180          	cp	a,#128
2122  04a1 271c          	jreq	L032
2123  04a3 a181          	cp	a,#129
2124  04a5 2718          	jreq	L032
2125  04a7 a182          	cp	a,#130
2126  04a9 2714          	jreq	L032
2127  04ab a183          	cp	a,#131
2128  04ad 2710          	jreq	L032
2129  04af a184          	cp	a,#132
2130  04b1 270c          	jreq	L032
2131  04b3 a185          	cp	a,#133
2132  04b5 2708          	jreq	L032
2133  04b7 a186          	cp	a,#134
2134  04b9 2704          	jreq	L032
2135  04bb a187          	cp	a,#135
2136  04bd 2603          	jrne	L622
2137  04bf               L032:
2138  04bf 4f            	clr	a
2139  04c0 2010          	jra	L232
2140  04c2               L622:
2141  04c2 ae01f7        	ldw	x,#503
2142  04c5 89            	pushw	x
2143  04c6 ae0000        	ldw	x,#0
2144  04c9 89            	pushw	x
2145  04ca ae000c        	ldw	x,#L75
2146  04cd cd0000        	call	_assert_failed
2148  04d0 5b04          	addw	sp,#4
2149  04d2               L232:
2150                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2152  04d2 7b01          	ld	a,(OFST+1,sp)
2153  04d4 a580          	bcp	a,#128
2154  04d6 2614          	jrne	L757
2155                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2157  04d8 c650c6        	ld	a,20678
2158  04db a4e7          	and	a,#231
2159  04dd c750c6        	ld	20678,a
2160                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2162  04e0 7b01          	ld	a,(OFST+1,sp)
2163  04e2 a418          	and	a,#24
2164  04e4 ca50c6        	or	a,20678
2165  04e7 c750c6        	ld	20678,a
2167  04ea 2012          	jra	L167
2168  04ec               L757:
2169                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2171  04ec c650c6        	ld	a,20678
2172  04ef a4f8          	and	a,#248
2173  04f1 c750c6        	ld	20678,a
2174                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2176  04f4 7b01          	ld	a,(OFST+1,sp)
2177  04f6 a407          	and	a,#7
2178  04f8 ca50c6        	or	a,20678
2179  04fb c750c6        	ld	20678,a
2180  04fe               L167:
2181                     ; 515 }
2184  04fe 84            	pop	a
2185  04ff 81            	ret
2242                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2242                     ; 524 {
2243                     	switch	.text
2244  0500               _CLK_SWIMConfig:
2246  0500 88            	push	a
2247       00000000      OFST:	set	0
2250                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2252  0501 4d            	tnz	a
2253  0502 2704          	jreq	L042
2254  0504 a101          	cp	a,#1
2255  0506 2603          	jrne	L632
2256  0508               L042:
2257  0508 4f            	clr	a
2258  0509 2010          	jra	L242
2259  050b               L632:
2260  050b ae020e        	ldw	x,#526
2261  050e 89            	pushw	x
2262  050f ae0000        	ldw	x,#0
2263  0512 89            	pushw	x
2264  0513 ae000c        	ldw	x,#L75
2265  0516 cd0000        	call	_assert_failed
2267  0519 5b04          	addw	sp,#4
2268  051b               L242:
2269                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2271  051b 0d01          	tnz	(OFST+1,sp)
2272  051d 2706          	jreq	L1101
2273                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2275  051f 721050cd      	bset	20685,#0
2277  0523 2004          	jra	L3101
2278  0525               L1101:
2279                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2281  0525 721150cd      	bres	20685,#0
2282  0529               L3101:
2283                     ; 538 }
2286  0529 84            	pop	a
2287  052a 81            	ret
2311                     ; 547 void CLK_ClockSecuritySystemEnable(void)
2311                     ; 548 {
2312                     	switch	.text
2313  052b               _CLK_ClockSecuritySystemEnable:
2317                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
2319  052b 721050c8      	bset	20680,#0
2320                     ; 551 }
2323  052f 81            	ret
2348                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2348                     ; 560 {
2349                     	switch	.text
2350  0530               _CLK_GetSYSCLKSource:
2354                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
2356  0530 c650c3        	ld	a,20675
2359  0533 81            	ret
2416                     ; 569 uint32_t CLK_GetClockFreq(void)
2416                     ; 570 {
2417                     	switch	.text
2418  0534               _CLK_GetClockFreq:
2420  0534 5209          	subw	sp,#9
2421       00000009      OFST:	set	9
2424                     ; 571   uint32_t clockfrequency = 0;
2426                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2428                     ; 573   uint8_t tmp = 0, presc = 0;
2432                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2434  0536 c650c3        	ld	a,20675
2435  0539 6b09          	ld	(OFST+0,sp),a
2437                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2439  053b 7b09          	ld	a,(OFST+0,sp)
2440  053d a1e1          	cp	a,#225
2441  053f 2641          	jrne	L1601
2442                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2444  0541 c650c6        	ld	a,20678
2445  0544 a418          	and	a,#24
2446  0546 6b09          	ld	(OFST+0,sp),a
2448                     ; 581     tmp = (uint8_t)(tmp >> 3);
2450  0548 0409          	srl	(OFST+0,sp)
2451  054a 0409          	srl	(OFST+0,sp)
2452  054c 0409          	srl	(OFST+0,sp)
2454                     ; 582     presc = HSIDivFactor[tmp];
2456  054e 7b09          	ld	a,(OFST+0,sp)
2457  0550 5f            	clrw	x
2458  0551 97            	ld	xl,a
2459  0552 d60000        	ld	a,(_HSIDivFactor,x)
2460  0555 6b09          	ld	(OFST+0,sp),a
2462                     ; 583     clockfrequency = HSI_VALUE / presc;
2464  0557 7b09          	ld	a,(OFST+0,sp)
2465  0559 b703          	ld	c_lreg+3,a
2466  055b 3f02          	clr	c_lreg+2
2467  055d 3f01          	clr	c_lreg+1
2468  055f 3f00          	clr	c_lreg
2469  0561 96            	ldw	x,sp
2470  0562 1c0001        	addw	x,#OFST-8
2471  0565 cd0000        	call	c_rtol
2474  0568 ae2400        	ldw	x,#9216
2475  056b bf02          	ldw	c_lreg+2,x
2476  056d ae00f4        	ldw	x,#244
2477  0570 bf00          	ldw	c_lreg,x
2478  0572 96            	ldw	x,sp
2479  0573 1c0001        	addw	x,#OFST-8
2480  0576 cd0000        	call	c_ludv
2482  0579 96            	ldw	x,sp
2483  057a 1c0005        	addw	x,#OFST-4
2484  057d cd0000        	call	c_rtol
2488  0580 201c          	jra	L3601
2489  0582               L1601:
2490                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2492  0582 7b09          	ld	a,(OFST+0,sp)
2493  0584 a1d2          	cp	a,#210
2494  0586 260c          	jrne	L5601
2495                     ; 587     clockfrequency = LSI_VALUE;
2497  0588 aef400        	ldw	x,#62464
2498  058b 1f07          	ldw	(OFST-2,sp),x
2499  058d ae0001        	ldw	x,#1
2500  0590 1f05          	ldw	(OFST-4,sp),x
2503  0592 200a          	jra	L3601
2504  0594               L5601:
2505                     ; 591     clockfrequency = HSE_VALUE;
2507  0594 ae3600        	ldw	x,#13824
2508  0597 1f07          	ldw	(OFST-2,sp),x
2509  0599 ae016e        	ldw	x,#366
2510  059c 1f05          	ldw	(OFST-4,sp),x
2512  059e               L3601:
2513                     ; 594   return((uint32_t)clockfrequency);
2515  059e 96            	ldw	x,sp
2516  059f 1c0005        	addw	x,#OFST-4
2517  05a2 cd0000        	call	c_ltor
2521  05a5 5b09          	addw	sp,#9
2522  05a7 81            	ret
2622                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2622                     ; 605 {
2623                     	switch	.text
2624  05a8               _CLK_AdjustHSICalibrationValue:
2626  05a8 88            	push	a
2627       00000000      OFST:	set	0
2630                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2632  05a9 4d            	tnz	a
2633  05aa 271c          	jreq	L652
2634  05ac a101          	cp	a,#1
2635  05ae 2718          	jreq	L652
2636  05b0 a102          	cp	a,#2
2637  05b2 2714          	jreq	L652
2638  05b4 a103          	cp	a,#3
2639  05b6 2710          	jreq	L652
2640  05b8 a104          	cp	a,#4
2641  05ba 270c          	jreq	L652
2642  05bc a105          	cp	a,#5
2643  05be 2708          	jreq	L652
2644  05c0 a106          	cp	a,#6
2645  05c2 2704          	jreq	L652
2646  05c4 a107          	cp	a,#7
2647  05c6 2603          	jrne	L452
2648  05c8               L652:
2649  05c8 4f            	clr	a
2650  05c9 2010          	jra	L062
2651  05cb               L452:
2652  05cb ae025f        	ldw	x,#607
2653  05ce 89            	pushw	x
2654  05cf ae0000        	ldw	x,#0
2655  05d2 89            	pushw	x
2656  05d3 ae000c        	ldw	x,#L75
2657  05d6 cd0000        	call	_assert_failed
2659  05d9 5b04          	addw	sp,#4
2660  05db               L062:
2661                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2663  05db c650cc        	ld	a,20684
2664  05de a4f8          	and	a,#248
2665  05e0 1a01          	or	a,(OFST+1,sp)
2666  05e2 c750cc        	ld	20684,a
2667                     ; 611 }
2670  05e5 84            	pop	a
2671  05e6 81            	ret
2695                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2695                     ; 623 {
2696                     	switch	.text
2697  05e7               _CLK_SYSCLKEmergencyClear:
2701                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2703  05e7 721150c5      	bres	20677,#0
2704                     ; 625 }
2707  05eb 81            	ret
2857                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2857                     ; 635 {
2858                     	switch	.text
2859  05ec               _CLK_GetFlagStatus:
2861  05ec 89            	pushw	x
2862  05ed 5203          	subw	sp,#3
2863       00000003      OFST:	set	3
2866                     ; 636   uint16_t statusreg = 0;
2868                     ; 637   uint8_t tmpreg = 0;
2870                     ; 638   FlagStatus bitstatus = RESET;
2872                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2874  05ef a30110        	cpw	x,#272
2875  05f2 2728          	jreq	L072
2876  05f4 a30102        	cpw	x,#258
2877  05f7 2723          	jreq	L072
2878  05f9 a30202        	cpw	x,#514
2879  05fc 271e          	jreq	L072
2880  05fe a30308        	cpw	x,#776
2881  0601 2719          	jreq	L072
2882  0603 a30301        	cpw	x,#769
2883  0606 2714          	jreq	L072
2884  0608 a30408        	cpw	x,#1032
2885  060b 270f          	jreq	L072
2886  060d a30402        	cpw	x,#1026
2887  0610 270a          	jreq	L072
2888  0612 a30504        	cpw	x,#1284
2889  0615 2705          	jreq	L072
2890  0617 a30502        	cpw	x,#1282
2891  061a 2603          	jrne	L662
2892  061c               L072:
2893  061c 4f            	clr	a
2894  061d 2010          	jra	L272
2895  061f               L662:
2896  061f ae0281        	ldw	x,#641
2897  0622 89            	pushw	x
2898  0623 ae0000        	ldw	x,#0
2899  0626 89            	pushw	x
2900  0627 ae000c        	ldw	x,#L75
2901  062a cd0000        	call	_assert_failed
2903  062d 5b04          	addw	sp,#4
2904  062f               L272:
2905                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2907  062f 7b04          	ld	a,(OFST+1,sp)
2908  0631 97            	ld	xl,a
2909  0632 7b05          	ld	a,(OFST+2,sp)
2910  0634 9f            	ld	a,xl
2911  0635 a4ff          	and	a,#255
2912  0637 97            	ld	xl,a
2913  0638 4f            	clr	a
2914  0639 02            	rlwa	x,a
2915  063a 1f01          	ldw	(OFST-2,sp),x
2916  063c 01            	rrwa	x,a
2918                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2920  063d 1e01          	ldw	x,(OFST-2,sp)
2921  063f a30100        	cpw	x,#256
2922  0642 2607          	jrne	L7221
2923                     ; 649     tmpreg = CLK->ICKR;
2925  0644 c650c0        	ld	a,20672
2926  0647 6b03          	ld	(OFST+0,sp),a
2929  0649 202f          	jra	L1321
2930  064b               L7221:
2931                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2933  064b 1e01          	ldw	x,(OFST-2,sp)
2934  064d a30200        	cpw	x,#512
2935  0650 2607          	jrne	L3321
2936                     ; 653     tmpreg = CLK->ECKR;
2938  0652 c650c1        	ld	a,20673
2939  0655 6b03          	ld	(OFST+0,sp),a
2942  0657 2021          	jra	L1321
2943  0659               L3321:
2944                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2946  0659 1e01          	ldw	x,(OFST-2,sp)
2947  065b a30300        	cpw	x,#768
2948  065e 2607          	jrne	L7321
2949                     ; 657     tmpreg = CLK->SWCR;
2951  0660 c650c5        	ld	a,20677
2952  0663 6b03          	ld	(OFST+0,sp),a
2955  0665 2013          	jra	L1321
2956  0667               L7321:
2957                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2959  0667 1e01          	ldw	x,(OFST-2,sp)
2960  0669 a30400        	cpw	x,#1024
2961  066c 2607          	jrne	L3421
2962                     ; 661     tmpreg = CLK->CSSR;
2964  066e c650c8        	ld	a,20680
2965  0671 6b03          	ld	(OFST+0,sp),a
2968  0673 2005          	jra	L1321
2969  0675               L3421:
2970                     ; 665     tmpreg = CLK->CCOR;
2972  0675 c650c9        	ld	a,20681
2973  0678 6b03          	ld	(OFST+0,sp),a
2975  067a               L1321:
2976                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2978  067a 7b05          	ld	a,(OFST+2,sp)
2979  067c 1503          	bcp	a,(OFST+0,sp)
2980  067e 2706          	jreq	L7421
2981                     ; 670     bitstatus = SET;
2983  0680 a601          	ld	a,#1
2984  0682 6b03          	ld	(OFST+0,sp),a
2987  0684 2002          	jra	L1521
2988  0686               L7421:
2989                     ; 674     bitstatus = RESET;
2991  0686 0f03          	clr	(OFST+0,sp)
2993  0688               L1521:
2994                     ; 678   return((FlagStatus)bitstatus);
2996  0688 7b03          	ld	a,(OFST+0,sp)
2999  068a 5b05          	addw	sp,#5
3000  068c 81            	ret
3047                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
3047                     ; 688 {
3048                     	switch	.text
3049  068d               _CLK_GetITStatus:
3051  068d 88            	push	a
3052  068e 88            	push	a
3053       00000001      OFST:	set	1
3056                     ; 689   ITStatus bitstatus = RESET;
3058                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
3060  068f a10c          	cp	a,#12
3061  0691 2704          	jreq	L003
3062  0693 a11c          	cp	a,#28
3063  0695 2603          	jrne	L672
3064  0697               L003:
3065  0697 4f            	clr	a
3066  0698 2010          	jra	L203
3067  069a               L672:
3068  069a ae02b4        	ldw	x,#692
3069  069d 89            	pushw	x
3070  069e ae0000        	ldw	x,#0
3071  06a1 89            	pushw	x
3072  06a2 ae000c        	ldw	x,#L75
3073  06a5 cd0000        	call	_assert_failed
3075  06a8 5b04          	addw	sp,#4
3076  06aa               L203:
3077                     ; 694   if (CLK_IT == CLK_IT_SWIF)
3079  06aa 7b02          	ld	a,(OFST+1,sp)
3080  06ac a11c          	cp	a,#28
3081  06ae 2613          	jrne	L5721
3082                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3084  06b0 c650c5        	ld	a,20677
3085  06b3 1402          	and	a,(OFST+1,sp)
3086  06b5 a10c          	cp	a,#12
3087  06b7 2606          	jrne	L7721
3088                     ; 699       bitstatus = SET;
3090  06b9 a601          	ld	a,#1
3091  06bb 6b01          	ld	(OFST+0,sp),a
3094  06bd 2015          	jra	L3031
3095  06bf               L7721:
3096                     ; 703       bitstatus = RESET;
3098  06bf 0f01          	clr	(OFST+0,sp)
3100  06c1 2011          	jra	L3031
3101  06c3               L5721:
3102                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3104  06c3 c650c8        	ld	a,20680
3105  06c6 1402          	and	a,(OFST+1,sp)
3106  06c8 a10c          	cp	a,#12
3107  06ca 2606          	jrne	L5031
3108                     ; 711       bitstatus = SET;
3110  06cc a601          	ld	a,#1
3111  06ce 6b01          	ld	(OFST+0,sp),a
3114  06d0 2002          	jra	L3031
3115  06d2               L5031:
3116                     ; 715       bitstatus = RESET;
3118  06d2 0f01          	clr	(OFST+0,sp)
3120  06d4               L3031:
3121                     ; 720   return bitstatus;
3123  06d4 7b01          	ld	a,(OFST+0,sp)
3126  06d6 85            	popw	x
3127  06d7 81            	ret
3164                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
3164                     ; 730 {
3165                     	switch	.text
3166  06d8               _CLK_ClearITPendingBit:
3168  06d8 88            	push	a
3169       00000000      OFST:	set	0
3172                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
3174  06d9 a10c          	cp	a,#12
3175  06db 2704          	jreq	L013
3176  06dd a11c          	cp	a,#28
3177  06df 2603          	jrne	L603
3178  06e1               L013:
3179  06e1 4f            	clr	a
3180  06e2 2010          	jra	L213
3181  06e4               L603:
3182  06e4 ae02dc        	ldw	x,#732
3183  06e7 89            	pushw	x
3184  06e8 ae0000        	ldw	x,#0
3185  06eb 89            	pushw	x
3186  06ec ae000c        	ldw	x,#L75
3187  06ef cd0000        	call	_assert_failed
3189  06f2 5b04          	addw	sp,#4
3190  06f4               L213:
3191                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
3193  06f4 7b01          	ld	a,(OFST+1,sp)
3194  06f6 a10c          	cp	a,#12
3195  06f8 2606          	jrne	L7231
3196                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3198  06fa 721750c8      	bres	20680,#3
3200  06fe 2004          	jra	L1331
3201  0700               L7231:
3202                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3204  0700 721750c5      	bres	20677,#3
3205  0704               L1331:
3206                     ; 745 }
3209  0704 84            	pop	a
3210  0705 81            	ret
3245                     	xdef	_CLKPrescTable
3246                     	xdef	_HSIDivFactor
3247                     	xdef	_CLK_ClearITPendingBit
3248                     	xdef	_CLK_GetITStatus
3249                     	xdef	_CLK_GetFlagStatus
3250                     	xdef	_CLK_GetSYSCLKSource
3251                     	xdef	_CLK_GetClockFreq
3252                     	xdef	_CLK_AdjustHSICalibrationValue
3253                     	xdef	_CLK_SYSCLKEmergencyClear
3254                     	xdef	_CLK_ClockSecuritySystemEnable
3255                     	xdef	_CLK_SWIMConfig
3256                     	xdef	_CLK_SYSCLKConfig
3257                     	xdef	_CLK_ITConfig
3258                     	xdef	_CLK_CCOConfig
3259                     	xdef	_CLK_HSIPrescalerConfig
3260                     	xdef	_CLK_ClockSwitchConfig
3261                     	xdef	_CLK_PeripheralClockConfig
3262                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3263                     	xdef	_CLK_FastHaltWakeUpCmd
3264                     	xdef	_CLK_ClockSwitchCmd
3265                     	xdef	_CLK_CCOCmd
3266                     	xdef	_CLK_LSICmd
3267                     	xdef	_CLK_HSICmd
3268                     	xdef	_CLK_HSECmd
3269                     	xdef	_CLK_DeInit
3270                     	xref	_assert_failed
3271                     	switch	.const
3272  000c               L75:
3273  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\driver\st"
3274  001e 6d38735f7374  	dc.b	"m8s_stdperiph_lib\"
3275  0030 6c6962726172  	dc.b	"libraries\stm8s_st"
3276  0042 647065726970  	dc.b	"dperiph_driver\src"
3277  0054 5c73746d3873  	dc.b	"\stm8s_clk.c",0
3278                     	xref.b	c_lreg
3279                     	xref.b	c_x
3299                     	xref	c_ltor
3300                     	xref	c_ludv
3301                     	xref	c_rtol
3302                     	end
