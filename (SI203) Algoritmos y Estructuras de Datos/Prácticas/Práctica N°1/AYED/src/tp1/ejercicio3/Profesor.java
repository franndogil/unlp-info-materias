package tp1.ejercicio3;

public class Profesor {
	private String nombre;
	private String apellido;
	private String email;
	private String catedra;
	private String facultad;
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setCatedra(String catedra) {
		this.catedra = catedra;
	}
	
	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public String getApellido() {
		return apellido;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getCatedra() {
		return catedra;
	}
	
	public String getFacultad() {
		return facultad;
	}
	
	public String tusDatos () {
		String aux = "";
		aux = "Nombre: " + this.getNombre() + " Apellido: " + this.getApellido() + " Email: " + this.getEmail() + " Catedra: " + this.getCatedra() + " Facultad: " + this.getFacultad();
		return aux;
	}
}