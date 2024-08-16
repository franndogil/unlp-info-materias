  ORG 1000H
A DB ?
  ORG 2000H
  mov bx, offset A
  int 6
  mov al, 1
  int 7
  hlt
END
