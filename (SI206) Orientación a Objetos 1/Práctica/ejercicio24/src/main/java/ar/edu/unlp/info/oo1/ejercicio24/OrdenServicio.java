package ar.edu.unlp.info.oo1.ejercicio24;
import java.time.LocalDate;
import java.util.*;

public class OrdenServicio extends Orden{
	private String descripcion;
	private int horas;
	private List<Tecnico> tecnicos;
	
	public OrdenServicio(LocalDate fecha, Usuario usuario, String domicilio, String descripcion, int horas) {
		super(fecha, usuario, domicilio);
		this.descripcion = descripcion;
		this.horas = horas;
		this.tecnicos = new LinkedList<Tecnico>();
	}
	
	@Override
	public double calcularCosto() {
		double costo = 0;
		
		List<Producto> productos = super.getProductos();
		if(productos != null) {
			for(Producto p : productos) {
				costo += p.getCosto();
			}
		}
		
		List<Tecnico> tecnicos = new LinkedList<Tecnico>(this.tecnicos);
		if(tecnicos != null) {
			for(Tecnico t : tecnicos) {
				costo += (t.getValorHora() * this.horas);
			}
		}
		
		if(this.horas>10) {
			costo = costo * 0.90;
		}
		
		return costo;
	}
	
	public void agregarTecnico(Tecnico tecnico) {
		if(tecnico != null) {
			this.tecnicos.add(tecnico);
		}
	}
}
