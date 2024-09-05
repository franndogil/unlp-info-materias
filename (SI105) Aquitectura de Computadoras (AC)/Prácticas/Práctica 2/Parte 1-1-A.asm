PB EQU 31h
CB EQU 33H
ORG 2000H
mov al, 0
out CB, al  ;configuro PB como salida
mov al, 0Fh
out PB, al  ;envío a pb lo guardado en al
int 0
end

;enciende los leds 0,  1, 2 y 3