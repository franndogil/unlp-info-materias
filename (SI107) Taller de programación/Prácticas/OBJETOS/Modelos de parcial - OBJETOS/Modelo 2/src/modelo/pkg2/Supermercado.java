
package modelo.pkg2;

public class Supermercado {
    private String direccion;
    private int numVentaAct;
    private Caja [] cajas;
    private int capacidad;
    private int dimL = 0;
    
    /*constructores*/
    
    public Supermercado(String direccion){
        setDireccion(direccion);
        setCapacidad(5);
        setNumVentaAct(0);
        
        cajas = new Caja [getCapacidad()];
    }
    
    /*setters*/
    
    void setDireccion(String direccion){
        this.direccion = direccion;
    }
    
    void setNumVentaAct(int numVentaAct){
        this.numVentaAct = numVentaAct;
    }
    
    void setCajas(Caja [] cajas){
        this.cajas = cajas;
    }
    
    void setCapacidad(int capacidad){
        this.capacidad = capacidad;
    }
    
    /*getters*/
    
    public String getDireccion(){
        return direccion;
    }
    
    public int getNumVentaAct(){
        return numVentaAct;
    }
    
    public Caja [] getCajas(){
        return cajas;
    }
    
    public int getCapacidad(){
        return capacidad;
    }
    
    public int getDimL(){
        return dimL;
    }
    
    /*metodos*/
    
    void agregarCaja(Caja caja){
        if(getDimL()<getCapacidad()){
            cajas[getDimL()] = new Caja();
            cajas[getDimL()] = caja;
            dimL++;
        }
    }
    
}
