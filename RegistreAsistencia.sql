-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: RegistreAsistencia
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

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
-- Table structure for table `Aules`
--

DROP TABLE IF EXISTS `Aules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aules` (
  `id_aula` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_aula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DiaSetmana`
--

DROP TABLE IF EXISTS `DiaSetmana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DiaSetmana` (
  `id_dia` tinyint(4) NOT NULL,
  `nom_set` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_dia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EntradesSortides`
--

DROP TABLE IF EXISTS `EntradesSortides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EntradesSortides` (
  `id_registre` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `tipus` varchar(50) DEFAULT NULL,
  `id_aula` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_registre`),
  KEY `FK_EntradesSortides_Usuaris` (`id_usuario`),
  KEY `FK_EntradesSortides_Aules` (`id_aula`),
  CONSTRAINT `FK_EntradesSortides_Aules` FOREIGN KEY (`id_aula`) REFERENCES `Aules` (`id_aula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_EntradesSortides_Usuaris` FOREIGN KEY (`id_usuario`) REFERENCES `Usuaris` (`id_usuari`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Grups`
--

DROP TABLE IF EXISTS `Grups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Grups` (
  `id_grup` int(11) NOT NULL,
  `nom_grup` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_grup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Horari`
--

DROP TABLE IF EXISTS `Horari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Horari` (
  `id_horari` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  `dia_setmana` tinyint(4) NOT NULL DEFAULT 0,
  `hora_inici` time DEFAULT NULL,
  `hora_final` time DEFAULT NULL,
  PRIMARY KEY (`id_horari`),
  UNIQUE KEY `unique_group_aula_time` (`id_grupo`,`id_aula`,`dia_setmana`,`hora_inici`,`hora_final`),
  KEY `FK_Horari_Aules` (`id_aula`),
  KEY `FK_Horari_DiaSetmana` (`dia_setmana`),
  CONSTRAINT `FK_Horari_Aules` FOREIGN KEY (`id_aula`) REFERENCES `Aules` (`id_aula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Horari_DiaSetmana` FOREIGN KEY (`dia_setmana`) REFERENCES `DiaSetmana` (`id_dia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Horari_Grups` FOREIGN KEY (`id_grupo`) REFERENCES `Grups` (`id_grup`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Usuaris`
--

DROP TABLE IF EXISTS `Usuaris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuaris` (
  `id_usuari` int(11) NOT NULL,
  `id_grup` int(11) DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `cognom` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `dni` varchar(50) NOT NULL,
  `profe` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_usuari`),
  KEY `FK_Usuaris_Grups` (`id_grup`),
  CONSTRAINT `FK_Usuaris_Grups` FOREIGN KEY (`id_grup`) REFERENCES `Grups` (`id_grup`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-21 15:40:18
