package ar.edu.unlp.info.oo1.ejercicio15;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class EmailTest {
	private Archivo arc1;
	private Archivo arc2;
	private Email email1;
	
	void inicializar() {
		email1 = new Email("EmailUno", "Dale BOCA");
		arc1 = new Archivo("DALEEEEE");
		arc2 = new Archivo("BOCA");
		email1.agregarAdjunto(arc1);
		
	}
	
	@BeforeEach
	void setUp() {
		inicializar();
	}
	
	@Test
	void testGetTitulo() {
		assertEquals("EmailUno", email1.getTitulo());
		assertTrue(email1.getTitulo().contains("Uno"));
	}
	
	@Test
	void testGetCuerpo() {
		assertEquals("Dale BOCA", email1.getCuerpo());
		assertFalse(email1.getCuerpo().contains("Aguante riber"));
	}
	
	@Test
	void testSize() {
		assertEquals(25, email1.getTamañoEmail());
		email1.agregarAdjunto(arc2);
		assertEquals(29, email1.getTamañoEmail());
	}
}
