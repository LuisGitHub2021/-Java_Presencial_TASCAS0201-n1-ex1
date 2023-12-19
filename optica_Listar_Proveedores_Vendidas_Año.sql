USE optica;

SELECT

p.proveedor_name AS 'Proveedor'

FROM gafascliente gcl
LEFT JOIN modelosgafas mg
ON gcl.modelosGafas_modelosGafas_id=mg.modelosGafas_id
LEFT JOIN proveedor p
ON p.proveedor_id=mg.proveedor_proveedor_id
WHERE gcl.gafasCliente_fechaCreacion
BETWEEN '2023-01-01'
AND '2023-12-31'
GROUP BY p.proveedor_id