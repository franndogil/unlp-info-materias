  ORG 1000H
A DB ?
  ORG 2000H
  mov bx, offset A  ;guardo previamente la direccion de memoria
  INT 6  ;ingreso caracter
  mov al, 1
  INT 7	  ;imprime
  HLT
END
