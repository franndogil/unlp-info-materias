/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;
public class Triangulo {
    
    private double primerLado = 0;
    private double segundoLado = 0;
    private double tercerLado = 0;
    private String colorRelleno;
    private String colorLinea;
    
    /*config de getters*/
    
    public double getPrimerLado(){
        return primerLado;
    }
    
    public double getSegundoLado(){
        return segundoLado;
    }
    
    public double getTercerLado(){
        return tercerLado;
    }
    
    public String getColorRelleno(){
        return colorRelleno;
    }
    
    public String getColorLinea(){
        return colorLinea;
    }
    
    /*config de setters*/
    
    public void setPrimerLado(double lado){
        primerLado = lado;
    }
    
    public void setSegundoLado(double lado){
        segundoLado = lado;
    }
    
    public void setTercerLado(double lado){
        tercerLado = lado;
    }
    
    public void setColorRelleno(String colRell){
        colorRelleno = colRell;
    }
    
    public void setColorLinea(String colLin){
        colorLinea = colLin;
    }
    
    /*config de constructor*/
    public Triangulo(double lado, double lado2, double lado3, String colRell, String colLin){
          primerLado = lado;
          segundoLado = lado2;
          tercerLado = lado3;
          colorRelleno = colRell;
          colorLinea = colLin;
    }
    
    public double calcularPerimetro(){
        double suma = 0;
        
        suma = primerLado + segundoLado + tercerLado;
        return suma;
    }
    
    public double calcularArea(){
        
        double s=0;
        
        s = (primerLado +  segundoLado + tercerLado)/2;
            
        double area = ( s * ( s - primerLado ) * ( s - segundoLado ) * ( s - tercerLado ) );
        
        area = Math.sqrt(area);
        return area;
    }
    
    
}
