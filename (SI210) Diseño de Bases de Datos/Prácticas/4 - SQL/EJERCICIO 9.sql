1.
SELECT nombrP, descripcion, fechaInicioP, fechaFinP
FROM Proyecto
WHERE fechaFinP IS NOT NULL AND fechaFinP > fechaFinEstimada

2.
SELECT DNI, nombre, apellido, telefono, direccion, fechaIngreso
FROM Empleado
EXCEPT
SELECT emp.DNI, emp.nombre, emp.apellido, emp.telefono, emp.direccion, emp.fechaIngreso
FROM Empleado emp
INNER JOIN Proyecto proy ON (proy.DNIResponsable = emp.DNI)
ORDER BY apellido, nombre

3.
SELECT emp.DNI, emp.nombre, emp.apellido, emp.telefono, emp.direccion
FROM Empleado emp
INNER JOIN Equipo eq ON (eq.DNILider = emp.DNI)
GROUP BY emp.DNI, emp.nombre, emp.apellido, emp.telefono, emp.direccion
HAVING (COUNT(eq.codEquipo) > 1)

4.
SELECT DISTINCT emp.DNI, emp.nombre, emp.apellido, emp.telefono, emp.direccion
FROM Proyecto proy
INNER JOIN Equipo front ON (proy.equipoFrontend = front.codEquipo)
INNER JOIN Equipo back ON (proy.equipoBackend = back.codEquipo)
INNER JOIN Empleado_Equipo ee ON (ee.codEquipo = front.codEquipo OR ee.codEquipo = back.codEquipo)
INNER JOIN Empleado emp ON emp.DNI = ee.DNI
WHERE proy.nombrP = 'Proyecto X'

5.
SELECT eq.nombreE, emp.DNI, emp.nombre, emp.apellido, emp.telefono, emp.direccion
FROM Equipo eq
LEFT JOIN Empleado_Equipo ee ON (ee.codEquipo = eq.codEquipo)
INNER JOIN Empleado emp ON (emp.DNI = eq.DNILider)
WHERE eq.descTecnologias = 'Java'
GROUP BY eq.codEquipo, eq.nombreE, emp.DNI, emp.nombre, emp.apellido, emp.telefono, emp.direccion
HAVING (COUNT (ee.DNI)) = 0

6.
UPDATE Empleado SET nombre = 'Franco', apellido = 'Dogil', direccion = 'MQ'
WHERE DNI = 40568965

7.
SELECT emp.DNI, emp.nombre, emp.apellido, emp.telefono, emp.direccion
FROM Proyecto proy
INNER JOIN Empleado emp ON (emp.DNI = proy.DNIResponsable)
EXCEPT
SELECT emp.DNI, emp.nombre, emp.apellido, emp.telefono, emp.direccion
FROM Equipo eq
INNER JOIN Empleado emp ON (emp.DNI = eq.DNILider)

8.
SELECT eq.nombreE, eq.descTecnologias
FROM Proyecto proy
INNER JOIN Equipo eq ON (eq.codEquipo = proy.equipoBackend)
INTERSECT
SELECT eq.nombreE, eq.descTecnologias
FROM Proyecto proy
INNER JOIN Equipo eq ON (eq.codEquipo = proy.equipoFrontend)

9.
SELECT proy.nombrP, proy.descripcion, proy.fechaInicioP, emp.nombre, emp.apellido
FROM Proyecto proy
INNER JOIN Empleado emp ON (emp.DNI = proy.DNIResponsable)
WHERE YEAR(proy.fechaFinEstimada) = 2025