package tp5.ejercicio1;

public class AdjMatrixVertex<T> implements Vertex<T> {

	private T data;
	private int position;
	
	public AdjMatrixVertex(T data, int position) {
		this.data = data;
		this.position = position;
	}
	
	public T getData(){
		return data;
	}
	
	public void setData(T data) {
		this.data = data;
	}
	
	public int getPosition() {
		return position;
	}

	public void decrementPosition() {
		this.position--;
	}
}
