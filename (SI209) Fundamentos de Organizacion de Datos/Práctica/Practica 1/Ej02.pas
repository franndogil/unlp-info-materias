{2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados 
creado en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el 
promedio de los números ingresados. El nombre del archivo a procesar debe ser 
proporcionado por el usuario una única vez.  Además, el algoritmo deberá listar el 
contenido del archivo en pantalla.}

program ej02;
type
	archivo=file of integer;
var
	arc_logico:archivo;
	nro_act, cant_lineas, j, cont_min:integer;
	prom:real;
	arc_fisico:string[12];
begin
	cont_min:=0;
	prom:=0;
	writeln('Ingrese el nombre del archivo a procesar: ');
	readln(arc_fisico);
	assign(arc_logico, arc_fisico + '.dat');		//asignas el nombre al archivo
	reset(arc_logico);		//abrimos el archivo
	cant_lineas:=fileSize(arc_logico);		//extraemos la cantidad de elementos
	for j:=1 to cant_lineas do begin
		read(arc_logico, nro_act);	//leemos el archivo (avanza por puntero interno)
		if(nro_act<1500)then
			cont_min:=cont_min+1;
		prom:=prom+nro_act;
	end;
	
	prom:=prom/cant_lineas;
	
	writeln('El promedio de numeros ingresados es: ', prom:2:2);
	writeln('La cantidad de numeros menores a 1500 es de: ', cont_min);
	
	close(arc_logico);	//cerras el archivo
end.
