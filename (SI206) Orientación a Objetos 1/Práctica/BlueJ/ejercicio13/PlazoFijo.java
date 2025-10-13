import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class PlazoFijo extends Inversion{
	private LocalDate date;
	private double montoDepositado;
	private double interes;
	
	public PlazoFijo(LocalDate date, double montoDepositado, double interes) {
		this.date = date;
		this.montoDepositado = montoDepositado;
		this.interes = interes;
	}
	
	public double getValorActual() {	//todavia no funciona
		
		//primero debo calcular la cantidad de dias que pasaron
		long dias = ChronoUnit.DAYS.between(this.date, LocalDate.now());
		
		double interesTotal = montoDepositado * (interes / 100.0);
        double interesPorDia = interesTotal / 365.0;
        double interesAcumulado = interesPorDia * dias;

        return montoDepositado + interesAcumulado;
	}
}