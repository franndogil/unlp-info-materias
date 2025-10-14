package ar.edu.unlp.info.oo1.ejercicio14;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ReporteDeConstruccionTest {
	ReporteDeConstruccion reporte;
	PrismaRectangular prisma;
	Cilindro cilindro;
	Esfera esfera;
	
	void inicializar() {
		this.reporte = new ReporteDeConstruccion();
		this.cilindro = new Cilindro(10, 2, "Metal", "Rojo");
		this.esfera = new Esfera(2, "Metal", "Azul");
		this.prisma = new PrismaRectangular(2, 2, 10, "Madera", "Azul");
		
		this.reporte.agregarPieza(cilindro);
		this.reporte.agregarPieza(esfera);
		this.reporte.agregarPieza(prisma);
	}
	
	@BeforeEach
	void setUp() {
		this.inicializar();
	}
	
	@Test
	void volumenDeMaterialTest() {
		int decimales = 2;
		double factor = Math.pow(10, decimales);
		double truncado = Math.floor(this.reporte.volumenDeMaterial("Metal") * factor) / factor; 
		
		assertEquals(159.17 , truncado);
	}
	
	@Test
	void superficieDeColorTest() {
		int decimales = 2;
		double factor = Math.pow(10, decimales);
		double truncado = Math.floor(this.reporte.superficieDeColor("Azul") * factor) / factor; 
		
		assertEquals(138.26, truncado);
	}
}
