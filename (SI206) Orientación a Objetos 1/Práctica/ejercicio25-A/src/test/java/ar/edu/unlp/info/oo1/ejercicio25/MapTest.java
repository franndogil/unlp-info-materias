package ar.edu.unlp.info.oo1.ejercicio25;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import java.util.*;

public class MapTest {
	private Map <String, Integer> map;
	private String s1;
	private String s2;
	private String s3;
	
	@BeforeEach
	void setUp() {
		map = new HashMap<>();
		s1 = "Lionel Messi";
		s2 = "Gabriel Batistuta";
		s3 = "Kun Aguero";
	}
	
	@Test
	void agregarTest() {
		assertEquals(0, map.size());
		map.put(s1, 111);
		map.put(s2, 56);
		assertTrue(map.size()>1);
		map.put(s3, 42);
		assertEquals(3, map.size());
		assertFalse(map.size()>4);
	}
	
	@Test
	void removeTest() {
		assertEquals(0, map.size());
		map.put(s1, 111);
		map.put(s2, 56);
		assertTrue(map.size()>1);
		map.put(s3, 42);
		assertEquals(3, map.size());
		map.remove(s3);
		assertEquals(2, map.size());
	}
	
	@Test
	void replaceTest() {
		assertEquals(0, map.size());
		map.put(s1, 111);
		map.put(s2, 56);
		assertTrue(map.size()>1);
		map.replace(s1, 112);
		assertEquals(112, map.get(s1));
	}
	
	@Test
	void repeticion() {
		assertEquals(0, map.size());
		map.put(s1, 111);
		map.put(s2, 56);
		map.put(s2, 56);
		assertTrue(map.size()>1);
		assertEquals(2, map.size());
	}
	
	@Test
	void cantidadGolesTest() {
		assertEquals(0, map.size());
		map.put(s1, 111);
		map.put(s2, 56);
		map.put(s2, 56);
		assertTrue(map.size()>1);
		map.replace(s1, 112);
		int goles = 0;
		for(int gol : map.values()) {
			goles += gol;
		}
		assertEquals(168, goles);
	}
}