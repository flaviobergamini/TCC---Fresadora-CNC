
_main:

;Controle_Fresadora_CNC_com_serial.c,32 :: 		void main()
;Controle_Fresadora_CNC_com_serial.c,34 :: 		UART1_Init(9600);
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Controle_Fresadora_CNC_com_serial.c,35 :: 		Delay_ms(100);
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
;Controle_Fresadora_CNC_com_serial.c,36 :: 		trisc=0b10000000;
	MOVLW      128
	MOVWF      TRISC+0
;Controle_Fresadora_CNC_com_serial.c,37 :: 		portc=0;
	CLRF       PORTC+0
;Controle_Fresadora_CNC_com_serial.c,38 :: 		trisb=0;
	CLRF       TRISB+0
;Controle_Fresadora_CNC_com_serial.c,39 :: 		portb=0;
	CLRF       PORTB+0
;Controle_Fresadora_CNC_com_serial.c,40 :: 		adcon1=14;
	MOVLW      14
	MOVWF      ADCON1+0
;Controle_Fresadora_CNC_com_serial.c,41 :: 		trisa=15;
	MOVLW      15
	MOVWF      TRISA+0
;Controle_Fresadora_CNC_com_serial.c,42 :: 		porta=0;
	CLRF       PORTA+0
;Controle_Fresadora_CNC_com_serial.c,45 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Controle_Fresadora_CNC_com_serial.c,46 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Controle_Fresadora_CNC_com_serial.c,47 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Controle_Fresadora_CNC_com_serial.c,48 :: 		caracteres();
	CALL       _caracteres+0
;Controle_Fresadora_CNC_com_serial.c,49 :: 		lcd_out(1,3,"");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,50 :: 		Lcd_Chr_CP(0);
	CLRF       FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,51 :: 		Lcd_out(1,4,"resadora ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,52 :: 		Lcd_Chr_CP(1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,53 :: 		Lcd_Chr_CP(2);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,54 :: 		Lcd_Chr_CP(1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,55 :: 		detalhes_visuais();
	CALL       _detalhes_visuais+0
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
;Controle_Fresadora_CNC_com_serial.c,64 :: 		suporte();
	CALL       _suporte+0
;Controle_Fresadora_CNC_com_serial.c,65 :: 		caracteres();
	CALL       _caracteres+0
;Controle_Fresadora_CNC_com_serial.c,66 :: 		rpm=adc_read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _rpm+0
	MOVF       R0+1, 0
	MOVWF      _rpm+1
;Controle_Fresadora_CNC_com_serial.c,69 :: 		if(porta.f1==0&&porta.f2==0)
	BTFSC      PORTA+0, 1
	GOTO       L_main6
	BTFSC      PORTA+0, 2
	GOTO       L_main6
L__main62:
;Controle_Fresadora_CNC_com_serial.c,71 :: 		comando='x';
	MOVLW      120
	MOVWF      _comando+0
;Controle_Fresadora_CNC_com_serial.c,72 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,73 :: 		ferramenta_AD();
	CALL       _ferramenta_AD+0
;Controle_Fresadora_CNC_com_serial.c,74 :: 		}
	GOTO       L_main7
L_main6:
;Controle_Fresadora_CNC_com_serial.c,77 :: 		comando=comando;
;Controle_Fresadora_CNC_com_serial.c,78 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,79 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;Controle_Fresadora_CNC_com_serial.c,80 :: 		}
L_main7:
;Controle_Fresadora_CNC_com_serial.c,82 :: 		if(porta.f1==0)              //Bomba de Resfriamento
	BTFSC      PORTA+0, 1
	GOTO       L_main8
;Controle_Fresadora_CNC_com_serial.c,84 :: 		comando='x';
	MOVLW      120
	MOVWF      _comando+0
;Controle_Fresadora_CNC_com_serial.c,85 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,86 :: 		delay_ms(10);
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
;Controle_Fresadora_CNC_com_serial.c,87 :: 		}
	GOTO       L_main10
