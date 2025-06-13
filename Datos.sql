-- Active: 1749813797455@@127.0.0.1@3307@Empresa
INSERT INTO `cliente` (nombre,telefono, barrio, ciudad) VALUES
('Nicolas Muskus Tarazona', '+57 325325', 'Carrizal',    'Giron'        ),
('Danilo Muskus Tarazona',  '+57 341237', 'Carrizal',    'Giron'        ),
('Danna Sofia Arias Rojas', '+57 123912', 'Nuevo Giron', 'Giron'        ),
('Darwin Samuel Machuca',   '+57 346512', 'Norte BGA',   'Bucaramanga'  ),
('Julian Montañez',         '+57 323523', 'Nuevo Giron', 'Giron'        ),
('Sara Sofia Hernandez',    '+57 581232', 'Nuevo Giron', 'Giron'        )

INSERT INTO `libros` (titulo,autor,precio) VALUES
('Principito', 'Daddy Yanki', 100.00 ),
('Pepito', 'V', 20.00),
('Salchicas', 'D', 1.00),
('Luna', 'Miguel', 200.00 ),
('Carros de carruzeles', 'cucak', 30.00),
('EL pepe', 'Ete secht', 1.00)

INSERT INTO `ordenes` (cliente_id, libro_id, fecha) VALUES
(1, 2, '2025-01-15'),
(2, 1, '2025-04-25'),
(3, 3, '2025-03-25'),
(1, 1, '2025-02-10'),
(2, 3, '2025-01-07'),
(1, 2, '2025-05-30');

INSERT INTO `factura`(orden_id,fecha,total,estado) VALUES
(1,'2025-01-15',12.00,'pendite'),
(2,'2025-05-30',21.00,'realizado'),
(3,'2025-02-06',3.00,'cancelado')

INSERT INTO `separador` (precio, Color) VALUES
(5.50, 'rojo'),
(3.99, 'azul'),
(4.25, 'verde'),
(6.75, 'negro'),
(2.50, 'blanco'),
(7.80, 'morado'),
(1.99, 'amarillo'),
(8.30, 'rosado'),
(3.40, 'naranja'),
(4.75, 'gris');