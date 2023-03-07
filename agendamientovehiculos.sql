CREATE DATABASE  IF NOT EXISTS `agendamientovehiculos` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `agendamientovehiculos`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: agendamientovehiculos
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
-- Table structure for table `agendamiento`
--

DROP TABLE IF EXISTS `agendamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamiento` (
  `idagendamiento` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `motivouso` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  `vehiculo_id` int NOT NULL,
  PRIMARY KEY (`idagendamiento`),
  KEY `fk_agendamiento_users_idx` (`user_id`),
  KEY `fk_agendamiento_vehiculo1_idx` (`vehiculo_id`),
  CONSTRAINT `fk_agendamiento_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_agendamiento_vehiculo1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`idvehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamiento`
--

LOCK TABLES `agendamiento` WRITE;
/*!40000 ALTER TABLE `agendamiento` DISABLE KEYS */;
INSERT INTO `agendamiento` VALUES (2,'2023-02-03','Actualizado manualmente',NULL,'2023-03-04 23:10:24',2,2),(3,'2020-06-03','visita a penitenciarias',NULL,NULL,2,3),(4,'2023-03-28','Viaje al Chaco Paraguayo en la Escuela Pai Puku','2023-03-04 17:34:41','2023-03-06 19:50:00',1,1),(5,'2023-03-01','prueba','2023-03-04 18:06:34','2023-03-04 18:06:34',2,1),(6,'2023-12-22','Cumpleaños de Mathias, alta farra','2023-03-04 18:07:40','2023-03-04 18:07:40',1,3),(7,'2023-05-16','viaje a Caaguazu','2023-03-04 18:08:15','2023-03-04 18:08:15',2,2),(9,'2023-12-30','Esta es una actualización exitosa','2023-03-04 18:09:55','2023-03-04 23:12:37',1,1),(10,'2024-12-18','nuevo prueba','2023-03-06 20:07:18','2023-03-06 20:07:18',3,3),(11,'2023-07-27','pruebva 500000000','2023-03-06 20:55:04','2023-03-06 20:55:04',1,1),(13,'2023-10-17','Llegada al colegio de Concepción','2023-03-06 21:16:02','2023-03-06 21:17:01',5,2),(14,'2023-12-27','uso para entrega de canastas navideñas','2023-03-06 21:37:41','2023-03-06 21:37:41',5,3),(15,'2023-11-30','uso para llega al Colegio Agropecuario de Lima','2023-03-06 21:38:38','2023-03-06 21:38:38',2,2);
/*!40000 ALTER TABLE `agendamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(450) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mathias','Villalba','math@gmail.com','$2b$12$HQ4eJg8vHZJFXS0PTDG7XO3a8Esb99R91wLFgSVrgPYb4LdtjNGa.',NULL,NULL),(2,'José','Cabrera','jose@gmail.com','$2b$12$8P10XYTQFKq1Q03QfSBDRu0jl26hqMLkPJveh6coudXEW/IL5xJc2',NULL,NULL),(3,'Patricio','Olivares','polivares@gmail.com','$2b$12$eX7E51DacsVLIam0dJuVkeV/wjXNsdR5Y6tveuoA4TOnEg13vzxb.',NULL,NULL),(4,'Bob','Olivares','bob@gmail.com','$2b$12$xSmg7U6SX0aP2DSbNTY.vOEkthNUXUNPOpUABpnNddKcKP3pqdbVO',NULL,NULL),(5,'Homero','Simpson','homero@gmail.com','$2b$12$M/nVlwy2zx4xzN6H43h0s.4MeD47vsbH.J8nCC9dCIuktI7RL1qxG',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `idvehiculo` int NOT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `imagen` longtext,
  PRIMARY KEY (`idvehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,'Toyota','Hilux','https://1.bp.blogspot.com/-kZnH_XuKnys/T3VtzvUe1qI/AAAAAAAAK1U/v1LfCm_Ul9E/s1600/Toyota-Hilux_2012_800x600_wallpaper_07.jpg'),(2,'Fiat','Fullback','https://immagini.alvolante.it/sites/default/files/styles/serie_auto_galleria_jpg/public/serie_auto_galleria/2016/05/fiat_fullback_ant.png?itok=5fgEpU_J'),(3,'Volkswagen','Gol','https://cdn.motor1.com/images/mgl/9b9gp/s4/vw-gol-g5.jpg');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-06 21:44:00
