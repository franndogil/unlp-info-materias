PB EQU 31H
CB EQU 33H
ORG 2000H
MOV AL, 0
OUT CB, AL
MOV AL, 0C3H
OUT PB, AL
INT 0
END


;Patrón de Luces Fijo Escribir un programa que encienda las luces con el patrón 11000011, o sea, solo
;las primeras y las últimas dos luces deben prenderse, y el resto deben apagarse.