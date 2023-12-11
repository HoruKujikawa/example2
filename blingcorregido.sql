-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bling_o
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detalles_pedido`
--

DROP TABLE IF EXISTS `detalles_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles_pedido` (
  `id_detalles_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_producto` int(11) DEFAULT NULL,
  `fk_id_pedido` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_detalles_pedido`),
  KEY `fk_id_producto` (`fk_id_producto`),
  KEY `fk_id_pedido` (`fk_id_pedido`),
  CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`fk_id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`fk_id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_pedido`
--

LOCK TABLES `detalles_pedido` WRITE;
/*!40000 ALTER TABLE `detalles_pedido` DISABLE KEYS */;
INSERT INTO `detalles_pedido` VALUES (1,1,1,1),(2,2,1,4),(3,3,2,3),(4,4,2,4),(5,5,3,5),(6,6,3,8),(7,7,4,4),(8,8,4,2),(9,9,5,5),(10,10,5,10);
/*!40000 ALTER TABLE `detalles_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `cantidad_disponible` int(11) NOT NULL,
  `referencia` varchar(40) NOT NULL,
  `fk_cod_vendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `fk_cod_vendedor` (`fk_cod_vendedor`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`fk_cod_vendedor`) REFERENCES `vendedor` (`cod_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,100,'2023-11-22',90,'INV-0001',111111),(2,80,'2023-11-22',70,'INV-0002',222222),(3,60,'2023-11-22',50,'INV-0003',333333),(4,40,'2023-11-22',30,'INV-0004',444444),(5,20,'2023-11-22',10,'INV-0005',555555),(6,150,'2023-11-22',140,'INV-0006',666666),(7,120,'2023-11-22',110,'INV-0007',777777),(8,90,'2023-11-22',80,'INV-0008',888888),(9,60,'2023-11-22',50,'INV-0009',999999),(10,30,'2023-11-22',20,'INV-0010',101010);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL,
  `fecha_pago` date NOT NULL,
  `fk_id_venta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `fk_id_venta` (`fk_id_venta`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`fk_id_venta`) REFERENCES `venta` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1000,'2023-11-22',1),(2,2000,'2023-11-23',2),(3,3000,'2023-11-24',3),(4,4000,'2023-11-25',4),(5,5000,'2023-11-26',5),(6,6000,'2023-11-27',6),(7,7000,'2023-11-28',7),(8,8000,'2023-11-29',8),(9,9000,'2023-11-30',9),(10,10000,'2023-12-01',10);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `metodo_de_pago` varchar(30) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fk_id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_id_usuario` (`fk_id_usuario`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2023-10-04','Tarjeta','En proceso',1),(2,'2023-10-05','Efectivo','Completado',1),(3,'2023-10-06','Tarjeta','Cancelado',3),(4,'2023-10-07','Efectivo','En proceso',1),(5,'2023-10-08','Tarjeta','Completado',5),(6,'2023-10-09','Efectivo','Cancelado',3),(7,'2023-10-10','Tarjeta','En proceso',7),(8,'2023-10-11','Efectivo','Completado',5),(9,'2023-10-12','Tarjeta','Cancelado',9),(10,'2023-10-13','Efectivo','En proceso',3);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `talla` varchar(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descripcion` varchar(40) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `categorias` varchar(30) NOT NULL,
  `precio_unitario` int(50) NOT NULL,
  `fk_id_inventario` int(11) DEFAULT NULL,
  `fk_id_venta` int(11) DEFAULT NULL,
  `fk_id_pedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_id_venta` (`fk_id_venta`),
  KEY `fk_id_inventario` (`fk_id_inventario`),
  KEY `fk_id_pedido` (`fk_id_pedido`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`fk_id_venta`) REFERENCES `venta` (`id_venta`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`fk_id_inventario`) REFERENCES `inventario` (`id_inventario`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`fk_id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'37','blanco',10,'Zapatillas deportivas para mujer ','Zapatillas Nike Air Force 1','Nike','Nuevo','dama',100000,1,1,1),(2,'38','negro',15,'Zapatillas deportivas para hombre','Zapatillas Adidas Superstar','Adidas','Nuevo','caballero',80000,2,2,2),(3,'39','azul',20,'Zapatilla deportiva nueva colección','Zapatillas Puma Suede','Puma','Nuevo','dama',120000,3,3,3),(4,'40','rosa',25,'Zapatillas deportiva y casual','Zapatillas Converse Chuck Taylor All Sta','Converse','Nuevo','dama',90000,4,4,4),(5,'41','rojo',30,'Zapatillas deportivas ideales para el gy','Zapatillas Vans Old Skool','Vans','Nuevo','caballero',150000,5,5,5),(6,'42','amarillo',35,'Zapatillas con luces','Zapatillas New Balance 574','New Balance','Nuevo','niño',96000,6,6,6),(7,'43','verde',40,'Zapato casual','Zapatillas Fila Disruptor II','Fila','Nuevo','dama',110000,7,7,7),(8,'44','gris',45,'mocasine casual','Zapatillas Asics Gel-Kayano','Asics','Nuevo','caballero',200000,8,8,8),(9,'45','marron',50,'Zapatillas deportivas en tela','Zapatillas Jordan 1 Mid','Jordan','Nuevo','dama',160000,9,9,9),(10,'35','negro con blanco',79,'zapatilla deportiva ','croydon edicion 3 ','croydon','nuevo','caballero',200000,10,10,10);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `estado_del_rol` varchar(30) NOT NULL,
  `fk_id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'vendedor','Activo',1),(2,'cliente','Activo',2),(3,'Vendedor','Activo',3),(4,'Cliente','Activo',4),(5,'cliente','Activo',5),(6,'vendedor','Activo',6),(7,'cliente','Activo',7),(8,'vendedor','Activo',8),(9,'cliente','Activo',9),(10,'vendedor','Activo',10);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transacciones` (
  `id_transaccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_pago` int(11) NOT NULL,
  `nombre_propietario` varchar(80) NOT NULL,
  `metodo_pago` varchar(30) NOT NULL,
  `cedula` int(30) NOT NULL,
  `numero_Tarjeta` int(30) NOT NULL,
  `codigo_seguridad` int(30) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `fk_id_pago` (`id_pago`),
  CONSTRAINT `fk_23` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`),
  CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (1,1,'emilio contreras','Tarjeta',1031124195,456723456,4567,'2023-11-30'),(2,2,'sara camila','Tarjeta',402726897,173527667,1264,'2023-11-29'),(3,3,'camilo cuesta','Tarjeta',1735264186,253854976,3456,'2023-11-28'),(4,4,'julian sanchez','Tarjeta',1842267386,264815389,2590,'2023-11-27'),(5,5,'cristian sanchez','Tarjeta',1723196256,269154925,3476,'2023-11-26'),(6,6,'luz mary gonzalez','Efectivo',1962319174,142948383,2134,'2023-11-26'),(7,7,'ana maria vasquez','Tarjeta',1846286296,189352864,6578,'2023-11-28'),(8,8,'juan david ruiz','Efectivo',1964725398,364982573,9945,'2023-11-29'),(9,9,'dayancy bermudez','Tarjeta',1863257146,587149264,4567,'2023-11-30'),(10,10,'wiliam rondon','Efectivo',1963257498,352986267,5623,'2023-11-28');
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uso_roles`
--

DROP TABLE IF EXISTS `uso_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uso_roles` (
  `id_uso_roles` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_usuario` int(11) DEFAULT NULL,
  `fk_id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_uso_roles`),
  KEY `fk_id_usuario` (`fk_id_usuario`),
  KEY `fk_id_rol` (`fk_id_rol`),
  CONSTRAINT `uso_roles_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `uso_roles_ibfk_2` FOREIGN KEY (`fk_id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uso_roles`
--

LOCK TABLES `uso_roles` WRITE;
/*!40000 ALTER TABLE `uso_roles` DISABLE KEYS */;
INSERT INTO `uso_roles` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `uso_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `fecha_de_nacimiento` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `tipo_usuario` varchar(30) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan','Perez',1234567890,'Calle 123, No. 456','1980-01-01','juanperez@gmail.com','Activo','cliente'),(2,'Maria','Lopez',2147483647,'Calle 789, No. 123','1985-02-02','maria.lopez@hotmail.com','Activo','vendedor'),(3,'Pedro','Gomez',1122334455,'Calle 456, No. 789','1990-03-03','pedrogomez@yahoo.com','Activo','Cliente'),(4,'Ana','Garcia',2147483647,'Calle 123, No. 456','1995-04-04','ana.garcia@outlook.com','Activo','vendedor'),(5,'Luis','Sanchez',2147483647,'Calle 789, No. 123','2000-05-05','luis.sanchez@gmail.com','Activo','Cliente'),(6,'Sandra','Martinez',2147483647,'Calle 456, No. 789','2005-06-06','sandra.martinez@hotmail.com','Activo','vendedor'),(7,'Daniel','Romero',2147483647,'Calle 123, No. 456','2010-07-07','daniel.romero@yahoo.com','Activo','Cliente'),(8,'Evelyn','Ramirez',1122334455,'Calle 789, No. 123','2015-08-08','evelyn.ramirez@outlook.com','Activo','vendedor'),(9,'Carlos','Aguirre',2147483647,'Calle 456, No. 789','2020-09-09','carlos.aguirre@gmail.com','Activo','Cliente'),(10,'Patricia','Ortega',2147483647,'Calle 123, No. 456','2022-10-10','patricia.ortega@hotmail.com','Activo','vendedor');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor` (
  `cod_vendedor` int(30) NOT NULL,
  `fk_id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_vendedor`),
  KEY `fk_id_usuario` (`fk_id_usuario`),
  CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (111111,2),(222222,4),(333333,6),(444444,8),(101010,10),(555555,10),(666666,10),(777777,10),(888888,10),(999999,10);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(40) NOT NULL,
  `fecha` date NOT NULL,
  `Total_cantidad` int(15) NOT NULL,
  `Total_venta` int(60) NOT NULL,
  `fk_cod_vendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_cod_vendedor` (`fk_cod_vendedor`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`fk_cod_vendedor`) REFERENCES `vendedor` (`cod_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'realizada','2023-11-22',10,1000000,111111),(2,'realizada','2023-11-23',20,2000000,222222),(3,'realizada','2023-11-24',30,3000000,333333),(4,'realizada','2023-11-25',40,4000000,444444),(5,'realizada','2023-11-26',50,5000000,555555),(6,'realizada','2023-11-27',60,6000000,666666),(7,'realizada','2023-11-28',70,7000000,777777),(8,'realizada','2023-11-29',80,8000000,888888),(9,'realizada','2023-11-30',90,9000000,999999),(10,'realizada','2023-12-01',100,1000000,101010);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23 17:04:18
