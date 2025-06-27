{3. Los árboles B+ representan una mejora sobre los árboles B dado que conservan la propiedad de 
acceso indexado a los registros del archivo de datos por alguna clave, pero permiten además un 
recorrido secuencial rápido. Al igual que en el ejercicio 2, considere que por un lado se tiene el 
archivo que contiene la información de los alumnos de la Facultad de Informática (archivo de 
datos no ordenado) y por otro lado se tiene un índice al archivo de datos, pero en este caso el 
índice se  estructura como un árbol B+ que ofrece acceso indizado por DNI al archivo de alumnos. 
Resuelva los siguientes incisos: 
a. ¿Cómo se organizan los elementos (claves) de un árbol B+? ¿Qué elementos se encuentran 
en los nodos internos y que elementos se encuentran en los nodos hojas? }

{a. Los elementos (claves) de un arbol B+ se encuentran en las hojas, estos elementos pueden llegar a 
duplicarse en la raiz y en los nodos internos para poder definir los caminos de busqueda.
}

//------------------------------------------------------------------------------------------------------------
{b. ¿Qué característica distintiva presentan los nodos hojas de un árbol B+? ¿Por qué?
   La caracteristica distintiva de los nodos hoja es que se vinculan para facilitar el recorrido secuencial rapido.
   Tengo entendido que agregamos un puntero como en listas.
}

//------------------------------------------------------------------------------------------------------------
{c. Defina en Pascal las estructuras de datos correspondientes para el archivo de alumnos y su 		REVISARRRRRRR!!!!!!!!!!!!!!!
índice (árbol B+). Por simplicidad, suponga que todos los nodos del árbol B+ (nodos internos y 
nodos hojas) tienen el mismo tamaño
}

program ej03;
const
	M = 4;
type
	alumno = record
		nomApe : string;
		dni : integer;
		leg : integer;
		aIng : integer;
	end;
	TArchivoDatos =  file of alumno;
	
	lista =^nodo;		//NEW
	
	nodo = record
		cantClaves : integer;
		claves: array[1..M-1] of longint;
		enlaces: array[1..M-1] of integer;
		hijos : array[1..M] of integer;
		sig: lista;		//NEW
	end;

	arbolB = file of nodo;
	
var
	archivoDatos: TArchivoDatos;
	archivoIndice: arbolB;

begin
end.
//------------------------------------------------------------------------------------------------------------
{d. Describa, con sus palabras, el proceso de búsqueda de un alumno con un DNI específico 
haciendo uso de la estructura auxiliar (índice) que se organiza como un árbol B+. ¿Qué 
diferencia encuentra respecto a la búsqueda en un índice estructurado como un árbol B? 


}

//------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------

{}
