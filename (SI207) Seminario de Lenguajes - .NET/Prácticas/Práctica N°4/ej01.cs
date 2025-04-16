using teoria4;

List<Persona> personas = new List<Persona>();

Persona persona = new Persona();
Console.WriteLine("Ingrese el nombre de la persona: ");
persona.nombre = Console.ReadLine();

while (persona.nombre != "ZZZ")
{
    Console.WriteLine("Ingrese el documento de la persona: ");
    persona.documento = int.Parse(Console.ReadLine());
    Console.WriteLine("Ingrese la edad de la persona: ");
    persona.edad = int.Parse(Console.ReadLine());

    personas.Add(persona); // Agregar la persona a la lista

    persona = new Persona();
    Console.WriteLine("Ingrese el nombre de la persona: ");
    persona.nombre = Console.ReadLine();
}

// Mostrar los datos de las personas registradas
Console.WriteLine("Nro)  Nombre       Edad      DNI.");
for (int i = 0; i < personas.Count; i++)
{
    Console.WriteLine($"{i+1}) {personas[i].nombre, -15} {personas[i].edad, -10} {personas[i].documento, -10}");
}