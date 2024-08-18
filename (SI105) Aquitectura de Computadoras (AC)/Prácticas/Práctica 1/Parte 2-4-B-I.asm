          ORG 1000H
CARACTER  DB 030H
          ORG 2000H
          MOV AL, 1  ;guardo en AL la longitud
          MOV BX, OFFSET CARACTER  ;guardo en BX la dirección del caracter a imprimir
          MOV CH, 0
          MOV CL, 10  ;si lo dejo en 25 me morfo el "9"
FOR:      CMP CH, CL
          JZ FIN
          INT 7
          INC CARACTER
          INC CH  
          JMP FOR
FIN:      HLT
END

;Debo modificar la cantidad de veces que se repite el for 
;y cambiar el valor inicial de "caracter"