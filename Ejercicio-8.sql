
SELECT Nombre,sum(CosteTotal) as deuda FROM Factura_Cliente, clientes, factura  
	WHERE Factura_Cliente.IdCliente = Clientes.IdCliente 
	AND Factura.IdFactura = Factura_Cliente.IdFactura 
	AND Factura.Pagada = 'no';