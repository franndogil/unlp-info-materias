1.
SELECT DISTINCT en.nombreEntrenador, en.fechaNacimiento, en.direccion
FROM Entrenamiento ent
INNER JOIN Entrenador en ON (en.IdEntrenador = ent.IdEntrenador)
WHERE (YEAR(ent.fecha) = 2023)

2.
SELECT can.nombreCancha, COUNT(ent.IdEntrenamiento) as cantEntrenamientos
FROM Cancha can
LEFT JOIN Entrenamiento ent ON (ent.IdCancha = can.IdCancha AND YEAR(ent.fecha) = 2022)
WHERE can.IdComplejo IN (
    SELECT IdComplejo
    FROM Complejo
    WHERE nombreComplejo = 'Complejo 1'
)
GROUP BY can.IdCancha, can.nombreCancha

3.
SELECT DISTINCT com.nombreComplejo
FROM Entrenamiento ent
INNER JOIN Cancha can ON (can.IdCancha = ent.IdCancha)
INNER JOIN Complejo com ON (com.IdComplejo = can.IdComplejo)
INNER JOIN Entrenador en ON (en.IdEntrenador = ent.IdEntrenador)
WHERE en.nombreEntrenador = 'Jorge Gonzalez'
ORDER BY com.nombreComplejo ASC

4.
SELECT en.nombreEntrenador, en.fechaNacimiento, en.direccion
FROM Entrenamiento ent
INNER JOIN Entrenador en ON (en.IdEntrenador = ent.IdEntrenador)
INNER JOIN Cancha can ON (can.IdCancha = ent.IdCancha)
INNER JOIN Complejo com ON (com.IdComplejo = can.IdComplejo)
INNER JOIN Club cl ON (cl.IdClub = com.IdClub)
WHERE cl.nombreClub = 'Everton'
INTERSECT
SELECT en.nombreEntrenador, en.fechaNacimiento, en.direccion
FROM Entrenamiento ent
INNER JOIN Entrenador en ON (en.IdEntrenador = ent.IdEntrenador)
INNER JOIN Cancha can ON (can.IdCancha = ent.IdCancha)
INNER JOIN Complejo com ON (com.IdComplejo = can.IdComplejo)
INNER JOIN Club cl ON (cl.IdClub = com.IdClub)
WHERE cl.nombreClub = 'Estrella de Berisso'

5.
SELECT DISTINCT cl.nombreClub, cl.ciudad
FROM Entrenamiento ent
INNER JOIN Entrenador en ON (en.IdEntrenador = ent.IdEntrenador)
INNER JOIN Cancha can ON (can.IdCancha = ent.IdCancha)
INNER JOIN Complejo com ON (com.IdComplejo = can.IdComplejo)
INNER JOIN Club cl ON (cl.IdClub = com.IdClub)
WHERE en.nombreEntrenador = 'Marcos Perez'

6.
DELETE 
FROM Entrenamiento
WHERE IdEntrenador IN (
    SELECT IdEntrenador
    FROM Entrenador
    WHERE nombreEntrenador = 'Juan Perez'
)