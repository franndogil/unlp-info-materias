package ar.edu.unlp.info.oo1.ejercicio19;

import java.time.chrono.*;
import java.time.temporal.ChronoUnit;
import java.time.LocalDate;

public class DateLapse implements IDateLapse{
	private LocalDate from;
	private int sizeInDays;
	
	public DateLapse(LocalDate from, LocalDate to){
		this.from = from;
		this.sizeInDays = (int) java.time.temporal.ChronoUnit.DAYS.between(from, to);
	}

	@Override
	public LocalDate getFrom() {
		return this.from;
	}

	@Override
	public LocalDate getTo() {
		return this.from.plusDays(sizeInDays);
	}

	@Override
	public int sizeInDays() {
		return this.sizeInDays;
	}

	@Override
	public boolean includesDate(LocalDate other) {
		boolean enRango = !other.isBefore(from) && !other.isAfter(this.getTo());
		return enRango;
	}

	@Override
	public boolean overlaps(DateLapse anotherDateLapse) {
		if(anotherDateLapse.includesDate(from) || anotherDateLapse.includesDate(getTo())) {
			return true;
		}
		return false;
	}
}
