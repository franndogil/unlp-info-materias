{3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs.
 As, con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO
 para el año 2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único
 de establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se
 pide implementar un programa que procese la información y determine:
 ● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por
 UNESCO.
 ● CUEynombredelasdosescuelas con mejor relación entre docentes y alumnos.
 El programa debe utilizar:
 a. Unmóduloparalalectura de la información de la escuela.
 b. Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la
 cantidad de alumnos y la cantidad de docentes).}
 
program ejer3;
type
    escuela=record
        cue:integer;
        nombre:string;
        docentes:integer;
        alumnos:integer;
        localidad:string;
    end;
procedure Lectura(var e:escuela);
begin
    Writeln('Ingrese el CUE: ');
    readln(e.cue);
    Writeln('Ingrese el nombre: ');
    readln(e.nombre);
    Writeln('Ingrese la cantidad de docentes: ');
    readln(e.docentes);
    Writeln('Ingrese la cantidad de alumnos: ');
    readln(e.alumnos);
    Writeln('Ingrese la localidad: ');
    readln(e.localidad);
end;

procedure Relacion(e:escuela; var r: real);
begin
    r:=e.docentes/e.alumnos;
end;

var
    cantr, cue1, cue2, i:integer;
    nom1, nom2:string;
    prop, rela, rela1, rela2:real;
    escu:escuela;

begin
    i:=0; 
    cantr:=0;
    cue1:=0;
    cue2:=0;
    prop:=0;
    rela:=0;
    rela1:=10000;
    rela2:=10000;
    
    prop:=1/23.435;
    
    for i:=1 to 2400 do begin
        Lectura(escu);
        Relacion(escu, rela);
        if (rela>prop)then
            cantr:=cantr+1;
        if(rela<=rela2)then begin
            if(rela<=rela1)then begin
                rela2:=rela1;
                nom2:=nom1;
                cue2:=cue1;
                
                rela1:=rela;
                nom1:=escu.nombre;
                cue1:=escu.cue;
            end
            else begin
                rela2:=rela;
                nom2:=escu.nombre;
                cue2:=escu.cue;
            end;
        end;
    end;
    
    Writeln('Cantidad de escuelas de La Plata con una relacion superior a la sugerida por la UNESCO: ',  cantr);
    Writeln('Escuelas con mejor relación entre docentes y alumnos: ');
    Writeln('CUE: ',cue1,' Nombre: ',nom1);
    Writeln('CUE: ',cue2,' Nombre: ',nom2);
end.