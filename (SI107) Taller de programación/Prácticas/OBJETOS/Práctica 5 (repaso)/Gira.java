
package tema5;

public class Gira extends Recital{
    private String nombreGira;
    private Fecha [] fechas;
    private int cantFechas;
    private int numFecha = 0;
    private int dimFechas = 0;
    

    public Gira(String nombreGira, int cantFechas, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.nombreGira = nombreGira;
        this.cantFechas = cantFechas;
        this.fechas = new Fecha[getCantFechas()];
    }

    public Fecha[] getFechas() {
        return fechas;
    }

    public int getNumFecha() {
        return numFecha;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public void setNumFecha(int numFecha) {
        this.numFecha = numFecha;
    }

    public int getDimFechas() {
        return dimFechas;
    }

    public void setDimFechas(int dimFechas) {
        this.dimFechas = dimFechas;
    }
    
    
    
    
    
    
    @Override
    public String actuar(){
        String aux="";
        
        if(getNumFecha()<getCantFechas()){
            aux = "Buenas noches " + getFechas()[getNumFecha()].getCiudad() + super.actuar();
            setNumFecha(getNumFecha()+1);
        }
        
        return aux;
    }
    
    public void agregarFecha(Fecha fechaNueva){
        if(getDimFechas()<getCantFechas()){
            fechas[getDimFechas()] = fechaNueva;
            setDimFechas(getDimFechas()+1);
        }
    }
    
    
    @Override
    public double calcularCosto(){
        double costoFinal;
        
        costoFinal = getCantFechas()*30000;
        return costoFinal;
    }
}
