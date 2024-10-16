
package tema5;

public abstract class Recital {
    private String nombreBanda;
    private String [] listaTemas;
    private int cantTemas;
    private int dimL = 0;

    public Recital(String nombreBanda, int cantTemas) {
        this.nombreBanda = nombreBanda;
        this.cantTemas = cantTemas;
        this.listaTemas = new String [getCantTemas()];
    }

    public int getCantTemas() {
        return cantTemas;
    }

    public int getDimL() {
        return dimL;
    }

    public String[] getListaTemas() {
        return listaTemas;
    }
    
    
    
    /**/
    public void agregarTema(String tema){
        if(getDimL()<getCantTemas()){
            listaTemas[getDimL()] = tema;
            dimL++;
        }
        else
            System.out.println("No hay espacio para agregar el tema a la lista!: " + tema);
    }
    
    public String actuar(){
        String aux="";
    
        for (int i=0; i<getDimL(); i++){
            aux += "\n" + "y ahora tocaremos... " + getListaTemas()[i];
        }
        
        return aux;
    }
    
    public abstract double calcularCosto();
    
}  
