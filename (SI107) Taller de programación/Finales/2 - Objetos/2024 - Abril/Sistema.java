
package finalesobjetos.abril2024;

public class Sistema {
    private Poliza [][] polizas;
    
    public Sistema(){
        this.polizas = new Poliza [10][200];
        for(int i = 0; i<10; i++){
            for(int j = 0; j<200; j++){
                polizas[i][j] = null;
            }
        }
    }
    
    public void agregarPoliza(Poliza nuevaPoliza, int rubro){
        int i = 0;
        boolean ok = false;
        while((!ok)&&(i<200)){
            if(polizas[rubro-1][i] == null){
                polizas[rubro-1][i] = nuevaPoliza;
                ok = true;
                System.out.println("Poliza agregada correctamente!");
            }
            i++;
        }
        if(!ok){
            System.out.println("No hay espacio para agregar la poliza!");
        }
    }
    
    public String infoCliente(int dni){
        String retorno = "";
        
        retorno += "Cliente: " + dni + "\n";
        int k=0;
        
        for(int i=0; i<10; i++){
            for(int j=0; j<200; j++){
                if(polizas[i][j] != null){
                    if(polizas[i][j].getCliente().getDni() == dni){ 
                        k++;
                        retorno += k +"*" + polizas[i][j].toString();
                    }
                }
            }
        }
        return retorno;
    }
    
    public void aumentarCuotas(double porcentaje, int rubro){
        for(int j=0; j<200; j++){
            if(polizas[rubro-1][j] != null){
                double cuotaActual = polizas[rubro-1][j].getCuotaMensual();
                polizas[rubro-1][j].setCuotaMensual(cuotaActual * porcentaje);
            }
        }
    }
    
    public int cantidadAVencer(int mes, int anio){
        int cant = 0;
        
        for(int i=0; i<10; i++){
            for(int j=0; j<200; j++){
                if(polizas[i][j] != null){
                     if((polizas[i][j].getFinCobertura().getMes() == mes)&&(polizas[i][j].getFinCobertura().getAnio() == anio)){
                    cant++;
                    }
                }
            }
        }  
        return cant;
    }
    
    public String mostrarAumento(int rubro){
        String retorno = "";
        
        for(int j=0; j<200; j++){
            if(polizas[rubro-1][j]!=null){
                retorno += polizas[rubro-1][j].toString() + "\n";
            }
        }
        
        return retorno;
    }
}
