
package tema5;

public class ej04 {

    public static void main(String[] args) {
        Director nuevoDirector = new Director (10, "Franco Dogil", 4385, 22);
        
        /*coro por hileras*/
        
        Coro nuevoCoro = new Coro (nuevoDirector, "Los verguetas", 2, 2);
        
        Corista nuevoCorista = new Corista (5, "Sabrina Franco", 3333, 22);
        Corista nuevoCorista2 = new Corista (4, "Coni Dogil", 3333, 22);
        Corista nuevoCorista3 = new Corista (3, "Ivan Aleksink", 3333, 22);
        Corista nuevoCorista4 = new Corista (2, "Ciro De Bruno", 3333, 22);
        
        nuevoCoro.agregarCorista(nuevoCorista);
        nuevoCoro.agregarCorista(nuevoCorista2);
        nuevoCoro.agregarCorista(nuevoCorista3);
        nuevoCoro.agregarCorista(nuevoCorista4);
        
        System.out.println(nuevoCoro.getCoristas()[0][0].getNombre());
        System.out.println(nuevoCoro.getCoristas()[0][1].getNombre());
        System.out.println(nuevoCoro.getCoristas()[1][0].getNombre());
        System.out.println(nuevoCoro.getCoristas()[1][1].getNombre());
        
        System.out.println("Esta lleno?: " + nuevoCoro.lleno()); 
        System.out.println("Esta bien formado?: " + nuevoCoro.bienFormado());
        
        System.out.println("\n");
        System.out.println("IMPRESION DEL CORO POR HILERAS");
        System.out.println("\n");
        
        System.out.println(nuevoCoro.toString());
        
        /*coro semicircular*/
        System.out.println("\n");
        System.out.println("IMPRESION DEL CORO SEMICIRCULAR");
        System.out.println("\n");
        
        Coro nuevoCoro2 = new Coro(nuevoDirector, "Los mercenarios", 1, 4);
        
        Corista nuevoCorista5 = new Corista (2, "Sabrina Franco", 3333, 22);
        Corista nuevoCorista6 = new Corista (3, "Coni Dogil", 3333, 22);
        Corista nuevoCorista7 = new Corista (2, "Ivan Aleksink", 3333, 22);
        Corista nuevoCorista8 = new Corista (3, "Ciro De Bruno", 3333, 22);
        
        nuevoCoro2.agregarCorista(nuevoCorista5);
        nuevoCoro2.agregarCorista(nuevoCorista6);
        nuevoCoro2.agregarCorista(nuevoCorista7);
        nuevoCoro2.agregarCorista(nuevoCorista8);
        
        System.out.println(nuevoCoro2.toString());
        
        System.out.println("Esta lleno?: " + nuevoCoro2.lleno()); 
        System.out.println("Esta bien formado?: " + nuevoCoro2.bienFormado());
    }
    
}
