package ar.edu.unlp.info.oo1.ejercicio3;
import java.time.LocalDate;
import java.util.*;

public class Presupuesto {
	private LocalDate date;
	private String cliente;
	private List<Item> items;
	
	public Presupuesto(String cliente) {
		this.cliente = cliente;
		this.date = LocalDate.now();
		this.items = new LinkedList<Item>();
	}
	
	public LocalDate getFecha() {
		return this.date;
	}
	
	public String getCliente() {
		return this.cliente;
	}
	
	public void agregarItem(Item item) {
		this.items.add(item);
	}
	
	public double calcularTotal() {
		double total = 0;
		for(Item i : this.items) {
			total += i.costo();
		}
		return total;
	}
}
