  ORG 1000H
A DB ?
  ORG 2000H
  mov al, 3
  mov bx, A
  int 6
END

;errores:
;1) falta hlt
;2) define una cant de 3 carac. cuando solo precisa 1
;3) NO IMPRIME
;4) guarda el valor de A y necesita su dirección

