
package modelo.pkg2;

public class Caja {
    private String nombreCajero;
    private Ticket [] ticketsEmitidos;
    private int capacidad;
    private int dimL = 0;
    
    /*constructor*/
    
    public Caja(){
    
    }
    
    public Caja(String nombreCajero, int capacidad){
        setNombreCajero(nombreCajero);
        setCapacidad(capacidad);
        ticketsEmitidos = new Ticket [getCapacidad()];
    }
    
    /*setters*/
    
    void setNombreCajero(String nombreCajero){
        this.nombreCajero = nombreCajero;
    }
    
    void setTicketsEmitidos(Ticket [] ticketsEmitidos){
        this.ticketsEmitidos = ticketsEmitidos;
    }
    
    void setCapacidad(int capacidad){
        this.capacidad = capacidad;
    }
    
    void setDimL(int dimL){
        this.dimL = dimL;
    }
    
    /*getters*/
    
    public String getNombreCajero(){
        return nombreCajero;
    }
    
    public Ticket [] getTicketsEmitidos(){
        return ticketsEmitidos;
    }
    
    public int getCapacidad(){
        return capacidad;
    }
    
    public int getDimL(){
        return dimL;
    }
    /*metodos*/
    
    void agregarTicket(Ticket ticket){
        if(getDimL()<getCapacidad()){
            ticketsEmitidos[getDimL()] = new Ticket();
            ticketsEmitidos[getDimL()] = ticket;
        }
    }
}
