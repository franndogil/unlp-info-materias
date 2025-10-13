package ar.edu.unlp.info.oo1.ejercicio13;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.time.LocalDate;

public class PlazoFijoTest {
	private PlazoFijo plazoFijo1;
	private LocalDate date;
	
	void inicializar() {
		this.date = LocalDate.of(2024, 10, 13);
		this.plazoFijo1 = new PlazoFijo(date, 10000, 36);
	}
	
	@BeforeEach
	void setUp() {
		this.inicializar();
	}
	
	@Test
	void testGetValorActual() {
		assertEquals(13600, plazoFijo1.getValorActual());
		assertFalse(plazoFijo1.getValorActual() < 10000);
		
	}
}
