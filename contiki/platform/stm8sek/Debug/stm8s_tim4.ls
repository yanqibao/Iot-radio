   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  44                     ; 49 void TIM4_DeInit(void)
  44                     ; 50 {
  46                     	switch	.text
  47  0000               _TIM4_DeInit:
  51                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  53  0000 725f5340      	clr	21312
  54                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  56  0004 725f5341      	clr	21313
  57                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  59  0008 725f5344      	clr	21316
  60                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  62  000c 725f5345      	clr	21317
  63                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  65  0010 35ff5346      	mov	21318,#255
  66                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  68  0014 725f5342      	clr	21314
  69                     ; 57 }
  72  0018 81            	ret
 177                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 177                     ; 66 {
 178                     	switch	.text
 179  0019               _TIM4_TimeBaseInit:
 181  0019 89            	pushw	x
 182       00000000      OFST:	set	0
 185                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 187  001a 9e            	ld	a,xh
 188  001b 4d            	tnz	a
 189  001c 2723          	jreq	L21
 190  001e 9e            	ld	a,xh
 191  001f a101          	cp	a,#1
 192  0021 271e          	jreq	L21
 193  0023 9e            	ld	a,xh
 194  0024 a102          	cp	a,#2
 195  0026 2719          	jreq	L21
 196  0028 9e            	ld	a,xh
 197  0029 a103          	cp	a,#3
 198  002b 2714          	jreq	L21
 199  002d 9e            	ld	a,xh
 200  002e a104          	cp	a,#4
 201  0030 270f          	jreq	L21
 202  0032 9e            	ld	a,xh
 203  0033 a105          	cp	a,#5
 204  0035 270a          	jreq	L21
 205  0037 9e            	ld	a,xh
 206  0038 a106          	cp	a,#6
 207  003a 2705          	jreq	L21
 208  003c 9e            	ld	a,xh
 209  003d a107          	cp	a,#7
 210  003f 2603          	jrne	L01
 211  0041               L21:
 212  0041 4f            	clr	a
 213  0042 2010          	jra	L41
 214  0044               L01:
 215  0044 ae0044        	ldw	x,#68
 216  0047 89            	pushw	x
 217  0048 ae0000        	ldw	x,#0
 218  004b 89            	pushw	x
 219  004c ae0000        	ldw	x,#L56
 220  004f cd0000        	call	_assert_failed
 222  0052 5b04          	addw	sp,#4
 223  0054               L41:
 224                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 226  0054 7b01          	ld	a,(OFST+1,sp)
 227  0056 c75345        	ld	21317,a
 228                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 230  0059 7b02          	ld	a,(OFST+2,sp)
 231  005b c75346        	ld	21318,a
 232                     ; 73 }
 235  005e 85            	popw	x
 236  005f 81            	ret
 292                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 292                     ; 82 {
 293                     	switch	.text
 294  0060               _TIM4_Cmd:
 296  0060 88            	push	a
 297       00000000      OFST:	set	0
 300                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 302  0061 4d            	tnz	a
 303  0062 2704          	jreq	L22
 304  0064 a101          	cp	a,#1
 305  0066 2603          	jrne	L02
 306  0068               L22:
 307  0068 4f            	clr	a
 308  0069 2010          	jra	L42
 309  006b               L02:
 310  006b ae0054        	ldw	x,#84
 311  006e 89            	pushw	x
 312  006f ae0000        	ldw	x,#0
 313  0072 89            	pushw	x
 314  0073 ae0000        	ldw	x,#L56
 315  0076 cd0000        	call	_assert_failed
 317  0079 5b04          	addw	sp,#4
 318  007b               L42:
 319                     ; 87   if (NewState != DISABLE)
 321  007b 0d01          	tnz	(OFST+1,sp)
 322  007d 2706          	jreq	L511
 323                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 325  007f 72105340      	bset	21312,#0
 327  0083 2004          	jra	L711
 328  0085               L511:
 329                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 331  0085 72115340      	bres	21312,#0
 332  0089               L711:
 333                     ; 95 }
 336  0089 84            	pop	a
 337  008a 81            	ret
 396                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 396                     ; 108 {
 397                     	switch	.text
 398  008b               _TIM4_ITConfig:
 400  008b 89            	pushw	x
 401       00000000      OFST:	set	0
 404                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 406  008c 9e            	ld	a,xh
 407  008d a101          	cp	a,#1
 408  008f 2603          	jrne	L03
 409  0091 4f            	clr	a
 410  0092 2010          	jra	L23
 411  0094               L03:
 412  0094 ae006e        	ldw	x,#110
 413  0097 89            	pushw	x
 414  0098 ae0000        	ldw	x,#0
 415  009b 89            	pushw	x
 416  009c ae0000        	ldw	x,#L56
 417  009f cd0000        	call	_assert_failed
 419  00a2 5b04          	addw	sp,#4
 420  00a4               L23:
 421                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 423  00a4 0d02          	tnz	(OFST+2,sp)
 424  00a6 2706          	jreq	L63
 425  00a8 7b02          	ld	a,(OFST+2,sp)
 426  00aa a101          	cp	a,#1
 427  00ac 2603          	jrne	L43
 428  00ae               L63:
 429  00ae 4f            	clr	a
 430  00af 2010          	jra	L04
 431  00b1               L43:
 432  00b1 ae006f        	ldw	x,#111
 433  00b4 89            	pushw	x
 434  00b5 ae0000        	ldw	x,#0
 435  00b8 89            	pushw	x
 436  00b9 ae0000        	ldw	x,#L56
 437  00bc cd0000        	call	_assert_failed
 439  00bf 5b04          	addw	sp,#4
 440  00c1               L04:
 441                     ; 113   if (NewState != DISABLE)
 443  00c1 0d02          	tnz	(OFST+2,sp)
 444  00c3 270a          	jreq	L151
 445                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 447  00c5 c65341        	ld	a,21313
 448  00c8 1a01          	or	a,(OFST+1,sp)
 449  00ca c75341        	ld	21313,a
 451  00cd 2009          	jra	L351
 452  00cf               L151:
 453                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 455  00cf 7b01          	ld	a,(OFST+1,sp)
 456  00d1 43            	cpl	a
 457  00d2 c45341        	and	a,21313
 458  00d5 c75341        	ld	21313,a
 459  00d8               L351:
 460                     ; 123 }
 463  00d8 85            	popw	x
 464  00d9 81            	ret
 501                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 501                     ; 132 {
 502                     	switch	.text
 503  00da               _TIM4_UpdateDisableConfig:
 505  00da 88            	push	a
 506       00000000      OFST:	set	0
 509                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 511  00db 4d            	tnz	a
 512  00dc 2704          	jreq	L64
 513  00de a101          	cp	a,#1
 514  00e0 2603          	jrne	L44
 515  00e2               L64:
 516  00e2 4f            	clr	a
 517  00e3 2010          	jra	L05
 518  00e5               L44:
 519  00e5 ae0086        	ldw	x,#134
 520  00e8 89            	pushw	x
 521  00e9 ae0000        	ldw	x,#0
 522  00ec 89            	pushw	x
 523  00ed ae0000        	ldw	x,#L56
 524  00f0 cd0000        	call	_assert_failed
 526  00f3 5b04          	addw	sp,#4
 527  00f5               L05:
 528                     ; 137   if (NewState != DISABLE)
 530  00f5 0d01          	tnz	(OFST+1,sp)
 531  00f7 2706          	jreq	L371
 532                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 534  00f9 72125340      	bset	21312,#1
 536  00fd 2004          	jra	L571
 537  00ff               L371:
 538                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 540  00ff 72135340      	bres	21312,#1
 541  0103               L571:
 542                     ; 145 }
 545  0103 84            	pop	a
 546  0104 81            	ret
 605                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 605                     ; 156 {
 606                     	switch	.text
 607  0105               _TIM4_UpdateRequestConfig:
 609  0105 88            	push	a
 610       00000000      OFST:	set	0
 613                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 615  0106 4d            	tnz	a
 616  0107 2704          	jreq	L65
 617  0109 a101          	cp	a,#1
 618  010b 2603          	jrne	L45
 619  010d               L65:
 620  010d 4f            	clr	a
 621  010e 2010          	jra	L06
 622  0110               L45:
 623  0110 ae009e        	ldw	x,#158
 624  0113 89            	pushw	x
 625  0114 ae0000        	ldw	x,#0
 626  0117 89            	pushw	x
 627  0118 ae0000        	ldw	x,#L56
 628  011b cd0000        	call	_assert_failed
 630  011e 5b04          	addw	sp,#4
 631  0120               L06:
 632                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 634  0120 0d01          	tnz	(OFST+1,sp)
 635  0122 2706          	jreq	L522
 636                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 638  0124 72145340      	bset	21312,#2
 640  0128 2004          	jra	L722
 641  012a               L522:
 642                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 644  012a 72155340      	bres	21312,#2
 645  012e               L722:
 646                     ; 169 }
 649  012e 84            	pop	a
 650  012f 81            	ret
 708                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 708                     ; 180 {
 709                     	switch	.text
 710  0130               _TIM4_SelectOnePulseMode:
 712  0130 88            	push	a
 713       00000000      OFST:	set	0
 716                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 718  0131 a101          	cp	a,#1
 719  0133 2703          	jreq	L66
 720  0135 4d            	tnz	a
 721  0136 2603          	jrne	L46
 722  0138               L66:
 723  0138 4f            	clr	a
 724  0139 2010          	jra	L07
 725  013b               L46:
 726  013b ae00b6        	ldw	x,#182
 727  013e 89            	pushw	x
 728  013f ae0000        	ldw	x,#0
 729  0142 89            	pushw	x
 730  0143 ae0000        	ldw	x,#L56
 731  0146 cd0000        	call	_assert_failed
 733  0149 5b04          	addw	sp,#4
 734  014b               L07:
 735                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 737  014b 0d01          	tnz	(OFST+1,sp)
 738  014d 2706          	jreq	L752
 739                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 741  014f 72165340      	bset	21312,#3
 743  0153 2004          	jra	L162
 744  0155               L752:
 745                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 747  0155 72175340      	bres	21312,#3
 748  0159               L162:
 749                     ; 193 }
 752  0159 84            	pop	a
 753  015a 81            	ret
 822                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 822                     ; 216 {
 823                     	switch	.text
 824  015b               _TIM4_PrescalerConfig:
 826  015b 89            	pushw	x
 827       00000000      OFST:	set	0
 830                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 832  015c 9f            	ld	a,xl
 833  015d 4d            	tnz	a
 834  015e 2705          	jreq	L67
 835  0160 9f            	ld	a,xl
 836  0161 a101          	cp	a,#1
 837  0163 2603          	jrne	L47
 838  0165               L67:
 839  0165 4f            	clr	a
 840  0166 2010          	jra	L001
 841  0168               L47:
 842  0168 ae00da        	ldw	x,#218
 843  016b 89            	pushw	x
 844  016c ae0000        	ldw	x,#0
 845  016f 89            	pushw	x
 846  0170 ae0000        	ldw	x,#L56
 847  0173 cd0000        	call	_assert_failed
 849  0176 5b04          	addw	sp,#4
 850  0178               L001:
 851                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 853  0178 0d01          	tnz	(OFST+1,sp)
 854  017a 272a          	jreq	L401
 855  017c 7b01          	ld	a,(OFST+1,sp)
 856  017e a101          	cp	a,#1
 857  0180 2724          	jreq	L401
 858  0182 7b01          	ld	a,(OFST+1,sp)
 859  0184 a102          	cp	a,#2
 860  0186 271e          	jreq	L401
 861  0188 7b01          	ld	a,(OFST+1,sp)
 862  018a a103          	cp	a,#3
 863  018c 2718          	jreq	L401
 864  018e 7b01          	ld	a,(OFST+1,sp)
 865  0190 a104          	cp	a,#4
 866  0192 2712          	jreq	L401
 867  0194 7b01          	ld	a,(OFST+1,sp)
 868  0196 a105          	cp	a,#5
 869  0198 270c          	jreq	L401
 870  019a 7b01          	ld	a,(OFST+1,sp)
 871  019c a106          	cp	a,#6
 872  019e 2706          	jreq	L401
 873  01a0 7b01          	ld	a,(OFST+1,sp)
 874  01a2 a107          	cp	a,#7
 875  01a4 2603          	jrne	L201
 876  01a6               L401:
 877  01a6 4f            	clr	a
 878  01a7 2010          	jra	L601
 879  01a9               L201:
 880  01a9 ae00db        	ldw	x,#219
 881  01ac 89            	pushw	x
 882  01ad ae0000        	ldw	x,#0
 883  01b0 89            	pushw	x
 884  01b1 ae0000        	ldw	x,#L56
 885  01b4 cd0000        	call	_assert_failed
 887  01b7 5b04          	addw	sp,#4
 888  01b9               L601:
 889                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 891  01b9 7b01          	ld	a,(OFST+1,sp)
 892  01bb c75345        	ld	21317,a
 893                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 895  01be 7b02          	ld	a,(OFST+2,sp)
 896  01c0 c75343        	ld	21315,a
 897                     ; 226 }
 900  01c3 85            	popw	x
 901  01c4 81            	ret
 938                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 938                     ; 235 {
 939                     	switch	.text
 940  01c5               _TIM4_ARRPreloadConfig:
 942  01c5 88            	push	a
 943       00000000      OFST:	set	0
 946                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 948  01c6 4d            	tnz	a
 949  01c7 2704          	jreq	L411
 950  01c9 a101          	cp	a,#1
 951  01cb 2603          	jrne	L211
 952  01cd               L411:
 953  01cd 4f            	clr	a
 954  01ce 2010          	jra	L611
 955  01d0               L211:
 956  01d0 ae00ed        	ldw	x,#237
 957  01d3 89            	pushw	x
 958  01d4 ae0000        	ldw	x,#0
 959  01d7 89            	pushw	x
 960  01d8 ae0000        	ldw	x,#L56
 961  01db cd0000        	call	_assert_failed
 963  01de 5b04          	addw	sp,#4
 964  01e0               L611:
 965                     ; 240   if (NewState != DISABLE)
 967  01e0 0d01          	tnz	(OFST+1,sp)
 968  01e2 2706          	jreq	L333
 969                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 971  01e4 721e5340      	bset	21312,#7
 973  01e8 2004          	jra	L533
 974  01ea               L333:
 975                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 977  01ea 721f5340      	bres	21312,#7
 978  01ee               L533:
 979                     ; 248 }
 982  01ee 84            	pop	a
 983  01ef 81            	ret
