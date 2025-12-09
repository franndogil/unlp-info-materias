--Club = (codigoClub, nombre, anioFundacion, codigoCiudad(FK)) 
--Ciudad = (codigoCiudad, nombre) 
--Estadio = (codigoEstadio, codigoClub(FK), nombre, direccion) 
--Jugador = (DNI, nombre, apellido, edad, codigoCiudad(FK)) 
--ClubJugador = (codigoClub (FK), DNI (FK), desde, hasta)

1.
SELECT cl.nombre, cl.anioFundacion
FROM Club cl
INNER JOIN Ciudad ci ON (ci.codigoCiudad = cl.codigoCiudad)
WHERE ci.nombre = 'La Plata'
EXCEPT
SELECT cl.nombre, cl.anioFundacion
FROM Club cl
INNER JOIN Ciudad ci ON (ci.codigoCiudad = cl.codigoCiudad)
INNER JOIN Estadio es ON (es.codigoClub = cl.codigoCiudad)
WHERE ci.nombre = 'La Plata'

2.
SELECT cl.nombre
FROM ClubJugador cj 
INNER JOIN Club cl ON (cj.codigoClub = cl.codigoClub)
EXCEPT
SELECT cl.nombre
FROM ClubJugador cj 
INNER JOIN Club cl ON (cj.codigoClub = cl.codigoClub)
INNER JOIN Jugador j ON (j.dni = cj.dni)
INNER JOIN Ciudad ci ON (ci.codigoCiudad = j.codigoCiudad)
WHERE ci.nombre = 'Berisso'

3.
SELECT j.DNI, j.nombre, j.apellido
FROM ClubJugador cj
INNER JOIN Jugador j ON (j.DNI = cj.DNI)
INNER JOIN Club cl ON (cl.codigoClub = cj.codigoClub)
WHERE cl.nombre = 'Gimnasia y Esgrima La Plata'

4.
SELECT DNI, nombre, apellido
FROM Jugador j
WHERE edad > 29
INTERSECT
SELECT j.DNI, j.nombre, j.apellido
FROM ClubJugador cj
INNER JOIN Jugador j ON (j.DNI = cj.DNI)
INNER JOIN Club cl ON (cl.codigoClub = cj.codigoClub)
INNER JOIN Ciudad ci ON (ci.codigoCiudad = cl.codigoCiudad)
WHERE ci.nombre = 'Cordoba'

5.
SELECT cl.nombre, AVG(j.edad) as promedioEdad
FROM ClubJugador cj
INNER JOIN Jugador j ON (j.DNI = cj.DNI)
INNER JOIN Club cl ON (cl.codigoClub = cj.codigoClub)
WHERE (cj.desde <= CURRENT_DATE AND (cj.hasta IS NULL OR cj.hasta >= CURRENT_DATE))
GROUP BY cl.codigoClub, cl.nombre

6.
SELECT j.nombre, j.apellido, j.edad, COUNT (DISTINCT cj.codigoClub) as cantidadClubes
FROM Jugador j
LEFT JOIN ClubJugador cj ON (cj.DNI = j.DNI)
GROUP BY j.DNI, j.nombre, j.apellido, j.edad

7.
SELECT nombre
FROM Club
EXCEPT
SELECT cl.nombre
FROM Club cl
INNER JOIN ClubJugador cj ON (cj.codigoClub = cl.codigoClub)
INNER JOIN Jugador j ON (j.DNI = cj.DNI)
INNER JOIN Ciudad ci ON (ci.codigoCiudad = j.codigoCiudad)
WHERE ci.nombre = 'Mar del Plata'

8.
SELECT j.nombre, j.apellido
FROM Jugador j 
WHERE NOT EXISTS (
    SELECT *
    FROM Club cl
    INNER JOIN Ciudad ci ON (ci.codigoCiudad = cl.codigoCiudad)
    WHERE (ci.nombre = 'Cordoba' AND NOT EXISTS(
        SELECT *
        FROM ClubJugador cj
        WHERE (cj.dni = j.dni AND cl.codigoClub = cj.codigoClub)
    ))
)

9.
INSERT INTO Club (codigoClub, nombre, anioFundacion, codigoCiudad) 
VALUES (1234, 'Estrella de Berisso', 1921, (SELECT codigoCiudad FROM Ciudad WHERE nombre = 'Berisso'))