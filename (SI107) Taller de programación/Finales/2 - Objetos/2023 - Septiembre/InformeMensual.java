
package finalesobjetos.septiembre2023;

public class InformeMensual extends Estacion{
    
    public InformeMensual(String nombre, int latitud, int longitud, int anios){
        super(nombre, latitud, longitud, anios);
    }
    
    @Override
    public String informe(){
        String retorno="";
        double [] promedios = new double [12];
        
        //inicializamos el vector promedios
        for(int i=0; i<12; i++){
            promedios[i] = 0;
        }
        
        retorno += super.getNombre() + "(" + this.getLatitud() + ", " + this.getLongitud() + "):";
        
        for(int i=0; i<super.getAnios(); i++){
            for(int j=0; j<12; j++){
                promedios[j] += super.getRegistro()[i][j];
            }
        }
        
        for(int i=0; i<12; i++){
            promedios[i] =  promedios[i] / super.getAnios();
            retorno += "Mes: " + (i+1) + " Temp: " + promedios[i] + "°C; ";
        }
        
        return retorno;
    }
}
