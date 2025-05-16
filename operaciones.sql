-- Ejercicio 2
SELECT nombre, precio 
FROM producto;

-- Ejercicio 3
SELECT *
FROM producto;

-- Ejercicio 4
SELECT 
  nombre,
  precio AS precio_euros,
  ROUND(precio * 1.08, 2) AS precio_usd
FROM producto;

-- Ejercicio 5
SELECT 
  nombre AS 'nombre de producto',
  precio AS euros,
  ROUND(precio * 1.08, 2) AS dólares
FROM producto;

-- Ejercicio 6
SELECT 
  UPPER(nombre) AS nombre_mayuscula,
  precio
FROM producto;

-- Ejercicio 7
SELECT 
  LOWER(nombre) AS nombre_minuscula,
  precio
FROM producto;

-- Ejercicio 8
SELECT 
  nombre,
  UPPER(SUBSTRING(nombre, 1, 2)) AS iniciales
FROM fabricante;

-- Ejercicio 9
SELECT 
  nombre,
  ROUND(precio) AS precio_redondeado
FROM producto;

-- Ejercicio 10
SELECT 
  nombre,
  TRUNCATE(precio, 0) AS precio_truncado
FROM producto;

-- Ejercicio 11 
SELECT codigo_fabricante 
FROM producto;

-- Ejercicio 12
SELECT DISTINCT codigo_fabricante 
FROM producto;

-- ejercicio 13
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- ejercicio 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- ejercicio 15
SELECT nombre
FROM producto ORDER BY nombre ASC;
SELECT precio
FROM producto ORDER BY precio DESC;

-- ejercicio 16
SELECT * FROM fabricante limit 5;

-- ejercicio 17
SELECT *
FROM fabricante
LIMIT 3 OFFSET 3;

-- ejercicio 18
SELECT * FROM producto ORDER BY precio ASC LIMIT 1;

-- ejercicio 19
SELECT * FROM producto ORDER BY precio DESC LIMIT 1;

-- ejercicio 20 
SELECT nombre
FROM producto
WHERE codigo_fabricante = 2;

-- ejercicio 21
SELECT nombre
FROM producto
WHERE precio <= 120;

-- ejercicio 22
SELECT nombre
FROM producto
WHERE precio >= 400;

-- ejercicio 23
SELECT nombre
FROM producto
WHERE precio * 0.89 <	400;

-- ejercicio 24
SELECT *
FROM producto
WHERE precio * 0.89 >=	80 AND precio <= 300 ;

-- ejercicio 25
SELECT *
FROM producto
WHERE precio * 0.89 BETWEEN 60 AND 200;

-- ejercicio 26
SELECT *
FROM producto
WHERE precio * 0.89 >=	200 AND codigo_fabricante = 6;

-- ejercicio 27
SELECT *
FROM producto
WHERE codigo_fabricante = 1 
   OR codigo_fabricante = 3 
   OR codigo_fabricante = 5;
   
-- ejercicio 28
SELECT *
FROM producto
WHERE codigo_fabricante IN(1,3,5);
   
-- ejercicio 29
SELECT precio * 0.89 * 100 as centimos,
nombre FROM producto;

-- ejercicio 30
SELECT nombre
FROM fabricante
WHERE nombre LIKE 'S%';

-- ejercicio 31	
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%E';

-- ejercicio 32
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%W%';

-- ejercicio 33
SELECT nombre
FROM fabricante
WHERE LENGTH(nombre) = 4;

-- ejercicio 34
SELECT nombre
FROM producto
WHERE nombre LIKE '%portatil%';

-- ejercicio 35
SELECT nombre, precio
FROM producto
WHERE nombre LIKE '%monitor%' AND precio * 0.89 < 215;

-- ejercicio 36
SELECT nombre, precio
FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;

-- 1.1.4
-- 1
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 2
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre ASC;

-- 3 
SELECT 
  p.codigo AS id_producto,
  p.nombre AS nombre_producto,
  f.codigo AS id_fabricante,
  f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 4 
SELECT 
  p.nombre AS nombre_producto,
  p.precio,
  f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC
LIMIT 1;

-- 5
SELECT 
  p.nombre AS nombre_producto,
  p.precio,
  f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;

-- 6
SELECT 
  p.nombre AS nombre_producto,
  p.precio
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

-- 7 
SELECT 
  p.nombre AS nombre_producto,
  p.precio
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- 8 
SELECT 
  p.nombre AS nombre_producto,
  p.precio,
  f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus' 
   OR f.nombre = 'Hewlett-packard' 
   OR f.nombre = 'Seagate';

-- 9 
SELECT 
  p.nombre AS nombre_producto,
  p.precio,
  f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('Asus', 'Hewlett-packard', 'Seagate');

-- 10
SELECT 
  producto.nombre AS nombre_producto,
  producto.precio
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%e';

-- 11
SELECT 
  producto.nombre AS nombre_producto,
  producto.precio
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE LOWER(fabricante.nombre) LIKE '%w%';

-- 12
SELECT 
  producto.nombre AS nombre_producto,
  producto.precio,
  fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio >= 180
ORDER BY producto.precio DESC, producto.nombre ASC;

