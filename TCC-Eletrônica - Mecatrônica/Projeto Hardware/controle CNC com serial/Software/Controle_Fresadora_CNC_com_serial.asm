
_main:

;Controle_Fresadora_CNC_com_serial.c,29 :: 		void main()
;Controle_Fresadora_CNC_com_serial.c,31 :: 		UART1_Init(9600);
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Controle_Fresadora_CNC_com_serial.c,32 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
;Controle_Fresadora_CNC_com_serial.c,33 :: 		trisc=0b10000000;
	MOVLW      128
	MOVWF      TRISC+0
;Controle_Fresadora_CNC_com_serial.c,34 :: 		portc=0;
	CLRF       PORTC+0
;Controle_Fresadora_CNC_com_serial.c,35 :: 		trisb=0;
	CLRF       TRISB+0
;Controle_Fresadora_CNC_com_serial.c,36 :: 		portb=0;
	CLRF       PORTB+0
;Controle_Fresadora_CNC_com_serial.c,37 :: 		adcon1=14;
	MOVLW      14
	MOVWF      ADCON1+0
;Controle_Fresadora_CNC_com_serial.c,39 :: 		trisa=14;
	MOVLW      14
	MOVWF      TRISA+0
;Controle_Fresadora_CNC_com_serial.c,40 :: 		porta=0;
	CLRF       PORTA+0
;Controle_Fresadora_CNC_com_serial.c,43 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Controle_Fresadora_CNC_com_serial.c,44 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Controle_Fresadora_CNC_com_serial.c,45 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Controle_Fresadora_CNC_com_serial.c,46 :: 		caracteres();
	CALL       _caracteres+0
;Controle_Fresadora_CNC_com_serial.c,47 :: 		lcd_out(1,3,"");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,48 :: 		Lcd_Chr_CP(0);
	CLRF       FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,49 :: 		Lcd_out(1,4,"resadora ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,50 :: 		Lcd_Chr_CP(1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,51 :: 		Lcd_Chr_CP(2);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,52 :: 		Lcd_Chr_CP(1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,53 :: 		UART1_Write_text("Fresadora CNC");
	MOVLW      ?lstr3_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Controle_Fresadora_CNC_com_serial.c,54 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Controle_Fresadora_CNC_com_serial.c,55 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Controle_Fresadora_CNC_com_serial.c,57 :: 		while (1)
L_main1:
;Controle_Fresadora_CNC_com_serial.c,59 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Controle_Fresadora_CNC_com_serial.c,61 :: 		comando = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _comando+0
;Controle_Fresadora_CNC_com_serial.c,62 :: 		UART1_Write(comando);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Controle_Fresadora_CNC_com_serial.c,63 :: 		}
L_main3:
;Controle_Fresadora_CNC_com_serial.c,64 :: 		caracteres();
	CALL       _caracteres+0
;Controle_Fresadora_CNC_com_serial.c,65 :: 		rpm=adc_read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _rpm+0
	MOVF       R0+1, 0
	MOVWF      _rpm+1
	CLRF       _rpm+2
	CLRF       _rpm+3
;Controle_Fresadora_CNC_com_serial.c,66 :: 		rpm=(rpm*30000)/1023;
	MOVF       _rpm+0, 0
	MOVWF      R0+0
	MOVF       _rpm+1, 0
	MOVWF      R0+1
	MOVF       _rpm+2, 0
	MOVWF      R0+2
	MOVF       _rpm+3, 0
	MOVWF      R0+3
	MOVLW      48
	MOVWF      R4+0
	MOVLW      117
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	MOVF       R0+0, 0
	MOVWF      _rpm+0
	MOVF       R0+1, 0
	MOVWF      _rpm+1
	MOVF       R0+2, 0
	MOVWF      _rpm+2
	MOVF       R0+3, 0
	MOVWF      _rpm+3
;Controle_Fresadora_CNC_com_serial.c,68 :: 		if(porta.f1==0&&porta.f2==0)
	BTFSC      PORTA+0, 1
	GOTO       L_main6
	BTFSC      PORTA+0, 2
	GOTO       L_main6
L__main41:
;Controle_Fresadora_CNC_com_serial.c,70 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,71 :: 		ferramenta_AD();
	CALL       _ferramenta_AD+0
