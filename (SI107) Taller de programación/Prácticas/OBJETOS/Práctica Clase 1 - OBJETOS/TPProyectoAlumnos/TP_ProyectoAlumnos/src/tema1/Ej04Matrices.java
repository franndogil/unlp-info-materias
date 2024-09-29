/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ej04Matrices {
    public static void main(String[] args) {
        int [][] vecEdificio = new int [8][4];
        
        int i, j;
        
        //INICIALIZAR MATRIZ
        for (i=0; i<8; i++){
            for (j=0; j<4; j++){
                vecEdificio[i][j]=0;
            }
        }
        
        //LLEGADA DE PERSONA
        int npiso, nofi;
        
       
        System.out.println("INGRESE EL NUMERO DE PISO: ");
        npiso = Lector.leerInt();
        System.out.println("INGRESE EL NUMERO DE OFICINA: ");
        nofi = Lector.leerInt();
        /*
        npiso = GeneradorAleatorio.generarInt(9);
        nofi = GeneradorAleatorio.generarInt(4);
        */
        
        while(npiso!=9){
            vecEdificio[npiso-1][nofi-1]=vecEdificio[npiso-1][nofi-1]+1;
            
            System.out.println("INGRESE EL NUMERO DE PISO: ");
            npiso = Lector.leerInt();
            System.out.println("INGRESE EL NUMERO DE OFICINA: ");
            nofi = Lector.leerInt();
            /*
            npiso = GeneradorAleatorio.generarInt(9);
            nofi = GeneradorAleatorio.generarInt(4);
            */
        }
        
        //IMPRESION DE MATRIZ
        
        System.out.println("Cantidad de personas que concurrieron a cada oficina de cada piso: ");
        
        System.out.print("Oficina 1 ");
        System.out.print("Oficina 2 ");
        System.out.print("Oficina 3 ");
        System.out.print("Oficina 4 ");
        System.out.println("");
        
        for (i=0; i<8; i++){
            System.out.print("Piso " + (i+1));
            for (j=0; j<4; j++){
                System.out.print("    " + vecEdificio[i][j] + "    ");
            }
            System.out.println("");
        }
        
        
        
    }
}