L_main8:
;Controle_Fresadora_CNC_com_serial.c,90 :: 		comando=comando;
;Controle_Fresadora_CNC_com_serial.c,91 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,92 :: 		}
L_main10:
;Controle_Fresadora_CNC_com_serial.c,94 :: 		if(porta.f2==0)               //Ferramenta de usinagem
	BTFSC      PORTA+0, 2
	GOTO       L_main11
;Controle_Fresadora_CNC_com_serial.c,96 :: 		comando='x';
	MOVLW      120
	MOVWF      _comando+0
;Controle_Fresadora_CNC_com_serial.c,97 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;Controle_Fresadora_CNC_com_serial.c,98 :: 		ferramenta_AD();
	CALL       _ferramenta_AD+0
;Controle_Fresadora_CNC_com_serial.c,99 :: 		}
	GOTO       L_main12
L_main11:
;Controle_Fresadora_CNC_com_serial.c,102 :: 		comando=comando;
;Controle_Fresadora_CNC_com_serial.c,103 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;Controle_Fresadora_CNC_com_serial.c,104 :: 		}
L_main12:
;Controle_Fresadora_CNC_com_serial.c,106 :: 		if(porta.f3==0)               //Hold ATMEGA328P
	BTFSC      PORTA+0, 3
	GOTO       L_main13
;Controle_Fresadora_CNC_com_serial.c,108 :: 		comando='x';
	MOVLW      120
	MOVWF      _comando+0
;Controle_Fresadora_CNC_com_serial.c,109 :: 		portc.f3=0;
	BCF        PORTC+0, 3
;Controle_Fresadora_CNC_com_serial.c,110 :: 		delay_ms(200);
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
;Controle_Fresadora_CNC_com_serial.c,111 :: 		}
	GOTO       L_main15
L_main13:
;Controle_Fresadora_CNC_com_serial.c,114 :: 		comando=comando;
;Controle_Fresadora_CNC_com_serial.c,115 :: 		portc.f3=1;
	BSF        PORTC+0, 3
;Controle_Fresadora_CNC_com_serial.c,116 :: 		}
L_main15:
;Controle_Fresadora_CNC_com_serial.c,117 :: 		if(comando=='m')
	MOVF       _comando+0, 0
	XORLW      109
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;Controle_Fresadora_CNC_com_serial.c,119 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,120 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;Controle_Fresadora_CNC_com_serial.c,121 :: 		ferramenta_AD();
	CALL       _ferramenta_AD+0
;Controle_Fresadora_CNC_com_serial.c,122 :: 		}
L_main16:
;Controle_Fresadora_CNC_com_serial.c,123 :: 		if(comando=='M')
	MOVF       _comando+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;Controle_Fresadora_CNC_com_serial.c,125 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,126 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;Controle_Fresadora_CNC_com_serial.c,127 :: 		caracteres();
	CALL       _caracteres+0
;Controle_Fresadora_CNC_com_serial.c,128 :: 		lcd_out(1,3,"");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,129 :: 		Lcd_Chr_CP(0);
	CLRF       FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,130 :: 		Lcd_out(1,4,"resadora ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,131 :: 		Lcd_Chr_CP(1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,132 :: 		Lcd_Chr_CP(2);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,133 :: 		Lcd_Chr_CP(1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,134 :: 		lcd_out(2,1,"                ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,135 :: 		detalhes_visuais();
	CALL       _detalhes_visuais+0
;Controle_Fresadora_CNC_com_serial.c,136 :: 		comando='x';
	MOVLW      120
	MOVWF      _comando+0
;Controle_Fresadora_CNC_com_serial.c,137 :: 		}
L_main17:
;Controle_Fresadora_CNC_com_serial.c,138 :: 		switch(comando)
	GOTO       L_main18
