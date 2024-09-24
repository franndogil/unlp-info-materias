
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Ej02Jugadores {
    
    
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double altura;
        
        //Paso 3: Crear el vector para 15 double 
        double [] vecAlturas = new double [15];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i=0, cant=0;
        double prom=0;
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0; i<15; i++){
            altura=GeneradorAleatorio.generarDouble(2)+1;
            vecAlturas[i]=altura;
        }
        
        /*
        for (i=0; i<15; i++){
            System.out.println(vecAlturas[i]);
        } 
        */    //PRUEBA DE QUE FUNCIONA LOOL
   
        //Paso 7: Calcular el promedio de alturas, informarlo
        for (i=0; i<15; i++){
            prom = prom + vecAlturas[i];
        }
        prom = (double) prom / 15;
        System.out.println("El promdio de las alturas es: " + prom);
   
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i=0; i<15; i++){
            if(vecAlturas[i]>=prom)
                cant = cant + 1;
        }
        
        //Paso 9: Informar la cantidad.
        System.out.println("Cantidad de jugadores con altura superior al promedio: " + cant);
    }
    
}
