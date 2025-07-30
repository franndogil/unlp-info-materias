
package finalesobjetos.septiembre2023;
import PaqueteLectura.Lector;

public abstract class Estacion {
    private String nombre;
    private int latitud;
    private int longitud;
    private int cantAnios;
    private double [][] registro;
    
    public Estacion(String nombre, int latitud, int longitud, int cantAnios){
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
        this.cantAnios = cantAnios;
        this.registro = new double [this.cantAnios][12];
    }
    
    public void registrarTodasLasTemperaturas(){
        System.out.println("Estacion: " + this.nombre);
        
        for (int i=0; i<this.cantAnios; i++){
            for(int j=0; j<12; j++){
                System.out.println("Ingrese la temperatura del mes: " + (j+1) + " Anio: " + (i+1));
                this.registro[i][j] = Lector.leerDouble();
            }
        }
    }
    
    public void registarTemperatura(double temperatura, int mes, int anio){
        if((mes<=12)&&(anio <= this.cantAnios)){
            this.registro[mes-1][anio-1] = temperatura;
        }
    }
    
    public double retornarTemperaturaDeterminada(int mes, int anio){
        double temperatura = -9999; //valor no valido 
        
        if((mes <= 12)&&(anio <= this.cantAnios)){
            temperatura = this.registro[mes-1][anio-1];
        }
        
        return temperatura;
    }
    
    public String mayorTemperaturaRegistrada(){
        String ret="";
        double mayTemp = -9999;
        int mes = -13;
        int anio = -10;
        
        for(int i=0; i<this.cantAnios; i++){
            for(int j=0; j<12; j++){
                if(this.registro[i][j]>mayTemp){
                    mayTemp = this.registro[i][j];
                    mes = j;
                    anio = i;
                }
            }
        }
        
        return ret = "La mayor temperatura registrada fue de: " + mayTemp + " en el mes de: " + (mes+1) + " en el anio: " + (anio+1);
    }
    
    public int getAnios(){
        return this.cantAnios;
    }
    
    public int getLatitud(){
        return this.latitud;
    }
    
    public int getLongitud(){
        return this.longitud;
    }
    
    public String getNombre(){
        return this.nombre;
    }
    
    public double[][] getRegistro(){        //posible violacion al encapsulamiento
        double[][]copia = new double[this.cantAnios][12];
        for(int i=0; i<this.cantAnios; i++){
            for(int j=0; j<12; j++){
                copia[i][j] = this.registro[i][j];
            }
        }
        
        return copia;
    }
    
    public abstract String informe();
}