package ar.edu.unlp.info.oo1.ejercicio14;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;

public class EsferaTest {
	private Esfera esf;
	
	@BeforeEach
	void setUp() {
		this.esf = new Esfera(10, "Metal", "Azul");
	}
	
	@Test
	void getVolumenTest() {
		int decimales = 2;
		double factor = Math.pow(10, decimales);
		double truncado = Math.floor(this.esf.getVolumen() * factor) / factor; 
		
		assertEquals(4188.79, truncado);
	}
	
	@Test
	void getSuperficieTest() {
		assertTrue(1200 < this.esf.getSuperficie());
		assertFalse(10000 < this.esf.getSuperficie());
		
		int decimales = 2;
		double factor = Math.pow(10, decimales);
		double truncado = Math.floor(this.esf.getSuperficie() * factor) / factor; 
		assertEquals(1256.63, truncado);
	}
	
	@Test
	void colorTest() {
		assertEquals("Azul", this.esf.getColor());
	}
	
	@Test
	void materialTest() {
		assertEquals("Metal", this.esf.getMaterial());
	}
}
