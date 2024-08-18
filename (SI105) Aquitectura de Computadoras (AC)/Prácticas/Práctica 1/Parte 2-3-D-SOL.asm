  ORG 100H
A DB "ARQ"
B DB ?
  
  ORG 2000H
  mov al, OFFSET B - OFFSET A
  mov bx, OFFSET A
  int 7
  HLT
END