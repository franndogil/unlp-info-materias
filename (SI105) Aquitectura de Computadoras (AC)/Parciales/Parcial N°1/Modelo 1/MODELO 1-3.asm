PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

          ORG 3000H
INI_PIO:  MOV AL, 0FFH
          OUT CA, AL
          MOV AL,0
          OUT CB, AL
          RET

          ORG 1000H
    CAR   DB ?
    AUX   DB ?

          ORG 3300H
SUBRUT_C: CMP AL, 0
          JZ APAGADAS
          RET
APAGADAS: MOV AL, 0
          OUT PB, AL
          JMP FIN

          ORG 3200H
SUBRUT_B: MOV AUX, AL
          AND AUX, 80H
          CMP AUX, 80H
          JZ PRENDIDA
          RET
PRENDIDA: MOV AUX, AL
          PUSH AX
          NOT AUX
          MOV AL, AUX
          OUT PB, AL
          POP AX
          RET

          ORG 3100H
SUBRUT_A: MOV CAR, AL
          PUSH AX
          MOV BX, OFFSET CAR
          MOV AL, 1
          INT 7
          POP AX
          RET

          ORG 2000H
          CALL INI_PIO
    LAZO: IN AL, PA
          CALL SUBRUT_A
          CALL SUBRUT_B
          CALL SUBRUT_C
          JMP LAZO
    FIN:  INT 0
    END