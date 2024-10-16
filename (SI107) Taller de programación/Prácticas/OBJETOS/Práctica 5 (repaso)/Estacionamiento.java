
package tema5;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private Auto [][] autos;
    private int numPisos;
    private int numPlazas;

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = "08:00";
        this.horaCierre = "21:00";
        this.numPisos = 5;
        this.numPlazas = 10;
        this.autos = new Auto [this.numPisos][this.numPlazas];
    }

    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int numPisos, int numPlazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.numPisos = numPisos;
        this.numPlazas = numPlazas;
        this.autos = new Auto [this.numPisos][this.numPlazas];
    }

    public Auto[][] getAutos() {
        return autos;
    }

    public int getNumPisos() {
        return numPisos;
    }

    public int getNumPlazas() {
        return numPlazas;
    }
    
    
    
    
    
    /*metodos*/
    
    public void registrarAuto(Auto auto, int X, int Y){
        if(getAutos()[X-1][Y-1]==null){
            autos[X-1][Y-1] = auto;
            System.out.println("Su vehiculo pudo ser registrado!");
        }
        else{
            System.out.println("No hay espacio en el piso " + X + " plaza " + Y + "!");
        }
    }
    
    public String buscarPatente(String patente){
        String mensaje = "";
        boolean resultado = false;
        int posX = 0;
        int posY = 0;
        
        for (int i=0; i<getNumPisos(); i++){
            for (int j=0; j<getNumPlazas(); j++){
                if(getAutos()[i][j]!=null){
                    if(getAutos()[i][j].getPatente().equals(patente)){
                        resultado = true;
                        posX = i+1;
                        posY = j+1;
                    }
                }
            }
        }
        
        if(resultado == true){
            mensaje = "El vehiculo con la patente " + patente + " se encuentra estacionado en el piso: " + posX + " y en la plaza: " + posY;
        }
        else{
            mensaje = "Auto inexistente";
        }
        
        return mensaje;
    }
    
    @Override
    public String toString(){
        String aux="";
        
        for (int i=0; i<getNumPisos(); i++){
            for (int j=0; j<getNumPlazas(); j++){
                if(getAutos()[i][j]!=null){
                    aux += "Piso " + (i+1) + " Plaza " + (j+1) + ":" + getAutos()[i][j].getPatente() + "\n";
                }
                else{
                    aux += "Piso " + (i+1) + " Plaza " + (j+1) + ":" + "Libre" + "\n";
                }
            }
        }
        
        
        return aux;
    }
    
    public int cantidadAutos(int plaza){
        int cant=0;
        
        for (int i=0; i<getNumPisos(); i++){
            if(getAutos()[i][plaza-1]!=null){
                cant++;
            }
        }
        
        return cant;
    }
    
    
}
