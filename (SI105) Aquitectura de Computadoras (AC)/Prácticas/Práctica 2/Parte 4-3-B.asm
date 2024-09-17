;3) Llaves y mensajes ⭐⭐
;B) Modificar a) para que el mensaje se imprima una sola vez cada vez que detecte ese patrón de bits. Por
;ejemplo, si el programa lee la siguiente secuencia de patrones:
;00010101 → 10010000 → 10000001 → 10000001 → 10000001 → 10010001 → 10000001 →
;10000001 → 10010101 → 01110001
;Entonces solo deberá imprimir “ACTIVADO” dos veces.


PA  EQU 30H
CA  EQU 32H

ORG 1000H
MSJ DB "ACTIVADO"
FIN_MSJ DB ?

      ORG 3000H
ENVIO:PUSH AX
      MOV BX, OFFSET MSJ
      MOV AL, OFFSET FIN_MSJ-OFFSET MSJ
      INT 7
      POP AX
      MOV CL, AL
      
LOOP2:IN AL, PA
      CMP AL, CL
      JZ LOOP2
      RET

      ORG 3100H
POLL: IN AL, PA
      CMP AL, 081H
      JZ ENVIO
      RET

         ORG 3200H
INI_PIO: MOV AL, 0FFH
         OUT CA, AL
         RET

      ORG 2000H
      CALL INI_PIO
LOOP: CALL POLL
      JMP LOOP
      INT 0
END