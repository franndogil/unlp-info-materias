using System.Collections;

IEnumerable rango = Rango(6, 30, 3);
IEnumerable potencias = Potencias(2, 10);
IEnumerable divisibles = DivisiblesPor(rango, 6);

foreach (int i in rango)
{
    Console.Write(i + " ");
}
Console.WriteLine();

foreach (int i in potencias)
{
    Console.Write(i + " ");
}
Console.WriteLine();

foreach (int i in divisibles)
  {
      Console.Write(i + " ");
  }
  Console.WriteLine();

//

IEnumerable Rango(int a, int b, int c)
{
    int i = a;
    yield return a;
    while (i < b)
    {
        i += c;
        yield return i;
    }
}

IEnumerable Potencias(int a, int b)
{
    int c = 1;
    for (int i = 0; i < b; i++)
    {
        c = c * a;
        yield return c;
    }
}

IEnumerable DivisiblesPor(IEnumerable rango, int a)
{
    foreach (int r in rango)
    {
        if (r % a == 0)
        {
            yield return r;
        }
    }
}