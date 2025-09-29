package ar.edu.unlp.info.oo1.ejercicio9;
import java.util.*;

public class Farola {
	private boolean estado;
	private List<Farola> vecinas;
	
	public Farola() {
		this.estado = false;
		this.vecinas = new LinkedList<Farola>();
	}
	
	public boolean isOn() {
		if(this.estado) {
			return true;
		}
		return false;
	}
	
	public boolean isOff() {
		if(!this.estado) {
			return true;
		}
		return false;
	}
	
	public void turnOn() {
		if(this.isOff()) {
			this.estado = true;
			for(Farola f : vecinas) {
				f.turnOn();
			}
		}
	}
	
	public void turnOff() {
		if(this.isOn()) {
			this.estado = false;
			for(Farola f : vecinas) {
				f.turnOff();
			}
		}
	}
	
	public List<Farola> getNeighbors(){
		return this.vecinas;
	}
	
	public void pairWithNeighbor( Farola otraFarola ) {
		this.vecinas.add(otraFarola);
		otraFarola.vecinas.add(this);
	}
}
