
package modelo.pkg1;


public class Modelo1 {


    public static void main(String[] args) {
        
        Lider nuevoLider = new Lider ("Franco Dogil", 1311, 55000, 300, "Assembly", 10, 1);
        
        Empresa nuevaEmpresa = new Empresa ("FMDCOMPUTACION", nuevoLider, 10);
        
        Programador nuevoProgramador = new Programador ("Ivan Aleksink", 1234, 10000, 1000, "pitón");
        nuevaEmpresa.agregarProgramador(nuevoProgramador);
        
        Programador nuevoProgramador2 = new Programador ("Ciro De Bruno", 9999, 100000, 800, "hola mundo");
        nuevaEmpresa.agregarProgramador(nuevoProgramador2);
        
        Programador nuevoProgramador3 = new Programador ("Sabrina Franco", 1234, 10000, 1000, "merca");
        nuevaEmpresa.agregarProgramador(nuevoProgramador3);
        
        System.out.println(nuevaEmpresa.toString());
        
        nuevaEmpresa.aumentarSueldos(10000);
        
        System.out.println(nuevaEmpresa.toString());
    }
    
}
