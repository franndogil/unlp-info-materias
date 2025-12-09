EJERCICIO 3
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