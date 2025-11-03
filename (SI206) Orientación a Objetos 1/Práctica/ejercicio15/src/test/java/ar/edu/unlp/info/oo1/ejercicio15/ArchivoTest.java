package ar.edu.unlp.info.oo1.ejercicio15;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ArchivoTest {
	private Archivo arc1;
	
	@BeforeEach
	void setUp() {
		arc1 = new Archivo("ArchivoUno");
	}
	
	@Test
	void sizeTest() {
		assertEquals(10, arc1.getTamañoArchivo());
	}
}
