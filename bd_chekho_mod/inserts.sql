
unlock tables;
--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2023-01-01',200),(2,'2023-01-02',350),(3,'2023-01-03',180),(4,'2023-01-04',420),(5,'2023-01-05',300),(6,'2023-01-06',240),(7,'2023-01-07',270),(8,'2023-01-08',210),(9,'2023-01-09',500),(10,'2023-01-10',160);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `galleta` WRITE;
/*!40000 ALTER TABLE `galleta` DISABLE KEYS */;
INSERT INTO `galleta` VALUES (1,1,'Chocolate','1.50'),(2,2,'vainilla','2.00'),(3,3,'naranja','1.20'),(4,4,'Nuez','2.80'),(5,5,'adornada','2.00'),(6,6,'fresa','1.60'),(7,7,'almendra','1.80'),(8,8,'coco','1.40'),(9,9,'galleta sola','3.00'),(10,10,'azucarada','0.90');
/*!40000 ALTER TABLE `galleta` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,5,1,1,1),(2,10,2,2,1),(3,8,1,3,1),(4,15,2,4,1),(5,12,1,5,2),(6,6,2,6,2),(7,9,1,7,3),(8,7,2,8,3),(9,11,1,9,3),(10,14,2,10,3);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `galleta`
--



--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,100),(2,150),(3,200),(4,50),(5,300),(6,120),(7,180),(8,90),(9,250),(10,80);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,1,'Harina',10,'kg',5),(2,2,'Azúcar',8,'kg',3),(3,3,'Chocolate',5,'kg',6),(4,4,'Mantequilla',12,'kg',8),(5,5,'Vainilla',7,'L',4),(6,6,'Canela',10,'g',2),(7,7,'Levadura',6,'g',2.5),(8,8,'Sal',9,'g',1.5),(9,9,'Almendras',15,'kg',10),(10,10,'Esencia',4,'L',0.8);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `material_has_receta`
--

LOCK TABLES `material_has_receta` WRITE;
/*!40000 ALTER TABLE `material_has_receta` DISABLE KEYS */;
INSERT INTO `material_has_receta` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `material_has_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mermagalleta`
--

LOCK TABLES `mermagalleta` WRITE;
/*!40000 ALTER TABLE `mermagalleta` DISABLE KEYS */;
INSERT INTO `mermagalleta` VALUES (1,5,2),(2,4,1),(3,5,3),(4,7,5),(5,2,4),(6,5,6);
/*!40000 ALTER TABLE `mermagalleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mermamaterial`
--

LOCK TABLES `mermamaterial` WRITE;
/*!40000 ALTER TABLE `mermamaterial` DISABLE KEYS */;
INSERT INTO `mermamaterial` VALUES (1,100,'GR',1),(2,200,'GR',2),(3,5,'L',10);
/*!40000 ALTER TABLE `mermamaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,1,50),(2,2,75),(3,3,60),(4,4,90),(5,5,80),(6,6,40),(7,7,55),(8,8,45),(9,9,100),(10,10,30);
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
INSERT INTO `reporte` VALUES (1,1,20.5),(2,2,30),(3,3,15.5),(4,4,35.5),(5,5,25),(6,6,20),(7,7,22.5),(8,8,18),(9,9,42),(10,10,12.5);
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;



