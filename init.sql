-- Database
CREATE DATABASE inventory_management;


-- ENUM Data Type
CREATE TYPE payment_method_enum AS ENUM ('Cash','Transfer','Debit');
CREATE TYPE payment_status_enum AS ENUM ('Belum lunas','Lunas');
CREATE TYPE order_status_enum AS ENUM ('Diproses','Dikirim','Selesai');


-- Tables
CREATE TABLE customers (
	customer_id VARCHAR(5) PRIMARY KEY,
	customer_name VARCHAR(50),
	customer_email VARCHAR(50),
	customer_phone_number VARCHAR(15),
	customer_address VARCHAR(255),
	customer_city VARCHAR(20),
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CHECK (customer_id ~ '^CU[0-9]{3}$')
);

CREATE TABLE employees (
	employee_id VARCHAR(4) PRIMARY KEY,
	employee_name VARCHAR(50),
	employee_role VARCHAR(30),
	employee_phone_number VARCHAR(15),
	employee_doj TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CHECK (employee_id ~ '^E[0-9]{3}$')
);

CREATE TABLE orders(
	order_id VARCHAR(5) PRIMARY KEY,
	customer_id VARCHAR(5),
	order_date DATE,
	total_amount DECIMAL(10,2),
	order_status order_status_enum,
	shipping_address VARCHAR(255),
	payment_method payment_method_enum,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	employee_id VARCHAR(4),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
	CHECK (order_id ~ '^O[0-9]{4}$')
);

CREATE TABLE suppliers(
	supplier_id VARCHAR(5) PRIMARY KEY,
	supplier_name VARCHAR(50),
	supplier_contact VARCHAR(15),
	supplier_address VARCHAR(255),
	supplier_city VARCHAR(20),
	supplier_country VARCHAR(20),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CHECK (supplier_id ~ '^S[0-9]{4}$')
);

CREATE TABLE categories(
	category_id VARCHAR(3) PRIMARY KEY,
	category_name VARCHAR(25),
	CHECK (category_id ~ '^C[0-9]{2}$')
);

CREATE TABLE products(
	product_id VARCHAR(5) PRIMARY KEY,
	product_name VARCHAR(30),
	category_id VARCHAR(3),
	supplier_id VARCHAR(5),
	qty_in_stock INTEGER,
	product_price DECIMAL(10,2),
	FOREIGN KEY (category_id) REFERENCES categories(category_id),
	FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
	CHECK (product_id ~ '^P[0-9]{4}$')
);

CREATE TABLE payments (
	payment_id VARCHAR(5) PRIMARY KEY,
	order_id VARCHAR(5),
	payment_date DATE,
	amount_paid DECIMAL(10, 2),
	payment_method payment_method_enum,
    payment_status payment_status_enum,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	CHECK (payment_id ~ '^P[0-9]{4}$')
);

CREATE TABLE order_details(
	order_detail_id VARCHAR(5) PRIMARY KEY,
	order_id VARCHAR(5),
	product_id VARCHAR(5),
	quantity INTEGER,
	price_per_unit DECIMAL(10,2),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id),	
	CHECK (order_detail_id ~ '^OD[0-9]{3}$')
);
