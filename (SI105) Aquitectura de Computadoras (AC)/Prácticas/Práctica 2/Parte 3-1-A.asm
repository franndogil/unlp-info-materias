PB EQU 31H
CB EQU 33H

    ORG 1000H
MSJ DB "UNLP"
FIN DB ?

        ORG 3000H
INI_PIO:MOV AL, 0 
        OUT CB, AL
        RET

        ORG 3100H
IMP_0:  MOV AL, 00H
        OUT PB, AL
        RET

        ORG 3200H
IMP_C:  MOV AL, [BX]
        OUT PB, AL
        RET

        ORG 3300H
IMP_255:MOV AL, 0FFH
        OUT PB, AL
        RET

      ORG 2000H
      CALL INI_PIO
      MOV BX, OFFSET MSJ
LOOP: CALL IMP_0
      CALL IMP_C
      INC BX
      CMP BX, OFFSET FIN
      JNZ LOOP
      CALL IMP_255
      INT 0
END