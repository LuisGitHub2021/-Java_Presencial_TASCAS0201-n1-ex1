USE optica;

SELECT
e.clientes_nombre AS 'Cliente' ,
m.clientes_nombre AS 'Recomendado por'

FROM optica.clientes e
JOIN optica.clientes m 
ON e.clientes_recomendadoPorCliente=m.clientes_id;