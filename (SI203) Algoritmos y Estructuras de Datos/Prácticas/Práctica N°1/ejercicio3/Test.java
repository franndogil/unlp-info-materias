package tp1.ejercicio3;

import java.util.Scanner;

public class Test {
	public static void main(String[] args) {
		Estudiante[] estudiantes = new Estudiante[2];
		Profesor[] profesores = new Profesor[3];
		
		Scanner s = new Scanner(System.in);
		
		for (int i=0; i<2; i++){
			estudiantes[i] = new Estudiante();
			estudiantes[i].setNombre(s.next());
			estudiantes[i].setApellido(s.next());
			estudiantes[i].setEmail(s.next());
			estudiantes[i].setComision(s.next());
			estudiantes[i].setDireccion(s.next());
		}
		
		for (int i=0; i<3 ;i++) {
			profesores[i]=new Profesor();
			profesores[i].setNombre(s.next());
			profesores[i].setApellido(s.next());
			profesores[i].setEmail(s.next());
			profesores[i].setCatedra(s.next());
			profesores[i].setFacultad(s.next());
		}
		
		for(int i=0; i<2; i++){
			System.out.println(estudiantes[i].tusDatos());
		}
		
		for(int i=0; i<3; i++) {
			System.out.println(profesores[i].tusDatos());
		}
	}
}
