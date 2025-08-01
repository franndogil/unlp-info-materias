
package finalesobjetos.marzo2024;

public class Producto {
    private int codigo;
    private double costoTotal;
    private int etapa;

    public Producto(int codigo) {
        this.codigo = codigo;
        this.etapa = 1;
        this.costoTotal = 0;
    }
    
    public int getEtapa(){
        return this.etapa;
    }

    public double getCostoTotal() {
        return this.costoTotal;
    }
    
    public int getCodigo(){
        return this.codigo;
    }
    
    public void pasarEtapa(double costo){
        if(this.etapa<5){
            this.etapa += 1;
            this.costoTotal += costo;
            System.out.println("Avance de etapa realizado correctamente!");  
        }
        else{
            System.out.println("No existe la etapa 6.");
        }
    }
}
