package ar.edu.unlp.info.oo1.ejercicio15;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CarpetaTest {
	private Carpeta car1;
	private Carpeta car2;
	private Archivo arc1;
	private Archivo arc2;
	private Email email1;
	private Email email2;
	
	void inicializar() {
		car1 = new Carpeta("CarpetaUno");
		car2 = new Carpeta("CarpetaDos");
		email1 = new Email("EmailUno", "Dale BOCA");
		email2 = new Email("EmailDos" , "El domingo ganamos");
		arc1 = new Archivo("DALEEEEE");
		arc2 = new Archivo("BOCA");
		email1.agregarAdjunto(arc1);
		email2.agregarAdjunto(arc2);
	}
	
	@BeforeEach
	void setUp() {
		inicializar();
	}
	
	@Test
	void testNombre() {
		assertEquals("CarpetaUno", car1.getNombre());
		assertFalse(car1.getNombre().contains("carp"));
		assertTrue(car1.getNombre().contains("Uno"));
	}
	
	@Test
	void agregarCorreoTest() {
		car1.agregarCorreo(email1);
	}
	
	@Test
	void sizeTest(){
		assertEquals( 0, car1.getTamañoCarpeta());
		car1.agregarCorreo(email1);
		assertEquals( 25, car1.getTamañoCarpeta());
		car1.agregarCorreo(email2);
		assertEquals( 55, car1.getTamañoCarpeta());
	}
	
	@Test
	void moverTest() {
		car1.agregarCorreo(email1);
		assertEquals( 25, car1.getTamañoCarpeta());
		car1.mover(email1, car2);
		assertEquals(25, car2.getTamañoCarpeta());
		assertEquals(0, car1.getTamañoCarpeta());
	}
	
	@Test
	void buscarTest() {
		car1.agregarCorreo(email1);
		assertEquals( 25, car1.getTamañoCarpeta());
		assertEquals(email1, car1.buscar("Dale"));
		assertTrue(car1.buscar("Dale").equals(email1));
		assertFalse(car1.buscar("Dale").equals(email2));
	}
}
















