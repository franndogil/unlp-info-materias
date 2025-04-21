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

using System;
using System.Diagnostics.Contracts;

namespace teoria4;

public class Matriz
{
    private double [,] matriz;
    private int fil;
    private int col;

    public Matriz (int fil, int col){
        this.fil = fil;
        this.col = col;
        this.matriz = new double [fil, col];
    }

    public Matriz(double [,] matriz){
        this.matriz = matriz;
        this.fil = matriz.GetLength(0);
        this.col = matriz.GetLength(1);
    }

    public int getCantFilas(){
        return this.fil;
    }

    public int getCantColumnas(){
        return this.col;
    }

    public void setElemento(int fil, int col, double elemento){
        this.matriz[fil, col] = elemento;
    }

    public double getElemento(int fil, int col){
        return this.matriz[fil, col];
    }

    public void imprimir(){
        for(int j=0; j<this.col; j++){
            for(int i=0; i<this.fil; i++){
                Console.Write(" " + this.matriz[i, j]);
            }
            Console.WriteLine("");
        }
    }

    public double[] getColumna(int col){
        double [] vecCol = new double[this.matriz.GetLength(1)];   //creo el vector teniendo en cuenta la cantidad de columnas
        for(int j=0; j<this.matriz.GetLength(1); j++){
            vecCol[j] = matriz [col, j];       //cargo el vector
        }
        return vecCol;
    }

    public double [] getFila(int col){
        double [] vecFila = new double[this.matriz.GetLength(0)];   //creo el vector teniendo en cuenta la cantidad de filas
        for(int i=0; i<this.matriz.GetLength(0); i++){
            vecFila[i] = this.matriz[i, col];       //cargo el vector 
        }
        return vecFila;
    }

    public void sumarle(Matriz matriz){
        if((this.matriz.GetLength(0) == matriz.getCantFilas())&&(this.matriz.GetLength(1) == matriz.getCantColumnas())){
            for(int j=0; j<this.matriz.GetLength(1); j++){
                for(int i=0; i<this.matriz.GetLength(0); i++){
                    this.matriz[i, j] = this.matriz [i, j] + matriz.getElemento(i,j);
                }
            }
        }
        else{
            Console.WriteLine("Las matrices son de diferentes tamaños!!!");
        }
    }

    public void restarle(Matriz matriz){
        if((this.matriz.GetLength(0) == matriz.getCantFilas())&&(this.matriz.GetLength(1) == matriz.getCantColumnas())){
            for(int j=0; j<this.matriz.GetLength(1); j++){
                for(int i=0; i<this.matriz.GetLength(0); i++){
                    this.matriz[i, j] = this.matriz [i, j] - matriz.getElemento(i,j);
                }
            }
        }
        else{
            Console.WriteLine("Las matrices son de diferentes tamaños!!!");
        }
    }

    public double[] getDiagonalPrincipal(){
        if(this.fil != this.col){
            throw new Exception("La matriz no es cuadrada!");
        }

        double[] vecReturn = new double[this.fil];
            for(int j=0; j<this.col; j++){
                vecReturn[j] = this.matriz[j, j];
            }
        return vecReturn;
    }

    public double[] getDiagonalSecundaria(){
        if(this.fil != this.col){
            throw new Exception("La matriz no es cuadrada!");
        }

        double[] vecReturn = new double[this.fil];
            for(int i=0; i<this.col; i++){
                vecReturn[i] = this.matriz [i, this.col - 1 - i];
            }
        return vecReturn;
    }
    public void imprimir(string formatString){
        for(int j=0; j<this.matriz.GetLength(1);j++){
            for(int i=0; i<this.matriz.GetLength(0); i++){
                Console.Write(this.matriz[i,j].ToString(formatString) + " ");
            }
            Console.WriteLine(" ");
        }
    }    
}
