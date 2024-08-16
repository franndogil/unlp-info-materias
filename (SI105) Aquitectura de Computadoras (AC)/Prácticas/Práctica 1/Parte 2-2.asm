    ORG 1000H
MSJ DB "INGRESE UN NUMERO "
FIN DB ?
    ORG 1500H
NUM DB ?
    ORG 2000H
    MOV BX, OFFSET MSJ  ;guardo la direccion del string a imprimir
    MOV AL, OFFSET FIN-OFFSET MSJ  ;guardo la longitud
    INT 7  ;imptimo "Ingrese un numero"
    MOV BX, OFFSET NUM  ;dirección en donde se guardará el numero ingresado
    INT 6  ;ingreso numero por teclado
    MOV AL, 1  ;longitud de la segunda impresion
    INT 7  ;imprimo por segunda vez
    MOV CL, NUM  ;almaceno el valor del num en CL
    INT 0
 END

 ;a) INT 6: En BX se almacena la dirección de memoria en donde
 ;   sera guardado el numero ingresado por teclado

 ;b) La segunda interrupción INT 7 imprime en pantalla el numero ingresado por teclado.
 ;c) En el registro CL queda guardado el valor del numero ingresado pero en hexadecimal.