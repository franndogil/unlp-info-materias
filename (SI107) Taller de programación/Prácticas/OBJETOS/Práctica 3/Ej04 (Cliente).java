
package tema3;

public class Cliente {
    private String nombre;
    private int dni;
    private int edad;
    
    /*constructor*/

    public Cliente(String unNombre, int unDni, int unaEdad){
        nombre = unNombre;
        dni = unDni;
        edad = unaEdad;
    }
    
    /*setters*/
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    public void setDni(int unDni){
        dni = unDni;
    }
    
    public void setEdad(int unaEdad){
        edad = unaEdad;
    }
    
    /*getters*/
    
    public String getNombre(){
        return nombre;
    }
    
    public int getEdad(){
        return edad;
    }
    
    public int getDni(){
        return dni;
    }
    
    @Override
    public String toString(){
    String aux="";
    
    aux = "Nombre: " + nombre + " Edad: " + edad + " DNI: " + dni;
    
    return aux;
    }
}
