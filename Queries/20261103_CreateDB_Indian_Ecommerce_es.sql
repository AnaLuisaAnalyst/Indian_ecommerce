
-- Creacion de base de datos

CREATE DATABASE Indian_Ecommerce;


-- Creacion de tabla clientes

CREATE TABLE cliente (
	id_cliente VARCHAR(50) PRIMARY KEY,
	nombre_cliente VARCHAR(150),
	genero VARCHAR(30),
	edad SMALLINT CHECK (edad >= 0 AND edad <= 120),
	grupo_edad VARCHAR(50),
	fecha_nacimiento DATE,
	email VARCHAR(150),
	telefono VARCHAR(20),
	ciudad VARCHAR(50),
	estado VARCHAR(50),
	pincode VARCHAR(12),
	fecha_registro DATE,
	nivel_cliente VARCHAR(50),
	total_ordenes INTEGER,
	total_gastado NUMERIC(10,2)
);



-- Creacion de tabla producto

CREATE TABLE producto (
	id_producto VARCHAR(50) PRIMARY KEY,
	nombre_producto VARCHAR(150),
	categoria VARCHAR(50),
	marca VARCHAR(50),
	precio_original NUMERIC(10,2),
	porcent_descuento NUMERIC(5,2),
	monto_descuento NUMERIC(10,2),
	precio_venta NUMERIC(10,2),
	cantidad_stock INTEGER,
	peso_kg NUMERIC(5,2),
	puntuacion_promedio NUMERIC (5,2),
	total_reviews SMALLINT
);



-- Creacion de tabla venta

CREATE TABLE venta (
	id_orden VARCHAR(50) PRIMARY KEY,
	id_cliente VARCHAR(50),
	id_producto VARCHAR(50),
	fecha_orden DATE,
	tiempo_orden TIME,
	fecha_entrega DATE,
	cantidad INTEGER,
	precio_unitario NUMERIC(10,2),
	valor_orden NUMERIC(10,2),
	costo_envio NUMERIC(10,2),
	codigo_cupon VARCHAR(50),
	valor_cupon NUMERIC(10,2),
	valor_total NUMERIC(10,2),
	metodo_pago VARCHAR(50),
	estado_orden VARCHAR(50),
	puntuacion NUMERIC (5,2),
	comentario TEXT,
	ciudad VARCHAR(50),
	estado VARCHAR(50),
	edad_cliente SMALLINT,
	grupo_edad_cliente VARCHAR(50),
	CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
	CONSTRAINT fk_venta_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

