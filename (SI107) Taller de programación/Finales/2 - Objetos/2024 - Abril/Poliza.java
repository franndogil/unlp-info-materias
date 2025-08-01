
package finalesobjetos.abril2024;

public class Poliza {
    private double montoAsegurado;
    private double cuotaMensual;
    private Fecha comienzoCobertura;
    private Fecha finCobertura;
    private Cliente cliente;
    
    public Poliza(double montoAsegurado, double cuotaMensual, Fecha comienzoCobertura, Fecha finCobertura, Cliente cliente){
        this.montoAsegurado = montoAsegurado;
        this.cuotaMensual = cuotaMensual;
        this.comienzoCobertura = comienzoCobertura;
        this.finCobertura = finCobertura;
        this.cliente = cliente;
    }
    
    public Cliente getCliente(){
        return this.cliente;
    }
    
    public Fecha getFinCobertura(){
        return this.finCobertura;
    }
    
    public double getCuotaMensual(){
        return this.cuotaMensual;
    }
    
    public void setCuotaMensual(double nuevoValor){
        this.cuotaMensual = nuevoValor;
    }
    
    @Override
    
    public String toString(){
        String retorno = "";
        retorno += " Monto asegurado: " + this.montoAsegurado;
        retorno += " Cuota mensual: " + this.cuotaMensual;
        retorno += " Comienzo cobertura: " + this.comienzoCobertura;
        retorno += " Fin Cobertura: " + this.finCobertura;
        retorno += "\n";
        return retorno;
    }
}
