package ar.edu.unlp.info.oo1.ejercicio5;

import java.time.LocalDate;

public class Main {
	public static void main(String[] args) {
		Inversor inv1 = new Inversor("Franco");
		Accion ac1 = new Accion("AeroArg", 200);
		InversionEnAccion iea1 = new InversionEnAccion("Aerolineas Argentinas", 100, ac1 );
		
		PlazoFijo pf1 = new PlazoFijo(LocalDate.now(), 2000, 5);
		
		inv1.agregarInversion(iea1);	//funciona
		inv1.agregarInversion(pf1);
		
		System.out.println(inv1.getValorActual());
		
		inv1.retirarInversion(pf1);		//funciona
		System.out.println(inv1.getValorActual());
	}
}

/*Espacio para contestar las tareas: 
1. Realice la lista de conceptos candidatos. Clasifique cada concepto dentro de las 
categorías vistas en la teoría. 

Lista final de conceptos:
Inversor
Inversión (abstracta)
Inversión en acción
Plazo fijo
Acción
Valor actual (atributo derivado)
Fecha de constitución (atributo de Plazo Fijo)
Monto depositado (atributo de Plazo Fijo)
Porcentaje de interés (atributo de Plazo Fijo)
Cantidad de acciones (atributo de Inversión en acción)
Valor unitario (atributo de Acción)
Nombre de acción (atributo de Acción)
Nombre de inversor (atributo de Inversor)

2. Grafique el modelo de dominio usando UML. 

 		  Inversion (abstracta)
           /                 \
InversionEnAccion         PlazoFijo
        |
      Accion

Inversor ---- posee ----> Inversion

3. Actualice el modelo de dominio incorporando los atributos a los conceptos 

Clase: Inversor
- nombre : String

Clase: Inversion (abstracta)
+ getValorActual() : double

Clase: InversionEnAccion
- nombre : String
- cantidad : int
- accion : Accion

Clase: Accion
- nombre : String
- valorUnitario : double

Clase: PlazoFijo
- fechaConstitucion : LocalDate
- montoDepositado : double
- interes : double

4. CHAT GPT NO TENIA GANAS DE HACERLO DESP LO REVISO

Agregue asociaciones entre conceptos, indicando para cada una de ellas la 
categoría a la que pertenece, de acuerdo a lo explicado en la teoría, y demás 
atributos, según sea necesario. 

Inversor – Inversion
Categoría: Contenedor de cosas (el inversor posee una cartera de inversiones).
Multiplicidad: 1 inversor → 0..* inversiones.

InversionEnAccion – Accion
Categoría: Especificación de una cosa (la inversión depende de una acción específica).
Multiplicidad: 1 inversión en acción → 1 acción.

Generalización/especialización
Inversion es superclase de InversionEnAccion y PlazoFijo.

 * */
