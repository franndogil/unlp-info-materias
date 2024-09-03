            ORG 3000H
CONTAR_CAR: MOV CL, 0
            MOV DL, 0
      LOOP: CMP DL, AL
            JZ FIN
            INC DL
            CMP BYTE PTR[BX], AH
            JZ SUMAR
            INC BX
            JMP LOOP
            INC CL
      SUMAR:INC CL
            INC BX
            JMP LOOP
      FIN:  RET

      ORG 1000H
MSJ   DB "AAAAAaaaaa"
CANT  DB ?
      ORG 2000H
      MOV AL, OFFSET CANT-OFFSET MSJ
      MOV BX, OFFSET MSJ
      MOV AH, 61H
      CALL CONTAR_CAR
      MOV CANT, CL
      INT 0
END