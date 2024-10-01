/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.Lector;

public class Ej05Matrices {
    public static void main(String[] args) {
        
        int [][] matPuntaje = new int [5][4];
        
        int i;
        
        for (i=0; i<5; i++){
            System.out.println("Cliente " + (i+1) + ":");
            System.out.println("Ingrese del 1 al 10:");
            System.out.print("Atencion al cliente: ");
            matPuntaje[i][0]=Lector.leerInt();
            System.out.print("Calidad de la comida: ");
            matPuntaje[i][1]=Lector.leerInt();
            System.out.print("Precio: ");
            matPuntaje[i][2]=Lector.leerInt();
            System.out.print("Ambiente: ");
            matPuntaje[i][3]=Lector.leerInt();
        }
        
        double prom;
        int j;
        
        for (i=0; i<4; i++){
            prom = 0;
            for (j=0; j<5; j++){
                prom = prom + matPuntaje[j][i];
            }
            
            prom = (double) prom/5;
            
            if (i==0){
                System.out.println("Promedio de atencion al cliente: " + prom);
            }
            if (i==1){
                System.out.println("Promedio de calidad de la comida: " + prom);
            }
            if (i==2){
                System.out.println("Promedio de precio: " + prom);
            }
            if (i==3){
                System.out.println("Promedio de ambiente: " + prom);
            }
        }
    }
}
