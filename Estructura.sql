-- Active: 1749763347088@@127.0.0.1@3307
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
    `libro_id` INT NOT NULL,
    `fecha` DATE NOT NULL,
    INDEX(`cliente_id`, `libro_id`)
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

-- RELACIONES
ALTER TABLE `factura` ADD FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`id`); -- UNIQUE 1 A 1 (PRIORIZAR 1 A 1 ) ANTE LAS DEMAS RELACIONES
-- mas arriba del codigo mejor

ALTER TABLE `ordenes` ADD FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

ALTER TABLE `ordenes` ADD FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`);
