-- Active: 1749813797455@@127.0.0.1@3307@Empresa

--  Obtener Cliente 
DELIMITER $$
CREATE PROCEDURE getCliente(IN c_id INT)
BEGIN
    SELECT * FROM cliente WHERE id = c_id;
END $$

DELIMITER ;

CALL `getCliente`(1)

-- Obtener Libro

DELIMITER $$

CREATE PROCEDURE getLibro(IN l_id INT)
BEGIN
    SELECT * FROM libros WHERE id = l_id;
END $$

DELIMITER ;

CALL `getLibro`(1)

-- Obtener Ordenes

DELIMITER $$

CREATE PROCEDURE getOrdenes(IN o_id INT)
BEGIN
    SELECT * FROM ordenes WHERE id = o_id;
END $$

DELIMITER ;

CALL `getOrdenes`(1)


-- Agregar Cliente

DELIMITER $$
CREATE PROCEDURE addCliente(IN c_nombre VARCHAR(100), c_telefono VARCHAR(11), c_barrio VARCHAR(150), c_ciudad VARCHAR(150))
BEGIN
    INSERT INTO cliente(nombre,telefono,barrio,ciudad) VALUES(c_nombre,c_telefono,c_barrio,c_ciudad);

    SELECT CONCAT('Ahora hay ',COUNT(id),' Clientes')
    AS 'Resultado' FROM cliente;
END $$

DELIMITER ;

CALL `addCliente`('Juliana','el pepe','mickecrack', 'Bucaramanchester :v')

-- Saludar Ciente
DELIMITER $$

CREATE PROCEDURE searchCliente(IN c_nombre VARCHAR(100))
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe
    FROM cliente
    WHERE nombre = c_nombre;
    IF existe > 0 THEN
        SELECT CONCAT('Bienvenido ', nombre) AS Saludo
        FROM cliente
        WHERE nombre = c_nombre;
    ELSE
        SELECT 'Cliente no existe' AS `No Existe`;
    END IF;
END $$

DELIMITER ;

-- Ejecutar el procedimiento
CALL searchCliente('Nicolas Muskus Tarazona');

-- Verificar Libro

DELIMITER $$

CREATE PROCEDURE searchLibro(IN l_nombre VARCHAR(100))
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe
    FROM libros
    WHERE titulo = l_nombre;
    IF existe > 0 THEN
        SELECT CONCAT('Libro Titulo: ', titulo) AS Titulo
        FROM libros
        WHERE titulo = l_nombre;
    ELSE
        SELECT 'Libro no existe' AS `No Existe`;
    END IF;
END $$

DELIMITER ;

CALL searchLibro('Principito');


-- Libros Con sus respectivos mensajes

DELIMITER $$

CREATE PROCEDURE moneyLibro(IN mn_libro DECIMAL(10,2))
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe
    FROM libros
    WHERE precio = mn_libro;
    IF existe > 0 THEN
        IF mn_libro >= 100.00 THEN 
            SELECT CONCAT('Libro Gran Valor ', mn_libro) AS mensaje;
        ELSEIF mn_libro >= 30.00 THEN 
            SELECT CONCAT('Libro Medio Valor ', mn_libro) AS mensaje;
        ELSEIF mn_libro >= 1.00 THEN 
            SELECT CONCAT('Libro Pequeño Valor ', mn_libro) AS mensaje;
        ELSE
            SELECT 'Precio inválido (menor que 1)' AS mensaje;
        END IF;
    ELSE
        SELECT 'Libro no existe en la base de datos' AS mensaje;
    END IF;
END $$

DELIMITER ;

CALL moneyLibro(30.00);

-- Actualizar Libro

DELIMITER $$
CREATE PROCEDURE editLibro(IN l_id INT,l_titulo VARCHAR(100), l_precio DECIMAL(10,2))
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe
    FROM libros
    WHERE `id` = l_id;
    IF existe > 0 THEN
        UPDATE libros
        SET titulo = l_titulo , precio = l_precio
        WHERE `id` = l_id;
        SELECT CONCAT('Libro Actualizado')
        AS 'Resultado';
    ELSE
        SELECT 'Libro no existe en la base de datos' AS mensaje;
    END IF;
END $$

DELIMITER ;

CALL `editLibro`(2,'asasdasasd', 60.00)

-- Actualizar Cliente 

DELIMITER $$

CREATE PROCEDURE editCliente(IN c_id INT, c_nombre VARCHAR(100), c_barrio VARCHAR(150))
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe
    FROM cliente
    WHERE `id` = c_id;

    IF existe > 0 THEN
        UPDATE cliente
        SET nombre = c_nombre , barrio = c_barrio
        WHERE `id` = c_id;
        SELECT CONCAT('Cliente Actualizado')
        AS 'Resultado';

    ELSE
        SELECT 'Cliente no existe en la base de datos' AS mensaje;
    END IF;

END $$

DELIMITER ; 

CALL `editCliente`(1,'L.L','Britania')

-- Actualizar Ordenes

DELIMITER $$

CREATE PROCEDURE editOrdenes(IN o_id INT, o_fecha DATE)
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe
    FROM ordenes
    WHERE id = o_id;

    IF existe > 0 THEN
        UPDATE ordenes
        SET fecha = o_fecha
        WHERE id = o_id;
        SELECT CONCAT('Orden Actualizada')
        AS 'Resultado';

    ELSE
        SELECT 'Orden no existe en la base de datos' AS mensaje;
    END IF;

END $$

DELIMITER ;

CALL `editOrdenes`(1,'2000-01-01')

-- Sumar todos los precios de los libros
DELIMITER $$

DROP FUNCTION IF EXISTS fn_calcular_libros $$

CREATE FUNCTION fn_calcular_libros()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(precio) INTO total
    FROM libros;

    RETURN total;
END $$

DELIMITER;

SELECT fn_calcular_libros() AS Total_Precios;

