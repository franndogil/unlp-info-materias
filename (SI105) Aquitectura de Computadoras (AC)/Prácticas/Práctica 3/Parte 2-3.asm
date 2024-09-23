EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H

N_F10 EQU 15

        ORG 60
IP_F10  DW RUT_F10

        ORG 2000H
        CLI
        MOV AL, 0FEH  ;seteo F10 como entrada
        OUT IMR, AL
        MOV AL, N_F10  ;
        OUT INT0, AL
        MOV DX, 0  ;inicializo el contador en 0
        STI
  LAZO: JMP LAZO

        ORG 3000H
RUT_F10:PUSH AX
        INC DX  ;incremento el contador
        MOV AL, EOI
        OUT EOI, AL  ;END OF INTERRUPTION
        POP AX
        IRET
END

;a) Las instrucciones CLI y STI se utilizan para activar y desactivar
;las interrupciones

;b) Se usa el valor 0FEH en el programa para indicarle al 
;IMR que vamos a activar solamente las interrupciones por
;tecla F10

;c) Las instrucciones que le indican al PIC que la interrupcion
;terminó son:
; 1) IRET
; 2) MOV AL, EOI
;    OUT EOI, AL

;d) En la direccion 60 ¿? PREGUNTAR