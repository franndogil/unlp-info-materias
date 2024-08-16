  ORG 100H
A DB "ARQ"
B DB ?
  
  ORG 2000H
  mov al, 3
  mov bx, A
  int 7
END

;errores:
;1) falta hlt
;2) apenas cambie la variable A por algo de 4 carac se rompe
;3) guarda el valor de la variable A en BX y debe guardar
; la direccion de la variable A