-- Active: 1749763347088@@127.0.0.1@3307@Empresa

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

