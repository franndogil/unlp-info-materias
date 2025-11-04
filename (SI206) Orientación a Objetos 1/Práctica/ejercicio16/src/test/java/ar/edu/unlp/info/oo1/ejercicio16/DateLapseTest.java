package ar.edu.unlp.info.oo1.ejercicio16;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

public class DateLapseTest {
	private DateLapse dl1;
	private LocalDate ld1;
	private LocalDate ld2;
	private LocalDate ld3;
	private LocalDate ld4;
	
	@BeforeEach
	void setUp() {
		ld1 = LocalDate.of(2025, 11, 1);
		ld2 = LocalDate.of(2025, 11, 5);
		ld3 = LocalDate.of(2025, 11, 3);
		ld4 = LocalDate.of(2025, 11, 7);
		
		dl1 = new DateLapse(ld1, ld2);
	}
	
	@Test
	void getFromTest() {
		assertEquals(ld1, dl1.getFrom());
		assertFalse(dl1.getFrom().equals(ld2));
	}
	
	@Test
	void getToTest() {
		assertEquals(ld2, dl1.getTo());
		assertFalse(dl1.getTo().equals(ld1));
	}
	
	@Test
	void sizeInDaysTest() {
		assertEquals(4, dl1.sizeInDays());
		assertTrue(dl1.sizeInDays() >= 0);
	}
	
	@Test
	void sizeInDaysZeroTest() {
	    DateLapse dl = new DateLapse(ld1, ld1);
	    assertEquals(0, dl.sizeInDays());
	}
	
	@Test
	void includesDateTest() {
		assertTrue(dl1.includesDate(ld3));
		assertFalse(dl1.includesDate(ld4));
	}

	@Test
	void includesDateBordeFrom() {
	    assertTrue(dl1.includesDate(ld1));
	}

	@Test
	void includesDateBordeTo() {
	    assertTrue(dl1.includesDate(ld2));
	}

	@Test
	void includesDateBeforeTest() {
	    LocalDate before = ld1.minusDays(1);
	    assertFalse(dl1.includesDate(before));
	}
}
