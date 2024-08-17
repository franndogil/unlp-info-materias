          ORG 1000H
CARACTER  DB 030H
LINEAN    DB 00AH
          ORG 2000H
          MOV AL, 1  ;guardo en AL la longitud
          MOV CH, 0
          MOV CL, 10  ;si lo dejo en 25 me morfo el "9"
FOR:      CMP CH, CL
          JZ FIN
          MOV BX, OFFSET CARACTER  ;guardo la dirección de "caracter" para imprimir
          INT 7
          MOV BX, OFFSET LINEAN  ;guardo la dirección de "line feed" para imprimir
          INT 7
          INC CARACTER
          INC CH  
          JMP FOR
FIN:      HLT
END

;Debo modificar la cantidad de veces que se repite el for 
;y cambiar el valor inicial de "caracter"