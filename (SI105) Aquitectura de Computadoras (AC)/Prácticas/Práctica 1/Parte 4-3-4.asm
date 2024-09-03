         ORG 1000H
MENSAJE  DB "HOLA A TODOS"
CANT     DB ?

                 ORG 3000H
STRING_A_MINUS:  MOV AL, 0  ;INICIALIZO AL EN 0 PARA COMPARAR
LOOP:     CMP AL, CANT  ;bucle FOR
          JZ  FIN
          INC AL

          MOV CL, 65
          MOV CH, 91  ;si no pongo 91 me morfo la "z"
          CMP BYTE PTR [BX], CH  ;comparo si es o no MAYUS por codigo ASCII
          JNS NO    ;si no se activa el flag de signo salto a NO
          
LOOP2:    CMP BYTE PTR [BX], CL
          JZ  SUMA
          INC CL
          JMP LOOP2         
          
SUMA:     ADD BYTE PTR [BX], 32  ;transformo MAYUS a minus
          INC BX
          JMP LOOP    ;vuelvo al FOR

NO:       INC BX    ;incremento BX y vuelvo al FOR
          JMP LOOP
          
FIN:      RET

         ORG 2000H
         MOV BX, OFFSET MENSAJE
         MOV CANT, OFFSET CANT-OFFSET MENSAJE
         MOV AL, CANT
         CALL STRING_A_MINUS
         INT 0
END