;Controle_Fresadora_CNC_com_serial.c,72 :: 		}
	GOTO       L_main7
L_main6:
;Controle_Fresadora_CNC_com_serial.c,75 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,76 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;Controle_Fresadora_CNC_com_serial.c,77 :: 		}
L_main7:
;Controle_Fresadora_CNC_com_serial.c,79 :: 		if(porta.f1==0)              //Bomba de Resfriamento
	BTFSC      PORTA+0, 1
	GOTO       L_main8
;Controle_Fresadora_CNC_com_serial.c,81 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,82 :: 		delay_ms(10);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;Controle_Fresadora_CNC_com_serial.c,83 :: 		}
	GOTO       L_main10
L_main8:
;Controle_Fresadora_CNC_com_serial.c,85 :: 		portc.f0=0;
	BCF        PORTC+0, 0
L_main10:
;Controle_Fresadora_CNC_com_serial.c,87 :: 		if(porta.f2==0)               //Ferramenta de usinagem
	BTFSC      PORTA+0, 2
	GOTO       L_main11
;Controle_Fresadora_CNC_com_serial.c,88 :: 		ferramenta_AD();
	CALL       _ferramenta_AD+0
	GOTO       L_main12
L_main11:
;Controle_Fresadora_CNC_com_serial.c,90 :: 		portc.f1=0;
	BCF        PORTC+0, 1
L_main12:
;Controle_Fresadora_CNC_com_serial.c,92 :: 		if(porta.f3==0)               //Hold ATMEGA328P
	BTFSC      PORTA+0, 3
	GOTO       L_main13
;Controle_Fresadora_CNC_com_serial.c,94 :: 		portc.f2=0;
	BCF        PORTC+0, 2
;Controle_Fresadora_CNC_com_serial.c,95 :: 		delay_ms(200);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
;Controle_Fresadora_CNC_com_serial.c,96 :: 		}
	GOTO       L_main15
L_main13:
;Controle_Fresadora_CNC_com_serial.c,99 :: 		portc.f2=1;
	BSF        PORTC+0, 2
;Controle_Fresadora_CNC_com_serial.c,100 :: 		}
L_main15:
;Controle_Fresadora_CNC_com_serial.c,101 :: 		if(comando=='m')
	MOVF       _comando+0, 0
	XORLW      109
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;Controle_Fresadora_CNC_com_serial.c,103 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,104 :: 		ferramenta_AD();
	CALL       _ferramenta_AD+0
;Controle_Fresadora_CNC_com_serial.c,105 :: 		}
L_main16:
;Controle_Fresadora_CNC_com_serial.c,106 :: 		if(comando=='M')
	MOVF       _comando+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;Controle_Fresadora_CNC_com_serial.c,108 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,109 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;Controle_Fresadora_CNC_com_serial.c,110 :: 		caracteres();
	CALL       _caracteres+0
;Controle_Fresadora_CNC_com_serial.c,111 :: 		lcd_out(1,3,"");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,112 :: 		Lcd_Chr_CP(0);
	CLRF       FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,113 :: 		Lcd_out(1,4,"resadora ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,114 :: 		Lcd_Chr_CP(1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,115 :: 		Lcd_Chr_CP(2);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,116 :: 		Lcd_Chr_CP(1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,117 :: 		lcd_out(2,1,"                ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,118 :: 		}
L_main17:
;Controle_Fresadora_CNC_com_serial.c,119 :: 		switch(comando)
	GOTO       L_main18
;Controle_Fresadora_CNC_com_serial.c,121 :: 		case 'b' :           portc.f0=1;
L_main20:
	BSF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,122 :: 		delay_ms(10);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	NOP
	NOP
;Controle_Fresadora_CNC_com_serial.c,123 :: 		break;
	GOTO       L_main19
;Controle_Fresadora_CNC_com_serial.c,124 :: 		case 'f' :           portc.f1=1;
L_main22:
	BSF        PORTC+0, 1
;Controle_Fresadora_CNC_com_serial.c,125 :: 		delay_ms(10);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	NOP
	NOP
;Controle_Fresadora_CNC_com_serial.c,126 :: 		ferramenta_AD();
	CALL       _ferramenta_AD+0
