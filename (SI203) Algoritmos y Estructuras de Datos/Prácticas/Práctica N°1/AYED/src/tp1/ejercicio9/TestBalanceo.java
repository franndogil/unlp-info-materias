package tp1.ejercicio9;

import java.util.*;

public class TestBalanceo {
	private static boolean balanceo(String str){
		Stack <Character> pila = new Stack<Character>();
		boolean ok = true;
	
		if(str.length() % 2 == 1) return false;	//si el resto me da 1, ya se que me va a faltar uno de apertura o de cierre
		
		List<Character> openChar = new LinkedList<>();
		openChar.add('(');
		openChar.add('{');
		openChar.add('[');
		
		List<Character> closeChar = new LinkedList<>();
		closeChar.add(')');
		closeChar.add('}');
		closeChar.add(']');
		
		for (char ch : str.toCharArray()) {
			if(openChar.contains(ch)) {		//si el ch actual contiene algun caracter de apertura
				pila.push(ch);	//pusheamos el caracter de apertura
			}else if(closeChar.contains(ch)) {
				if(pila.isEmpty()) { 
					ok = false;
				}
				
				char top = pila.pop();
				
				if(closeChar.get(openChar.indexOf(ch)) != top) {
					return false;
				}
				}
			}
		return ok;
	}
}