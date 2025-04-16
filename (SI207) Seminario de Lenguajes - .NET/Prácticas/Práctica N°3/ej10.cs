/*10) Verificar con un par de ejemplos si la sección opcional [:formatString] de formatos 
compuestos redondea o trunca cuando se formatean números reales restringiendo la cantidad de 
decimales. Plantear los ejemplos con cadenas de formato compuesto y con cadenas interpoladas.*/

double number1 = 3.45678;
double number2 = 7.89123;

// Formateo restringiendo a 2 decimales
string formatted1 = String.Format("{0:F2}", number1); // Resultado esperado: 3.46
string formatted2 = String.Format("{0:F2}", number2); // Resultado esperado: 7.89

Console.WriteLine($"Formato compuesto: {formatted1}, {formatted2}");

// Formateo restringiendo a 2 decimales
string interpolated1 = $"{number1:F2}"; // Resultado esperado: 3.46
string interpolated2 = $"{number2:F2}"; // Resultado esperado: 7.89

Console.WriteLine($"Interpolación de cadenas: {interpolated1}, {interpolated2}");

Console.ReadKey();