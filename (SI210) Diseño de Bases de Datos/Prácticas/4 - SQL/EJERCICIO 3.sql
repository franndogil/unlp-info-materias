-- EJERCICIO 3
1.
SELECT DNI, nombre, apellido, direccion, email
FROM Integrante
WHERE (fecha_nacimiento BETWEEN '1980-01-01' AND '1990-12-31')
INTERSECT
SELECT inte.DNI, inte.nombre, inte.apellido, inte.direccion, inte.email
FROM Recital r
INNER JOIN Integrante inte ON (inte.codigoB = r.codigoB)
WHERE YEAR(r.fecha) = 2023

2.
--IDEA: 2023 - 2022
SELECT b.nombreBanda, b.genero_musical, b.anio_creacion
FROM Recital r
INNER JOIN Banda b ON (b.codigoB = r.codigoB)
WHERE YEAR(r.fecha) = 2023
EXCEPT
SELECT b.nombreBanda, b.genero_musical, b.anio_creacion
FROM Recital r
INNER JOIN Banda b ON (b.codigoB = r.codigoB)
WHERE YEAR(r.fecha) = 2022

3.
SELECT b.nombreBanda, r.fecha, r.hora, e.nombre_escenario, e.ubicacion
FROM Recital r
INNER JOIN Banda b ON (b.codigoB = r.codigoB)
INNER JOIN Escenario e ON (e.nroEscenario = r.nroEscenario)
WHERE r.fecha = '2023-12-14'

4.
SELECT inte.DNI, inte.nombre, inte.apellido, inte.email
FROM Recital r
INNER JOIN Escenario e ON (e.nroEscenario = r.nroEscenario)
INNER JOIN Integrante inte ON (inte.codigoB = r.codigoB)
WHERE e.nombre_escenario = 'Gustavo Cerati'
INTERSECT
SELECT inte.DNI, inte.nombre, inte.apellido, inte.email
FROM Recital r
INNER JOIN Escenario e ON (e.nroEscenario = r.nroEscenario)
INNER JOIN Integrante inte ON (inte.codigoB = r.codigoB)
WHERE e.nombre_escenario = 'Carlos Gardel'

5. 
SELECT b.nombreBanda, b.genero_musical, b.anio_creacion
FROM Banda b
INNER JOIN Integrante i ON (i.codigoB = b.codigoB)
GROUP BY b.codigoB, b.nombreBanda, b.genero_musical, b.anio_creacion
HAVING (COUNT(*) > 5)

6.
SELECT DISTINCT e.nombre_escenario, e.ubicacion, e.descripcion  -- DISTINCT para cuando no quiero escenarios duplicados
FROM Recital r
INNER JOIN Escenario e ON (e.nroEscenario = r.nroEscenario)
INNER JOIN Banda b ON (r.codigoB = b.codigoB)
WHERE b.genero_musical = 'Rock and Roll'
EXCEPT
SELECT e.nombre_escenario, e.ubicacion, e.descripcion
FROM Recital r
INNER JOIN Escenario e ON (e.nroEscenario = r.nroEscenario)
INNER JOIN Banda b ON (r.codigoB = b.codigoB)
WHERE b.genero_musical <> 'Rock and Roll'
ORDER BY e.nombre_escenario

7.
SELECT b.nombreBanda, b.genero_musical, b.anio_creacion
FROM Recital r
INNER JOIN Banda b ON (b.codigoB = r.codigoB)
INNER JOIN Escenario e ON (e.nroEscenario = r.nroEscenario)
WHERE (YEAR(r.fecha) = 2023 AND e.cubierto = true)

8.
SELECT e.nombre_escenario, COUNT(*) as cantRecitales --Contar como cantidad de recitales
FROM Recital r
INNER JOIN Escenario e ON (e.nroEscenario = r.nroEscenario)
WHERE (YEAR(r.fecha)=2024)
GROUP BY e.nroEscenario, e.nombre_escenario -- ES OBLIGATORIO AGRUPAR

9. --TEORIA UPDATE
--UPDATE Tabla SET atributo = 'Memphis la Blusera'
--WHERE (atributo = 'Mempis la Blusera')

UPDATE Banda SET nombreBanda = 'Memphis la Blusera'
WHERE (nombreBanda = 'Mempis la Blusera')