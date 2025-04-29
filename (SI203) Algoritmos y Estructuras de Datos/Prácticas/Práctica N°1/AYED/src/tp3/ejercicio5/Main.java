package tp3.ejercicio5;

import tp3.ejercicio1.*;

/*    	 A
       /   \
      B     C
     / \   /
    D   E F
*/

public class Main {
	public static void main(String[] args) {
		GeneralTree<String> arbolPrincipal = new GeneralTree<>("A");
		GeneralTree<String> hijo1 = new GeneralTree<>("B");
		GeneralTree<String> hijo2 = new GeneralTree<>("C");
		GeneralTree<String> nieto1 = new GeneralTree<>("D");
		GeneralTree<String> nieto2 = new GeneralTree<>("E");

		hijo1.addChild(nieto1);
		hijo1.addChild(nieto2);
		arbolPrincipal.addChild(hijo1);
		arbolPrincipal.addChild(hijo2);

		System.out.println(arbolPrincipal.esAncestro("A", "A")); // true
	}
}
