                ;    SP       AX       BX
    ORG 1000H
    ORG 2000H
    MOV AX, 5  ;    8000H    0005H    0000H
    MOV BX, 3  ;    8000H    0005H    0003H
    PUSH AX    ;    7FFEH    0005H    0003H
    PUSH AX    ;    7FFCH    0005H    0003H
    PUSH BX    ;    7FFAH    0005H    0003H
    POP BX     ;    7FFCH    0005H    0003H
    POP BX     ;    7FFEH    0005H    0005H  en este punto el registro BX pasa de 00 03H a 00 05H y no entiendo por qué
    POP AX     ;    8000H    0005H    0005H
    HLT
END