package tp3.ejercicio4;

public class AreaEmpresa {
	private String id;
	private Integer tardanza;
	
	AreaEmpresa(String id, int tardanza){
		this.id = id;
		this.tardanza = tardanza;
	}
	
	AreaEmpresa(){
		
	}
	
	public Integer getTardanza() {
		return tardanza;
	}
	
	public String getId() {
		return id;
	}
}
