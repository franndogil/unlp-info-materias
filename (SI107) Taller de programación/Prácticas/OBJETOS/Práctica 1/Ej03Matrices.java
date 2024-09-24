/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	 //Paso 2. iniciar el generador aleatorio     
	 GeneradorAleatorio.iniciar();
            
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][] tabla = new int[5][5];
        
        int i, j;
        
        for (i=0; i<5; i++){
            for (j=0; j<5; j++){
                tabla[i][j]=GeneradorAleatorio.generarInt(31);
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        System.out. println("----IMPRESION DE LA MATRIZ----");
        for (i=0; i<5; i++){
            for (j=0; j<5; j++){
                System.out.print(tabla[i][j] + "      ");
                
            }
            System.out.println();
        }
        
        /*
        System.out.println("PRUEBAA:   " + tabla[2][2]);    //prueba de que funca
        */

        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma=0;
        
        for (j=0; j<5; j++){
            suma = suma + tabla[0][j];
        }
        
        System.out.println("La suma de los elementos de la fila 1 es: " + suma);
    
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int [] vecSuma = new int [5];
        
        for (j=0; j<5; j++){
            for(i=0; i<5; i++){
                vecSuma[j]=vecSuma[j]+tabla[i][j];
            }
        }
        
        System.out. println("----IMPRESION DEL VECTOR----");
        for (i=0; i<5; i++){
            System.out. print(vecSuma[i] + "      ");
        }
        System.out.println("");
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".

        System.out.println("Ingrese el valor entero a buscar:");
        int numb = Lector.leerInt();
        
        int fil=6, col=6;
        boolean ok=false;
        
        for (i=0; i<5; i++){
            for(j=0; j<5; j++){
                if(numb == tabla[i][j]){
                    ok=true;
                    fil=i+1;        //+1 para que el resultado quede bien expresado
                    col=j+1;
                }
            }
        }
        
        if(ok == true)
            System.out.println("FIla: " + fil + " Columna: " + col);
        else
            System.out.println("No se encontró el elemento.");
    }
}
