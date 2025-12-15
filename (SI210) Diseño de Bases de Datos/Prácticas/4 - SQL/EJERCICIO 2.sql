1.
SELECT ar.especie, ar.anios, ar.calle, ar.nro, loc.nombreL
FROM Poda p
INNER JOIN Arbol ar ON (ar.nroArbol = p.nroArbol)
INNER JOIN Localidad loc ON (loc.codigoPostal = ar.codigoPostal)
WHERE p.DNI IN (
    SELECT DNI
    FROM Podador
    WHERE (nombre = 'Juan' AND apellido = 'Perez')
)
INTERSECT
SELECT ar.especie, ar.anios, ar.calle, ar.nro, loc.nombreL
FROM Poda p
INNER JOIN Arbol ar ON (ar.nroArbol = p.nroArbol)
INNER JOIN Localidad loc ON (loc.codigoPostal = ar.codigoPostal)
WHERE p.DNI IN (
    SELECT DNI
    FROM Podador
    WHERE (nombre = 'Jose' AND apellido = 'Garcia')
)

2.
SELECT DISTINCT pod.DNI, pod.nombre, pod.apellido, pod.fnac, loc.nombreL
FROM Poda p
INNER JOIN Podador pod ON (pod.DNI = p.DNI)
INNER JOIN Localidad loc ON (loc.codigoPostal = pod.codigoPostalVive)
WHERE YEAR (p.fecha) = 2023

3.
SELECT ar.especie, ar.anios, ar.calle, ar.nro, loc.nombreL
FROM Arbol ar
INNER JOIN Localidad loc ON (loc.codigoPostal = ar.codigoPostal)
WHERE NOT EXISTS (
    SELECT 1
    FROM Poda p
    WHERE p.nroArbol = ar.nroArbol
)

4.
SELECT ar.especie, ar.anios, ar.calle, ar.nro, loc.nombreL
FROM Poda p
INNER JOIN Arbol ar ON (ar.nroArbol = p.nroArbol)
INNER JOIN Localidad loc ON (loc.codigoPostal = ar.codigoPostal)
WHERE YEAR(p.fecha) = 2022
EXCEPT
SELECT ar.especie, ar.anios, ar.calle, ar.nro, loc.nombreL
FROM Poda p
INNER JOIN Arbol ar ON (ar.nroArbol = p.nroArbol)
INNER JOIN Localidad loc ON (loc.codigoPostal = ar.codigoPostal)
WHERE YEAR(p.fecha) = 2023

5.
SELECT DISTINCT pod.DNI, pod.nombre, pod.apellido, pod.fnac, loc.nombreL
FROM Poda p
INNER JOIN Podador pod ON (pod.DNI = p.DNI)
INNER JOIN Localidad loc ON (loc.codigoPostal = pod.codigoPostalVive)
WHERE (YEAR(p.fecha) = 2024 AND pod.apellido LIKE '%ata')
ORDER BY pod.apellido, pod.nombre

6.
SELECT DISTINCT pod.DNI, pod.apellido, pod.nombre, pod.telefono, pod.fnac
FROM Poda p
INNER JOIN Podador pod ON (pod.DNI = p.DNI)
INNER JOIN Arbol ar ON (ar.nroArbol = p.nroArbol)
WHERE ar.especie = 'Coniferas'
EXCEPT
SELECT DISTINCT pod.DNI, pod.apellido, pod.nombre, pod.telefono, pod.fnac
FROM Poda p
INNER JOIN Podador pod ON (pod.DNI = p.DNI)
INNER JOIN Arbol ar ON (ar.nroArbol = p.nroArbol)
WHERE ar.especie <> 'Coniferas'

7.
SELECT ar.especie
FROM Arbol ar
INNER JOIN Localidad loc ON (loc.codigoPostal = ar.codigoPostal)
WHERE loc.nombreL = 'La Plata'
INTERSECT
SELECT ar.especie
FROM Arbol ar
INNER JOIN Localidad loc ON (loc.codigoPostal = ar.codigoPostal)
WHERE loc.nombreL = 'Salta'

8.
DELETE
FROM Poda
WHERE DNI = 22234566

DELETE
FROM Podador
WHERE DNI = 22234566

9.
SELECT loc.nombreL, loc.descripcion, loc.nroHabitantes
FROM Localidad loc
LEFT JOIN Arbol ar ON (ar.codigoPostal = loc.codigoPostal)
GROUP BY loc.nombreL, loc.descripcion, loc.nroHabitantes
HAVING (COUNT(DISTINCT ar.nroArbol) < 5)