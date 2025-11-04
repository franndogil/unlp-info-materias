package ar.edu.unlp.info.oo1.ejercicio16;

import java.time.chrono.*;
import java.time.temporal.ChronoUnit;
import java.time.LocalDate;

public class DateLapse {
	private LocalDate from;
	private LocalDate to;
	
	public DateLapse(LocalDate from, LocalDate to) {
		this.from = from;
		this.to = to;
	}
	
	public LocalDate getFrom() {
		return this.from;
	}
	
	public LocalDate getTo() {
		return this.to;
	}
	
	public int sizeInDays() {
		return (int) ChronoUnit.DAYS.between(from, to);
	}
	
	public boolean includesDate(LocalDate other) {
		boolean enRango = !other.isBefore(this.from) && !other.isAfter(this.to);
		return enRango;
	}
}
