EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H

N_F10 EQU 15

        ORG 60
IP_F10  DW RUT_F10

        ORG 1000H
MSJ     DB "VAMOS LAS INTERRUPCIONES!"
FINMSJ  DB ?

        ORG 2000H
        CLI
        MOV AL, 0FEH  ;seteo F10 como entrada
        OUT IMR, AL
        MOV AL, N_F10
        OUT INT0, AL
        MOV DX, 0
        STI      
  LAZO: CMP DX, 5  ;comparo las impresiones actuales con 5
        JZ FIN
        JMP LAZO

        ORG 3000H
RUT_F10:PUSH AX
        INC DX  ;Incremento DX para contar la cantidad de veces
        MOV BX, OFFSET MSJ
        MOV AL, OFFSET FINMSJ - OFFSET MSJ
        INT 7
        MOV AL,EOI  ;END OF INTERRUPTION
        OUT EOI, AL  ;END OF INTERRUPTION
        POP AX
        IRET
FIN:    INT 0
END