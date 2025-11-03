package ar.edu.unlp.info.oo1.ejercicio15;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ClienteDeCorreoTest {
	private ClienteDeCorreo clienteCorreo;
	private Carpeta carpeta;

	@BeforeEach
	void setUp() {
		clienteCorreo = new ClienteDeCorreo();
		carpeta = new Carpeta("Eliminados");
		clienteCorreo.agregarCarpeta(carpeta);
	}

	@Test
	void testBuscar() {
		Email email = new Email("hola", "chau");
		clienteCorreo.recibir(email);
		assertNotNull(clienteCorreo.buscar("hola"));
	}

	@Test
	void testEspacioOcupado() {
		Email email1 = new Email("1", "2");
		Email email2 = new Email("Uno", "Dos");
		clienteCorreo.recibir(email1);
		assertEquals(2, clienteCorreo.espacioOcupado());
	}
	
}
