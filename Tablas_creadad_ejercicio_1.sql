CREATE DATABASE tienda;
USE tienda;

CREATE TABLE fabricante (
  codigo INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100)
);

CREATE TABLE producto (
  codigo INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100),
  precio DOUBLE,
  codigo_fabricante INT
);

ALTER TABLE producto
ADD CONSTRAINT fk_fabricante_producto
FOREIGN KEY (codigo_fabricante) REFERENCES fabricante (codigo);

SELECT nombre FROM producto;

SELECT * FROM producto;