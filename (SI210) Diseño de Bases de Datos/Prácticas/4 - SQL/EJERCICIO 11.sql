1.
SELECT vet.matricula, vet.CUIT, vet.nombYAp, vet.direccion, vet.telefono, COUNT (*) as cantSupervisiones
FROM Veterinario vet
INNER JOIN Supervision sup ON (sup.matricula = vet.matricula)
WHERE sup.fechaSale BETWEEN '2024-01-01' AND '2024-01-31' 
GROUP BY vet.matricula, vet.CUIT, vet.nombYAp, vet.direccion, vet.telefono

2.
SELECT vet.matricula, vet.CUIT, vet.nombYAp, vet.direccion, vet.telefono
FROM Veterinario vet
EXCEPT
SELECT vet.matricula, vet.CUIT, vet.nombYAp, vet.direccion, vet.telefono
FROM Veterinario vet
INNER JOIN Supervision sup ON (sup.matricula = vet.matricula)
WHERE sup.fechaSale IS NULL

3.
SELECT DISTINCT mas.nombre, mas.edad, mas.raza, mas.peso, mas.telefonoContacto
FROM Supervision sup
INNER JOIN Mascota mas ON (mas.codMascota = sup.codMascota)
INNER JOIN Veterinario vet ON (vet.matricula = sup.matricula)
WHERE vet.nombYAp = 'Oscar Lopez'
ORDER BY mas.nombre, mas.raza ASC

4.
UPDATE Veterinario 
SET nombYAp = 'Pablo Lopez'
WHERE matricula = 'MP 10000'

5.--CORREGIDO POR CHATGPT
SELECT mas.nombre, mas.edad, mas.raza, mas.peso
FROM Mascota mas
WHERE mas.codMascota IN (
    SELECT sup.codMascota
    FROM Supervision sup
    WHERE sup.matricula = 'MP 1000'
    INTERSECT
    SELECT sup.codMascota
    FROM Supervision sup
    WHERE sup.matricula = 'MN 4545'
)

6.
SELECT b.nroBox, b.m2, b.ubicacion, b.capacidad, mas.nombre
FROM Supervision sup
INNER JOIN Mascota mas ON (mas.codMascota = sup.codMascota)
INNER JOIN Box b ON (b.nroBox = sup.nroBox)
WHERE YEAR(sup.fechaEntra) = 2024