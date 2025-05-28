{8. Se cuenta con un archivo con información de las diferentes distribuciones de linux 
existentes. De cada distribución se conoce: nombre, año de lanzamiento, número de 
versión del kernel, cantidad de desarrolladores y descripción. El nombre de las 
distribuciones no puede repetirse. Este archivo debe ser mantenido realizando bajas 
lógicas y utilizando la técnica de reutilización de espacio libre llamada lista invertida. 
Escriba la definición de las estructuras de datos necesarias y los siguientes 
procedimientos: 
a. BuscarDistribucion: módulo que recibe por parámetro el archivo, un 
nombre de distribución y devuelve la posición dentro del archivo donde se 
encuentra el registro correspondiente a la distribución dada (si existe) o 
devuelve -1 en caso de que no exista.. 
b. AltaDistribucion: módulo que recibe como parámetro el archivo y el registro 
que contiene los datos de una nueva distribución, y se encarga de agregar 
la distribución  al archivo reutilizando espacio disponible en caso de que 
exista. (El control de unicidad lo debe realizar utilizando el módulo anterior). 
En caso de que la distribución que se quiere agregar ya exista se debe 
informar “ya existe la distribución”. 
c. BajaDistribucion: módulo que recibe como parámetro el archivo y el 
nombre de una distribución, y se encarga de dar de baja lógicamente la 
distribución dada. Para marcar una distribución como borrada se debe 
utilizar el campo cantidad de desarrolladores para mantener actualizada 
la lista invertida. Para verificar que la distribución a borrar exista debe utilizar 
el módulo BuscarDistribucion. En caso de no existir se debe informar 
“Distribución no existente”. }
//--------------------------------------------------------------------------------------------------
program ej08;
type
	distribucion = record
		nom : string;
		aLan : integer;
		nVer : integer;
		cDev : integer;
		desc : string;
	end;
	
	maestro = file of distribucion;
//--------------------------------------------------------------------------------------------------
procedure buscarDistribucionAbierto(var mae:maestro; nom:string; var posRet:integer);
var
    regMae:distribucion;
    pos:integer;
    encontrado:boolean;
begin
    seek(mae, 1); // Salteo la cabecera
    pos := 1;
    posRet := -1;
    encontrado := true;
    while (not eof(mae)) and (encontrado) do begin
        read(mae, regMae);
        if (regMae.nom = nom) and (regMae.cDev >= 0) then begin
            posRet := pos;
            encontrado := false;
        end;
        pos := pos + 1;
    end;
end;
//--------------------------------------------------------------------------------------------------
procedure altaDistribucion(var mae:maestro; regNue:distribucion);
var
	posDis:integer;
	regMae, regAux:distribucion;
begin
	reset(mae);
	buscarDistribucionAbierto(mae, regNue.nom, posDis);
	if(posDis = -1)then begin					//si es -1, es porque no esta en el maestro, debo agregarlo revisando la cabecera
		seek(mae, 0);							//me paro sobre la cabecera
		read(mae, regMae);
		if(regMae.cDev = 0)then begin			//si guardo 0 en la cantidad de desarrolladores, es porque no hay espacios disponibles, guardo al final del archivo.
			seek(mae, filesize(mae));			//me posiciono al final
			write(mae, regNue);					//escribo el registro entrante al final del archivo
		end
		else begin								//voy a la posicion que guarda la cabecera
			seek(mae, regMae.cDev * -1);		//mul * -1 porque guardamos valores negativos con lista invertida
			read(mae, regAux);					//guardo la posicion siguiente, para colocarla en la cabecera al final
			seek(mae, filePos(mae)-1);			//vuelvo uno atras
			write(mae, regNue);					//escribo el registro nuevo en la posicion eliminada
			seek(mae, 0);						//me posiciono sobre la cabeceera
			write(mae, regAux);					//escribo en la cabecera el siguiente eliminado logicamente
		end;
	end
	else begin
		writeln('Ya existe la distribución.');
	end;
	close(mae);
end;
//--------------------------------------------------------------------------------------------------
procedure bajaDistribucion(var mae:maestro; nom:string);
var
	posDis : integer;
	regCab, regBaja : distribucion;
begin
	reset(mae);
	buscarDistribucionAbierto(mae, nom, posDis);
	if(posDis <> -1)then begin					//si es distinto a -1, es porque existe en el maestro
		seek(mae, 0);
        read(mae, regCab); // Leo la cabecera
        seek(mae, posDis); // Voy al registro a dar de baja
        read(mae, regBaja); // Leo el registro a eliminar
        regBaja.cDev := regCab.cDev; // Apunto al anterior primer libre
        seek(mae, posDis);
        write(mae, regBaja); // Escribo el registro modificado
        seek(mae, 0);
        regCab.cDev := -(posDis); // Actualizo la cabecera con la nueva posición libre (negativo)
        write(mae, regCab);
	end
	else begin
		writeln('Distribución no existente.');
	end;
