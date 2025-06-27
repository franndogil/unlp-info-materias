{3. Suponga que trabaja en una oficina donde está montada una LAN (red local). La 
misma fue construida sobre una topología de red que conecta 5 máquinas entre sí y 
todas las máquinas se conectan con un servidor central. Semanalmente cada 
máquina genera un archivo de logs informando las sesiones abiertas por cada usuario 
en cada terminal y por cuánto tiempo estuvo abierta. Cada archivo detalle contiene 
los siguientes campos: cod_usuario, fecha, tiempo_sesion. Debe realizar un 
procedimiento que reciba los archivos detalle y genere un archivo maestro con los 
siguientes datos: cod_usuario, fecha, tiempo_total_de_sesiones_abiertas. 
Notas: 
● Los archivos detalle no están ordenados por ningún criterio. 
● Un usuario puede iniciar más de una sesión el mismo día en la misma máquina, 
o inclusive, en diferentes máquinas.}

program ej03;
type
	sesionAbierta = record
		codUs : integer;
		fecha : integer;
		tiempo : real;
	end;
	
	usuarios =  record
		codUs : integer;
		fecha : integer;
		tiempoT : real;
	end;
	
	maestro = file of usuarios;
	detalle = file of sesionAbierta;
	
	vectorDetalles = array[0..4] of detalle;
//--------------------------------------------------------------------------
procedure actualizarIndividual(var mae:maestro; var det:detalle);
var
	regMae : usuarios;
	regDet : sesionAbierta;
begin
	//el archivo ya entra abierto
	while(not eof(det))do begin
		seek(mae, 0);				//vuelvo a la pos cero del maestro
		read(mae, regMae);
		read(det, regDet);
		while(regMae.codUs <> regDet.codUs)do	//o lo encuentro o llego al fin del maestro sin encontrarlo
			read(mae, regMae);
		if(regMae.codUs = regDet.codUs)then begin
			regMae.fecha := regDet.fecha;						//modifico el registro
			regMae.tiempoT := regMae.tiempoT + regDet.tiempo;
			seek(mae, filepos(mae)-1);							//vuelvo uno y actualizo
			write(mae, regMae);
		end;
	end;
end;
//--------------------------------------------------------------------------
procedure actualizarMaestro(var mae:maestro; var det1, det2, det3, det4, det5:detalle);
var
	v : vectorDetalles;
	i : integer;
begin
	reset(mae);reset(det1);reset(det2);reset(det3);reset(det4);reset(det5);
	v[0]:=det1;
	v[1]:=det2;
	v[2]:=det3;
	v[3]:=det4;
	v[4]:=det5;
	
	for i:=0 to 4 do begin
		actualizarIndividual(mae, v[i]);
	end;
	close(mae);close(det1);close(det2);close(det3);close(det4);close(det5);
end;
//--------------------------------------------------------------------------
begin
end.
