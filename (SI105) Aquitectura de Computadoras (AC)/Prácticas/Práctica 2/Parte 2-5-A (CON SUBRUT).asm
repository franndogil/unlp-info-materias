HAND_DATO EQU 40H
HAND_ESTA EQU 41H

     ORG 1000H
MSJ  DB "INGENIERIA E INFORMATICA"
FIN  DB ?

         ORG 3000H
INI_HAND:IN AL,HAND_ESTA
         AND AL, 07FH
         OUT HAND_ESTA, AL
         RET

         ORG 3100H
POLL:    IN AL, HAND_ESTA
         AND AL, 1
         JNZ POLL
         RET

             ORG 3200H
IMP_CAR_HAND:MOV BX, OFFSET MSJ
LOOP:        CALL POLL
             MOV AL, [BX]
             OUT HAND_DATO, AL
             INC BX
             CMP BX, OFFSET FIN
             JNZ LOOP
             RET
             
     ORG 2000H
     CALL INI_HAND
     CALL IMP_CAR_HAND
     INT 0
END