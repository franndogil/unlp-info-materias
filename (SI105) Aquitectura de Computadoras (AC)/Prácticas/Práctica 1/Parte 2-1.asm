    ORG 1000H
MSJ DB"ARQUITECTURA DE COMPUTADORAS-"
    DB "FACULTAD DE INFORMATICA-"
    DB 55H
    DB 4EH
    DB 4CH
    DB 50H
FIN DB ?
    ORG 2000H
    MOV BX, OFFSET MSJ  ;guardamos la dir de inicio del string a imprimir
    MOV AL,OFFSET FIN-OFFSET MSJ  ;guardamos la longitud incluyendo a los caracteres UNLP
    INT 7  ;imprimimos el string
    INT 0  ;detiene el programa
END


;a) Imprime "ARQUITECTURA DE COMPUTADORAS-FACULTAD DE INFORMATICA-UNLP".
;b) Imprime "UNLP" al final porque la cantidad de caracteres a imprimir 
;   guardados en el registro AL contemplan a los 4 caracteres "UNLP".
;DB  55H  "U"
;DB  4EH  "N"
;DB  4CH  "L"
;DB  50H  "P"

;c) INT 7: En el registro BX almacenamos la dirección de comienzo
;   del string a imprimir y en el registro AL guardamos la longitud.