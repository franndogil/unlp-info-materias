;3) Llaves y mensajes ⭐⭐
;a) Escribir un programa que continuamente verifique el estado de las llaves. Si están prendidas la
;primera y la última llave, y el resto están apagadas (patrón 10000001), se debe mostrar en pantalla el
;mensaje "ACTIVADO". En caso contrario, no se debe mostrar nada.

PA  EQU 30H
CA  EQU 32H

ORG 1000H
MSJ DB "ACTIVADO"
FIN_MSJ DB ?

      ORG 3000H
ENVIO:MOV BX, OFFSET MSJ
      MOV AL, OFFSET FIN_MSJ-OFFSET MSJ
      INT 7
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