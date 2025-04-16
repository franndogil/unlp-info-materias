using teoria4;

List<Persona> personas = new List<Persona>();

Persona persona = new Persona();
Console.WriteLine("Ingrese el nombre de la persona: ");
persona.setNombre(Console.ReadLine());

while (persona.getNombre() != "ZZZ")
{
    Console.WriteLine("Ingrese el documento de la persona: ");
    persona.setDocumento(int.Parse(Console.ReadLine()));
    Console.WriteLine("Ingrese la edad de la persona: ");
    persona.setEdad(int.Parse(Console.ReadLine()));

    personas.Add(persona); // Agregar la persona a la lista

    persona = new Persona();
    Console.WriteLine("Ingrese el nombre de la persona: ");
    persona.setNombre(Console.ReadLine());
}

// Mostrar los datos de las personas registradas
    Console.WriteLine("Nro)  Nombre      Edad      DNI.");
    for (int i = 0; i < personas.Count; i++){
        Console.Write($"{i+1})    "); personas[i].Imprimir();
    }