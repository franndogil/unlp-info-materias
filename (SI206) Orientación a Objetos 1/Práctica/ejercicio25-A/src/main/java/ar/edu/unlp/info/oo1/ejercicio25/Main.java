package ar.edu.unlp.info.oo1.ejercicio25;
import java.util.*;

//VER LOS JUNIT TEST (ARRANQUE POR ACA XQ ESTABA EN OTRA XDDDDD)

public class Main {
	public static void main(String[] args) {
	
	//a
		
		Map<String, Integer> map = new HashMap<>();
		
		//Put agrega o reemplaza
		
		map.put("Lionel Messi", 111);
		map.put("Gabriel Batistuta", 56);
		map.put("Kun Aguero", 42);
		System.out.println("Cantidad de tuplas: " + map.size());
		
		System.out.println("Goles de Messi: " + map.get("Lionel Messi"));
		
	//b
		
		map.remove("Kun Aguero");
		System.out.println("Cantidad de tuplas: " + map.size());
		
	//c
		
		map.replace("Lionel Messi", 112);
		System.out.println();
		System.out.println("Actualizacion goles de Messi: " + map.get("Lionel Messi"));
		
	//d
		
		map.put("Gabriel Batistuta", 56);
		System.out.println("Cantidad de tuplas: " + map.size());
		
	//e
		int goles = 0;
		for(int gol : map.values()) {
			goles += gol;
		}
		
		System.out.println("Cantidad de goles: " + goles);
	}
}