;Controle_Fresadora_CNC_com_serial.c,140 :: 		case 'b' :           portc.f0=1;
L_main20:
	BSF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,141 :: 		delay_ms(10);
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
;Controle_Fresadora_CNC_com_serial.c,142 :: 		break;
	GOTO       L_main19
;Controle_Fresadora_CNC_com_serial.c,144 :: 		case 'f' :           portc.f1=1;
L_main22:
	BSF        PORTC+0, 1
;Controle_Fresadora_CNC_com_serial.c,145 :: 		delay_ms(10);
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
;Controle_Fresadora_CNC_com_serial.c,146 :: 		ferramenta_AD();
	CALL       _ferramenta_AD+0
;Controle_Fresadora_CNC_com_serial.c,147 :: 		break;
	GOTO       L_main19
;Controle_Fresadora_CNC_com_serial.c,149 :: 		case 'h' :           portc.f3=0;
L_main24:
	BCF        PORTC+0, 3
;Controle_Fresadora_CNC_com_serial.c,150 :: 		delay_ms(10);
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
;Controle_Fresadora_CNC_com_serial.c,151 :: 		break;
	GOTO       L_main19
;Controle_Fresadora_CNC_com_serial.c,153 :: 		case 'B' :           portc.f0=0;
L_main26:
	BCF        PORTC+0, 0
;Controle_Fresadora_CNC_com_serial.c,154 :: 		break;
	GOTO       L_main19
;Controle_Fresadora_CNC_com_serial.c,156 :: 		case 'F' :           portc.f1=0;
L_main27:
	BCF        PORTC+0, 1
;Controle_Fresadora_CNC_com_serial.c,157 :: 		caracteres();
	CALL       _caracteres+0
;Controle_Fresadora_CNC_com_serial.c,158 :: 		lcd_out(1,3,"");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,159 :: 		Lcd_Chr_CP(0);
	CLRF       FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,160 :: 		Lcd_out(1,4,"resadora ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,161 :: 		Lcd_Chr_CP(1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,162 :: 		Lcd_Chr_CP(2);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,163 :: 		Lcd_Chr_CP(1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,164 :: 		lcd_out(2,1,"                ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,165 :: 		comando='x';
	MOVLW      120
	MOVWF      _comando+0
;Controle_Fresadora_CNC_com_serial.c,166 :: 		detalhes_visuais();
	CALL       _detalhes_visuais+0
;Controle_Fresadora_CNC_com_serial.c,167 :: 		break;
	GOTO       L_main19
;Controle_Fresadora_CNC_com_serial.c,169 :: 		case 'H' :           portc.f3=1;
L_main28:
	BSF        PORTC+0, 3
;Controle_Fresadora_CNC_com_serial.c,170 :: 		break;
	GOTO       L_main19
;Controle_Fresadora_CNC_com_serial.c,172 :: 		}
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
;Controle_Fresadora_CNC_com_serial.c,173 :: 		} //fim while
	GOTO       L_main1
;Controle_Fresadora_CNC_com_serial.c,174 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ferramenta_AD:

