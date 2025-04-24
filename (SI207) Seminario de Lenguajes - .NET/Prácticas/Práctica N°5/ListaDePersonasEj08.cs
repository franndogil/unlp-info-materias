using System;
using System.ComponentModel;

namespace teoria5;

class ListaDePersonas{
    private List<Persona> lista;
    private int cantPersonas;
    public ListaDePersonas(){
        lista = new List<Persona>();
        cantPersonas = 0;
    }

    public void Agregar(Persona p){
        lista.Add(p);
        cantPersonas++;
    }

    public Persona? this[int i]{        //indizador para retornar una persona especifica dentro de la lista de personas
        get{
            Boolean ok = true;
            for(int j=0; j<cantPersonas; j++){
                if((lista[j].DNI == i) && ok){
                    ok = false;
                    return lista[j];
                }
            }
            return null;
        }
    }

    public List<String> this[char c]{   //indizador para retornar una lista con los nombres que empiezan con la letra pasada
        get{
            List<String> listaNombres = new List<string>();
            for(int i=0; i<cantPersonas; i++){
                if(lista[i].Nombre[0] == c){
                    listaNombres.Add(lista[i].Nombre);
                }
            }
            return listaNombres;
        }
    }
}
