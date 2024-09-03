program modelo3;
const
	max_cat=20;
type
	rango_cat=1..max_cat;
	
	categoria=record
		nombre:string;
		precio:real;
	end;
	
	vec_cat=array[rango_cat]of categoria;
	vec_com=array[rango_cat]of integer;
	
	compra=record
		dni:Integer;
		cate:rango_cat;
		cant:real;
	end;
	
	lista=^nodo;
	
	nodo=record
		dato:compra;
		sig:lista;
	end;

var
	compras:lista;
	categorias:vec_cat;
	cant_compras_por_cat:vec_com;
	dnimen, cant:integer;
	
begin
	compras:=nil;
	Inicializar_vector(cant_compras_por_cat);
	dnimen:=0;
	cant:=0;
	
	Cargar_categorias(categorias); 	//se dispone
end.
