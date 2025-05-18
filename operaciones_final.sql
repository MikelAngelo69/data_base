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

-- 13
SELECT DISTINCT f.codigo, f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 1.1.5 
-- 1
SELECT 
  f.codigo AS id_fabricante,
  f.nombre AS nombre_fabricante,
  p.codigo AS id_producto,
  p.nombre AS nombre_producto,
  p.precio
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 2 
SELECT 
  f.codigo AS id_fabricante,
  f.nombre AS nombre_fabricante
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.codigo IS NULL;

-- 3 No, no pueden existir productos sin fabricante porque la base de datos está diseñada para que cada producto tenga que estar relacionado con un fabricante. 
-- Si intentas agregar un producto sin fabricante, la base de datos no lo permitirá.

-- 1.1.6 
-- 1
SELECT COUNT(*) AS total_productos
FROM producto;

-- 2 
SELECT COUNT(*) AS total_fabricantes
FROM fabricante;

-- 3
SELECT COUNT(DISTINCT codigo_fabricante) AS total_fabricantes_distintos
FROM producto;

-- 4
SELECT AVG(precio) AS media_precio
FROM producto;

-- 5
SELECT MIN(precio) AS precio_mas_barato
FROM producto;

-- 6 
SELECT MAX(precio) AS precio_mas_caro
FROM producto;

-- 7
SELECT nombre, precio
FROM producto
ORDER BY precio ASC
LIMIT 1;

-- 8 
SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1;

-- 9 
SELECT SUM(precio) AS suma_precios
FROM producto;

-- 10
SELECT COUNT(*) AS total_productos_asus
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus');

-- 11
SELECT AVG(precio) AS media_precio_asus
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus');

-- 12
SELECT MIN(precio) AS precio_mas_barato_asus
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus');

-- 13
SELECT MAX(precio) AS precio_mas_caro_asus
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus');

-- 14
SELECT SUM(precio) AS suma_precios_asus
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus');

-- 15
SELECT 
  MAX(precio) AS precio_maximo,
  MIN(precio) AS precio_minimo,
  AVG(precio) AS precio_medio,
  COUNT(*) AS total_productos
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Crucial');

-- 16
SELECT 
  f.nombre AS nombre_fabricante,
  COUNT(p.codigo) AS total_productos
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
ORDER BY total_productos DESC;

-- 17 
SELECT 
  f.nombre AS nombre_fabricante,
  MAX(p.precio) AS precio_maximo,
  MIN(p.precio) AS precio_minimo,
  AVG(p.precio) AS precio_medio
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo;

-- 18
SELECT 
  f.codigo AS id_fabricante,
  MAX(p.precio) AS precio_maximo,
  MIN(p.precio) AS precio_minimo,
  AVG(p.precio) AS precio_medio,
  COUNT(p.codigo) AS total_productos
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
HAVING AVG(p.precio) > 200;

-- 19
SELECT 
  f.nombre AS nombre_fabricante,
  MAX(p.precio) AS precio_maximo,
  MIN(p.precio) AS precio_minimo,
  AVG(p.precio) AS precio_medio,
  COUNT(p.codigo) AS total_productos
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
HAVING AVG(p.precio) > 200;

-- 20
SELECT COUNT(*) AS total_productos_mayor_180
FROM producto
WHERE precio >= 180;

-- 21
SELECT 
  f.nombre AS nombre_fabricante,
  COUNT(p.codigo) AS total_productos_mayor_180
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.precio >= 180
GROUP BY f.codigo;

-- 22 
SELECT 
  f.codigo AS id_fabricante,
  AVG(p.precio) AS precio_medio
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo;

-- 23
SELECT 
  f.nombre AS nombre_fabricante,
  AVG(p.precio) AS precio_medio
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo;

-- 24 
SELECT 
  f.nombre AS nombre_fabricante
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
HAVING AVG(p.precio) >= 150;

-- 25
SELECT 
  f.nombre AS nombre_fabricante
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
HAVING COUNT(p.codigo) >= 2;

-- 26
SELECT 
  f.nombre AS nombre_fabricante,
  COUNT(p.codigo) AS total_productos
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.precio >= 220
GROUP BY f.codigo;

-- 27
SELECT 
  f.nombre AS nombre_fabricante,
  COALESCE(COUNT(p.codigo), 0) AS total_productos
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante AND p.precio >= 220
GROUP BY f.codigo;

