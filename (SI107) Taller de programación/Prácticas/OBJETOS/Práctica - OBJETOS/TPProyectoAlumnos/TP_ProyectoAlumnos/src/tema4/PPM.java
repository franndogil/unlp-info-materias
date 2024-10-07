
package tema4;

public class PPM extends Estacion{
    
    private String [] meses = null;
    
    /*constructor*/
    
    public PPM(int comienzo, int fin, double [][] temperaturas, String nombre, String latitud, String longitud, String [] meses){
        super(comienzo, fin, temperaturas, nombre, latitud, longitud);
        setMeses(meses);
    }
    
    /*setters*/
    public void setMeses(String [] meses){
        this.meses = meses;
    }
    
    /*getters*/
    public String[] getMeses(){
        return meses;
    }
    
    /*metodos*/
    
    public double calcularPromedioPorMeses(int mes){
        double prom=0;
        
        for (int i=0; i<(getFin() - getComienzo() + 1); i++){
            prom = prom + getTemperaturas()[i][mes];    //el promedio guardara para el mismo mes, todos los datos de los diferentes
                                                        //años y luego lo divide por la cantidad de años
        }
        
        prom = (double) prom / (getFin() - getComienzo() + 1);
        return prom;
    }
    
    /*toString*/
    @Override
    public String toString(){
        String aux="";
        
        int cant = getFin() - getComienzo() + 1;
        
        aux += "\n " + super.toString();
        for (int i=0; i<12; i++){
            aux += getMeses()[i] + ": " + calcularPromedioPorMeses(i) + " °C" +  "\n"; 
        }
        return aux;
    }
}
