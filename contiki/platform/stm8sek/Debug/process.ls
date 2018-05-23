   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     	switch	.data
  17  0000               _process_list:
  18  0000 0000          	dc.w	0
  19  0002               _process_current:
  20  0002 0000          	dc.w	0
  51                     ; 93 process_alloc_event(void)
  51                     ; 94 {
  53                     	switch	.text
  54  0000               _process_alloc_event:
  58                     ; 95   return lastevent++;
  60  0000 c600a3        	ld	a,L3_lastevent
  61  0003 725c00a3      	inc	L3_lastevent
  64  0007 81            	ret
 203                     ; 99 process_start(struct process *p, process_data_t data)
 203                     ; 100 {
 204                     	switch	.text
 205  0008               _process_start:
 207  0008 89            	pushw	x
 208  0009 89            	pushw	x
 209       00000002      OFST:	set	2
 212                     ; 105   for(q = process_list; q != p && q != NULL; q = q->next);
 214  000a ce0000        	ldw	x,_process_list
 215  000d 1f01          	ldw	(OFST-1,sp),x
 218  000f 2005          	jra	L331
 219  0011               L721:
 223  0011 1e01          	ldw	x,(OFST-1,sp)
 224  0013 fe            	ldw	x,(x)
 225  0014 1f01          	ldw	(OFST-1,sp),x
 227  0016               L331:
 230  0016 1e01          	ldw	x,(OFST-1,sp)
 231  0018 1303          	cpw	x,(OFST+1,sp)
 232  001a 2704          	jreq	L731
 234  001c 1e01          	ldw	x,(OFST-1,sp)
 235  001e 26f1          	jrne	L721
 236  0020               L731:
 237                     ; 108   if(q == p) {
 239  0020 1e01          	ldw	x,(OFST-1,sp)
 240  0022 1303          	cpw	x,(OFST+1,sp)
 241  0024 2724          	jreq	L01
 242                     ; 109     return;
 244                     ; 112   p->next = process_list;
 246  0026 1e03          	ldw	x,(OFST+1,sp)
 247  0028 90ce0000      	ldw	y,_process_list
 248  002c ff            	ldw	(x),y
 249                     ; 113   process_list = p;
 251  002d 1e03          	ldw	x,(OFST+1,sp)
 252  002f cf0000        	ldw	_process_list,x
 253                     ; 114   p->state = PROCESS_STATE_RUNNING;
 255  0032 1e03          	ldw	x,(OFST+1,sp)
 256  0034 a601          	ld	a,#1
 257  0036 e708          	ld	(8,x),a
 258                     ; 115   PT_INIT(&p->pt);
 260  0038 1e03          	ldw	x,(OFST+1,sp)
 261  003a 905f          	clrw	y
 262  003c ef06          	ldw	(6,x),y
 263                     ; 120   process_post_synch(p, PROCESS_EVENT_INIT, data);
 267  003e 1e07          	ldw	x,(OFST+5,sp)
 268  0040 89            	pushw	x
 269  0041 4b81          	push	#129
 270  0043 1e06          	ldw	x,(OFST+4,sp)
 271  0045 cd029f        	call	_process_post_synch
 273  0048 5b03          	addw	sp,#3
 274                     ; 121 }
 275  004a               L01:
 278  004a 5b04          	addw	sp,#4
 279  004c 81            	ret
 356                     ; 124 exit_process(struct process *p, struct process *fromprocess)
 356                     ; 125 {
 357                     	switch	.text
 358  004d               L341_exit_process:
 360  004d 89            	pushw	x
 361  004e 5204          	subw	sp,#4
 362       00000004      OFST:	set	4
 365                     ; 127   struct process *old_current = process_current;
 367  0050 ce0002        	ldw	x,_process_current
 368  0053 1f01          	ldw	(OFST-3,sp),x
 370                     ; 133   for(q = process_list; q != p && q != NULL; q = q->next);
 373  0055 ce0000        	ldw	x,_process_list
 374  0058 1f03          	ldw	(OFST-1,sp),x
 377  005a 2005          	jra	L312
 378  005c               L702:
 382  005c 1e03          	ldw	x,(OFST-1,sp)
 383  005e fe            	ldw	x,(x)
 384  005f 1f03          	ldw	(OFST-1,sp),x
 386  0061               L312:
 389  0061 1e03          	ldw	x,(OFST-1,sp)
 390  0063 1305          	cpw	x,(OFST+1,sp)
 391  0065 2704          	jreq	L712
 393  0067 1e03          	ldw	x,(OFST-1,sp)
 394  0069 26f1          	jrne	L702
 395  006b               L712:
 396                     ; 134   if(q == NULL) {
 398  006b 1e03          	ldw	x,(OFST-1,sp)
 399  006d 2767          	jreq	L41
 400                     ; 135     return;
 402                     ; 138   if(process_is_running(p)) {
 404  006f 1e05          	ldw	x,(OFST+1,sp)
 405  0071 cd02d9        	call	_process_is_running
 407  0074 a30000        	cpw	x,#0
 408  0077 274a          	jreq	L322
 409                     ; 140     p->state = PROCESS_STATE_NONE;
 411  0079 1e05          	ldw	x,(OFST+1,sp)
 412  007b 6f08          	clr	(8,x)
 413                     ; 147     for(q = process_list; q != NULL; q = q->next) {
 415  007d ce0000        	ldw	x,_process_list
 416  0080 1f03          	ldw	(OFST-1,sp),x
 419  0082 2016          	jra	L132
 420  0084               L522:
 421                     ; 148       if(p != q) {
 423  0084 1e05          	ldw	x,(OFST+1,sp)
 424  0086 1303          	cpw	x,(OFST-1,sp)
 425  0088 270b          	jreq	L532
 426                     ; 149 	call_process(q, PROCESS_EVENT_EXITED, (process_data_t)p);
 428  008a 1e05          	ldw	x,(OFST+1,sp)
 429  008c 89            	pushw	x
 430  008d 4b87          	push	#135
 431  008f 1e06          	ldw	x,(OFST+2,sp)
 432  0091 ad6e          	call	L51_call_process
 434  0093 5b03          	addw	sp,#3
 435  0095               L532:
 436                     ; 147     for(q = process_list; q != NULL; q = q->next) {
 438  0095 1e03          	ldw	x,(OFST-1,sp)
 439  0097 fe            	ldw	x,(x)
 440  0098 1f03          	ldw	(OFST-1,sp),x
 442  009a               L132:
 445  009a 1e03          	ldw	x,(OFST-1,sp)
 446  009c 26e6          	jrne	L522
 447                     ; 153     if(p->thread != NULL && p != fromprocess) {
 449  009e 1e05          	ldw	x,(OFST+1,sp)
 450  00a0 e605          	ld	a,(5,x)
 451  00a2 ea04          	or	a,(4,x)
 452  00a4 271d          	jreq	L322
 454  00a6 1e05          	ldw	x,(OFST+1,sp)
 455  00a8 1309          	cpw	x,(OFST+5,sp)
 456  00aa 2717          	jreq	L322
 457                     ; 155       process_current = p;
 459  00ac 1e05          	ldw	x,(OFST+1,sp)
 460  00ae cf0002        	ldw	_process_current,x
 461                     ; 156       p->thread(&p->pt, PROCESS_EVENT_EXIT, NULL);
 463  00b1 5f            	clrw	x
 464  00b2 89            	pushw	x
 465  00b3 4b83          	push	#131
 466  00b5 1e08          	ldw	x,(OFST+4,sp)
 467  00b7 1c0006        	addw	x,#6
 468  00ba 1608          	ldw	y,(OFST+4,sp)
 469  00bc 90ee04        	ldw	y,(4,y)
 470  00bf 90fd          	call	(y)
 472  00c1 5b03          	addw	sp,#3
 473  00c3               L322:
 474                     ; 160   if(p == process_list) {
 476  00c3 1e05          	ldw	x,(OFST+1,sp)
 477  00c5 c30000        	cpw	x,_process_list
 478  00c8 260f          	jrne	L142
 479                     ; 161     process_list = process_list->next;
 481  00ca 72ce0000      	ldw	x,[_process_list.w]
 482  00ce cf0000        	ldw	_process_list,x
 484  00d1               L342:
 485                     ; 171   process_current = old_current;
 487  00d1 1e01          	ldw	x,(OFST-3,sp)
 488  00d3 cf0002        	ldw	_process_current,x
 489                     ; 172 }
 490  00d6               L41:
 493  00d6 5b06          	addw	sp,#6
 494  00d8 81            	ret
 495  00d9               L142:
 496                     ; 163     for(q = process_list; q != NULL; q = q->next) {
 498  00d9 ce0000        	ldw	x,_process_list
 499  00dc 1f03          	ldw	(OFST-1,sp),x
 502  00de 201b          	jra	L152
 503  00e0               L542:
 504                     ; 164       if(q->next == p) {
 506  00e0 1e03          	ldw	x,(OFST-1,sp)
 507  00e2 9093          	ldw	y,x
 508  00e4 51            	exgw	x,y
 509  00e5 fe            	ldw	x,(x)
 510  00e6 1305          	cpw	x,(OFST+1,sp)
 511  00e8 51            	exgw	x,y
 512  00e9 260b          	jrne	L552
 513                     ; 165 	q->next = p->next;
 515  00eb 1e05          	ldw	x,(OFST+1,sp)
 516  00ed 1603          	ldw	y,(OFST-1,sp)
 517  00ef 89            	pushw	x
 518  00f0 fe            	ldw	x,(x)
 519  00f1 90ff          	ldw	(y),x
 520  00f3 85            	popw	x
 521                     ; 166 	break;
 523  00f4 20db          	jra	L342
 524  00f6               L552:
 525                     ; 163     for(q = process_list; q != NULL; q = q->next) {
 527  00f6 1e03          	ldw	x,(OFST-1,sp)
 528  00f8 fe            	ldw	x,(x)
 529  00f9 1f03          	ldw	(OFST-1,sp),x
 531  00fb               L152:
 534  00fb 1e03          	ldw	x,(OFST-1,sp)
 535  00fd 26e1          	jrne	L542
 536  00ff 20d0          	jra	L342
 599                     ; 175 call_process(struct process *p, process_event_t ev, process_data_t data)
 599                     ; 176 {
 600                     	switch	.text
 601  0101               L51_call_process:
 603  0101 89            	pushw	x
 604  0102 89            	pushw	x
 605       00000002      OFST:	set	2
 608                     ; 185   if((p->state & PROCESS_STATE_RUNNING) &&
 608                     ; 186      p->thread != NULL) {
 610  0103 e608          	ld	a,(8,x)
 611  0105 a501          	bcp	a,#1
 612  0107 274a          	jreq	L703
 614  0109 e605          	ld	a,(5,x)
 615  010b ea04          	or	a,(4,x)
 616  010d 2744          	jreq	L703
 617                     ; 188     process_current = p;
 620  010f cf0002        	ldw	_process_current,x
 621                     ; 189     p->state = PROCESS_STATE_CALLED;
 623  0112 a602          	ld	a,#2
 624  0114 e708          	ld	(8,x),a
 625                     ; 190     ret = p->thread(&p->pt, ev, data);
 627  0116 1e08          	ldw	x,(OFST+6,sp)
 628  0118 89            	pushw	x
 629  0119 7b09          	ld	a,(OFST+7,sp)
 630  011b 88            	push	a
 631  011c 1e06          	ldw	x,(OFST+4,sp)
 632  011e 1c0006        	addw	x,#6
 633  0121 1606          	ldw	y,(OFST+4,sp)
 634  0123 90ee04        	ldw	y,(4,y)
 635  0126 90fd          	call	(y)
 637  0128 5b03          	addw	sp,#3
 638  012a 5f            	clrw	x
 639  012b 97            	ld	xl,a
 640  012c 1f01          	ldw	(OFST-1,sp),x
 642                     ; 191     if(ret == PT_EXITED ||
 642                     ; 192        ret == PT_ENDED ||
 642                     ; 193        ev == PROCESS_EVENT_EXIT) {
 644  012e 1e01          	ldw	x,(OFST-1,sp)
 645  0130 a30002        	cpw	x,#2
 646  0133 270d          	jreq	L313
 648  0135 1e01          	ldw	x,(OFST-1,sp)
 649  0137 a30003        	cpw	x,#3
 650  013a 2706          	jreq	L313
 652  013c 7b07          	ld	a,(OFST+5,sp)
 653  013e a183          	cp	a,#131
 654  0140 260b          	jrne	L113
 655  0142               L313:
 656                     ; 194       exit_process(p, p);
 658  0142 1e03          	ldw	x,(OFST+1,sp)
 659  0144 89            	pushw	x
 660  0145 1e05          	ldw	x,(OFST+3,sp)
 661  0147 cd004d        	call	L341_exit_process
 663  014a 85            	popw	x
 665  014b 2006          	jra	L703
 666  014d               L113:
 667                     ; 196       p->state = PROCESS_STATE_RUNNING;
 669  014d 1e03          	ldw	x,(OFST+1,sp)
 670  014f a601          	ld	a,#1
 671  0151 e708          	ld	(8,x),a
 672  0153               L703:
 673                     ; 199 }
 676  0153 5b04          	addw	sp,#4
 677  0155 81            	ret
 716                     ; 202 process_exit(struct process *p)
 716                     ; 203 {
 717                     	switch	.text
 718  0156               _process_exit:
 720  0156 89            	pushw	x
 721       00000000      OFST:	set	0
 724                     ; 204   exit_process(p, PROCESS_CURRENT());
 726  0157 ce0002        	ldw	x,_process_current
 727  015a 89            	pushw	x
 728  015b 1e03          	ldw	x,(OFST+3,sp)
 729  015d cd004d        	call	L341_exit_process
 731  0160 85            	popw	x
 732                     ; 205 }
 735  0161 85            	popw	x
 736  0162 81            	ret
 764                     ; 208 process_init(void)
 764                     ; 209 {
 765                     	switch	.text
 766  0163               _process_init:
 770                     ; 210   lastevent = PROCESS_EVENT_MAX;
 772  0163 358a00a3      	mov	L3_lastevent,#138
 773                     ; 212   nevents = fevent = 0;
 775  0167 725f00a1      	clr	L7_fevent
 776  016b 725f00a2      	clr	L5_nevents
 777                     ; 217   process_current = process_list = NULL;
 779  016f 5f            	clrw	x
 780  0170 cf0000        	ldw	_process_list,x
 781  0173 ce0000        	ldw	x,_process_list
 782  0176 cf0002        	ldw	_process_current,x
 783                     ; 218 }
 786  0179 81            	ret
 826                     ; 225 do_poll(void)
 826                     ; 226 {
 827                     	switch	.text
 828  017a               L153_do_poll:
 830  017a 89            	pushw	x
 831       00000002      OFST:	set	2
 834                     ; 229   poll_requested = 0;
 836  017b 725f0000      	clr	L31_poll_requested
 837                     ; 231   for(p = process_list; p != NULL; p = p->next) {
 839  017f ce0000        	ldw	x,_process_list
 840  0182 1f01          	ldw	(OFST-1,sp),x
 843  0184 2020          	jra	L773
 844  0186               L373:
 845                     ; 232     if(p->needspoll) {
 847  0186 1e01          	ldw	x,(OFST-1,sp)
 848  0188 6d09          	tnz	(9,x)
 849  018a 2715          	jreq	L304
 850                     ; 233       p->state = PROCESS_STATE_RUNNING;
 852  018c 1e01          	ldw	x,(OFST-1,sp)
 853  018e a601          	ld	a,#1
 854  0190 e708          	ld	(8,x),a
 855                     ; 234       p->needspoll = 0;
 857  0192 1e01          	ldw	x,(OFST-1,sp)
 858  0194 6f09          	clr	(9,x)
 859                     ; 235       call_process(p, PROCESS_EVENT_POLL, NULL);
 861  0196 5f            	clrw	x
 862  0197 89            	pushw	x
 863  0198 4b82          	push	#130
 864  019a 1e04          	ldw	x,(OFST+2,sp)
 865  019c cd0101        	call	L51_call_process
 867  019f 5b03          	addw	sp,#3
 868  01a1               L304:
 869                     ; 231   for(p = process_list; p != NULL; p = p->next) {
 871  01a1 1e01          	ldw	x,(OFST-1,sp)
 872  01a3 fe            	ldw	x,(x)
 873  01a4 1f01          	ldw	(OFST-1,sp),x
 875  01a6               L773:
 878  01a6 1e01          	ldw	x,(OFST-1,sp)
 879  01a8 26dc          	jrne	L373
 880                     ; 238 }
 883  01aa 85            	popw	x
 884  01ab 81            	ret
 957                     ; 246 do_event(void)
 957                     ; 247 {
 958                     	switch	.text
 959  01ac               L504_do_event:
 961  01ac 5205          	subw	sp,#5
 962       00000005      OFST:	set	5
 965                     ; 261   if(nevents > 0) {
 967  01ae 725d00a2      	tnz	L5_nevents
 968  01b2 2603cc0234    	jreq	L344
 969                     ; 264     ev = events[fevent].ev;
 971  01b7 c600a1        	ld	a,L7_fevent
 972  01ba 97            	ld	xl,a
 973  01bb a605          	ld	a,#5
 974  01bd 42            	mul	x,a
 975  01be d60001        	ld	a,(L11_events,x)
 976  01c1 6b03          	ld	(OFST-2,sp),a
 978                     ; 266     data = events[fevent].data;
 980  01c3 c600a1        	ld	a,L7_fevent
 981  01c6 97            	ld	xl,a
 982  01c7 a605          	ld	a,#5
 983  01c9 42            	mul	x,a
 984  01ca de0002        	ldw	x,(L11_events+1,x)
 985  01cd 1f01          	ldw	(OFST-4,sp),x
 987                     ; 267     receiver = events[fevent].p;
 989  01cf c600a1        	ld	a,L7_fevent
 990  01d2 97            	ld	xl,a
 991  01d3 a605          	ld	a,#5
 992  01d5 42            	mul	x,a
 993  01d6 de0004        	ldw	x,(L11_events+3,x)
 994  01d9 1f04          	ldw	(OFST-1,sp),x
 996                     ; 271     fevent = (fevent + 1) % PROCESS_CONF_NUMEVENTS;
 998  01db c600a1        	ld	a,L7_fevent
 999  01de 5f            	clrw	x
1000  01df 97            	ld	xl,a
1001  01e0 5c            	incw	x
1002  01e1 a620          	ld	a,#32
1003  01e3 cd0000        	call	c_smodx
1005  01e6 01            	rrwa	x,a
1006  01e7 c700a1        	ld	L7_fevent,a
1007  01ea 02            	rlwa	x,a
1008                     ; 272     --nevents;
1010  01eb 725a00a2      	dec	L5_nevents
1011                     ; 276     if(receiver == PROCESS_BROADCAST) {
1013  01ef 1e04          	ldw	x,(OFST-1,sp)
1014  01f1 2628          	jrne	L544
1015                     ; 277       for(p = process_list; p != NULL; p = p->next) {
1017  01f3 ce0000        	ldw	x,_process_list
1018  01f6 1f04          	ldw	(OFST-1,sp),x
1021  01f8 201b          	jra	L354
1022  01fa               L744:
1023                     ; 281 	if(poll_requested) {
1025  01fa 725d0000      	tnz	L31_poll_requested
1026  01fe 2703          	jreq	L754
1027                     ; 282 	  do_poll();
1029  0200 cd017a        	call	L153_do_poll
1031  0203               L754:
1032                     ; 284 	call_process(p, ev, data);
1034  0203 1e01          	ldw	x,(OFST-4,sp)
1035  0205 89            	pushw	x
1036  0206 7b05          	ld	a,(OFST+0,sp)
1037  0208 88            	push	a
1038  0209 1e07          	ldw	x,(OFST+2,sp)
1039  020b cd0101        	call	L51_call_process
1041  020e 5b03          	addw	sp,#3
1042                     ; 277       for(p = process_list; p != NULL; p = p->next) {
1044  0210 1e04          	ldw	x,(OFST-1,sp)
1045  0212 fe            	ldw	x,(x)
1046  0213 1f04          	ldw	(OFST-1,sp),x
1048  0215               L354:
1051  0215 1e04          	ldw	x,(OFST-1,sp)
1052  0217 26e1          	jrne	L744
1054  0219 2019          	jra	L344
1055  021b               L544:
1056                     ; 291       if(ev == PROCESS_EVENT_INIT) {
1058  021b 7b03          	ld	a,(OFST-2,sp)
1059  021d a181          	cp	a,#129
1060  021f 2606          	jrne	L364
1061                     ; 292 	receiver->state = PROCESS_STATE_RUNNING;
1063  0221 1e04          	ldw	x,(OFST-1,sp)
1064  0223 a601          	ld	a,#1
1065  0225 e708          	ld	(8,x),a
1066  0227               L364:
1067                     ; 296       call_process(receiver, ev, data);
1069  0227 1e01          	ldw	x,(OFST-4,sp)
1070  0229 89            	pushw	x
1071  022a 7b05          	ld	a,(OFST+0,sp)
1072  022c 88            	push	a
1073  022d 1e07          	ldw	x,(OFST+2,sp)
1074  022f cd0101        	call	L51_call_process
1076  0232 5b03          	addw	sp,#3
1077  0234               L344:
1078                     ; 299 }
1081  0234 5b05          	addw	sp,#5
1082  0236 81            	ret
1109                     ; 302 process_run(void)
1109                     ; 303 {
1110                     	switch	.text
1111  0237               _process_run:
1115                     ; 305   if(poll_requested) {
1117  0237 725d0000      	tnz	L31_poll_requested
1118  023b 2703          	jreq	L574
1119                     ; 306     do_poll();
1121  023d cd017a        	call	L153_do_poll
1123  0240               L574:
1124                     ; 310   do_event();
1126  0240 cd01ac        	call	L504_do_event
1128                     ; 312   return nevents + poll_requested;
1130  0243 c600a2        	ld	a,L5_nevents
1131  0246 5f            	clrw	x
1132  0247 cb0000        	add	a,L31_poll_requested
1133  024a 2401          	jrnc	L23
1134  024c 5c            	incw	x
1135  024d               L23:
1136  024d 02            	rlwa	x,a
1139  024e 81            	ret
1164                     ; 316 process_nevents(void)
1164                     ; 317 {
1165                     	switch	.text
1166  024f               _process_nevents:
1170                     ; 318   return nevents + poll_requested;
1172  024f c600a2        	ld	a,L5_nevents
1173  0252 5f            	clrw	x
1174  0253 cb0000        	add	a,L31_poll_requested
1175  0256 2401          	jrnc	L63
1176  0258 5c            	incw	x
1177  0259               L63:
1178  0259 02            	rlwa	x,a
1181  025a 81            	ret
1246                     ; 322 process_post(struct process *p, process_event_t ev, process_data_t data)
1246                     ; 323 {
1247                     	switch	.text
1248  025b               _process_post:
1250  025b 89            	pushw	x
1251  025c 88            	push	a
1252       00000001      OFST:	set	1
1255                     ; 326   if(PROCESS_CURRENT() == NULL) {
1257  025d ce0002        	ldw	x,_process_current
1258                     ; 328 	   ev,PROCESS_NAME_STRING(p), nevents);
1260  0260               L145:
1261                     ; 335   if(nevents == PROCESS_CONF_NUMEVENTS) {
1263  0260 c600a2        	ld	a,L5_nevents
1264  0263 a120          	cp	a,#32
1265  0265 2605          	jrne	L345
1266                     ; 343     return PROCESS_ERR_FULL;
1268  0267 ae0001        	ldw	x,#1
1270  026a 2030          	jra	L24
1271  026c               L345:
1272                     ; 346   snum = (process_num_events_t)(fevent + nevents) % PROCESS_CONF_NUMEVENTS;
1274  026c c600a1        	ld	a,L7_fevent
1275  026f cb00a2        	add	a,L5_nevents
1276  0272 a41f          	and	a,#31
1277  0274 6b01          	ld	(OFST+0,sp),a
1279                     ; 347   events[snum].ev = ev;
1281  0276 7b01          	ld	a,(OFST+0,sp)
1282  0278 97            	ld	xl,a
1283  0279 a605          	ld	a,#5
1284  027b 42            	mul	x,a
1285  027c 7b06          	ld	a,(OFST+5,sp)
1286  027e d70001        	ld	(L11_events,x),a
1287                     ; 348   events[snum].data = data;
1289  0281 7b01          	ld	a,(OFST+0,sp)
1290  0283 97            	ld	xl,a
1291  0284 a605          	ld	a,#5
1292  0286 42            	mul	x,a
1293  0287 1607          	ldw	y,(OFST+6,sp)
1294  0289 df0002        	ldw	(L11_events+1,x),y
1295                     ; 349   events[snum].p = p;
1297  028c 7b01          	ld	a,(OFST+0,sp)
1298  028e 97            	ld	xl,a
1299  028f a605          	ld	a,#5
1300  0291 42            	mul	x,a
1301  0292 1602          	ldw	y,(OFST+1,sp)
1302  0294 df0004        	ldw	(L11_events+3,x),y
1303                     ; 350   ++nevents;
1305  0297 725c00a2      	inc	L5_nevents
1306                     ; 358   return PROCESS_ERR_OK;
1308  029b 5f            	clrw	x
1310  029c               L24:
1312  029c 5b03          	addw	sp,#3
1313  029e 81            	ret
1381                     ; 362 process_post_synch(struct process *p, process_event_t ev, process_data_t data)
1381                     ; 363 {
1382                     	switch	.text
1383  029f               _process_post_synch:
1385  029f 89            	pushw	x
1386  02a0 89            	pushw	x
1387       00000002      OFST:	set	2
1390                     ; 364   struct process *caller = process_current;
1392  02a1 ce0002        	ldw	x,_process_current
1393  02a4 1f01          	ldw	(OFST-1,sp),x
1395                     ; 366   call_process(p, ev, data);
1397  02a6 1e08          	ldw	x,(OFST+6,sp)
1398  02a8 89            	pushw	x
1399  02a9 7b09          	ld	a,(OFST+7,sp)
1400  02ab 88            	push	a
1401  02ac 1e06          	ldw	x,(OFST+4,sp)
1402  02ae cd0101        	call	L51_call_process
1404  02b1 5b03          	addw	sp,#3
1405                     ; 367   process_current = caller;
1407  02b3 1e01          	ldw	x,(OFST-1,sp)
1408  02b5 cf0002        	ldw	_process_current,x
1409                     ; 368 }
1412  02b8 5b04          	addw	sp,#4
1413  02ba 81            	ret
1451                     ; 371 process_poll(struct process *p)
1451                     ; 372 {
1452                     	switch	.text
1453  02bb               _process_poll:
1455  02bb 89            	pushw	x
1456       00000000      OFST:	set	0
1459                     ; 373   if(p != NULL) {
1461  02bc a30000        	cpw	x,#0
1462  02bf 2716          	jreq	L126
1463                     ; 374     if(p->state == PROCESS_STATE_RUNNING ||
1463                     ; 375        p->state == PROCESS_STATE_CALLED) {
1465  02c1 e608          	ld	a,(8,x)
1466  02c3 a101          	cp	a,#1
1467  02c5 2706          	jreq	L526
1469  02c7 e608          	ld	a,(8,x)
1470  02c9 a102          	cp	a,#2
1471  02cb 260a          	jrne	L126
1472  02cd               L526:
1473                     ; 376       p->needspoll = 1;
1475  02cd 1e01          	ldw	x,(OFST+1,sp)
1476  02cf a601          	ld	a,#1
1477  02d1 e709          	ld	(9,x),a
1478                     ; 377       poll_requested = 1;
1480  02d3 35010000      	mov	L31_poll_requested,#1
1481  02d7               L126:
1482                     ; 380 }
1485  02d7 85            	popw	x
1486  02d8 81            	ret
1523                     ; 383 process_is_running(struct process *p)
1523                     ; 384 {
1524                     	switch	.text
1525  02d9               _process_is_running:
1529                     ; 385   return p->state != PROCESS_STATE_NONE;
1531  02d9 6d08          	tnz	(8,x)
1532  02db 2705          	jreq	L25
1533  02dd ae0001        	ldw	x,#1
1534  02e0 2001          	jra	L45
1535  02e2               L25:
1536  02e2 5f            	clrw	x
1537  02e3               L45:
1540  02e3 81            	ret
1657                     	switch	.bss
1658  0000               L31_poll_requested:
1659  0000 00            	ds.b	1
1660  0001               L11_events:
1661  0001 000000000000  	ds.b	160
1662  00a1               L7_fevent:
1663  00a1 00            	ds.b	1
1664  00a2               L5_nevents:
1665  00a2 00            	ds.b	1
1666  00a3               L3_lastevent:
1667  00a3 00            	ds.b	1
1668                     	xdef	_process_list
1669                     	xdef	_process_nevents
1670                     	xdef	_process_is_running
1671                     	xdef	_process_run
1672                     	xdef	_process_init
1673                     	xdef	_process_poll
1674                     	xdef	_process_alloc_event
1675                     	xdef	_process_current
1676                     	xdef	_process_exit
1677                     	xdef	_process_post_synch
1678                     	xdef	_process_post
1679                     	xdef	_process_start
1680                     	xref.b	c_x
1700                     	xref	c_smodx
1701                     	end
