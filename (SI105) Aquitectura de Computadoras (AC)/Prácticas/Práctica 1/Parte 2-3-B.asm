   ORG 1000H
 A DB "HOLA"
 B DB ?
   ORG 2000H
   mov al, offset A- offset B
   mov bx, offset A
   int 7
 END

 ;ERRORES:
 ;1) Falta HLT
 ;2) En AL guardó -4, debería reemplazar la linea 5
 ; por lo siguente
 ;   mov al, offset B - offset A