          ORG 1000H
CARACTER  DB 000H
          ORG 2000H
          MOV AL, 1  ;guardo en AL la longitud
          MOV BX, OFFSET CARACTER  ;guardo en BX la dirección del caracter a imprimir
          MOV CH, 0
          MOV CL, 128
          MOV DH, 0
          MOV DL, 128
FOR:      CMP CH, CL
          JZ FOR2
          INT 7
          INC CARACTER
          INC CH  
          JMP FOR
FOR2:     CMP DH, DL  ;aplico un segundo for porque no puedo crear uno de 256 espacios
          JZ FIN
          INT 7
          INC CARACTER
          INC DH
          JMP FOR2
FIN:      HLT
END

;Debo modificar la cantidad de veces que se repite el for 
;y cambiar el valor inicial de "caracter"