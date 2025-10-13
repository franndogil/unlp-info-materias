package ar.edu.unlp.info.oo1.ejercicio13;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class AccionTest {
	private Accion accion1;
	
	@BeforeEach
	void setUp() {
		this.accion1 = new Accion("Sony", 100);
	}
	
	@Test
	void testGetValorUnitario() {
		assertEquals(accion1.getValorUnitario(), 100);
	}
}
