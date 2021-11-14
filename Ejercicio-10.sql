
SELECT Nombre,sum(CosteTotal) FROM Factura_Cliente, clientes, factura  
	WHERE Factura_Cliente.IdCliente = Clientes.Id
	AND Factura.Id = Factura_Cliente.IdFactura 
	AND Factura.Pagada = 'si';
