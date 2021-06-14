
-- primero busco todas las facturas no pagas
-- luego los uno con Factura_cliente y con cliente
-- y por ultimo dejo el nombre y id de los deudores su nombre 

SELECT Clientes.Nombre,Clientes.IdCliente FROM  (Clientes JOIN 
    
  (SELECT DISTINCT Factura_Cliente.IdCliente FROM Factura_Cliente 

    JOIN (SELECT * FROM Factura WHERE Pagada = "0") Factura
    
  ON Factura_Cliente.IdFactura = Factura.IdFactura) Factura_Cliente

ON Factura_Cliente.IdCliente = Clientes.IdCliente);
