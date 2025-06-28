package tp5.ejercicio5;

/* La persona conoce si es empleado o jubilado, el nombre y el domicilio.*/
public class Persona {
	private String nombre;
	private String domicilio;
	private boolean empleado;		//true si es empleado, false si es jubliado
	private boolean cobro;
	
	public Persona(boolean empleado, String nombre, String domicilio, boolean cobro) {
		this.nombre = nombre;
		this.domicilio = domicilio;
		this.empleado = empleado;
		this.cobro = cobro;
	}
	
	public String getDomicilio() {
		return domicilio;
	}
	
	public boolean isEmpleado() {
		return empleado;
	}
	
	public boolean yaCobro() {
		return cobro;
	}
	
	public String ToString() {
		return nombre;
	}
}
