
package tema5;

import PaqueteLectura.Lector;

public class ej02 {

    public static void main(String[] args) {
        Estacionamiento nuevoEstacionamiento = new Estacionamiento ("PARKING FD", "Quintana 12", "08:00" , "24:00", 3, 3 );
        
        Auto nuevoAuto = new Auto ("Franco Dogil", "AOJ640");
        nuevoEstacionamiento.registrarAuto(nuevoAuto, 1, 1);
        
        Auto nuevoAuto2 = new Auto ("Leo Dogil", "IZG306");
        nuevoEstacionamiento.registrarAuto(nuevoAuto2, 2, 1);
        
        Auto nuevoAuto3 = new Auto ("Leo Dogil", "FNJ277");
        nuevoEstacionamiento.registrarAuto(nuevoAuto3, 3, 2);
        
        Auto nuevoAuto4 = new Auto ("Ivan Aleksink", "EHI288");
        nuevoEstacionamiento.registrarAuto(nuevoAuto4, 2, 2);
        
        Auto nuevoAuto5 = new Auto ("Franco Dogil", "FNJ234");
        nuevoEstacionamiento.registrarAuto(nuevoAuto5, 2, 3);
        
        Auto nuevoAuto6 = new Auto ("Franco Dogil", "FNJ232");
        nuevoEstacionamiento.registrarAuto(nuevoAuto6, 3, 3);
        
        
        System.out.println("Ingrese la patente a buscar: ");
        String patenteBuscada = Lector.leerString();
        
        System.out.println(nuevoEstacionamiento.buscarPatente(patenteBuscada));
        
        System.out.println(nuevoEstacionamiento.toString());
        
        int numeroPlaza=1;
        
        System.out.println("La sumatoria de autos en la plaza " + numeroPlaza + " en de cada piso es igual a: " + nuevoEstacionamiento.cantidadAutos(numeroPlaza));
    }
    
}
