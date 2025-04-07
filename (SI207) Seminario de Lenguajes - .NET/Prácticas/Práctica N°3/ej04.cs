/*4) Implementar los métodos GetDiagonalPrincipal y GetDiagonalSecundaria que 
devuelven un vector con la diagonal correspondiente de la matriz pasada como 
parámetro. Si la matriz no es cuadrada generar una excepción ArgumentException.*/

double[] GetDiagonalPrincipal(double[,] matriz){
    if(matriz.GetLength(0) != matriz.GetLength(1)){   //si no es cuadrada
        throw new ArgumentException("La matriz no es cuadrada :/");
    }

    int dimVec = matriz.GetLength(0);   //variable para guardar la dimension de la diagonal, tambien puede ser GetLenght(1)   
    double [] vecDiag = new double [dimVec];     //creo el vector diagonal
    for(int i=0; i<dimVec; i++){
        vecDiag[i] = matriz [i, i];
    } 

    return vecDiag;
}

double [] GetDiagonalSecundaria(double[,] matriz){
    if(matriz.GetLength(0) != matriz.GetLength(1)){   //si no es cuadrada
        throw new ArgumentException("La matriz no es cuadrada :/");
    }

    int dimVec = matriz.GetLength(0);   //variable para guardar la dimension de la diagonal, tambien puede ser GetLenght(1)   
    double [] vecDiag = new double [dimVec];     //creo el vector diagonal
    int longitud = dimVec-1;
    for(int i=0; i<dimVec; i++){
        vecDiag[i] = matriz [i, longitud-i];  //para i es la ultima pos mientras que para j es la primer pos
    }
    
    return vecDiag;
}

double [,] matrizPrueba = new double[3, 3];
for(int j=0; j<3; j++){
    for(int i=0; i<3; i++){
        matrizPrueba[i, j] = int.Parse(Console.ReadLine());
    }
}

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
ImprimirMatriz(matrizPrueba);   //utilizo el metodo

Console.WriteLine("Vector diagonal principal: ");
for(int i=0; i<3; i++){
    Console.WriteLine(GetDiagonalPrincipal(matrizPrueba)[i]);
}
for(int i=0; i<3; i++){
    Console.WriteLine(GetDiagonalSecundaria(matrizPrueba)[i]);
}

Console.ReadKey();