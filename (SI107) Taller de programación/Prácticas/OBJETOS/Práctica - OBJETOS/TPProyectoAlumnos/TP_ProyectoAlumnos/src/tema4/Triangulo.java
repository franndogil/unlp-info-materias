
package tema4;
public class Triangulo extends Figura{
    private double primerLado;
    private double segundoLado;
    private double tercerLado;
    
    public Triangulo (double primerLado, double segundoLado, double tercerLado, String unColorR, String unColorL){
        super(unColorR, unColorL);
        setLadoUno(primerLado);
        setLadoDos(segundoLado);
        setLadoTres(tercerLado);
    }
    
    /*setters*/
    
    public void setLadoUno(double primerLado){
        this.primerLado = primerLado;
    }
    
    public void setLadoDos(double segundoLado){
        this.segundoLado = segundoLado;
    }
    
    public void setLadoTres(double tercerLado){
        this.tercerLado = tercerLado;
    }
    
    /*getters*/
    
    public double getLadoUno(){
        return primerLado;
    }
    
    public double getLadoDos(){
        return segundoLado;
    }
    
    public double getLadoTres(){
        return tercerLado;
    }
    
    public String toString(){
        String aux="";
        
        aux = "Lado 1: " + getLadoUno() + " Lado 2: " + getLadoDos() + " Lado 3: " + getLadoTres() + " " + super.toString();
        
        return aux;
    }
    
    /*metodos*/
    
    public double calcularPerimetro(){
        return (getLadoUno()+getLadoDos()+getLadoTres());
    }
    
    public double calcularArea(){
        double s;
        
        s = (getLadoUno() +  getLadoDos() + getLadoTres())/2;
            
        double area = ( s * ( s - getLadoUno() ) * ( s - getLadoDos() ) * ( s - getLadoTres()));
        
        area = Math.sqrt(area);
        return area;
    }
}
