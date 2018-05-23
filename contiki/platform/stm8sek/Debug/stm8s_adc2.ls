   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  44                     ; 54 void ADC2_DeInit(void)
  44                     ; 55 {
  46                     	switch	.text
  47  0000               _ADC2_DeInit:
  51                     ; 56   ADC2->CSR  = ADC2_CSR_RESET_VALUE;
  53  0000 725f5400      	clr	21504
  54                     ; 57   ADC2->CR1  = ADC2_CR1_RESET_VALUE;
  56  0004 725f5401      	clr	21505
  57                     ; 58   ADC2->CR2  = ADC2_CR2_RESET_VALUE;
  59  0008 725f5402      	clr	21506
  60                     ; 59   ADC2->TDRH = ADC2_TDRH_RESET_VALUE;
  62  000c 725f5406      	clr	21510
  63                     ; 60   ADC2->TDRL = ADC2_TDRL_RESET_VALUE;
  65  0010 725f5407      	clr	21511
  66                     ; 61 }
  69  0014 81            	ret
 596                     ; 83 void ADC2_Init(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_PresSel_TypeDef ADC2_PrescalerSelection, ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState ADC2_ExtTriggerState, ADC2_Align_TypeDef ADC2_Align, ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState ADC2_SchmittTriggerState)
 596                     ; 84 {
 597                     	switch	.text
 598  0015               _ADC2_Init:
 600  0015 89            	pushw	x
 601       00000000      OFST:	set	0
 604                     ; 86   assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
 606  0016 9e            	ld	a,xh
 607  0017 4d            	tnz	a
 608  0018 2705          	jreq	L21
 609  001a 9e            	ld	a,xh
 610  001b a101          	cp	a,#1
 611  001d 2603          	jrne	L01
 612  001f               L21:
 613  001f 4f            	clr	a
 614  0020 2010          	jra	L41
 615  0022               L01:
 616  0022 ae0056        	ldw	x,#86
 617  0025 89            	pushw	x
 618  0026 ae0000        	ldw	x,#0
 619  0029 89            	pushw	x
 620  002a ae0000        	ldw	x,#L172
 621  002d cd0000        	call	_assert_failed
 623  0030 5b04          	addw	sp,#4
 624  0032               L41:
 625                     ; 87   assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
 627  0032 0d02          	tnz	(OFST+2,sp)
 628  0034 275a          	jreq	L02
 629  0036 7b02          	ld	a,(OFST+2,sp)
 630  0038 a101          	cp	a,#1
 631  003a 2754          	jreq	L02
 632  003c 7b02          	ld	a,(OFST+2,sp)
 633  003e a102          	cp	a,#2
 634  0040 274e          	jreq	L02
 635  0042 7b02          	ld	a,(OFST+2,sp)
 636  0044 a103          	cp	a,#3
 637  0046 2748          	jreq	L02
 638  0048 7b02          	ld	a,(OFST+2,sp)
 639  004a a104          	cp	a,#4
 640  004c 2742          	jreq	L02
 641  004e 7b02          	ld	a,(OFST+2,sp)
 642  0050 a105          	cp	a,#5
 643  0052 273c          	jreq	L02
 644  0054 7b02          	ld	a,(OFST+2,sp)
 645  0056 a106          	cp	a,#6
 646  0058 2736          	jreq	L02
 647  005a 7b02          	ld	a,(OFST+2,sp)
 648  005c a107          	cp	a,#7
 649  005e 2730          	jreq	L02
 650  0060 7b02          	ld	a,(OFST+2,sp)
 651  0062 a108          	cp	a,#8
 652  0064 272a          	jreq	L02
 653  0066 7b02          	ld	a,(OFST+2,sp)
 654  0068 a109          	cp	a,#9
 655  006a 2724          	jreq	L02
 656  006c 7b02          	ld	a,(OFST+2,sp)
 657  006e a10a          	cp	a,#10
 658  0070 271e          	jreq	L02
 659  0072 7b02          	ld	a,(OFST+2,sp)
 660  0074 a10b          	cp	a,#11
 661  0076 2718          	jreq	L02
 662  0078 7b02          	ld	a,(OFST+2,sp)
 663  007a a10c          	cp	a,#12
 664  007c 2712          	jreq	L02
 665  007e 7b02          	ld	a,(OFST+2,sp)
 666  0080 a10d          	cp	a,#13
 667  0082 270c          	jreq	L02
 668  0084 7b02          	ld	a,(OFST+2,sp)
 669  0086 a10e          	cp	a,#14
 670  0088 2706          	jreq	L02
 671  008a 7b02          	ld	a,(OFST+2,sp)
 672  008c a10f          	cp	a,#15
 673  008e 2603          	jrne	L61
 674  0090               L02:
 675  0090 4f            	clr	a
 676  0091 2010          	jra	L22
 677  0093               L61:
 678  0093 ae0057        	ldw	x,#87
 679  0096 89            	pushw	x
 680  0097 ae0000        	ldw	x,#0
 681  009a 89            	pushw	x
 682  009b ae0000        	ldw	x,#L172
 683  009e cd0000        	call	_assert_failed
 685  00a1 5b04          	addw	sp,#4
 686  00a3               L22:
 687                     ; 88   assert_param(IS_ADC2_PRESSEL_OK(ADC2_PrescalerSelection));
 689  00a3 0d05          	tnz	(OFST+5,sp)
 690  00a5 272a          	jreq	L62
 691  00a7 7b05          	ld	a,(OFST+5,sp)
 692  00a9 a110          	cp	a,#16
 693  00ab 2724          	jreq	L62
 694  00ad 7b05          	ld	a,(OFST+5,sp)
 695  00af a120          	cp	a,#32
 696  00b1 271e          	jreq	L62
 697  00b3 7b05          	ld	a,(OFST+5,sp)
 698  00b5 a130          	cp	a,#48
 699  00b7 2718          	jreq	L62
 700  00b9 7b05          	ld	a,(OFST+5,sp)
 701  00bb a140          	cp	a,#64
 702  00bd 2712          	jreq	L62
 703  00bf 7b05          	ld	a,(OFST+5,sp)
 704  00c1 a150          	cp	a,#80
 705  00c3 270c          	jreq	L62
 706  00c5 7b05          	ld	a,(OFST+5,sp)
 707  00c7 a160          	cp	a,#96
 708  00c9 2706          	jreq	L62
 709  00cb 7b05          	ld	a,(OFST+5,sp)
 710  00cd a170          	cp	a,#112
 711  00cf 2603          	jrne	L42
 712  00d1               L62:
 713  00d1 4f            	clr	a
 714  00d2 2010          	jra	L03
 715  00d4               L42:
 716  00d4 ae0058        	ldw	x,#88
 717  00d7 89            	pushw	x
 718  00d8 ae0000        	ldw	x,#0
 719  00db 89            	pushw	x
 720  00dc ae0000        	ldw	x,#L172
 721  00df cd0000        	call	_assert_failed
 723  00e2 5b04          	addw	sp,#4
 724  00e4               L03:
 725                     ; 89   assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
 727  00e4 0d06          	tnz	(OFST+6,sp)
 728  00e6 2706          	jreq	L43
 729  00e8 7b06          	ld	a,(OFST+6,sp)
 730  00ea a101          	cp	a,#1
 731  00ec 2603          	jrne	L23
 732  00ee               L43:
 733  00ee 4f            	clr	a
 734  00ef 2010          	jra	L63
 735  00f1               L23:
 736  00f1 ae0059        	ldw	x,#89
 737  00f4 89            	pushw	x
 738  00f5 ae0000        	ldw	x,#0
 739  00f8 89            	pushw	x
 740  00f9 ae0000        	ldw	x,#L172
 741  00fc cd0000        	call	_assert_failed
 743  00ff 5b04          	addw	sp,#4
 744  0101               L63:
 745                     ; 90   assert_param(IS_FUNCTIONALSTATE_OK(((ADC2_ExtTriggerState))));
 747  0101 0d07          	tnz	(OFST+7,sp)
 748  0103 2706          	jreq	L24
 749  0105 7b07          	ld	a,(OFST+7,sp)
 750  0107 a101          	cp	a,#1
 751  0109 2603          	jrne	L04
 752  010b               L24:
 753  010b 4f            	clr	a
 754  010c 2010          	jra	L44
 755  010e               L04:
 756  010e ae005a        	ldw	x,#90
 757  0111 89            	pushw	x
 758  0112 ae0000        	ldw	x,#0
 759  0115 89            	pushw	x
 760  0116 ae0000        	ldw	x,#L172
 761  0119 cd0000        	call	_assert_failed
 763  011c 5b04          	addw	sp,#4
 764  011e               L44:
 765                     ; 91   assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
 767  011e 0d08          	tnz	(OFST+8,sp)
 768  0120 2706          	jreq	L05
 769  0122 7b08          	ld	a,(OFST+8,sp)
 770  0124 a108          	cp	a,#8
 771  0126 2603          	jrne	L64
 772  0128               L05:
 773  0128 4f            	clr	a
 774  0129 2010          	jra	L25
 775  012b               L64:
 776  012b ae005b        	ldw	x,#91
 777  012e 89            	pushw	x
 778  012f ae0000        	ldw	x,#0
 779  0132 89            	pushw	x
 780  0133 ae0000        	ldw	x,#L172
 781  0136 cd0000        	call	_assert_failed
 783  0139 5b04          	addw	sp,#4
 784  013b               L25:
 785                     ; 92   assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
 787  013b 0d09          	tnz	(OFST+9,sp)
 788  013d 2760          	jreq	L65
 789  013f 7b09          	ld	a,(OFST+9,sp)
 790  0141 a101          	cp	a,#1
 791  0143 275a          	jreq	L65
 792  0145 7b09          	ld	a,(OFST+9,sp)
 793  0147 a102          	cp	a,#2
 794  0149 2754          	jreq	L65
 795  014b 7b09          	ld	a,(OFST+9,sp)
 796  014d a103          	cp	a,#3
 797  014f 274e          	jreq	L65
 798  0151 7b09          	ld	a,(OFST+9,sp)
 799  0153 a104          	cp	a,#4
 800  0155 2748          	jreq	L65
 801  0157 7b09          	ld	a,(OFST+9,sp)
 802  0159 a105          	cp	a,#5
 803  015b 2742          	jreq	L65
 804  015d 7b09          	ld	a,(OFST+9,sp)
 805  015f a106          	cp	a,#6
 806  0161 273c          	jreq	L65
 807  0163 7b09          	ld	a,(OFST+9,sp)
 808  0165 a107          	cp	a,#7
 809  0167 2736          	jreq	L65
 810  0169 7b09          	ld	a,(OFST+9,sp)
 811  016b a108          	cp	a,#8
 812  016d 2730          	jreq	L65
 813  016f 7b09          	ld	a,(OFST+9,sp)
 814  0171 a109          	cp	a,#9
 815  0173 272a          	jreq	L65
 816  0175 7b09          	ld	a,(OFST+9,sp)
 817  0177 a10a          	cp	a,#10
 818  0179 2724          	jreq	L65
 819  017b 7b09          	ld	a,(OFST+9,sp)
 820  017d a10b          	cp	a,#11
 821  017f 271e          	jreq	L65
 822  0181 7b09          	ld	a,(OFST+9,sp)
 823  0183 a10c          	cp	a,#12
 824  0185 2718          	jreq	L65
 825  0187 7b09          	ld	a,(OFST+9,sp)
 826  0189 a10d          	cp	a,#13
 827  018b 2712          	jreq	L65
 828  018d 7b09          	ld	a,(OFST+9,sp)
 829  018f a10e          	cp	a,#14
 830  0191 270c          	jreq	L65
 831  0193 7b09          	ld	a,(OFST+9,sp)
 832  0195 a10f          	cp	a,#15
 833  0197 2706          	jreq	L65
 834  0199 7b09          	ld	a,(OFST+9,sp)
 835  019b a11f          	cp	a,#31
 836  019d 2603          	jrne	L45
 837  019f               L65:
 838  019f 4f            	clr	a
 839  01a0 2010          	jra	L06
 840  01a2               L45:
 841  01a2 ae005c        	ldw	x,#92
 842  01a5 89            	pushw	x
 843  01a6 ae0000        	ldw	x,#0
 844  01a9 89            	pushw	x
 845  01aa ae0000        	ldw	x,#L172
 846  01ad cd0000        	call	_assert_failed
 848  01b0 5b04          	addw	sp,#4
 849  01b2               L06:
 850                     ; 93   assert_param(IS_FUNCTIONALSTATE_OK(ADC2_SchmittTriggerState));
 852  01b2 0d0a          	tnz	(OFST+10,sp)
 853  01b4 2706          	jreq	L46
 854  01b6 7b0a          	ld	a,(OFST+10,sp)
 855  01b8 a101          	cp	a,#1
 856  01ba 2603          	jrne	L26
 857  01bc               L46:
 858  01bc 4f            	clr	a
 859  01bd 2010          	jra	L66
 860  01bf               L26:
 861  01bf ae005d        	ldw	x,#93
 862  01c2 89            	pushw	x
 863  01c3 ae0000        	ldw	x,#0
 864  01c6 89            	pushw	x
 865  01c7 ae0000        	ldw	x,#L172
 866  01ca cd0000        	call	_assert_failed
 868  01cd 5b04          	addw	sp,#4
 869  01cf               L66:
 870                     ; 98   ADC2_ConversionConfig(ADC2_ConversionMode, ADC2_Channel, ADC2_Align);
 872  01cf 7b08          	ld	a,(OFST+8,sp)
 873  01d1 88            	push	a
 874  01d2 7b03          	ld	a,(OFST+3,sp)
 875  01d4 97            	ld	xl,a
 876  01d5 7b02          	ld	a,(OFST+2,sp)
 877  01d7 95            	ld	xh,a
 878  01d8 cd03a6        	call	_ADC2_ConversionConfig
 880  01db 84            	pop	a
 881                     ; 100   ADC2_PrescalerConfig(ADC2_PrescalerSelection);
 883  01dc 7b05          	ld	a,(OFST+5,sp)
 884  01de ad6e          	call	_ADC2_PrescalerConfig
 886                     ; 105   ADC2_ExternalTriggerConfig(ADC2_ExtTrigger, ADC2_ExtTriggerState);
 888  01e0 7b07          	ld	a,(OFST+7,sp)
 889  01e2 97            	ld	xl,a
 890  01e3 7b06          	ld	a,(OFST+6,sp)
 891  01e5 95            	ld	xh,a
 892  01e6 cd047f        	call	_ADC2_ExternalTriggerConfig
 894                     ; 110   ADC2_SchmittTriggerConfig(ADC2_SchmittTriggerChannel, ADC2_SchmittTriggerState);
 896  01e9 7b0a          	ld	a,(OFST+10,sp)
 897  01eb 97            	ld	xl,a
 898  01ec 7b09          	ld	a,(OFST+9,sp)
 899  01ee 95            	ld	xh,a
 900  01ef cd0293        	call	_ADC2_SchmittTriggerConfig
 902                     ; 113   ADC2->CR1 |= ADC2_CR1_ADON;
 904  01f2 72105401      	bset	21505,#0
 905                     ; 114 }
 908  01f6 85            	popw	x
 909  01f7 81            	ret
 945                     ; 121 void ADC2_Cmd(FunctionalState NewState)
 945                     ; 122 {
 946                     	switch	.text
 947  01f8               _ADC2_Cmd:
 949  01f8 88            	push	a
 950       00000000      OFST:	set	0
 953                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 955  01f9 4d            	tnz	a
 956  01fa 2704          	jreq	L47
 957  01fc a101          	cp	a,#1
 958  01fe 2603          	jrne	L27
 959  0200               L47:
 960  0200 4f            	clr	a
 961  0201 2010          	jra	L67
 962  0203               L27:
 963  0203 ae007c        	ldw	x,#124
 964  0206 89            	pushw	x
 965  0207 ae0000        	ldw	x,#0
 966  020a 89            	pushw	x
 967  020b ae0000        	ldw	x,#L172
 968  020e cd0000        	call	_assert_failed
 970  0211 5b04          	addw	sp,#4
 971  0213               L67:
 972                     ; 126   if (NewState != DISABLE)
 974  0213 0d01          	tnz	(OFST+1,sp)
 975  0215 2706          	jreq	L113
 976                     ; 128     ADC2->CR1 |= ADC2_CR1_ADON;
 978  0217 72105401      	bset	21505,#0
 980  021b 2004          	jra	L313
 981  021d               L113:
 982                     ; 132     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_ADON);
 984  021d 72115401      	bres	21505,#0
 985  0221               L313:
 986                     ; 134 }
 989  0221 84            	pop	a
 990  0222 81            	ret
