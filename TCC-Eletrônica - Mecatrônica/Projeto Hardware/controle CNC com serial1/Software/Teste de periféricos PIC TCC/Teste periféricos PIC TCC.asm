
_main:

;Teste periféricos PIC TCC.c,1 :: 		void main()
;Teste periféricos PIC TCC.c,4 :: 		trisc=0;
	CLRF       TRISC+0
;Teste periféricos PIC TCC.c,5 :: 		portc=0;
	CLRF       PORTC+0
;Teste periféricos PIC TCC.c,6 :: 		trisa=2;
	MOVLW      2
	MOVWF      TRISA+0
;Teste periféricos PIC TCC.c,7 :: 		porta=0;
	CLRF       PORTA+0
;Teste periféricos PIC TCC.c,8 :: 		adcon1=7;
	MOVLW      7
	MOVWF      ADCON1+0
;Teste periféricos PIC TCC.c,9 :: 		while (1)
L_main0:
;Teste periféricos PIC TCC.c,11 :: 		if(porta.f1==0)
	BTFSC      PORTA+0, 1
	GOTO       L_main2
;Teste periféricos PIC TCC.c,13 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;Teste periféricos PIC TCC.c,14 :: 		delay_ms(200);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;Teste periféricos PIC TCC.c,15 :: 		}
	GOTO       L_main4
L_main2:
;Teste periféricos PIC TCC.c,18 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;Teste periféricos PIC TCC.c,19 :: 		delay_ms(200);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;Teste periféricos PIC TCC.c,20 :: 		}
L_main4:
;Teste periféricos PIC TCC.c,22 :: 		} //fim while
	GOTO       L_main0
;Teste periféricos PIC TCC.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
