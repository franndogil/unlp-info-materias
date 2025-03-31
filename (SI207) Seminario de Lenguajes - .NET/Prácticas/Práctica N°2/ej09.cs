/* 9) Investigar sobre el tipo DateTime y usarlo para medir el tiempo de ejecución de los algoritmos 
implementados en el ejercicio anterior.*/

/*DateTime: El DateTime tipo de valor representa fechas y horas con valores que van desde 00:00:00 (medianoche), 
1 de enero de 0001 Anno Domini (Era común) hasta 11:59:59 P.M., 31 de diciembre de 9999 A.D. (C.E.) en el calendario 
gregoriano.

Los valores de tiempo se miden en unidades de 100 nanosegundos denominadas tics. Una fecha concreta es el número de tics 
desde las 12:00 medianoche, 1 de enero de 0001 A.D. (C.E.) en el GregorianCalendar calendario. El número excluye los tics 
que se agregarían por segundos bisiesto. Por ejemplo, un valor de tics de 3124137600000000L representa la fecha viernes, 
01 de enero de 0100 12:00:00 medianoche. Un DateTime valor siempre se expresa en el contexto de un calendario explícito o 
predeterminado.



Fuente: Learn .NET Microsoft*/

/*EJEMPLOS*/
//Sin StringBuilder (591 milisegundos)

using System.Text;

DateTime dateOneStart= DateTime.Now;
string str1 = "Hola";
for (int i=0; i<100000; i++){
    str1 = str1 + "mundo";
}
DateTime dateOneEnd = DateTime.Now;
TimeSpan durationOne = dateOneEnd - dateOneStart;

Console.WriteLine("Tiempo del algoritmo en milisegundos: " + durationOne.Milliseconds);
Console.ReadKey();

//Con StringBuilder (13 milisegundos)

DateTime dateTwoStart = DateTime.Now;
Console.WriteLine(dateTwoStart);
StringBuilder str2 = new StringBuilder();
for (int i=0; i<100000; i++){
    str2.Append("Hola mundo");  //agregamos con APPEND
}
DateTime dateTwoEnd = DateTime.Now;
TimeSpan durationTwo = dateTwoEnd - dateTwoStart;

Console.WriteLine("Tiempo del algoritmo en milisegundos: " + durationTwo.Milliseconds);
Console.ReadKey();