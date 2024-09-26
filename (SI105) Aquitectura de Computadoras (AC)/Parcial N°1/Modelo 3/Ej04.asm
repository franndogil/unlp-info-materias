PB EQU 31H
CB EQU 33H

        ORG 3000H
INI_PIO:MOV AL, 0
        OUT CB, AL
        RET

               ORG 3100H
ENCENDER_TODOS:MOV AL, 0FFH
               OUT PB, AL
               RET

               ORG 3200H
      APAGAR_X:MOV AL, 01111111B
               OUT PB, AL
               RET
        
        ORG 2000H
        CALL INI_PIO
        CALL ENCENDER_TODOS
        CALL APAGAR_X
        INT 0
    END