-- 1. INSERTING DATA
INSERT INTO dbo.Table_1 (Nombre, fecha_alta, fecha_baja, color_favorito)
VALUES ('Antonio', '2023-04-01', NULL, 'Blue');
GO

INSERT INTO clientes (nombre, apellidos, fecha_registro, saldo)
VALUES ('Jose Julian', 'P.G', '2023-06-26', 85900);
GO

INSERT INTO empleados (nombre, apellidos, fecha_ingreso, fecha_salida, activo)
VALUES ('Adrian', 'Gil Montañez', GETDATE(), NULL, 0);
GO

-- 2. BASIC SELECT & FILTERS
SELECT * FROM articulos WHERE precio > 10;
SELECT * FROM articulos WHERE seccion IN (1, 2, 4, 5);
USE almacen;
GO
SELECT * FROM articulos WHERE precio > 1;
SELECT * FROM articulos WHERE precio <> 4.3;
SELECT * FROM articulos WHERE precio >= 4 AND seccion = 2;
SELECT * FROM articulos WHERE precio >= 4 OR seccion = 3;
SELECT * FROM articulos WHERE NOT (seccion = 3);
SELECT * FROM articulos WHERE seccion <> 3;
SELECT * FROM articulos WHERE seccion IN (1, 2, 3, 4, 5);
SELECT * FROM articulos WHERE precio BETWEEN 1 AND 4;

-- 3. PATTERN MATCHING
SELECT * FROM clientes WHERE nombre LIKE '%Julian%';

-- 4. CASE STATEMENTS
SELECT *,
       CASE cantidad_existencias
           WHEN 0 THEN 'Out of stock, reorder.'
           ELSE 'In stock'
       END AS StockStatus
FROM articulos;

SELECT *,
       CASE cantidad_existencias
           WHEN 0 THEN 'Out of stock, reorder.'
           WHEN 3 THEN 'Almost out, reorder soon.'
           ELSE 'Stock available'
       END AS StockInfo,
       CASE seccion
           WHEN 1 THEN 'Order from this section.'
           WHEN 2 THEN 'Do not order this week.'
           ELSE 'Stock status pending'
       END AS SectionNote
FROM articulos;

-- 5. ORDERING
SELECT * FROM clientes ORDER BY nombre ASC, apellidos DESC;

-- 6. GROUP BY & AGGREGATION
SELECT seccion, SUM(cantidad_existencias) AS TotalStock
FROM articulos
GROUP BY seccion;

SELECT seccion, SUM(cantidad_existencias) AS TotalStock
FROM articulos
WHERE seccion IN (1, 3)
GROUP BY seccion;

-- 7. VARIABLES AND CONDITIONS
DECLARE @quantity INT;
SELECT @quantity = SUM(cantidad_existencias) FROM articulos WHERE seccion = 1;
SELECT @quantity;

IF @quantity > 50
BEGIN
    PRINT 'Stock is greater than 50';
END;

IF @quantity > 100
BEGIN
    PRINT 'Stock is greater than 100';
    SET @quantity = 0;
END
ELSE
BEGIN
    PRINT 'Stock is less than or equal to 100';
    SET @quantity = 0;
END;

-- 8. WHILE LOOP AND RANDOM
DECLARE @random FLOAT;
DECLARE @counter INT = 0;

WHILE (@counter <= 15)
BEGIN
    SET @random = RAND() * 10;
    PRINT @random;
    SET @counter = @counter + 1;
END;

PRINT 'Condition no longer met. Loop ended.';

-- 9. GOTO EXAMPLE
DECLARE @loopCounter INT = 0;

StartLabel:
    SET @loopCounter = @loopCounter + 1;
    PRINT 'Counter: ' + CAST(@loopCounter AS VARCHAR(10));

IF @loopCounter < 5
BEGIN
    GOTO StartLabel;
END;

PRINT 'Completed';

-- 10. JOINS AND DATA RETRIEVAL
USE almacen;
GO

SELECT * FROM clientes AS cli;

SELECT *
FROM ventas_bebidas AS ventas
INNER JOIN camareros AS cam ON cam.id = ventas.id;

SELECT e.id, e.nombre, e.apellidos, f.tipo_fichaje, f.fecha_y_hora
FROM empleados AS e
LEFT JOIN fichaje_empleados AS f ON f.id_empleado = e.id;

-- 11. SUBQUERIES
SELECT id, codigo_de_barras, descripcion
FROM articulos
WHERE id IN (
    SELECT DISTINCT id_articulo
    FROM ventas
    WHERE fecha = '2023-06-01'
);

-- 12. TEMPORARY TABLE
CREATE TABLE #Empleados (
    id INT,
    nombre NVARCHAR(100),
    salario DECIMAL(10, 2)
);

INSERT INTO #Empleados (id, nombre, salario)
VALUES (1, 'Juan Perez', 150.00), (2, 'Ana Lopez', 1800.00);

SELECT * FROM #Empleados;

-- 13. STRING FUNCTIONS
SELECT NCHAR(65) AS CharA;
SELECT ASCII('A') AS AsciiCode;
SELECT LEN('Hello World') AS StringLength;