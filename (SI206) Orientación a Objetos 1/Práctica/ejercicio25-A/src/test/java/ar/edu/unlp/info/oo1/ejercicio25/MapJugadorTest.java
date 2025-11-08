package ar.edu.unlp.info.oo1.ejercicio25;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import java.util.*;

public class MapJugadorTest {
	private Map <Jugador, Integer> map;
	private Jugador j1;
	private Jugador j2;
	private Jugador j3;
	
	@BeforeEach
	void setUp() {
		map = new HashMap<>();
		j1 = new Jugador("Lionel", "Messi");
		j2 = new Jugador("Gabriel", "Batistuta");
		j3 = new Jugador("Kun", "Aguero");
	}
	
	@Test
	void agregarTest() {
		assertEquals(0, map.size());
		map.put(j1, 111);
		map.put(j2, 56);
		assertTrue(map.size()>1);
		map.put(j3, 42);
		assertEquals(3, map.size());
		assertFalse(map.size()>4);
	}
	
	@Test
	void removeTest() {
		assertEquals(0, map.size());
		map.put(j1, 111);
		map.put(j2, 56);
		assertTrue(map.size()>1);
		map.put(j3, 42);
		assertEquals(3, map.size());
		map.remove(j3);
		assertEquals(2, map.size());
	}
	
	@Test
	void replaceTest() {
		assertEquals(0, map.size());
		map.put(j1, 111);
		map.put(j2, 56);
		assertTrue(map.size()>1);
		map.replace(j1, 112);
		assertEquals(112, map.get(j1));
	}
	
	@Test
	void repeticion() {
		assertEquals(0, map.size());
		map.put(j1, 111);
		map.put(j2, 56);
		map.put(j2, 56);
		assertTrue(map.size()>1);
		assertEquals(2, map.size());
	}
	
	@Test
	void cantidadGolesTest() {
		assertEquals(0, map.size());
		map.put(j1, 111);
		map.put(j2, 56);
		map.put(j2, 56);
		assertTrue(map.size()>1);
		map.replace(j1, 112);
		int goles = 0;
		for(int gol : map.values()) {
			goles += gol;
		}
		assertEquals(168, goles);
	}
}
