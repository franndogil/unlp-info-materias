package ar.edu.unlp.info.oo1.modeloParcial1;

import java.time.LocalDate;

public class Main {
	public static void main(String[] args) {
		Usuario us1 = new Usuario("Franco");
		
		Presencial pre1 = new Presencial("E3", LocalDate.of(2025, 11, 15), "PS6", 100, 10);
		pre1.agregarSede(new Sede("Costa Salguero S1", 10, 3));
		pre1.agregarSede(new Sede("Costa Salguero S2", 5, 3));
		
		pre1.comprarEntrada(true, us1);	//la compra con seguro
	}
}
