PA EQU 30h
CA EQU 32h
   ORG 1000h
si db "Ocupada"
no db "Libre"
        ORG 2000H
        mov al, 0FEH
        out CA, al
        in al, PA
        and al, 1
        jnz ocupada
        mov bx, offset no
        mov al, 5
        int 7
        jmp fin
ocupada:mov bx, offset si
        mov al, 7
        int 7
fin:    int 0
end
