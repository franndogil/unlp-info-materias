package tp1.ejercicio7;

import java.lang.reflect.Constructor;

public class Estudiante {
	private String nombre;
	private String apellido;
	private String comision;
	private String email;
	private String direccion;
	
	public Estudiante() {
		
	}
	
	public Estudiante(String nombre, String apellido, String comision, String email, String direccion) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.comision = comision;
		this.email = email;
		this.direccion = direccion;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	
	public void setComision(String comision) {
		this.comision = comision;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public String getApellido() {
		return apellido;
	}
	
	public String getComision() {
		return comision;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getDireccion() {
		return direccion;
	}
	
	public String tusDatos(){
	
		String aux = "";
		aux = "Nombre: " + this.getNombre() + " Apellido: " + this.getApellido() + " Email: " + this.getEmail() + " Comision: " + this.getComision() + " Direccion: " + this.getDireccion();
		return aux;
	}
}