;Controle_Fresadora_CNC_com_serial.c,127 :: 		break;
	GOTO       L_main19
;Controle_Fresadora_CNC_com_serial.c,128 :: 		case 'h' :           portc.f2=0;
L_main24:
	BCF        PORTC+0, 2
;Controle_Fresadora_CNC_com_serial.c,129 :: 		delay_ms(10);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	NOP
	NOP
;Controle_Fresadora_CNC_com_serial.c,130 :: 		break;
	GOTO       L_main19
;Controle_Fresadora_CNC_com_serial.c,131 :: 		case 'B' :           portc.f0=0;
L_main26:
	BCF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,132 :: 		break;
	GOTO       L_main19
;Controle_Fresadora_CNC_com_serial.c,133 :: 		case 'F' :           portc.f1=0;
L_main27:
	BCF        PORTC+0, 1
;Controle_Fresadora_CNC_com_serial.c,134 :: 		caracteres();
	CALL       _caracteres+0
;Controle_Fresadora_CNC_com_serial.c,135 :: 		lcd_out(1,3,"");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,136 :: 		Lcd_Chr_CP(0);
	CLRF       FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,137 :: 		Lcd_out(1,4,"resadora ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,138 :: 		Lcd_Chr_CP(1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,139 :: 		Lcd_Chr_CP(2);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,140 :: 		Lcd_Chr_CP(1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,141 :: 		lcd_out(2,1,"                ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,142 :: 		comando='x';
	MOVLW      120
	MOVWF      _comando+0
;Controle_Fresadora_CNC_com_serial.c,143 :: 		break;
	GOTO       L_main19
;Controle_Fresadora_CNC_com_serial.c,144 :: 		case 'H' :           portc.f2=1;
L_main28:
	BSF        PORTC+0, 2
;Controle_Fresadora_CNC_com_serial.c,145 :: 		break;
	GOTO       L_main19
;Controle_Fresadora_CNC_com_serial.c,147 :: 		}
L_main18:
	MOVF       _comando+0, 0
	XORLW      98
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       _comando+0, 0
	XORLW      102
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVF       _comando+0, 0
	XORLW      104
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _comando+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_main26
	MOVF       _comando+0, 0
	XORLW      70
	BTFSC      STATUS+0, 2
	GOTO       L_main27
	MOVF       _comando+0, 0
	XORLW      72
	BTFSC      STATUS+0, 2
	GOTO       L_main28
L_main19:
;Controle_Fresadora_CNC_com_serial.c,148 :: 		} //fim while
	GOTO       L_main1
;Controle_Fresadora_CNC_com_serial.c,149 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ferramenta_AD:

