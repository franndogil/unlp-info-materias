          ORG 1000H  ;NO LO TERMINÉ TODAVÍA, ESTA FUNCIONANDO MAL!!!!
MENSAJE   DB  "WaSaaAAA"
CANT      DB  ?
          ORG 2000H
          MOV CANT, OFFSET CANT - OFFSET MENSAJE    ;cantidad de veces que se ejecutará el FOR
          MOV AL, 0  ;inicializo AL la cual será usada como i para mi FOR
          MOV BX, OFFSET MENSAJE  ;dirección inicial de MENSAJE
          
LOOP:     CMP AL, CANT   ;bucle FOR
          JNS FIN
          INC AL

          MOV CL, 65
          MOV CH, 90
          CMP BYTE PTR [BX], CH  ;comparo si es o no MAYUS por codigo ASCII
          JNS NO    ;si no se activa el flag de signo salto a NO
          
LOOP2:    CMP BYTE PTR [BX], CL
          JZ  SUMA
          INC CL
          JMP LOOP2         
          
SUMA:     ADD BYTE PTR [BX], 32  ;transformo MAYUS a minus
          JMP LOOP    ;vuelvo al FOR

NO:       INC BX    ;incremento BX y vuelvo al FOR
          JMP LOOP
          
FIN: HLT
END
