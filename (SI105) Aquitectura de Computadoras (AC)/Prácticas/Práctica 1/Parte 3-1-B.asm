        ORG 3000H      ;    SP 
RUTINA: MOV BX, 3      ;   7FFCH  =
        RET            ;   7FFEH  +2
        ORG 2000H
        PUSH AX        ;   7FFEH  -2
        CALL RUTINA    ;   7FFCH  -2
        POP BX         ;   8000H  +2
        HLT            ;   8000H  =
END

;PASOS:
;1) Empieza en la linea 5, SP -2
;2) Llama a la subrutina, SP -2
;3) (linea 2): va a la subrutina y se mantiene
;4) Vuelve al programa principal, +2
;5) POP BX, +2

;FINAL: SP  8000H 