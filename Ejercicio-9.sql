
SELECT Nombre FROM Factura_Cliente, clientes  
	JOIN (SELECT id FROM factura on Factura.Id = Factura_Cliente.IdFactura 
	AND Factura.Pagada = 'si')
  WHERE Factura_Cliente.IdCliente = Clientes.Id;
