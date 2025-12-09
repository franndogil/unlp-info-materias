1.
SELECT DISTINCT i.DNI, i.nombre, i.apellido, i.email
FROM Inscripcion ins
INNER JOIN Equipo eq ON (eq.codigoE = ins.codigoE)
INNER JOIN Integrante i ON (i.codigoE = eq.codigoE)
INNER JOIN TorneoPesca tp ON (tp.codTorneo = ins.codTorneo)
WHERE (YEAR(tp.fecha) = 2023 AND i.ciudad = 'La Plata')

2.
IDEA: EQUIPOS 202O - TODOS LOS EQUIPOS
SELECT DISTINCT eq.nombreE, eq.descripcionE
FROM Inscripcion ins
INNER JOIN Equipo eq ON (eq.codigoE = ins.codigoE)
INNER JOIN TorneoPesca tp ON (tp.codTorneo = ins.codTorneo)
WHERE YEAR (tp.fecha) = 2020
AND eq.codigoE NOT IN (
    SELECT ins2.codigoE
    FROM Inscripcion ins2
    INNER JOIN TorneoPesca tp2 ON (tp2.codTorneo = ins2.codTorneo)
    WHERE YEAR (tp2.fecha) <> 2020
)

3.
SELECT DISTINCT i.DNI, i.nombre, i.apellido, i.email, i.ciudad
FROM Inscripcion ins
INNER JOIN Equipo eq ON (eq.codigoE = ins.codigoE)
INNER JOIN Integrante i ON (i.codigoE = eq.codigoE)
INNER JOIN TorneoPesca tp ON (tp.codTorneo = ins.codTorneo)
INNER JOIN Laguna lag ON (lag.nroLaguna = tp.nroLaguna)
WHERE (ins.asistio = TRUE AND lag.nombreL = 'La Salada, Coronel Granada' AND eq.codigoE NOT IN(
    SELECT ins2.codigoE
    FROM Inscripcion ins2
    INNER JOIN TorneoPesca tp2 ON (tp2.codTorneo = ins2.codTorneo)
    WHERE (YEAR (tp2.fecha) = 2023)
))

4.
SELECT eq.nombreE, eq.descripcionE
FROM Equipo eq
INNER JOIN Integrante i ON (i.codigoE = eq.codigoE)
GROUP BY eq.codigoE, eq.nombre, eq.descripcionE
HAVING (COUNT(*) >= 5)
ORDER BY eq.nombre

5.--revisar
SELECT nombreE, descripcionE
FROM Equipo
WHERE NOT EXISTS (
    SELECT *
    FROM Inscripcion ins
    WHERE NOT EXISTS(
        SELECT *
        FROM TorneoPesca
    )
)

6.
DELETE FROM Inscripcion WHERE codigoE = 10000 
DELETE FROM Equipo WHERE codigoE = 10000

7.
SELECT nombreL, ubicacion, extension, descripcion
FROM Laguna
EXCEPT
SELECT l.nombreL, l.ubicacion, l.extension, l.descripcion
FROM TorneoPesca tp
INNER JOIN Laguna l ON (l.nroLaguna = tp.nroLaguna)

8.--IDEA: EQUIVOS 2024 EXCEPT EQUIPOS 2023

SELECT DISTINCT e.nombreE, e.descripcionE
FROM Inscripcion ins
INNER JOIN Equipo e ON (e.codigoE = ins.codigoE)
INNER JOIN TorneoPesca tp ON (tp.codTorneo = ins.codTorneo)
WHERE YEAR(tp.fecha) = 2024
EXCEPT
SELECT DISTINCT e.nombreE, e.descripcionE
FROM Inscripcion ins
INNER JOIN Equipo e ON (e.codigoE = ins.codigoE)
INNER JOIN TorneoPesca tp ON (tp.codTorneo = ins.codTorneo)
WHERE YEAR(tp.fecha) = 2023

9.
SELECT DISTINCT i.DNI, i.nombre, i.apellido, i.ciudad, i.email
FROM Inscripcion ins
INNER JOIN Integrante i ON (i.codigoE = ins.codigoE)
INNER JOIN TorneoPesca tp ON (tp.codTorneo = ins.codTorneo)
INNER JOIN Laguna l ON (l.nroLaguna = tp.nroLaguna)
WHERE (l.nombreL = 'Laguna de Chascomus' AND ins.gano = TRUE)