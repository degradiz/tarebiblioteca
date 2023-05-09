CREATE SCHEMA Biblioteca;

USE Biblioteca;

CREATE TABLE `Usuarios` (
    `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
    `Nombre` varchar(30) NOT NULL,
    `Apellidos` varchar(50) NOT NULL,
    `Edad` int(11) NOT NULL,
    `Direccion` varchar(100) NOT NULL,
    `Ciudad` varchar(30) NOT NULL,
    `CorreoElectronico` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`idUsuario`)
) ENGINE = InnoDB;

CREATE TABLE Libros (
    `idLibro` int(11) NOT NULL AUTO_INCREMENT,
    `Titulo` varchar(30) NOT NULL,
    `Autor` varchar(50) NOT NULL,
    `Genero` varchar(30) DEFAULT NULL,
    `FechaEntrada` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON       UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`idLibro`)
) ENGINE = InnoDB;

CREATE TABLE Alquileres (
    `idAlquiler` int(11) NOT NULL AUTO_INCREMENT,
    `idUsuario` int(11) NOT NULL,
    `idLibro` int(11) NOT NULL,
    `FechaAlquiler` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON       UPDATE CURRENT_TIMESTAMP,
    `Devuelto` tinyint(1) DEFAULT NULL,
    PRIMARY KEY (`idAlquiler`),
    KEY `Usuario` (`idUsuario`),
    KEY `Libro` (`idLibro`),
    CONSTRAINT `Libro` FOREIGN KEY (`idLibro`) REFERENCES `Libros` (`idLibro`),
    CONSTRAINT `Usuario` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuario`)
) ENGINE = InnoDB;