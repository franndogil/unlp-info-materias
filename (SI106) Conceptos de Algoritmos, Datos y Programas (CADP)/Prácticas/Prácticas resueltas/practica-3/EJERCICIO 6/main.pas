{6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
 información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente
 información de los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom,
 Centrino, etc.), cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y
 tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores
 se lee de forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores
 (que no debe procesarse). Se pide implementar un programa que lea información de los microprocesadores
 de la empresa importadora e informe:
 ● Marcaylínea detodos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
 ● Lasdosmarcasconmayor cantidad de procesadores con transistores de 14 nm.
 ● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen
 velocidades de al menos 2 Ghz.}
 
 //DISCLAIMER: La información de los microprocesadores
 //se lee de forma consecutiva por marca de procesador  (CORTE DE CONTROL)
 
 program ejer6;
 type
    str15=string[15];
 
    procesador=record
        marca:str15;
        linea:str15;
        cores:integer;
        vel:integer;
        tam:integer;
    end;

procedure LeerProcesador(var p:procesador);
begin
    writeln('Ingrese la marca: ');
    readln(p.marca);
    writeln('Ingrese la linea: ');
    readln(p.linea);
    writeln('Ingrese la cantidad de nucleos: ');
    readln(p.cores);
    writeln('Ingrese la velocidad: ');
    readln(p.vel);
    writeln('Ingrese el tamaño de los transistores: ');
    readln(p.tam);
end;

procedure Actualizar(a:procesador; var aux1:integer; var aux2:integer; var mar1:str15; var mar2:str15; cont:integer);
begin
    if(cont>aux2)then begin
        if(cont>aux1)then begin
            aux2:=aux1;
            mar2:=mar1;
                    
            aux1:=cont;
            mar1:=a.marca;
        end
        else begin
            aux2:=cont;
            mar2:=a.marca;
        end;
    end;
end;

procedure Procesar(var cant:integer; var mar1:str15; var mar2:str15);
var
    p, a:procesador;
    maraux:str15;
    cont, aux1, aux2:integer;
    marcaactual:str15;
begin
    cant:=0;
    aux1:=0;
    aux2:=0;
    cont:=0;
    LeerProcesador(p);
    marcaactual:=p.marca;
    while(p.cores<>0)do begin
        marcaactual:=p.marca;
        cont:=0;
        while(p.cores<>0)and(p.marca=marcaactual)do begin   //CORTE DE CONTROL
            a:=p;
            if(p.tam=14)then
                cont:=cont+1;
            if(p.cores>2)and(p.tam<22)then begin
                writeln('Procesador de más de 2 cores con transistores de a lo sumo 22 nm: ');
                writeln('Marca: ', p.marca);
                writeln('Linea: ', p.linea);
            end;
            
            if(p.marca='Intel')or(p.marca='AMD')then begin
                if(p.cores>1)then
                    if(p.vel>=2)then
                        cant:=cant+1;
            end;
            LeerProcesador(p);
        end;
        Actualizar(a, aux1, aux2, mar1, mar2, cont);        //procedimiento para actualizar con "a" la cual me almacena el dato
                                                            //(Procesador) que estaba trabajando y no el ultimo que se leyo
                                                            //(sirve para poder actualizar de forma correcta)
    end;
end;
    
    
var
    cant:integer;
    mar1:str15;
    mar2:str15;

begin
    Procesar(cant, mar1, mar2);
    writeln('Cantidad de proocesadores multicore Intel o AMD que alcanzan la velocidad de 2GHz: ',cant);
    writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm. son: ', mar1, ' y ' , mar2);
end.
    
    
    
    
    