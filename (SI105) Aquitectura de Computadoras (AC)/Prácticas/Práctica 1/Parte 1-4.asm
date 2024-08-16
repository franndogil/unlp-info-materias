          ORG 1000H  ;CORREGIDO, TA FUNCIONANDO BIEN (CORRECCIÓN EN LINEA 24, ME FALTABA INCREMENTAR BX LUEGO DE SUMAR)
MENSAJE   DB  "aAsSaAAA"
CANT      DB  ?
          ORG 2000H
          MOV CANT, OFFSET CANT - OFFSET MENSAJE    ;cantidad de veces que se ejecutará el FOR
          MOV AL, 0  ;inicializo AL la cual será usada como i para mi FOR
          MOV BX, OFFSET MENSAJE  ;dirección inicial de MENSAJE
          
LOOP:     CMP AL, CANT  ;bucle FOR
          JZ  FIN
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
          INC BX
          JMP LOOP    ;vuelvo al FOR

NO:       INC BX    ;incremento BX y vuelvo al FOR
          JMP LOOP
          
FIN: HLT
END
