PA EQU 30H
CA EQU 32H

        ORG 1000H
PRENDI  DB "LLAVE PRENDIDA"
APA     DB "LLAVE APAGADA"
FIIN    DB ?

      ORG 2000H
      MOV AL, 0FFH  
      OUT CA, AL
      IN AL, PA
      AND AL, 80H
      CMP AL, 80H
      JZ SI
      JMP NO
SI:   MOV BX, OFFSET PRENDI
      MOV AL, OFFSET APA-OFFSET PRENDI
      INT 7
      JMP FIN 
NO:   MOV BX, OFFSET APA
      MOV AL, OFFSET FIIN-OFFSET APA
      INT 7
      JMP FIN
FIN:  INT 0
END

;b) Verificar Llave Escribir un programa que verifique si la llave de
;más a la izquierda está prendida. Si es así, mostrar en pantalla el mensaje
;“Llave prendida”, y de lo contrario mostrar “Llave apagada”. Solo
;importa el valor de la llave de más a la izquierda (bit más significativo).
;Recordar que las llaves se manejan con las teclas 0-7