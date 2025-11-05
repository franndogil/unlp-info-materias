package ar.edu.unlp.info.oo1.ejercicio20;
import java.time.LocalDate;

public interface IDateLapse {
	public LocalDate getFrom();
	public LocalDate getTo();
	public int sizeInDays();
	public boolean includesDate(LocalDate other);
	public boolean overlaps(DateLapse anotherDateLapse);
}
