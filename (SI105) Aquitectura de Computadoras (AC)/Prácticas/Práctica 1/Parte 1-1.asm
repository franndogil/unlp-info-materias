        ORG 1000H
MENSAJE DB "aaddvinculaaaaa"
CANT    DB ?

        ORG 2000H
        MOV AL, OFFSET CANT - OFFSET MENSAJE  ;cantidad de letras que tiene el mensaje
        MOV CANT, 0  ;declaro a cant en 0
        MOV AH, 0
        MOV BX, 1000H

LOOP:   CMP AH, AL  ;evaluo la cant de vueltas que vamos con la cantidad de vueltas total del for
        JZ FIN
        INC AH  ;incremento ah por cada vuelta del for
    
        CMP BYTE PTR [BX], 97
        JZ SUMAR
        INC BX                ;avanzo en BX
        JMP LOOP
        
SUMAR:  INC CANT        ;incremento la cantidad de veces que se encuentra la letra "a"
        INC BX
        JMP LOOP        ;vuelvo al for
FIN:    HLT
END