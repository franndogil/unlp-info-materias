/*
 5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
 encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
 valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
 nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
 partido sabe responder a los siguientes mensajes:
 getLocal()
 getVisitante()
 getGolesLocal()
 getGolesVisitante()
 setLocal(X) 
setVisitante(X)
 setGolesLocal(X)
 retorna el nombre (String) del equipo local
 retorna el nombre (String) del equipo visitante
 retorna la cantidad de goles (int) del equipo local
 retorna la cantidad de goles (int) del equipo visitante
 modifica el nombre del equipo local al “String” X
 modifica el nombre del equipo visitante al “String” X
 modifica la cantidad de goles del equipo local al “int” X
 setGolesVisitante(X) modificalacantidad de goles del equipo visitante al “int” X
 hayGanador()
 retorna un boolean que indica si hubo (true) o no hubo (false) ganador
 getGanador()
 hayEmpate()
 retorna el nombre (String) del ganador del partido (si no hubo retorna
 unString vacío).
 retorna un boolean que indica si hubo (true) o no hubo (false) empate
 Implemente un programa quecargue unvector con a lo sumo20partidosdisputados en
 el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
 nombredevisitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:- Para cada partido, armar e informar una representación String del estilo:
 {EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTEgolesVisitante }- Calcular e informar la cantidad de partidos que ganó River.- Calcular e informar el total de goles que realizó Boca jugando de local
 */
package tema2;

import PaqueteLectura.Lector;

public class Ej05Partido {
    public static void main(String[] args) {
        
        Partido [] vecPartidos = new Partido [20];
        
        int i=0;
        int golesLoc=0;
        int golesVis=0;
        
        System.out.println("Ingrese el nombre del equipo local: ");
        String local = Lector.leerString();
        System.out.println("Ingrese el nombre del equipo visitante: ");
        String visitante = Lector.leerString();
        if(!visitante.equals("ZZZ")){
            System.out.println("Ingrese los goles del equipo local: ");
            golesLoc = Lector.leerInt();
            System.out.println("Ingrese los goles del equipo visitante: ");
            golesVis = Lector.leerInt();
        }
        
        while((i<20)&&(!visitante.equals("ZZZ"))){
            vecPartidos[i] = new Partido (local, visitante, golesLoc, golesVis);
            
            i++;
            
            System.out.println("Ingrese el nombre del equipo local: ");
            local = Lector.leerString();
            System.out.println("Ingrese el nombre del equipo visitante: ");
            visitante = Lector.leerString();
            if(!visitante.equals("ZZZ")){
                System.out.println("Ingrese los goles del equipo local: ");
                golesLoc = Lector.leerInt();
                System.out.println("Ingrese los goles del equipo visitante: ");
                golesVis = Lector.leerInt();
            }
        }
        
        int aux = i;
        i=0;
        
        while (i<aux){
            System.out.println(vecPartidos[i].getLocal()+ " " + vecPartidos[i].getGolesLocal() + " VS " + vecPartidos[i].getVisitante() + " " + vecPartidos[i].getGolesVisitante());
            i++;
        }
        
        i=0;
        int cantGolesBoca=0;
        
        while (i<aux){
            if(vecPartidos[i].getLocal().equals("Boca")){
                cantGolesBoca = cantGolesBoca + vecPartidos[i].getGolesLocal();
            }
            i++;
        }
        System.out.println("Goles que realizó Boca jugando de local: " + cantGolesBoca);
        
        i=0;
        int cantPartidosRiver = 0;
        while (i<aux){
            if(vecPartidos[i].getGolesLocal()>vecPartidos[i].getGolesVisitante()){
                if(vecPartidos[i].getLocal().equals("River")){
                    cantPartidosRiver = cantPartidosRiver + 1;
                }
            }
            else{
                if(vecPartidos[i].getGolesVisitante()> vecPartidos[i].getGolesLocal()){
                    if(vecPartidos[i].getVisitante().equals("River")){
                        cantPartidosRiver = cantPartidosRiver + 1;
                    }
                }
            }
            
            i++;
        }
        
        System.out.println("Partidos que ganó River: " + cantPartidosRiver);
        
    }
    
}
