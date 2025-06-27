program ej04;

const
    M = 3;
type
    alumno = record
        nombre: string;
        apellido: string;
        dni: integer;
        legajo: integer;
        anioIngreso: integer;
    end;
    nodo = record
        cant_claves: integer;
        claves: array[1..M-1] of longint;
        enlaces: array[1..M-1] of integer;
        hijos: array[1..M] of integer;
    end;
    TArchivoDatos = file of alumno;
    arbolB = file of nodo;
var
    archivoDatos: TArchivoDatos;
    archivoIndice: arbolB;

procedure posicionarYLeerNodo(var A:arbolB; var nodo:nodo; NRR:integer);
begin
	
end;

procedure buscar(var A:arbolB; NRR, clave:integer; var NRR_encontrado:integer; var pos_encontrada:integer; var resultado:boolean);
var clave_encontrada: boolean; 
begin 
	if (nodo = null) 
		resultado := false; {clave no encontrada} 
	else 
		posicionarYLeerNodo(A, nodo, NRR); 	//A	= ref ya que es el archivo;	nodo = ref ya que es la copia ; NRR = valor es la posicion;
	claveEncontrada(A, nodo, clave, pos, clave_encontrada); 
	if (clave_encontrada) then begin 
		NRR_encontrado := NRR; { NRR actual } 
		pos_encontrada := pos; { posicion dentro del array } 
		resultado := true; 
	end
	else 
		buscar(A, nodo.hijos[pos], clave, NRR_encontrado, pos_encontrada, resultado) 
end;

begin
end. 
//----------------------------------------------------------------------------------------------------
{a. PosicionarYLeerNodo():  Indique qué hace y la forma en que deben ser enviados los 
parámetros (valor o referencia). Implemente este módulo en Pascal.
	
	A = ref; nodo = ref ; NRR = valor;
	Me posiciono sobre el nodo y realizo una copia del mismo.
}

//----------------------------------------------------------------------------------------------------
