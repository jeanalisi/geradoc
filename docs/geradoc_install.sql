-- ============================================================
-- GeraDox — Script de Instalação do Banco de Dados
-- Domínio: geradoc.itabaiana.pb.gov.br
-- Compatível com MySQL 8.0+
-- ============================================================

-- Desabilitar ONLY_FULL_GROUP_BY para compatibilidade com as queries do sistema
SET GLOBAL sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: geradoc
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` int NOT NULL,
  `usuario_nome` varchar(60) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `data` datetime NOT NULL,
  `url` tinytext NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'DIRETOR'),(2,'COMANDANTE'),(3,'SECRETÁRIO'),(4,'COORDENADOR'),(5,'ASSESSOR');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `last_activity` int unsigned NOT NULL DEFAULT '10',
  `user_data` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('065b18e39a84bfc845a145a5c3f4b0dd','127.0.0.1','curl/7.81.0',1773867045,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('1522e1e8e0db8aa570d4a90c3799403d','10.110.121.1','node',1773871641,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('1f6b0cefb5d8ff0c3ccea6a6679529f6','127.0.0.1','curl/7.81.0',1773870932,''),('2441024fb32eb88a46e941489efc14e3','127.0.0.1','curl/7.81.0',1773867362,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('2764249857b6992277e3c46253c89e85','127.0.0.1','curl/7.81.0',1773868255,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('335bdae10e08cd0e56597f22b09502de','10.69.83.1','curl/7.81.0',1773869049,''),('34bf6e909bd8880fb1423fc63510389a','127.0.0.1','curl/7.81.0',1773868270,'a:9:{s:9:\"user_data\";s:0:\"\";s:10:\"id_usuario\";s:1:\"1\";s:5:\"login\";s:11:\"11111111111\";s:3:\"cpf\";s:11:\"11111111111\";s:4:\"nome\";s:13:\"ADMINISTRADOR\";s:7:\"nivelId\";s:1:\"1\";s:5:\"setor\";s:1:\"2\";s:5:\"email\";s:20:\"admin@geradoc.com.br\";s:6:\"logado\";b:1;}'),('35fcae3255bad4c8dcca824833bafcb8','127.0.0.1','curl/7.81.0',1773867048,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('3af80e0ed0f2a41bd7ec957787d9a9b2','10.69.83.1','curl/7.81.0',1773867135,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('413fa2c11356d96c4239deafe716f65b','127.0.0.1','curl/7.81.0',1773871320,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('4168abbb32f7fa08aba15c3dd99e9d74','127.0.0.1','curl/7.81.0',1773870917,''),('50dc947fb6806dffdc20be895ebb8785','10.110.121.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36; M',1773871037,'a:8:{s:9:\"user_data\";s:0:\"\";s:10:\"id_usuario\";s:1:\"1\";s:5:\"login\";s:11:\"11111111111\";s:3:\"cpf\";s:11:\"11111111111\";s:4:\"nome\";s:13:\"ADMINISTRADOR\";s:7:\"nivelId\";s:1:\"1\";s:5:\"setor\";s:1:\"2\";s:5:\"email\";s:20:\"admin@geradoc.com.br\";}'),('55444f2ceaebaccc54ed68ce6357d97b','10.111.92.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36; M',1773916399,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('5b63ac5b0fee7a8552a74011025c6d2e','10.110.121.1','node',1773871641,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('61b675506e4f8866a24f234342787906','127.0.0.1','curl/7.81.0',1773868501,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('6d13ed7ee6f6e19b5696c86e411b90bc','127.0.0.1','curl/7.81.0',1773868261,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('6d5dec19b2196fabb866ad65694bfb85','127.0.0.1','curl/7.81.0',1773868494,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('717fa9d6937120215a53d06879c9a465','127.0.0.1','curl/7.81.0',1773867362,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('7676b92198238892de2f39b86689b243','127.0.0.1','curl/7.81.0',1773868301,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('76c4ad82accb49fc64b73dc282f3c39c','127.0.0.1','curl/7.81.0',1773867015,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('85dd713dd16450556ec75059cdee62af','127.0.0.1','curl/7.81.0',1773868295,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('96150025ba63a188fab1782712de1512','127.0.0.1','curl/7.81.0',1773868244,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('9bba88e01c17686d41526faf04008af6','10.110.121.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36; M',1773870591,'a:8:{s:9:\"user_data\";s:0:\"\";s:10:\"id_usuario\";s:1:\"1\";s:5:\"login\";s:11:\"11111111111\";s:3:\"cpf\";s:11:\"11111111111\";s:4:\"nome\";s:13:\"ADMINISTRADOR\";s:7:\"nivelId\";s:1:\"1\";s:5:\"setor\";s:1:\"2\";s:5:\"email\";s:20:\"admin@geradoc.com.br\";}'),('a3a12d1069a30a0ae9797d4cfdeb2b94','127.0.0.1','curl/7.81.0',1773868441,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('a824a5138bc46806d40b8059f905d15e','10.110.121.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',1773871641,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('a92de312d0aa3cc35dbab28f1e326e13','127.0.0.1','curl/7.81.0',1773867037,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('a9b6c78a6f4b48db9bb51a2894b732e8','127.0.0.1','curl/7.81.0',1773867020,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('aa0b233ddba3a3eac0cceed6bf95372c','127.0.0.1','curl/7.81.0',1773867099,'a:8:{s:9:\"user_data\";s:0:\"\";s:10:\"id_usuario\";s:1:\"1\";s:5:\"login\";s:11:\"11111111111\";s:3:\"cpf\";s:11:\"11111111111\";s:4:\"nome\";s:13:\"ADMINISTRADOR\";s:7:\"nivelId\";s:1:\"1\";s:5:\"setor\";s:1:\"2\";s:6:\"logado\";b:1;}'),('ab57358c9430da2ecad1f113ae059535','10.69.83.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36; M',1773867116,'a:7:{s:9:\"user_data\";s:0:\"\";s:10:\"id_usuario\";s:1:\"1\";s:5:\"login\";s:11:\"11111111111\";s:3:\"cpf\";s:11:\"11111111111\";s:4:\"nome\";s:13:\"ADMINISTRADOR\";s:7:\"nivelId\";s:1:\"1\";s:5:\"setor\";s:1:\"2\";}'),('abaea2951dad82ba92ec4fa069dcb187','127.0.0.1','curl/7.81.0',1773867012,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('b0b2ff156be2b59340a85f230bc9b675','127.0.0.1','curl/7.81.0',1773870624,''),('b166f76f2ce1c3f276cd3c2e556c8223','10.110.121.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36; M',1773871402,'a:9:{s:9:\"user_data\";s:0:\"\";s:10:\"id_usuario\";s:1:\"1\";s:5:\"login\";s:11:\"11111111111\";s:3:\"cpf\";s:11:\"11111111111\";s:4:\"nome\";s:13:\"ADMINISTRADOR\";s:7:\"nivelId\";s:1:\"1\";s:5:\"setor\";s:1:\"2\";s:5:\"email\";s:20:\"admin@geradoc.com.br\";s:6:\"logado\";b:1;}'),('b3fe6e5115ee11402cb6ea6ff3981bac','127.0.0.1','curl/7.81.0',1773870955,'a:9:{s:9:\"user_data\";s:0:\"\";s:10:\"id_usuario\";s:1:\"1\";s:5:\"login\";s:11:\"11111111111\";s:3:\"cpf\";s:11:\"11111111111\";s:4:\"nome\";s:13:\"ADMINISTRADOR\";s:7:\"nivelId\";s:1:\"1\";s:5:\"setor\";s:1:\"2\";s:5:\"email\";s:20:\"admin@geradoc.com.br\";s:6:\"logado\";b:1;}'),('b97f7bd12d83a9a52f7361d779bdf49d','127.0.0.1','curl/7.81.0',1773869114,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('bb18bea1521358440e19e4940ff9e9f1','127.0.0.1','curl/7.81.0',1773868976,''),('bb26672e3e09dcc277fc71fac1e5222e','127.0.0.1','curl/7.81.0',1773867041,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('cbd3b7a428057b3f17c2f23983d2b19d','127.0.0.1','curl/7.81.0',1773869095,'a:9:{s:9:\"user_data\";s:0:\"\";s:10:\"id_usuario\";s:1:\"1\";s:5:\"login\";s:11:\"11111111111\";s:3:\"cpf\";s:11:\"11111111111\";s:4:\"nome\";s:13:\"ADMINISTRADOR\";s:7:\"nivelId\";s:1:\"1\";s:5:\"setor\";s:1:\"2\";s:5:\"email\";s:20:\"admin@geradoc.com.br\";s:6:\"logado\";b:1;}'),('d7477a5d6b3513fbcb07c8d61911a084','127.0.0.1','curl/7.81.0',1773868999,'a:9:{s:9:\"user_data\";s:0:\"\";s:10:\"id_usuario\";s:1:\"1\";s:5:\"login\";s:11:\"11111111111\";s:3:\"cpf\";s:11:\"11111111111\";s:4:\"nome\";s:13:\"ADMINISTRADOR\";s:7:\"nivelId\";s:1:\"1\";s:5:\"setor\";s:1:\"2\";s:5:\"email\";s:20:\"admin@geradoc.com.br\";s:6:\"logado\";b:1;}'),('d7eb76a6a867196cb4169db90b558287','127.0.0.1','curl/7.81.0',1773867141,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('d7fc66d9ea688d950008f5df92955fe2','127.0.0.1','curl/7.81.0',1773870506,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('dfe8ffa266b7904524ebfba9c3f96d61','10.69.83.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36; M',1773868829,'a:8:{s:9:\"user_data\";s:0:\"\";s:10:\"id_usuario\";s:1:\"1\";s:5:\"login\";s:11:\"11111111111\";s:3:\"cpf\";s:11:\"11111111111\";s:4:\"nome\";s:13:\"ADMINISTRADOR\";s:7:\"nivelId\";s:1:\"1\";s:5:\"setor\";s:1:\"2\";s:5:\"email\";s:20:\"admin@geradoc.com.br\";}'),('e377a68008d16ff587fb3d03fc132fcc','127.0.0.1','curl/7.81.0',1773868489,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('eb40f491c371d430a6c9087c703e44bc','127.0.0.1','curl/7.81.0',1773870490,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('f47f3b2297e06024869715c2f620aadf','127.0.0.1','curl/7.81.0',1773867029,'a:1:{s:9:\"user_data\";s:0:\"\";}');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int NOT NULL,
  `id_usuario` int NOT NULL,
  `data` datetime DEFAULT NULL,
  `texto` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `sexo` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'M',
  `cargo` int NOT NULL DEFAULT '1',
  `setor` int NOT NULL DEFAULT '1',
  `fone` varchar(15) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `celular` varchar(15) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `fax` varchar(15) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `mail1` varchar(60) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `mail2` varchar(60) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `assinatura` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
INSERT INTO `contato` VALUES (1,'RAIMUNDO SILVA','M',1,2,'(85)3100.0000','','','RAIMUNDO.SILVA@TESTE.COM.BR','','<strong>RAIMUNDO SILVA</strong><br />DIRETOR GERAL','A'),(2,'FRANCISCO SOUSA','M',4,3,'(85)0000.0000','','','FRANCISCO.SOUSA@TESTE.COM.BR','','FRANCISCO SOUSA<br />COORDENADOR FINANCEIRO','A'),(3,'ANA MARIA','M',5,4,'(85)0000.0000','','','ANA.MARIA@TESTE.COM.BR','','ANA MARIA<br />ASSEOSSORA JUR&Iacute;DICA','A');
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despacho_head`
--

