  ORG 1000H
A DB ?
  ORG 2000H
  int 6
  mov bx, offset A
END

;errores:
;1) falta hlt
;2) Debo guardar en BX la dirección donde será almecnado el caracter
; ANTES de pasar por la instrucción INT 6
;3) NO IMPRIME