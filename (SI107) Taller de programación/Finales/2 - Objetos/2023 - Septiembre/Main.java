package finalesobjetos.septiembre2023;

public class Main {
    public static void main(String[] args) {
        InformeAnual informeAnual = new InformeAnual("Quilmes", 10, 10, 3);
        
//        informeAnual.registrarTodasLasTemperaturas();
        System.out.println(informeAnual.informe());
        System.out.println(informeAnual.mayorTemperaturaRegistrada());
        
        InformeMensual informeMensual = new InformeMensual("La Plata", 100, 300, 4);
        
        informeMensual.registrarTodasLasTemperaturas();
        System.out.println(informeMensual.informe());
        System.out.println(informeMensual.mayorTemperaturaRegistrada());
    }
}
