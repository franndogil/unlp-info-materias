/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;
public class Autor {
    private String nombre;
    private String bio;
    private String origen;
    
    /*config de setters*/
    
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    public void setBio(String unaBio){
        bio = unaBio;
    }
    
    public void setOrigen(String unOrigen){
        origen = unOrigen;
    }
    
    /*config de getters*/
    
    public String getNombre(){
        return nombre;
    }
    
    public String getBio(){
        return bio;
    }
    
    public String getOrigen(){
        return origen;
    }
    
    /*config de constructor*/
    
    public Autor (String unNombre, String unaBio, String unOrigen){
        nombre = unNombre;
        bio = unaBio;
        origen = unOrigen;
    }
    
    /*config de StringToString*/
    
    public String toString(){
    String aux;
    
    aux = nombre + " - " + bio + " - " + origen;
    return aux;
    }
}
