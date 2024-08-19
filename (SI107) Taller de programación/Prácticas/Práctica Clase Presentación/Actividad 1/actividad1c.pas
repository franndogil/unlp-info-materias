program ProgramaNumAleatorio;

var ale, i: integer;

begin
     randomize; 
     i:=0;

     for i:=1 to 20 do begin
		ale := random (100); {devuelve un valor aleatorio en el intervalo 0 a 99}
		writeln ('El numero aleatorio generado es: ', ale);
	 end;

	 writeln ('Presione cualquier tecla para finalizar');
     readln;
end.
