--Agencia = (razon_social, dirección, telef, email) 
--Ciudad = (codigo_postal, nombreCiudad, anioCreacion) 
--Cliente = (dni, nombre, apellido, telefono, direccion) 
--Viaje = (fecha, hora, dni (fk), cpOrigen(fk), cpDestino(fk), razon_social(fk), descripcion) //cpOrigen y 
--cpDestino corresponden a la ciudades origen y destino del viaje 

1.
SELECT ag.razon_social, ag.direccion, ag.telef
FROM Viaje v
INNER JOIN Ciudad ciu ON (ciu.codigo_postal = v.cpOrigen)
INNER JOIN Cliente cli ON (cli.dni = v.dni)
INNER JOIN Agencia ag ON (ag.razon_social = v.razon_social)
WHERE (ciu.nombreCiudad = 'La Plata' AND cli.apellido = 'Roma')
ORDER BY ag.razon_social, ag.telef

2.
SELECT v.fecha, v.hora, cli.dni, cli.nombre, cli.apellido, cli.telefono, cli.direccion ,cOrigen.nombreCiudad, cDestino.nombreCiudad 
FROM Viaje v
INNER JOIN Cliente cli ON (cli.dni = v.dni)
INNER JOIN Ciudad cOrigen ON (v.cpOrigen = cOrigen.codigo_postal)
INNER JOIN Ciudad cDestino ON (v.cpDestino = cDestino.codigo_postal)
WHERE (v.fecha BETWEEN '2019-01-01' AND '2019-01-31') AND v.descripcion LIKE '%demorado%'

3.
SELECT ag.razon_social, ag.direccion, ag.telef, ag.email
FROM Viaje v
INNER JOIN Agencia ag ON (v.razon_social = ag.razon_social)
WHERE (v.fecha BETWEEN '2019-01-01' AND '2019-12-31')
UNION
SELECT razon_social, direccion, telef, email
FROM Agencia ag
WHERE email LIKE '%@jmail.com'

4.
SELECT cli.dni, cli.nombre, cli.apellido, cli.telefono, cli.direccion
FROM Viaje v
INNER JOIN Cliente cli ON (cli.dni = v.dni)
INNER JOIN Ciudad cDestino ON (cDestino.codigo_postal = v.cpDestino)
WHERE cDestino.nombreCiudad = 'Coronel Brandsen'
EXCEPT
SELECT cli.dni, cli.nombre, cli.apellido, cli.telefono, cli.direccion
FROM Viaje v
INNER JOIN Cliente cli ON (cli.dni = v.dni)
INNER JOIN Ciudad cDestino ON (cDestino.codigo_postal = v.cpDestino)
WHERE cDestino.nombreCiudad <> 'Coronel Brandsen'

5.
SELECT COUNT(*) AS cantidadViajes
FROM Viaje v
INNER JOIN Agencia ag ON (ag.razon_social = v.razon_social)
INNER JOIN Ciudad ciu ON (ciu.codigo_postal = v.cpDestino)
WHERE (ag.razon_social = 'TAXI Y' AND ciu.nombreCiudad = 'Villa Elisa')
GROUP BY v.fecha, v.hora, v.dni

6. --REVISAR TEORIA URGENTE
SELECT cli.nombre, cli.apellido, cli.direccion, cli.telefono
FROM Cliente cli
WHERE (NOT EXISTS(
    SELECT *
    FROM Agencia ag
    WHERE (NOT EXISTS(

    ))
))

7.
UPDATE Cliente SET telefono = '221-4400897'
WHERE(dni = 38495444)

8.  --REVISAR TEORIA URGENTE
SELECT ag.razon_social, ag.direccion, ag.telef
FROM Viaje v
INNER JOIN Agencia ag ON (ag.razon_social = v.razon_social)
GROUP BY ag.razon_social, ag.direccion, ag.telef
HAVING COUNT(*)>=ALL(
    SELECT COUNT(*)
    FROM Viaje v
    GROUP BY v.razon_social
)

9.
SELECT cli.nombre, cli.apellido, cli.direccion, cli.telefono
FROM Viaje v
INNER JOIN Cliente cli ON (v.dni = cli.dni)
GROUP BY cli.dni, cli.nombre ,cli.apellido, cli.direccion, cli.telefono
HAVING COUNT (*) >= 5

10.
DELETE FROM Cliente WHERE (dni = 40325692)
DELETE FROM Viaje WHERE (dni = 40325692)