end;
//--------------------------------------------------------------------------------------------------
procedure inicializarArchivo(var mae:maestro);
var
    regCab: distribucion;
begin
    assign(mae, 'distribuciones.dat');
    rewrite(mae);
    regCab.nom := '';
    regCab.aLan := 0;
    regCab.nVer := 0;
    regCab.cDev := 0; // 0 indica que no hay espacio libre
    regCab.desc := '';
    write(mae, regCab); // Escribo la cabecera
    close(mae);
end;
//--------------------------------------------------------------------------------------------------
procedure listarDistribuciones(var mae:maestro);
var
    reg: distribucion;
begin
    reset(mae);
    seek(mae, 1); // Salteo cabecera
    while not eof(mae) do begin
        read(mae, reg);
        writeln('Nombre: ', reg.nom);
        writeln('Año lanzamiento: ', reg.aLan);
        writeln('Versión kernel: ', reg.nVer);
        writeln('Desarrolladores: ', reg.cDev);
        writeln('Descripción: ', reg.desc);
        writeln('--------------------------');
    end;
    close(mae);
end;
//--------------------------------------------------------------------------------------------------
var
    mae: maestro;
    reg: distribucion;
begin
    assign(mae, 'distribuciones.dat');
    inicializarArchivo(mae);

    // Altas hardcodeadas de varias distribuciones
    reg.nom := 'Ubuntu';
    reg.aLan := 2004;
    reg.nVer := 5;
    reg.cDev := 1000;
    reg.desc := 'Distribución basada en Debian, muy popular.';
    altaDistribucion(mae, reg);

    reg.nom := 'Fedora';
    reg.aLan := 2003;
    reg.nVer := 6;
    reg.cDev := 800;
    reg.desc := 'Distribución patrocinada por Red Hat.';
    altaDistribucion(mae, reg);

    reg.nom := 'Arch';
    reg.aLan := 2002;
    reg.nVer := 7;
    reg.cDev := 500;
    reg.desc := 'Distribución rolling release, minimalista.';
    altaDistribucion(mae, reg);

    reg.nom := 'Debian';
    reg.aLan := 1993;
    reg.nVer := 4;
    reg.cDev := 1200;
    reg.desc := 'Una de las distribuciones más antiguas y estables.';
    altaDistribucion(mae, reg);

    reg.nom := 'Mint';
    reg.aLan := 2006;
    reg.nVer := 5;
    reg.cDev := 300;
    reg.desc := 'Basada en Ubuntu, orientada a la facilidad de uso.';
    altaDistribucion(mae, reg);

    reg.nom := 'Manjaro';
    reg.aLan := 2011;
    reg.nVer := 6;
    reg.cDev := 200;
    reg.desc := 'Basada en Arch, pero más amigable.';
    altaDistribucion(mae, reg);

    reg.nom := 'OpenSUSE';
    reg.aLan := 2005;
    reg.nVer := 5;
    reg.cDev := 400;
    reg.desc := 'Distribución patrocinada por SUSE.';
    altaDistribucion(mae, reg);

    // Bajas hardcodeadas
    bajaDistribucion(mae, 'Fedora');
    bajaDistribucion(mae, 'Mint');
    bajaDistribucion(mae, 'Ubuntu');
    bajaDistribucion(mae, 'NoExiste'); // Prueba de baja de una que no existe

	// Altas hardcodeadas

	reg.nom := 'ElementaryOS';
    reg.aLan := 2011;
    reg.nVer := 5;
    reg.cDev := 150;
    reg.desc := 'Enfocada en la simplicidad y el diseño.';
    altaDistribucion(mae, reg);

    reg.nom := 'Kali';
    reg.aLan := 2013;
    reg.nVer := 6;
    reg.cDev := 100;
    reg.desc := 'Distribución para pruebas de seguridad.';
    altaDistribucion(mae, reg);

    reg.nom := 'Zorin';
    reg.aLan := 2009;
    reg.nVer := 4;
    reg.cDev := 80;
    reg.desc := 'Pensada para usuarios que migran de Windows.';
    altaDistribucion(mae, reg);

    reg.nom := 'Slackware';
    reg.aLan := 1993;
    reg.nVer := 15;
    reg.cDev := 50;
    reg.desc := 'Una de las distribuciones más antiguas.';
    altaDistribucion(mae, reg);

    reg.nom := 'Pop!_OS';
    reg.aLan := 2017;
    reg.nVer := 6;
    reg.cDev := 60;
    reg.desc := 'Desarrollada por System76, basada en Ubuntu.';
    altaDistribucion(mae, reg);

    // Listar distribuciones activas
    writeln('Distribuciones activas:');
    listarDistribuciones(mae);
end.
