
-- primero agarro el cliente deceado
-- luego busco todas sus facturas no pagas
-- y luego las sumo

SELECT Nombre,sum(CosteTotal) as deuda FROM Factura_Cliente JOIN 

		(SELECT * FROM Clientes WHERE Clientes.Nombre = "cliente deceado") Clientes 

	ON Factura_Cliente.IdCliente = Clientes.IdCliente

JOIN Factura ON Factura.IdFactura=Factura_Cliente.IdFactura WHERE Factura.Pagada is '0';