{4. Dada la siguiente estructura:  
type 
reg_flor = record 
nombre: String[45]; 
codigo: integer; 
end; 
tArchFlores = file of reg_flor; 
Las bajas se realizan apilando registros borrados y las altas reutilizando registros 
borrados. 
El registro 0 como cabecera de la pila de registros borrados: 
el número 0 en el campo código implica que no hay registros borrados y -N indica que el 
próximo registro a reutilizar es el N, siendo éste un número relativo de registro válido.  
a. Implemente el siguiente módulo: 
Abre el archivo y agrega una flor, recibida como parámetro 
manteniendo la política descrita anteriormente procedure agregarFlor (var a: tArchFlores ; nombre: string; 
codigo:integer); 
b. Liste el contenido del archivo omitiendo las flores eliminadas. Modifique lo que 
considere necesario para obtener el listado. }

program ej04;

type 
	reg_flor = record 
		nombre: String[45]; 
		codigo: integer; 
	end;
	 
	tArchFlores = file of reg_flor; 

//-----------------------------------------------------------------------------------------------------
procedure agregarFlor(var a: tArchFlores; nombre:string; codigo:integer);
var
    nue, aux:reg_flor;
begin
    reset(a);
    nue.nombre := nombre;
    nue.codigo := codigo;
    read(a, aux); // Leo cabecera
    if(aux.codigo=0)then begin
        seek(a, filesize(a)); // ir al final del archivo
        write(a, nue);
    end
    else begin
        seek(a, aux.codigo * -1);
        read(a, aux);	//guardo el posible siguiente en aux
        
        seek(a, filePos(a)-1);		//me posiciono sobre el espacio disponible
        write(a, nue);			//guardo el nuevo en el espacio libre
    
        seek(a, 0);		//me posiciono sobre la cabecera
        write(a, aux);	//guardo el auxiliar con el posible siguiente
    end;
    close(a);
end;
//-----------------------------------------------------------------------------------------------------
procedure listarFlores(var a:tArchFlores);
var
    act:reg_flor;
begin
    reset(a);
    if (filesize(a) <= 1) then
        writeln('No hay flores cargadas.')
    else begin
        seek(a, 1); 	//Saltar la cabecera
        while(not eof(a))do begin
            read(a, act);
            if(act.codigo>0)then
                writeln('Nombre: ', act.nombre, ' Codigo: ', act.codigo);
        end;
    end;
    close(a);
end;
//-----------------------------------------------------------------------------------------------------
procedure crearArchivo(var a: tArchFlores);
var
    aux: reg_flor;
    nombreArchivo: string;
begin
    write('Ingrese el nombre del archivo de flores: ');
    readln(nombreArchivo);
    assign(a, nombreArchivo);
    rewrite(a);
    // Inicializa la cabecera
    aux.nombre := '';
    aux.codigo := 0;
    write(a, aux);
    close(a);
    writeln('Archivo creado correctamente.');
end;

procedure menu();
begin
    writeln('--- MENU FLORES ---');
    writeln('1. Crear archivo');
    writeln('2. Agregar flor');
    writeln('3. Listar flores');
    writeln('4. Salir');
    write('Seleccione una opcion: ');
end;

var
    a: tArchFlores;
    opciones: char;
    nombreArchivo: string;
    nombreFlor: string;
    codigoFlor: integer;
begin
    repeat
        menu();
        readln(opciones);
        case opciones of
            '1': crearArchivo(a);
            '2': begin
                    write('Ingrese el nombre del archivo: ');
                    readln(nombreArchivo);
                    assign(a, nombreArchivo);
                    write('Ingrese nombre de la flor: ');
                    readln(nombreFlor);
                    write('Ingrese codigo de la flor: ');
                    readln(codigoFlor);
                    agregarFlor(a, nombreFlor, codigoFlor);
                 end;
            '3': begin
                    write('Ingrese el nombre del archivo: ');
                    readln(nombreArchivo);
                    assign(a, nombreArchivo);
                    listarFlores(a);
                 end;
        end;
    until(opciones = '4');
end.
