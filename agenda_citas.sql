-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.21.0.7344
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para agenda_citas
CREATE DATABASE IF NOT EXISTS `agenda_citas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `agenda_citas`;

-- Volcando estructura para tabla agenda_citas.automoviles
CREATE TABLE IF NOT EXISTS `automoviles` (
  `automovil_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int(10) unsigned NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `anio` year(4) DEFAULT NULL,
  `no_serie` varchar(17) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `placas` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`automovil_id`),
  KEY `idx_no_serie` (`no_serie`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `automoviles_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agenda_citas.automoviles: ~0 rows (aproximadamente)
INSERT INTO `automoviles` (`automovil_id`, `cliente_id`, `marca`, `modelo`, `anio`, `no_serie`, `color`, `placas`) VALUES
	(1, 1, 'Seat', 'Ibiza', '2026', 'ABC0123456', 'Rojo', 'ABC123A'),
	(2, 2, 'Seat', 'Arona', '2026', 'XYZ9876543', 'Azul', 'XYZ456B'),
	(3, 3, 'Seat', 'Ibiza', '2026', 'ABC0123456', 'Rojo', 'ABC123A'),
	(4, 4, 'Seat', 'Arona', '2026', 'XYZ9876543', 'Azul', 'XYZ456B');

-- Volcando estructura para tabla agenda_citas.citas
CREATE TABLE IF NOT EXISTS `citas` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agenda_citas.citas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla agenda_citas.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `cliente_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `idx_correo` (`correo_electronico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agenda_citas.clientes: ~0 rows (aproximadamente)
INSERT INTO `clientes` (`cliente_id`, `nombre`, `apellido`, `telefono`, `correo_electronico`, `fecha_nacimiento`) VALUES
	(1, 'Gabriel', 'Pat', '9981234567', 'gabriel@email.com', '2000-01-01'),
	(2, 'Keith', 'Aranda', '9987654321', 'keith@email.com', '2001-01-01'),
	(3, 'Gabriel', 'Pat', '9981234567', 'gabriel@email.com', '2000-01-01'),
	(4, 'Keith', 'Aranda', '9987654321', 'keith@email.com', '2001-01-01');

-- Volcando estructura para tabla agenda_citas.servicio_automoviles
CREATE TABLE IF NOT EXISTS `servicio_automoviles` (
  `servicio_automovil_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `servicio_id` int(10) unsigned NOT NULL,
  `automovil_id` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `kilometraje` int(10) unsigned DEFAULT NULL,
  `placas` varchar(15) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`servicio_automovil_id`),
  KEY `servicio_id` (`servicio_id`),
  KEY `automovil_id` (`automovil_id`),
  CONSTRAINT `servicio_automoviles_ibfk_1` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`servicio_id`),
  CONSTRAINT `servicio_automoviles_ibfk_2` FOREIGN KEY (`automovil_id`) REFERENCES `automoviles` (`automovil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agenda_citas.servicio_automoviles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla agenda_citas.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `servicio_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `incluye` text DEFAULT NULL,
  PRIMARY KEY (`servicio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agenda_citas.servicios: ~0 rows (aproximadamente)
INSERT INTO `servicios` (`servicio_id`, `nombre`, `incluye`) VALUES
	(1, 'Servicio menor', 'Cambio de aceite, revisión general y niveles'),
	(2, 'Servicio mayor', 'Servicio completo, filtros, aceite y revisión general'),
	(3, 'Servicio menor', 'Cambio de aceite, revisión general y niveles'),
	(4, 'Servicio mayor', 'Servicio completo, filtros, aceite y revisión general');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
