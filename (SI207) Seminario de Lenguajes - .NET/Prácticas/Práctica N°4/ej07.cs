/*7) Implementar la clase Matriz que se utilizará para trabajar con matrices matemáticas. Implementar los dos 
constructores y todos los métodos que se detallan a continuación:
 public Matriz(int filas, int columnas)
 public Matriz(double[,] matriz)
 public void SetElemento(int fila, int columna, double elemento)
 public double GetElemento(int fila, int columna)
 public void imprimir()
 public void imprimir(string formatString)
 public double[] GetFila(int fila)
 public double[] GetColumna(int columna)
 public double[] GetDiagonalPrincipal()
 public double[] GetDiagonalSecundaria()
 public double[][] getArregloDeArreglo()
 public void sumarle(Matriz m)
 public void restarle(Matriz m)
 public void multiplicarPor(Matriz m)*/

using teoria4;

void imprimirVector(double [] vector){
    for(int i=0; i<vector.GetLength(0); i++){
        Console.Write(vector[i] + " ");
    }
    Console.WriteLine("");
}

Matriz matriz = new Matriz (3, 3);
Matriz matriz2 = new Matriz (3, 3);

matriz.setElemento(0, 0, 3);
matriz.setElemento(0, 1, 4);
matriz.setElemento(0, 2, 5);
matriz.setElemento(1, 0, 3);
matriz.setElemento(1, 1, 6);
matriz.setElemento(1, 2, 4);
matriz.setElemento(2, 0, 3);
matriz.setElemento(2, 1, 8);
matriz.setElemento(2, 2, 9);

matriz2.setElemento(0, 0, 3);
matriz2.setElemento(0, 1, 4);
matriz2.setElemento(0, 2, 5);
matriz2.setElemento(1, 0, 3);
matriz2.setElemento(1, 1, 6);
matriz2.setElemento(1, 2, 4);
matriz2.setElemento(2, 0, 3);
matriz2.setElemento(2, 1, 8);
matriz2.setElemento(2, 2, 9);

matriz.imprimir();
Console.WriteLine("");
matriz2.imprimir();

matriz.sumarle(matriz2);
Console.WriteLine("Resultado suma:");
matriz.imprimir();

matriz.restarle(matriz2);
Console.WriteLine("Resultado resta:");
matriz.imprimir();

Console.WriteLine("fila:");
imprimirVector(matriz.getFila(1));
Console.WriteLine("columna:");
imprimirVector(matriz.getColumna(1));
Console.WriteLine("diagonal principal:");
imprimirVector(matriz.getDiagonalPrincipal());
Console.WriteLine("diagonal secundaria:");
imprimirVector(matriz.getDiagonalSecundaria());

Console.WriteLine("Imprimir con formato:");
matriz.imprimir("0.0000");
