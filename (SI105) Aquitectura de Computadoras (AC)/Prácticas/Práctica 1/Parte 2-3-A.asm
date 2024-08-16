  ORG 1000H
A DB "HO LA"
B DB ?
  ORG 2000H
  mov bx, offset A
  mov al, 4
  int 7
END

;Errores:
;1) Solo envía 4 caracteres y no tiene en cuentra la real
;dimension del string a imprimir
;2)Falta HLT

;SOLUCION EN EL ARCHIVO SIGUIENTE