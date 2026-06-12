package tp1.ejercicio7;

import java.util.*;

public class Capicua {
	public static boolean esCapicua(List <Integer> lista){
		boolean ok = true;
		int i = 0;					//empieza en la primer pos
		int j = lista.size()-1;		//empieza en la ultima
		while(ok & (i < j)){		//cuando i supere a j supere la mitad del array
			 if(lista.get(i).equals(lista.get(j))) {
			 	i++;
			 	j--;
			 }
			 else {
				 ok = false;
			 }
		}
		return ok;
	}
}