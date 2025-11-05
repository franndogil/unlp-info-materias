package ar.edu.unlp.info.oo1.ejercicio21;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import java.time.LocalDate;

public class EnvioInterurbanoTest {
	private EnvioInterurbano envIU1;
	private EnvioInterurbano envIU2;
	private EnvioInterurbano envIU3;
	private EnvioInterurbano envIU4;
	private EnvioInterurbano envIU5;
	
	@BeforeEach
	void setUp() {
		envIU1 = new EnvioInterurbano(LocalDate.of(2025, 11, 3), "Quilmes", "La Plata", 100, 99);
		envIU2 = new EnvioInterurbano(LocalDate.of(2025, 11, 3), "Quilmes", "Las Toninas", 100, 333);
		envIU3 = new EnvioInterurbano(LocalDate.of(2025, 11, 3), "Quilmes", "MDQ", 100, 501);
		envIU4 = new EnvioInterurbano(LocalDate.of(2025, 11, 3), "Quilmes", "MDQ", 100, 500);
		envIU5 = new EnvioInterurbano(LocalDate.of(2025, 11, 3), "Quilmes", "Magdalena", 100, 100);
	}
	
	@Test
	void calcularCostoTest() {
		assertEquals(2000, envIU1.calcularCosto());
		assertEquals(2500, envIU2.calcularCosto());
		assertEquals(3000, envIU3.calcularCosto());
		assertEquals(2500, envIU4.calcularCosto());
		assertEquals(2500, envIU5.calcularCosto());
	}
}
