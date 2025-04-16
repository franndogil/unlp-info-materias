package tp2.ejercicio1;

import java.util.*;

public class BinaryTree <T> {
	
	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	@Override
	public String toString() {
		return this.getData().toString();
	}

	private void contarHojasRecursivo(int contador) {
	    if (!this.hasLeftChild() && !this.hasRightChild()) {
	        contador++; // Incrementa el contador si es una hoja
	    }
	    if (this.hasLeftChild()) {
	        this.getLeftChild().contarHojasRecursivo(contador);
	    }
	    if (this.hasRightChild()) {
	        this.getRightChild().contarHojasRecursivo(contador);
	    }
	}
	
	public BinaryTree <T> espejo(){
		BinaryTree <T> espejado = new BinaryTree <T> (this.getData());
		
		if(this.hasRightChild()){
			espejado.addLeftChild(this.getRightChild().espejo());
		}
		if(this.hasLeftChild()){
			espejado.addRightChild(this.getLeftChild().espejo());
		}
		return espejado;
	}
	
	public void entreNiveles(int n, int m){
		Queue<BinaryTree<T>> queue = new LinkedList<>();
		queue.add(this);
		int actualLevel = 0;
		
		while (!queue.isEmpty()) {
			if (actualLevel >= n && actualLevel <= m) {
				for (int i = 0; i < queue.size(); i++) {
					BinaryTree<T> node = queue.poll();
					System.out.println(node.getData() + " ");
					if (node.hasLeftChild()) queue.add(node.getLeftChild());
					if (node.hasRightChild()) queue.add(node.getRightChild());
				}
			} 
			actualLevel++;
		}
   }
}
