/*12) Definir el tipo de datos enumerativo llamado Meses y utilizarlo para: 
a) Imprimir en la consola el nombre de cada uno de los meses en orden inverso (diciembre, 
noviembre, octubre …, enero)
 b) Solicitar al usuario que ingrese un texto y responder si el texto tipeado corresponde al nombre de 
un mes 
Nota: en todos los casos utilizar un for iterando sobre una variable de tipo Meses*/

string [] Meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};

//a)
for(int i=11; i>=0; i--){
    Console.WriteLine(Meses[i]);
}

//b)
Console.WriteLine("Ingrese un texto: ");
string str = Console.ReadLine();
Boolean ok = false;

for (int i=0; i<12; i++){
    if(str == Meses[i]){
        ok = true;
    }
}

if(ok){
    Console.WriteLine("El texto corresponde al nombre de un mes");
}
else{
    Console.WriteLine("El texto NO corresponde al nombre de un mes");
}

Console.ReadKey();