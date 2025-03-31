/*Escribir un programa que lea dos palabras separadas por un blanco que terminan con <ENTER>, y
determinar si son simétricas (Ej: 'abbccd' y 'dccbba' son simétricas).
Tip: si st es un string, entonces st[0] devuelve el primer carácter de st, y st[st.Length-1]
114 devuelve el último carácter de st.*/

string st1 = Console.ReadLine();
if(st1[0] == st1[st1.Length-1]){
    Console.WriteLine("Son simétricas");
}
else{
    Console.WriteLine("No son simétricas");
}
