      ORG 1000H
C     DB "C"
RES   DB ?
      
      ORG 2000H
      MOV AH, 65        ;guardo en AH el valor inicial de las MAYUSCULAS
      MOV BX, OFFSET C  ;guardo en BX la dirección de C
      MOV CH, 65        ;uso el registro CX para determinar el rango en el cual va a operar el programa, es decir, la cantidad de MAYUSCULAS que tenemos
      MOV CL, 91        ;defino el final del rango en el que operaremos (si pongo 90 me como la Z)
LOOP: CMP CH, CL        ;comparo la posición actual con la maxima
      JZ NO             ;si se activa el flag zero (90-90) ultima posicion 
      INC CH            ;incremento la posición actual para el siguiente
      CMP BYTE PTR [BX], AH  ;comparo lo apuntado por BX (C) con AH (la letra actual)
      JZ SI             ;si se activa el flag de zero (ejem: 65-65) salta a SI, es decir, es MAYUSCULA
      INC AH            ;sino incrementa la letra actual
      JMP LOOP          ;y vuelve al for
SI:   MOV RES, 0FFh     ;guardo 0FFh en RES  (ERA MAYUSCULA)
      JMP FIN           ;salto a fin
NO:   MOV RES, 0        ;guardo 0 en RES  (NO ERA MAYUSCULA)
FIN:  HLT
END
