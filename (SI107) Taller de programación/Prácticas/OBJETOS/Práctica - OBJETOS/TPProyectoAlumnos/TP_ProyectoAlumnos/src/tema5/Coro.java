
package tema5;

public class Coro {
    private String nombre;
    private Director director;
    private Corista [][] coristas;
    private int cantFilas;
    private int cantColumnas;
    private int filaAct=0;
    private int columnaAct=0;
    private int cantCoristas=0;
    private int cantCoristasEsperados;

    public Coro(Director director, String nombre, int cantFilas, int cantColumnas) {
        this.nombre = nombre;
        this.director = director;
        this.cantFilas = cantFilas;
        this.cantColumnas = cantColumnas;
        this.coristas = new Corista [this.cantFilas][this.cantColumnas];
        this.cantCoristasEsperados = this.cantFilas * this.cantColumnas;
    }

    public int getCantFilas() {
        return cantFilas;
    }

    public int getCantColumnas() {
        return cantColumnas;
    }

    public Director getDirector() {
        return director;
    }

    public Corista[][] getCoristas() {
        return coristas;
    }

    public int getFilaAct() {
        return filaAct;
    }

    public int getColumnaAct() {
        return columnaAct;
    }

    public void setFilaAct(int filaAct) {
        this.filaAct = filaAct;
    }

    public void setColumnaAct(int columnaAct) {
        this.columnaAct = columnaAct;
    }

    public int getCantCoristas() {
        return cantCoristas;
    }

    public int getCantCoristasEsperados() {
        return cantCoristasEsperados;
    }

    public void setCantCoristas(int cantCoristas) {
        this.cantCoristas = cantCoristas;
    }
    
    public void agregarCorista(Corista nuevoCorista){
        if(getFilaAct()<getCantFilas()){
            if(getColumnaAct()<getCantColumnas()){
                coristas[getFilaAct()][getColumnaAct()] = nuevoCorista;
                setColumnaAct(getColumnaAct()+1);
                setCantCoristas(getCantCoristas()+1);
                
            }
            if(getColumnaAct()==getCantColumnas()){
                setColumnaAct(0);
                setFilaAct(getFilaAct()+1);
            }
        }
    }
    
    public boolean lleno(){
        boolean aux=false;
            if(getCantCoristas()==getCantCoristasEsperados()){
                aux=true;
            }
        return aux;
    }
    public boolean bienFormado(){
        boolean aux=false;
        int iant=0;
        int jant=0;
        int contador=0;
        int anterior = coristas[iant][jant].getTonoFundamental();
        for (int i=0; i<getCantFilas(); i++){
            for (int j=0; j<getCantColumnas(); j++){
                if(coristas[i][j].getTonoFundamental()<=anterior){
                    contador++;
                    anterior = coristas [i][j].getTonoFundamental();
                }
                iant = i;
                jant = j;
            }
        }
        
        if(contador == getCantCoristasEsperados()){
            aux = true;
        }
        else{
            aux=false;
        }
        
        
        
        return aux;
    }

    public String getNombre() {
        return nombre;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = "Nombre del coro: " + getNombre() + " \n Nombre del director: " + getDirector().getNombre() + " Edad: " + getDirector().getEdad() + " DNI: " + getDirector().getDni();
        for(int i=0; i<getCantFilas(); i++){
            aux += "\n";
            for(int j=0; j<getCantColumnas(); j++){
                aux +="  Nombre del corista: " + getCoristas()[i][j].getNombre() + ", Edad: " + getCoristas()[i][j].getEdad() + ", DNI: " + getCoristas()[i][j].getDni();
            }
        }
        return aux;
    }
    
}
