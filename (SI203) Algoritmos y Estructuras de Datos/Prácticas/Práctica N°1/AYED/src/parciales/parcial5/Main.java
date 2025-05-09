package parciales.parcial5;
import parciales.parcial5.Parcial;
import tp3.ejercicio1.GeneralTree;

public class Main {
	public static void main(String[] args) {
		GeneralTree<Integer> root = new GeneralTree<>(-3);
	    GeneralTree<Integer> node1 = new GeneralTree<>(-7);
	    GeneralTree<Integer> node2 = new GeneralTree<>(5);
	    GeneralTree<Integer> node3 = new GeneralTree<>(1);
	    GeneralTree<Integer> node4 = new GeneralTree<>(2);
	    GeneralTree<Integer> node5 = new GeneralTree<>(6);
	    GeneralTree<Integer> node6 = new GeneralTree<>(11);
	    GeneralTree<Integer> node7 = new GeneralTree<>(-9);
	    GeneralTree<Integer> node8 = new GeneralTree<>(4);
	    GeneralTree<Integer> node9 = new GeneralTree<>(3);

	    // Construir el árbol
	    root.addChild(node1);
	    root.addChild(node2);
	    root.addChild(node3);

	    node1.addChild(node4);
	    node1.addChild(node5);

	    node5.addChild(node6);

	    node2.addChild(node7);

	    node7.addChild(node8);

	    node3.addChild(node9);

	    // Crear una instancia de Parcial y resolver
	    Parcial parcial = new Parcial();
	
	    // Imprimir el resultado
	    System.out.println("Resultado: " + parcial.resolver(root, 1, 11));
	}
}