-- 28
SELECT 
  f.nombre AS nombre_fabricante
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
HAVING SUM(p.precio) > 1000;

-- 29
SELECT 
  p.nombre AS nombre_producto,
  p.precio,
  f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE p.precio = (
  SELECT MAX(precio)
  FROM producto
  WHERE codigo_fabricante = f.codigo
)
ORDER BY f.nombre ASC;


-- 1.1.7.1
SELECT * FROM producto WHERE fabricante_id = (
  SELECT id FROM fabricante WHERE nombre = 'Lenovo'
);

SELECT * FROM producto WHERE precio = (
  SELECT MAX(precio) FROM producto WHERE fabricante_id = (
    SELECT id FROM fabricante WHERE nombre = 'Lenovo'
  )
);

SELECT nombre FROM producto WHERE precio = (
  SELECT MAX(precio) FROM producto WHERE fabricante_id = (
    SELECT id FROM fabricante WHERE nombre = 'Lenovo'
  )
) AND fabricante_id = (
  SELECT id FROM fabricante WHERE nombre = 'Lenovo'
);

SELECT nombre FROM producto WHERE precio = (
  SELECT MIN(precio) FROM producto WHERE fabricante_id = (
    SELECT id FROM fabricante WHERE nombre = 'Hewlett-Packard'
  )
) AND fabricante_id = (
  SELECT id FROM fabricante WHERE nombre = 'Hewlett-Packard'
);

SELECT * FROM producto WHERE precio >= (
  SELECT MAX(precio) FROM producto WHERE fabricante_id = (
    SELECT id FROM fabricante WHERE nombre = 'Lenovo'
  )
);

SELECT * FROM producto WHERE fabricante_id = (
  SELECT id FROM fabricante WHERE nombre = 'Asus'
) AND precio > (
  SELECT AVG(precio) FROM producto WHERE fabricante_id = (
    SELECT id FROM fabricante WHERE nombre = 'Asus'
  )
);

-- 1.1.7.2
SELECT * FROM producto p1
WHERE precio >= ALL (
  SELECT precio FROM producto
);

SELECT * FROM producto p1
WHERE precio <= ALL (
  SELECT precio FROM producto
);

SELECT nombre FROM fabricante
WHERE id = ANY (
  SELECT fabricante_id FROM producto
);

SELECT nombre FROM fabricante
WHERE id <> ALL (
  SELECT fabricante_id FROM producto
);

-- 1.1.7.3
SELECT nombre FROM fabricante
WHERE id IN (
  SELECT fabricante_id FROM producto
);

SELECT nombre FROM fabricante
WHERE id NOT IN (
  SELECT fabricante_id FROM producto
);

-- 1.1.7.4
SELECT nombre FROM fabricante f
WHERE EXISTS (
  SELECT 1 FROM producto p WHERE p.fabricante_id = f.id
);

SELECT nombre FROM fabricante f
WHERE NOT EXISTS (
  SELECT 1 FROM producto p WHERE p.fabricante_id = f.id
);

-- 1.1.7.5
SELECT f.nombre AS fabricante, p.nombre AS producto, p.precio
FROM fabricante f
JOIN producto p ON p.fabricante_id = f.id
WHERE p.precio = (
  SELECT MAX(p2.precio) FROM producto p2 WHERE p2.fabricante_id = f.id
);

SELECT * FROM producto p1
WHERE precio >= (
  SELECT AVG(p2.precio) FROM producto p2 WHERE p2.fabricante_id = p1.fabricante_id
);

SELECT nombre FROM producto
WHERE precio = (
  SELECT MAX(precio) FROM producto WHERE fabricante_id = (
    SELECT id FROM fabricante WHERE nombre = 'Lenovo'
  )
) AND fabricante_id = (
  SELECT id FROM fabricante WHERE nombre = 'Lenovo'
);

-- 1.1.8
SELECT nombre FROM fabricante
WHERE id IN (
  SELECT fabricante_id FROM producto
  GROUP BY fabricante_id
  HAVING COUNT(*) = (
    SELECT COUNT(*) FROM producto
    WHERE fabricante_id = (
      SELECT id FROM fabricante WHERE nombre = 'Lenovo'
    )
  )
);
