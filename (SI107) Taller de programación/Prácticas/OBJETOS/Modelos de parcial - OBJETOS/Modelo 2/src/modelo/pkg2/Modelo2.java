
package modelo.pkg2;

public class Modelo2 {


    public static void main(String[] args) {
        Supermercado supermarket = new Supermercado ("Manuel Quintana");
        
        Caja caja1 = new Caja ("Ivan Aleksink", 10);
        supermarket.agregarCaja(caja1);
        Caja caja2 = new Caja ("Franco Dogil", 5);
        supermarket.agregarCaja(caja2);
        Caja caja3 = new Caja ("Sabrina Franco", 7);
        supermarket.agregarCaja(caja3);
        Caja caja4 = new Caja ("Constanza Dogil", 15);
        supermarket.agregarCaja(caja4);
        
        Ticket ticket1 = new Ticket (2, 1311, 7, 7000, "EFECTIVO");
        Ticket ticket2 = new Ticket (4, 23123, 4, 4000, "CREDITO");
        Ticket ticket3 = new Ticket (5, 22342, 15, 1000, "DEBITO");
        Ticket ticket4 = new Ticket (6, 24553, 3, 3000, "CREDITO");

        
        supermarket.getCajas()[0].agregarTicket(ticket1);
        supermarket.getCajas()[1].agregarTicket(ticket2);
        supermarket.getCajas()[2].agregarTicket(ticket3);
        supermarket.getCajas()[3].agregarTicket(ticket4);
        
        System.out.println(supermarket.getCajas()[0].getNombreCajero());
        System.out.println(supermarket.getCajas()[1].getNombreCajero());
        System.out.println(supermarket.getCajas()[2].getNombreCajero());
        System.out.println(supermarket.getCajas()[3].getNombreCajero());
        
        for (int i=0; i<4; i++){
            System.out.println(supermarket.getCajas()[i].getTicketsEmitidos()[0].getMetodoDePago());
        }
    }
    
}
