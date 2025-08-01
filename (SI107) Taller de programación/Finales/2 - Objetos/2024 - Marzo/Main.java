
package finalesobjetos.marzo2024;

public class Main {
    public static void main(String[] args) {
        Sector nuevoSector = new Sector("Planta Quilmes", 40);
        
        Empleado nuevoEmpleado1 = new Empleado("Franco", "Dogil", 15);
        Empleado nuevoEmpleado3 = new Empleado("Coni", "Dogil", 11);
        Empleado nuevoEmpleado4 = new Empleado("Sabrina", "Franco", 13);
        
        nuevoSector.agregarEmpleado(nuevoEmpleado1, true);
        nuevoSector.agregarEmpleado(nuevoEmpleado3, false);
        nuevoSector.agregarEmpleado(nuevoEmpleado4, false);
        
        Producto nuevoProducto1 = new Producto (1);
        Producto nuevoProducto2 = new Producto (2);
        
        nuevoSector.agregarProducto(nuevoProducto1);
        nuevoSector.agregarProducto(nuevoProducto2);
        
        nuevoSector.cambiarEtapa(1, 10);
        nuevoSector.cambiarEtapa(1, 10);
        nuevoSector.cambiarEtapa(1, 40);
        nuevoSector.cambiarEtapa(1, 10);
        nuevoSector.cambiarEtapa(1, 10);        //deberia tirar error
        
        System.out.println(nuevoSector.toString());
    }
}
