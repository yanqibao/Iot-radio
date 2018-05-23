   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  77                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  77                     ; 88 {
  79                     	switch	.text
  80  0000               _FLASH_Unlock:
  82  0000 88            	push	a
  83       00000000      OFST:	set	0
  86                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  88  0001 a1fd          	cp	a,#253
  89  0003 2704          	jreq	L01
  90  0005 a1f7          	cp	a,#247
  91  0007 2603          	jrne	L6
  92  0009               L01:
  93  0009 4f            	clr	a
  94  000a 2010          	jra	L21
  95  000c               L6:
  96  000c ae005a        	ldw	x,#90
  97  000f 89            	pushw	x
  98  0010 ae0000        	ldw	x,#0
  99  0013 89            	pushw	x
 100  0014 ae0010        	ldw	x,#L73
 101  0017 cd0000        	call	_assert_failed
 103  001a 5b04          	addw	sp,#4
 104  001c               L21:
 105                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 107  001c 7b01          	ld	a,(OFST+1,sp)
 108  001e a1fd          	cp	a,#253
 109  0020 260a          	jrne	L14
 110                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
 112  0022 35565062      	mov	20578,#86
 113                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
 115  0026 35ae5062      	mov	20578,#174
 117  002a 2008          	jra	L34
 118  002c               L14:
 119                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 121  002c 35ae5064      	mov	20580,#174
 122                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 124  0030 35565064      	mov	20580,#86
 125  0034               L34:
 126                     ; 104 }
 129  0034 84            	pop	a
 130  0035 81            	ret
 166                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 166                     ; 113 {
 167                     	switch	.text
 168  0036               _FLASH_Lock:
 170  0036 88            	push	a
 171       00000000      OFST:	set	0
 174                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 176  0037 a1fd          	cp	a,#253
 177  0039 2704          	jreq	L02
 178  003b a1f7          	cp	a,#247
 179  003d 2603          	jrne	L61
 180  003f               L02:
 181  003f 4f            	clr	a
 182  0040 2010          	jra	L22
 183  0042               L61:
 184  0042 ae0073        	ldw	x,#115
 185  0045 89            	pushw	x
 186  0046 ae0000        	ldw	x,#0
 187  0049 89            	pushw	x
 188  004a ae0010        	ldw	x,#L73
 189  004d cd0000        	call	_assert_failed
 191  0050 5b04          	addw	sp,#4
 192  0052               L22:
 193                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 195  0052 c6505f        	ld	a,20575
 196  0055 1401          	and	a,(OFST+1,sp)
 197  0057 c7505f        	ld	20575,a
 198                     ; 119 }
 201  005a 84            	pop	a
 202  005b 81            	ret
 225                     ; 126 void FLASH_DeInit(void)
 225                     ; 127 {
 226                     	switch	.text
 227  005c               _FLASH_DeInit:
 231                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 233  005c 725f505a      	clr	20570
 234                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 236  0060 725f505b      	clr	20571
 237                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 239  0064 35ff505c      	mov	20572,#255
 240                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 242  0068 7217505f      	bres	20575,#3
 243                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 245  006c 7213505f      	bres	20575,#1
 246                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 248  0070 c6505f        	ld	a,20575
 249                     ; 134 }
 252  0073 81            	ret
 308                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 308                     ; 143 {
 309                     	switch	.text
 310  0074               _FLASH_ITConfig:
 312  0074 88            	push	a
 313       00000000      OFST:	set	0
 316                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 318  0075 4d            	tnz	a
 319  0076 2704          	jreq	L23
 320  0078 a101          	cp	a,#1
 321  007a 2603          	jrne	L03
 322  007c               L23:
 323  007c 4f            	clr	a
 324  007d 2010          	jra	L43
 325  007f               L03:
 326  007f ae0091        	ldw	x,#145
 327  0082 89            	pushw	x
 328  0083 ae0000        	ldw	x,#0
 329  0086 89            	pushw	x
 330  0087 ae0010        	ldw	x,#L73
 331  008a cd0000        	call	_assert_failed
 333  008d 5b04          	addw	sp,#4
 334  008f               L43:
 335                     ; 147   if(NewState != DISABLE)
 337  008f 0d01          	tnz	(OFST+1,sp)
 338  0091 2706          	jreq	L121
 339                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 341  0093 7212505a      	bset	20570,#1
 343  0097 2004          	jra	L321
 344  0099               L121:
 345                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 347  0099 7213505a      	bres	20570,#1
 348  009d               L321:
 349                     ; 155 }
 352  009d 84            	pop	a
 353  009e 81            	ret
 386                     .const:	section	.text
 387  0000               L64:
 388  0000 00008000      	dc.l	32768
 389  0004               L05:
 390  0004 00028000      	dc.l	163840
 391  0008               L25:
 392  0008 00004000      	dc.l	16384
 393  000c               L45:
 394  000c 00004800      	dc.l	18432
 395                     ; 164 void FLASH_EraseByte(uint32_t Address)
 395                     ; 165 {
 396                     	switch	.text
 397  009f               _FLASH_EraseByte:
 399       00000000      OFST:	set	0
 402                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 404  009f 96            	ldw	x,sp
 405  00a0 1c0003        	addw	x,#OFST+3
 406  00a3 cd0000        	call	c_ltor
 408  00a6 ae0000        	ldw	x,#L64
 409  00a9 cd0000        	call	c_lcmp
 411  00ac 250f          	jrult	L44
 412  00ae 96            	ldw	x,sp
 413  00af 1c0003        	addw	x,#OFST+3
 414  00b2 cd0000        	call	c_ltor
 416  00b5 ae0004        	ldw	x,#L05
 417  00b8 cd0000        	call	c_lcmp
 419  00bb 251e          	jrult	L24
 420  00bd               L44:
 421  00bd 96            	ldw	x,sp
 422  00be 1c0003        	addw	x,#OFST+3
 423  00c1 cd0000        	call	c_ltor
 425  00c4 ae0008        	ldw	x,#L25
 426  00c7 cd0000        	call	c_lcmp
 428  00ca 2512          	jrult	L04
 429  00cc 96            	ldw	x,sp
 430  00cd 1c0003        	addw	x,#OFST+3
 431  00d0 cd0000        	call	c_ltor
 433  00d3 ae000c        	ldw	x,#L45
 434  00d6 cd0000        	call	c_lcmp
 436  00d9 2403          	jruge	L04
 437  00db               L24:
 438  00db 4f            	clr	a
 439  00dc 2010          	jra	L65
 440  00de               L04:
 441  00de ae00a7        	ldw	x,#167
 442  00e1 89            	pushw	x
 443  00e2 ae0000        	ldw	x,#0
 444  00e5 89            	pushw	x
 445  00e6 ae0010        	ldw	x,#L73
 446  00e9 cd0000        	call	_assert_failed
 448  00ec 5b04          	addw	sp,#4
 449  00ee               L65:
 450                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 452  00ee 7b04          	ld	a,(OFST+4,sp)
 453  00f0 b700          	ld	c_x,a
 454  00f2 1e05          	ldw	x,(OFST+5,sp)
 455  00f4 bf01          	ldw	c_x+1,x
 456  00f6 4f            	clr	a
 457  00f7 92bd0000      	ldf	[c_x.e],a
 458                     ; 171 }
 461  00fb 81            	ret
 501                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 501                     ; 182 {
 502                     	switch	.text
 503  00fc               _FLASH_ProgramByte:
 505       00000000      OFST:	set	0
 508                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 510  00fc 96            	ldw	x,sp
 511  00fd 1c0003        	addw	x,#OFST+3
 512  0100 cd0000        	call	c_ltor
 514  0103 ae0000        	ldw	x,#L64
 515  0106 cd0000        	call	c_lcmp
 517  0109 250f          	jrult	L66
 518  010b 96            	ldw	x,sp
 519  010c 1c0003        	addw	x,#OFST+3
 520  010f cd0000        	call	c_ltor
 522  0112 ae0004        	ldw	x,#L05
 523  0115 cd0000        	call	c_lcmp
 525  0118 251e          	jrult	L46
 526  011a               L66:
 527  011a 96            	ldw	x,sp
 528  011b 1c0003        	addw	x,#OFST+3
 529  011e cd0000        	call	c_ltor
 531  0121 ae0008        	ldw	x,#L25
 532  0124 cd0000        	call	c_lcmp
 534  0127 2512          	jrult	L26
 535  0129 96            	ldw	x,sp
 536  012a 1c0003        	addw	x,#OFST+3
 537  012d cd0000        	call	c_ltor
 539  0130 ae000c        	ldw	x,#L45
 540  0133 cd0000        	call	c_lcmp
 542  0136 2403          	jruge	L26
 543  0138               L46:
 544  0138 4f            	clr	a
 545  0139 2010          	jra	L07
 546  013b               L26:
 547  013b ae00b8        	ldw	x,#184
 548  013e 89            	pushw	x
 549  013f ae0000        	ldw	x,#0
 550  0142 89            	pushw	x
 551  0143 ae0010        	ldw	x,#L73
 552  0146 cd0000        	call	_assert_failed
 554  0149 5b04          	addw	sp,#4
 555  014b               L07:
 556                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 558  014b 7b07          	ld	a,(OFST+7,sp)
 559  014d 88            	push	a
 560  014e 7b05          	ld	a,(OFST+5,sp)
 561  0150 b700          	ld	c_x,a
 562  0152 1e06          	ldw	x,(OFST+6,sp)
 563  0154 84            	pop	a
 564  0155 bf01          	ldw	c_x+1,x
 565  0157 92bd0000      	ldf	[c_x.e],a
 566                     ; 186 }
 569  015b 81            	ret
 602                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 602                     ; 196 {
 603                     	switch	.text
 604  015c               _FLASH_ReadByte:
 606       00000000      OFST:	set	0
 609                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 611  015c 96            	ldw	x,sp
 612  015d 1c0003        	addw	x,#OFST+3
 613  0160 cd0000        	call	c_ltor
 615  0163 ae0000        	ldw	x,#L64
 616  0166 cd0000        	call	c_lcmp
 618  0169 250f          	jrult	L001
 619  016b 96            	ldw	x,sp
 620  016c 1c0003        	addw	x,#OFST+3
 621  016f cd0000        	call	c_ltor
 623  0172 ae0004        	ldw	x,#L05
 624  0175 cd0000        	call	c_lcmp
 626  0178 251e          	jrult	L67
 627  017a               L001:
 628  017a 96            	ldw	x,sp
 629  017b 1c0003        	addw	x,#OFST+3
 630  017e cd0000        	call	c_ltor
 632  0181 ae0008        	ldw	x,#L25
 633  0184 cd0000        	call	c_lcmp
 635  0187 2512          	jrult	L47
 636  0189 96            	ldw	x,sp
 637  018a 1c0003        	addw	x,#OFST+3
 638  018d cd0000        	call	c_ltor
 640  0190 ae000c        	ldw	x,#L45
 641  0193 cd0000        	call	c_lcmp
 643  0196 2403          	jruge	L47
 644  0198               L67:
 645  0198 4f            	clr	a
 646  0199 2010          	jra	L201
 647  019b               L47:
 648  019b ae00c6        	ldw	x,#198
 649  019e 89            	pushw	x
 650  019f ae0000        	ldw	x,#0
 651  01a2 89            	pushw	x
 652  01a3 ae0010        	ldw	x,#L73
 653  01a6 cd0000        	call	_assert_failed
 655  01a9 5b04          	addw	sp,#4
 656  01ab               L201:
 657                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 659  01ab 7b04          	ld	a,(OFST+4,sp)
 660  01ad b700          	ld	c_x,a
 661  01af 1e05          	ldw	x,(OFST+5,sp)
 662  01b1 bf01          	ldw	c_x+1,x
 663  01b3 92bc0000      	ldf	a,[c_x.e]
 666  01b7 81            	ret
 706                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 706                     ; 213 {
 707                     	switch	.text
 708  01b8               _FLASH_ProgramWord:
 710       00000000      OFST:	set	0
 713                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 715  01b8 96            	ldw	x,sp
 716  01b9 1c0003        	addw	x,#OFST+3
 717  01bc cd0000        	call	c_ltor
 719  01bf ae0000        	ldw	x,#L64
 720  01c2 cd0000        	call	c_lcmp
 722  01c5 250f          	jrult	L211
 723  01c7 96            	ldw	x,sp
 724  01c8 1c0003        	addw	x,#OFST+3
 725  01cb cd0000        	call	c_ltor
 727  01ce ae0004        	ldw	x,#L05
 728  01d1 cd0000        	call	c_lcmp
 730  01d4 251e          	jrult	L011
 731  01d6               L211:
 732  01d6 96            	ldw	x,sp
 733  01d7 1c0003        	addw	x,#OFST+3
 734  01da cd0000        	call	c_ltor
 736  01dd ae0008        	ldw	x,#L25
 737  01e0 cd0000        	call	c_lcmp
 739  01e3 2512          	jrult	L601
 740  01e5 96            	ldw	x,sp
 741  01e6 1c0003        	addw	x,#OFST+3
 742  01e9 cd0000        	call	c_ltor
 744  01ec ae000c        	ldw	x,#L45
 745  01ef cd0000        	call	c_lcmp
 747  01f2 2403          	jruge	L601
 748  01f4               L011:
 749  01f4 4f            	clr	a
 750  01f5 2010          	jra	L411
 751  01f7               L601:
 752  01f7 ae00d7        	ldw	x,#215
 753  01fa 89            	pushw	x
 754  01fb ae0000        	ldw	x,#0
 755  01fe 89            	pushw	x
 756  01ff ae0010        	ldw	x,#L73
 757  0202 cd0000        	call	_assert_failed
 759  0205 5b04          	addw	sp,#4
 760  0207               L411:
 761                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 763  0207 721c505b      	bset	20571,#6
 764                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 766  020b 721d505c      	bres	20572,#6
 767                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 769  020f 7b07          	ld	a,(OFST+7,sp)
 770  0211 88            	push	a
 771  0212 7b05          	ld	a,(OFST+5,sp)
 772  0214 b700          	ld	c_x,a
 773  0216 1e06          	ldw	x,(OFST+6,sp)
 774  0218 84            	pop	a
 775  0219 bf01          	ldw	c_x+1,x
 776  021b 92bd0000      	ldf	[c_x.e],a
 777                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 779  021f 7b08          	ld	a,(OFST+8,sp)
 780  0221 88            	push	a
 781  0222 7b05          	ld	a,(OFST+5,sp)
 782  0224 b700          	ld	c_x,a
 783  0226 1e06          	ldw	x,(OFST+6,sp)
 784  0228 84            	pop	a
 785  0229 90ae0001      	ldw	y,#1
 786  022d bf01          	ldw	c_x+1,x
 787  022f 93            	ldw	x,y
 788  0230 92a70000      	ldf	([c_x.e],x),a
 789                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 791  0234 7b09          	ld	a,(OFST+9,sp)
 792  0236 88            	push	a
 793  0237 7b05          	ld	a,(OFST+5,sp)
 794  0239 b700          	ld	c_x,a
 795  023b 1e06          	ldw	x,(OFST+6,sp)
 796  023d 84            	pop	a
 797  023e 90ae0002      	ldw	y,#2
 798  0242 bf01          	ldw	c_x+1,x
 799  0244 93            	ldw	x,y
 800  0245 92a70000      	ldf	([c_x.e],x),a
 801                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 803  0249 7b0a          	ld	a,(OFST+10,sp)
 804  024b 88            	push	a
 805  024c 7b05          	ld	a,(OFST+5,sp)
 806  024e b700          	ld	c_x,a
 807  0250 1e06          	ldw	x,(OFST+6,sp)
 808  0252 84            	pop	a
 809  0253 90ae0003      	ldw	y,#3
 810  0257 bf01          	ldw	c_x+1,x
 811  0259 93            	ldw	x,y
 812  025a 92a70000      	ldf	([c_x.e],x),a
 813                     ; 229 }
 816  025e 81            	ret
 858                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 858                     ; 238 {
 859                     	switch	.text
 860  025f               _FLASH_ProgramOptionByte:
 862  025f 89            	pushw	x
 863       00000000      OFST:	set	0
 866                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 868  0260 a34800        	cpw	x,#18432
 869  0263 2508          	jrult	L021
 870  0265 a34880        	cpw	x,#18560
 871  0268 2403          	jruge	L021
 872  026a 4f            	clr	a
 873  026b 2010          	jra	L221
 874  026d               L021:
 875  026d ae00f0        	ldw	x,#240
 876  0270 89            	pushw	x
 877  0271 ae0000        	ldw	x,#0
 878  0274 89            	pushw	x
 879  0275 ae0010        	ldw	x,#L73
 880  0278 cd0000        	call	_assert_failed
 882  027b 5b04          	addw	sp,#4
 883  027d               L221:
 884                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 886  027d 721e505b      	bset	20571,#7
 887                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 889  0281 721f505c      	bres	20572,#7
 890                     ; 247   if(Address == 0x4800)
 892  0285 1e01          	ldw	x,(OFST+1,sp)
 893  0287 a34800        	cpw	x,#18432
 894  028a 2607          	jrne	L722
 895                     ; 250     *((NEAR uint8_t*)Address) = Data;
 897  028c 7b05          	ld	a,(OFST+5,sp)
 898  028e 1e01          	ldw	x,(OFST+1,sp)
 899  0290 f7            	ld	(x),a
 901  0291 200c          	jra	L132
 902  0293               L722:
 903                     ; 255     *((NEAR uint8_t*)Address) = Data;
 905  0293 7b05          	ld	a,(OFST+5,sp)
 906  0295 1e01          	ldw	x,(OFST+1,sp)
 907  0297 f7            	ld	(x),a
 908                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 910  0298 7b05          	ld	a,(OFST+5,sp)
 911  029a 43            	cpl	a
 912  029b 1e01          	ldw	x,(OFST+1,sp)
 913  029d e701          	ld	(1,x),a
 914  029f               L132:
 915                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 917  029f a6fd          	ld	a,#253
 918  02a1 cd0437        	call	_FLASH_WaitForLastOperation
 920                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 922  02a4 721f505b      	bres	20571,#7
 923                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 925  02a8 721e505c      	bset	20572,#7
 926                     ; 263 }
 929  02ac 85            	popw	x
 930  02ad 81            	ret
 965                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 965                     ; 271 {
 966                     	switch	.text
 967  02ae               _FLASH_EraseOptionByte:
 969  02ae 89            	pushw	x
 970       00000000      OFST:	set	0
 973                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 975  02af a34800        	cpw	x,#18432
 976  02b2 2508          	jrult	L621
 977  02b4 a34880        	cpw	x,#18560
 978  02b7 2403          	jruge	L621
 979  02b9 4f            	clr	a
 980  02ba 2010          	jra	L031
 981  02bc               L621:
 982  02bc ae0111        	ldw	x,#273
 983  02bf 89            	pushw	x
 984  02c0 ae0000        	ldw	x,#0
 985  02c3 89            	pushw	x
 986  02c4 ae0010        	ldw	x,#L73
 987  02c7 cd0000        	call	_assert_failed
 989  02ca 5b04          	addw	sp,#4
 990  02cc               L031:
 991                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 993  02cc 721e505b      	bset	20571,#7
 994                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 996  02d0 721f505c      	bres	20572,#7
 997                     ; 280   if(Address == 0x4800)
 999  02d4 1e01          	ldw	x,(OFST+1,sp)
1000  02d6 a34800        	cpw	x,#18432
1001  02d9 2605          	jrne	L742
1002                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1004  02db 1e01          	ldw	x,(OFST+1,sp)
1005  02dd 7f            	clr	(x)
1007  02de 2009          	jra	L152
1008  02e0               L742:
1009                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1011  02e0 1e01          	ldw	x,(OFST+1,sp)
1012  02e2 7f            	clr	(x)
1013                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
1015  02e3 1e01          	ldw	x,(OFST+1,sp)
1016  02e5 a6ff          	ld	a,#255
1017  02e7 e701          	ld	(1,x),a
1018  02e9               L152:
1019                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
1021  02e9 a6fd          	ld	a,#253
1022  02eb cd0437        	call	_FLASH_WaitForLastOperation
1024                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
1026  02ee 721f505b      	bres	20571,#7
1027                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
1029  02f2 721e505c      	bset	20572,#7
1030                     ; 296 }
1033  02f6 85            	popw	x
1034  02f7 81            	ret
1090                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1090                     ; 304 {
1091                     	switch	.text
1092  02f8               _FLASH_ReadOptionByte:
1094  02f8 89            	pushw	x
1095  02f9 5204          	subw	sp,#4
1096       00000004      OFST:	set	4
1099                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
1101                     ; 306   uint16_t res_value = 0;
1103                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1105  02fb a34800        	cpw	x,#18432
1106  02fe 2508          	jrult	L431
1107  0300 a34880        	cpw	x,#18560
1108  0303 2403          	jruge	L431
1109  0305 4f            	clr	a
1110  0306 2010          	jra	L631
1111  0308               L431:
1112  0308 ae0135        	ldw	x,#309
1113  030b 89            	pushw	x
1114  030c ae0000        	ldw	x,#0
1115  030f 89            	pushw	x
1116  0310 ae0010        	ldw	x,#L73
1117  0313 cd0000        	call	_assert_failed
1119  0316 5b04          	addw	sp,#4
1120  0318               L631:
1121                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1123  0318 1e05          	ldw	x,(OFST+1,sp)
1124  031a f6            	ld	a,(x)
1125  031b 6b01          	ld	(OFST-3,sp),a
1127                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1129  031d 1e05          	ldw	x,(OFST+1,sp)
1130  031f e601          	ld	a,(1,x)
1131  0321 6b02          	ld	(OFST-2,sp),a
1133                     ; 315   if(Address == 0x4800)	 
1135  0323 1e05          	ldw	x,(OFST+1,sp)
1136  0325 a34800        	cpw	x,#18432
1137  0328 2608          	jrne	L572
1138                     ; 317     res_value =	 value_optbyte;
1140  032a 7b01          	ld	a,(OFST-3,sp)
1141  032c 5f            	clrw	x
1142  032d 97            	ld	xl,a
1143  032e 1f03          	ldw	(OFST-1,sp),x
1146  0330 2023          	jra	L772
1147  0332               L572:
1148                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
1150  0332 7b02          	ld	a,(OFST-2,sp)
1151  0334 43            	cpl	a
1152  0335 1101          	cp	a,(OFST-3,sp)
1153  0337 2617          	jrne	L103
1154                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1156  0339 7b01          	ld	a,(OFST-3,sp)
1157  033b 5f            	clrw	x
1158  033c 97            	ld	xl,a
1159  033d 4f            	clr	a
1160  033e 02            	rlwa	x,a
1161  033f 1f03          	ldw	(OFST-1,sp),x
1163                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
1165  0341 7b02          	ld	a,(OFST-2,sp)
1166  0343 5f            	clrw	x
1167  0344 97            	ld	xl,a
1168  0345 01            	rrwa	x,a
1169  0346 1a04          	or	a,(OFST+0,sp)
1170  0348 01            	rrwa	x,a
1171  0349 1a03          	or	a,(OFST-1,sp)
1172  034b 01            	rrwa	x,a
1173  034c 1f03          	ldw	(OFST-1,sp),x
1176  034e 2005          	jra	L772
1177  0350               L103:
1178                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
1180  0350 ae5555        	ldw	x,#21845
1181  0353 1f03          	ldw	(OFST-1,sp),x
1183  0355               L772:
1184                     ; 331   return(res_value);
1186  0355 1e03          	ldw	x,(OFST-1,sp)
1189  0357 5b06          	addw	sp,#6
1190  0359 81            	ret
1265                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1265                     ; 341 {
1266                     	switch	.text
1267  035a               _FLASH_SetLowPowerMode:
1269  035a 88            	push	a
1270       00000000      OFST:	set	0
1273                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1275  035b a104          	cp	a,#4
1276  035d 270b          	jreq	L441
1277  035f a108          	cp	a,#8
1278  0361 2707          	jreq	L441
1279  0363 4d            	tnz	a
1280  0364 2704          	jreq	L441
1281  0366 a10c          	cp	a,#12
1282  0368 2603          	jrne	L241
1283  036a               L441:
1284  036a 4f            	clr	a
1285  036b 2010          	jra	L641
1286  036d               L241:
1287  036d ae0157        	ldw	x,#343
1288  0370 89            	pushw	x
1289  0371 ae0000        	ldw	x,#0
1290  0374 89            	pushw	x
1291  0375 ae0010        	ldw	x,#L73
1292  0378 cd0000        	call	_assert_failed
1294  037b 5b04          	addw	sp,#4
1295  037d               L641:
1296                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1298  037d c6505a        	ld	a,20570
1299  0380 a4f3          	and	a,#243
1300  0382 c7505a        	ld	20570,a
1301                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1303  0385 c6505a        	ld	a,20570
1304  0388 1a01          	or	a,(OFST+1,sp)
1305  038a c7505a        	ld	20570,a
1306                     ; 350 }
1309  038d 84            	pop	a
1310  038e 81            	ret
1369                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1369                     ; 359 {
1370                     	switch	.text
1371  038f               _FLASH_SetProgrammingTime:
1373  038f 88            	push	a
1374       00000000      OFST:	set	0
1377                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1379  0390 4d            	tnz	a
1380  0391 2704          	jreq	L451
1381  0393 a101          	cp	a,#1
1382  0395 2603          	jrne	L251
1383  0397               L451:
1384  0397 4f            	clr	a
1385  0398 2010          	jra	L651
1386  039a               L251:
1387  039a ae0169        	ldw	x,#361
1388  039d 89            	pushw	x
1389  039e ae0000        	ldw	x,#0
1390  03a1 89            	pushw	x
1391  03a2 ae0010        	ldw	x,#L73
1392  03a5 cd0000        	call	_assert_failed
1394  03a8 5b04          	addw	sp,#4
1395  03aa               L651:
1396                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1398  03aa 7211505a      	bres	20570,#0
1399                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1401  03ae c6505a        	ld	a,20570
1402  03b1 1a01          	or	a,(OFST+1,sp)
1403  03b3 c7505a        	ld	20570,a
1404                     ; 365 }
1407  03b6 84            	pop	a
1408  03b7 81            	ret
1433                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1433                     ; 373 {
1434                     	switch	.text
1435  03b8               _FLASH_GetLowPowerMode:
1439                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1441  03b8 c6505a        	ld	a,20570
1442  03bb a40c          	and	a,#12
1445  03bd 81            	ret
1470                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1470                     ; 383 {
1471                     	switch	.text
1472  03be               _FLASH_GetProgrammingTime:
1476                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1478  03be c6505a        	ld	a,20570
1479  03c1 a401          	and	a,#1
1482  03c3 81            	ret
1514                     ; 392 uint32_t FLASH_GetBootSize(void)
1514                     ; 393 {
1515                     	switch	.text
1516  03c4               _FLASH_GetBootSize:
1518  03c4 5204          	subw	sp,#4
1519       00000004      OFST:	set	4
1522                     ; 394   uint32_t temp = 0;
1524                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1526  03c6 c6505d        	ld	a,20573
1527  03c9 5f            	clrw	x
1528  03ca 97            	ld	xl,a
1529  03cb 90ae0200      	ldw	y,#512
1530  03cf cd0000        	call	c_umul
1532  03d2 96            	ldw	x,sp
1533  03d3 1c0001        	addw	x,#OFST-3
1534  03d6 cd0000        	call	c_rtol
1537                     ; 400   if(FLASH->FPR == 0xFF)
1539  03d9 c6505d        	ld	a,20573
1540  03dc a1ff          	cp	a,#255
1541  03de 2611          	jrne	L124
1542                     ; 402     temp += 512;
1544  03e0 ae0200        	ldw	x,#512
1545  03e3 bf02          	ldw	c_lreg+2,x
1546  03e5 ae0000        	ldw	x,#0
1547  03e8 bf00          	ldw	c_lreg,x
1548  03ea 96            	ldw	x,sp
1549  03eb 1c0001        	addw	x,#OFST-3
1550  03ee cd0000        	call	c_lgadd
1553  03f1               L124:
1554                     ; 406   return(temp);
1556  03f1 96            	ldw	x,sp
1557  03f2 1c0001        	addw	x,#OFST-3
1558  03f5 cd0000        	call	c_ltor
1562  03f8 5b04          	addw	sp,#4
1563  03fa 81            	ret
1673                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1673                     ; 418 {
1674                     	switch	.text
1675  03fb               _FLASH_GetFlagStatus:
1677  03fb 88            	push	a
1678  03fc 88            	push	a
1679       00000001      OFST:	set	1
1682                     ; 419   FlagStatus status = RESET;
1684                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1686  03fd a140          	cp	a,#64
1687  03ff 2710          	jreq	L271
1688  0401 a108          	cp	a,#8
1689  0403 270c          	jreq	L271
1690  0405 a104          	cp	a,#4
1691  0407 2708          	jreq	L271
1692  0409 a102          	cp	a,#2
1693  040b 2704          	jreq	L271
1694  040d a101          	cp	a,#1
1695  040f 2603          	jrne	L071
1696  0411               L271:
1697  0411 4f            	clr	a
1698  0412 2010          	jra	L471
1699  0414               L071:
1700  0414 ae01a5        	ldw	x,#421
1701  0417 89            	pushw	x
1702  0418 ae0000        	ldw	x,#0
1703  041b 89            	pushw	x
1704  041c ae0010        	ldw	x,#L73
1705  041f cd0000        	call	_assert_failed
1707  0422 5b04          	addw	sp,#4
1708  0424               L471:
1709                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1711  0424 c6505f        	ld	a,20575
1712  0427 1502          	bcp	a,(OFST+1,sp)
1713  0429 2706          	jreq	L374
1714                     ; 426     status = SET; /* FLASH_FLAG is set */
1716  042b a601          	ld	a,#1
1717  042d 6b01          	ld	(OFST+0,sp),a
1720  042f 2002          	jra	L574
1721  0431               L374:
1722                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1724  0431 0f01          	clr	(OFST+0,sp)
1726  0433               L574:
1727                     ; 434   return status;
1729  0433 7b01          	ld	a,(OFST+0,sp)
1732  0435 85            	popw	x
1733  0436 81            	ret
1822                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1822                     ; 550 {
1823                     	switch	.text
1824  0437               _FLASH_WaitForLastOperation:
1826  0437 5203          	subw	sp,#3
1827       00000003      OFST:	set	3
1830                     ; 551   uint8_t flagstatus = 0x00;
1832  0439 0f03          	clr	(OFST+0,sp)
1834                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1836  043b aeffff        	ldw	x,#65535
1837  043e 1f01          	ldw	(OFST-2,sp),x
1839                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1841  0440 a1fd          	cp	a,#253
1842  0442 2628          	jrne	L355
1844  0444 200e          	jra	L145
1845  0446               L735:
1846                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1846                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1848  0446 c6505f        	ld	a,20575
1849  0449 a405          	and	a,#5
1850  044b 6b03          	ld	(OFST+0,sp),a
1852                     ; 563         timeout--;
1854  044d 1e01          	ldw	x,(OFST-2,sp)
1855  044f 1d0001        	subw	x,#1
1856  0452 1f01          	ldw	(OFST-2,sp),x
1858  0454               L145:
1859                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1861  0454 0d03          	tnz	(OFST+0,sp)
1862  0456 261c          	jrne	L745
1864  0458 1e01          	ldw	x,(OFST-2,sp)
1865  045a 26ea          	jrne	L735
1866  045c 2016          	jra	L745
1867  045e               L155:
1868                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1868                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1870  045e c6505f        	ld	a,20575
1871  0461 a441          	and	a,#65
1872  0463 6b03          	ld	(OFST+0,sp),a
1874                     ; 572         timeout--;
1876  0465 1e01          	ldw	x,(OFST-2,sp)
1877  0467 1d0001        	subw	x,#1
1878  046a 1f01          	ldw	(OFST-2,sp),x
1880  046c               L355:
1881                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1883  046c 0d03          	tnz	(OFST+0,sp)
1884  046e 2604          	jrne	L745
1886  0470 1e01          	ldw	x,(OFST-2,sp)
1887  0472 26ea          	jrne	L155
1888  0474               L745:
1889                     ; 583   if(timeout == 0x00 )
1891  0474 1e01          	ldw	x,(OFST-2,sp)
1892  0476 2604          	jrne	L165
1893                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1895  0478 a602          	ld	a,#2
1896  047a 6b03          	ld	(OFST+0,sp),a
1898  047c               L165:
1899                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1901  047c 7b03          	ld	a,(OFST+0,sp)
1904  047e 5b03          	addw	sp,#3
1905  0480 81            	ret
1965                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1965                     ; 599 {
1966                     	switch	.text
1967  0481               _FLASH_EraseBlock:
1969  0481 89            	pushw	x
1970  0482 5207          	subw	sp,#7
1971       00000007      OFST:	set	7
1974                     ; 600   uint32_t startaddress = 0;
1976                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1978  0484 7b0c          	ld	a,(OFST+5,sp)
1979  0486 a1fd          	cp	a,#253
1980  0488 2706          	jreq	L402
1981  048a 7b0c          	ld	a,(OFST+5,sp)
1982  048c a1f7          	cp	a,#247
1983  048e 2603          	jrne	L202
1984  0490               L402:
1985  0490 4f            	clr	a
1986  0491 2010          	jra	L602
1987  0493               L202:
1988  0493 ae0262        	ldw	x,#610
1989  0496 89            	pushw	x
1990  0497 ae0000        	ldw	x,#0
1991  049a 89            	pushw	x
1992  049b ae0010        	ldw	x,#L73
1993  049e cd0000        	call	_assert_failed
1995  04a1 5b04          	addw	sp,#4
1996  04a3               L602:
1997                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1999  04a3 7b0c          	ld	a,(OFST+5,sp)
2000  04a5 a1fd          	cp	a,#253
2001  04a7 2626          	jrne	L116
2002                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2004  04a9 1e08          	ldw	x,(OFST+1,sp)
2005  04ab a30400        	cpw	x,#1024
2006  04ae 2403          	jruge	L012
2007  04b0 4f            	clr	a
2008  04b1 2010          	jra	L212
2009  04b3               L012:
2010  04b3 ae0265        	ldw	x,#613
2011  04b6 89            	pushw	x
2012  04b7 ae0000        	ldw	x,#0
2013  04ba 89            	pushw	x
2014  04bb ae0010        	ldw	x,#L73
2015  04be cd0000        	call	_assert_failed
2017  04c1 5b04          	addw	sp,#4
2018  04c3               L212:
2019                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2021  04c3 ae8000        	ldw	x,#32768
2022  04c6 1f03          	ldw	(OFST-4,sp),x
2023  04c8 ae0000        	ldw	x,#0
2024  04cb 1f01          	ldw	(OFST-6,sp),x
2027  04cd 2024          	jra	L316
2028  04cf               L116:
2029                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2031  04cf 1e08          	ldw	x,(OFST+1,sp)
2032  04d1 a30010        	cpw	x,#16
2033  04d4 2403          	jruge	L412
2034  04d6 4f            	clr	a
2035  04d7 2010          	jra	L612
2036  04d9               L412:
2037  04d9 ae026a        	ldw	x,#618
2038  04dc 89            	pushw	x
2039  04dd ae0000        	ldw	x,#0
2040  04e0 89            	pushw	x
2041  04e1 ae0010        	ldw	x,#L73
2042  04e4 cd0000        	call	_assert_failed
2044  04e7 5b04          	addw	sp,#4
2045  04e9               L612:
2046                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2048  04e9 ae4000        	ldw	x,#16384
2049  04ec 1f03          	ldw	(OFST-4,sp),x
2050  04ee ae0000        	ldw	x,#0
2051  04f1 1f01          	ldw	(OFST-6,sp),x
2053  04f3               L316:
2054                     ; 624   pwFlash = (PointerAttr uint8_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
2056  04f3 1e08          	ldw	x,(OFST+1,sp)
2057  04f5 a680          	ld	a,#128
2058  04f7 cd0000        	call	c_cmulx
2060  04fa 96            	ldw	x,sp
2061  04fb 1c0001        	addw	x,#OFST-6
2062  04fe cd0000        	call	c_ladd
2064  0501 450100        	mov	c_x,c_lreg+1
2065  0504 be02          	ldw	x,c_lreg+2
2066  0506 b600          	ld	a,c_x
2067  0508 6b05          	ld	(OFST-2,sp),a
2068  050a 1f06          	ldw	(OFST-1,sp),x
2070                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
2072  050c 721a505b      	bset	20571,#5
2073                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
2075  0510 721b505c      	bres	20572,#5
2076                     ; 639     *pwFlash = (uint8_t)0;
2078  0514 7b05          	ld	a,(OFST-2,sp)
2079  0516 b700          	ld	c_x,a
2080  0518 1e06          	ldw	x,(OFST-1,sp)
2081  051a bf01          	ldw	c_x+1,x
2082  051c 4f            	clr	a
2083  051d 92bd0000      	ldf	[c_x.e],a
2084                     ; 640   *(pwFlash + 1) = (uint8_t)0;
2086  0521 7b05          	ld	a,(OFST-2,sp)
2087  0523 b700          	ld	c_x,a
2088  0525 1e06          	ldw	x,(OFST-1,sp)
2089  0527 90ae0001      	ldw	y,#1
2090  052b bf01          	ldw	c_x+1,x
2091  052d 93            	ldw	x,y
2092  052e 4f            	clr	a
2093  052f 92a70000      	ldf	([c_x.e],x),a
2094                     ; 641   *(pwFlash + 2) = (uint8_t)0;
2096  0533 7b05          	ld	a,(OFST-2,sp)
2097  0535 b700          	ld	c_x,a
2098  0537 1e06          	ldw	x,(OFST-1,sp)
2099  0539 90ae0002      	ldw	y,#2
2100  053d bf01          	ldw	c_x+1,x
2101  053f 93            	ldw	x,y
2102  0540 4f            	clr	a
2103  0541 92a70000      	ldf	([c_x.e],x),a
2104                     ; 642   *(pwFlash + 3) = (uint8_t)0;    
2106  0545 7b05          	ld	a,(OFST-2,sp)
2107  0547 b700          	ld	c_x,a
2108  0549 1e06          	ldw	x,(OFST-1,sp)
2109  054b 90ae0003      	ldw	y,#3
2110  054f bf01          	ldw	c_x+1,x
2111  0551 93            	ldw	x,y
2112  0552 4f            	clr	a
2113  0553 92a70000      	ldf	([c_x.e],x),a
2114                     ; 644 }
2117  0557 5b09          	addw	sp,#9
2118  0559 81            	ret
2217                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2217                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2217                     ; 657 {
2218                     	switch	.text
2219  055a               _FLASH_ProgramBlock:
2221  055a 89            	pushw	x
2222  055b 5206          	subw	sp,#6
2223       00000006      OFST:	set	6
2226                     ; 658   uint16_t Count = 0;
2228                     ; 659   uint32_t startaddress = 0;
2230                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2232  055d 7b0b          	ld	a,(OFST+5,sp)
2233  055f a1fd          	cp	a,#253
2234  0561 2706          	jreq	L422
2235  0563 7b0b          	ld	a,(OFST+5,sp)
2236  0565 a1f7          	cp	a,#247
2237  0567 2603          	jrne	L222
2238  0569               L422:
2239  0569 4f            	clr	a
2240  056a 2010          	jra	L622
2241  056c               L222:
2242  056c ae0296        	ldw	x,#662
2243  056f 89            	pushw	x
2244  0570 ae0000        	ldw	x,#0
2245  0573 89            	pushw	x
2246  0574 ae0010        	ldw	x,#L73
2247  0577 cd0000        	call	_assert_failed
2249  057a 5b04          	addw	sp,#4
2250  057c               L622:
2251                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2253  057c 0d0c          	tnz	(OFST+6,sp)
2254  057e 2706          	jreq	L232
2255  0580 7b0c          	ld	a,(OFST+6,sp)
2256  0582 a110          	cp	a,#16
2257  0584 2603          	jrne	L032
2258  0586               L232:
2259  0586 4f            	clr	a
2260  0587 2010          	jra	L432
2261  0589               L032:
2262  0589 ae0297        	ldw	x,#663
2263  058c 89            	pushw	x
2264  058d ae0000        	ldw	x,#0
2265  0590 89            	pushw	x
2266  0591 ae0010        	ldw	x,#L73
2267  0594 cd0000        	call	_assert_failed
2269  0597 5b04          	addw	sp,#4
2270  0599               L432:
2271                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
2273  0599 7b0b          	ld	a,(OFST+5,sp)
2274  059b a1fd          	cp	a,#253
2275  059d 2626          	jrne	L166
2276                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2278  059f 1e07          	ldw	x,(OFST+1,sp)
2279  05a1 a30400        	cpw	x,#1024
2280  05a4 2403          	jruge	L632
2281  05a6 4f            	clr	a
2282  05a7 2010          	jra	L042
2283  05a9               L632:
2284  05a9 ae029a        	ldw	x,#666
2285  05ac 89            	pushw	x
2286  05ad ae0000        	ldw	x,#0
2287  05b0 89            	pushw	x
2288  05b1 ae0010        	ldw	x,#L73
2289  05b4 cd0000        	call	_assert_failed
2291  05b7 5b04          	addw	sp,#4
2292  05b9               L042:
2293                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2295  05b9 ae8000        	ldw	x,#32768
2296  05bc 1f03          	ldw	(OFST-3,sp),x
2297  05be ae0000        	ldw	x,#0
2298  05c1 1f01          	ldw	(OFST-5,sp),x
2301  05c3 2024          	jra	L366
2302  05c5               L166:
2303                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2305  05c5 1e07          	ldw	x,(OFST+1,sp)
2306  05c7 a30010        	cpw	x,#16
2307  05ca 2403          	jruge	L242
2308  05cc 4f            	clr	a
2309  05cd 2010          	jra	L442
2310  05cf               L242:
2311  05cf ae029f        	ldw	x,#671
2312  05d2 89            	pushw	x
2313  05d3 ae0000        	ldw	x,#0
2314  05d6 89            	pushw	x
2315  05d7 ae0010        	ldw	x,#L73
2316  05da cd0000        	call	_assert_failed
2318  05dd 5b04          	addw	sp,#4
2319  05df               L442:
2320                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2322  05df ae4000        	ldw	x,#16384
2323  05e2 1f03          	ldw	(OFST-3,sp),x
2324  05e4 ae0000        	ldw	x,#0
2325  05e7 1f01          	ldw	(OFST-5,sp),x
2327  05e9               L366:
2328                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2330  05e9 1e07          	ldw	x,(OFST+1,sp)
2331  05eb a680          	ld	a,#128
2332  05ed cd0000        	call	c_cmulx
2334  05f0 96            	ldw	x,sp
2335  05f1 1c0001        	addw	x,#OFST-5
2336  05f4 cd0000        	call	c_lgadd
2339                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2341  05f7 0d0c          	tnz	(OFST+6,sp)
2342  05f9 260a          	jrne	L566
2343                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
2345  05fb 7210505b      	bset	20571,#0
2346                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2348  05ff 7211505c      	bres	20572,#0
2350  0603 2008          	jra	L766
2351  0605               L566:
2352                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
2354  0605 7218505b      	bset	20571,#4
2355                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2357  0609 7219505c      	bres	20572,#4
2358  060d               L766:
2359                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2361  060d 5f            	clrw	x
2362  060e 1f05          	ldw	(OFST-1,sp),x
2364  0610               L176:
2365                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2367  0610 1e0d          	ldw	x,(OFST+7,sp)
2368  0612 72fb05        	addw	x,(OFST-1,sp)
2369  0615 f6            	ld	a,(x)
2370  0616 88            	push	a
2371  0617 7b03          	ld	a,(OFST-3,sp)
2372  0619 b700          	ld	c_x,a
2373  061b 1e04          	ldw	x,(OFST-2,sp)
2374  061d 84            	pop	a
2375  061e 1605          	ldw	y,(OFST-1,sp)
2376  0620 bf01          	ldw	c_x+1,x
2377  0622 93            	ldw	x,y
2378  0623 92a70000      	ldf	([c_x.e],x),a
2379                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2381  0627 1e05          	ldw	x,(OFST-1,sp)
2382  0629 1c0001        	addw	x,#1
2383  062c 1f05          	ldw	(OFST-1,sp),x
2387  062e 1e05          	ldw	x,(OFST-1,sp)
2388  0630 a30080        	cpw	x,#128
2389  0633 25db          	jrult	L176
2390                     ; 697 }
2393  0635 5b08          	addw	sp,#8
2394  0637 81            	ret
2407                     	xdef	_FLASH_WaitForLastOperation
2408                     	xdef	_FLASH_ProgramBlock
2409                     	xdef	_FLASH_EraseBlock
2410                     	xdef	_FLASH_GetFlagStatus
2411                     	xdef	_FLASH_GetBootSize
2412                     	xdef	_FLASH_GetProgrammingTime
2413                     	xdef	_FLASH_GetLowPowerMode
2414                     	xdef	_FLASH_SetProgrammingTime
2415                     	xdef	_FLASH_SetLowPowerMode
2416                     	xdef	_FLASH_EraseOptionByte
2417                     	xdef	_FLASH_ProgramOptionByte
2418                     	xdef	_FLASH_ReadOptionByte
2419                     	xdef	_FLASH_ProgramWord
2420                     	xdef	_FLASH_ReadByte
2421                     	xdef	_FLASH_ProgramByte
2422                     	xdef	_FLASH_EraseByte
2423                     	xdef	_FLASH_ITConfig
2424                     	xdef	_FLASH_DeInit
2425                     	xdef	_FLASH_Lock
2426                     	xdef	_FLASH_Unlock
2427                     	xref	_assert_failed
2428                     	switch	.const
2429  0010               L73:
2430  0010 2e2e5c2e2e5c  	dc.b	"..\..\..\driver\st"
2431  0022 6d38735f7374  	dc.b	"m8s_stdperiph_lib\"
2432  0034 6c6962726172  	dc.b	"libraries\stm8s_st"
2433  0046 647065726970  	dc.b	"dperiph_driver\src"
2434  0058 5c73746d3873  	dc.b	"\stm8s_flash.c",0
2435                     	xref.b	c_lreg
2436                     	xref.b	c_x
2437                     	xref.b	c_y
2457                     	xref	c_ladd
2458                     	xref	c_cmulx
2459                     	xref	c_lgadd
2460                     	xref	c_rtol
2461                     	xref	c_umul
2462                     	xref	c_lcmp
2463                     	xref	c_ltor
2464                     	end
