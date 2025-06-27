{2. Una mejora respecto a la solución propuesta en el ejercicio 1 sería mantener por un lado el archivo 
que contiene la información de los alumnos de la Facultad de Informática (archivo de datos no 
ordenado) y por otro lado mantener un índice al archivo de datos que se estructura como un árbol 
B que ofrece acceso indizado por DNI de los alumnos. 
a. Defina en Pascal las estructuras de datos correspondientes para el archivo de alumnos y su 
índice. 
}
program ej02;
const
	M = 4;
type
	alumno = record
		nomApe : string;
		dni : integer;
		leg : integer;
		aIng : integer;
	end;
	
	nodo = record
		cantClaves : integer;
		claves: array[1..M-1] of longint;
		enlaces: array[1..M-1] of integer;
		hijos : array[1..M] of integer;
	end;

	TArchivoDatos =  file of alumno;
	arbolB = file of nodo;
	
var
	archivoDatos: TArchivoDatos;
	archivoIndice: arbolB;

begin
end.

//-------------------------------------------------------------------------------------------------

{b. Suponga que cada nodo del árbol B cuenta con un tamaño de 512 bytes. ¿Cuál sería el 
orden del árbol B (valor de M) que se emplea como índice? Asuma que los números enteros 
ocupan 4 bytes. Para este inciso puede emplear una fórmula similar al punto 1b, pero 
considere además que en cada nodo se deben almacenar los M-1 enlaces a los registros 
correspondientes en el archivo de datos.

N = Tam. nodo
A = claves
B = enlaces
C = hijos
D = cantClaves

N = (M-1) * A + (M-1) * B + M * C + D
512 =(M-1) * 4 + (M-1) * 4 + M * 4 + 4
512 = 4M - 4 + 4M - 4 + 4M + 4
512 = 12M - 4
516 = 12M
516 / 12 = M
43 = M
}
//-------------------------------------------------------------------------------------------------

{c. ¿Qué implica que el orden del árbol B sea mayor que en el caso del ejercicio 1?

Implica que el arbol B de este ejercicio es mas ancho y menos profundo (debido a que aumentamos la cantidad de registros que caben en un nodo) que el del ejercicio 1.
}

//-------------------------------------------------------------------------------------------------

{d. Describa con sus palabras el proceso para buscar el alumno con el DNI 12345678 usando el 
índice definido en este punto. 

Busco en el arbol la clave con dni 12345678. Una vez encontrada la clave, utilizo el NRR guardado
en el enlace para buscar el registro en el archivo de datos. 
}

//-------------------------------------------------------------------------------------------------

{e. ¿Qué ocurre si desea buscar un alumno por su número de legajo? ¿Tiene sentido usar el 
índice que organiza el acceso al archivo de alumnos por DNI? ¿Cómo haría para brindar 
acceso indizado al archivo de alumnos por número de legajo? 

La verdad no tiene mucho sentido usar el indice organizado por numero de DNI para buscar un alumno por su numero de legajo.
Deberiamos crear un nuevo arbol pero con criterio de busqueda por numero de legajo.
}

//-------------------------------------------------------------------------------------------------

{f. Suponga que desea buscar los alumnas que tienen DNI en el rango entre 40000000 y 
45000000. ¿Qué problemas tiene este tipo de búsquedas con apoyo de un árbol B que solo 
provee acceso indizado por DNI al archivo de alumnos?

Problemas:
	1) El arbol distingue por dni, no por genero (no tengo una optimizacion por multiples atributos). Obtendria todos los dni entre 40000000 y 45000000
pero despues deberia realizar un filtrado para solo quedarme con las alumnas.
	2) El acceso secuencial es costoso si tenemos rangos grandes.

}
//-------------------------------------------------------------------------------------------------
