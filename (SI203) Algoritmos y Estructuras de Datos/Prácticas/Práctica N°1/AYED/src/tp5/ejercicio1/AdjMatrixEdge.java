package tp5.ejercicio1;

public class AdjMatrixEdge<T> implements Edge<T> {
	private Vertex<T> target;
	private int weight;
	
	public AdjMatrixEdge(Vertex<T> target, int weight) {
		this.target = target;
		this.weight = weight;
	}
	
	public int getWeight() {
		return weight;
	}
	
	public Vertex<T> getTarget(){
		return target;
	}
}
