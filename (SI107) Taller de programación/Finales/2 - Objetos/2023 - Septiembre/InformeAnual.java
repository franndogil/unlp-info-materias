
package finalesobjetos.septiembre2023;

public class InformeAnual extends Estacion {
    
    public InformeAnual(String nombre, int latitud, int longitud, int anios){
        super(nombre, latitud, longitud, anios);
    }
    
    @Override
    public String informe(){
        String retorno="";
        double [] promedios = new double [super.getAnios()];
        
        //inicializamos el vector promedios
        for(int i=0; i<super.getAnios(); i++){
            promedios[i] = 0;
        }
     
        retorno += super.getNombre() + "(" + this.getLatitud() + ", " + this.getLongitud() + "):";
        
        for (int i=0; i<super.getAnios(); i++){
            double suma = 0;
            for(int j=0; j<12; j++){
                suma += super.getRegistro()[i][j];
            }
            promedios[i] = suma / 12;
        }
        
        for(int i=0; i<super.getAnios(); i++){
            retorno += "Anio " + (i+1) + ":" + promedios[i] + " °C; "; 
        }
        
        return retorno; 
    }
}
