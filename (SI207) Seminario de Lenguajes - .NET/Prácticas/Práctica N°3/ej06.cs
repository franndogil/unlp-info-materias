/*6) Implementar los siguientes métodos que devuelvan la suma, resta y multiplicación de matrices 
pasadas como parámetros. Para el caso de la suma y la resta, las matrices deben ser del mismo tamaño, 
en caso de no serlo devolver null. Para el caso de la multiplicación la cantidad de columnas de A debe 
ser igual a la cantidad de filas de B, en caso contrario generar una excepción ArgumentException.*/

double[,]? Suma(double[,] A, double[,] B){
    if(A.GetLength(0) != B.GetLength(0) || A.GetLength(1) != B.GetLength(1)){
        return null;
    }

    int length = A.GetLength(0);
    int width = A.GetLength(1);

    double [,] C = new double [length, width];

    for(int j=0; j<width; j++){
        for(int i=0; i<length; i++){
            C[i, j] = A[i, j] + B[i, j];
        }
    }
    return C;
}

double[,]? Resta(double[,] A, double[,] B){
    if(A.GetLength(0) != B.GetLength(0) || A.GetLength(1) != B.GetLength(1)){
        return null;
    }

    int length = A.GetLength(0);
    int width = A.GetLength(1);

    double [,] C = new double [length, width];

    for(int j=0; j<width; j++){
        for(int i=0; i<length; i++){
            C[i, j] = A[i, j] - B[i, j];
        }
    }
    return C;
}

double[,] Multiplicacion(double[,] A, double[,] B){
    
}