USE optica;

SELECT

cl.clientes_nombre AS 'Cliente',
mg.modelosGafas_precio AS 'Factura'

FROM gafascliente_has_clientes gclH
LEFT JOIN gafascliente gcl
ON gcl.gafasCliente_id=gclH.gafasCliente_gafasCliente_id
LEFT JOIN clientes cl
ON cl.clientes_id=gclH.clientes_clientes_id
LEFT JOIN modelosgafas mg
ON gcl.modelosGafas_modelosGafas_id=mg.modelosGafas_id
WHERE gcl.gafasCliente_fechaCreacion
BETWEEN '2023-01-01'
AND '2023-12-31'
ORDER BY cl.clientes_nombre

