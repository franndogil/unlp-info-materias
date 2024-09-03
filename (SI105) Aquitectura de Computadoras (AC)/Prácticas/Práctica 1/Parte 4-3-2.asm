      ORG 3000H
ESMAY:MOV CL, 65
      MOV BL, 65
      MOV CH, 91

LOOP: CMP CL, CH
      JZ NO
      INC CL
      CMP AL, BL
      JZ SI
      INC BL
      JMP LOOP
SI:   MOV AH, 0FFH
      JMP FIN
NO:   MOV AH, 0
FIN:  RET

      ORG 1000H
CARAC DB "A"
RES   DB ?
      ORG 2000H
      MOV AL, CARAC
      CALL ESMAY
      MOV RES,AH
      INT 0
END