package ar.edu.unlp.info.oo1.ejercicio19;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class PropiedadTest {
	private Usuario userCliente;
	private Propiedad prop1;
	private Propiedad prop2;

	@BeforeEach
	public void setUp() {
		userCliente = new Usuario("Franco", "MQ1633", 4859288);
		prop1 = new Propiedad("MQ1636", "Quincho", 2000);
		prop2 = new Propiedad("44y27", "Tonis", 2000);
	}
	
	@Test
	void crearReservaTest() {
		assertEquals(0, prop1.getReservas().size());
		DateLapse dateL1 =  new DateLapse(LocalDate.of(2025, 11, 13), LocalDate.of(2025, 11, 15));
		prop1.crearReserva(userCliente, dateL1);
		assertEquals(1, prop1.getReservas().size());
	}
	
	@Test
	void cancelarReservaTest() {
		assertEquals(0, prop1.getReservas().size());
		DateLapse dateL1 =  new DateLapse(LocalDate.of(2025, 11, 13), LocalDate.of(2025, 11, 15));
		Reserva reserva = prop1.crearReserva(userCliente, dateL1);
		assertEquals(1, prop1.getReservas().size());
		prop1.cancelarReserva(reserva);
		assertEquals(0, prop1.getReservas().size());
	}
}
