package tp1.ejercicio8;

import java.util.*;

public class Queue <T> extends Secuence {
	protected List <T> data;
	
	public Queue() {
		this.data = new ArrayList();
	}
	
	public void enqueue(T dato) {
		data.add(dato);
	}
	
	public T dequeue (){
		T aux = data.get(0);
		data.remove(0);
		return aux;
	}
	
	public T head (Queue <T> dato) {
		return data.get(0);
	}
	
	public int size() {
		return data.size();
	}
	
	@Override
	public boolean isEmpty() {
		return data.isEmpty();
	}
	
	public String toString() {
		String str = "";
		
		for(int i=0; i<data.size(); i++) {
			str += data.get(i) + ", ";
		}
		
		return str;
	}
}
