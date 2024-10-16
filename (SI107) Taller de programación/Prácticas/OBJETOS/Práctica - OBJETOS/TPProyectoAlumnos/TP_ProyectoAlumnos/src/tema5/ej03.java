
package tema5;

public class ej03 {


    public static void main(String[] args) {
        Evento nuevoEvento = new Evento ("Privado", "Franco Dogil", "13 de noviembre", "AIRBAG", 3);
        
        nuevoEvento.agregarTema("Nunca lo olvides");
        nuevoEvento.agregarTema("Por mil noches");
        nuevoEvento.agregarTema("Cuchillos Guantanamera");
        nuevoEvento.agregarTema("Cae el sol");
        
        System.out.println(nuevoEvento.actuar());
        
        Gira nuevaGira = new Gira ("Jinetes cromados TOUR", 3, "AIRBAG", 5);
        
        Fecha fecha1 = new Fecha ("QUILMES", "20 de diciembre");
        Fecha fecha2 = new Fecha ("Bera", "21 de diciembre");
        Fecha fecha3 = new Fecha ("Bernal", "22 de diciembre");
        
        nuevaGira.agregarTema("Nunca lo olvides");
        nuevaGira.agregarTema("Cae el sol");
        nuevaGira.agregarTema("Todo pasa");
        nuevaGira.agregarTema("Por mil noches");
        nuevaGira.agregarTema("La moda del monton");
        nuevaGira.agregarTema("Como un diamante");
        
        nuevaGira.agregarFecha(fecha1);
        nuevaGira.agregarFecha(fecha2);
        nuevaGira.agregarFecha(fecha3);
        
        

        System.out.println(nuevaGira.actuar());

        System.out.println(nuevaGira.actuar());
        
        System.out.println(nuevaGira.actuar());
        
        
        System.out.println("Costo de la gira: " + nuevaGira.calcularCosto());
        
        System.out.println("Costo del evento: " + nuevoEvento.calcularCosto());
    }
    
}
