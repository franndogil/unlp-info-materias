   ORG 1000H
 A DB "HOLA"
 B DB ?
   ORG 2000H
   mov al, offset B - offset A	;INVIERTO A CON B
   mov bx, offset A
   int 7
   HLT	;agrego HTL
 END
