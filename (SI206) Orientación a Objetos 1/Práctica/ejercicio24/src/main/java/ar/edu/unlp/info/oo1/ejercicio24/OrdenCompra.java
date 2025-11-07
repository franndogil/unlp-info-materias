package ar.edu.unlp.info.oo1.ejercicio24;
import java.util.*;
import java.time.LocalDate;

public class OrdenCompra extends Orden{
	private double precioEnvio;
	
	public OrdenCompra(LocalDate fecha, Usuario usuario, String domicilio, double precioEnvio) {
		super(fecha, usuario, domicilio);
		this.precioEnvio = precioEnvio;
	}
	
	@Override
	public double calcularCosto() {
		double costo = 0;
		costo += this.precioEnvio;
		List<Producto> productos = super.getProductos();
		if(productos != null) {
			for(Producto p : productos) {
				costo += p.getCosto();
			}
		}
		
		if(productos.size() >= 5) {
			costo = costo * 0.90;
		}
		
		return costo;
	}
}
