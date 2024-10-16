
package tema5;


public class Evento extends Recital{
    private String motivo;
    private String contratante;
    private String dia;

    public Evento(String motivo, String contratante, String dia, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.motivo = motivo;
        this.contratante = contratante;
        this.dia = dia;
    }

    public String getMotivo() {
        return motivo;
    }

    public String getContratante() {
        return contratante;
    }
    
    @Override
    public String actuar(){
        String aux="";
        
        if(getMotivo().equals("Beneficio")){
            aux = "Recuerden colaborar con " + getContratante();
        }
        
        if(getMotivo().equals("TV")){
            aux = "Saludos amigos televidentes! ";
        }
        
        if(getMotivo().equals("Privado")){
            aux = "Un feliz cumpleaños para " + getContratante();
        }
        
        aux += super.actuar();
        
        return aux;
    }
    
    @Override
    public double calcularCosto(){
        double costoFinal=0;
        
        if(getMotivo().equals("Beneficio")){
            costoFinal=0;
        }
        
        if(getMotivo().equals("TV")){
            costoFinal=50000;
        }
        
        if(getMotivo().equals("Privado")){
            costoFinal=150000;
        }
        
        return costoFinal;
    }
}
