-- Active: 1749813797455@@127.0.0.1@3307@Empresa
DROP DATABASE Empresa;
CREATE DATABASE Empresa;
USE Empresa;
CREATE TABLE `cliente`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
    `telefono` VARCHAR(11) NOT NULL,
    `barrio` VARCHAR(150) NOT NULL,
    `ciudad` VARCHAR(150) NOT NULL
);

CREATE TABLE `ordenes`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cliente_id` INT NOT NULL,
    `ordenes_separador_id` INT NOT NULL,
    `libro_id` INT NOT NULL,
    `fecha` DATE NOT NULL,
    INDEX(`cliente_id`, `libro_id`, `ordenes_separador_id`)
);

CREATE TABLE `libros`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `titulo` VARCHAR(100) NOT NULL,
    `autor` VARCHAR(100)     NOT NULL,
    `precio` DECIMAL(10,2) NOT NULL
);

CREATE TABLE `factura` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `orden_id` INT UNIQUE, -- UNIQUE 1 A 1
    `fecha` DATE NOT NULL,
    `total` DECIMAL(10,2) NOT NULL,
    `estado` VARCHAR(20) DEFAULT 'pendiente',
    INDEX(`orden_id`)
);

CREATE TABLE `ordenes_separador`(
    `orden_id` INT NOT NULL,
    `separador_id` INT NOT NULL,
    `cantidad` INT DEFAULT 1,
    INDEX(`orden_id`, `separador_id`)
);


CREATE TABLE `separador`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `precio` DECIMAL(10,2) NOT NULL,
    `Color` VARCHAR(60) DEFAULT 'negro'
);

-- RELACIONES
ALTER TABLE `factura` ADD FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`id`); -- UNIQUE 1 A 1 (PRIORIZAR 1 A 1 ) ANTE LAS DEMAS RELACIONES
-- mas arriba del codigo mejor

ALTER TABLE `ordenes_separador` ADD FOREIGN KEY (`orden_id`) REFERENCES `ordenes`(`id`);

ALTER TABLE `ordenes_separador` ADD FOREIGN KEY (`separador_id`) REFERENCES `separador`(`id`);

ALTER TABLE `ordenes` ADD FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

ALTER TABLE `ordenes` ADD FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`);