1033                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1033                     ; 258 {
1034                     	switch	.text
1035  01f0               _TIM4_GenerateEvent:
1037  01f0 88            	push	a
1038       00000000      OFST:	set	0
1041                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
1043  01f1 a101          	cp	a,#1
1044  01f3 2603          	jrne	L221
1045  01f5 4f            	clr	a
1046  01f6 2010          	jra	L421
1047  01f8               L221:
1048  01f8 ae0104        	ldw	x,#260
1049  01fb 89            	pushw	x
1050  01fc ae0000        	ldw	x,#0
1051  01ff 89            	pushw	x
1052  0200 ae0000        	ldw	x,#L56
1053  0203 cd0000        	call	_assert_failed
1055  0206 5b04          	addw	sp,#4
1056  0208               L421:
1057                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
1059  0208 7b01          	ld	a,(OFST+1,sp)
1060  020a c75343        	ld	21315,a
1061                     ; 264 }
1064  020d 84            	pop	a
1065  020e 81            	ret
1097                     ; 272 void TIM4_SetCounter(uint8_t Counter)
1097                     ; 273 {
1098                     	switch	.text
1099  020f               _TIM4_SetCounter:
1103                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
1105  020f c75344        	ld	21316,a
1106                     ; 276 }
1109  0212 81            	ret
1141                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
1141                     ; 285 {
1142                     	switch	.text
1143  0213               _TIM4_SetAutoreload:
1147                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
1149  0213 c75346        	ld	21318,a
1150                     ; 288 }
1153  0216 81            	ret
1176                     ; 295 uint8_t TIM4_GetCounter(void)
1176                     ; 296 {
1177                     	switch	.text
1178  0217               _TIM4_GetCounter:
1182                     ; 298   return (uint8_t)(TIM4->CNTR);
1184  0217 c65344        	ld	a,21316
1187  021a 81            	ret
1211                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1211                     ; 307 {
1212                     	switch	.text
1213  021b               _TIM4_GetPrescaler:
1217                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
1219  021b c65345        	ld	a,21317
1222  021e 81            	ret
1302                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1302                     ; 320 {
1303                     	switch	.text
1304  021f               _TIM4_GetFlagStatus:
1306  021f 88            	push	a
1307  0220 88            	push	a
1308       00000001      OFST:	set	1
1311                     ; 321   FlagStatus bitstatus = RESET;
1313                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1315  0221 a101          	cp	a,#1
1316  0223 2603          	jrne	L041
1317  0225 4f            	clr	a
1318  0226 2010          	jra	L241
1319  0228               L041:
1320  0228 ae0144        	ldw	x,#324
1321  022b 89            	pushw	x
1322  022c ae0000        	ldw	x,#0
1323  022f 89            	pushw	x
1324  0230 ae0000        	ldw	x,#L56
1325  0233 cd0000        	call	_assert_failed
1327  0236 5b04          	addw	sp,#4
1328  0238               L241:
1329                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1331  0238 c65342        	ld	a,21314
1332  023b 1502          	bcp	a,(OFST+1,sp)
1333  023d 2706          	jreq	L374
1334                     ; 328     bitstatus = SET;
1336  023f a601          	ld	a,#1
1337  0241 6b01          	ld	(OFST+0,sp),a
1340  0243 2002          	jra	L574
1341  0245               L374:
1342                     ; 332     bitstatus = RESET;
1344  0245 0f01          	clr	(OFST+0,sp)
1346  0247               L574:
1347                     ; 334   return ((FlagStatus)bitstatus);
1349  0247 7b01          	ld	a,(OFST+0,sp)
1352  0249 85            	popw	x
1353  024a 81            	ret
1389                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1389                     ; 345 {
1390                     	switch	.text
1391  024b               _TIM4_ClearFlag:
1393  024b 88            	push	a
1394       00000000      OFST:	set	0
1397                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1399  024c a101          	cp	a,#1
1400  024e 2603          	jrne	L641
1401  0250 4f            	clr	a
1402  0251 2010          	jra	L051
1403  0253               L641:
1404  0253 ae015b        	ldw	x,#347
1405  0256 89            	pushw	x
1406  0257 ae0000        	ldw	x,#0
1407  025a 89            	pushw	x
1408  025b ae0000        	ldw	x,#L56
1409  025e cd0000        	call	_assert_failed
1411  0261 5b04          	addw	sp,#4
1412  0263               L051:
1413                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1415  0263 7b01          	ld	a,(OFST+1,sp)
1416  0265 43            	cpl	a
1417  0266 c75342        	ld	21314,a
1418                     ; 351 }
1421  0269 84            	pop	a
1422  026a 81            	ret
1483                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1483                     ; 361 {
1484                     	switch	.text
1485  026b               _TIM4_GetITStatus:
1487  026b 88            	push	a
1488  026c 89            	pushw	x
1489       00000002      OFST:	set	2
1492                     ; 362   ITStatus bitstatus = RESET;
1494                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1498                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1500  026d a101          	cp	a,#1
1501  026f 2603          	jrne	L451
1502  0271 4f            	clr	a
1503  0272 2010          	jra	L651
1504  0274               L451:
1505  0274 ae016f        	ldw	x,#367
1506  0277 89            	pushw	x
1507  0278 ae0000        	ldw	x,#0
1508  027b 89            	pushw	x
1509  027c ae0000        	ldw	x,#L56
1510  027f cd0000        	call	_assert_failed
1512  0282 5b04          	addw	sp,#4
1513  0284               L651:
1514                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1516  0284 c65342        	ld	a,21314
1517  0287 1403          	and	a,(OFST+1,sp)
1518  0289 6b01          	ld	(OFST-1,sp),a
1520                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1522  028b c65341        	ld	a,21313
1523  028e 1403          	and	a,(OFST+1,sp)
1524  0290 6b02          	ld	(OFST+0,sp),a
1526                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1528  0292 0d01          	tnz	(OFST-1,sp)
1529  0294 270a          	jreq	L345
1531  0296 0d02          	tnz	(OFST+0,sp)
1532  0298 2706          	jreq	L345
1533                     ; 375     bitstatus = (ITStatus)SET;
1535  029a a601          	ld	a,#1
1536  029c 6b02          	ld	(OFST+0,sp),a
1539  029e 2002          	jra	L545
1540  02a0               L345:
1541                     ; 379     bitstatus = (ITStatus)RESET;
1543  02a0 0f02          	clr	(OFST+0,sp)
1545  02a2               L545:
1546                     ; 381   return ((ITStatus)bitstatus);
1548  02a2 7b02          	ld	a,(OFST+0,sp)
1551  02a4 5b03          	addw	sp,#3
1552  02a6 81            	ret
1589                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1589                     ; 392 {
1590                     	switch	.text
1591  02a7               _TIM4_ClearITPendingBit:
1593  02a7 88            	push	a
1594       00000000      OFST:	set	0
1597                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1599  02a8 a101          	cp	a,#1
1600  02aa 2603          	jrne	L261
1601  02ac 4f            	clr	a
1602  02ad 2010          	jra	L461
1603  02af               L261:
1604  02af ae018a        	ldw	x,#394
1605  02b2 89            	pushw	x
1606  02b3 ae0000        	ldw	x,#0
1607  02b6 89            	pushw	x
1608  02b7 ae0000        	ldw	x,#L56
1609  02ba cd0000        	call	_assert_failed
1611  02bd 5b04          	addw	sp,#4
1612  02bf               L461:
1613                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1615  02bf 7b01          	ld	a,(OFST+1,sp)
1616  02c1 43            	cpl	a
1617  02c2 c75342        	ld	21314,a
1618                     ; 398 }
1621  02c5 84            	pop	a
1622  02c6 81            	ret
1635                     	xdef	_TIM4_ClearITPendingBit
1636                     	xdef	_TIM4_GetITStatus
1637                     	xdef	_TIM4_ClearFlag
1638                     	xdef	_TIM4_GetFlagStatus
1639                     	xdef	_TIM4_GetPrescaler
1640                     	xdef	_TIM4_GetCounter
1641                     	xdef	_TIM4_SetAutoreload
1642                     	xdef	_TIM4_SetCounter
1643                     	xdef	_TIM4_GenerateEvent
1644                     	xdef	_TIM4_ARRPreloadConfig
1645                     	xdef	_TIM4_PrescalerConfig
1646                     	xdef	_TIM4_SelectOnePulseMode
1647                     	xdef	_TIM4_UpdateRequestConfig
1648                     	xdef	_TIM4_UpdateDisableConfig
1649                     	xdef	_TIM4_ITConfig
1650                     	xdef	_TIM4_Cmd
1651                     	xdef	_TIM4_TimeBaseInit
1652                     	xdef	_TIM4_DeInit
1653                     	xref	_assert_failed
1654                     .const:	section	.text
1655  0000               L56:
1656  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\driver\st"
1657  0012 6d38735f7374  	dc.b	"m8s_stdperiph_lib\"
1658  0024 6c6962726172  	dc.b	"libraries\stm8s_st"
1659  0036 647065726970  	dc.b	"dperiph_driver\src"
1660  0048 5c73746d3873  	dc.b	"\stm8s_tim4.c",0
1680                     	end
