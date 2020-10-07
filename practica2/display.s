PROCESSOR 16F887
#include <xc.inc>
;CONFIG word1
CONFIG FOSC = INTRC_NOCLKOUT
CONFIG WDTE = OFF
CONFIG PWRTE = ON
CONFIG MCLRE = OFF
CONFIG CP = OFF
CONFIG CPD = OFF
CONFIG BOREN = OFF
CONFIG IESO = OFF
CONFIG FCMEN = ON
CONFIG DEBUG = ON
;CONFIG word2
CONFIG BOR4V=BOR40V
CONFIG WRT = OFF
PSECT udata
mask1:
    DS 1
mask2:
    DS 1
mask3:
    DS 1
PSECT resetVec,class=CODE,delta=2
resetVec:
PAGESEL main
goto main
    
PSECT code
numero0:
BANKSEL PORTA
movlw 0b00111111
movwf PORTA
PAGESEL main
return

PSECT code
numero1:
BANKSEL PORTA
movlw 0b00000110
movwf PORTA
PAGESEL main
return

PSECT code
numero2:
BANKSEL PORTA
movlw 0b01011011
movwf PORTA
PAGESEL main
return
    
PSECT code
numero3:
BANKSEL PORTA
movlw 0b01001111
movwf PORTA
PAGESEL main
return    

PSECT code
numero4:
BANKSEL PORTA
movlw 0b01100110
movwf PORTA
PAGESEL main
return

PSECT code
numero5:
BANKSEL PORTA
movlw 0b01101101
movwf PORTA
PAGESEL main
return
   
PSECT code
numero6:
BANKSEL PORTA
movlw 0b01111101
movwf PORTA
PAGESEL main
return

PSECT code
numero7:
BANKSEL PORTA
movlw 0b00000111
movwf PORTA
PAGESEL main
return

PSECT code
numero8:
BANKSEL PORTA
movlw 0b01111111
movwf PORTA
PAGESEL main
return

PSECT code
numero9:
BANKSEL PORTA
movlw 0b01101111
movwf PORTA
PAGESEL main
return

PSECT code
mataeltiempo_255us:
movlw   0xff
movwf   mask3
decfsz mask3
goto $-1
return

PSECT code
mataeltiempo_65ms:
movlw   0xff
movwf   mask2
call mataeltiempo_255us
decfsz mask2
goto $-2
return
 
PSECT code
mataeltiempo_500ms:
movlw   0x08
movwf mask1
call mataeltiempo_65ms
decfsz  mask1
goto $-2
return
   
PSECT code
main:
bcf STATUS,0
bcf STATUS,5
bcf STATUS,6
BANKSEL ANSEL
CLRF ANSEL
BANKSEL TRISA
MOVLW 0b00000000
MOVWF TRISA
BANKSEL PORTA
CLRF PORTA
    
iniciocrack:
call numero0
call mataeltiempo_500ms
call numero1
call mataeltiempo_500ms
call numero2
call mataeltiempo_500ms
call numero3
call mataeltiempo_500ms
call numero4
call mataeltiempo_500ms
call numero5
call mataeltiempo_500ms
call numero6
call mataeltiempo_500ms
call numero7
call mataeltiempo_500ms
call numero8
call mataeltiempo_500ms
call numero9
call mataeltiempo_500ms
GOTO iniciocrack
END