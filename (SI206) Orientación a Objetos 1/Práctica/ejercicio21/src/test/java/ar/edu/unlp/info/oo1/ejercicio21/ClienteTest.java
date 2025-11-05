package ar.edu.unlp.info.oo1.ejercicio21;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.assertFalse;

public class ClienteTest {
	private PersonaFisica per1;
	private ClienteCorporativo cliCorp;
	
	@BeforeEach
	void setUp() {
		per1 = new PersonaFisica("Franco", "MQ", 43851);
		cliCorp = new ClienteCorporativo("FMD", "MQ", 1234);
	}
	
	@Test
	void montoPagarPersonaTest() {
		assertEquals(0, per1.montoPagar(LocalDate.of(2025, 11, 1), LocalDate.of(2025, 11, 13)));
		
		per1.agregarEnvio(new EnvioLocal (LocalDate.of(2025, 11, 5), "MQ-Quilmes", "1M-Quilmes", 100));	//1000 sin envio rapido
		per1.agregarEnvio(new EnvioInterurbano (LocalDate.of(2025, 11, 7), "Quilmes", "La Plata", 100, 50));	//20 * 100 = 2000
																												//3000
		assertTrue(per1.montoPagar(LocalDate.of(2025, 11, 1), LocalDate.of(2025, 11, 13)) > 0); 
		assertEquals(2700, per1.montoPagar(LocalDate.of(2025, 11, 1), LocalDate.of(2025, 11, 13))); //3000 - 10% = 2700
	}
	
	@Test
	void montoPagarTest() {
		assertEquals(0, cliCorp.montoPagar(LocalDate.of(2025, 11, 1), LocalDate.of(2025, 11, 13)));
		
		cliCorp.agregarEnvio(new EnvioLocal (LocalDate.of(2025, 11, 5), "MQ-Quilmes", "1M-Quilmes", 100));	//1000 sin envio rapido
		cliCorp.agregarEnvio(new EnvioInterurbano (LocalDate.of(2025, 11, 7), "Quilmes", "La Plata", 100, 50));	//20 * 100 = 2000
																												//3000
		assertTrue(cliCorp.montoPagar(LocalDate.of(2025, 11, 1), LocalDate.of(2025, 11, 13)) > 0); 
		assertEquals(3000, cliCorp.montoPagar(LocalDate.of(2025, 11, 1), LocalDate.of(2025, 11, 13))); //3000
	}
}