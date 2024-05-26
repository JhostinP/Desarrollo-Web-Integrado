CREATE DATABASE  IF NOT EXISTS `instituto_2023` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `instituto_2023`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: instituto_2023_220
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `tb_bien`
--

DROP TABLE IF EXISTS `tb_bien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_bien` (
  `cod_bien` int NOT NULL AUTO_INCREMENT,
  `des_bien` varchar(90) DEFAULT NULL,
  `cod_tipo_bien` int DEFAULT NULL,
  PRIMARY KEY (`cod_bien`),
  KEY `FK02` (`cod_tipo_bien`),
  CONSTRAINT `FK02` FOREIGN KEY (`cod_tipo_bien`) REFERENCES `tb_tipo_bien` (`cod_tipo_bien`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bien`
--

LOCK TABLES `tb_bien` WRITE;
/*!40000 ALTER TABLE `tb_bien` DISABLE KEYS */;
INSERT INTO `tb_bien` VALUES (1,'Nevera',1),(2,'Lavadora',1),(3,'Termo',1),(4,'Sofá',1),(5,'Silla',1),(6,'Televisor',1),(7,'Mesa',1),(8,'Patinete',1),(9,'Bicicleta',1),(10,'Automóvil',1),(11,'Cuadros',1),(12,'Ordenador',1),(13,'Teléfono Móvil',1),(14,'Refrigerador',1),(15,'Aire acondicionado',1),(16,'Microondas',1),(17,'Licuadora',1),(18,'Silla',1),(19,'Escritorio',1),(20,'Zapatillas	',1),(21,'Medias',1),(22,'Chaqueta',1),(23,'Guantes',1),(24,'Pantalón',1),(25,'Camisa',1),(26,'Cinturón',1),(27,'Blusa',1),(28,'Cuchillo',1),(29,'Cuchara',1),(30,'Tenedor',1),(31,'Vaso',1),(32,'Jarra',1),(33,'Plato',1),(34,'Libro',1),(35,'Cuaderno',1),(36,'Lápiz',1),(37,'Regla',1),(38,'Compás',1),(39,'Goma de borrar',1),(40,'Casa',2),(41,'Piso',2),(42,'Apartamento',2),(43,'Terreno',2),(44,'Fábrica',2),(45,'Edificio',2),(46,'Garaje',2),(47,'Títulos de propiedad',2);
/*!40000 ALTER TABLE `tb_bien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_colegio`
--

DROP TABLE IF EXISTS `tb_colegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_colegio` (
  `cod_col` int NOT NULL AUTO_INCREMENT,
  `nom_col` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_col`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_colegio`
--

LOCK TABLES `tb_colegio` WRITE;
/*!40000 ALTER TABLE `tb_colegio` DISABLE KEYS */;
INSERT INTO `tb_colegio` VALUES (1,'Simón Bolívar'),(2,'Miguel de Cervantes'),(3,'Real Americano'),(4,'Abraham Lincoln School'),(5,'Sir Isaac Newton College');
/*!40000 ALTER TABLE `tb_colegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalle_requerimiento`
--

DROP TABLE IF EXISTS `tb_detalle_requerimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_detalle_requerimiento` (
  `cod_reque` int DEFAULT NULL,
  `cod_bien` int DEFAULT NULL,
  `can` int DEFAULT NULL,
  KEY `FK03` (`cod_reque`),
  KEY `FK05` (`cod_bien`),
  CONSTRAINT `FK03` FOREIGN KEY (`cod_reque`) REFERENCES `tb_requerimiento` (`cod_reque`),
  CONSTRAINT `FK05` FOREIGN KEY (`cod_bien`) REFERENCES `tb_bien` (`cod_bien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalle_requerimiento`
--

LOCK TABLES `tb_detalle_requerimiento` WRITE;
/*!40000 ALTER TABLE `tb_detalle_requerimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_detalle_requerimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_docente`
--

DROP TABLE IF EXISTS `tb_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_docente` (
  `cod_doc` int NOT NULL AUTO_INCREMENT,
  `nom_doc` varchar(30) DEFAULT NULL,
  `pat_doc` varchar(30) DEFAULT NULL,
  `mat_doc` varchar(30) DEFAULT NULL,
  `sex_doc` varchar(15) DEFAULT NULL,
  `num_hijo_doc` int DEFAULT NULL,
  `sue_doc` double DEFAULT NULL,
  `cod_col_doc` int DEFAULT NULL,
  PRIMARY KEY (`cod_doc`),
  KEY `FK01` (`cod_col_doc`),
  CONSTRAINT `FK01` FOREIGN KEY (`cod_col_doc`) REFERENCES `tb_colegio` (`cod_col`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_docente`
--

LOCK TABLES `tb_docente` WRITE;
/*!40000 ALTER TABLE `tb_docente` DISABLE KEYS */;
INSERT INTO `tb_docente` VALUES (1,'Wilmer Raul','ARCE','VILLAVICENCIO','Masculino',0,1500.8,1),(2,'Jansy Piedad','BOCANEGRA','PÉREZ','Masculino',0,1500.8,1),(3,'Salin Roque','CARRASCO','TORRES','Masculino',0,1500.8,1),(4,'Ricky John','CARRILLO','GUTIERREZ','Masculino',0,1500.8,1),(5,'Edith Carmen','CHUYES','MARAVI','Masculino',0,1500.8,1),(6,'Jorge Luis','CUADRA','FEBRES','Masculino',0,1500.8,1),(7,'Humberto Antonio','CUCHO','GAMBOA','Masculino',0,1500.8,1),(8,'Percy Giancarlo','DE LA CRUZ','REYES','Masculino',0,1500.8,1),(9,'Katherine Paola','DE LOS SANTOS','GARCIA','Masculino',0,1500.8,1),(10,'Angel Jose German','ESPEJO','TARAZONA','Masculino',0,1500.8,1),(11,'Marlon Bruno','ESTEFO','TUME','Masculino',0,1500.8,1),(12,'Sailor Amor Mohamed','FARFAN','SANJINEZ','Masculino',0,1500.8,1),(13,'Eduardo Rodrigo','GARAY','TASAYCO','Masculino',0,1500.8,1),(14,'Lindenber Erwin','GARCIA','PAUCAR','Masculino',0,1500.8,1),(15,'Margoth Kimi','LEON','HUAMANI','Masculino',0,1500.8,1),(16,'Christian Gustavo','LLANCARI','YBARRA','Masculino',0,1500.8,1),(17,'Noemi Noelia','LOVATON','FLORES','Masculino',0,1500.8,1),(18,'Junior Alejandro','MEDINA','HUAMAN','Masculino',0,1500.8,1),(19,'Johnny Luis','NAUPAY','SALAZAR','Masculino',0,1500.8,1),(20,'Percy Antony','OLIVARES','RUEDA','Masculino',0,1500.8,1),(21,'Paola Lucila','PINEDO','DE PAZ','Masculino',0,1500.8,1),(22,'LUIS ALEJANDRO','PINEIRO','PAIVA','Masculino',0,1500.8,1),(23,'Yonathan Ismael','QUISPE','SARMIENTO','Masculino',0,1500.8,1),(24,'Richar Serafin','SARMIENTO','CUYUTUPA','Masculino',0,1500.8,1),(25,'Mauro Job','ZEGARRA','ORTIZ','Masculino',0,1500.8,1),(26,'Abraham','ACHING','ZARRIA','Masculino',0,1500.8,1),(27,'Josh Bertin Jesus','ANCAJIMA','MORA','Masculino',0,1500.8,1),(28,'Rolando Martin','BARRIENTOS','QUIROZ','Masculino',0,1500.8,1),(29,'Luis Alberto','CALDERÓN','ROMERO','Masculino',0,1500.8,1),(30,'Jose Junior','CARMEN','QUESQUEN','Masculino',0,1500.8,1),(31,'Camilo Claudio','CESPEDES','CIERTO','Masculino',0,1500.8,1),(32,'Wendy Dayann','CHAFALOTE','JARAMILLO','Masculino',0,1500.8,1),(33,'JesÚs Eduardo','CHAUCA','CRUZ','Masculino',0,1500.8,1),(34,'Gustavo Alfredo','CHIMOY','GARCÍA','Masculino',0,1500.8,1),(35,'GUILLERMO','CONDE','GUIZADA','Masculino',0,1500.8,1),(36,'Maury Dionicio','CORZO','TRANCA','Masculino',0,1500.8,1),(37,'Gerson Omar','COTRINA','SALDAÑA','Masculino',0,1500.8,1),(38,'ENRIQUEZ','GUTIERREZ','MALCA','Masculino',0,1500.8,1),(39,'Miryam Vilma','ESCARCENA','TECSI','Masculino',0,1500.8,1),(40,'Catherine Adelayda','FARFÁN','HUILLCA','Masculino',0,1500.8,1);
/*!40000 ALTER TABLE `tb_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_enlace`
--

DROP TABLE IF EXISTS `tb_enlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_enlace` (
  `idenlace` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `ruta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idenlace`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_enlace`
--

LOCK TABLES `tb_enlace` WRITE;
/*!40000 ALTER TABLE `tb_enlace` DISABLE KEYS */;
INSERT INTO `tb_enlace` VALUES (1,'Medicamento','listaMedicamento.jsf'),(2,'Laboratorio','registroLaboratorio.jsf'),(3,'Cliente','registroCliente.jsf'),(4,'Empleado','registroEmpleado.jsf'),(5,'Boleta','registroBoleta.jsf');
/*!40000 ALTER TABLE `tb_enlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_requerimiento`
--

DROP TABLE IF EXISTS `tb_requerimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_requerimiento` (
  `cod_reque` int NOT NULL AUTO_INCREMENT,
  `num_reque` varchar(10) DEFAULT NULL,
  `nom_reque` varchar(30) DEFAULT NULL,
  `fec_reque` date DEFAULT NULL,
  `cod_usu` int DEFAULT NULL,
  `est_reque` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_reque`),
  KEY `FK04` (`cod_usu`),
  CONSTRAINT `FK04` FOREIGN KEY (`cod_usu`) REFERENCES `tb_usuario` (`cod_usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_requerimiento`
--

LOCK TABLES `tb_requerimiento` WRITE;
/*!40000 ALTER TABLE `tb_requerimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_requerimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_rol`
--

DROP TABLE IF EXISTS `tb_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_rol`
--

LOCK TABLES `tb_rol` WRITE;
/*!40000 ALTER TABLE `tb_rol` DISABLE KEYS */;
INSERT INTO `tb_rol` VALUES (1,'Administrador'),(2,'Caja'),(3,'Contabilidad');
/*!40000 ALTER TABLE `tb_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_rol_enlace`
--

DROP TABLE IF EXISTS `tb_rol_enlace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rol_enlace` (
  `idrol` int NOT NULL,
  `idenlace` int NOT NULL,
  PRIMARY KEY (`idrol`,`idenlace`),
  KEY `fk25` (`idenlace`),
  CONSTRAINT `fk24` FOREIGN KEY (`idrol`) REFERENCES `tb_rol` (`idrol`),
  CONSTRAINT `fk25` FOREIGN KEY (`idenlace`) REFERENCES `tb_enlace` (`idenlace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_rol_enlace`
--

LOCK TABLES `tb_rol_enlace` WRITE;
/*!40000 ALTER TABLE `tb_rol_enlace` DISABLE KEYS */;
INSERT INTO `tb_rol_enlace` VALUES (1,1),(2,1),(1,2),(3,2),(1,3),(1,4),(1,5),(2,5);
/*!40000 ALTER TABLE `tb_rol_enlace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_bien`
--

DROP TABLE IF EXISTS `tb_tipo_bien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_bien` (
  `cod_tipo_bien` int NOT NULL AUTO_INCREMENT,
  `des_tipo_bien` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod_tipo_bien`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_bien`
--

LOCK TABLES `tb_tipo_bien` WRITE;
/*!40000 ALTER TABLE `tb_tipo_bien` DISABLE KEYS */;
INSERT INTO `tb_tipo_bien` VALUES (1,'Muebles'),(2,'Inmuebles'),(3,'Tangibles'),(4,'Intangibles');
/*!40000 ALTER TABLE `tb_tipo_bien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `cod_usu` int NOT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `idrol` int DEFAULT NULL,
  PRIMARY KEY (`cod_usu`),
  KEY `fk23` (`idrol`),
  CONSTRAINT `fk23` FOREIGN KEY (`idrol`) REFERENCES `tb_rol` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'anita2000','ana','Ana','Soto Ayala',1),(2,'maria2025','maria','Maria','Salas Rivera',2),(3,'alicia657','alicia','Alicia','Torres Siuce',3);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-07 10:49:08
