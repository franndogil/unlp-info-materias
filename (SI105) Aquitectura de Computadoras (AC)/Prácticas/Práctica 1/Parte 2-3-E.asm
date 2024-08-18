    ORG 1000H
A   DB ?
    ORG 2000H
    MOV BX, A
    INT 6
    MOV AL, 1
    INT 7
END

;errores:
;1) falta hlt
;2) intenta guardar el valor de A en BX
;(debe guardar la direccion de A)