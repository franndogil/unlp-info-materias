package ar.edu.unlp.info.oo1.ejercicio22;
import java.util.*;

public class PedidoArticulo extends Pedido{
	private boolean cupon;
	private List<Articulo> articulos;
	
	public PedidoArticulo(String email, boolean cupon, Articulo articulo, Entrega entrega) {
		super(email, entrega);
		this.cupon = cupon;
		this.articulos = new LinkedList<Articulo>();
		this.agregarArticulo(articulo);
	}
	
	public void agregarArticulo(Articulo articulo) {
		this.articulos.add(articulo);
	}
	
	public double calcularPesoPedido() {
		return this.articulos.stream().mapToDouble(a -> a.getPesoEnKg()).sum();
	}

	//Los pedidos de supermercado pueden obtener un 10% de descuento en caso de que se 
	//utilice un cupón de descuento al solicitarlos.
	
	@Override
	public double calcularCosto() {
		if(cupon) {
			return (this.articulos.stream().mapToDouble(a -> a.getPrecio()).sum()) * 0.90;
		}
		return this.articulos.stream().mapToDouble(a -> a.getPrecio()).sum();
	}
}
