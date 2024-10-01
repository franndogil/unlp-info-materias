DATO EQU 40H
ESTADO EQU 41H

          ORG 1000H
    MSJ   DB "HoLaAAAAA mUnDo"
    CANT  DB ?
    COND  DB ?

          ORG 3000H
INI_HAND: IN AL, ESTADO
          AND AL, 01111111B
          OUT ESTADO, AL
          RET

             ORG 3100H
SELECCIONADO:MOV AL, [BX]
             CMP AL, 41H
             JS NO
             CMP AL, 5BH
             JNS NO
             MOV COND, 1
        NO:  RET

          ORG 3200H
    IMP:  CALL POLL
          MOV AL, [BX]
          OUT DATO, AL
          RET

          ORG 3300H
    POLL: IN AL, ESTADO
          AND AL, 1
          JNZ POLL
          RET

          ORG 2000H
          CALL INI_HAND
          MOV BX,OFFSET MSJ
          MOV CANT, OFFSET CANT - OFFSET MSJ
    LAZO: CMP CANT, 0
          JZ FIN
          MOV COND, 0
          CALL SELECCIONADO
          CMP COND, 1
          JZ SI
    LAZO2:DEC CANT
          INC BX
          JMP LAZO
      SI: CALL IMP
          JMP LAZO2
    FIN:  INT 0
    END