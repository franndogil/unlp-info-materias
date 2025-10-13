public class InversionEnAccion extends Inversion {
	private String nombre;
	private int cantidad;
	private Accion accion;
	
	public InversionEnAccion(String nombre, int cantidad, Accion accion) {
		this.nombre = nombre;
		this.cantidad = cantidad;
		this.accion = accion;
	}
	
	public double getValorActual() {
		return (this.cantidad * this.accion.getValorUnitario());
	}
}