;Controle_Fresadora_CNC_com_serial.c,151 :: 		void ferramenta_AD()
;Controle_Fresadora_CNC_com_serial.c,153 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;Controle_Fresadora_CNC_com_serial.c,154 :: 		lcd_out(1,3," Velocidade  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,155 :: 		n=rpm/10000;
	MOVLW      16
	MOVWF      R4+0
	MOVLW      39
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _rpm+0, 0
	MOVWF      R0+0
	MOVF       _rpm+1, 0
	MOVWF      R0+1
	MOVF       _rpm+2, 0
	MOVWF      R0+2
	MOVF       _rpm+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R0+0, 0
	MOVWF      _n+0
	MOVF       R0+1, 0
	MOVWF      _n+1
	MOVF       R0+2, 0
	MOVWF      _n+2
	MOVF       R0+3, 0
	MOVWF      _n+3
;Controle_Fresadora_CNC_com_serial.c,156 :: 		lcd_chr(2,4,n+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Controle_Fresadora_CNC_com_serial.c,157 :: 		n=(rpm/1000)%10;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _rpm+0, 0
	MOVWF      R0+0
	MOVF       _rpm+1, 0
	MOVWF      R0+1
	MOVF       _rpm+2, 0
	MOVWF      R0+2
	MOVF       _rpm+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _n+0
	MOVF       R0+1, 0
	MOVWF      _n+1
	MOVF       R0+2, 0
	MOVWF      _n+2
	MOVF       R0+3, 0
	MOVWF      _n+3
;Controle_Fresadora_CNC_com_serial.c,158 :: 		lcd_chr(2,5,n+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Controle_Fresadora_CNC_com_serial.c,159 :: 		n=(rpm/100)%10;
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _rpm+0, 0
	MOVWF      R0+0
	MOVF       _rpm+1, 0
	MOVWF      R0+1
	MOVF       _rpm+2, 0
	MOVWF      R0+2
	MOVF       _rpm+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _n+0
	MOVF       R0+1, 0
	MOVWF      _n+1
	MOVF       R0+2, 0
	MOVWF      _n+2
	MOVF       R0+3, 0
	MOVWF      _n+3
;Controle_Fresadora_CNC_com_serial.c,160 :: 		lcd_chr(2,6,n+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Controle_Fresadora_CNC_com_serial.c,161 :: 		n=(rpm/10)%10;
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _rpm+0, 0
	MOVWF      R0+0
	MOVF       _rpm+1, 0
	MOVWF      R0+1
	MOVF       _rpm+2, 0
	MOVWF      R0+2
	MOVF       _rpm+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _n+0
	MOVF       R0+1, 0
	MOVWF      _n+1
	MOVF       R0+2, 0
	MOVWF      _n+2
	MOVF       R0+3, 0
	MOVWF      _n+3
;Controle_Fresadora_CNC_com_serial.c,162 :: 		lcd_chr(2,7,n+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Controle_Fresadora_CNC_com_serial.c,163 :: 		n=rpm%10;
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _rpm+0, 0
	MOVWF      R0+0
	MOVF       _rpm+1, 0
	MOVWF      R0+1
	MOVF       _rpm+2, 0
	MOVWF      R0+2
	MOVF       _rpm+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _n+0
	MOVF       R0+1, 0
	MOVWF      _n+1
	MOVF       R0+2, 0
	MOVWF      _n+2
	MOVF       R0+3, 0
	MOVWF      _n+3
;Controle_Fresadora_CNC_com_serial.c,164 :: 		lcd_chr(2,8,n+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Controle_Fresadora_CNC_com_serial.c,165 :: 		lcd_out(2,10,"RPM");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,166 :: 		}
L_end_ferramenta_AD:
	RETURN
; end of _ferramenta_AD

_caracteres:

;Controle_Fresadora_CNC_com_serial.c,168 :: 		void caracteres()
;Controle_Fresadora_CNC_com_serial.c,171 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Controle_Fresadora_CNC_com_serial.c,172 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(characterF[i]);
	CLRF       caracteres_i_L0+0
L_caracteres29:
	MOVF       caracteres_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_caracteres30
	MOVF       caracteres_i_L0+0, 0
	ADDLW      _characterF+0
	MOVWF      R0+0
	MOVLW      hi_addr(_characterF+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       caracteres_i_L0+0, 1
	GOTO       L_caracteres29
L_caracteres30:
;Controle_Fresadora_CNC_com_serial.c,173 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(characterC[i]);
	CLRF       caracteres_i_L0+0
L_caracteres32:
	MOVF       caracteres_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_caracteres33
	MOVF       caracteres_i_L0+0, 0
	ADDLW      _characterC+0
	MOVWF      R0+0
	MOVLW      hi_addr(_characterC+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       caracteres_i_L0+0, 1
	GOTO       L_caracteres32
L_caracteres33:
;Controle_Fresadora_CNC_com_serial.c,174 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(characterN[i]);
	CLRF       caracteres_i_L0+0
L_caracteres35:
	MOVF       caracteres_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_caracteres36
	MOVF       caracteres_i_L0+0, 0
	ADDLW      _characterN+0
	MOVWF      R0+0
	MOVLW      hi_addr(_characterN+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       caracteres_i_L0+0, 1
	GOTO       L_caracteres35
L_caracteres36:
;Controle_Fresadora_CNC_com_serial.c,175 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
	CLRF       caracteres_i_L0+0
L_caracteres38:
	MOVF       caracteres_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_caracteres39
	MOVF       caracteres_i_L0+0, 0
	ADDLW      _character1+0
	MOVWF      R0+0
	MOVLW      hi_addr(_character1+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       caracteres_i_L0+0, 1
	GOTO       L_caracteres38
L_caracteres39:
;Controle_Fresadora_CNC_com_serial.c,177 :: 		}
L_end_caracteres:
	RETURN
; end of _caracteres
