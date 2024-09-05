PA EQU 30H
CA EQU 32h
ORG 1000h
msj db "Apagadas"
ORG 2000H
mov al, 0FFh
out CA, al
in al, PA
cmp al, 0
jnz fin
mov al, 8
mov bx , offset msj
int 7
fin: int 0
end

;compara lo leido en PA (LLAVES) con CERO y si se
;enciende el flag de ZERO muestra en
;pantalla: "APAGADAS"