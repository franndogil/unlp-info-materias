      ORG 3000H
A_MIN:ADD AL, 32
FIN:  RET

      ORG 1000H
C     DB "A"
      ORG 2000H
      MOV AL, C
      CALL A_MIN
      INT 0  
END