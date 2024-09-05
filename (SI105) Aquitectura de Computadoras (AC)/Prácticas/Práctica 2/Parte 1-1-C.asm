PA EQU 30H
PB EQU 31h
CA EQU 32h
CB EQU 33H
ORG 2000h
mov al, 0FFH
out CA, al
mov al, 0
out CB, al
in al, PA
out PB, al
int 0
end

;enciende los leds de acuerdo a lo leido en las llaves