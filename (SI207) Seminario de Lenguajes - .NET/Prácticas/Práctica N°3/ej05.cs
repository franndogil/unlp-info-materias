/*5) Implementar un método que devuelva un arreglo de arreglos con los mismos elementos que la matriz 
pasada como parámetro:*/

double[][] GetArregloDeArreglo(double [,] matriz){
    if (matriz == null) {
        throw new ArgumentNullException(nameof(matriz), "La matriz no puede ser null");
    }

    int length = matriz.GetLength(0);   //obtengo el largo de la matriz
    int width = matriz.GetLength(1);    //obtengo el ancho de la matriz
    double [][] vecReturn = new double [length][];  //creo el vector de vectores

    for(int i=0; i<length; i++){    //por cada elemento del largo de la matriz voy a crear un vector
        vecReturn[i] = new double[width];   //creo un vector dentro del vector
        for(int j=0; j<width; j++){
            vecReturn[i][j] = matriz [i, j];    //guardo los elementos de la matriz en el vector de vectores
        }
    }
    return vecReturn;
}