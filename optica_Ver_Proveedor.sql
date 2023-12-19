USE optica;

SELECT
p.proveedor_name AS 'Proveedor',
d.direccion_calle AS 'Dirección',
d.direccion_numero AS 'Número',
d.direccion_piso AS 'Piso',
d.direccion_puerta AS 'Puerta',
d.direccion_cp AS 'CP',
d.direccion_ciudad AS 'Ciudad',
d.direccion_pais AS 'País',
p.proveedor_telefono AS 'Teléfono',
p.proveedor_fax AS 'Fax',
mg.modelosGafas_marca AS 'Marca',
mg.modelosGafas_modelo AS 'Modelo',
mg.modelosGafas_precio AS 'Precio'

FROM optica.proveedor p
JOIN modelosgafas mg
ON p.proveedor_id=mg.proveedor_proveedor_id
JOIN direccion d
ON p.proveedor_id=d.proveedor_proveedor_id;


                 
