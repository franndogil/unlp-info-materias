
package finalesobjetos.abril2024;

public class Fecha {
    private int mes;
    private int anio;
    
    public Fecha(int mes, int anio){
        if(mes<=12 && mes>= 1){
            this.mes = mes;
            this.anio = anio;
        }
    }
    
    public int getMes(){
        return this.mes;
    }
    
    public int getAnio(){
        return this.anio;
    }
    
    @Override
    
    public String toString(){
        return "Mes: " + this.mes + " Anio: " + this.anio;
    }
}
