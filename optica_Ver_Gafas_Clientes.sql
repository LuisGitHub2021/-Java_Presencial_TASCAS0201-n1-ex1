USE optica;

SELECT 

c.clientes_nombre AS 'Nombre',
m.modelosGafas_marca AS 'Marca',
m.modelosGafas_modelo AS 'Modelo',
m.modelosGafas_precio AS 'Precio',
g.gafasCliente_montura AS 'Montura',
g.gafasCliente_colorMontura AS 'Color Montura',
g.gafasCliente_colorVidrio AS 'Color Vidrio',
g.gafasCliente_od AS 'OD',
g.gafasCliente_os AS 'OS',
g.gafasCliente_aod AS 'AOD',
g.gafasCliente_aos AS 'AOS'


FROM optica.gafascliente_has_clientes gcl
JOIN optica.clientes c
ON c.clientes_id=gcl.clientes_clientes_id
JOIN optica.gafascliente g
ON g.gafasCliente_id=gcl.gafasCliente_gafasCliente_id
JOIN modelosgafas m
ON m.modelosGafas_id=g.modelosGafas_modelosGafas_id;