DROP TABLE IF EXISTS `despacho_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despacho_head` (
  `despacho_id` int NOT NULL,
  `num_processo` varchar(100) NOT NULL,
  `interessado` varchar(100) NOT NULL,
  `de` varchar(100) NOT NULL,
  `para` varchar(200) NOT NULL,
  PRIMARY KEY (`despacho_id`),
  KEY `despacho_id_idx` (`despacho_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despacho_head`
--

LOCK TABLES `despacho_head` WRITE;
/*!40000 ALTER TABLE `despacho_head` DISABLE KEYS */;
INSERT INTO `despacho_head` VALUES (2,'0','0','0','ASSJUR');
/*!40000 ALTER TABLE `despacho_head` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` int DEFAULT NULL,
  `numero` int DEFAULT '1',
  `setor` int DEFAULT NULL,
  `cidade` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `data` date DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `destinatario` int DEFAULT NULL,
  `assunto` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `anexos` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `referencia` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `redacao` longtext CHARACTER SET latin1 COLLATE latin1_general_ci,
  `remetente` int DEFAULT NULL,
  `para` varchar(300) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `dono` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `dono_cpf` varchar(11) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `cadeado` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'S',
  `oculto` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `cancelado` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `carimbo` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'N',
  `carimbo_confidencial` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `carimbo_urgente` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `carimbo_via` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `objetivo` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `documentacao` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `conclusao` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `processo` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `interessado` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `analise` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (1,2,1,2,NULL,'2016-09-14','2016-09-14',NULL,'Exemplo de Comunicação Interna',NULL,'Outro documento qualquer','<p>Prezado Sr.</p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nec sapien arcu. Aliquam erat volutpat. Nullam mi justo, rutrum vitae aliquam a, tempus faucibus purus.</p>\n\n<p>Nullam molestie purus ex, id commodo nisi aliquet vitae. Nam lacinia est quis libero euismod varius. Praesent ullamcorper mi et porta tempus.</p>\n\n<p>Atenciosamente,</p>\n\n<p>&nbsp;</p>',1,'Ao Sr.<br />\n<strong>Francisco Sousa</strong><br />\nCoordenador Financeiro<br />\n&nbsp;','ADMINISTRADOR ','11111111111','S','N','N','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,3,1,2,NULL,'2016-09-14','2016-09-14',NULL,'Exemplo de Despacho',NULL,'0','<p>&nbsp;</p>\n\n<p>1. Recebi hoje;</p>\n\n<p>2. Trata o presesente processo da solicita&ccedil;&atilde; do Sr. Jos&eacute; da Silva;</p>\n\n<p>3. Encaminhe-se &agrave; Assessoria Jur&iacute;dica para elabora&ccedil;&atilde;o de parecer.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>',1,'ASSJUR','REDATOR ','22222222222','S','N','N','0',NULL,'S',NULL,'0','0','0','01234567/2013','José da Silva','0'),(3,1,1,2,NULL,'2016-09-14','2016-09-14',NULL,'Exemplo de Ofício',NULL,'Despacho Nº 1 - DIR/ORG','<p>Prezado Jos&eacute; da Silva,</p>\n\n<p>Etiam hendrerit, nibh non tincidunt malesuada, elit tortor luctus tellus, sed tempus tellus nibh sit amet nulla. Vestibulum quis velit molestie, sodales mi id, elementum turpis.</p>\n\n<p>Donec ullamcorper ornare urna, quis efficitur ipsum vestibulum vel. Nullam et eros vitae lectus cursus placerat sed vel odio. Suspendisse fringilla ac tellus vitae ultrices. Integer commodo nisi non velit egestas mattis. Aliquam erat volutpat.</p>\n\n<p>Atenciosamente,</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>',1,'Ao Sr.<br />\nJos&eacute; da Silva','REDATOR ','22222222222','S','N','N','0',NULL,NULL,NULL,'0','0','0','0','0','0');
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico` (
  `id_historico` int NOT NULL AUTO_INCREMENT,
  `id_documento` int NOT NULL,
  `data` datetime DEFAULT NULL,
  `texto` longtext CHARACTER SET latin1 COLLATE latin1_general_ci,
  PRIMARY KEY (`id_historico`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (1,1,'2016-09-14 09:17:33','<div>Comunica&ccedil;&atilde;o Interna N&ordm; <strong>1/2016 - DIR/ORG</strong></div>\n<div style=\"text-align: right;\">Fortaleza, 14 de setembro de 2016.</div>\n<div>Ao Sr.<br />\n<strong>Francisco Sousa</strong><br />\nCoordenador Financeiro<br />\n&nbsp;</div>\n<div><strong>Assunto:</strong> Exemplo de Comunicação Interna</div>\n<div>Outro documento qualquer</div>\n<div></div>\n<div style=\"text-align: justify;\"><br /><p>Prezado Sr.</p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nec sapien arcu. Aliquam erat volutpat. Nullam mi justo, rutrum vitae aliquam a, tempus faucibus purus.</p>\n\n<p>Nullam molestie purus ex, id commodo nisi aliquet vitae. Nam lacinia est quis libero euismod varius. Praesent ullamcorper mi et porta tempus.</p>\n\n<p>Atenciosamente,</p>\n\n<p>&nbsp;</p></div>\n<div style=\"text-align: center;\"><div style=\"line-height: 125%;\"><strong>RAIMUNDO SILVA</strong><br />DIRETOR GERAL</div></div>'),(2,2,'2016-09-14 09:20:48','<table style=\"border: solid 1px black; background-color: #fff; color: black; border-collapse: collapse;\" width=\"100%\">\n<tbody>\n<tr>\n<td align=\"center\"><strong>Despacho N&ordm; 1/2016 - DIR/ORG</strong></td>\n</tr>\n</tbody>\n</table>\n<table style=\"margin-top: 15px; border: solid 1px black; background-color: #fff; color: black; border-collapse: collapse;\" width=\"100%\">\n<tbody>\n<tr>\n<td width=\"50%\"><strong> N&ordm;. do processo:</strong> 01234567/2013</td>\n<td><strong>De:</strong> DIR/ORG</td>\n</tr>\n<tr>\n<td><strong>Interessado:</strong> José da Silva</td>\n<td><strong>Para:</strong> ASSJUR</td>\n</tr>\n<tr>\n<td><strong>Assunto:</strong> Exemplo de Despacho</td>\n<td><strong>Data:</strong> 14 de setembro de 2016</td>\n</tr>\n<tr>\n<td colspan=\"2\"></td>\n</tr>\n</tbody>\n</table>\n<div style=\"margin-top: 15px; border: solid 1px black; background-color: #fff; color: black; height: 600px; width: 100%; padding-left: 10px; padding-right: 10px; text-align: justify; line-height: 140%; display: table;\"><p>1. Recebi hoje;</p>\n\n<p>2. Trata o presesente processo da solicita&ccedil;&atilde; do Sr. Jos&eacute; da Silva;</p>\n\n<p>3. Encaminhe-se &agrave; Assessoria Jur&iacute;dica para elabora&ccedil;&atilde;o de parecer.</p>\n\n<p>&nbsp;</p>\n<div style=\"margin-top: 37px; text-align: center;\"><div style=\"line-height: 125%;\"><strong>RAIMUNDO SILVA</strong><br />DIRETOR GERAL</div></div>\n</div>'),(3,2,'2016-09-14 09:21:01','<table style=\"border: solid 1px black; background-color: #fff; color: black; border-collapse: collapse;\" width=\"100%\">\n<tbody>\n<tr>\n<td align=\"center\"><strong>Despacho N&ordm; 1/2016 - DIR/ORG</strong></td>\n</tr>\n</tbody>\n</table>\n<table style=\"margin-top: 15px; border: solid 1px black; background-color: #fff; color: black; border-collapse: collapse;\" width=\"100%\">\n<tbody>\n<tr>\n<td width=\"50%\"><strong> N&ordm;. do processo:</strong> 01234567/2013</td>\n<td><strong>De:</strong> DIR/ORG</td>\n</tr>\n<tr>\n<td><strong>Interessado:</strong> José da Silva</td>\n<td><strong>Para:</strong> ASSJUR</td>\n</tr>\n<tr>\n<td><strong>Assunto:</strong> Exemplo de Despacho</td>\n<td><strong>Data:</strong> 14 de setembro de 2016</td>\n</tr>\n<tr>\n<td colspan=\"2\"></td>\n</tr>\n</tbody>\n</table>\n<div style=\"margin-top: 15px; border: solid 1px black; background-color: #fff; color: black; height: 600px; width: 100%; padding-left: 10px; padding-right: 10px; text-align: justify; line-height: 140%; display: table;\"><p>&nbsp;</p>\n\n<p>1. Recebi hoje;</p>\n\n<p>2. Trata o presesente processo da solicita&ccedil;&atilde; do Sr. Jos&eacute; da Silva;</p>\n\n<p>3. Encaminhe-se &agrave; Assessoria Jur&iacute;dica para elabora&ccedil;&atilde;o de parecer.</p>\n\n<p>&nbsp;</p>\n<div style=\"margin-top: 37px; text-align: center;\"><div style=\"line-height: 125%;\"><strong>RAIMUNDO SILVA</strong><br />DIRETOR GERAL</div></div>\n</div>'),(4,2,'2016-09-14 09:21:16','<table style=\"border: solid 1px black; background-color: #fff; color: black; border-collapse: collapse;\" width=\"100%\">\n<tbody>\n<tr>\n<td align=\"center\"><strong>Despacho N&ordm; 1/2016 - DIR/ORG</strong></td>\n</tr>\n</tbody>\n</table>\n<table style=\"margin-top: 15px; border: solid 1px black; background-color: #fff; color: black; border-collapse: collapse;\" width=\"100%\">\n<tbody>\n<tr>\n<td width=\"50%\"><strong> N&ordm;. do processo:</strong> 01234567/2013</td>\n<td><strong>De:</strong> DIR/ORG</td>\n</tr>\n<tr>\n<td><strong>Interessado:</strong> José da Silva</td>\n<td><strong>Para:</strong> ASSJUR</td>\n</tr>\n<tr>\n<td><strong>Assunto:</strong> Exemplo de Despacho</td>\n<td><strong>Data:</strong> 14 de setembro de 2016</td>\n</tr>\n<tr>\n<td colspan=\"2\"></td>\n</tr>\n</tbody>\n</table>\n<div style=\"margin-top: 15px; border: solid 1px black; background-color: #fff; color: black; height: 600px; width: 100%; padding-left: 10px; padding-right: 10px; text-align: justify; line-height: 140%; display: table;\"><p>&nbsp;</p>\n\n<p>1. Recebi hoje;</p>\n\n<p>2. Trata o presesente processo da solicita&ccedil;&atilde; do Sr. Jos&eacute; da Silva;</p>\n\n<p>3. Encaminhe-se &agrave; Assessoria Jur&iacute;dica para elabora&ccedil;&atilde;o de parecer.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n<div style=\"margin-top: 37px; text-align: center;\"><div style=\"line-height: 125%;\"><strong>RAIMUNDO SILVA</strong><br />DIRETOR GERAL</div></div>\n</div>'),(5,3,'2016-09-14 09:23:55','<div>Of&iacute;cio N&ordm; <strong>1/2016-DIR/ORG</strong></div>\n<div style=\"text-align: right;\">Fortaleza, 14 de setembro de 2016.</div>\n<div>Ao Sr.<br />\nJos&eacute; da Silva</div>\n<div><strong>Assunto:</strong> Solicitação</div>\n<div><strong>Refer&ecirc;ncia:</strong> Despacho Nº 1 - DIR/ORG</div>\n<div style=\"text-align: justify;\"><br /><p>Prezado senhor,</p>\n\n<p>Etiam hendrerit, nibh non tincidunt malesuada, elit tortor luctus tellus, sed tempus tellus nibh sit amet nulla. Vestibulum quis velit molestie, sodales mi id, elementum turpis.</p>\n\n<p>Donec ullamcorper ornare urna, quis efficitur ipsum vestibulum vel. Nullam et eros vitae lectus cursus placerat sed vel odio. Suspendisse fringilla ac tellus vitae ultrices. Integer commodo nisi non velit egestas mattis. Aliquam erat volutpat.</p>\n\n<p>Atenciosamente,</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p></div>\n<div style=\"text-align: center;\"><br /><div style=\"line-height: 125%;\"><strong>RAIMUNDO SILVA</strong><br />DIRETOR GERAL</div></div>'),(6,3,'2016-09-14 09:24:12','<div>Of&iacute;cio N&ordm; <strong>1/2016-DIR/ORG</strong></div>\n<div style=\"text-align: right;\">Fortaleza, 14 de setembro de 2016.</div>\n<div>Ao Sr.<br />\nJos&eacute; da Silva</div>\n<div><strong>Assunto:</strong> Solicitação</div>\n<div><strong>Refer&ecirc;ncia:</strong> Despacho Nº 1 - DIR/ORG</div>\n<div style=\"text-align: justify;\"><br /><p>Prezado senhor,</p>\n\n<p>Etiam hendrerit, nibh non tincidunt malesuada, elit tortor luctus tellus, sed tempus tellus nibh sit amet nulla. Vestibulum quis velit molestie, sodales mi id, elementum turpis.</p>\n\n<p>Donec ullamcorper ornare urna, quis efficitur ipsum vestibulum vel. Nullam et eros vitae lectus cursus placerat sed vel odio. Suspendisse fringilla ac tellus vitae ultrices. Integer commodo nisi non velit egestas mattis. Aliquam erat volutpat.</p>\n\n<p>Atenciosamente,</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p></div>\n<div style=\"text-align: center;\"><br /><div style=\"line-height: 125%;\"><strong>RAIMUNDO SILVA</strong><br />DIRETOR GERAL</div></div>'),(7,3,'2016-09-14 09:24:32','<div>Of&iacute;cio N&ordm; <strong>1/2016-DIR/ORG</strong></div>\n<div style=\"text-align: right;\">Fortaleza, 14 de setembro de 2016.</div>\n<div>Ao Sr.<br />\nJos&eacute; da Silva</div>\n<div><strong>Assunto:</strong> Exemplo de Ofício</div>\n<div><strong>Refer&ecirc;ncia:</strong> Despacho Nº 1 - DIR/ORG</div>\n<div style=\"text-align: justify;\"><br /><p>Prezado senhor,</p>\n\n<p>Etiam hendrerit, nibh non tincidunt malesuada, elit tortor luctus tellus, sed tempus tellus nibh sit amet nulla. Vestibulum quis velit molestie, sodales mi id, elementum turpis.</p>\n\n<p>Donec ullamcorper ornare urna, quis efficitur ipsum vestibulum vel. Nullam et eros vitae lectus cursus placerat sed vel odio. Suspendisse fringilla ac tellus vitae ultrices. Integer commodo nisi non velit egestas mattis. Aliquam erat volutpat.</p>\n\n<p>Atenciosamente,</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p></div>\n<div style=\"text-align: center;\"><br /><div style=\"line-height: 125%;\"><strong>RAIMUNDO SILVA</strong><br />DIRETOR GERAL</div></div>'),(8,3,'2016-09-14 09:24:51','<div>Of&iacute;cio N&ordm; <strong>1/2016-DIR/ORG</strong></div>\n<div style=\"text-align: right;\">Fortaleza, 14 de setembro de 2016.</div>\n<div>Ao Sr.<br />\nJos&eacute; da Silva</div>\n<div><strong>Assunto:</strong> Exemplo de Ofício</div>\n<div><strong>Refer&ecirc;ncia:</strong> Despacho Nº 1 - DIR/ORG</div>\n<div style=\"text-align: justify;\"><br /><p>Prezado Jos&eacute; da Silva,</p>\n\n<p>Etiam hendrerit, nibh non tincidunt malesuada, elit tortor luctus tellus, sed tempus tellus nibh sit amet nulla. Vestibulum quis velit molestie, sodales mi id, elementum turpis.</p>\n\n<p>Donec ullamcorper ornare urna, quis efficitur ipsum vestibulum vel. Nullam et eros vitae lectus cursus placerat sed vel odio. Suspendisse fringilla ac tellus vitae ultrices. Integer commodo nisi non velit egestas mattis. Aliquam erat volutpat.</p>\n\n<p>Atenciosamente,</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p></div>\n<div style=\"text-align: center;\"><br /><div style=\"line-height: 125%;\"><strong>RAIMUNDO SILVA</strong><br />DIRETOR GERAL</div></div>');
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgao`
--

DROP TABLE IF EXISTS `orgao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orgao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `sigla` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `endereco` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgao`
--

LOCK TABLES `orgao` WRITE;
/*!40000 ALTER TABLE `orgao` DISABLE KEYS */;
INSERT INTO `orgao` VALUES (1,'ÓRGÃO','ORG','.');
/*!40000 ALTER TABLE `orgao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_comentario_usuario`
--

DROP TABLE IF EXISTS `rel_comentario_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_comentario_usuario` (
  `id_rel` int NOT NULL AUTO_INCREMENT,
  `id_comentario` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_rel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_comentario_usuario`
--

LOCK TABLES `rel_comentario_usuario` WRITE;
/*!40000 ALTER TABLE `rel_comentario_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_comentario_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositorio`
--

DROP TABLE IF EXISTS `repositorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repositorio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_setor` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_pasta` int NOT NULL,
  `arquivo` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nome` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `descricao` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `data_criacao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositorio`
--

LOCK TABLES `repositorio` WRITE;
/*!40000 ALTER TABLE `repositorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setor`
--

DROP TABLE IF EXISTS `setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `orgao` int DEFAULT '1',
  `setorPai` int DEFAULT '1',
  `sigla` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `endereco` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `artigo` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `dono` int DEFAULT NULL,
  `funcionarios` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `restricao` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `repositorio` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '104857600',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setor`
--

LOCK TABLES `setor` WRITE;
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
INSERT INTO `setor` VALUES (1,'NOME DO ÓRGÃO',1,1,'ORG','','A',1,NULL,'N','104857600'),(2,'DIREÇÃO',1,1,'DIR','','A',1,NULL,'N','104857600'),(3,'COORDENADOR DE FINANÇAS',1,1,'COFIN','','A',1,NULL,'N','104857600'),(4,'ASSESSORIA JURÍDICA',1,1,'ASSJUR','','A',1,NULL,'N','104857600'),(5,'CÉLULA DE TECNOLOGIA',1,1,'CTI','','A',1,NULL,'N','104857600');
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setor_func_per`
--

DROP TABLE IF EXISTS `setor_func_per`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setor_func_per` (
  `id` int NOT NULL AUTO_INCREMENT,
  `setor` int NOT NULL,
  `usuario` int NOT NULL,
  `permissao` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setor_func_per`
--

LOCK TABLES `setor_func_per` WRITE;
/*!40000 ALTER TABLE `setor_func_per` DISABLE KEYS */;
/*!40000 ALTER TABLE `setor_func_per` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `abreviacao` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `inicio` int DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `publicado` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `tem_para` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'S',
  `cabecalho` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `rodape` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `layout` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `referencia` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N;N',
  `para` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N;N',
  `redacao` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N;N',
  `objetivo` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N;N',
  `documentacao` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N;N',
  `conclusao` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N;N',
  `processo` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N;N',
  `interessado` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N;N',
  `analise` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'N;N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'OFÍCIO','OF',NULL,NULL,'S','S','','','<p>Of&iacute;cio N&ordm; <strong>[numero]/[ano_doc]-[setor_doc]</strong></p>\n<p style=\"text-align: right;\">Fortaleza, [data].</p>\n<p>[para]</p>\n<p><strong>Assunto:</strong> [assunto]</p>\n<p><strong>Refer&ecirc;ncia:</strong> [referencia]</p>\n<p style=\"text-align: justify;\"><br />[redacao]</p>\n<p style=\"text-align: center;\"><br />[remetente_assinatura]</p>','S;S;Referência;0','S;S;Destinatário;0','S;S;Redação;0','N;N;;0','N;N;;0','N;N;;0','N;N;;0','N;N;;0','N;N;;0'),(2,'COMUNICAÇÃO INTERNA','CI',NULL,NULL,'S','S','','','<p>Comunica&ccedil;&atilde;o Interna N&ordm; <strong>[numero]/[ano_doc] - [setor_doc]</strong></p>\n<p style=\"text-align: right;\">Fortaleza, [data].</p>\n<p>[para]</p>\n<p><strong>Assunto:</strong> [assunto]</p>\n<p>[referencia]</p>\n<p>[anexos]</p>\n<p style=\"text-align: justify;\"><br />[redacao]</p>\n<p style=\"text-align: center;\">[remetente_assinatura]</p>','S;S;Referência;0','S;S;Para;0','S;S;Redação;0','N;N;;0','N;N;;0','N;N;;0','N;N;;0','N;N;;0','N;N;;0'),(3,'DESPACHO','DESP',NULL,NULL,'S','S','','','<table style=\"border: solid 1px black; background-color: #fff; color: black; border-collapse: collapse;\" width=\"100%\">\n<tbody>\n<tr>\n<td align=\"center\"><strong>[tipo_doc] N&ordm; [numero]/[ano_doc] - [setor_doc]</strong></td>\n</tr>\n</tbody>\n</table>\n<table style=\"margin-top: 15px; border: solid 1px black; background-color: #fff; color: black; border-collapse: collapse;\" width=\"100%\">\n<tbody>\n<tr>\n<td width=\"50%\"><strong> N&ordm;. do processo:</strong> [processo]</td>\n<td><strong>De:</strong> [setor_doc]</td>\n</tr>\n<tr>\n<td><strong>Interessado:</strong> [interessado]</td>\n<td><strong>Para:</strong> [para]</td>\n</tr>\n<tr>\n<td><strong>Assunto:</strong> [assunto]</td>\n<td><strong>Data:</strong> [data]</td>\n</tr>\n<tr>\n<td colspan=\"2\">[anexos]</td>\n</tr>\n</tbody>\n</table>\n<div style=\"margin-top: 15px; border: solid 1px black; background-color: #fff; color: black; height: 600px; width: 100%; padding-left: 10px; padding-right: 10px; text-align: justify; line-height: 140%; display: table;\">[redacao]\n<div style=\"margin-top: 37px; text-align: center;\">[remetente_assinatura]</div>\n</div>','N;N;;0','S;S;Para;0','S;S;Redação;4','N;N;;0','N;N;;0','N;N;;0','S;S;Processo;1','S;S;Interessado;2','N;N;;0');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ano`
--

DROP TABLE IF EXISTS `tipo_ano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_ano` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` int NOT NULL,
  `ano` int NOT NULL,
  `inicio` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ano`
--

LOCK TABLES `tipo_ano` WRITE;
/*!40000 ALTER TABLE `tipo_ano` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_ano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `nome` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `sobrenome` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `senha` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `confsenha` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `setor` int DEFAULT '1',
  `setores` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `nivel` int DEFAULT '2',
  `email` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `upload` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '2048',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'11111111111','ADMINISTRADOR','Administrador','21232f297a57a5a743894a0e4a801fc3','21232f297a57a5a743894a0e4a801fc3',1,'2',1,'admin@geradoc.com.br','2048'),(2,'22222222222','REDATOR',NULL,'eab9e1f8e8c7421c149be0fd8cae0114',NULL,0,'2',2,'redator@geradoc.com.br','2048');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow`
--

DROP TABLE IF EXISTS `workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow` (
  `id_workflow` int NOT NULL AUTO_INCREMENT,
  `id_documento` int NOT NULL,
  `id_setor_destino` int NOT NULL,
  `id_remetente` int NOT NULL,
  `id_recebedor` int DEFAULT NULL,
  `data_envio` datetime NOT NULL,
  `data_recebimento` datetime DEFAULT NULL,
  `data_recusa` datetime DEFAULT NULL,
  PRIMARY KEY (`id_workflow`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow`
--

LOCK TABLES `workflow` WRITE;
/*!40000 ALTER TABLE `workflow` DISABLE KEYS */;
INSERT INTO `workflow` VALUES (1,1,3,1,NULL,'2016-09-14 09:18:11',NULL,NULL);
/*!40000 ALTER TABLE `workflow` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-19  6:36:21
