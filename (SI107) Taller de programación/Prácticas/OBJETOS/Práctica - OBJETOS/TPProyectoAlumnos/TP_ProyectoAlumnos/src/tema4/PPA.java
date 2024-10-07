
package tema4;

public class PPA extends Estacion{
    
    public PPA(int comienzo, int fin, double [][] temperaturas, String nombre, String latitud, String longitud){
        super(comienzo, fin, temperaturas, nombre, latitud, longitud);
    }
    
    /*metodos*/
    
    public double calcularPromedioAnual(int actual){
        double prom=0;
        for (int i=0; i<12; i++){
            prom = prom + getTemperaturas()[actual][i];
        }
        prom = (double) prom / 12;
        return prom;
    }
    
    /*toString*/
    @Override
    public String toString(){
        String aux;
        
        int cant = getFin()- getComienzo();
        
        aux = super.toString();
        
        for (int i=0; i<=cant; i++){
            aux += "Año: " + (getComienzo()+i) + ", Temperatura: " + calcularPromedioAnual(i) + " °C" + "\n";
        }
        
        return aux;
    }
    
}
