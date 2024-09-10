PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H
      ORG 1000H
MSJ     DB ?

          ORG 3000H
INI_PIO:  MOV AL, 0FDH  ;bit de strobe en 0 (salida) y busy en 1 (entrada)
          OUT CA, AL
          MOV AL, 0  ;PB como salida
          OUT CB, AL
          RET

          ORG 3200H
POLL:     IN AL, PA
          AND AL, 1
          JNZ POLL
          RET

          ORG 3400H
FLA_ASC:  IN AL, PA
          AND AL, 0FDH  ;FUERZO STROBE A 0
          OUT PA, AL

          IN AL, PA
          OR AL, 2    ;FUERZO STROBE A 1
          OUT PA, AL  ;envio caracter a la impresora
          RET

           ORG 3600H
IMP_CARAC: PUSH AX  ;salvo el caracter enviado
           CALL POLL  ;espera a que el bit busy este apagado
           POP AX
           OUT PB, AL  ;envio el caracter al pio
           CALL FLA_ASC
           RET

      ORG 2000H
      CALL INI_PIO
      MOV CL, 6
      MOV CH, 0
      MOV BX, OFFSET MSJ
LOOP: CMP CH, CL
      JZ FIN
      INT 6
      MOV AL, [BX]
      CALL IMP_CARAC
      INC CH
      INC BX
      JMP LOOP
      
FIN:  INT 0
END