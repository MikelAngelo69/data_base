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

SELECT 
  p.nombre AS nombre_producto,
  p.precio,
  f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f 
  ON p.codigo_fabricante = f.codigo;

SELECT 
  p.nombre AS nombre_producto,
  p.precio,
  f.nombre AS nombre_fabricante
FROM producto p
LEFT JOIN fabricante f 
  ON p.codigo_fabricante = f.codigo;

SELECT 
  p.nombre AS nombre_producto,
  p.precio,
  f.nombre AS nombre_fabricante
FROM producto p
RIGHT JOIN fabricante f 
  ON p.codigo_fabricante = f.codigo;

SELECT 
  p.nombre AS nombre_producto,
  p.precio,
  f.nombre AS nombre_fabricante
FROM producto p
LEFT JOIN fabricante f 
  ON p.codigo_fabricante = f.codigo

UNION

SELECT 
  p.nombre AS nombre_producto,
  p.precio,
  f.nombre AS nombre_fabricante
FROM producto p
RIGHT JOIN fabricante f 
  ON p.codigo_fabricante = f.codigo;

SELECT 
  f.nombre AS nombre_fabricante,
  COUNT(p.codigo) AS total_productos
FROM fabricante f
LEFT JOIN producto p 
  ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre;