DATO EQU 40H
ESTADO EQU 41H

      ORG 1000H
MSJ   DB "INGENIERIA E INFORMATICA"
FIN_MSJ  DB ?


         ORG 3000H
INI_HAND:IN AL, ESTADO
         AND AL, 01111111B
         OUT ESTADO, AL
         RET

         ORG 3300H
  POLL:  IN AL, ESTADO
         AND AL, 1
         JNZ POLL
         RET

             ORG 3200H
IMP_CAR_HAND:CALL POLL
             MOV AL, [BX]
             OUT DATO, AL
             RET
      
      ORG 2000H
      CALL INI_HAND
      MOV BX, OFFSET MSJ
      MOV FIN_MSJ, OFFSET FIN_MSJ - OFFSET MSJ
LAZO: CMP FIN_MSJ, 0
      JZ FIN
      CALL IMP_CAR_HAND
      INC BX
      DEC FIN_MSJ
      JMP LAZO
FIN:  INT 0
END