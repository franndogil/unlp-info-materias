/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        System.out.println("2x" + "5" + "="+ tabla2[5]);
        
        int DF2=100;
        int [] tabla3 = new int[DF2];
        
        //EJERCICIO 1 PRACTICA 1
        
        GeneradorAleatorio.iniciar();
        
        int numg=0;
        
        numg=GeneradorAleatorio.generarInt(30);
        i=0;
        
        while((numg!=11)&&(i<DF2)){     
            tabla3[i]=numg;     //guardo el numero generado
            i=i+1;  //avanzo a la siguiente posición
            numg=GeneradorAleatorio.generarInt(30);     //genero el siguente elemnto
        }
        
        int DL=i;  //guardo la ultima pos (DIML)
        
        for (i=0; i<DL; i++){   //IMPRIMO EL RESULTADO DE CADA NUMERO (MULTIPLICADO POR 2) ACCEDIENDO AL VECTOR
            System.out.println(tabla3[i]*2);
        }
      
    }
    
}
