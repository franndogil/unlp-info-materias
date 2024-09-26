    ORG 1000H
CAR DB "0"

       ORG 3000H
SUBRUT:CMP AL, 30H
       JS NO
       CMP AL, 3AH
       JNS NO
       MOV DH, 1
       JMP FIN
    NO:MOV DH, 0
  FIN: RET

    ORG 2000H
    MOV AL, CAR
    CALL SUBRUT
    INT 0
END