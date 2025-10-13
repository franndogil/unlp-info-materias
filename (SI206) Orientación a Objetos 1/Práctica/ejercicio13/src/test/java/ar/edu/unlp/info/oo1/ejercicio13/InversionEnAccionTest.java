package ar.edu.unlp.info.oo1.ejercicio13;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


public class InversionEnAccionTest {
	private InversionEnAccion inv1;
	
	void inicializar() {
		this.inv1 = new InversionEnAccion("Empresa", 10, new Accion("Aysa", 20));
	}
	
	@BeforeEach
	void setUp() {
		this.inicializar();
	}
	
	@Test
	void testGetValorActual() {
		assertEquals(200, this.inv1.getValorActual());
	}
}