1026                     ; 141 void ADC2_ITConfig(FunctionalState NewState)
1026                     ; 142 {
1027                     	switch	.text
1028  0223               _ADC2_ITConfig:
1030  0223 88            	push	a
1031       00000000      OFST:	set	0
1034                     ; 144   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1036  0224 4d            	tnz	a
1037  0225 2704          	jreq	L401
1038  0227 a101          	cp	a,#1
1039  0229 2603          	jrne	L201
1040  022b               L401:
1041  022b 4f            	clr	a
1042  022c 2010          	jra	L601
1043  022e               L201:
1044  022e ae0090        	ldw	x,#144
1045  0231 89            	pushw	x
1046  0232 ae0000        	ldw	x,#0
1047  0235 89            	pushw	x
1048  0236 ae0000        	ldw	x,#L172
1049  0239 cd0000        	call	_assert_failed
1051  023c 5b04          	addw	sp,#4
1052  023e               L601:
1053                     ; 146   if (NewState != DISABLE)
1055  023e 0d01          	tnz	(OFST+1,sp)
1056  0240 2706          	jreq	L333
1057                     ; 149     ADC2->CSR |= (uint8_t)ADC2_CSR_EOCIE;
1059  0242 721a5400      	bset	21504,#5
1061  0246 2004          	jra	L533
1062  0248               L333:
1063                     ; 154     ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOCIE);
1065  0248 721b5400      	bres	21504,#5
1066  024c               L533:
1067                     ; 156 }
1070  024c 84            	pop	a
1071  024d 81            	ret
1108                     ; 164 void ADC2_PrescalerConfig(ADC2_PresSel_TypeDef ADC2_Prescaler)
1108                     ; 165 {
1109                     	switch	.text
1110  024e               _ADC2_PrescalerConfig:
1112  024e 88            	push	a
1113       00000000      OFST:	set	0
1116                     ; 167   assert_param(IS_ADC2_PRESSEL_OK(ADC2_Prescaler));
1118  024f 4d            	tnz	a
1119  0250 271c          	jreq	L411
1120  0252 a110          	cp	a,#16
1121  0254 2718          	jreq	L411
1122  0256 a120          	cp	a,#32
1123  0258 2714          	jreq	L411
1124  025a a130          	cp	a,#48
1125  025c 2710          	jreq	L411
1126  025e a140          	cp	a,#64
1127  0260 270c          	jreq	L411
1128  0262 a150          	cp	a,#80
1129  0264 2708          	jreq	L411
1130  0266 a160          	cp	a,#96
1131  0268 2704          	jreq	L411
1132  026a a170          	cp	a,#112
1133  026c 2603          	jrne	L211
1134  026e               L411:
1135  026e 4f            	clr	a
1136  026f 2010          	jra	L611
1137  0271               L211:
1138  0271 ae00a7        	ldw	x,#167
1139  0274 89            	pushw	x
1140  0275 ae0000        	ldw	x,#0
1141  0278 89            	pushw	x
1142  0279 ae0000        	ldw	x,#L172
1143  027c cd0000        	call	_assert_failed
1145  027f 5b04          	addw	sp,#4
1146  0281               L611:
1147                     ; 170   ADC2->CR1 &= (uint8_t)(~ADC2_CR1_SPSEL);
1149  0281 c65401        	ld	a,21505
1150  0284 a48f          	and	a,#143
1151  0286 c75401        	ld	21505,a
1152                     ; 172   ADC2->CR1 |= (uint8_t)(ADC2_Prescaler);
1154  0289 c65401        	ld	a,21505
1155  028c 1a01          	or	a,(OFST+1,sp)
1156  028e c75401        	ld	21505,a
1157                     ; 173 }
1160  0291 84            	pop	a
1161  0292 81            	ret
1209                     ; 183 void ADC2_SchmittTriggerConfig(ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState NewState)
1209                     ; 184 {
1210                     	switch	.text
1211  0293               _ADC2_SchmittTriggerConfig:
1213  0293 89            	pushw	x
1214       00000000      OFST:	set	0
1217                     ; 186   assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
1219  0294 9e            	ld	a,xh
1220  0295 4d            	tnz	a
1221  0296 2750          	jreq	L421
1222  0298 9e            	ld	a,xh
1223  0299 a101          	cp	a,#1
1224  029b 274b          	jreq	L421
1225  029d 9e            	ld	a,xh
1226  029e a102          	cp	a,#2
1227  02a0 2746          	jreq	L421
1228  02a2 9e            	ld	a,xh
1229  02a3 a103          	cp	a,#3
1230  02a5 2741          	jreq	L421
1231  02a7 9e            	ld	a,xh
1232  02a8 a104          	cp	a,#4
1233  02aa 273c          	jreq	L421
1234  02ac 9e            	ld	a,xh
1235  02ad a105          	cp	a,#5
1236  02af 2737          	jreq	L421
1237  02b1 9e            	ld	a,xh
1238  02b2 a106          	cp	a,#6
1239  02b4 2732          	jreq	L421
1240  02b6 9e            	ld	a,xh
1241  02b7 a107          	cp	a,#7
1242  02b9 272d          	jreq	L421
1243  02bb 9e            	ld	a,xh
1244  02bc a108          	cp	a,#8
1245  02be 2728          	jreq	L421
1246  02c0 9e            	ld	a,xh
1247  02c1 a109          	cp	a,#9
1248  02c3 2723          	jreq	L421
1249  02c5 9e            	ld	a,xh
1250  02c6 a10a          	cp	a,#10
1251  02c8 271e          	jreq	L421
1252  02ca 9e            	ld	a,xh
1253  02cb a10b          	cp	a,#11
1254  02cd 2719          	jreq	L421
1255  02cf 9e            	ld	a,xh
1256  02d0 a10c          	cp	a,#12
1257  02d2 2714          	jreq	L421
1258  02d4 9e            	ld	a,xh
1259  02d5 a10d          	cp	a,#13
1260  02d7 270f          	jreq	L421
1261  02d9 9e            	ld	a,xh
1262  02da a10e          	cp	a,#14
1263  02dc 270a          	jreq	L421
1264  02de 9e            	ld	a,xh
1265  02df a10f          	cp	a,#15
1266  02e1 2705          	jreq	L421
1267  02e3 9e            	ld	a,xh
1268  02e4 a11f          	cp	a,#31
1269  02e6 2603          	jrne	L221
1270  02e8               L421:
1271  02e8 4f            	clr	a
1272  02e9 2010          	jra	L621
1273  02eb               L221:
1274  02eb ae00ba        	ldw	x,#186
1275  02ee 89            	pushw	x
1276  02ef ae0000        	ldw	x,#0
1277  02f2 89            	pushw	x
1278  02f3 ae0000        	ldw	x,#L172
1279  02f6 cd0000        	call	_assert_failed
1281  02f9 5b04          	addw	sp,#4
1282  02fb               L621:
1283                     ; 187   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1285  02fb 0d02          	tnz	(OFST+2,sp)
1286  02fd 2706          	jreq	L231
1287  02ff 7b02          	ld	a,(OFST+2,sp)
1288  0301 a101          	cp	a,#1
1289  0303 2603          	jrne	L031
1290  0305               L231:
1291  0305 4f            	clr	a
1292  0306 2010          	jra	L431
1293  0308               L031:
1294  0308 ae00bb        	ldw	x,#187
1295  030b 89            	pushw	x
1296  030c ae0000        	ldw	x,#0
1297  030f 89            	pushw	x
1298  0310 ae0000        	ldw	x,#L172
1299  0313 cd0000        	call	_assert_failed
1301  0316 5b04          	addw	sp,#4
1302  0318               L431:
1303                     ; 189   if (ADC2_SchmittTriggerChannel == ADC2_SCHMITTTRIG_ALL)
1305  0318 7b01          	ld	a,(OFST+1,sp)
1306  031a a11f          	cp	a,#31
1307  031c 2620          	jrne	L773
1308                     ; 191     if (NewState != DISABLE)
1310  031e 0d02          	tnz	(OFST+2,sp)
1311  0320 270a          	jreq	L104
1312                     ; 193       ADC2->TDRL &= (uint8_t)0x0;
1314  0322 725f5407      	clr	21511
1315                     ; 194       ADC2->TDRH &= (uint8_t)0x0;
1317  0326 725f5406      	clr	21510
1319  032a 2078          	jra	L504
1320  032c               L104:
1321                     ; 198       ADC2->TDRL |= (uint8_t)0xFF;
1323  032c c65407        	ld	a,21511
1324  032f aaff          	or	a,#255
1325  0331 c75407        	ld	21511,a
1326                     ; 199       ADC2->TDRH |= (uint8_t)0xFF;
1328  0334 c65406        	ld	a,21510
1329  0337 aaff          	or	a,#255
1330  0339 c75406        	ld	21510,a
1331  033c 2066          	jra	L504
1332  033e               L773:
1333                     ; 202   else if (ADC2_SchmittTriggerChannel < ADC2_SCHMITTTRIG_CHANNEL8)
1335  033e 7b01          	ld	a,(OFST+1,sp)
1336  0340 a108          	cp	a,#8
1337  0342 242f          	jruge	L704
1338                     ; 204     if (NewState != DISABLE)
1340  0344 0d02          	tnz	(OFST+2,sp)
1341  0346 2716          	jreq	L114
1342                     ; 206       ADC2->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel));
1344  0348 7b01          	ld	a,(OFST+1,sp)
1345  034a 5f            	clrw	x
1346  034b 97            	ld	xl,a
1347  034c a601          	ld	a,#1
1348  034e 5d            	tnzw	x
1349  034f 2704          	jreq	L631
1350  0351               L041:
1351  0351 48            	sll	a
1352  0352 5a            	decw	x
1353  0353 26fc          	jrne	L041
1354  0355               L631:
1355  0355 43            	cpl	a
1356  0356 c45407        	and	a,21511
1357  0359 c75407        	ld	21511,a
1359  035c 2046          	jra	L504
1360  035e               L114:
1361                     ; 210       ADC2->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel);
1363  035e 7b01          	ld	a,(OFST+1,sp)
1364  0360 5f            	clrw	x
1365  0361 97            	ld	xl,a
1366  0362 a601          	ld	a,#1
1367  0364 5d            	tnzw	x
1368  0365 2704          	jreq	L241
1369  0367               L441:
1370  0367 48            	sll	a
1371  0368 5a            	decw	x
1372  0369 26fc          	jrne	L441
1373  036b               L241:
1374  036b ca5407        	or	a,21511
1375  036e c75407        	ld	21511,a
1376  0371 2031          	jra	L504
1377  0373               L704:
1378                     ; 215     if (NewState != DISABLE)
1380  0373 0d02          	tnz	(OFST+2,sp)
1381  0375 2718          	jreq	L714
1382                     ; 217       ADC2->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8)));
1384  0377 7b01          	ld	a,(OFST+1,sp)
1385  0379 a008          	sub	a,#8
1386  037b 5f            	clrw	x
1387  037c 97            	ld	xl,a
1388  037d a601          	ld	a,#1
1389  037f 5d            	tnzw	x
1390  0380 2704          	jreq	L641
1391  0382               L051:
1392  0382 48            	sll	a
1393  0383 5a            	decw	x
1394  0384 26fc          	jrne	L051
1395  0386               L641:
1396  0386 43            	cpl	a
1397  0387 c45406        	and	a,21510
1398  038a c75406        	ld	21510,a
1400  038d 2015          	jra	L504
1401  038f               L714:
1402                     ; 221       ADC2->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8));
1404  038f 7b01          	ld	a,(OFST+1,sp)
1405  0391 a008          	sub	a,#8
1406  0393 5f            	clrw	x
1407  0394 97            	ld	xl,a
1408  0395 a601          	ld	a,#1
1409  0397 5d            	tnzw	x
1410  0398 2704          	jreq	L251
1411  039a               L451:
1412  039a 48            	sll	a
1413  039b 5a            	decw	x
1414  039c 26fc          	jrne	L451
1415  039e               L251:
1416  039e ca5406        	or	a,21510
1417  03a1 c75406        	ld	21510,a
1418  03a4               L504:
1419                     ; 224 }
1422  03a4 85            	popw	x
1423  03a5 81            	ret
1481                     ; 236 void ADC2_ConversionConfig(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_Align_TypeDef ADC2_Align)
1481                     ; 237 {
1482                     	switch	.text
1483  03a6               _ADC2_ConversionConfig:
1485  03a6 89            	pushw	x
1486       00000000      OFST:	set	0
1489                     ; 239   assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
1491  03a7 9e            	ld	a,xh
1492  03a8 4d            	tnz	a
1493  03a9 2705          	jreq	L261
1494  03ab 9e            	ld	a,xh
1495  03ac a101          	cp	a,#1
1496  03ae 2603          	jrne	L061
1497  03b0               L261:
1498  03b0 4f            	clr	a
1499  03b1 2010          	jra	L461
1500  03b3               L061:
1501  03b3 ae00ef        	ldw	x,#239
1502  03b6 89            	pushw	x
1503  03b7 ae0000        	ldw	x,#0
1504  03ba 89            	pushw	x
1505  03bb ae0000        	ldw	x,#L172
1506  03be cd0000        	call	_assert_failed
1508  03c1 5b04          	addw	sp,#4
1509  03c3               L461:
1510                     ; 240   assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
1512  03c3 0d02          	tnz	(OFST+2,sp)
1513  03c5 275a          	jreq	L071
1514  03c7 7b02          	ld	a,(OFST+2,sp)
1515  03c9 a101          	cp	a,#1
1516  03cb 2754          	jreq	L071
1517  03cd 7b02          	ld	a,(OFST+2,sp)
1518  03cf a102          	cp	a,#2
1519  03d1 274e          	jreq	L071
1520  03d3 7b02          	ld	a,(OFST+2,sp)
1521  03d5 a103          	cp	a,#3
1522  03d7 2748          	jreq	L071
1523  03d9 7b02          	ld	a,(OFST+2,sp)
1524  03db a104          	cp	a,#4
1525  03dd 2742          	jreq	L071
1526  03df 7b02          	ld	a,(OFST+2,sp)
1527  03e1 a105          	cp	a,#5
1528  03e3 273c          	jreq	L071
1529  03e5 7b02          	ld	a,(OFST+2,sp)
1530  03e7 a106          	cp	a,#6
1531  03e9 2736          	jreq	L071
1532  03eb 7b02          	ld	a,(OFST+2,sp)
1533  03ed a107          	cp	a,#7
1534  03ef 2730          	jreq	L071
1535  03f1 7b02          	ld	a,(OFST+2,sp)
1536  03f3 a108          	cp	a,#8
1537  03f5 272a          	jreq	L071
1538  03f7 7b02          	ld	a,(OFST+2,sp)
1539  03f9 a109          	cp	a,#9
1540  03fb 2724          	jreq	L071
1541  03fd 7b02          	ld	a,(OFST+2,sp)
1542  03ff a10a          	cp	a,#10
1543  0401 271e          	jreq	L071
1544  0403 7b02          	ld	a,(OFST+2,sp)
1545  0405 a10b          	cp	a,#11
1546  0407 2718          	jreq	L071
1547  0409 7b02          	ld	a,(OFST+2,sp)
1548  040b a10c          	cp	a,#12
1549  040d 2712          	jreq	L071
1550  040f 7b02          	ld	a,(OFST+2,sp)
1551  0411 a10d          	cp	a,#13
1552  0413 270c          	jreq	L071
1553  0415 7b02          	ld	a,(OFST+2,sp)
1554  0417 a10e          	cp	a,#14
1555  0419 2706          	jreq	L071
1556  041b 7b02          	ld	a,(OFST+2,sp)
1557  041d a10f          	cp	a,#15
1558  041f 2603          	jrne	L661
1559  0421               L071:
1560  0421 4f            	clr	a
1561  0422 2010          	jra	L271
1562  0424               L661:
1563  0424 ae00f0        	ldw	x,#240
1564  0427 89            	pushw	x
1565  0428 ae0000        	ldw	x,#0
1566  042b 89            	pushw	x
1567  042c ae0000        	ldw	x,#L172
1568  042f cd0000        	call	_assert_failed
1570  0432 5b04          	addw	sp,#4
1571  0434               L271:
1572                     ; 241   assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
1574  0434 0d05          	tnz	(OFST+5,sp)
1575  0436 2706          	jreq	L671
1576  0438 7b05          	ld	a,(OFST+5,sp)
1577  043a a108          	cp	a,#8
1578  043c 2603          	jrne	L471
1579  043e               L671:
1580  043e 4f            	clr	a
1581  043f 2010          	jra	L002
1582  0441               L471:
1583  0441 ae00f1        	ldw	x,#241
1584  0444 89            	pushw	x
1585  0445 ae0000        	ldw	x,#0
1586  0448 89            	pushw	x
1587  0449 ae0000        	ldw	x,#L172
1588  044c cd0000        	call	_assert_failed
1590  044f 5b04          	addw	sp,#4
1591  0451               L002:
1592                     ; 244   ADC2->CR2 &= (uint8_t)(~ADC2_CR2_ALIGN);
1594  0451 72175402      	bres	21506,#3
1595                     ; 246   ADC2->CR2 |= (uint8_t)(ADC2_Align);
1597  0455 c65402        	ld	a,21506
1598  0458 1a05          	or	a,(OFST+5,sp)
1599  045a c75402        	ld	21506,a
1600                     ; 248   if (ADC2_ConversionMode == ADC2_CONVERSIONMODE_CONTINUOUS)
1602  045d 7b01          	ld	a,(OFST+1,sp)
1603  045f a101          	cp	a,#1
1604  0461 2606          	jrne	L154
1605                     ; 251     ADC2->CR1 |= ADC2_CR1_CONT;
1607  0463 72125401      	bset	21505,#1
1609  0467 2004          	jra	L354
1610  0469               L154:
1611                     ; 256     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_CONT);
1613  0469 72135401      	bres	21505,#1
1614  046d               L354:
1615                     ; 260   ADC2->CSR &= (uint8_t)(~ADC2_CSR_CH);
1617  046d c65400        	ld	a,21504
1618  0470 a4f0          	and	a,#240
1619  0472 c75400        	ld	21504,a
1620                     ; 262   ADC2->CSR |= (uint8_t)(ADC2_Channel);
1622  0475 c65400        	ld	a,21504
1623  0478 1a02          	or	a,(OFST+2,sp)
1624  047a c75400        	ld	21504,a
1625                     ; 263 }
1628  047d 85            	popw	x
1629  047e 81            	ret
1676                     ; 275 void ADC2_ExternalTriggerConfig(ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState NewState)
1676                     ; 276 {
1677                     	switch	.text
1678  047f               _ADC2_ExternalTriggerConfig:
1680  047f 89            	pushw	x
1681       00000000      OFST:	set	0
1684                     ; 278   assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
1686  0480 9e            	ld	a,xh
1687  0481 4d            	tnz	a
1688  0482 2705          	jreq	L602
1689  0484 9e            	ld	a,xh
1690  0485 a101          	cp	a,#1
1691  0487 2603          	jrne	L402
1692  0489               L602:
1693  0489 4f            	clr	a
1694  048a 2010          	jra	L012
1695  048c               L402:
1696  048c ae0116        	ldw	x,#278
1697  048f 89            	pushw	x
1698  0490 ae0000        	ldw	x,#0
1699  0493 89            	pushw	x
1700  0494 ae0000        	ldw	x,#L172
1701  0497 cd0000        	call	_assert_failed
1703  049a 5b04          	addw	sp,#4
1704  049c               L012:
1705                     ; 279   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1707  049c 0d02          	tnz	(OFST+2,sp)
1708  049e 2706          	jreq	L412
1709  04a0 7b02          	ld	a,(OFST+2,sp)
1710  04a2 a101          	cp	a,#1
1711  04a4 2603          	jrne	L212
1712  04a6               L412:
1713  04a6 4f            	clr	a
1714  04a7 2010          	jra	L612
1715  04a9               L212:
1716  04a9 ae0117        	ldw	x,#279
1717  04ac 89            	pushw	x
1718  04ad ae0000        	ldw	x,#0
1719  04b0 89            	pushw	x
1720  04b1 ae0000        	ldw	x,#L172
1721  04b4 cd0000        	call	_assert_failed
1723  04b7 5b04          	addw	sp,#4
1724  04b9               L612:
1725                     ; 282   ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTSEL);
1727  04b9 c65402        	ld	a,21506
1728  04bc a4cf          	and	a,#207
1729  04be c75402        	ld	21506,a
1730                     ; 284   if (NewState != DISABLE)
1732  04c1 0d02          	tnz	(OFST+2,sp)
1733  04c3 2706          	jreq	L774
1734                     ; 287     ADC2->CR2 |= (uint8_t)(ADC2_CR2_EXTTRIG);
1736  04c5 721c5402      	bset	21506,#6
1738  04c9 2004          	jra	L105
1739  04cb               L774:
1740                     ; 292     ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTTRIG);
1742  04cb 721d5402      	bres	21506,#6
1743  04cf               L105:
1744                     ; 296   ADC2->CR2 |= (uint8_t)(ADC2_ExtTrigger);
1746  04cf c65402        	ld	a,21506
1747  04d2 1a01          	or	a,(OFST+1,sp)
1748  04d4 c75402        	ld	21506,a
1749                     ; 297 }
1752  04d7 85            	popw	x
1753  04d8 81            	ret
1777                     ; 308 void ADC2_StartConversion(void)
1777                     ; 309 {
1778                     	switch	.text
1779  04d9               _ADC2_StartConversion:
1783                     ; 310   ADC2->CR1 |= ADC2_CR1_ADON;
1785  04d9 72105401      	bset	21505,#0
1786                     ; 311 }
1789  04dd 81            	ret
1829                     ; 320 uint16_t ADC2_GetConversionValue(void)
1829                     ; 321 {
1830                     	switch	.text
1831  04de               _ADC2_GetConversionValue:
1833  04de 5205          	subw	sp,#5
1834       00000005      OFST:	set	5
1837                     ; 322   uint16_t temph = 0;
1839                     ; 323   uint8_t templ = 0;
1841                     ; 325   if ((ADC2->CR2 & ADC2_CR2_ALIGN) != 0) /* Right alignment */
1843  04e0 c65402        	ld	a,21506
1844  04e3 a508          	bcp	a,#8
1845  04e5 2715          	jreq	L135
1846                     ; 328     templ = ADC2->DRL;
1848  04e7 c65405        	ld	a,21509
1849  04ea 6b03          	ld	(OFST-2,sp),a
1851                     ; 330     temph = ADC2->DRH;
1853  04ec c65404        	ld	a,21508
1854  04ef 5f            	clrw	x
1855  04f0 97            	ld	xl,a
1856  04f1 1f04          	ldw	(OFST-1,sp),x
1858                     ; 332     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1860  04f3 1e04          	ldw	x,(OFST-1,sp)
1861  04f5 7b03          	ld	a,(OFST-2,sp)
1862  04f7 02            	rlwa	x,a
1863  04f8 1f04          	ldw	(OFST-1,sp),x
1866  04fa 2021          	jra	L335
1867  04fc               L135:
1868                     ; 337     temph = ADC2->DRH;
1870  04fc c65404        	ld	a,21508
1871  04ff 5f            	clrw	x
1872  0500 97            	ld	xl,a
1873  0501 1f04          	ldw	(OFST-1,sp),x
1875                     ; 339     templ = ADC2->DRL;
1877  0503 c65405        	ld	a,21509
1878  0506 6b03          	ld	(OFST-2,sp),a
1880                     ; 341     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1882  0508 1e04          	ldw	x,(OFST-1,sp)
1883  050a 4f            	clr	a
1884  050b 02            	rlwa	x,a
1885  050c 1f01          	ldw	(OFST-4,sp),x
1887  050e 7b03          	ld	a,(OFST-2,sp)
1888  0510 97            	ld	xl,a
1889  0511 a640          	ld	a,#64
1890  0513 42            	mul	x,a
1891  0514 01            	rrwa	x,a
1892  0515 1a02          	or	a,(OFST-3,sp)
1893  0517 01            	rrwa	x,a
1894  0518 1a01          	or	a,(OFST-4,sp)
1895  051a 01            	rrwa	x,a
1896  051b 1f04          	ldw	(OFST-1,sp),x
1898  051d               L335:
1899                     ; 344   return ((uint16_t)temph);
1901  051d 1e04          	ldw	x,(OFST-1,sp)
1904  051f 5b05          	addw	sp,#5
1905  0521 81            	ret
1949                     ; 352 FlagStatus ADC2_GetFlagStatus(void)
1949                     ; 353 {
1950                     	switch	.text
1951  0522               _ADC2_GetFlagStatus:
1955                     ; 355   return (FlagStatus)(ADC2->CSR & ADC2_CSR_EOC);
1957  0522 c65400        	ld	a,21504
1958  0525 a480          	and	a,#128
1961  0527 81            	ret
1984                     ; 363 void ADC2_ClearFlag(void)
1984                     ; 364 {
1985                     	switch	.text
1986  0528               _ADC2_ClearFlag:
1990                     ; 365   ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
1992  0528 721f5400      	bres	21504,#7
1993                     ; 366 }
1996  052c 81            	ret
2020                     ; 374 ITStatus ADC2_GetITStatus(void)
2020                     ; 375 {
2021                     	switch	.text
2022  052d               _ADC2_GetITStatus:
2026                     ; 376   return (ITStatus)(ADC2->CSR & ADC2_CSR_EOC);
2028  052d c65400        	ld	a,21504
2029  0530 a480          	and	a,#128
2032  0532 81            	ret
2056                     ; 384 void ADC2_ClearITPendingBit(void)
2056                     ; 385 {
2057                     	switch	.text
2058  0533               _ADC2_ClearITPendingBit:
2062                     ; 386   ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
2064  0533 721f5400      	bres	21504,#7
2065                     ; 387 }
2068  0537 81            	ret
2081                     	xdef	_ADC2_ClearITPendingBit
2082                     	xdef	_ADC2_GetITStatus
2083                     	xdef	_ADC2_ClearFlag
2084                     	xdef	_ADC2_GetFlagStatus
2085                     	xdef	_ADC2_GetConversionValue
2086                     	xdef	_ADC2_StartConversion
2087                     	xdef	_ADC2_ExternalTriggerConfig
2088                     	xdef	_ADC2_ConversionConfig
2089                     	xdef	_ADC2_SchmittTriggerConfig
2090                     	xdef	_ADC2_PrescalerConfig
2091                     	xdef	_ADC2_ITConfig
2092                     	xdef	_ADC2_Cmd
2093                     	xdef	_ADC2_Init
2094                     	xdef	_ADC2_DeInit
2095                     	xref	_assert_failed
2096                     .const:	section	.text
2097  0000               L172:
2098  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\driver\st"
2099  0012 6d38735f7374  	dc.b	"m8s_stdperiph_lib\"
2100  0024 6c6962726172  	dc.b	"libraries\stm8s_st"
2101  0036 647065726970  	dc.b	"dperiph_driver\src"
2102  0048 5c73746d3873  	dc.b	"\stm8s_adc2.c",0
2122                     	end
