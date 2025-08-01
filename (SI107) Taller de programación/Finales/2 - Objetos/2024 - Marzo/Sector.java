
package finalesobjetos.marzo2024;

public class Sector {
    private String nombre;
    private Empleado jefe;
    private Empleado [] empleados;
    private Producto [] productos;
    private int maxProductos;
    private int actProductos;

    public Sector(String nombre, int maxProductos) {
        this.nombre = nombre;
        this.maxProductos = maxProductos;
        this.empleados = new Empleado [50];
        this.actProductos = 0;
        this.productos = new Producto [maxProductos];
    }
    
    public void agregarEmpleado(Empleado nuevoEmpleado, boolean esJefe){
        if(esJefe){
            this.jefe = nuevoEmpleado;
        } else{
            boolean ok = false;
            int i = 0;
            while((!ok)&&(i<50)){
                if(this.empleados[i] == null){
                    this.empleados[i] = nuevoEmpleado;
                    ok = true;
                    System.out.println("Empleado agregado correctamente!");
                }
                i++;
            }
            if(!ok){
                System.out.println("Total de empleados alcanzados!");
            }
        }
    }
    
    public void agregarProducto(Producto nuevoProducto){
        if(this.actProductos<this.maxProductos){
            this.productos[this.actProductos] = nuevoProducto;
            this.actProductos++;
            System.out.println("Producto agregado correctamente!");
        }else{
            System.out.println("Error: no hay espacio disponible para agregar el producto!");
        }
    }
    
    public double costoTotal(int etapa){
        boolean ok = false;
        double retorno = 0;
        int i = 0;
        
        while(!ok){
            if(productos[i].getEtapa() == etapa){
                retorno = productos[i].getCostoTotal();
                ok = true;
            }
            i++;
        }
        return retorno;
    }
    
    public void cambiarEtapa(int codigo, double costo){
        for(int i=0; i<this.actProductos; i++){
            if(productos[i] != null){
                if(productos[i].getCodigo() == codigo){
                    productos[i].pasarEtapa(costo);
                }
            }
        }
    }
    
    @Override
    
    public String toString(){
        String retorno = "";
        
        retorno += "Nombre del sector: " + this.nombre + ".\n";
        retorno += "Jefe: " + this.jefe.toString() + "\n";
        retorno += "Cantidad total de productos en la que se esta trabajando: " + this.actProductos + ".\n";
        
        double suma = 0;
        for(int i=0; i<this.actProductos; i++){
            if(this.productos[i].getEtapa() == 5){
                suma += this.productos[i].getCostoTotal();
            }
        }
        retorno += "Costo total de todos los productos finalizados: " + suma + ".\n";
        
        retorno += "Empleados: \n";
        for(int i=0; i<50; i++){
            if(this.empleados[i] != null){
                if(this.empleados[i].getAntiguedad() > 10){
                    retorno += empleados[i].toString() + "\n";
                }
            }
        }
        
        return retorno;
    }
    
}
