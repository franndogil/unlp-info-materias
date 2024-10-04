/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

public class Circulo {
    private double radio;
    private String colorR;
    private String colorL;
    
    /*constructor*/
    
    public Circulo(double radio, String colorR, String colorL){
        this.radio = radio;
        this.colorR = colorR;
        this.colorL = colorL;
    }
    
    /*getters*/
    
    public double getRadio(){
        return radio;
    }
    
    public String getColorRelleno(){
        return colorR;
    }
    
    public String getColorLinea(){
        return colorL;
    }
    
    /*setters*/
    
    public void setRadio(int radio){
        this.radio = radio;
    }
    
    public void setColorRelleno(String colorR){
        this.colorR = colorR;
    }
    
    public void setColorLinea(String colorL){
        this.colorL = colorL;
    }
    
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
}
