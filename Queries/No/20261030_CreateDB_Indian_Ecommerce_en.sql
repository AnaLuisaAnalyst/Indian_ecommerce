CREATE DATABASE Indian_Ecommerce;



CREATE TABLE customer (
	customerId VARCHAR(50) PRIMARY KEY,
	customer_name VARCHAR(150),
	gender VARCHAR(50),
	age INTEGER,
	age_group VARCHAR(50),
	date_of_birth DATE,
	email VARCHAR(150),
	phone VARCHAR(50),
	city VARCHAR(50),
	state VARCHAR(50),
	pincode VARCHAR(50),
	registration_date DATE,
	customer_tier VARCHAR(50),
	total_orders INTEGER,
	total_spent NUMERIC(10,2)
);




CREATE TABLE product (
	product_id VARCHAR(50) PRIMARY KEY,
	customer_name VARCHAR(150),
	gender VARCHAR(50),
	age INTEGER,
	age_group VARCHAR(50),
	date_of_birth DATE,
	email VARCHAR(150),
	phone VARCHAR(50),
	city VARCHAR(50),
	state VARCHAR(50),
	pincode VARCHAR(50),
	registration_date DATE,
	customer_tier VARCHAR(50),
	total_orders INTEGER,
	total_spent NUMERIC(10,2)
);

CREATE TABLE customer (
	customerId VARCHAR(50) PRIMARY KEY,
	customer_name VARCHAR(150),
	gender VARCHAR(50),
	age INTEGER,
	age_group VARCHAR(50),
	date_of_birth DATE,
	email VARCHAR(150),
	phone VARCHAR(50),
	city VARCHAR(50),
	state VARCHAR(50),
	pincode VARCHAR(50),
	registration_date DATE,
	customer_tier VARCHAR(50),
	total_orders INTEGER,
	total_spent NUMERIC(10,2)
);
