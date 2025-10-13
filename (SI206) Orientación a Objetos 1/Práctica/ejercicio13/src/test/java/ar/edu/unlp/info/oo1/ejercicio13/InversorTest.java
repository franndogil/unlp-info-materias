package ar.edu.unlp.info.oo1.ejercicio13;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

public class InversorTest {
	private Inversor inversorUno;
	
	@BeforeEach
	void setUp(){
		inversorUno = new Inversor("Pepe Argento");
	}
	
	@Test
	void testAgregarInversion() {
		Accion ac1 = new Accion("Aysa", 10);
		InversionEnAccion invAc1 = new InversionEnAccion("Empresa", 10, ac1);
		this.inversorUno.agregarInversion(invAc1);
		
		Accion ac2 = new Accion("Branca", 10);
		InversionEnAccion invAc2 = new InversionEnAccion("Empresa", 2, ac2);
		this.inversorUno.agregarInversion(invAc2);
		
		assertTrue(this.inversorUno.getInversiones().contains(invAc1));
		assertTrue(this.inversorUno.getInversiones().size() > 1);
	}
	
	@Test
	void testRetirarInversion() {
		Accion ac1 = new Accion("Aysa", 10);
		InversionEnAccion invAc1 = new InversionEnAccion("Empresa", 10, ac1);
		this.inversorUno.agregarInversion(invAc1);
		assertTrue(this.inversorUno.getInversiones().contains(invAc1));
		
		
		LocalDate date;
		date = LocalDate.of(2024, 10, 13);
		PlazoFijo pf1 = new PlazoFijo(date, 10000, 36);
		this.inversorUno.agregarInversion(pf1);
		
		this.inversorUno.retirarInversion(invAc1);
		assertFalse(this.inversorUno.getInversiones().contains(invAc1));
	}
	
	@Test
	void testGetValorActual() {
		Accion ac1 = new Accion("Aysa", 10);
		InversionEnAccion invAc1 = new InversionEnAccion("Empresa", 10, ac1);
		this.inversorUno.agregarInversion(invAc1);
		assertTrue(this.inversorUno.getInversiones().contains(invAc1));
		
		LocalDate date;
		date = LocalDate.of(2024, 10, 13);
		PlazoFijo pf1 = new PlazoFijo(date, 10000, 36);
		this.inversorUno.agregarInversion(pf1);
		assertTrue(this.inversorUno.getInversiones().contains(pf1));
		
		assertEquals(13700, this.inversorUno.getValorActual());
	}
}
