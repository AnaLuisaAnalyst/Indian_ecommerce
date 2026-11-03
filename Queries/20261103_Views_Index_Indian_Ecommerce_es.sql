-- Creacion de indices para llaves foraneas

CREATE INDEX idx_venta_id_cliente ON venta(id_cliente);
CREATE INDEX idx_venta_id_producto ON venta(id_producto);

-- Creacion de indice para grupos de edad y metodos de pago en tabla ventas

CREATE INDEX id_venta_demografia_ingresos
ON venta(grupo_edad_cliente, metodo_pago)
INCLUDE (valor_total);

-- Creacion de indices de Ciudades en tabla clientes

CREATE INDEX idx_cliente_ciudad ON cliente(ciudad);


-- Crea una vista para tener los valores actualizados mas importantes para la toma de decisiones

CREATE OR REPLACE VIEW v_kpis_financieros AS
SELECT
	COUNT(id_orden) AS total_pedido,
	SUM(cantidad) AS total_unidades_vndidas,
	ROUND(SUM(valor_total), 2) AS ingresos_bruots_totales,
	ROUND(SUM(valor_cupon), 2) AS total_descuentos_cupon,
	ROUND(SUM(costo_envio), 2) AS costo_logistico_total,
	ROUND(AVG(valor_total), 2) AS ticket_promedio_compra
FROM venta;


SELECT * FROM v_kpis_financieros;



-- Crea una vista para obtener informacion importante de los productos lideres de venta

CREATE OR REPLACE VIEW v_top_produtos AS
SELECT
	p.id_producto,
	p.nombre_producto,
	p.categoria,
	SUM(v.cantidad) AS unidades_vendidas,
	ROUND(SUM(v.valor_total), 2) AS ingresos_generados,
	ROUND(AVG(v.puntuacion), 2) AS calificacion_promedio_ventas
FROM venta v
JOIN producto p ON v.id_producto = p.id_producto
GROUP BY p.id_producto, p.nombre_producto, p.categoria
ORDER BY ingresos_generados DESC;

SELECT * FROM v_top_produtos;



-- Crea una vista para ver los Segmentos de edades y Ciudades que mas ventas generan agrupado por metodos de pago

CREATE OR REPLACE VIEW v_analisis_demografico AS
SELECT
	c.ciudad,
	v.grupo_edad_cliente,
	COUNT(DISTINCT v.id_cliente) AS clientes_unicos_activos,
	COUNT(v.id_orden) AS numero_ordenes,
	ROUND(SUM(v.valor_total), 2) AS total_gastado_grupo,
	v.metodo_pago AS metodo_pago_preferido
FROM venta v
JOIN cliente c ON v.id_cliente = c.id_cliente
GROUP BY c.ciudad, v.grupo_edad_cliente, v.metodo_pago
ORDER BY total_gastado_grupo DESC;

SELECT * FROM v_analisis_demografico;



-- Crea una Vista unica con los valores de las  tres tablas para el trabajo en PowerBI

CREATE OR REPLACE VIEW v_indian_ecommerce_powerbi AS
SELECT
	v.fecha_orden,
	p.nombre_producto,
	v.cantidad,
	p.precio_venta,
	v.valor_orden,
	v.costo_envio,
	COALESCE(v.codigo_cupon, '') AS codigo_cupon,
	COALESCE(v.valor_cupon, 0) AS valor_cupon,
	v.valor_total,
	v.estado_orden,
	p.categoria,
	p.marca,
	v.metodo_pago,
	c.nivel_cliente,
	c.grupo_edad,
	c.ciudad,
	c.estado,
	v.fecha_entrega
FROM venta v
JOIN cliente c ON v.id_cliente = c.id_cliente
JOIN producto p ON v.id_producto = p.id_producto;

SELECT * FROM v_indian_ecommerce_powerbi;





