-- Consulta para conocer la base de datos y ver que esten correctamente cargadas.

SELECT 'cliente' AS tabla, COUNT(*) FROM cliente
UNION ALL
SELECT 'producto' AS tabla, COUNT(*) FROM producto
UNION ALL
SELECT 'venta' AS tabla, COUNT(*) FROM venta;



-- Creamos una tabla para revisar los puntos criticos para eliminar una fila de la BD

-- Clientes sin nombre o sin identificador
SELECT
	'Clientes sin nombre o datos de contacto' AS diagnostico,
	COUNT(*) AS cantidad_errores
FROM cliente
WHERE nombre_cliente IS NULL OR nombre_cliente = '' OR id_cliente IS NULL OR id_cliente = ''
UNION ALL

-- Productos con precios o stock invalido o sin nombre
SELECT
	'Productos con precio/stock invalido o sin nombre' AS diagnostico,
	COUNT(*) AS cantidad_errores
FROM producto
WHERE precio_venta <=0  OR precio_venta IS NULL OR cantidad_stock IS NULL OR nombre_producto = ''
UNION ALL

-- Ventas con errores en ID, valor de orden o cantidad
SELECT
	'Venta con cantidades o valores erroneos' AS diagnostico,
	COUNT(*) AS cantidad_errores
FROM venta
WHERE valor_orden <= 0  OR cantidad IS NULL OR valor_orden IS NULL OR id_orden = '' OR id_orden IS NULL;



SELECT * FROM cliente LIMIT 10;


-- Buscando filas duplicadas en clientes o productos 

SELECT
	'Cliente con Email Repetido' AS tipo_duplicado,
	email AS valor_duplicado,
	COUNT(*) AS cantidad_repeticiones
FROM cliente
GROUP BY email
HAVING COUNT(*) > 1
UNION ALL

SELECT
	'Cliente con Telefono Repetido' AS tipo_duplicado,
	telefono AS valor_duplicado,
	COUNT(*) AS cantidad_repeticiones
FROM cliente
GROUP BY telefono
HAVING COUNT(*) > 1
UNION ALL

SELECT
	'Productos con Mismo Nombre' AS tipo_duplicado,
	nombre_producto AS valor_duplicado,
	COUNT(*) AS cantidad_repeticiones
FROM producto
GROUP BY nombre_producto
HAVING COUNT(*) > 1;



