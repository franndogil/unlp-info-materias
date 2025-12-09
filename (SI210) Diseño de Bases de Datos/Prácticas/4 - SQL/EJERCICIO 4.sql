
--Persona = (DNI, Apellido, Nombre, Fecha_Nacimiento, Estado_Civil, Genero) 
--Alumno = (DNI (fk), Legajo, Anio_Ingreso)
--Profesor = (DNI (fk), Matricula, Nro_Expediente) 
--Titulo = (Cod_Titulo, Nombre, Descripcion) 
--Titulo-Profesor = (Cod_Titulo (fk), DNI (fk), Fecha) 
--Curso = (Cod_Curso, Nombre, Descripcion, Fecha_Creacion, Duracion) 
--Alumno-Curso = (DNI (fk), Cod_Curso (fk), Anio, Desempenio, Calificacion) 
--Profesor-Curso = (DNI (fk), Cod_Curso (fk), Fecha_Desde, Fecha_Hasta?) 

1.
SELECT per.DNI, al.Legajo, per.Apellido, per.Nombre
FROM Alumno al
INNER JOIN Persona per ON (per.DNI = al.DNI)
WHERE (al.Anio_Ingreso < 2014)

2. 
SELECT DISTINCT per.DNI, prof.Matricula, per.Apellido, per.Nombre
FROM Profesor-Curso pc
INNER JOIN Persona per ON (per.DNI = pc.DNI)
INNER JOIN Profesor prof ON (prof.DNI = pc.DNI)
INNER JOIN Curso cur ON (cur.Cod_Curso = pc.Cod_Curso)
WHERE (cur.Duracion > 100)
ORDER BY per.DNI

3.
SELECT per.DNI, per.Apellido, per.Nombre, per.Genero ,per.Fecha_Nacimiento
FROM Alumno-Curso ac
INNER JOIN Persona per ON (ac.DNI = per.DNI)
INNER JOIN Curso cur ON (ac.Cod_Curso = cur.Cod_Curso)
WHERE (YEAR(ac.Anio) = 2023 AND cur.Nombre = 'Diseño de Bases de Datos')

4.
SELECT per.DNI, per.Apellido, per.Nombre, ac.Calificacion
FROM Alumno-Curso ac
INNER JOIN Persona per ON (ac.DNI = per.DNI)
WHERE (ac.Calificacion > 8 AND ac.Cod_Curso IN (
    SELECT pc.Cod_Curso
    FROM Profesor-Curso pc
    INNER JOIN Persona per ON (pc.DNI = per.DNI)
    WHERE (per.Nombre = 'Juan' AND per.Apellido = 'Garcia')    
))
ORDER BY per.Apellido, per.Nombre

5.
SELECT per.DNI, per.Apellido, per.Nombre, prof.Matricula
FROM Titulo-Profesor tp
INNER JOIN Profesor prof ON (prof.DNI = tp.DNI)
INNER JOIN Persona per ON (per.DNI = prof.DNI)
GROUP BY prof.DNI, per.Apellido, per.Nombre, prof.Matricula
HAVING COUNT (tp.Titulo) > 3
ORDER BY per.Apellido, per.Nombre

6.
SELECT per.DNI, per.Apellido, per.Nombre, SUM(cur.Duracion), AVG(cur.Duracion)
FROM Profesor prof
INNER JOIN Persona per ON (per.DNI = prof.DNI)
LEFT JOIN Profesor-Curso pc ON (pc.DNI = prof.DNI)
LEFT JOIN Curso cur ON (pc.Cod_Curso = cur.Cod_Curso) 
GROUP BY prof.DNI, per.Apellido, per.Nombre

7.
SELECT cur.nombre, cur.descripcion
FROM Curso cur
INNER JOIN AlumnoCurso ac ON (ac.Cod_Curso = cur.Cod_Curso)
WHERE ac.anio = 2024
GROUP BY cur.Cod_Curso, cur.nombre, cur.descripcion
HAVING (COUNT (DISTINCT ac.DNI)) >= ALL(
    SELECT COUNT (ac2.DNI)
    FROM AlumnoCurso ac2
    WHERE ac2.anio = 2024
    GROUP BY ac2.Cod_Curso
)
UNION
SELECT cur.nombre, cur.descripcion
FROM Curso cur
INNER JOIN AlumnoCurso ac ON (ac.Cod_Curso = cur.Cod_Curso)
WHERE ac.anio = 2024
GROUP BY cur.Cod_Curso, cur.nombre, cur.descripcion
HAVING (COUNT(DISTINCT ac.DNI)) <= ALL(
    SELECT COUNT (ac2.DNI)
    FROM AlumnoCurso ac2
    WHERE ac2.anio = 2024
    GROUP BY ac2.Cod_Curso
)

8.
SELECT per.DNI, per.Apellido, per.Nombre, al.Legajo
FROM Alumno-Curso ac
INNER JOIN Alumno al ON (al.DNI = ac.DNI)
INNER JOIN Persona per ON (per.DNI = al.DNI)
INNER JOIN Curso cur ON (cur.Cod_Curso = ac.Cod_Curso)
WHERE (ac.anio = 2023 AND cur.Nombre LIKE '%BD%')
EXCEPT
SELECT per.DNI, per.Apellido, per.Nombre, al.Legajo
FROM Alumno-Curso ac
INNER JOIN Alumno al ON (al.DNI = ac.DNI)
INNER JOIN Persona per ON (per.DNI = al.DNI)
WHERE ac.anio = 2023

9.
INSERT INTO Persona (DNI, Apellido, Nombre, Fecha_Nacimiento, Estado_Civil, Genero)
VALUES (43851, 'Dogil', 'Franco', '13-11-2001', 'Soltero', 'Masculino')

INSERT INTO Profesor (DNI, Matricula, Nro_Expediente)
VALUES (43851, 23300, 12345)

INSERT INTO Titulo-Profesor(Cod_Titulo, DNI, Fecha)
VALUES (25, 43851, '01-12-2025')

10.
UPDATE Persona SET Estado_Civil = 'Divorciado'
WHERE (DNI IN(SELECT DNI FROM Alumno WHERE (Legajo = '2020/09')))

11.
DELETE FROM Alumno WHERE (DNI = '30568989')
DELETE FROM Persona WHERE (DNI = '30568989')
DELETE FROM Alumno-Curso WHERE (DNI = '30568989')