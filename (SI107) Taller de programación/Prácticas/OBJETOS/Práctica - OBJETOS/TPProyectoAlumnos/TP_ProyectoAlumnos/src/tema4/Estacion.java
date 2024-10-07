
package tema4;

public abstract class Estacion {
    private String nombre;
    private String latitud;
    private String longitud;
    private int comienzo;
    private int fin;
    private double [][] temperaturas;
    
    /*constructor*/
    
    public Estacion(int comienzo, int fin, double [][] temperaturas, String nombre, String latitud, String longitud){
        setNombre(nombre);
        setLatitud(latitud);
        setLongitud(longitud);
        setComienzo(comienzo);
        setFin(fin);
        setTemperaturas(temperaturas);
    }
    
    /*setters*/
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    
    public void setLatitud(String latitud){
        this.latitud = latitud;
    }
    
    public void setLongitud(String longitud){
        this.longitud = longitud;
    }

    public void setComienzo(int comienzo){
        this.comienzo = comienzo;
    }
    
    public void setFin(int fin){
        this.fin = fin;
    }
    
    public void setTemperaturas(double [][] temperaturas){
        this.temperaturas = temperaturas;
    }
    
    public void setTemperaturaPuntual(double temperaturas, int mes, int año){
        this.temperaturas[mes-1][año-2000]=temperaturas;
    }
    
    /*getters*/
    
    public String getNombre(){
        return nombre;
    }
    
    public String getLatitud(){
        return latitud;
    }
    
    public String getLongitud(){
        return longitud;
    }

    public int getComienzo(){
        return comienzo;
    }
    
    public int getFin(){
        return fin;
    }
    
    public double [][] getTemperaturas(){
        return temperaturas;
    }
    
    public double getTemperaturaPuntual(int mes, int año){
        return temperaturas[mes-1][año-2000];
    }
    
    /*metodos*/
    
    public String mayorTemperaturaRegistrada(){
        String aux="";
        int cant = getFin() - getComienzo() + 1;
        
        double mayTemp = -1;
        int mes;
        
        for (int i=0; i<12; i++){
            for(int j=0; j<cant; j++){
                if(getTemperaturas()[j][i] > mayTemp){
                    mayTemp = getTemperaturas()[j][i];
                    mes = i+1;
                    aux = "Año: "+ (getComienzo()+j) + " Mes: " + mes;
                }
            }
        }
        
        return aux;
    }
    
    /*toSring*/
    
    @Override
    public String toString(){
        String aux = getNombre() + "(" + getLatitud() + ", " + getLongitud() +  ")" + "\n";
        return aux;
    }
}
