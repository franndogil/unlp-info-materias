package ar.edu.unlp.info.oo1.ejercicio21;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import java.time.LocalDate;

public class EnvioLocalTest {
	private EnvioLocal env;
	
	@BeforeEach
	void setUp() {
		env = new EnvioLocal(LocalDate.of(2025, 11, 3), "Quilmes", "Bera", 100);
	}
	
	@Test
	void envioRapidoTest() {
		assertFalse(env.isEnvioRapido());
		env.envioRapido();
		assertTrue(env.isEnvioRapido());
	}
	
	@Test
	void getPesoTest() {
		assertEquals(100, env.getPeso());
	}
	
	@Test
	void calcularCostoTest() {
		assertTrue(env.calcularCosto()>0);
		assertEquals(1000, env.calcularCosto());
		env.envioRapido();
		assertFalse(env.calcularCosto()>1500);
		assertEquals(1500, env.calcularCosto());
	}
}
