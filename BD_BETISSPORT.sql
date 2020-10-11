-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.12-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para betissport
CREATE DATABASE IF NOT EXISTS `betissport` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `betissport`;

-- Volcando estructura para tabla betissport.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `nit_cliente` varchar(50) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`nit_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla de los clientes';

-- Volcando datos para la tabla betissport.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla betissport.detalle_venta
clienteCREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `total_producto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `fk_detalle_venta` (`id_venta`),
  KEY `fk_detalle_producto` (`id_producto`),
  CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla del detalle de las ventas';

-- Volcando datos para la tabla betissport.detalle_venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;

-- Volcando estructura para tabla betissport.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  `precio_compra` decimal(10,2) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `nit_proveedor` varchar(50) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_proveedor` (`nit_proveedor`),
  CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`nit_proveedor`) REFERENCES `proveedor` (`nit_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='tabla de productos';

-- Volcando datos para la tabla betissport.producto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla betissport.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `nit_proveedor` varchar(50) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`nit_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla de proveedores';

-- Volcando datos para la tabla betissport.proveedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla betissport.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `nit_cliente` varchar(50) DEFAULT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  `total_venta` decimal(10,2) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_venta_cliente` (`nit_cliente`),
  CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`nit_cliente`) REFERENCES `cliente` (`nit_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla de las ventas';


-- Volcando datos para la tabla betissport.venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;


-- Se pueden seleccionar de varias tablas

SELECT cl.nombre AS `Cliente`, pv.nombre AS `Proveedor` FROM `CLIENTE` cl, `PROVEEDOR` pv
WHERE cl.activo = pv.activo
