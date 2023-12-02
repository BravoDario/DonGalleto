-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: don_galleto
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `idDetalle_venta` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `tipo_venta` int NOT NULL,
  `idGalleta` int NOT NULL,
  PRIMARY KEY (`idDetalle_venta`),
  KEY `idGalleta` (`idGalleta`),
  CONSTRAINT `idGalleta` FOREIGN KEY (`idGalleta`) REFERENCES `galleta` (`idGalleta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,5,1,1),(2,10,2,2),(3,8,1,3),(4,15,2,4),(5,12,1,5),(6,6,2,6),(7,9,1,7),(8,7,2,8),(9,11,1,9),(10,14,2,10);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleta`
--

DROP TABLE IF EXISTS `galleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleta` (
  `idGalleta` int NOT NULL AUTO_INCREMENT,
  `idInventario` int NOT NULL,
  `nombre` varchar(129) NOT NULL,
  `precio` varchar(129) NOT NULL,
  PRIMARY KEY (`idGalleta`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `fk_galleta_inventario` (`idInventario`),
  CONSTRAINT `fk_galleta_inventario` FOREIGN KEY (`idInventario`) REFERENCES `inventario` (`idInventario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleta`
--

LOCK TABLES `galleta` WRITE;
/*!40000 ALTER TABLE `galleta` DISABLE KEYS */;
INSERT INTO `galleta` VALUES (1,1,'Chocolate','1.50'),(2,2,'vainilla','2.00'),(3,3,'naranja','1.20'),(4,4,'Nuez','2.80'),(5,5,'adornada','2.00'),(6,6,'fresa','1.60'),(7,7,'almendra','1.80'),(8,8,'coco','1.40'),(9,9,'galleta sola','3.00'),(10,10,'azucarada','0.90');
/*!40000 ALTER TABLE `galleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `idInventario` int NOT NULL AUTO_INCREMENT,
  `existencia` int NOT NULL,
  PRIMARY KEY (`idInventario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,100),(2,150),(3,200),(4,50),(5,300),(6,120),(7,180),(8,90),(9,250),(10,80);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `inventariogalletas`
--

DROP TABLE IF EXISTS `inventariogalletas`;
/*!50001 DROP VIEW IF EXISTS `inventariogalletas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inventariogalletas` AS SELECT 
 1 AS `idInventario`,
 1 AS `existencia`,
 1 AS `idGalleta`,
 1 AS `nombreGalleta`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `inventariomaterial`
--

DROP TABLE IF EXISTS `inventariomaterial`;
/*!50001 DROP VIEW IF EXISTS `inventariomaterial`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inventariomaterial` AS SELECT 
 1 AS `idInventario`,
 1 AS `existencia`,
 1 AS `idMaterial`,
 1 AS `ingrediente`,
 1 AS `cantidad`,
 1 AS `detalle_cantidad`,
 1 AS `costo_material`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `idMaterial` int NOT NULL AUTO_INCREMENT,
  `idInventario` int NOT NULL,
  `ingrediente` varchar(100) NOT NULL,
  `cantidad` int NOT NULL,
  `detalle_cantidad` varchar(50) NOT NULL,
  `costo_material` float NOT NULL,
  PRIMARY KEY (`idMaterial`),
  KEY `fk_material_inventario` (`idInventario`),
  CONSTRAINT `fk_material_inventario` FOREIGN KEY (`idInventario`) REFERENCES `inventario` (`idInventario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,1,'Harina',10,'kg',5),(2,2,'Azúcar',8,'kg',3),(3,3,'Chocolate',5,'kg',6),(4,4,'Mantequilla',12,'kg',8),(5,5,'Vainilla',7,'L',4),(6,6,'Canela',10,'g',2),(7,7,'Levadura',6,'g',2.5),(8,8,'Sal',9,'g',1.5),(9,9,'Almendras',15,'kg',10),(10,10,'Esencia',4,'L',0.8);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_has_receta`
--

DROP TABLE IF EXISTS `material_has_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_has_receta` (
  `idMateriales_recetas` int NOT NULL AUTO_INCREMENT,
  `idMaterial` int NOT NULL,
  `idReceta` int NOT NULL,
  PRIMARY KEY (`idMateriales_recetas`),
  KEY `fk_material_receta_material` (`idMaterial`),
  KEY `fk_material_receta_receta` (`idReceta`),
  CONSTRAINT `fk_material_receta_material` FOREIGN KEY (`idMaterial`) REFERENCES `material` (`idMaterial`),
  CONSTRAINT `fk_material_receta_receta` FOREIGN KEY (`idReceta`) REFERENCES `receta` (`idReceta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_has_receta`
--

LOCK TABLES `material_has_receta` WRITE;
/*!40000 ALTER TABLE `material_has_receta` DISABLE KEYS */;
INSERT INTO `material_has_receta` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `material_has_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mermagalleta`
--

DROP TABLE IF EXISTS `mermagalleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mermagalleta` (
  `idMermaGalleta` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `idGalleta` int NOT NULL,
  PRIMARY KEY (`idMermaGalleta`),
  KEY `fkIdGalleta` (`idGalleta`),
  CONSTRAINT `fkIdGalleta` FOREIGN KEY (`idGalleta`) REFERENCES `galleta` (`idGalleta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mermagalleta`
--

LOCK TABLES `mermagalleta` WRITE;
/*!40000 ALTER TABLE `mermagalleta` DISABLE KEYS */;
INSERT INTO `mermagalleta` VALUES (1,5,2),(2,4,1),(3,5,3),(4,7,5),(5,2,4),(6,5,6);
/*!40000 ALTER TABLE `mermagalleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mermamaterial`
--

DROP TABLE IF EXISTS `mermamaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mermamaterial` (
  `idMermaMaterial` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `unidad` varchar(10) NOT NULL,
  `idMaterial` int NOT NULL,
  PRIMARY KEY (`idMermaMaterial`),
  KEY `fkIdMaterial` (`idMaterial`),
  CONSTRAINT `fkIdMaterial` FOREIGN KEY (`idMaterial`) REFERENCES `material` (`idMaterial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mermamaterial`
--

LOCK TABLES `mermamaterial` WRITE;
/*!40000 ALTER TABLE `mermamaterial` DISABLE KEYS */;
INSERT INTO `mermamaterial` VALUES (1,100,'GR',1),(2,200,'GR',2),(3,5,'L',10);
/*!40000 ALTER TABLE `mermamaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta` (
  `idReceta` int NOT NULL AUTO_INCREMENT,
  `idGalleta` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `fk_receta_galleta` (`idGalleta`),
  CONSTRAINT `fk_receta_galleta` FOREIGN KEY (`idGalleta`) REFERENCES `galleta` (`idGalleta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,1,50),(2,2,75),(3,3,60),(4,4,90),(5,5,80),(6,6,40),(7,7,55),(8,8,45),(9,9,100),(10,10,30);
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte` (
  `idReporte` int NOT NULL AUTO_INCREMENT,
  `idVenta` int NOT NULL,
  `gasto` float NOT NULL,
  PRIMARY KEY (`idReporte`),
  KEY `fk_reporte_venta` (`idVenta`),
  CONSTRAINT `fk_reporte_venta` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
INSERT INTO `reporte` VALUES (1,1,20.5),(2,2,30),(3,3,15.5),(4,4,35.5),(5,5,25),(6,6,20),(7,7,22.5),(8,8,18),(9,9,42),(10,10,12.5);
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `idDetalle_venta` int NOT NULL,
  `fecha_venta` date NOT NULL,
  `total_venta` int NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `fk_venta_detalle_venta` (`idDetalle_venta`),
  CONSTRAINT `fk_venta_detalle_venta` FOREIGN KEY (`idDetalle_venta`) REFERENCES `detalle_venta` (`idDetalle_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,'2023-01-01',200),(2,2,'2023-01-02',350),(3,3,'2023-01-03',180),(4,4,'2023-01-04',420),(5,5,'2023-01-05',300),(6,6,'2023-01-06',240),(7,7,'2023-01-07',270),(8,8,'2023-01-08',210),(9,9,'2023-01-09',500),(10,10,'2023-01-10',160);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vistamermagalleta`
--

DROP TABLE IF EXISTS `vistamermagalleta`;
/*!50001 DROP VIEW IF EXISTS `vistamermagalleta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistamermagalleta` AS SELECT 
 1 AS `idMermaGalleta`,
 1 AS `cantidad`,
 1 AS `idGalleta`,
 1 AS `nombre`,
 1 AS `precio`,
 1 AS `idInventario`,
 1 AS `existencia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistamermamaterial`
--

DROP TABLE IF EXISTS `vistamermamaterial`;
/*!50001 DROP VIEW IF EXISTS `vistamermamaterial`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistamermamaterial` AS SELECT 
 1 AS `idMermaMaterial`,
 1 AS `cantidad`,
 1 AS `ingrediente`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `inventariogalletas`
--

/*!50001 DROP VIEW IF EXISTS `inventariogalletas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inventariogalletas` AS select `i`.`idInventario` AS `idInventario`,`i`.`existencia` AS `existencia`,`g`.`idGalleta` AS `idGalleta`,`g`.`nombre` AS `nombreGalleta`,`g`.`precio` AS `precio` from (`inventario` `i` join `galleta` `g` on((`i`.`idInventario` = `g`.`idInventario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inventariomaterial`
--

/*!50001 DROP VIEW IF EXISTS `inventariomaterial`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inventariomaterial` AS select `im`.`idInventario` AS `idInventario`,`im`.`existencia` AS `existencia`,`m`.`idMaterial` AS `idMaterial`,`m`.`ingrediente` AS `ingrediente`,`m`.`cantidad` AS `cantidad`,`m`.`detalle_cantidad` AS `detalle_cantidad`,`m`.`costo_material` AS `costo_material` from (`material` `m` join `inventario` `im` on((`m`.`idInventario` = `im`.`idInventario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistamermagalleta`
--

/*!50001 DROP VIEW IF EXISTS `vistamermagalleta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistamermagalleta` AS select `mg`.`idMermaGalleta` AS `idMermaGalleta`,`mg`.`cantidad` AS `cantidad`,`vg`.`idgalleta` AS `idGalleta`,`vg`.`nombre` AS `nombre`,`vg`.`precio` AS `precio`,`vg`.`idinventario` AS `idInventario`,`vg`.`existencia` AS `existencia` from (`mermagalleta` `mg` join (select `g`.`idGalleta` AS `idgalleta`,`g`.`nombre` AS `nombre`,`g`.`precio` AS `precio`,`i`.`idInventario` AS `idinventario`,`i`.`existencia` AS `existencia` from (`galleta` `g` join `inventario` `i` on((`g`.`idInventario` = `i`.`idInventario`)))) `vg` on((`vg`.`idgalleta` = `mg`.`idGalleta`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistamermamaterial`
--

/*!50001 DROP VIEW IF EXISTS `vistamermamaterial`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistamermamaterial` AS select `mg`.`idMermaMaterial` AS `idMermaMaterial`,concat(`mg`.`cantidad`,' ',`mg`.`unidad`) AS `cantidad`,`g`.`ingrediente` AS `ingrediente` from (`mermamaterial` `mg` join `material` `g`) where (`mg`.`idMaterial` = `g`.`idMaterial`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-01 23:32:20
