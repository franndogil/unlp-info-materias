    ORG 1000H
A   DB ?
    ORG 2000H
    MOV BX, offset A  ;almacena la direccion de A
    INT 6
    MOV AL, 1  ;1 caracter de longitud
    INT 7  ;imprime el caracter
    HLT
END