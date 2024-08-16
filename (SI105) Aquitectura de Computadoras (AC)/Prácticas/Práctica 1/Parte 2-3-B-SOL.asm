   ORG 1000H
 A DB "HOLA"
 B DB ?
   ORG 2000H
   mov al, offset B - offset A
   mov bx, offset A
   int 7
   HLT
 END
