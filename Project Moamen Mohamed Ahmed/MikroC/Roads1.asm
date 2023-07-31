
_counter:

;Roads1.c,8 :: 		void counter(int start, int bulb){
;Roads1.c,9 :: 		portc = bulb;
	MOVF       FARG_counter_bulb+0, 0
	MOVWF      PORTC+0
;Roads1.c,10 :: 		for(i = start; i >= 0; i--){
	MOVF       FARG_counter_start+0, 0
	MOVWF      _i+0
	MOVF       FARG_counter_start+1, 0
	MOVWF      _i+1
L_counter0:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__counter41
	MOVLW      0
	SUBWF      _i+0, 0
L__counter41:
	BTFSS      STATUS+0, 0
	GOTO       L_counter1
;Roads1.c,11 :: 		if(portd.b0 == 0){
	BTFSC      PORTD+0, 0
	GOTO       L_counter3
;Roads1.c,12 :: 		return;
	GOTO       L_end_counter
;Roads1.c,13 :: 		}
L_counter3:
;Roads1.c,14 :: 		portb = seg[i];
	MOVF       _i+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Roads1.c,15 :: 		delay_ms(wait);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_counter4:
	DECFSZ     R13+0, 1
	GOTO       L_counter4
	DECFSZ     R12+0, 1
	GOTO       L_counter4
	DECFSZ     R11+0, 1
	GOTO       L_counter4
	NOP
	NOP
;Roads1.c,16 :: 		if(i <= 4 && portc.b3 == 0){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__counter42
	MOVF       _i+0, 0
	SUBLW      4
L__counter42:
	BTFSS      STATUS+0, 0
	GOTO       L_counter7
	BTFSC      PORTC+0, 3
	GOTO       L_counter7
L__counter37:
;Roads1.c,17 :: 		portc.b3 = 1;
	BSF        PORTC+0, 3
;Roads1.c,18 :: 		portc.b4 = 0;
	BCF        PORTC+0, 4
;Roads1.c,19 :: 		}
	GOTO       L_counter8
L_counter7:
;Roads1.c,20 :: 		else if(i <= 4 && portc.b0 == 0){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__counter43
	MOVF       _i+0, 0
	SUBLW      4
L__counter43:
	BTFSS      STATUS+0, 0
	GOTO       L_counter11
	BTFSC      PORTC+0, 0
	GOTO       L_counter11
L__counter36:
;Roads1.c,21 :: 		portc.b0 = 1;
	BSF        PORTC+0, 0
;Roads1.c,22 :: 		portc.b1 = 0;
	BCF        PORTC+0, 1
;Roads1.c,23 :: 		}
L_counter11:
L_counter8:
;Roads1.c,10 :: 		for(i = start; i >= 0; i--){
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;Roads1.c,24 :: 		}
	GOTO       L_counter0
L_counter1:
;Roads1.c,25 :: 		portc.b1 = 1;
	BSF        PORTC+0, 1
;Roads1.c,26 :: 		portc.b4 = 1;
	BSF        PORTC+0, 4
;Roads1.c,27 :: 		}
L_end_counter:
	RETURN
; end of _counter

_main:

;Roads1.c,28 :: 		void main() {
;Roads1.c,29 :: 		adcon1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;Roads1.c,30 :: 		trisb = 0; trisa.b0 = 0; trisa.b1 = 0; trisa.b2 = 0; trisa.b3 = 0; trisc = 0; trisd = 1;
	CLRF       TRISB+0
	BCF        TRISA+0, 0
	BCF        TRISA+0, 1
	BCF        TRISA+0, 2
	BCF        TRISA+0, 3
	CLRF       TRISC+0
	MOVLW      1
	MOVWF      TRISD+0
;Roads1.c,31 :: 		porta.b0 = 1; porta.b1 = 1; porta.b2 = 1; porta.b3 = 1; portc = 0; portd.b0 = 1; portd.b1 = 1;
	BSF        PORTA+0, 0
	BSF        PORTA+0, 1
	BSF        PORTA+0, 2
	BSF        PORTA+0, 3
	CLRF       PORTC+0
	BSF        PORTD+0, 0
	BSF        PORTD+0, 1
;Roads1.c,32 :: 		while(1){
L_main12:
;Roads1.c,33 :: 		if(portd.b0 == 1){
	BTFSS      PORTD+0, 0
	GOTO       L_main14
;Roads1.c,34 :: 		porta.b0 = 1; porta.b1 = 1; porta.b2 = 1; porta.b3 = 1;
	BSF        PORTA+0, 0
	BSF        PORTA+0, 1
	BSF        PORTA+0, 2
	BSF        PORTA+0, 3
;Roads1.c,35 :: 		counter(wred, 0b11110011);
	MOVLW      15
	MOVWF      FARG_counter_start+0
	MOVLW      0
	MOVWF      FARG_counter_start+1
	MOVLW      243
	MOVWF      FARG_counter_bulb+0
	CLRF       FARG_counter_bulb+1
	CALL       _counter+0
;Roads1.c,36 :: 		counter(sred, 0b11011110);
	MOVLW      23
	MOVWF      FARG_counter_start+0
	MOVLW      0
	MOVWF      FARG_counter_start+1
	MOVLW      222
	MOVWF      FARG_counter_bulb+0
	CLRF       FARG_counter_bulb+1
	CALL       _counter+0
;Roads1.c,37 :: 		}
	GOTO       L_main15
L_main14:
;Roads1.c,39 :: 		porta.b0 = 0; porta.b1 = 0; porta.b2 = 0; porta.b3 = 0;
	BCF        PORTA+0, 0
	BCF        PORTA+0, 1
	BCF        PORTA+0, 2
	BCF        PORTA+0, 3
;Roads1.c,40 :: 		portc = 0b11011110;
	MOVLW      222
	MOVWF      PORTC+0
;Roads1.c,41 :: 		portb = seg[0];
	MOVF       _seg+0, 0
	MOVWF      PORTB+0
;Roads1.c,42 :: 		while(1){
L_main16:
;Roads1.c,43 :: 		porta.b0 = 1; porta.b1 = 1; porta.b2 = 1; porta.b3 = 1;
	BSF        PORTA+0, 0
	BSF        PORTA+0, 1
	BSF        PORTA+0, 2
	BSF        PORTA+0, 3
;Roads1.c,44 :: 		if(portd.b0 == 1){
	BTFSS      PORTD+0, 0
	GOTO       L_main18
;Roads1.c,45 :: 		if(portc == 0b11110011){
	MOVF       PORTC+0, 0
	XORLW      243
	BTFSS      STATUS+0, 2
	GOTO       L_main19
;Roads1.c,46 :: 		counter(wred, 0b11110011);
	MOVLW      15
	MOVWF      FARG_counter_start+0
	MOVLW      0
	MOVWF      FARG_counter_start+1
	MOVLW      243
	MOVWF      FARG_counter_bulb+0
	CLRF       FARG_counter_bulb+1
	CALL       _counter+0
;Roads1.c,47 :: 		}
	GOTO       L_main20
L_main19:
;Roads1.c,49 :: 		counter(sred, 0b11011110);
	MOVLW      23
	MOVWF      FARG_counter_start+0
	MOVLW      0
	MOVWF      FARG_counter_start+1
	MOVLW      222
	MOVWF      FARG_counter_bulb+0
	CLRF       FARG_counter_bulb+1
	CALL       _counter+0
;Roads1.c,50 :: 		}
L_main20:
;Roads1.c,51 :: 		}
L_main18:
;Roads1.c,52 :: 		if(portd.b1 == 0 && portc == 0b11110011){
	BTFSC      PORTD+0, 1
	GOTO       L_main23
	MOVF       PORTC+0, 0
	XORLW      243
	BTFSS      STATUS+0, 2
	GOTO       L_main23
L__main39:
;Roads1.c,53 :: 		for(i = 3; i >= 0; i--){
	MOVLW      3
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main24:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVLW      0
	SUBWF      _i+0, 0
L__main45:
	BTFSS      STATUS+0, 0
	GOTO       L_main25
;Roads1.c,54 :: 		portc = 0b11101011;
	MOVLW      235
	MOVWF      PORTC+0
;Roads1.c,55 :: 		portb = seg[i];
	MOVF       _i+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Roads1.c,56 :: 		delay_ms(wait);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
	NOP
;Roads1.c,53 :: 		for(i = 3; i >= 0; i--){
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;Roads1.c,57 :: 		}
	GOTO       L_main24
L_main25:
;Roads1.c,58 :: 		portc = 0b11011110;
	MOVLW      222
	MOVWF      PORTC+0
;Roads1.c,59 :: 		}
	GOTO       L_main28
L_main23:
;Roads1.c,60 :: 		else if(portd.b1 == 1 && portc == 0b11011110){
	BTFSS      PORTD+0, 1
	GOTO       L_main31
	MOVF       PORTC+0, 0
	XORLW      222
	BTFSS      STATUS+0, 2
	GOTO       L_main31
L__main38:
;Roads1.c,61 :: 		for(i = 3; i >= 0; i--){
	MOVLW      3
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main32:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVLW      0
	SUBWF      _i+0, 0
L__main46:
	BTFSS      STATUS+0, 0
	GOTO       L_main33
;Roads1.c,62 :: 		portc = 0b11011101;
	MOVLW      221
	MOVWF      PORTC+0
;Roads1.c,63 :: 		portb = seg[i];
	MOVF       _i+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Roads1.c,64 :: 		delay_ms(wait);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
	NOP
;Roads1.c,61 :: 		for(i = 3; i >= 0; i--){
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;Roads1.c,65 :: 		}
	GOTO       L_main32
L_main33:
;Roads1.c,66 :: 		portc = 0b11110011;
	MOVLW      243
	MOVWF      PORTC+0
;Roads1.c,67 :: 		}
L_main31:
L_main28:
;Roads1.c,68 :: 		}
	GOTO       L_main16
;Roads1.c,69 :: 		}
L_main15:
;Roads1.c,70 :: 		}
	GOTO       L_main12
;Roads1.c,71 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
