/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author Leonardo
 */
public class Circulo extends Figura {
    private double radio;
    
    /*constructor*/
    
    public Circulo(double radio, String colorR, String colorL){
        super(colorR, colorL);
        this.radio = radio;
    }
    
    /*setters*/
    
    public void setRadio(double radio){
        this.radio = radio;
    }
    
    /*getters*/
    
    public double getRadio(){
        return radio;
    }
    
    /*metodos*/
    
    public double calcularPerimetro(){
        double perimetro;
        perimetro = radio * 2 * 3.14;
        return perimetro;
    }
    
    public double calcularArea(){
    double area;
    area = 3.14 * radio * radio;
    return area;
    }
    
    /*toString*/
    
    @Override
    public String toString(){
        String aux;
        
        aux = "Radio: " + radio + super.toString();
        
        return aux;
    }
    
}
