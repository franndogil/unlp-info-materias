package ar.edu.unlp.info.oo1.ejercicio24;

import java.time.LocalDate;

public class Main {
	public static void main(String[] args) {
		Usuario us1 = new Usuario("Juan Martinez", "Larrea 5800, Mar del Plata");
		
		OrdenCompra oc1 = new OrdenCompra(LocalDate.now(), us1, us1.getDomicilio(), 100);
		Producto pr1 = new Producto("Panel Solar", "Materiales Reciclables", 35000, false);
		Producto pr2 = new Producto("Compostera", "Materiales Reciclables", 8000, true);
		oc1.agregarProducto(pr1);
		oc1.agregarProducto(pr2);
		
		OrdenServicio os1 = new OrdenServicio(LocalDate.of(2025, 11, 20), us1, us1.getDomicilio(), "Instalacion calefon solar", 5);
		Tecnico tec1 = new Tecnico("Lucia Iraola", "Instalaciones Solares", 4500);
		Producto pr3 = new Producto("Calefon Solar", "Materiales Reciclables", 50000, false);
		os1.agregarProducto(pr3);
		os1.agregarTecnico(tec1);
		
		us1.agregarOrden(oc1);
		us1.agregarOrden(os1);
		
		System.out.println("Orden compra: " + oc1.calcularCosto());
		System.out.println("Orden servicio: " + os1.calcularCosto());
	}
}
