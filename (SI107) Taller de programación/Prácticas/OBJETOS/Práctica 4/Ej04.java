
package tema4;

import PaqueteLectura.GeneradorAleatorio;
public class Ej04 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        int ini=2021;
        int fin=2023;
        
        int cant = fin - ini + 1;
        
        double [][] temperaturas = new double [cant][12]; //inicializo vector
        
        for (int i=0; i<cant; i++){
            for(int j=0; j<12; j++){
                temperaturas[i][j]=GeneradorAleatorio.generarDouble(40);
            }
        }
        
        PPA programaPorAños = new PPA (ini, fin, temperaturas, "La Plata", "-34.921", "-57.955");
        System.out.println(programaPorAños.toString());     //PUNTO E
        
        
        String [] meses = new String [12];
        
        meses [0]="Enero";
        meses [1]="Febrero";
        meses [2]="Marzo";
        meses [3]="Abril";
        meses [4]="Mayo";
        meses [5]="Junio";
        meses [6]="Julio";
        meses [7]="Agosto";
        meses [8]="Septiembre";
        meses [9]="Octubre";
        meses [10]="Noviembre";
        meses [11]="Diciembre";
        
        
        ini = 2020;
        fin = 2023;
        cant = fin - ini +1;
        
        double [][] temperaturasDos = new double [cant][12]; //inicializo vector
        
        for (int i=0; i<cant; i++){
            for(int j=0; j<12; j++){
                temperaturasDos[i][j]=GeneradorAleatorio.generarDouble(40);
            }
        }
        
        PPM programaPorMeses = new PPM (ini, fin, temperaturasDos, "Mar del Plata", "-38.002 ", "-57.556", meses);
        System.out.println(programaPorMeses.toString());
        
        programaPorAños.setTemperaturaPuntual(10, 1, 2002);     //PUNTO B
        
        System.out.println(programaPorAños.getTemperaturaPuntual(1, 2002));     //PUNTO C
        
        System.out.println(programaPorAños.mayorTemperaturaRegistrada());
    }
    
}