;Controle_Fresadora_CNC_com_serial.c,176 :: 		void ferramenta_AD()
;Controle_Fresadora_CNC_com_serial.c,178 :: 		lcd_out(1,3," Velocidade:  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,180 :: 		if(rpm<=1023&&rpm>=705)
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rpm+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ferramenta_AD68
	MOVF       _rpm+0, 0
	SUBLW      255
L__ferramenta_AD68:
	BTFSS      STATUS+0, 0
	GOTO       L_ferramenta_AD31
	MOVLW      128
	XORWF      _rpm+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      2
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ferramenta_AD69
	MOVLW      193
	SUBWF      _rpm+0, 0
L__ferramenta_AD69:
	BTFSS      STATUS+0, 0
	GOTO       L_ferramenta_AD31
L__ferramenta_AD65:
;Controle_Fresadora_CNC_com_serial.c,181 :: 		lcd_out(2,6,"Maxima");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_ferramenta_AD31:
;Controle_Fresadora_CNC_com_serial.c,183 :: 		if(rpm<=704&&rpm>=429)
	MOVLW      128
	XORLW      2
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rpm+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ferramenta_AD70
	MOVF       _rpm+0, 0
	SUBLW      192
L__ferramenta_AD70:
	BTFSS      STATUS+0, 0
	GOTO       L_ferramenta_AD34
	MOVLW      128
	XORWF      _rpm+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ferramenta_AD71
	MOVLW      173
	SUBWF      _rpm+0, 0
L__ferramenta_AD71:
	BTFSS      STATUS+0, 0
	GOTO       L_ferramenta_AD34
L__ferramenta_AD64:
;Controle_Fresadora_CNC_com_serial.c,184 :: 		lcd_out(2,5," Media ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_ferramenta_AD34:
;Controle_Fresadora_CNC_com_serial.c,186 :: 		if(rpm<=428&&rpm>=0)
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rpm+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ferramenta_AD72
	MOVF       _rpm+0, 0
	SUBLW      172
L__ferramenta_AD72:
	BTFSS      STATUS+0, 0
	GOTO       L_ferramenta_AD37
	MOVLW      128
	XORWF      _rpm+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ferramenta_AD73
	MOVLW      0
	SUBWF      _rpm+0, 0
L__ferramenta_AD73:
	BTFSS      STATUS+0, 0
	GOTO       L_ferramenta_AD37
L__ferramenta_AD63:
;Controle_Fresadora_CNC_com_serial.c,187 :: 		lcd_out(2,6,"Minima");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_ferramenta_AD37:
;Controle_Fresadora_CNC_com_serial.c,200 :: 		}
L_end_ferramenta_AD:
	RETURN
; end of _ferramenta_AD

_caracteres:

;Controle_Fresadora_CNC_com_serial.c,202 :: 		void caracteres()
;Controle_Fresadora_CNC_com_serial.c,205 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Controle_Fresadora_CNC_com_serial.c,206 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(characterF[i]);
	CLRF       caracteres_i_L0+0
L_caracteres38:
	MOVF       caracteres_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_caracteres39
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
	GOTO       L_caracteres38
L_caracteres39:
;Controle_Fresadora_CNC_com_serial.c,207 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(characterC[i]);
	CLRF       caracteres_i_L0+0
L_caracteres41:
	MOVF       caracteres_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_caracteres42
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
	GOTO       L_caracteres41
L_caracteres42:
;Controle_Fresadora_CNC_com_serial.c,208 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(characterN[i]);
	CLRF       caracteres_i_L0+0
L_caracteres44:
	MOVF       caracteres_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_caracteres45
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
	GOTO       L_caracteres44
L_caracteres45:
;Controle_Fresadora_CNC_com_serial.c,209 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
	CLRF       caracteres_i_L0+0
L_caracteres47:
	MOVF       caracteres_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_caracteres48
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
	GOTO       L_caracteres47
L_caracteres48:
;Controle_Fresadora_CNC_com_serial.c,210 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(characterB[i]);
	CLRF       caracteres_i_L0+0
L_caracteres50:
	MOVF       caracteres_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_caracteres51
	MOVF       caracteres_i_L0+0, 0
	ADDLW      _characterB+0
	MOVWF      R0+0
	MOVLW      hi_addr(_characterB+0)
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
	GOTO       L_caracteres50
L_caracteres51:
;Controle_Fresadora_CNC_com_serial.c,211 :: 		}
L_end_caracteres:
	RETURN
; end of _caracteres

_detalhes_visuais:

;Controle_Fresadora_CNC_com_serial.c,213 :: 		void detalhes_visuais()
;Controle_Fresadora_CNC_com_serial.c,215 :: 		for(x=0;x<17;x++)
	CLRF       _x+0
	CLRF       _x+1
