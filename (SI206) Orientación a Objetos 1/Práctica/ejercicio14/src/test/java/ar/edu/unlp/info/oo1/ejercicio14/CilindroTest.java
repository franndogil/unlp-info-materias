package ar.edu.unlp.info.oo1.ejercicio14;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CilindroTest {
	private Cilindro cil1;
	
	@BeforeEach
	void setUp() {
		this.cil1 = new Cilindro(10, 2, "Metal", "Rojo");
	}
	
	@Test
	void getVolumenTest() {
		int decimales = 2;
		double factor = Math.pow(10, decimales);
		double truncado = Math.floor(this.cil1.getVolumen() * factor) / factor; 
		
		assertEquals(125.66, truncado);
	}
	
	@Test
	void getSuperficieTest() {
		int decimales = 2;
		double factor = Math.pow(10, decimales);
		double truncado = Math.floor(this.cil1.getSuperficie() * factor) / factor; 
		
		assertEquals(150.79, truncado);
	}
	
	@Test
	void colorTest() {
		assertEquals("Rojo", this.cil1.getColor());
	}
	
	@Test
	void materialTest() {
		assertEquals("Metal", this.cil1.getMaterial());
	}
}
