
_main:

	MOVLW      128
	MOVWF      TRISC+0
	CLRF       PORTC+0
	MOVLW      7
	MOVWF      ADCON1+0
	MOVLW      7
	MOVWF      CMCON+0
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
	MOVLW      ?lstr1_serial_teste+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L_main1:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _comando+0
	MOVLW      250
	MOVWF      _comando+0
	MOVLW      1
	MOVWF      _x+0
	MOVLW      0
	MOVWF      _x+1
L_main5:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _x+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       _x+0, 0
	SUBLW      7
L__main13:
	BTFSS      STATUS+0, 0
	GOTO       L_main6
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _x+0, 0
	ADDLW      _comando+0
	MOVWF      FLOC__main+0
	CALL       _UART1_Read+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       _x+0, 1
	BTFSC      STATUS+0, 2
	INCF       _x+1, 1
L_main7:
	MOVLW      97
	MOVWF      _comando+1
	MOVLW      ?lstr2_serial_teste+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	MOVLW      98
	MOVWF      _comando+2
	MOVLW      ?lstr3_serial_teste+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	MOVLW      99
	MOVWF      _comando+3
	MOVLW      ?lstr4_serial_teste+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	MOVLW      100
	MOVWF      _comando+4
	MOVLW      ?lstr5_serial_teste+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	GOTO       L_main5
L_main6:
L_main3:
	GOTO       L_main1
L_end_main:
	GOTO       $+0
; end of _main