L_detalhes_visuais53:
	MOVLW      128
	XORWF      _x+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__detalhes_visuais76
	MOVLW      17
	SUBWF      _x+0, 0
L__detalhes_visuais76:
	BTFSC      STATUS+0, 0
	GOTO       L_detalhes_visuais54
;Controle_Fresadora_CNC_com_serial.c,217 :: 		lcd_out(2,x,"");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       _x+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,218 :: 		Lcd_Chr_CP(3);
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Controle_Fresadora_CNC_com_serial.c,219 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_detalhes_visuais56:
	DECFSZ     R13+0, 1
	GOTO       L_detalhes_visuais56
	DECFSZ     R12+0, 1
	GOTO       L_detalhes_visuais56
	DECFSZ     R11+0, 1
	GOTO       L_detalhes_visuais56
	NOP
;Controle_Fresadora_CNC_com_serial.c,215 :: 		for(x=0;x<17;x++)
	INCF       _x+0, 1
	BTFSC      STATUS+0, 2
	INCF       _x+1, 1
;Controle_Fresadora_CNC_com_serial.c,220 :: 		}
	GOTO       L_detalhes_visuais53
L_detalhes_visuais54:
;Controle_Fresadora_CNC_com_serial.c,223 :: 		for(x=0;x<17;x++)
	CLRF       _x+0
	CLRF       _x+1
L_detalhes_visuais57:
	MOVLW      128
	XORWF      _x+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__detalhes_visuais77
	MOVLW      17
	SUBWF      _x+0, 0
L__detalhes_visuais77:
	BTFSC      STATUS+0, 0
	GOTO       L_detalhes_visuais58
;Controle_Fresadora_CNC_com_serial.c,225 :: 		lcd_out(2,x," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       _x+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Controle_Fresadora_CNC_com_serial.c,226 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_detalhes_visuais60:
	DECFSZ     R13+0, 1
	GOTO       L_detalhes_visuais60
	DECFSZ     R12+0, 1
	GOTO       L_detalhes_visuais60
	DECFSZ     R11+0, 1
	GOTO       L_detalhes_visuais60
	NOP
;Controle_Fresadora_CNC_com_serial.c,223 :: 		for(x=0;x<17;x++)
	INCF       _x+0, 1
	BTFSC      STATUS+0, 2
	INCF       _x+1, 1
;Controle_Fresadora_CNC_com_serial.c,228 :: 		}
	GOTO       L_detalhes_visuais57
L_detalhes_visuais58:
;Controle_Fresadora_CNC_com_serial.c,229 :: 		}
L_end_detalhes_visuais:
	RETURN
; end of _detalhes_visuais

_suporte:

;Controle_Fresadora_CNC_com_serial.c,231 :: 		void suporte()
;Controle_Fresadora_CNC_com_serial.c,233 :: 		if(comando=='!')
	MOVF       _comando+0, 0
	XORLW      33
	BTFSS      STATUS+0, 2
	GOTO       L_suporte61
;Controle_Fresadora_CNC_com_serial.c,235 :: 		UART1_Write_Text("Copyright Reserved by");
	MOVLW      ?lstr15_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Controle_Fresadora_CNC_com_serial.c,236 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Controle_Fresadora_CNC_com_serial.c,237 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Controle_Fresadora_CNC_com_serial.c,238 :: 		UART1_Write_Text("Flavio H. M. Bergamini");
	MOVLW      ?lstr16_Controle_Fresadora_CNC_com_serial+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Controle_Fresadora_CNC_com_serial.c,239 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Controle_Fresadora_CNC_com_serial.c,240 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Controle_Fresadora_CNC_com_serial.c,241 :: 		}
L_suporte61:
;Controle_Fresadora_CNC_com_serial.c,242 :: 		}
L_end_suporte:
	RETURN
; end of _suporte
