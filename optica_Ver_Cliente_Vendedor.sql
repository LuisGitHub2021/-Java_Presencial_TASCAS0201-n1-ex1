USE optica;

SELECT

c.clientes_nombre AS 'Cliente',
v.vendedor_nombre AS 'Vendedor'

FROM optica.clientes c
JOIN optica.vendedor v 
ON c.vendedor_vendedor_id=v.vendedor_id;