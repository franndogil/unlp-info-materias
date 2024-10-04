
package tema3;

public class Hotel {
    private Habitacion [] habitaciones;
    private int cantHabitaciones;
    
    /*constructor*/
    
    public Hotel(int unaCantH){
        cantHabitaciones = unaCantH;
        habitaciones = new Habitacion [unaCantH];       //creo el hotel con la cantidad maxima de habitaciones
        
        for (int i=0; i<unaCantH; i++){         //inicializo cada habitacion
            habitaciones[i] = new Habitacion ();
        }
    }
    
    /*setters*/
    
    public void setCantHabitaciones(int unaCantidad){
        cantHabitaciones = unaCantidad;
    }
    
    public void ingresarCliente(Cliente unCliente, int unaHabitacion){
            habitaciones[unaHabitacion - 1].setCliente(unCliente);
    }
    
    public void aumentarCosto(double unCosto){
        for (int i=0; i<cantHabitaciones; i++){
            double costoActual = habitaciones[i].getCostoPorNoche();
            costoActual = costoActual + unCosto;
            habitaciones[i].setCostoPorNoche(costoActual);
        }
    }
    
    /*getters*/
    
    public int getCantHabitaciones(){
        return cantHabitaciones;
    }
    
    public Habitacion getHabitacion(int unaHabitacion){
        return habitaciones[unaHabitacion-1];
    }
    
    @Override
    public String toString(){
    String aux = "";
    
    for (int i=0; i<cantHabitaciones; i++){
        aux += "Habitacion N°:" + (i+1) + habitaciones[i].toString() + "\n";
    }
    
    return aux;
    }
}
