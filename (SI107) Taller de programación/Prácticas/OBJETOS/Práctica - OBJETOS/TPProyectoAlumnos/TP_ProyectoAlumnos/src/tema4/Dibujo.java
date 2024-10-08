
package tema4;
public class Dibujo {
    private Figura [] figuras;
    private String titulo;
    
    /*constructor*/
    public Dibujo(String titulo, Figura [] cantidad){
        setTitulo(titulo);
        setFiguras(figuras);
    }
    
    /*setters*/
    public void setTitulo(String titulo){
        this.titulo = titulo;
    }
    
    public void setFiguras(Figura [] figuras){
        this.figuras = figuras;
    }
    
    /*getters*/
    public String getTitulo(){
        return titulo;
    }
    
    public Figura [] getFiguras(){
        return figuras;
    }
    
    /*metodos*/
    
    
    /*toString*/
}
