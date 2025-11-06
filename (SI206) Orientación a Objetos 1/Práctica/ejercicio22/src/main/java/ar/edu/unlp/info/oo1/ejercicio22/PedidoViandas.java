package ar.edu.unlp.info.oo1.ejercicio22;
import java.util.*;

public class PedidoViandas extends Pedido{
	private boolean sinTacc;
	private List<Vianda> viandas;
	
	public PedidoViandas(String email, boolean sinTacc, Vianda vianda, Entrega entrega) {
		super(email, entrega);
		this.sinTacc = sinTacc;
		this.viandas = new LinkedList<Vianda>();
		this.agregarVianda(vianda);
	}
	
	//La empresa dispone de cocina sin TACC, por lo que es muy importante al momento de 
	//realizar un pedido que se indique sí es apto celíaco o no.
	
	public void agregarVianda(Vianda vianda) {
		if(this.sinTacc == vianda.getSinTacc()) {	//se agrega segun el pedido
			this.viandas.add(vianda);
		}
	}

	@Override
	public double calcularCosto() {
		return this.viandas.stream().mapToDouble(a -> a.getPrecio()).sum();
	}
}
