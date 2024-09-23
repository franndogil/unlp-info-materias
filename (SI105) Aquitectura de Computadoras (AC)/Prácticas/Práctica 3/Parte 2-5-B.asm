EOI EQU 20H
IMR EQU 21H
INT1 EQU 25H

CONT EQU 10H
COMP EQU 11H

N_TIMER EQU 20

        ORG 80
IP_TIMER DW RUT_TIMER

        ORG 1000H
MSJ     DB "VAMOS LAS INTERRUPCIONES!"
FINMSJ  DB ?


        ORG 2000H
        CLI
        MOV AL, 0FDH  ;seteo F10 como entrada
        OUT IMR, AL
        MOV AL, N_TIMER
        OUT INT1, AL
        MOV AL, 2
        OUT COMP, AL
        MOV AL, 0
        OUT CONT, AL
        MOV DX, 0
        STI      
  LAZO: CMP DX, 5
        JZ FIN
        JMP LAZO

          ORG 3000H
RUT_TIMER:PUSH AX
          PUSH BX
          INC DX
          MOV BX, OFFSET MSJ
          MOV AL, OFFSET FINMSJ - OFFSET MSJ
          INT 7
          MOV AL, EOI
          OUT EOI, AL
          MOV AL, 0
          OUT CONT, AL
          POP BX
          POP AX
          IRET
FIN:      INT 0
END