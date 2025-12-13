1.
SELECT v.patente, v.modelo, v.marca, v.peso, v.km,
       c.largo, c.max_toneladas, c.cant_ruedas, c.tiene_acoplado
FROM Camion c
INNER JOIN Vehiculo v ON (v.patente = c.patente)
INNER JOIN Service ser ON (ser.patente = c.patente)
WHERE (cant_ruedas >= 4 AND cant_ruedas <= 8 AND s.fecha >= CURRENT_DATE - INTERVAL '365 days')
ORDER BY v.marca, v.modelo, v.patente

2.
SELECT v.patente, v.modelo, v.marca, v.peso, v.km, a.es_electrico, a.tipo_motor
FROM Vehiculo v
INNER JOIN Auto a ON (a.patente = v.patente)
INNER JOIN Service ser ON (ser.patente = v.patente)
INNER JOIN Service_Parte serp ON (serp.patente = v.patente AND serp.fecha = ser.fecha)
INNER JOIN Parte par ON (par.cod_parte = serp.cod_parte)
WHERE (par.nombre = 'cambio de aceite' AND ser.km_service <= 13000)
UNION
SELECT v.patente, v.modelo, v.marca, v.peso, v.km, a.es_electrico, a.tipo_motor
FROM Vehiculo v
INNER JOIN Auto a ON (a.patente = v.patente)
INNER JOIN Service ser ON (ser.patente = v.patente)
INNER JOIN Service_Parte serp1 ON (serp1.patente = v.patente AND serp1.fecha = ser.fecha)
INNER JOIN Service_Parte serp2 ON (serp2.patente = v.patente AND serp2.fecha = ser.fecha)
INNER JOIN Parte par1 ON (par1.cod_parte = serp1.cod_parte)
INNER JOIN Parte par2 ON (par2.cod_parte = serp2.cod_parte)
WHERE (par1.nombre = 'inspeccion general' AND par2.nombre = 'filtro de combustible')

3.
SELECT p.nombre, p.precio
FROM Parte p
LEFT JOIN Service_Parte serp ON (serp.cod_parte = p.cod_parte)
WHERE (p.precio_parte > 4000)
GROUP BY p.cod_parte, p.nombre, p.precio_parte
HAVING (COUNT(*) > 30)

4.--DUDOSO
DELETE FROM Camion
WHERE patente IN(
    SELECT c.patente
    FROM Camion c
    INNER JOIN Vehiculo v ON (v.patente = c.patente)
    WHERE v.km > 250000
)

DELETE FROM Vehiculo
WHERE patente IN(
    SELECT c.patente
    FROM Camion c
    INNER JOIN Vehiculo v ON v.patente = c.patente
    WHERE v.km > 250000
)

5.--DUDOSO

6.
SELECT v.patente, v.modelo, v.marca, v.peso
FROM Vehiculo v
INNER JOIN Auto a ON (a.patente = v.patente)
WHERE (a.es_electrico = TRUE)

7.
INSERT INTO Parte (cod_parte, nombre, precio_parte)
VALUES (12345, 'Aleron', 5000)

8.  --DUDOSO
DELETE FROM Service
WHERE patente = 'AWA564'

9.
SELECT DISTINCT v.patente, v.modelo, v.marca, v.peso, v.km
FROM Vehiculo v
INNER JOIN Service s ON (s.patente = v.patente)
WHERE (YEAR(s.fecha) = 2024)