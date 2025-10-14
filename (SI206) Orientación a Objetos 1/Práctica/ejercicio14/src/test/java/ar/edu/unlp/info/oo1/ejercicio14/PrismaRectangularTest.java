package ar.edu.unlp.info.oo1.ejercicio14;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PrismaRectangularTest {
	PrismaRectangular prisma;
	
	@BeforeEach
	void setUp() {
		prisma = new PrismaRectangular(2, 2, 10, "Metal", "Azul");
	}
	
	@Test
	void getVolumenTest() {
		int decimales = 2;
		double factor = Math.pow(10, decimales);
		double truncado = Math.floor(this.prisma.getVolumen() * factor) / factor; 
		
		assertEquals(40, truncado);
	}
	
	@Test
	void getSuperficieTest() {
		int decimales = 2;
		double factor = Math.pow(10, decimales);
		double truncado = Math.floor(this.prisma.getSuperficie() * factor) / factor; 
		
		assertEquals(88, truncado);
	}
	
	@Test
	void colorTest() {
		assertEquals("Azul", this.prisma.getColor());
	}
	
	@Test 
	void materialTest() {
		assertEquals("Metal", this.prisma.getMaterial());
	}
}
