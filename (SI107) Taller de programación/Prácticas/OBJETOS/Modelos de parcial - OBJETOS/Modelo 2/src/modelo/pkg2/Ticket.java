
package modelo.pkg2;

public class Ticket {
    private int numeroTicket;
    private int cuitCliente;
    private int cantProdComp;
    private double montoAbonado;
    private String metodoDePago;
    
    /*constructor*/
    
    public Ticket(){
    
    }
    
    public Ticket(int numeroTicket, int cuitCliente, int cantProdComp, double montoAbonado, String metodoDePago){
        setNumeroTicket(numeroTicket);
        setCuitCliente(cuitCliente);
        setCantProdComp(cantProdComp);
        setMontoAbonado(montoAbonado);
        setMetodoDePago(metodoDePago);
    }
    
    /*setters*/
    void setNumeroTicket(int numeroTicket){
        this.numeroTicket = numeroTicket;
    }
    
    void setCuitCliente(int cuitCliente){
        this.cuitCliente = cuitCliente;
    }
    
    void setCantProdComp(int cantProdComp){
        this.cantProdComp = cantProdComp;
    }
    
    void setMontoAbonado(double montoAbonado){
        this.montoAbonado = montoAbonado;
    }
    
    void setMetodoDePago(String metodoDePago){
        this.metodoDePago = metodoDePago;
    }
    /*getters*/
    public int getNumeroTicket(){
        return numeroTicket;
    }
    
    public int getCuitCliente(){
        return cuitCliente;
    }
    
    public int getCantProdComp(){
        return cantProdComp;
    }
    
    public double getMontoAbonado(){
        return montoAbonado;
    }
    
    public String getMetodoDePago(){
        return metodoDePago;
    }    
    /*metodos*/
    

}
