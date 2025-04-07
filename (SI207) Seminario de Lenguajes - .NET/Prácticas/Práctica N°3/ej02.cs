/*2) Implementar un método para imprimir por consola todos los elementos
 de una matriz (arreglo de dos dimensiones) pasada como parámetro. Debe 
 imprimir todos los elementos de una fila en la misma líneaen la consola.
void ImprimirMatriz(double[,] matriz)
Ayuda: Si A es un arreglo, A.GetLength(i) devuelve la longitud del arreglo 
en la dimensión i.*/

void ImprimirMatriz(double[,] matriz){  
    int rows = matriz.GetLength(0);
    int columns = matriz.GetLength(1);

    for(int j=0; j<columns; j++){
        for(int i=0; i<rows; i++){
            Console.Write(" " + matriz[i, j]);  //imprimo las columnas
        }
        Console.WriteLine();    //realizo el salto de linea para imprimir la siguiente fila
    }
}
double[,] matrizPrueba = new double[3, 3];  //creo una matriz de prueba

for(int j=0; j<3; j++){
    for(int i=0; i<3; i++){
        matrizPrueba[i, j] = 1;
    }
}
ImprimirMatriz(matrizPrueba);   //utilizo el metodo

Console.ReadKey();