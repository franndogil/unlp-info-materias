
package modelo.pkg1;

public class Empresa {
    private String nombre;
    private Lider lider;
    private Programador [] programadores;
    private int capacidad;
    private int dimL = 0;
    
    /*constructor*/
    
    public Empresa(String nombre, Lider lider, int capacidad){
        setNombre(nombre);
        setLider(lider);
        setCapacidad(capacidad);
        
        programadores = new Programador [getCapacidad()];
        
        for (int i=0; i<getCapacidad(); i++){
            programadores[i] = new Programador();
        }
    }
    
    /*setters*/
    void setNombre(String nombre){
        this.nombre = nombre;
    }
    
    void setLider(Lider lider){
        this.lider = lider;
    }
    
    void setProgramadores(Programador [] programadores){
        this.programadores = programadores;
    }
    
    void setCapacidad(int capacidad){
        this.capacidad = capacidad;
    }
    
    /*getters*/
    
    public String getNombre(){
        return nombre;
    }
    
    public Lider getLider(){
        return lider;
    }
    
    public Programador [] getProgramadores(){
        return programadores;
    }
    
    public int getCapacidad(){
        return capacidad;
    }
    
    public int getDimL(){
        return dimL;
    }
    
    /*metodos*/
    
    void agregarProgramador(Programador programador){
        if(getDimL()<getCapacidad()){
            programadores[getDimL()] = programador;
            dimL++;
        }
    }
    
    public double calcularMontoTotal(){
        double montoTotal=lider.calcularSueldoFinalLider();
        
        for (int i=0; i<dimL; i++){
            montoTotal = montoTotal + programadores[i].calcularSueldoFinalProgramador();
        }
        return montoTotal;
    }
    
    void aumentarSueldos(double monto){
        for (int i=0; i<dimL; i++){
            programadores[i].aumentarSueldoBasico(monto);
        }
        lider.aumentarSueldoBasico(monto);
    }
    
    /*toString*/
    
    @Override
    public String toString(){
        String aux = "";
        
        aux = "Nombre: " + getNombre() + "\n" + 
              "Programador lider: " + lider.toString() + "\n";
        
        for (int i=0; i<dimL; i++){
            aux += "Programador n" + (i+1) + ":" + programadores[i].toString() + "\n";
        }
        
        aux += "El monto total en sueldos a abonar por la empresa es de: " + calcularMontoTotal() + " pesos.";
        
        return aux;
    }
    
}
