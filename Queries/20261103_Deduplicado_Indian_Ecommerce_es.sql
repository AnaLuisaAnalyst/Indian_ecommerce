
-- Cambio de codigo de clientes en venta para la unificacion de datos y no dejar ventad huerfanas
WITH cliente_unico AS(
	SELECT email,
		MIN(id_cliente) AS id_cliente_oficial --selecciona el ID mas antiguo como oficial
	FROM cliente
	GROUP BY email
)

UPDATE venta v
SET id_cliente = cu.id_cliente_oficial
FROM cliente c
JOIN cliente_unico cu ON c.email = cu.email
WHERE v.id_cliente = c.id_cliente AND v.id_cliente <> cu.id_cliente_oficial;



-- Con esta consulta podemos ver lo que se eliminara

WITH cliente_unico AS(
	SELECT email,
		MIN(id_cliente) AS id_cliente_oficial
	FROM cliente
	GROUP BY email
)

SELECT * FROM cliente c
JOIN cliente_unico cu ON c.email = cu.email
WHERE  c.id_cliente <> cu.id_cliente_oficial;



-- Eliminacion de lineas con cliente repetido de codigo mas recientes 
WITH cliente_unico AS(
	SELECT email,
		MIN(id_cliente) AS id_cliente_oficial
	FROM cliente
	GROUP BY email
)

DELETE FROM cliente c
USING cliente_unico cu
WHERE c.email = cu.email AND c.id_cliente <> cu.id_cliente_oficial;


