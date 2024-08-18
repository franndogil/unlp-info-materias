     org 3000h
rut: mov bx,3    ;7FFEH    BX 00 03H
     ret         ;8000H    ?
     org 2000h
     call rut    ;7FFEH    ?
     add cx,5    ;8000H    CX 00 05H
     call rut    ;7FFEH    ?
     hlt
 end

 ;BX 00 03H
 ;CX 00 05H

 ;a) Cuando se ejecuta la instruccion CALL RUT, guardamos en memoria con ayuda de un PUSH 
 ;la dirección actual del programa principal para luego de terminar la subrutina poder volver
 ;al lugar correspondiente

 ;b) Cuando se ejecuta la instruccipn RET, ejecutamos un POP en el Stack Pointer y ademas seteamos en el IP la
 ;direccion previamente almacenada en memoria para poder volver al lugar correspondiente.