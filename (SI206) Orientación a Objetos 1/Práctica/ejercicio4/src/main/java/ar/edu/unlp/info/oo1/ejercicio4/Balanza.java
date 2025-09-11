/*Tarea 1 
Mejorar la balanza para que recuerde los productos ingresados (los mantenga en una 
colección). Analice de qué forma puede realizarse este nuevo requerimiento e implemente 
el mensaje  

public List<Producto> getProductos() 

que retorna todos los productos ingresados a la balanza (en la compra actual, es decir, 
desde la última vez que se la puso a cero). 

● ¿Qué cambio produce este nuevo requerimiento en la implementación del mensaje 
ponerEnCero() ? 

	Ahora poner en cero solo deja vacia la lista

● ¿Es necesario, ahora, almacenar los totales en la balanza? ¿Se pueden obtener estos 
valores de otra forma? 

	No es necesario almacenar los totales en la balanza, los obtenemos directamente de los productos guardados

Tarea 2 
Con esta nueva funcionalidad, podemos enriquecer al Ticket, haciendo que él también 
conozca a los productos (a futuro podríamos imprimir el detalle). Ticket también debería 
entender el mensaje  public List<Producto> getProductos(). 

● ¿Qué cambios cree necesarios en Ticket para que pueda conocer a los productos?  

	Podriamos cambiar el constructor del ticket (pasandole la lista de productos) para que conozca a los productos

● ¿Estos cambios modifican las responsabilidades ya asignadas de realizar cálculo del 
precio total?. ¿El ticket adquiere nuevas responsabilidades que antes no tenía? 

	
Tarea 3 
Después de hacer estos cambios, ¿siguen pasando los tests? ¿Está bien que sea así?

	El unico test que no pasa es testEmitirTicket, si modifico los precios termina afectando
	a los tickets ya emitidos


*/


package ar.edu.unlp.info.oo1.ejercicio4;

import java.time.LocalDate;
import java.util.*;

public class Balanza {
	private List<Producto> productos;
	
	public Balanza() {
		this.productos = new LinkedList<Producto>();
	}
	
	public void ponerEnCero() {
		this.productos.clear();
	}
	
	public void agregarProducto(Producto producto) {
		this.productos.add(producto);
	}
	
	public Ticket emitirTicket() {
		Ticket ticket = new Ticket(LocalDate.now(), this.getProductos());
		return ticket;
	}
	
	public int getCantidadDeProductos() {
		return this.productos.size();
	}
	
	//uso de .map (API STREAM CHEATSHEETS CATEDRAS LINTI)
	
	public double getPesoTotal() {
		return productos.stream()
			.mapToDouble(productos -> productos.getPeso())
			.sum();
	}
	
	public double getPrecioTotal() {
		return productos.stream()
			.mapToDouble(productos-> productos.getPrecio())
			.sum();
	}
	
	public List<Producto> getProductos(){
		return this.productos;
	}
}
