/*3) Implementar el método ImprimirMatrizConFormato, similar al anterior pero ahora 
con un parámetro más que representa la plantilla de formato que debe aplicarse a 
los números al imprimirse.
La plantilla de formato es un string de acuerdo a las convenciones de formato 
compuesto, por ejemplo “0.0” implica escribir los valores reales con un dígito
para la parte decimal.*/

void ImprimirMatrizConFormato(double[,] matriz, string formatString){
    int rows = matriz.GetLength(0);
    int columns = matriz.GetLength(1);


    for(int j=0; j<columns; j++){
        for(int i=0; i<rows; i++){
            Console.Write(" " + matriz[i, j].ToString(formatString));  //imprimo las columnas con formato
        }
        Console.WriteLine();    //realizo el salto de linea para imprimir la siguiente fila
    }
}

double[,] matrizPrueba = new double[3, 3];  //creo una matriz de prueba

for(int j=0; j<3; j++){             //cargo la matriz de prueba
    for(int i=0; i<3; i++){
        matrizPrueba[i, j] = 1;
    }
}

Console.WriteLine("Indique el formato que debe aplicarse a los numeros al imprimirse: ");
string? str = Console.ReadLine();

ImprimirMatrizConFormato(matrizPrueba, str);   //utilizo el metodo

Console.ReadKey();