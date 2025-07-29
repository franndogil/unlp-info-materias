package com.mycompany.finalesobjetos.marzo2023;

public class Partido {
    private String fecha;
    private String lugar;
    private int [] resultado;
    private Tenista [] participantes;
    private boolean finalizo;
    
    public Partido(String fecha, String lugar, Tenista local, Tenista visitante){
        this.fecha = fecha;
        this.lugar = lugar;
        this.finalizo = false;
        this.resultado = new int [2];
        iniciarContador(this.resultado);
        this.participantes = new Tenista[2];
        participantes[0] = local;
        participantes[1] = visitante;
    }
    
    public Partido(String fecha, String lugar, Tenista localUno, Tenista localDos, Tenista visitanteUno, Tenista visitanteDos){
        this.fecha = fecha;
        this.lugar = lugar;
        this.finalizo = false;
        this.resultado = new int [2];
        iniciarContador(this.resultado);
        this.participantes = new Tenista[4];
        this.participantes[0] = localUno;
        this.participantes[1] = localDos;
        this.participantes[2] = visitanteUno;
        this.participantes[3] = visitanteDos;
    }
    
    public void otorgarPremios(double premio){
        if(resultado[0]>resultado[1]){  //gano local
            if(participantes.length == 2){  //simples
                participantes[0].setGanados();
                participantes[0].setPremios(premio);
            }else if(participantes.length == 4){    //dobles
                participantes[0].setGanados();
                participantes[0].setPremios(premio*((double) participantes[0].getGanados()/(participantes[0].getGanados()+participantes[1].getGanados())));
                participantes[1].setGanados();
                participantes[1].setPremios(premio*((double) participantes[1].getGanados()/(participantes[1].getGanados()+participantes[0].getGanados())));
            }
        }else if(resultado[0]<resultado[1]){    //gano visita
            if(participantes.length == 2){  //simples
                participantes[2].setGanados();
                participantes[2].setPremios(premio);
            }else if(participantes.length == 4){    //dobles
                participantes[2].setGanados();
                participantes[2].setPremios(premio*((double) participantes[2].getGanados()/(participantes[2].getGanados()+participantes[3].getGanados())));
                participantes[3].setGanados();
                participantes[3].setPremios(premio*((double) participantes[3].getGanados()/(participantes[3].getGanados()+participantes[2].getGanados())));
            }
        }
    }
    
    public boolean getEstado(){
        return this.finalizo;
    }
    
    private void iniciarContador(int[] resultado){
        for(int i=0; i<2; i++){
            this.resultado[i] = 0;
        }
    }
    
    public void setFinalizado(int puntosLocal, int puntosVisitante){
        if(!this.finalizo){
            if(puntosLocal > puntosVisitante){
                this.resultado[0]++;
                if(resultado[0] == 3){
                    this.finalizo = true;
                }
            }else if(puntosLocal < puntosVisitante){
                this.resultado[1]++;
                if(resultado[0] == 3){
                    this.finalizo = true;
                }
            }
        }else{
            System.out.println("El partido finalizo.");
        }
    }
}
