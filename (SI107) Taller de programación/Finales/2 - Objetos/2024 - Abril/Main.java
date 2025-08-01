
package finalesobjetos.abril2024;
import PaqueteLectura.Lector;

public class Main {
    public static void main(String[] args) {
        Sistema nuevoSistema = new Sistema();
        Cliente cliente1 = new Cliente(1311, "Franco", "Dogil");
        Cliente cliente2 = new Cliente(1312, "Sabrina", "Franco");
        Cliente cliente3 = new Cliente(1313, "Coni", "Dogil");
        
        Fecha nuevaFecha1 = new Fecha(1, 2022);
        Fecha nuevaFecha2 = new Fecha(4, 2024);     //abril 2024
        Fecha nuevaFecha3 = new Fecha(5, 2025);
        Fecha nuevaFecha4 = new Fecha(6, 2026);
        
        Poliza poliza1 = new Poliza(10000, 100, nuevaFecha1, nuevaFecha2, cliente1);    //abril 2024
        Poliza poliza2 = new Poliza(10000, 100, nuevaFecha1, nuevaFecha2, cliente1);    //abril 2024    //deberia dar 3 la suma final
        Poliza poliza3 = new Poliza(10000, 100, nuevaFecha1, nuevaFecha2, cliente1);    //abril 2024
        Poliza poliza4 = new Poliza(10000, 100, nuevaFecha1, nuevaFecha3, cliente2);
        Poliza poliza5 = new Poliza(10000, 100, nuevaFecha1, nuevaFecha4, cliente3);
        
        nuevoSistema.agregarPoliza(poliza1, 2);
        nuevoSistema.agregarPoliza(poliza2, 3);
        nuevoSistema.agregarPoliza(poliza3, 3);
        nuevoSistema.agregarPoliza(poliza4, 4);
        nuevoSistema.agregarPoliza(poliza5, 1);
        
        System.out.println("Ingrese el DNI del cliente: ");
        int dniCliente = Lector.leerInt();                      //SE INGRESA POR TECLADO
        
        System.out.println(nuevoSistema.infoCliente(dniCliente));
        
        nuevoSistema.aumentarCuotas(1.11, 3);
        System.out.println("Muestra del aumento: ");
        System.out.println(nuevoSistema.mostrarAumento(3));
       
        System.out.println("Cantidad de polizas que se vencen en abril de 2024: " + nuevoSistema.cantidadAVencer(4, 2024));     //CORRECTO
    }
}
