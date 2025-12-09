--Técnico = (codTec, nombre, especialidad) // técnicos 
--Repuesto = (codRep, nombre, stock, precio) // repuestos 
--RepuestoReparacion = (nroReparac (fk), codRep (fk), cantidad, precio) // repuestos utilizados en reparaciones. 
--Reparación = (nroReparac, codTec (fk), precio_total, fecha)

1.
SELECT nombre, stock, precio
FROM Repuesto
ORDER BY precio, nombre

2.
SELECT rep.nombre, rep.stock, rep.precio
FROM Reparación r
INNER JOIN RepuestoReparacion rr ON (r.nroReparac = rr.nroReparac)
INNER JOIN Repuesto rep ON (rep.codRep = rr.codRep)
WHERE (YEAR(r.fecha) = 2023)
EXCEPT
SELECT rep.nombre, rep.stock, rep.precio
FROM Reparación r
INNER JOIN RepuestoReparacion rr ON (r.nroReparac = rr.nroReparac)
INNER JOIN Repuesto rep ON (rep.codRep = rr.codRep)
INNER JOIN Tecnico tec ON (tec.codTec = r.codTec)
WHERE (tec.nombre = 'Jose Gonzalez')

3.
SELECT nombre, especialidad
FROM Tecnico
EXCEPT
SELECT tec.nombre, tec.especialidad
FROM Reparación r
INNER JOIN Tecnico tec ON (tec.codTec = r.codTec)
ORDER BY nombre ASC, especialidad ASC

4.
SELECT tec.nombre, tec.especialidad
FROM Reparación r
INNER JOIN Tecnico tec ON (tec.codTec = r.codTec)
WHERE (YEAR(r.fecha) = 2022)
EXCEPT
SELECT tec.nombre, tec.especialidad
FROM Reparación r
INNER JOIN Tecnico tec ON (tec.codTec = r.codTec)
WHERE (YEAR(r.fecha) <> 2022)

5.
SELECT rep.nombre, rep.stock, COUNT(DISTINCT r.codTec)
FROM Repuesto rep
LEFT JOIN RepuestoReparacion rr ON (rep.codRep = rr.codRep)
LEFT JOIN Reparación r ON (r.nroReparac = rr.nroReparac)
GROUP BY rep.nombre, rep.stock

6.
SELECT tec.nombre, tec.especialidad
FROM Tecnico tec
INNER JOIN Reparacion rep ON (tec.codTec = rep.codTec)
GROUP BY tec.codTec, tec.nombre, tec.especialidad
HAVING(COUNT(DISTINCT rep.nroReparac)) >= ALL(
    SELECT COUNT(*)
    FROM Reparacion
    GROUP BY codTec
)
UNION
SELECT tec.nombre, tec.especialidad
FROM Tecnico tec
INNER JOIN Reparacion rep ON (tec.codTec = rep.codTec)
GROUP BY tec.codTec, tec.nombre, tec.especialidad
HAVING (COUNT(DISTINCT rep.nroReparac)) <= ALL(
    SELECT COUNT(*)
    FROM Reparacion
    GROUP BY codTec
)

7.
SELECT nombre, stock, precio
FROM Repuesto
WHERE stock > 0
INTERSECT
(
    SELECT rep.nombre, rep.stock, rep.precio
    FROM Reparacion r
    INNER JOIN RepuestoReparacion rr ON (rr.nroReparac = r.nroReparac)
    INNER JOIN Repuesto rep ON (rep.codRep = rr.codRep)
    WHERE r.precio_total < 10000
    EXCEPT
    SELECT rep.nombre, rep.stock, rep.precio
    FROM Reparacion r
    INNER JOIN RepuestoReparacion rr ON (rr.nroReparac = r.nroReparac)
    INNER JOIN Repuesto rep ON (rep.codRep = rr.codRep)
    WHERE r.precio_total >= 10000
)

8.
SELECT DISTINCT r.nroReparac, r.fecha, r.precio_total
FROM Reparacion r
INNER JOIN RepuestoReparacion rr ON (rr.nroReparac = r.nroReparac)
INNER JOIN Repuesto rep ON (rep.codRep = rr.codRep)
WHERE (rep.precio > 10000 AND rep.precio < 15000)

9.
SELECT rep.nombre, rep.stock, rep.precio
FROM Repuesto rep
WHERE NOT EXISTS (
    SELECT *
    FROM Tecnico tec
    WHERE NOT EXISTS (
        SELECT *
        FROM Reparacion repa
        INNER JOIN RepuestoReparacion rr ON (repa.nroReparac = rr.nroReparac)
        WHERE tec.codTec = repa.codTec AND rr.codRep = rep.codRep
    )
)

10.
SELECT r.fecha, tec.nombre, r.precio_total
FROM Reparacion r
INNER JOIN Tecnico tec ON (tec.codTec = r.codTec)
INNER JOIN RepuestoReparacion rr ON (rr.nroReparac = r.nroReparac)
INNER JOIN Repuesto rep ON (rep.codRep = rr.codRep)
GROUP BY r.nroReparac, r.fecha, r.precio_total, tec.nombre
HAVING (COUNT(DISTINCT rep.codRep) >= 4)