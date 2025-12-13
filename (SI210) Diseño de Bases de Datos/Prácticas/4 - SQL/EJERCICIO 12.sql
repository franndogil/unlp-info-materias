1.
--IDEA: TODOS LOS CLIENTES MENOS LOS QUE TUVIERON ATENCIONES DURANTE 2024

SELECT DNI, nombYAp, direccionC, fechaNacimiento, celular
FROM Cliente
EXCEPT
SELECT c.DNI, c.nombYAp, c.direccionC, c.fechaNacimiento, c.celular
FROM Atencion ate
INNER JOIN Cliente c ON (c.nroCliente = ate.nroCliente)
WHERE YEAR(ate.fecha) = 2024

2.
SELECT b.DNIB, b.nombYApB, b.direccionB, b.telefonoContacto, b.email, COUNT(ate.codEmpleado) as cantidadAtenciones
FROM Barbero b
LEFT JOIN Atencion ate ON (b.codEmpleado = ate.codEmpleado AND YEAR(ate.fecha) = 2023)
GROUP BY b.DNIB, b.nombYApB, b.direccionB, b.telefonoContacto, b.email

3.
SELECT DISTINCT bar.razon_social, bar.direccion, bar.telefono
FROM Atencion ate
INNER JOIN Barberia bar ON (bar.codBarberia = ate.codBarberia)
INNER JOIN Cliente c ON (c.nroCliente = ate.nroCliente)
WHERE c.DNI = 22283566
ORDER BY bar.razon_social, bar.direccion ASC

4.
SELECT DISTINCT b.DNIB, b.nombYApB, b.direccionB, b.telefonoContacto, b.email
FROM Atencion ate
INNER JOIN Barbero b ON (b.codEmpleado = ate.codEmpleado)
WHERE ate.valor > 5000

5.
SELECT c.DNI, c.nombYAp, c.direccionC, c.fechaNacimiento, c.celular
FROM Atencion ate
INNER JOIN Cliente c ON (c.nroCliente = ate.nroCliente)
INNER JOIN Barberia bar ON (bar.codBarberia = ate.codBarberia)
WHERE bar.razon_social = 'Corta barba'
INTERSECT
SELECT c.DNI, c.nombYAp, c.direccionC, c.fechaNacimiento, c.celular
FROM Atencion ate
INNER JOIN Cliente c ON (c.nroCliente = ate.nroCliente)
INNER JOIN Barberia bar ON (bar.codBarberia = ate.codBarberia)
WHERE bar.razon_social = 'Barberia Barbara'

6.
DELETE
FROM Atencion
WHERE nroCliente IN(
    SELECT nroCliente
    FROM Cliente
    WHERE DNI = 22222222
)

DELETE 
FROM Cliente
WHERE DNI = 22222222 