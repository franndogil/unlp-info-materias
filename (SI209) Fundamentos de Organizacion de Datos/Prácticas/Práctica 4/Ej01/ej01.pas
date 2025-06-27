//----------------------------------------------------------------------------------------------------------------------------------

{De los mismos deberá guardarse nombre y apellido, DNI, legajo y año de ingreso. 
Suponga que dicho archivo se organiza como un árbol B de orden M. 
a. Defina en Pascal las estructuras de datos necesarias para organizar el archivo de alumnos 
como un árbol B de orden M. }

program ej01;
const
	M = 3;	//orden del arbol
type
	alumno = record
		nomApe : string;
		dni : integer;
		leg : integer;
		aIng : integer;
	end;
	
	arbolB = record
		cantDatos : integer;
		datos : array[1..M-1] of alumno;
		hijos : array[1..M] of integer;
	end;
	
	arcArbolB = file of arbolB;

//----------------------------------------------------------------------------------------------------------------------------------

{b. Suponga que la estructura de datos que representa una persona (registro de persona) 
ocupa 64 bytes, que cada nodo del árbol B tiene un tamaño de 512 bytes y que los números 
enteros ocupan 4 bytes, ¿cuántos registros de persona entrarían en un nodo del árbol B? 
¿Cuál sería el orden del árbol B en este caso (el valor de M)? Para resolver este inciso, puede 
utilizar la fórmula N = (M-1) * A + M * B + C, donde N es el tamaño del nodo (en bytes), A es el 
tamaño de un registro (en bytes), B es el tamaño de cada enlace a un hijo y C es el tamaño 
que ocupa el campo referido a la cantidad de claves. El objetivo es reemplazar estas 
variables con los valores dados y obtener el valor de M (M debe ser un número entero, 
ignorar la parte decimal). 

 N  = (M-1) * A + M * B + C			|| A = 64 || B = 4 || C = 4
512 = (M - 1) * 64 + M * 4 + 4	
512 = 64M - 64 + 4M + 4
512 + 64 - 4 = 68M
572 / 68 = M
8.4 = M

¿cuántos registros de persona entrarían en un nodo del árbol B?
M vale 8.4, me quedo con la parte entera (8). La cantidad de registros dentro de un nodo va de 1 a (M-1 =~ 8-1 =~ 7). 
Por lo tanto, en un nodo del arbol B entran 7 registros persona (alumno).
}

//----------------------------------------------------------------------------------------------------------------------------------

{c. ¿Qué impacto tiene sobre el valor de M organizar el archivo con toda la información de los alumnos como un árbol B?

M define la cantidad maxima de claves y de hijos que puede haber en un arbol.
Si M es grande, el arbol seria mas ancho y menos profundo. Si M es chico, el arbol seria mas profundo y menos ancho.
}

//----------------------------------------------------------------------------------------------------------------------------------

{d. ¿Qué dato seleccionaría como clave de identificación para organizar los elementos 
(alumnos) en el árbol B? ¿Hay más de una opción? 

En una primera instancia seleccionaria el legajo como clave de identificacion, pero tambien puedo seleccionar el dni del alumno
ya que estos datos son unicos para cada alumno, no se pueden repetir.
}

//----------------------------------------------------------------------------------------------------------------------------------

{e. Describa el proceso de búsqueda de un alumno por el criterio de ordenamiento 
especificado en el punto previo. ¿Cuántas lecturas de nodos se necesitan para encontrar un 
alumno por su clave de identificación en el peor y en el mejor de los casos? ¿Cuáles serían 
estos casos? 

TEORIA VIDEO CLASE 6 FOD PARTE 2

En el mejor de los casos, necesitaria realizar 1 lectura para encontrar al alumno. 
En el peor de los casos, necesitaria realizar h lecutras para encontrar al alumno (con h siendo la altura del arbol).
}

//----------------------------------------------------------------------------------------------------------------------------------

{f. ¿Qué ocurre si desea buscar un alumno por un criterio diferente? ¿Cuántas lecturas serían 
necesarias en el peor de los casos? 

Si elijo buscar un alumno por un criterio diferente puedo tener problemas porque, por ejemplo, 
dos personas pueden llamarse igual y errar en la busqueda. En el peor de los casos deberia recorrer cada nodo
del arbol.
}

//----------------------------------------------------------------------------------------------------------------------------------

begin
end.
