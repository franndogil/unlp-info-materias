PA EQU 30H
CA EQU 32H
EOI EQU 20H
IMR EQU 21H
INT1 EQU 25H
CONT EQU 10H
COMP EQU 11H
N_TIMER EQU 10
         ORG 40
IP_TIMER DW RUT_TIMER

          ORG 1000H
SEC       DB 0
MSJ1      DB "LLAVES PRENDIDAS"
MSJ2      DB "LLAVES APAGADAS"
FINP       DB ?

          ORG 3200H
RUT_TIMER:MOV SEC, 1
          MOV AL, EOI
          OUT EOI, AL
          IRET

          ORG 3000H
INI_PIO:  MOV AL, 0FFH
          OUT CA, AL
          RET

          ORG 3100H
INI_PIC:  MOV AL, 11111101B
          OUT IMR, AL
          MOV AL, 10
          OUT INT1, AL
          MOV AL, 10
          OUT COMP, AL
          MOV AL, 0
          OUT CONT, AL
          RET

          ORG 3300H
IMP:      INT 7
          RET

          ORG 2000H
          CLI
          CALL INI_PIO
          CALL INI_PIC
          STI
LAZO:     CMP SEC, 1
          JZ APAGADAS
          IN AL, PA
          AND AL, 11110000B
          CMP AL, 11110000B
          JZ PRENDIDAS
          JMP LAZO
PRENDIDAS:MOV BX, OFFSET MSJ1
          MOV AL, OFFSET MSJ2-OFFSET MSJ1
          CALL IMP
          JMP FIN

APAGADAS: MOV BX, OFFSET MSJ2
          MOV AL, OFFSET FINP-OFFSET MSJ2
          CALL IMP
          JMP FIN
FIN:      INT 0
END