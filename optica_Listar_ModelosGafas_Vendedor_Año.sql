USE optica;

SELECT
v.vendedor_nombre AS 'Vendedor',
mg.modelosGafas_marca AS 'Marca',
mg.modelosGafas_modelo AS 'Modelo',
mg.modelosGafas_precio AS 'Factura'

FROM gafascliente_has_clientes gclH
LEFT JOIN gafascliente gcl
ON gcl.gafasCliente_id=gclH.gafasCliente_gafasCliente_id
LEFT JOIN clientes cl
ON cl.clientes_id=gclH.clientes_clientes_id
LEFT JOIN modelosgafas mg
ON gcl.modelosGafas_modelosGafas_id=mg.modelosGafas_id
LEFT JOIN vendedor v
ON cl.vendedor_vendedor_id=v.vendedor_id
WHERE gcl.gafasCliente_fechaCreacion
BETWEEN '2023-01-01'
AND '2023-12-31'
ORDER BY v.vendedor_nombre
