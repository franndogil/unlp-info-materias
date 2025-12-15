1.
SELECT nombre, apellido, DNI, telefono, direccion
FROM Cliente
WHERE apellido LIKE 'PE%'
ORDER BY DNI

2.
SELECT DISTINCT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Factura fac
INNER JOIN Cliente c ON (c.idCliente = fac.idCliente)
WHERE YEAR(fac.fecha) = 2024

3.
SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Factura fac
INNER JOIN Detalle det ON (det.nroTIcket = fac.nroTicket)
INNER JOIN Producto p ON (p.idProducto = det.idProducto)
INNER JOIN Cliente c ON (c.idCliente = fac.idCliente)
WHERE c.DNI = 45789456
EXCEPT
SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Factura fac
INNER JOIN Detalle det ON (det.nroTIcket = fac.nroTicket)
INNER JOIN Producto p ON (p.idProducto = det.idProducto)
INNER JOIN Cliente c ON (c.idCliente = fac.idCliente)
WHERE c.apellido = 'Garcia'

4.
SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Factura fac
INNER JOIN Detalle det ON (det.nroTIcket = fac.nroTicket)
INNER JOIN Producto p ON (p.idProducto = det.idProducto)
INNER JOIN Cliente c ON (c.idCliente = fac.idCliente)
EXCEPT
SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Factura fac
INNER JOIN Detalle det ON (det.nroTIcket = fac.nroTicket)
INNER JOIN Producto p ON (p.idProducto = det.idProducto)
INNER JOIN Cliente c ON (c.idCliente = fac.idCliente)
WHERE c.telefono LIKE '221%'
ORDER BY p.nombreP

5.
SELECT p.nombreP, p.descripcion, p.precio, p.stock, COUNT (det.idProducto) as cantidadVendida
FROM Producto p
LEFT JOIN Detalle det ON (det.idProducto = p.idProducto)
GROUP BY p.nombreP, p.descripcion, p.precio, p.stock

6.
(
    SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
    FROM Factura fac
    INNER JOIN Cliente c ON (c.idCliente = fac.idCliente)
    INNER JOIN Detalle det ON (det.nroTicket = fac.nroTicket)
    INNER JOIN Producto p ON (p.idProducto = det.idProducto)
    WHERE p.nombreP = 'prod1'
    INTERSECT
    SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
    FROM Factura fac
    INNER JOIN Cliente c ON (c.idCliente = fac.idCliente)
    INNER JOIN Detalle det ON (det.nroTicket = fac.nroTicket)
    INNER JOIN Producto p ON (p.idProducto = det.idProducto)
    WHERE p.nombreP = 'prod2'
)
EXCEPT
SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Factura fac
INNER JOIN Cliente c ON (c.idCliente = fac.idCliente)
INNER JOIN Detalle det ON (det.nroTicket = fac.nroTicket)
INNER JOIN Producto p ON (p.idProducto = det.idProducto)
WHERE p.nombreP = 'prod3'

7.
