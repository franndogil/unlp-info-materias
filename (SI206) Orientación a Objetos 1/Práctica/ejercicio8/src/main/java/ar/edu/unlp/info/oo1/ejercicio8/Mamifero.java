package ar.edu.unlp.info.oo1.ejercicio8;
import java.time.LocalDate;

public class Mamifero {
	private String identificador;
	private String especie;
	private LocalDate fechaNacimiento;
	private Mamifero padre;
	private Mamifero madre;
	
	//???????????????????????????????
	
	public Mamifero() {}
	
	public Mamifero(String identificador) {
		this.identificador = identificador;
	}
	
	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}
	
	public String getIdentificador() {
		return this.identificador;
	}
	
	public void setEspecie(String especie) {
		this.especie = especie;
	}
	
	public String getEspecie() {
		return this.especie;
	}
	
	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	
	public LocalDate getFechaNacimiento() {
		return this.fechaNacimiento;
	}
	
	public void setPadre(Mamifero padre) {
		this.padre = padre;
	}
	
	public Mamifero getPadre() {
		return this.padre;
	}
	
	public void setMadre(Mamifero madre) {
		this.madre = madre;
	}
	
	public Mamifero getMadre() {
		return this.madre;
	}
	
	public Mamifero getAbuelaMaterna() {
		if(this.madre != null) {
			return this.madre.getMadre();
		}
		return null;
	}
	
	public Mamifero getAbuelaPaterna() {
		if(this.padre != null) {
			return this.padre.getMadre();
		}
		return null;
	}
	
	public Mamifero getAbueloMaterno() {
		if(this.madre != null) {
			return this.madre.getPadre();
		}
		return null;
	}
	
	public Mamifero getAbueloPaterno() {
		if(this.padre != null) {
			return this.padre.getPadre();
		}
		return null;
	}
	
	//-------Metodo raro
	
	public boolean tieneComoAncestroA(Mamifero ancestro) {
		boolean encontre = false;
		if((this.padre != null && this.padre.equals(ancestro))||(this.madre != null && this.madre.equals(ancestro))){
			encontre = true;
		}
		else {
			//voy a los padres de los padres
			//primero al padre
			if(this.padre!=null) {	///IMPORTANTE CHECK NULL EN AMBOS CASOSS
				encontre = this.padre.tieneComoAncestroA(ancestro);
			}
			//si todavia no lo encontre, despues voy a la madre
			if(!encontre) {
				if(this.madre != null) {
					encontre = this.madre.tieneComoAncestroA(ancestro);
				}
			}
		}
		
		return encontre;
	}
}
