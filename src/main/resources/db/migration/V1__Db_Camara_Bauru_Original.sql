-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: camara_bauru
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `acomp_materia`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acomp_materia` (
  `cod_cadastro` int NOT NULL AUTO_INCREMENT,
  `cod_materia` int NOT NULL,
  `end_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_hash` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_cadastro`),
  UNIQUE KEY `fk_{CCECA63D-5992-437B-BCD3-D7C98DA3E926}` (`cod_materia`,`end_email`),
  KEY `cod_materia` (`cod_materia`),
  CONSTRAINT `acomp_materia_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `afastamento`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `afastamento` (
  `cod_afastamento` int NOT NULL AUTO_INCREMENT,
  `cod_parlamentar` int NOT NULL,
  `cod_mandato` int NOT NULL,
  `num_legislatura` int NOT NULL,
  `tip_afastamento` tinyint NOT NULL,
  `dat_inicio_afastamento` date NOT NULL,
  `dat_fim_afastamento` date DEFAULT NULL,
  `cod_parlamentar_suplente` int NOT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_afastamento`),
  KEY `idx_parlamentar_mandato` (`cod_parlamentar`,`num_legislatura`),
  KEY `idx_afastamento_datas` (`cod_parlamentar`,`dat_inicio_afastamento`,`dat_fim_afastamento`),
  KEY `idx_tip_afastamento` (`tip_afastamento`),
  KEY `idx__parlamentar_suplente` (`cod_parlamentar_suplente`,`num_legislatura`),
  KEY `cod_mandato` (`cod_mandato`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  KEY `num_legislatura` (`num_legislatura`),
  KEY `cod_parlamentar_suplente` (`cod_parlamentar_suplente`),
  CONSTRAINT `afastamento_ibfk_1` FOREIGN KEY (`cod_mandato`) REFERENCES `mandato` (`cod_mandato`) ON DELETE CASCADE,
  CONSTRAINT `afastamento_ibfk_2` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`) ON DELETE CASCADE,
  CONSTRAINT `afastamento_ibfk_4` FOREIGN KEY (`num_legislatura`) REFERENCES `legislatura` (`num_legislatura`),
  CONSTRAINT `afastamento_ibfk_5` FOREIGN KEY (`tip_afastamento`) REFERENCES `tipo_afastamento` (`tip_afastamento`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anexada`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anexada` (
  `cod_materia_principal` int NOT NULL,
  `cod_materia_anexada` int NOT NULL,
  `dat_anexacao` date NOT NULL,
  `dat_desanexacao` date DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_materia_principal`,`cod_materia_anexada`),
  KEY `idx_materia_anexada` (`cod_materia_anexada`),
  KEY `idx_materia_principal` (`cod_materia_principal`),
  CONSTRAINT `anexada_ibfk_1` FOREIGN KEY (`cod_materia_anexada`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE,
  CONSTRAINT `anexada_ibfk_2` FOREIGN KEY (`cod_materia_principal`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anexo_norma`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anexo_norma` (
  `cod_anexo` int NOT NULL AUTO_INCREMENT,
  `cod_norma` int NOT NULL,
  `txt_descricao` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_anexo`),
  KEY `cod_norma` (`cod_norma`),
  CONSTRAINT `anexo_norma_ibfk_1` FOREIGN KEY (`cod_norma`) REFERENCES `norma_juridica` (`cod_norma`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arquivo_armario`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arquivo_armario` (
  `cod_armario` int NOT NULL AUTO_INCREMENT,
  `cod_corredor` int DEFAULT NULL,
  `cod_unidade` int NOT NULL,
  `nom_armario` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_armario`),
  KEY `cod_corredor` (`cod_corredor`),
  KEY `cod_unidade` (`cod_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arquivo_corredor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arquivo_corredor` (
  `cod_corredor` int NOT NULL AUTO_INCREMENT,
  `cod_unidade` int NOT NULL,
  `nom_corredor` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_corredor`),
  KEY `cod_unidade` (`cod_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arquivo_item`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arquivo_item` (
  `cod_item` int NOT NULL AUTO_INCREMENT,
  `cod_recipiente` int NOT NULL,
  `tip_suporte` int NOT NULL,
  `cod_materia` int DEFAULT NULL,
  `cod_norma` int DEFAULT NULL,
  `cod_documento` int DEFAULT NULL,
  `cod_protocolo` int(7) unsigned zerofill DEFAULT NULL,
  `des_item` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dat_arquivamento` date NOT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_item`),
  KEY `cod_recipiente` (`cod_recipiente`),
  KEY `cod_materia` (`cod_materia`),
  KEY `cod_norma` (`cod_norma`),
  KEY `cod_documento` (`cod_documento`),
  KEY `cod_protocolo` (`cod_protocolo`),
  KEY `tip_suporte` (`tip_suporte`)
) ENGINE=InnoDB AUTO_INCREMENT=39056 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arquivo_prateleira`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arquivo_prateleira` (
  `cod_prateleira` int NOT NULL AUTO_INCREMENT,
  `cod_armario` int DEFAULT NULL,
  `cod_corredor` int DEFAULT NULL,
  `cod_unidade` int NOT NULL,
  `nom_prateleira` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_prateleira`),
  KEY `cod_armario` (`cod_armario`),
  KEY `cod_corredor` (`cod_corredor`),
  KEY `cod_unidade` (`cod_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arquivo_recipiente`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arquivo_recipiente` (
  `cod_recipiente` int NOT NULL AUTO_INCREMENT,
  `tip_recipiente` int NOT NULL,
  `num_recipiente` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tip_tit_documental` int NOT NULL,
  `ano_recipiente` smallint NOT NULL,
  `dat_recipiente` date NOT NULL,
  `cod_corredor` int DEFAULT NULL,
  `cod_armario` int DEFAULT NULL,
  `cod_prateleira` int DEFAULT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `num_folha_recipiente` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_recipiente`),
  UNIQUE KEY `num_tipo_recipiente` (`num_recipiente`,`tip_recipiente`,`ano_recipiente`,`ind_excluido`),
  KEY `tip_recipiente` (`tip_recipiente`),
  KEY `tip_tit_documental` (`tip_tit_documental`)
) ENGINE=InnoDB AUTO_INCREMENT=871 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arquivo_tipo_recipiente`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arquivo_tipo_recipiente` (
  `tip_recipiente` int NOT NULL AUTO_INCREMENT,
  `des_tipo_recipiente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_recipiente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arquivo_tipo_suporte`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arquivo_tipo_suporte` (
  `tip_suporte` int NOT NULL AUTO_INCREMENT,
  `des_tipo_suporte` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_suporte`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arquivo_tipo_tit_documental`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arquivo_tipo_tit_documental` (
  `tip_tit_documental` int NOT NULL AUTO_INCREMENT,
  `sgl_tip_tit_documental` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `des_tipo_tit_documental` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_tit_documental`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arquivo_unidade`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arquivo_unidade` (
  `cod_unidade` int NOT NULL AUTO_INCREMENT,
  `tip_extensao_atuacao` int NOT NULL,
  `tip_estagio_evolucao` int NOT NULL,
  `nom_unidade` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txt_localizacao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessor_parlamentar`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessor_parlamentar` (
  `cod_assessor` int NOT NULL AUTO_INCREMENT,
  `cod_parlamentar` int NOT NULL,
  `nom_assessor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `des_cargo` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dat_nascimento` date DEFAULT NULL,
  `num_cpf` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_rg` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tit_eleitor` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_residencial` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_cep_resid` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tel_resid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tel_celular` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_nomeacao` date NOT NULL,
  `dat_exoneracao` date DEFAULT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `col_username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_assessor`),
  UNIQUE KEY `assessor_parlamentar` (`cod_assessor`,`cod_parlamentar`,`ind_excluido`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  KEY `col_username` (`col_username`),
  CONSTRAINT `assessor_parlamentar_ibfk_1` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assinatura_documento`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assinatura_documento` (
  `cod_assinatura_doc` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` int NOT NULL,
  `tipo_doc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dat_solicitacao` datetime NOT NULL,
  `cod_usuario` int NOT NULL,
  `dat_assinatura` datetime DEFAULT NULL,
  `ind_assinado` tinyint NOT NULL DEFAULT '0',
  `ind_prim_assinatura` tinyint NOT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  UNIQUE KEY `cod_assinatura_doc_2` (`cod_assinatura_doc`,`codigo`,`tipo_doc`,`cod_usuario`),
  KEY `cod_usuario` (`cod_usuario`),
  CONSTRAINT `assinatura_documento_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assinatura_storage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assinatura_storage` (
  `tip_documento` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pdf_location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pdf_file` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pdf_signed` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tip_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assunto_materia`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assunto_materia` (
  `cod_assunto` int NOT NULL AUTO_INCREMENT,
  `des_assunto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `des_estendida` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_assunto`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assunto_norma`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assunto_norma` (
  `cod_assunto` int NOT NULL AUTO_INCREMENT,
  `des_assunto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_estendida` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_assunto`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `cod_autor` int NOT NULL AUTO_INCREMENT,
  `cod_partido` int DEFAULT NULL,
  `cod_comissao` int DEFAULT NULL,
  `cod_bancada` int DEFAULT NULL,
  `cod_parlamentar` int DEFAULT NULL,
  `tip_autor` tinyint NOT NULL,
  `nom_autor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_cargo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_autor`),
  KEY `idx_tip_autor` (`tip_autor`),
  KEY `idx_parlamentar` (`cod_parlamentar`),
  KEY `idx_comissao` (`cod_comissao`),
  KEY `idx_partido` (`cod_partido`),
  KEY `idx_bancada` (`cod_bancada`),
  KEY `col_username` (`col_username`),
  FULLTEXT KEY `nom_autor` (`nom_autor`),
  CONSTRAINT `autor_ibfk_1` FOREIGN KEY (`cod_bancada`) REFERENCES `bancada` (`cod_bancada`),
  CONSTRAINT `autor_ibfk_2` FOREIGN KEY (`cod_comissao`) REFERENCES `comissao` (`cod_comissao`),
  CONSTRAINT `autor_ibfk_3` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `autor_ibfk_4` FOREIGN KEY (`cod_partido`) REFERENCES `partido` (`cod_partido`),
  CONSTRAINT `autor_ibfk_5` FOREIGN KEY (`tip_autor`) REFERENCES `tipo_autor` (`tip_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=637 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autoria`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoria` (
  `cod_autor` int NOT NULL,
  `cod_materia` int NOT NULL,
  `ind_primeiro_autor` tinyint NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_autor`,`cod_materia`),
  KEY `idx_materia` (`cod_materia`),
  KEY `idx_autor` (`cod_autor`),
  CONSTRAINT `autoria_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE,
  CONSTRAINT `autoria_ibfk_2` FOREIGN KEY (`cod_autor`) REFERENCES `autor` (`cod_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autoria_emenda`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoria_emenda` (
  `cod_autor` int NOT NULL,
  `cod_emenda` int NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_autor`,`cod_emenda`),
  KEY `idx_autor` (`cod_autor`),
  KEY `idx_emenda` (`cod_emenda`) USING BTREE,
  CONSTRAINT `autoria_emenda_ibfk_1` FOREIGN KEY (`cod_autor`) REFERENCES `autor` (`cod_autor`),
  CONSTRAINT `autoria_emenda_ibfk_2` FOREIGN KEY (`cod_emenda`) REFERENCES `emenda` (`cod_emenda`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autoria_substitutivo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoria_substitutivo` (
  `cod_autor` int NOT NULL,
  `cod_substitutivo` int NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_autor`,`cod_substitutivo`),
  KEY `idx_autor` (`cod_autor`),
  KEY `idx_substitutivo` (`cod_substitutivo`) USING BTREE,
  CONSTRAINT `autoria_substitutivo_ibfk_1` FOREIGN KEY (`cod_autor`) REFERENCES `autor` (`cod_autor`),
  CONSTRAINT `autoria_substitutivo_ibfk_2` FOREIGN KEY (`cod_substitutivo`) REFERENCES `substitutivo` (`cod_substitutivo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bancada`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bancada` (
  `cod_bancada` int NOT NULL AUTO_INCREMENT,
  `num_legislatura` int NOT NULL,
  `cod_partido` int DEFAULT NULL,
  `nom_bancada` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dat_criacao` date DEFAULT NULL,
  `dat_extincao` date DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_bancada`),
  KEY `idt_nom_bancada` (`nom_bancada`),
  KEY `num_legislatura` (`num_legislatura`),
  KEY `cod_partido` (`cod_partido`),
  FULLTEXT KEY `nom_bancada` (`nom_bancada`),
  CONSTRAINT `bancada_ibfk_1` FOREIGN KEY (`cod_partido`) REFERENCES `partido` (`cod_partido`),
  CONSTRAINT `bancada_ibfk_2` FOREIGN KEY (`num_legislatura`) REFERENCES `legislatura` (`num_legislatura`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cargo_bancada`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo_bancada` (
  `cod_cargo` tinyint NOT NULL AUTO_INCREMENT,
  `des_cargo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_unico` tinyint NOT NULL DEFAULT '0',
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cargo_comissao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo_comissao` (
  `cod_cargo` tinyint NOT NULL AUTO_INCREMENT,
  `des_cargo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_unico` tinyint NOT NULL DEFAULT '0',
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cargo_executivo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo_executivo` (
  `cod_cargo` tinyint NOT NULL AUTO_INCREMENT,
  `des_cargo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cargo_mesa`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo_mesa` (
  `cod_cargo` tinyint NOT NULL AUTO_INCREMENT,
  `des_cargo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_unico` tinyint NOT NULL DEFAULT '0',
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `casa_legislativa`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casa_legislativa` (
  `cod_casa` int NOT NULL AUTO_INCREMENT,
  `nom_casa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sgl_casa` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_casa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_localidade` int NOT NULL,
  `num_cep` int NOT NULL,
  `num_tel` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txt_senha_inicial` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_protocolo_anual` tinyint(1) NOT NULL,
  `acompanhamento_materia` tinyint(1) NOT NULL,
  `restpki_access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  KEY `idx_localidade` (`cod_localidade`),
  KEY `cod_casa` (`cod_casa`),
  CONSTRAINT `casa_legislativa_ibfk_1` FOREIGN KEY (`cod_localidade`) REFERENCES `localidade` (`cod_localidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categoria_instituicao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_instituicao` (
  `tip_instituicao` int NOT NULL,
  `cod_categoria` int NOT NULL,
  `des_categoria` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_categoria`,`tip_instituicao`) USING BTREE,
  KEY `tip_instituicao` (`tip_instituicao`) USING BTREE,
  CONSTRAINT `idx_tip_instituicao` FOREIGN KEY (`tip_instituicao`) REFERENCES `tipo_instituicao` (`tip_instituicao`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coautoria_proposicao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coautoria_proposicao` (
  `cod_proposicao` int NOT NULL,
  `cod_autor` int NOT NULL,
  `ind_aderido` tinyint NOT NULL DEFAULT '0',
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_proposicao`,`cod_autor`),
  KEY `idx_proposicao` (`cod_proposicao`),
  KEY `idx_autor` (`cod_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coligacao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coligacao` (
  `cod_coligacao` int NOT NULL AUTO_INCREMENT,
  `num_legislatura` int NOT NULL,
  `nom_coligacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_votos_coligacao` int DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_coligacao`),
  KEY `idx_legislatura` (`num_legislatura`),
  KEY `idx_coligacao_legislatura` (`num_legislatura`,`ind_excluido`),
  CONSTRAINT `coligacao_ibfk_1` FOREIGN KEY (`num_legislatura`) REFERENCES `legislatura` (`num_legislatura`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comissao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comissao` (
  `cod_comissao` int NOT NULL AUTO_INCREMENT,
  `tip_comissao` tinyint NOT NULL,
  `nom_comissao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sgl_comissao` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_criacao` date NOT NULL,
  `dat_extincao` date DEFAULT NULL,
  `nom_apelido_temp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_instalacao_temp` date DEFAULT NULL,
  `dat_final_prevista_temp` date DEFAULT NULL,
  `dat_prorrogada_temp` date DEFAULT NULL,
  `dat_fim_comissao` date DEFAULT NULL,
  `nom_secretario` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tel_reuniao` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_secretaria` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tel_secretaria` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_fax_secretaria` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_agenda_reuniao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loc_reuniao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_finalidade` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `end_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_unid_deliberativa` tinyint NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_comissao`),
  KEY `idx_comissao_tipo` (`tip_comissao`),
  KEY `idx_comissao_nome` (`nom_comissao`),
  FULLTEXT KEY `nom_comissao` (`nom_comissao`),
  CONSTRAINT `comissao_ibfk_1` FOREIGN KEY (`tip_comissao`) REFERENCES `tipo_comissao` (`tip_comissao`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composicao_bancada`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composicao_bancada` (
  `cod_comp_bancada` int NOT NULL AUTO_INCREMENT,
  `cod_parlamentar` int NOT NULL,
  `cod_bancada` int NOT NULL,
  `cod_periodo_comp` int DEFAULT NULL,
  `cod_cargo` tinyint NOT NULL,
  `ind_titular` tinyint NOT NULL,
  `dat_designacao` date NOT NULL,
  `dat_desligamento` date DEFAULT NULL,
  `des_motivo_desligamento` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `obs_composicao` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_comp_bancada`),
  KEY `idx_cargo` (`cod_cargo`),
  KEY `idx_bancada` (`cod_bancada`),
  KEY `idx_parlamentar` (`cod_parlamentar`),
  KEY `cod_periodo_comp` (`cod_periodo_comp`),
  CONSTRAINT `composicao_bancada_ibfk_1` FOREIGN KEY (`cod_bancada`) REFERENCES `bancada` (`cod_bancada`),
  CONSTRAINT `composicao_bancada_ibfk_2` FOREIGN KEY (`cod_cargo`) REFERENCES `cargo_bancada` (`cod_cargo`),
  CONSTRAINT `composicao_bancada_ibfk_3` FOREIGN KEY (`cod_periodo_comp`) REFERENCES `periodo_comp_bancada` (`cod_periodo_comp`),
  CONSTRAINT `composicao_bancada_ibfk_4` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composicao_coligacao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composicao_coligacao` (
  `cod_partido` int NOT NULL,
  `cod_coligacao` int NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_partido`,`cod_coligacao`),
  KEY `idx_coligacao` (`cod_coligacao`),
  KEY `idx_partido` (`cod_partido`),
  CONSTRAINT `composicao_coligacao_ibfk_1` FOREIGN KEY (`cod_partido`) REFERENCES `partido` (`cod_partido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composicao_comissao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composicao_comissao` (
  `cod_comp_comissao` int NOT NULL AUTO_INCREMENT,
  `cod_parlamentar` int NOT NULL,
  `cod_comissao` int NOT NULL,
  `cod_periodo_comp` int NOT NULL,
  `cod_cargo` tinyint NOT NULL,
  `ind_titular` tinyint NOT NULL,
  `dat_designacao` date NOT NULL,
  `dat_desligamento` date DEFAULT NULL,
  `des_motivo_desligamento` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `obs_composicao` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_comp_comissao`),
  KEY `idx_cargo` (`cod_cargo`),
  KEY `idx_periodo_comp` (`cod_periodo_comp`),
  KEY `idx_comissao` (`cod_comissao`),
  KEY `idx_parlamentar` (`cod_parlamentar`),
  CONSTRAINT `composicao_comissao_ibfk_1` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `composicao_comissao_ibfk_2` FOREIGN KEY (`cod_cargo`) REFERENCES `cargo_comissao` (`cod_cargo`),
  CONSTRAINT `composicao_comissao_ibfk_3` FOREIGN KEY (`cod_comissao`) REFERENCES `comissao` (`cod_comissao`),
  CONSTRAINT `composicao_comissao_ibfk_4` FOREIGN KEY (`cod_periodo_comp`) REFERENCES `periodo_comp_comissao` (`cod_periodo_comp`)
) ENGINE=InnoDB AUTO_INCREMENT=564 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composicao_executivo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composicao_executivo` (
  `cod_composicao` int NOT NULL AUTO_INCREMENT,
  `num_legislatura` int NOT NULL,
  `nom_completo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_cargo` tinyint NOT NULL,
  `cod_partido` int DEFAULT NULL,
  `dat_inicio_mandato` date DEFAULT NULL,
  `dat_fim_mandato` date DEFAULT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_composicao`),
  KEY `num_legislatura` (`num_legislatura`),
  KEY `cod_cargo` (`cod_cargo`),
  KEY `cod_partido` (`cod_partido`),
  CONSTRAINT `composicao_executivo_ibfk_1` FOREIGN KEY (`cod_partido`) REFERENCES `partido` (`cod_partido`),
  CONSTRAINT `composicao_executivo_ibfk_2` FOREIGN KEY (`num_legislatura`) REFERENCES `legislatura` (`num_legislatura`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composicao_mesa`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composicao_mesa` (
  `cod_parlamentar` int NOT NULL,
  `cod_sessao_leg` int DEFAULT NULL,
  `cod_periodo_comp` int NOT NULL,
  `cod_cargo` tinyint NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_parlamentar`,`cod_periodo_comp`,`cod_cargo`),
  KEY `idx_cargo` (`cod_cargo`),
  KEY `idx_periodo_comp` (`cod_periodo_comp`),
  KEY `idx_parlamentar` (`cod_parlamentar`),
  KEY `cod_sessao_leg` (`cod_sessao_leg`),
  CONSTRAINT `composicao_mesa_ibfk_1` FOREIGN KEY (`cod_cargo`) REFERENCES `cargo_mesa` (`cod_cargo`),
  CONSTRAINT `composicao_mesa_ibfk_2` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `composicao_mesa_ibfk_3` FOREIGN KEY (`cod_periodo_comp`) REFERENCES `periodo_comp_mesa` (`cod_periodo_comp`),
  CONSTRAINT `composicao_mesa_ibfk_4` FOREIGN KEY (`cod_sessao_leg`) REFERENCES `sessao_legislativa` (`cod_sessao_leg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dependente`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependente` (
  `cod_dependente` int NOT NULL AUTO_INCREMENT,
  `tip_dependente` tinyint NOT NULL,
  `cod_parlamentar` int NOT NULL,
  `nom_dependente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex_dependente` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_nascimento` date DEFAULT NULL,
  `num_cpf` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_rg` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tit_eleitor` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_dependente`),
  KEY `idx_dep_parlam` (`tip_dependente`,`cod_parlamentar`,`ind_excluido`),
  KEY `idx_dependente` (`tip_dependente`),
  KEY `idx_parlamentar` (`cod_parlamentar`),
  CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `dependente_ibfk_2` FOREIGN KEY (`tip_dependente`) REFERENCES `tipo_dependente` (`tip_dependente`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `despacho_inicial`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despacho_inicial` (
  `cod_materia` int NOT NULL,
  `num_ordem` tinyint unsigned NOT NULL,
  `cod_comissao` int NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  UNIQUE KEY `idx_unique` (`cod_materia`,`num_ordem`),
  KEY `idx_comissao` (`cod_comissao`),
  KEY `idx_materia` (`cod_materia`),
  KEY `idx_despinic_comissao` (`cod_materia`,`num_ordem`,`cod_comissao`),
  CONSTRAINT `despacho_inicial_ibfk_1` FOREIGN KEY (`cod_comissao`) REFERENCES `comissao` (`cod_comissao`),
  CONSTRAINT `despacho_inicial_ibfk_2` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `destinatario_oficio`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinatario_oficio` (
  `cod_destinatario` int NOT NULL AUTO_INCREMENT,
  `cod_documento` int NOT NULL,
  `cod_instituicao` int NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_destinatario`),
  KEY `cod_documento` (`cod_documento`),
  KEY `cod_instituicao` (`cod_instituicao`)
) ENGINE=InnoDB AUTO_INCREMENT=27844 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documento_acessorio`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento_acessorio` (
  `cod_documento` int NOT NULL AUTO_INCREMENT,
  `cod_materia` int NOT NULL,
  `tip_documento` int NOT NULL,
  `nom_documento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_documento` date DEFAULT NULL,
  `num_protocolo` int DEFAULT NULL,
  `nom_autor_documento` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_ementa` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `txt_indexacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_documento`),
  KEY `idx_tip_documento` (`tip_documento`),
  KEY `idx_materia` (`cod_materia`),
  FULLTEXT KEY `idx_ementa` (`txt_ementa`)
) ENGINE=InnoDB AUTO_INCREMENT=11505 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documento_acessorio_administrativo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento_acessorio_administrativo` (
  `cod_documento_acessorio` int NOT NULL AUTO_INCREMENT,
  `cod_documento` int NOT NULL DEFAULT '0',
  `tip_documento` int NOT NULL DEFAULT '0',
  `nom_documento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_arquivo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_documento` date DEFAULT NULL,
  `nom_autor_documento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_assunto` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `txt_indexacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_documento_acessorio`),
  KEY `idx_tip_documento` (`tip_documento`),
  KEY `idx_documento` (`cod_documento`),
  KEY `idx_autor_documento` (`nom_autor_documento`),
  KEY `idx_dat_documento` (`dat_documento`),
  FULLTEXT KEY `idx_assunto` (`txt_assunto`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documento_administrativo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento_administrativo` (
  `cod_documento` int NOT NULL AUTO_INCREMENT,
  `tip_documento` int NOT NULL,
  `num_documento` int NOT NULL,
  `ano_documento` smallint NOT NULL DEFAULT '0',
  `dat_documento` date NOT NULL,
  `num_protocolo` int DEFAULT NULL,
  `txt_interessado` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_autor` int DEFAULT NULL,
  `cod_entidade` int DEFAULT NULL,
  `cod_materia` int DEFAULT NULL,
  `num_dias_prazo` tinyint DEFAULT NULL,
  `dat_fim_prazo` date DEFAULT NULL,
  `ind_tramitacao` tinyint NOT NULL DEFAULT '0',
  `txt_assunto` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cod_situacao` int DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_documento`),
  KEY `tip_documento` (`tip_documento`,`num_documento`,`ano_documento`),
  KEY `cod_situacao` (`cod_situacao`),
  KEY `cod_materia` (`cod_materia`),
  KEY `cod_entidade` (`cod_entidade`),
  KEY `cod_autor` (`cod_autor`),
  KEY `ano_documento` (`ano_documento`),
  KEY `dat_documento` (`dat_documento`),
  KEY `num_protocolo` (`num_protocolo`),
  FULLTEXT KEY `idx_busca_documento` (`txt_assunto`,`txt_observacao`),
  FULLTEXT KEY `txt_interessado` (`txt_interessado`)
) ENGINE=InnoDB AUTO_INCREMENT=25895 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documento_administrativo_materia`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento_administrativo_materia` (
  `cod_vinculo` int NOT NULL AUTO_INCREMENT,
  `cod_documento` int NOT NULL,
  `cod_materia` int NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_vinculo`),
  KEY `idx_cod_documento` (`cod_documento`),
  KEY `idx_cod_materia` (`cod_materia`),
  CONSTRAINT `documento_administrativo_materia_ibfk_1` FOREIGN KEY (`cod_documento`) REFERENCES `documento_administrativo` (`cod_documento`) ON DELETE CASCADE,
  CONSTRAINT `documento_administrativo_materia_ibfk_2` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53775 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documento_administrativo_vinculado`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento_administrativo_vinculado` (
  `cod_vinculo` int NOT NULL AUTO_INCREMENT,
  `cod_documento_vinculante` int NOT NULL,
  `cod_documento_vinculado` int NOT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_vinculo`),
  UNIQUE KEY `idx_doc_vinculo` (`cod_documento_vinculante`,`cod_documento_vinculado`),
  KEY `idx_doc_vinculado` (`cod_documento_vinculado`) USING BTREE,
  KEY `idx_cod_documento` (`cod_documento_vinculante`) USING BTREE,
  CONSTRAINT `documento_administrativo_vinculado_ibfk_1` FOREIGN KEY (`cod_documento_vinculado`) REFERENCES `documento_administrativo` (`cod_documento`) ON DELETE CASCADE,
  CONSTRAINT `documento_administrativo_vinculado_ibfk_2` FOREIGN KEY (`cod_documento_vinculante`) REFERENCES `documento_administrativo` (`cod_documento`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documento_comissao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento_comissao` (
  `cod_documento` int NOT NULL AUTO_INCREMENT,
  `cod_comissao` int NOT NULL,
  `dat_documento` date NOT NULL,
  `txt_descricao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txt_observacao` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_documento`),
  KEY `cod_comissao` (`cod_comissao`),
  FULLTEXT KEY `txt_descricao` (`txt_descricao`),
  CONSTRAINT `documento_comissao_ibfk_1` FOREIGN KEY (`cod_comissao`) REFERENCES `comissao` (`cod_comissao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emenda`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emenda` (
  `cod_emenda` int NOT NULL AUTO_INCREMENT,
  `tip_emenda` int NOT NULL,
  `num_emenda` int NOT NULL,
  `cod_materia` int NOT NULL,
  `cod_autor` int DEFAULT NULL,
  `num_protocolo` int DEFAULT NULL,
  `dat_apresentacao` date DEFAULT NULL,
  `txt_ementa` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_observacao` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exc_pauta` tinyint DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_emenda`),
  KEY `idx_cod_materia` (`cod_materia`),
  KEY `idx_tip_emenda` (`tip_emenda`),
  KEY `idx_emenda` (`cod_emenda`,`tip_emenda`,`cod_materia`) USING BTREE,
  KEY `cod_autor` (`cod_autor`),
  FULLTEXT KEY `idx_txt_ementa` (`txt_ementa`),
  CONSTRAINT `emenda_ibfk_1` FOREIGN KEY (`tip_emenda`) REFERENCES `tipo_emenda` (`tip_emenda`),
  CONSTRAINT `emenda_ibfk_2` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=979 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `encerramento_presenca`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encerramento_presenca` (
  `cod_presenca_encerramento` int NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int NOT NULL DEFAULT '0',
  `cod_parlamentar` int NOT NULL,
  `dat_ordem` date NOT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_presenca_encerramento`),
  UNIQUE KEY `idx_sessao_parlamentar` (`cod_sessao_plen`,`cod_parlamentar`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  KEY `dat_ordem` (`dat_ordem`),
  KEY `cod_sessao_plen` (`cod_sessao_plen`),
  CONSTRAINT `encerramento_presenca_ibfk_1` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `encerramento_presenca_ibfk_2` FOREIGN KEY (`cod_sessao_plen`) REFERENCES `sessao_plenaria` (`cod_sessao_plen`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expediente_discussao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expediente_discussao` (
  `cod_ordem` int NOT NULL,
  `cod_parlamentar` int NOT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_ordem`,`cod_parlamentar`) USING BTREE,
  KEY `cod_ordem` (`cod_ordem`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  CONSTRAINT `expediente_discussao_ibfk_1` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `fk_cod_ordem` FOREIGN KEY (`cod_ordem`) REFERENCES `expediente_materia` (`cod_ordem`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expediente_materia`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expediente_materia` (
  `cod_ordem` int NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int NOT NULL,
  `cod_materia` int DEFAULT NULL,
  `cod_parecer` int DEFAULT NULL,
  `dat_ordem` date NOT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL,
  `num_ordem` int DEFAULT NULL,
  `txt_resultado` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tip_votacao` int NOT NULL,
  `tip_quorum` int NOT NULL,
  PRIMARY KEY (`cod_ordem`),
  KEY `idx_exped_datord` (`dat_ordem`,`ind_excluido`),
  KEY `cod_sessao_plen` (`cod_sessao_plen`),
  KEY `cod_materia` (`cod_materia`),
  KEY `tip_votacao` (`tip_votacao`),
  KEY `tip_quorum` (`tip_quorum`),
  KEY `cod_parecer` (`cod_parecer`),
  CONSTRAINT `expediente_materia_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`),
  CONSTRAINT `expediente_materia_ibfk_2` FOREIGN KEY (`cod_parecer`) REFERENCES `parecer` (`cod_relatoria`),
  CONSTRAINT `expediente_materia_ibfk_3` FOREIGN KEY (`cod_sessao_plen`) REFERENCES `sessao_plenaria` (`cod_sessao_plen`) ON DELETE CASCADE,
  CONSTRAINT `expediente_materia_ibfk_4` FOREIGN KEY (`tip_quorum`) REFERENCES `quorum_votacao` (`cod_quorum`),
  CONSTRAINT `expediente_materia_ibfk_5` FOREIGN KEY (`tip_votacao`) REFERENCES `tipo_votacao` (`tip_votacao`)
) ENGINE=InnoDB AUTO_INCREMENT=57007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expediente_presenca`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expediente_presenca` (
  `cod_presenca_expediente` int NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int NOT NULL DEFAULT '0',
  `cod_parlamentar` int NOT NULL,
  `dat_ordem` date NOT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_presenca_expediente`),
  UNIQUE KEY `idx_sessao_parlamentar` (`cod_sessao_plen`,`cod_parlamentar`),
  KEY `cod_sessao_plen` (`cod_sessao_plen`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  KEY `dat_ordem` (`dat_ordem`,`ind_excluido`),
  CONSTRAINT `expediente_presenca_ibfk_1` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `expediente_presenca_ibfk_2` FOREIGN KEY (`cod_sessao_plen`) REFERENCES `sessao_plenaria` (`cod_sessao_plen`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expediente_sessao_plenaria`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expediente_sessao_plenaria` (
  `cod_sessao_plen` int NOT NULL,
  `cod_expediente` int NOT NULL,
  `txt_expediente` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_sessao_plen`,`cod_expediente`),
  KEY `cod_expediente` (`cod_expediente`),
  CONSTRAINT `expediente_sessao_plenaria_ibfk_1` FOREIGN KEY (`cod_sessao_plen`) REFERENCES `sessao_plenaria` (`cod_sessao_plen`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filiacao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filiacao` (
  `dat_filiacao` date NOT NULL,
  `cod_parlamentar` int NOT NULL,
  `cod_partido` int NOT NULL,
  `dat_desfiliacao` date DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`dat_filiacao`,`cod_parlamentar`,`cod_partido`),
  KEY `idx_partido` (`cod_partido`),
  KEY `idx_parlamentar` (`cod_parlamentar`),
  CONSTRAINT `filiacao_ibfk_1` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `filiacao_ibfk_2` FOREIGN KEY (`cod_partido`) REFERENCES `partido` (`cod_partido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funcionario`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `cod_funcionario` int NOT NULL AUTO_INCREMENT,
  `nom_funcionario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_usuario` int DEFAULT NULL,
  `des_cargo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_cadastro` date NOT NULL,
  `ind_ativo` tinyint NOT NULL DEFAULT '1',
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_funcionario`),
  KEY `cod_usuario` (`cod_usuario`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gabinete_atendimento`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gabinete_atendimento` (
  `cod_atendimento` int NOT NULL AUTO_INCREMENT,
  `cod_parlamentar` int NOT NULL,
  `cod_eleitor` int NOT NULL,
  `dat_atendimento` date NOT NULL,
  `txt_assunto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dat_resultado` date DEFAULT NULL,
  `txt_resultado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_atendente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_atendimento`),
  KEY `idx_resultado` (`txt_resultado`) USING BTREE,
  KEY `idx_eleitor` (`cod_eleitor`) USING BTREE,
  KEY `idx_parlamentar` (`cod_parlamentar`) USING BTREE,
  FULLTEXT KEY `idx_assunto` (`txt_assunto`),
  CONSTRAINT `gabinete_atendimento_ibfk_1` FOREIGN KEY (`cod_eleitor`) REFERENCES `gabinete_eleitor` (`cod_eleitor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gabinete_atendimento_ibfk_2` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gabinete_eleitor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gabinete_eleitor` (
  `cod_eleitor` int NOT NULL AUTO_INCREMENT,
  `cod_parlamentar` int NOT NULL,
  `dat_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nom_eleitor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex_eleitor` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_nascimento` date DEFAULT NULL,
  `des_estado_civil` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_identidade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_cpf` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_classe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_profissao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_escolaridade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tit_eleitor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_residencial` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_bairro` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_cep` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_localidade` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sgl_uf` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_telefone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_celular` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_conjuge` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_dependentes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `des_local_trabalho` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_atualizacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_eleitor`),
  KEY `sex_eleitor` (`sex_eleitor`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  FULLTEXT KEY `nom_eleitor` (`nom_eleitor`),
  FULLTEXT KEY `des_profissao` (`des_profissao`),
  FULLTEXT KEY `end_residencial` (`end_residencial`),
  FULLTEXT KEY `nom_localidade` (`nom_localidade`),
  FULLTEXT KEY `des_local_trabalho` (`des_local_trabalho`),
  FULLTEXT KEY `nom_bairro` (`nom_bairro`),
  CONSTRAINT `gabinete_eleitor_ibfk_1` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instituicao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instituicao` (
  `cod_instituicao` int NOT NULL AUTO_INCREMENT,
  `tip_instituicao` int NOT NULL,
  `cod_categoria` int DEFAULT NULL,
  `nom_instituicao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_instituicao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nom_bairro` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_localidade` int DEFAULT NULL,
  `num_cep` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_telefone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_fax` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_web` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_responsavel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_cargo` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_forma_tratamento` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_observacao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  `dat_insercao` datetime DEFAULT NULL,
  `txt_user_insercao` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_ip_insercao` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `txt_user_alteracao` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_ip_alteracao` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cod_instituicao`),
  KEY `tip_instituicao` (`tip_instituicao`),
  KEY `cod_categoria` (`cod_categoria`),
  KEY `cod_localidade` (`cod_localidade`),
  KEY `ind_excluido` (`ind_excluido`),
  KEY `idx_cod_cat` (`tip_instituicao`,`cod_categoria`),
  FULLTEXT KEY `idx_nom_instituicao` (`nom_instituicao`),
  FULLTEXT KEY `idx_nom_responsavel` (`nom_responsavel`),
  CONSTRAINT `instituicao_ibfk_2` FOREIGN KEY (`tip_instituicao`) REFERENCES `tipo_instituicao` (`tip_instituicao`),
  CONSTRAINT `instituicao_ibfk_3` FOREIGN KEY (`cod_localidade`) REFERENCES `localidade` (`cod_localidade`)
) ENGINE=InnoDB AUTO_INCREMENT=5750 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `legislacao_citada`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legislacao_citada` (
  `cod_materia` int NOT NULL,
  `cod_norma` int NOT NULL,
  `des_disposicoes` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_parte` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_livro` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_titulo` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_capitulo` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_secao` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_subsecao` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_artigo` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_paragrafo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_inciso` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_alinea` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_item` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_materia`,`cod_norma`),
  KEY `cod_norma` (`cod_norma`),
  KEY `cod_materia` (`cod_materia`),
  CONSTRAINT `legislacao_citada_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE,
  CONSTRAINT `legislacao_citada_ibfk_2` FOREIGN KEY (`cod_norma`) REFERENCES `norma_juridica` (`cod_norma`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `legislatura`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legislatura` (
  `num_legislatura` int NOT NULL,
  `dat_inicio` date NOT NULL,
  `dat_fim` date NOT NULL,
  `dat_eleicao` date NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`num_legislatura`),
  KEY `idx_legislatura_datas` (`dat_inicio`,`dat_fim`,`dat_eleicao`,`ind_excluido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lexml_registro_provedor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lexml_registro_provedor` (
  `cod_provedor` int NOT NULL AUTO_INCREMENT,
  `id_provedor` int NOT NULL,
  `nom_provedor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sgl_provedor` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adm_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_responsavel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_responsavel` int DEFAULT NULL,
  `xml_provedor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`cod_provedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lexml_registro_publicador`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lexml_registro_publicador` (
  `cod_publicador` int NOT NULL AUTO_INCREMENT,
  `id_publicador` int NOT NULL,
  `nom_publicador` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adm_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sigla` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_responsavel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_responsavel` int NOT NULL,
  PRIMARY KEY (`cod_publicador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liderancas_partidarias`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liderancas_partidarias` (
  `cod_sessao_plen` int NOT NULL,
  `cod_parlamentar` int NOT NULL,
  `cod_partido` int NOT NULL,
  `num_ordem` tinyint NOT NULL,
  `url_discurso` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_sessao_plen`,`cod_parlamentar`),
  UNIQUE KEY `idx_num_ordem` (`cod_sessao_plen`,`num_ordem`,`ind_excluido`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  KEY `cod_sessao_plen` (`cod_sessao_plen`),
  KEY `cod_partido` (`cod_partido`),
  CONSTRAINT `liderancas_partidarias_ibfk_1` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `liderancas_partidarias_ibfk_2` FOREIGN KEY (`cod_partido`) REFERENCES `partido` (`cod_partido`),
  CONSTRAINT `liderancas_partidarias_ibfk_3` FOREIGN KEY (`cod_sessao_plen`) REFERENCES `sessao_plenaria` (`cod_sessao_plen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `localidade`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidade` (
  `cod_localidade` int NOT NULL DEFAULT '0',
  `nom_localidade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_localidade_pesq` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tip_localidade` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sgl_uf` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sgl_regiao` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_localidade`),
  KEY `nom_localidade` (`nom_localidade`),
  KEY `sgl_uf` (`sgl_uf`),
  KEY `tip_localidade` (`tip_localidade`),
  FULLTEXT KEY `nom_localidade_pesq` (`nom_localidade_pesq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logradouro`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logradouro` (
  `cod_logradouro` int NOT NULL AUTO_INCREMENT,
  `nom_logradouro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_bairro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_cep` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_localidade` int DEFAULT NULL,
  `cod_norma` int DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_logradouro`),
  KEY `num_cep` (`num_cep`),
  KEY `cod_localidade` (`cod_localidade`),
  KEY `cod_norma` (`cod_norma`),
  FULLTEXT KEY `nom_logradouro` (`nom_logradouro`),
  CONSTRAINT `logradouro_ibfk_1` FOREIGN KEY (`cod_localidade`) REFERENCES `localidade` (`cod_localidade`),
  CONSTRAINT `logradouro_ibfk_2` FOREIGN KEY (`cod_norma`) REFERENCES `norma_juridica` (`cod_norma`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mandato`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mandato` (
  `cod_mandato` int NOT NULL AUTO_INCREMENT,
  `num_legislatura` int NOT NULL DEFAULT '0',
  `cod_coligacao` int DEFAULT NULL,
  `dat_inicio_mandato` date DEFAULT NULL,
  `tip_causa_fim_mandato` tinyint DEFAULT NULL,
  `dat_fim_mandato` date DEFAULT NULL,
  `num_votos_recebidos` int DEFAULT NULL,
  `dat_expedicao_diploma` date DEFAULT NULL,
  `cod_parlamentar` int NOT NULL DEFAULT '0',
  `tip_afastamento` tinyint DEFAULT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_titular` tinyint NOT NULL DEFAULT '1',
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_mandato`),
  KEY `idx_coligacao` (`cod_coligacao`),
  KEY `idx_parlamentar` (`cod_parlamentar`),
  KEY `idx_afastamento` (`tip_afastamento`),
  KEY `idx_mandato_legislatura` (`num_legislatura`,`cod_parlamentar`,`ind_excluido`),
  KEY `idx_legislatura` (`num_legislatura`),
  KEY `tip_causa_fim_mandato` (`tip_causa_fim_mandato`),
  CONSTRAINT `mandato_ibfk_1` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`) ON DELETE CASCADE,
  CONSTRAINT `mandato_ibfk_2` FOREIGN KEY (`num_legislatura`) REFERENCES `legislatura` (`num_legislatura`),
  CONSTRAINT `mandato_ibfk_3` FOREIGN KEY (`cod_coligacao`) REFERENCES `coligacao` (`cod_coligacao`),
  CONSTRAINT `mandato_ibfk_4` FOREIGN KEY (`tip_afastamento`) REFERENCES `tipo_afastamento` (`tip_afastamento`)
) ENGINE=InnoDB AUTO_INCREMENT=922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materia_apresentada_sessao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_apresentada_sessao` (
  `cod_ordem` int NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int NOT NULL,
  `cod_materia` int DEFAULT NULL,
  `cod_emenda` int DEFAULT NULL,
  `cod_substitutivo` int DEFAULT NULL,
  `cod_parecer` int DEFAULT NULL,
  `cod_doc_acessorio` int DEFAULT NULL,
  `cod_documento` int DEFAULT NULL,
  `dat_ordem` date NOT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `num_ordem` int DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_ordem`),
  KEY `fk_cod_materia` (`cod_materia`),
  KEY `idx_apres_datord` (`dat_ordem`),
  KEY `cod_sessao_plen` (`cod_sessao_plen`),
  KEY `idx_cod_documento` (`cod_documento`),
  KEY `cod_materia` (`cod_materia`),
  KEY `cod_materia_2` (`cod_materia`),
  KEY `cod_emenda` (`cod_emenda`),
  KEY `cod_substitutivo` (`cod_substitutivo`),
  KEY `cod_doc_acessorio` (`cod_doc_acessorio`),
  KEY `cod_parecer` (`cod_parecer`),
  CONSTRAINT `materia_apresentada_sessao_ibfk_1` FOREIGN KEY (`cod_documento`) REFERENCES `documento_administrativo` (`cod_documento`),
  CONSTRAINT `materia_apresentada_sessao_ibfk_2` FOREIGN KEY (`cod_doc_acessorio`) REFERENCES `documento_acessorio` (`cod_documento`),
  CONSTRAINT `materia_apresentada_sessao_ibfk_3` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`),
  CONSTRAINT `materia_apresentada_sessao_ibfk_4` FOREIGN KEY (`cod_parecer`) REFERENCES `parecer` (`cod_relatoria`),
  CONSTRAINT `materia_apresentada_sessao_ibfk_5` FOREIGN KEY (`cod_substitutivo`) REFERENCES `substitutivo` (`cod_substitutivo`),
  CONSTRAINT `materia_apresentada_sessao_ibfk_6` FOREIGN KEY (`cod_sessao_plen`) REFERENCES `sessao_plenaria` (`cod_sessao_plen`),
  CONSTRAINT `materia_apresentada_sessao_ibfk_7` FOREIGN KEY (`cod_emenda`) REFERENCES `emenda` (`cod_emenda`)
) ENGINE=InnoDB AUTO_INCREMENT=2796 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materia_legislativa`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_legislativa` (
  `cod_materia` int NOT NULL AUTO_INCREMENT,
  `tip_id_basica` int NOT NULL,
  `num_protocolo` int DEFAULT NULL,
  `num_ident_basica` int NOT NULL,
  `ano_ident_basica` smallint NOT NULL,
  `dat_apresentacao` date DEFAULT NULL,
  `tip_apresentacao` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_regime_tramitacao` tinyint NOT NULL,
  `dat_publicacao` date DEFAULT NULL,
  `tip_origem_externa` int DEFAULT NULL,
  `num_origem_externa` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ano_origem_externa` smallint DEFAULT NULL,
  `dat_origem_externa` date DEFAULT NULL,
  `cod_local_origem_externa` int DEFAULT NULL,
  `nom_apelido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_dias_prazo` tinyint DEFAULT NULL,
  `dat_fim_prazo` date DEFAULT NULL,
  `ind_tramitacao` tinyint NOT NULL,
  `ind_polemica` tinyint DEFAULT NULL,
  `des_objeto` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_complementar` tinyint DEFAULT NULL,
  `txt_ementa` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `txt_indexacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tip_quorum` int DEFAULT NULL,
  `cod_situacao` int DEFAULT NULL,
  `cod_assunto` int DEFAULT NULL,
  `cod_materia_principal` int DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_materia`),
  UNIQUE KEY `tip_id_basica` (`tip_id_basica`,`num_ident_basica`,`ano_ident_basica`,`ind_excluido`) USING BTREE,
  KEY `cod_local_origem_externa` (`cod_local_origem_externa`),
  KEY `tip_origem_externa` (`tip_origem_externa`),
  KEY `cod_regime_tramitacao` (`cod_regime_tramitacao`),
  KEY `idx_dat_apresentacao` (`dat_apresentacao`,`tip_id_basica`,`ind_excluido`),
  KEY `idx_matleg_dat_publicacao` (`dat_publicacao`,`tip_id_basica`,`ind_excluido`),
  KEY `cod_situacao` (`cod_situacao`),
  KEY `idx_mat_principal` (`cod_materia_principal`),
  KEY `tip_quorum` (`tip_quorum`),
  KEY `idx_matleg_ident` (`ind_excluido`,`tip_id_basica`,`ano_ident_basica`,`num_ident_basica`) USING BTREE,
  KEY `idx_tramitacao` (`ind_tramitacao`) USING BTREE,
  KEY `idx_assunto` (`cod_assunto`),
  FULLTEXT KEY `idx_busca` (`txt_ementa`,`txt_observacao`,`txt_indexacao`),
  CONSTRAINT `materia_legislativa_ibfk_2` FOREIGN KEY (`cod_local_origem_externa`) REFERENCES `origem` (`cod_origem`),
  CONSTRAINT `materia_legislativa_ibfk_3` FOREIGN KEY (`tip_quorum`) REFERENCES `quorum_votacao` (`cod_quorum`),
  CONSTRAINT `materia_legislativa_ibfk_4` FOREIGN KEY (`cod_regime_tramitacao`) REFERENCES `regime_tramitacao` (`cod_regime_tramitacao`),
  CONSTRAINT `materia_legislativa_ibfk_5` FOREIGN KEY (`tip_id_basica`) REFERENCES `tipo_materia_legislativa` (`tip_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=194332 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mesa_sessao_plenaria`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesa_sessao_plenaria` (
  `cod_cargo` tinyint NOT NULL,
  `cod_sessao_leg` int NOT NULL,
  `cod_parlamentar` int NOT NULL,
  `cod_sessao_plen` int NOT NULL,
  `ind_excluido` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`cod_cargo`,`cod_sessao_leg`,`cod_parlamentar`,`cod_sessao_plen`),
  KEY `cod_sessao_leg` (`cod_sessao_leg`),
  KEY `cod_sessao_plen` (`cod_sessao_plen`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  CONSTRAINT `mesa_sessao_plenaria_ibfk_1` FOREIGN KEY (`cod_cargo`) REFERENCES `cargo_mesa` (`cod_cargo`),
  CONSTRAINT `mesa_sessao_plenaria_ibfk_2` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `mesa_sessao_plenaria_ibfk_3` FOREIGN KEY (`cod_sessao_leg`) REFERENCES `sessao_legislativa` (`cod_sessao_leg`),
  CONSTRAINT `mesa_sessao_plenaria_ibfk_4` FOREIGN KEY (`cod_sessao_plen`) REFERENCES `sessao_plenaria` (`cod_sessao_plen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nivel_instrucao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel_instrucao` (
  `cod_nivel_instrucao` tinyint NOT NULL AUTO_INCREMENT,
  `des_nivel_instrucao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_nivel_instrucao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `norma_juridica`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `norma_juridica` (
  `cod_norma` int NOT NULL AUTO_INCREMENT,
  `tip_norma` tinyint NOT NULL,
  `cod_materia` int DEFAULT NULL,
  `num_norma` int NOT NULL,
  `ano_norma` smallint NOT NULL,
  `tip_esfera_federacao` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_norma` date DEFAULT NULL,
  `dat_publicacao` date DEFAULT NULL,
  `des_veiculo_publicacao` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_pag_inicio_publ` int DEFAULT NULL,
  `num_pag_fim_publ` int DEFAULT NULL,
  `txt_ementa` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `txt_indexacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_complemento` tinyint DEFAULT NULL,
  `cod_assunto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_situacao` int DEFAULT NULL,
  `dat_vigencia` date DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_norma`),
  KEY `cod_assunto` (`cod_assunto`),
  KEY `tip_norma` (`tip_norma`),
  KEY `cod_materia` (`cod_materia`),
  KEY `idx_ano_numero` (`ano_norma`,`num_norma`,`ind_excluido`),
  KEY `dat_norma` (`dat_norma`),
  KEY `cod_situacao` (`cod_situacao`),
  FULLTEXT KEY `idx_busca` (`txt_ementa`,`txt_observacao`,`txt_indexacao`),
  CONSTRAINT `norma_juridica_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE SET NULL,
  CONSTRAINT `norma_juridica_ibfk_2` FOREIGN KEY (`cod_situacao`) REFERENCES `tipo_situacao_norma` (`tip_situacao_norma`) ON DELETE SET NULL,
  CONSTRAINT `norma_juridica_ibfk_3` FOREIGN KEY (`tip_norma`) REFERENCES `tipo_norma_juridica` (`tip_norma`)
) ENGINE=InnoDB AUTO_INCREMENT=14063 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `numeracao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numeracao` (
  `cod_materia` int NOT NULL,
  `num_ordem` tinyint NOT NULL,
  `tip_materia` int NOT NULL,
  `num_materia` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ano_materia` smallint NOT NULL,
  `dat_materia` date DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_materia`,`num_ordem`),
  KEY `cod_materia` (`cod_materia`),
  KEY `tip_materia` (`tip_materia`),
  KEY `idx_numer_identificacao` (`tip_materia`,`num_materia`,`ano_materia`,`ind_excluido`),
  CONSTRAINT `numeracao_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE,
  CONSTRAINT `numeracao_ibfk_2` FOREIGN KEY (`tip_materia`) REFERENCES `tipo_materia_legislativa` (`tip_materia`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oradores`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oradores` (
  `cod_sessao_plen` int NOT NULL,
  `cod_parlamentar` int NOT NULL,
  `num_ordem` tinyint NOT NULL,
  `url_discurso` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_sessao_plen`,`cod_parlamentar`),
  UNIQUE KEY `idx_num_ordem` (`cod_sessao_plen`,`num_ordem`,`ind_excluido`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  KEY `cod_sessao_plen` (`cod_sessao_plen`),
  CONSTRAINT `oradores_ibfk_1` FOREIGN KEY (`cod_sessao_plen`) REFERENCES `sessao_plenaria` (`cod_sessao_plen`) ON DELETE CASCADE,
  CONSTRAINT `oradores_ibfk_2` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oradores_expediente`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oradores_expediente` (
  `cod_sessao_plen` int NOT NULL,
  `cod_parlamentar` int NOT NULL,
  `num_ordem` tinyint NOT NULL,
  `url_discurso` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_sessao_plen`,`cod_parlamentar`),
  UNIQUE KEY `idx_num_ordem` (`cod_sessao_plen`,`num_ordem`,`ind_excluido`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  KEY `cod_sessao_plen` (`cod_sessao_plen`),
  CONSTRAINT `oradores_expediente_ibfk_1` FOREIGN KEY (`cod_sessao_plen`) REFERENCES `sessao_plenaria` (`cod_sessao_plen`) ON DELETE CASCADE,
  CONSTRAINT `oradores_expediente_ibfk_2` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordem_dia`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_dia` (
  `cod_ordem` int NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int NOT NULL,
  `cod_materia` int NOT NULL,
  `dat_ordem` date NOT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `num_ordem` int DEFAULT NULL,
  `txt_resultado` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tip_turno` int DEFAULT NULL,
  `tip_votacao` int NOT NULL,
  `tip_quorum` int DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_ordem`),
  KEY `cod_sessao_plen` (`cod_sessao_plen`),
  KEY `cod_materia` (`cod_materia`),
  KEY `idx_dat_ordem` (`dat_ordem`),
  KEY `tip_votacao` (`tip_votacao`),
  KEY `tip_quorum` (`tip_quorum`),
  KEY `tip_turno` (`tip_turno`),
  KEY `num_ordem` (`num_ordem`),
  CONSTRAINT `ordem_dia_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`),
  CONSTRAINT `ordem_dia_ibfk_2` FOREIGN KEY (`cod_sessao_plen`) REFERENCES `sessao_plenaria` (`cod_sessao_plen`) ON DELETE CASCADE,
  CONSTRAINT `ordem_dia_ibfk_3` FOREIGN KEY (`tip_quorum`) REFERENCES `quorum_votacao` (`cod_quorum`),
  CONSTRAINT `ordem_dia_ibfk_4` FOREIGN KEY (`tip_votacao`) REFERENCES `tipo_votacao` (`tip_votacao`),
  CONSTRAINT `ordem_dia_ibfk_5` FOREIGN KEY (`tip_turno`) REFERENCES `turno_discussao` (`cod_turno`)
) ENGINE=InnoDB AUTO_INCREMENT=5525 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordem_dia_discussao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_dia_discussao` (
  `cod_ordem` int NOT NULL,
  `cod_parlamentar` int NOT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_ordem`,`cod_parlamentar`) USING BTREE,
  KEY `cod_ordem` (`cod_ordem`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  CONSTRAINT `ordem_dia_discussao_ibfk_1` FOREIGN KEY (`cod_ordem`) REFERENCES `ordem_dia` (`cod_ordem`) ON DELETE CASCADE,
  CONSTRAINT `ordem_dia_discussao_ibfk_2` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordem_dia_presenca`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_dia_presenca` (
  `cod_presenca_ordem_dia` int NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int NOT NULL DEFAULT '0',
  `cod_parlamentar` int NOT NULL,
  `tip_frequencia` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'P',
  `txt_justif_ausencia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_ordem` date NOT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_presenca_ordem_dia`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  KEY `idx_sessao_parlamentar` (`cod_sessao_plen`,`cod_parlamentar`),
  KEY `cod_sessao_plen` (`cod_sessao_plen`),
  KEY `dat_ordem` (`dat_ordem`),
  KEY `tip_frequencia` (`tip_frequencia`),
  CONSTRAINT `ordem_dia_presenca_ibfk_1` FOREIGN KEY (`cod_sessao_plen`) REFERENCES `sessao_plenaria` (`cod_sessao_plen`) ON DELETE CASCADE,
  CONSTRAINT `ordem_dia_presenca_ibfk_2` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`)
) ENGINE=InnoDB AUTO_INCREMENT=13921 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orgao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orgao` (
  `cod_orgao` int NOT NULL AUTO_INCREMENT,
  `nom_orgao` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sgl_orgao` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_unid_deliberativa` tinyint NOT NULL,
  `end_orgao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tel_orgao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_orgao`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `origem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `origem` (
  `cod_origem` int NOT NULL AUTO_INCREMENT,
  `sgl_origem` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_origem` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_origem`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parecer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parecer` (
  `cod_relatoria` int NOT NULL,
  `num_parecer` smallint DEFAULT NULL,
  `ano_parecer` smallint DEFAULT NULL,
  `cod_materia` int NOT NULL,
  `tip_conclusao` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tip_apresentacao` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_parecer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_relatoria`,`cod_materia`),
  KEY `idx_parecer_materia` (`cod_materia`,`ind_excluido`),
  KEY `cod_materia` (`cod_materia`),
  CONSTRAINT `parecer_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE,
  CONSTRAINT `parecer_ibfk_2` FOREIGN KEY (`cod_relatoria`) REFERENCES `relatoria` (`cod_relatoria`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parlamentar`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parlamentar` (
  `cod_parlamentar` int NOT NULL AUTO_INCREMENT,
  `nom_completo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_parlamentar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex_parlamentar` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_nascimento` date DEFAULT NULL,
  `num_cpf` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_rg` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tit_eleitor` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tip_situacao_militar` tinyint DEFAULT NULL,
  `cod_nivel_instrucao` tinyint DEFAULT NULL,
  `cod_casa` int NOT NULL DEFAULT '0',
  `num_gab_parlamentar` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tel_parlamentar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_fax_parlamentar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_residencial` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_localidade_resid` int DEFAULT NULL,
  `num_cep_resid` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tel_resid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_fax_resid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_web` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_profissao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_local_atuacao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_ativo` tinyint NOT NULL DEFAULT '0',
  `ind_unid_deliberativa` tinyint DEFAULT NULL,
  `txt_biografia` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_parlamentar`),
  KEY `cod_localidade_resid` (`cod_localidade_resid`),
  KEY `tip_situacao_militar` (`tip_situacao_militar`),
  KEY `cod_nivel_instrucao` (`cod_nivel_instrucao`),
  KEY `ind_parlamentar_ativo` (`ind_ativo`,`ind_excluido`),
  FULLTEXT KEY `nom_completo` (`nom_completo`),
  FULLTEXT KEY `nom_parlamentar` (`nom_parlamentar`),
  CONSTRAINT `parlamentar_ibfk_1` FOREIGN KEY (`cod_localidade_resid`) REFERENCES `localidade` (`cod_localidade`),
  CONSTRAINT `parlamentar_ibfk_2` FOREIGN KEY (`cod_nivel_instrucao`) REFERENCES `nivel_instrucao` (`cod_nivel_instrucao`),
  CONSTRAINT `parlamentar_ibfk_3` FOREIGN KEY (`tip_situacao_militar`) REFERENCES `tipo_situacao_militar` (`tip_situacao_militar`)
) ENGINE=InnoDB AUTO_INCREMENT=566 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partido`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `cod_partido` int NOT NULL AUTO_INCREMENT,
  `sgl_partido` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_partido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_criacao` date DEFAULT NULL,
  `dat_extincao` date DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_partido`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodo_comp_bancada`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo_comp_bancada` (
  `cod_periodo_comp` int NOT NULL AUTO_INCREMENT,
  `num_legislatura` int NOT NULL,
  `dat_inicio_periodo` date NOT NULL,
  `dat_fim_periodo` date NOT NULL,
  `ind_excluido` tinyint DEFAULT '0',
  PRIMARY KEY (`cod_periodo_comp`),
  KEY `ind_percompbancada_datas` (`dat_inicio_periodo`,`dat_fim_periodo`,`ind_excluido`),
  KEY `idx_legislatura` (`num_legislatura`),
  CONSTRAINT `periodo_comp_bancada_ibfk_1` FOREIGN KEY (`num_legislatura`) REFERENCES `legislatura` (`num_legislatura`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodo_comp_comissao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo_comp_comissao` (
  `cod_periodo_comp` int NOT NULL AUTO_INCREMENT,
  `dat_inicio_periodo` date NOT NULL,
  `dat_fim_periodo` date DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_periodo_comp`),
  KEY `ind_percompcom_datas` (`dat_inicio_periodo`,`dat_fim_periodo`,`ind_excluido`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodo_comp_mesa`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo_comp_mesa` (
  `cod_periodo_comp` int NOT NULL AUTO_INCREMENT,
  `num_legislatura` int NOT NULL,
  `dat_inicio_periodo` date NOT NULL,
  `dat_fim_periodo` date NOT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_periodo_comp`),
  KEY `ind_percompmesa_datas` (`dat_inicio_periodo`,`dat_fim_periodo`,`ind_excluido`),
  KEY `idx_legislatura` (`num_legislatura`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pessoa`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `cod_pessoa` int NOT NULL AUTO_INCREMENT,
  `nom_pessoa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `doc_identidade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dat_nascimento` date DEFAULT NULL,
  `sex_pessoa` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_estado_civil` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_conjuge` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_dependentes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `num_tit_eleitor` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_logradouro` int DEFAULT NULL,
  `end_residencial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_imovel` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txt_complemento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_bairro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_cep` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_cidade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sgl_uf` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_tempo_residencia` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_telefone` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_celular` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_profissao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_local_trabalho` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dat_atualizacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_pessoa`),
  KEY `num_cep` (`num_cep`),
  KEY `cod_logradouro` (`cod_logradouro`),
  KEY `nom_cidade` (`nom_cidade`),
  KEY `dat_nascimento` (`dat_nascimento`),
  KEY `des_profissao` (`des_profissao`),
  KEY `des_estado_civil` (`des_estado_civil`),
  KEY `sex_visitante` (`sex_pessoa`),
  KEY `nom_bairro` (`nom_bairro`),
  FULLTEXT KEY `nom_pessoa` (`nom_pessoa`),
  FULLTEXT KEY `nom_conjuge` (`nom_conjuge`),
  FULLTEXT KEY `idx_busca` (`doc_identidade`),
  FULLTEXT KEY `end_residencial` (`end_residencial`),
  FULLTEXT KEY `doc_identidade` (`doc_identidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proposicao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposicao` (
  `cod_proposicao` int NOT NULL AUTO_INCREMENT,
  `cod_materia` int DEFAULT NULL,
  `cod_autor` int NOT NULL,
  `tip_proposicao` int NOT NULL,
  `dat_envio` datetime DEFAULT NULL,
  `dat_recebimento` datetime DEFAULT NULL,
  `txt_descricao` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_mat_ou_doc` int DEFAULT NULL,
  `cod_emenda` int DEFAULT NULL,
  `cod_substitutivo` int DEFAULT NULL,
  `cod_parecer` int DEFAULT NULL,
  `dat_devolucao` datetime DEFAULT NULL,
  `txt_justif_devolucao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_proposicao`),
  KEY `tip_proposicao` (`tip_proposicao`),
  KEY `cod_materia` (`cod_materia`),
  KEY `cod_emenda` (`cod_emenda`),
  KEY `cod_substitutivo` (`cod_substitutivo`),
  KEY `cod_autor` (`cod_autor`),
  KEY `idx_prop_autor` (`dat_envio`,`dat_recebimento`,`ind_excluido`),
  KEY `cod_parecer` (`cod_parecer`),
  CONSTRAINT `proposicao_ibfk_1` FOREIGN KEY (`cod_emenda`) REFERENCES `emenda` (`cod_emenda`) ON DELETE SET NULL,
  CONSTRAINT `proposicao_ibfk_2` FOREIGN KEY (`cod_autor`) REFERENCES `autor` (`cod_autor`),
  CONSTRAINT `proposicao_ibfk_3` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE SET NULL,
  CONSTRAINT `proposicao_ibfk_4` FOREIGN KEY (`cod_substitutivo`) REFERENCES `substitutivo` (`cod_substitutivo`) ON DELETE SET NULL,
  CONSTRAINT `proposicao_ibfk_5` FOREIGN KEY (`tip_proposicao`) REFERENCES `tipo_proposicao` (`tip_proposicao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `protocolo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `protocolo` (
  `cod_protocolo` int(7) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `num_protocolo` int(7) unsigned zerofill DEFAULT NULL,
  `ano_protocolo` smallint NOT NULL,
  `dat_protocolo` date NOT NULL,
  `hor_protocolo` time NOT NULL DEFAULT '00:00:00',
  `dat_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tip_protocolo` int NOT NULL,
  `tip_processo` int DEFAULT NULL,
  `txt_interessado` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_autor` int DEFAULT NULL,
  `cod_entidade` int DEFAULT NULL,
  `txt_assunto_ementa` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tip_documento` int DEFAULT NULL,
  `tip_materia` int DEFAULT NULL,
  `tip_natureza_materia` smallint DEFAULT NULL,
  `cod_materia_principal` int DEFAULT NULL,
  `num_paginas` int DEFAULT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_anulado` tinyint NOT NULL DEFAULT '0',
  `txt_user_protocolo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_user_anulacao` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_ip_anulacao` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_just_anulacao` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp_anulacao` datetime DEFAULT NULL,
  `codigo_acesso` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cod_protocolo`),
  UNIQUE KEY `idx_num_protocolo` (`num_protocolo`,`ano_protocolo`),
  KEY `tip_protocolo` (`tip_protocolo`),
  KEY `cod_autor` (`cod_autor`),
  KEY `tip_materia` (`tip_materia`),
  KEY `tip_documento` (`tip_documento`),
  KEY `dat_protocolo` (`dat_protocolo`),
  KEY `ano_protocolo` (`ano_protocolo`),
  KEY `tip_processo` (`tip_processo`),
  KEY `codigo_acesso` (`codigo_acesso`),
  KEY `cod_materia_principal` (`cod_materia_principal`),
  FULLTEXT KEY `idx_busca_protocolo` (`txt_assunto_ementa`,`txt_observacao`),
  FULLTEXT KEY `txt_interessado` (`txt_interessado`),
  CONSTRAINT `protocolo_ibfk_1` FOREIGN KEY (`cod_autor`) REFERENCES `autor` (`cod_autor`),
  CONSTRAINT `protocolo_ibfk_2` FOREIGN KEY (`cod_materia_principal`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quorum_votacao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quorum_votacao` (
  `cod_quorum` int NOT NULL AUTO_INCREMENT,
  `des_quorum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txt_formula` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_quorum`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regime_tramitacao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regime_tramitacao` (
  `cod_regime_tramitacao` tinyint NOT NULL AUTO_INCREMENT,
  `des_regime_tramitacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_regime_tramitacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registro_votacao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_votacao` (
  `cod_votacao` int NOT NULL AUTO_INCREMENT,
  `tip_resultado_votacao` int unsigned NOT NULL,
  `cod_materia` int NOT NULL,
  `cod_parecer` int DEFAULT NULL,
  `cod_ordem` int NOT NULL,
  `cod_emenda` int DEFAULT NULL,
  `cod_subemenda` int DEFAULT NULL,
  `cod_substitutivo` int DEFAULT NULL,
  `num_votos_sim` tinyint unsigned NOT NULL,
  `num_votos_nao` tinyint unsigned NOT NULL,
  `num_abstencao` tinyint unsigned NOT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint unsigned NOT NULL,
  PRIMARY KEY (`cod_votacao`),
  UNIQUE KEY `idx_unique` (`cod_materia`,`cod_ordem`,`cod_emenda`,`cod_substitutivo`) USING BTREE,
  KEY `cod_ordem` (`cod_ordem`),
  KEY `cod_materia` (`cod_materia`),
  KEY `tip_resultado_votacao` (`tip_resultado_votacao`),
  KEY `cod_emenda` (`cod_emenda`),
  KEY `cod_subemenda` (`cod_subemenda`),
  KEY `cod_substitutivo` (`cod_substitutivo`),
  KEY `cod_parecer` (`cod_parecer`),
  CONSTRAINT `registro_votacao_ibfk_1` FOREIGN KEY (`cod_emenda`) REFERENCES `emenda` (`cod_emenda`),
  CONSTRAINT `registro_votacao_ibfk_2` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`),
  CONSTRAINT `registro_votacao_ibfk_3` FOREIGN KEY (`cod_parecer`) REFERENCES `parecer` (`cod_relatoria`),
  CONSTRAINT `registro_votacao_ibfk_4` FOREIGN KEY (`cod_substitutivo`) REFERENCES `substitutivo` (`cod_substitutivo`),
  CONSTRAINT `registro_votacao_ibfk_5` FOREIGN KEY (`tip_resultado_votacao`) REFERENCES `tipo_resultado_votacao` (`tip_resultado_votacao`)
) ENGINE=InnoDB AUTO_INCREMENT=1048 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registro_votacao_parlamentar`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_votacao_parlamentar` (
  `cod_votacao` int NOT NULL,
  `cod_parlamentar` int NOT NULL,
  `ind_excluido` tinyint unsigned NOT NULL,
  `vot_parlamentar` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cod_votacao`,`cod_parlamentar`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  KEY `cod_votacao` (`cod_votacao`),
  CONSTRAINT `registro_votacao_parlamentar_ibfk_1` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `registro_votacao_parlamentar_ibfk_2` FOREIGN KEY (`cod_votacao`) REFERENCES `registro_votacao` (`cod_votacao`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relatoria`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relatoria` (
  `cod_relatoria` int NOT NULL AUTO_INCREMENT,
  `cod_materia` int NOT NULL,
  `cod_parlamentar` int NOT NULL,
  `tip_fim_relatoria` tinyint DEFAULT NULL,
  `cod_comissao` int DEFAULT NULL,
  `num_ordem` tinyint NOT NULL,
  `dat_desig_relator` date NOT NULL,
  `dat_destit_relator` date DEFAULT NULL,
  `tip_apresentacao` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_parecer` int DEFAULT NULL,
  `num_protocolo` int DEFAULT NULL,
  `ano_parecer` smallint DEFAULT NULL,
  `txt_parecer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tip_conclusao` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_relatoria`),
  KEY `cod_comissao` (`cod_comissao`),
  KEY `cod_materia` (`cod_materia`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  KEY `tip_fim_relatoria` (`tip_fim_relatoria`),
  KEY `idx_relat_materia` (`cod_materia`,`cod_parlamentar`,`ind_excluido`),
  KEY `num_protocolo` (`num_protocolo`),
  CONSTRAINT `relatoria_ibfk_1` FOREIGN KEY (`cod_comissao`) REFERENCES `comissao` (`cod_comissao`),
  CONSTRAINT `relatoria_ibfk_2` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE,
  CONSTRAINT `relatoria_ibfk_3` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `relatoria_ibfk_4` FOREIGN KEY (`tip_fim_relatoria`) REFERENCES `tipo_fim_relatoria` (`tip_fim_relatoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reuniao_comissao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reuniao_comissao` (
  `cod_reuniao` int NOT NULL AUTO_INCREMENT,
  `cod_comissao` int NOT NULL,
  `num_reuniao` int NOT NULL,
  `dat_inicio_reuniao` date NOT NULL,
  `hr_inicio_reuniao` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_reuniao`),
  KEY `cod_comissao` (`cod_comissao`),
  CONSTRAINT `reuniao_comissao_ibfk_1` FOREIGN KEY (`cod_comissao`) REFERENCES `comissao` (`cod_comissao`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessao_legislativa`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessao_legislativa` (
  `cod_sessao_leg` int NOT NULL AUTO_INCREMENT,
  `num_legislatura` int NOT NULL,
  `num_sessao_leg` tinyint NOT NULL,
  `tip_sessao_leg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_inicio` date NOT NULL,
  `dat_fim` date NOT NULL,
  `dat_inicio_intervalo` date DEFAULT NULL,
  `dat_fim_intervalo` date DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_sessao_leg`),
  KEY `idx_sessleg_datas` (`dat_inicio`,`ind_excluido`,`dat_fim`,`dat_inicio_intervalo`,`dat_fim_intervalo`),
  KEY `idx_sessleg_legislatura` (`num_legislatura`,`ind_excluido`),
  KEY `idx_legislatura` (`num_legislatura`),
  CONSTRAINT `sessao_legislativa_ibfk_1` FOREIGN KEY (`num_legislatura`) REFERENCES `legislatura` (`num_legislatura`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessao_plenaria`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessao_plenaria` (
  `cod_sessao_plen` int NOT NULL AUTO_INCREMENT,
  `cod_andamento_sessao` int DEFAULT NULL,
  `tip_sessao` tinyint NOT NULL,
  `cod_sessao_leg` int NOT NULL,
  `num_legislatura` int NOT NULL,
  `tip_expediente` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_inicio_sessao` date NOT NULL,
  `dia_sessao` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_inicio_sessao` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_fim_sessao` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_sessao_plen` int unsigned NOT NULL,
  `dat_fim_sessao` date DEFAULT NULL,
  `url_fotos` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_audio` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_video` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_sessao_plen`),
  KEY `cod_sessao_leg` (`cod_sessao_leg`),
  KEY `tip_sessao` (`tip_sessao`),
  KEY `num_legislatura` (`num_legislatura`),
  KEY `dat_inicio_sessao` (`dat_inicio_sessao`),
  KEY `num_sessao_plen` (`num_sessao_plen`),
  CONSTRAINT `sessao_plenaria_ibfk_1` FOREIGN KEY (`cod_sessao_leg`) REFERENCES `sessao_legislativa` (`cod_sessao_leg`),
  CONSTRAINT `sessao_plenaria_ibfk_2` FOREIGN KEY (`tip_sessao`) REFERENCES `tipo_sessao_plenaria` (`tip_sessao`),
  CONSTRAINT `sessao_plenaria_ibfk_3` FOREIGN KEY (`num_legislatura`) REFERENCES `legislatura` (`num_legislatura`)
) ENGINE=InnoDB AUTO_INCREMENT=1972 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessao_plenaria_painel`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessao_plenaria_painel` (
  `cod_item` int NOT NULL AUTO_INCREMENT,
  `tip_item` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_fase` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_ordem` int NOT NULL,
  `txt_exibicao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_materia` int DEFAULT NULL,
  `txt_autoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_turno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_extrapauta` tinyint DEFAULT '0',
  `ind_exibicao` tinyint DEFAULT '0',
  PRIMARY KEY (`cod_item`),
  UNIQUE KEY `ind_cod_materia` (`cod_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessao_plenaria_presenca`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessao_plenaria_presenca` (
  `cod_presenca_sessao` int NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int NOT NULL,
  `cod_parlamentar` int NOT NULL,
  `tip_frequencia` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'P',
  `txt_justif_ausencia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_sessao` date DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_presenca_sessao`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  KEY `idx_sessao_parlamentar` (`cod_sessao_plen`,`cod_parlamentar`),
  KEY `cod_sessao_plen` (`cod_sessao_plen`),
  KEY `dat_sessao` (`dat_sessao`),
  KEY `tip_frequencia` (`tip_frequencia`),
  CONSTRAINT `sessao_plenaria_presenca_ibfk_1` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`),
  CONSTRAINT `sessao_plenaria_presenca_ibfk_2` FOREIGN KEY (`cod_sessao_plen`) REFERENCES `sessao_plenaria` (`cod_sessao_plen`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_tramitacao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_tramitacao` (
  `cod_status` int NOT NULL AUTO_INCREMENT,
  `sgl_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_fim_tramitacao` tinyint NOT NULL DEFAULT '0',
  `ind_retorno_tramitacao` tinyint NOT NULL DEFAULT '0',
  `num_dias_prazo` tinyint DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_status`),
  KEY `sgl_status` (`sgl_status`),
  FULLTEXT KEY `des_status` (`des_status`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_tramitacao_administrativo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_tramitacao_administrativo` (
  `cod_status` int NOT NULL AUTO_INCREMENT,
  `sgl_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_fim_tramitacao` tinyint NOT NULL DEFAULT '0',
  `ind_retorno_tramitacao` tinyint NOT NULL DEFAULT '0',
  `num_dias_prazo` tinyint DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_status`),
  KEY `sgl_status` (`sgl_status`),
  FULLTEXT KEY `des_status` (`des_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subemenda`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subemenda` (
  `cod_subemenda` int NOT NULL AUTO_INCREMENT,
  `tip_subemenda` int NOT NULL,
  `num_subemenda` int NOT NULL,
  `cod_emenda` int NOT NULL,
  `num_protocolo` int DEFAULT NULL,
  `dat_apresentacao` date DEFAULT NULL,
  `txt_ementa` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_observacao` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_autor` int NOT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_subemenda`),
  UNIQUE KEY `numsub_emenda` (`num_subemenda`,`tip_subemenda`,`cod_emenda`,`ind_excluido`),
  KEY `idx_cod_autor` (`cod_autor`),
  KEY `idx_cod_emenda` (`cod_emenda`),
  KEY `tip_subemenda` (`tip_subemenda`),
  FULLTEXT KEY `idx_txt_ementa` (`txt_ementa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `substitutivo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `substitutivo` (
  `cod_substitutivo` int NOT NULL AUTO_INCREMENT,
  `num_substitutivo` int NOT NULL,
  `cod_materia` int NOT NULL,
  `cod_autor` int DEFAULT NULL,
  `num_protocolo` int DEFAULT NULL,
  `dat_apresentacao` date DEFAULT NULL,
  `txt_ementa` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_substitutivo`),
  KEY `idx_cod_materia` (`cod_materia`),
  KEY `idx_substitutivo` (`cod_substitutivo`,`cod_materia`) USING BTREE,
  KEY `cod_autor` (`cod_autor`),
  FULLTEXT KEY `idx_txt_ementa` (`txt_ementa`),
  FULLTEXT KEY `txt_observacao` (`txt_observacao`),
  CONSTRAINT `substitutivo_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_afastamento`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_afastamento` (
  `tip_afastamento` tinyint NOT NULL AUTO_INCREMENT,
  `des_afastamento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_afastamento` tinyint NOT NULL,
  `ind_fim_mandato` tinyint NOT NULL,
  `des_dispositivo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_afastamento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_autor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_autor` (
  `tip_autor` tinyint NOT NULL,
  `des_tipo_autor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tip_proposicao` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_autor`),
  KEY `des_tipo_autor` (`des_tipo_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_comissao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_comissao` (
  `tip_comissao` tinyint NOT NULL AUTO_INCREMENT,
  `nom_tipo_comissao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sgl_natureza_comissao` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sgl_tipo_comissao` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_dispositivo_regimental` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_comissao`),
  KEY `nom_tipo_comissao` (`nom_tipo_comissao`),
  KEY `sgl_natureza_comissao` (`sgl_natureza_comissao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_dependente`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_dependente` (
  `tip_dependente` tinyint NOT NULL AUTO_INCREMENT,
  `des_tipo_dependente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_dependente`),
  KEY `des_tipo_dependente` (`des_tipo_dependente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_documento`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documento` (
  `tip_documento` int NOT NULL AUTO_INCREMENT,
  `des_tipo_documento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_documento`),
  KEY `des_tipo_documento` (`des_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_documento_administrativo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documento_administrativo` (
  `tip_documento` int NOT NULL AUTO_INCREMENT,
  `sgl_tipo_documento` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_tipo_documento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_publico` tinyint NOT NULL DEFAULT '0',
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`tip_documento`),
  KEY `des_tipo_documento` (`des_tipo_documento`),
  KEY `ind_publico` (`ind_publico`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_emenda`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_emenda` (
  `tip_emenda` int NOT NULL AUTO_INCREMENT,
  `des_tipo_emenda` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_emenda`),
  KEY `des_tipo_emenda` (`des_tipo_emenda`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_expediente`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_expediente` (
  `cod_expediente` int NOT NULL AUTO_INCREMENT,
  `nom_expediente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint unsigned NOT NULL,
  PRIMARY KEY (`cod_expediente`),
  KEY `nom_expediente` (`nom_expediente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_fim_relatoria`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_fim_relatoria` (
  `tip_fim_relatoria` tinyint NOT NULL AUTO_INCREMENT,
  `des_fim_relatoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_fim_relatoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_instituicao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_instituicao` (
  `tip_instituicao` int NOT NULL AUTO_INCREMENT,
  `nom_tipo_instituicao` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`tip_instituicao`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_materia_legislativa`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_materia_legislativa` (
  `tip_materia` int NOT NULL AUTO_INCREMENT,
  `sgl_tipo_materia` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_tipo_materia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tip_natureza` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_num_automatica` tinyint NOT NULL DEFAULT '0',
  `quorum_minimo_votacao` tinyint NOT NULL DEFAULT '1',
  `ind_publico` tinyint NOT NULL DEFAULT '1',
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_materia`),
  KEY `des_tipo_materia` (`des_tipo_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_norma_juridica`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_norma_juridica` (
  `tip_norma` tinyint NOT NULL AUTO_INCREMENT,
  `voc_lexml` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sgl_tipo_norma` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des_tipo_norma` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_num_automatica` tinyint DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_norma`),
  KEY `des_tipo_norma` (`des_tipo_norma`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_proposicao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_proposicao` (
  `tip_proposicao` int NOT NULL AUTO_INCREMENT,
  `des_tipo_proposicao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_mat_ou_doc` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tip_mat_ou_doc` int NOT NULL,
  `nom_modelo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_proposicao`),
  KEY `des_tipo_proposicao` (`des_tipo_proposicao`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_resultado_votacao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_resultado_votacao` (
  `tip_resultado_votacao` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_resultado` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint unsigned NOT NULL,
  PRIMARY KEY (`tip_resultado_votacao`),
  KEY `nom_resultado` (`nom_resultado`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_sessao_plenaria`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_sessao_plenaria` (
  `tip_sessao` tinyint NOT NULL AUTO_INCREMENT,
  `nom_sessao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  `num_minimo` int NOT NULL,
  PRIMARY KEY (`tip_sessao`),
  KEY `nom_sessao` (`nom_sessao`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_situacao_materia`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_situacao_materia` (
  `tip_situacao_materia` int NOT NULL AUTO_INCREMENT,
  `des_tipo_situacao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`tip_situacao_materia`),
  KEY `des_tipo_situacao` (`des_tipo_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_situacao_militar`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_situacao_militar` (
  `tip_situacao_militar` tinyint NOT NULL,
  `des_tipo_situacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_situacao_militar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_situacao_norma`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_situacao_norma` (
  `tip_situacao_norma` int NOT NULL AUTO_INCREMENT,
  `des_tipo_situacao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`tip_situacao_norma`),
  KEY `des_tipo_situacao` (`des_tipo_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_vinculo_norma`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_vinculo_norma` (
  `cod_tip_vinculo` int NOT NULL AUTO_INCREMENT,
  `tipo_vinculo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `des_vinculo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `des_vinculo_passivo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tip_situacao` int DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_tip_vinculo`),
  UNIQUE KEY `tipo_vinculo` (`tipo_vinculo`),
  UNIQUE KEY `idx_vinculo` (`tipo_vinculo`,`des_vinculo`,`des_vinculo_passivo`,`ind_excluido`),
  KEY `tip_situacao` (`tip_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_votacao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_votacao` (
  `tip_votacao` int NOT NULL AUTO_INCREMENT,
  `des_tipo_votacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`tip_votacao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tramitacao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tramitacao` (
  `cod_tramitacao` int NOT NULL AUTO_INCREMENT,
  `cod_status` int DEFAULT NULL,
  `cod_materia` int NOT NULL,
  `dat_tramitacao` date DEFAULT NULL,
  `cod_unid_tram_local` int DEFAULT NULL,
  `cod_usuario_local` int DEFAULT NULL,
  `dat_encaminha` datetime DEFAULT NULL,
  `cod_unid_tram_dest` int DEFAULT NULL,
  `cod_usuario_dest` int DEFAULT NULL,
  `dat_recebimento` datetime DEFAULT NULL,
  `ind_ult_tramitacao` tinyint NOT NULL,
  `ind_urgencia` tinyint NOT NULL,
  `sgl_turno` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_tramitacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dat_fim_prazo` date DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_tramitacao`),
  KEY `cod_unid_tram_local` (`cod_unid_tram_local`),
  KEY `cod_unid_tram_dest` (`cod_unid_tram_dest`),
  KEY `cod_status` (`cod_status`),
  KEY `cod_materia` (`cod_materia`),
  KEY `idx_tramit_ultmat` (`ind_ult_tramitacao`,`dat_tramitacao`,`cod_materia`,`ind_excluido`),
  KEY `sgl_turno` (`sgl_turno`),
  KEY `cod_usuario_local` (`cod_usuario_local`),
  KEY `cod_usuario_dest` (`cod_usuario_dest`),
  FULLTEXT KEY `idx_busca` (`txt_tramitacao`),
  CONSTRAINT `tramitacao_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia_legislativa` (`cod_materia`) ON DELETE CASCADE,
  CONSTRAINT `tramitacao_ibfk_2` FOREIGN KEY (`cod_status`) REFERENCES `status_tramitacao` (`cod_status`),
  CONSTRAINT `tramitacao_ibfk_3` FOREIGN KEY (`cod_unid_tram_local`) REFERENCES `unidade_tramitacao` (`cod_unid_tramitacao`),
  CONSTRAINT `tramitacao_ibfk_4` FOREIGN KEY (`cod_unid_tram_dest`) REFERENCES `unidade_tramitacao` (`cod_unid_tramitacao`),
  CONSTRAINT `tramitacao_ibfk_5` FOREIGN KEY (`cod_usuario_local`) REFERENCES `usuario` (`cod_usuario`),
  CONSTRAINT `tramitacao_ibfk_6` FOREIGN KEY (`cod_usuario_dest`) REFERENCES `usuario` (`cod_usuario`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=353074 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tramitacao_administrativo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tramitacao_administrativo` (
  `cod_tramitacao` int NOT NULL AUTO_INCREMENT,
  `cod_documento` int NOT NULL DEFAULT '0',
  `dat_tramitacao` date DEFAULT NULL,
  `cod_unid_tram_local` int DEFAULT NULL,
  `cod_usuario_local` int DEFAULT NULL,
  `dat_encaminha` datetime DEFAULT NULL,
  `cod_unid_tram_dest` int DEFAULT NULL,
  `cod_usuario_dest` int DEFAULT NULL,
  `dat_recebimento` datetime DEFAULT NULL,
  `cod_status` int DEFAULT NULL,
  `ind_ult_tramitacao` tinyint NOT NULL DEFAULT '0',
  `txt_tramitacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dat_fim_prazo` date DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_tramitacao`),
  KEY `cod_unid_tram_dest` (`cod_unid_tram_dest`),
  KEY `tramitacao_ind1` (`ind_ult_tramitacao`),
  KEY `cod_unid_tram_local` (`cod_unid_tram_local`),
  KEY `cod_status` (`cod_status`),
  KEY `cod_documento` (`cod_documento`),
  KEY `cod_usuario_local` (`cod_usuario_local`),
  KEY `cod_usuario_dest` (`cod_usuario_dest`),
  CONSTRAINT `tramitacao_administrativo_ibfk_1` FOREIGN KEY (`cod_documento`) REFERENCES `documento_administrativo` (`cod_documento`) ON DELETE CASCADE,
  CONSTRAINT `tramitacao_administrativo_ibfk_2` FOREIGN KEY (`cod_status`) REFERENCES `status_tramitacao_administrativo` (`cod_status`),
  CONSTRAINT `tramitacao_administrativo_ibfk_3` FOREIGN KEY (`cod_unid_tram_dest`) REFERENCES `unidade_tramitacao` (`cod_unid_tramitacao`),
  CONSTRAINT `tramitacao_administrativo_ibfk_4` FOREIGN KEY (`cod_unid_tram_local`) REFERENCES `unidade_tramitacao` (`cod_unid_tramitacao`),
  CONSTRAINT `tramitacao_administrativo_ibfk_5` FOREIGN KEY (`cod_usuario_local`) REFERENCES `usuario` (`cod_usuario`),
  CONSTRAINT `tramitacao_administrativo_ibfk_6` FOREIGN KEY (`cod_usuario_dest`) REFERENCES `usuario` (`cod_usuario`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `turno_discussao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno_discussao` (
  `cod_turno` int NOT NULL AUTO_INCREMENT,
  `sgl_turno` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `des_turno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_turno`),
  UNIQUE KEY `idx_unique_key` (`cod_turno`,`sgl_turno`,`ind_excluido`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unidade_tramitacao`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade_tramitacao` (
  `cod_unid_tramitacao` int NOT NULL AUTO_INCREMENT,
  `cod_comissao` int DEFAULT NULL,
  `cod_orgao` int DEFAULT NULL,
  `cod_parlamentar` int DEFAULT NULL,
  `ind_leg` tinyint DEFAULT '0',
  `unid_dest_permitidas` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_permitidos` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_adm` tinyint DEFAULT '0',
  `status_adm_permitidos` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_unid_tramitacao`),
  KEY `idx_unidtramit_orgao` (`cod_orgao`,`ind_excluido`),
  KEY `idx_unidtramit_comissao` (`cod_comissao`,`ind_excluido`),
  KEY `cod_orgao` (`cod_orgao`),
  KEY `cod_comissao` (`cod_comissao`),
  KEY `idx_unidtramit_parlamentar` (`cod_parlamentar`,`ind_excluido`),
  KEY `cod_parlamentar` (`cod_parlamentar`),
  KEY `ind_leg` (`ind_leg`),
  KEY `ind_adm` (`ind_adm`),
  KEY `ind_leg_2` (`ind_leg`),
  KEY `ind_adm_2` (`ind_adm`),
  CONSTRAINT `unidade_tramitacao_ibfk_1` FOREIGN KEY (`cod_comissao`) REFERENCES `comissao` (`cod_comissao`),
  CONSTRAINT `unidade_tramitacao_ibfk_2` FOREIGN KEY (`cod_orgao`) REFERENCES `orgao` (`cod_orgao`),
  CONSTRAINT `unidade_tramitacao_ibfk_3` FOREIGN KEY (`cod_parlamentar`) REFERENCES `parlamentar` (`cod_parlamentar`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `cod_usuario` int NOT NULL AUTO_INCREMENT,
  `col_username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_completo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dat_nascimento` date DEFAULT NULL,
  `num_cpf` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_rg` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tit_eleitor` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_residencial` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_localidade_resid` int DEFAULT NULL,
  `num_cep_resid` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tel_resid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tel_celular` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_cargo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tel_comercial` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_ramal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL,
  PRIMARY KEY (`cod_usuario`),
  KEY `idx_col_username` (`col_username`),
  KEY `idx_cod_localidade` (`cod_localidade_resid`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`cod_localidade_resid`) REFERENCES `localidade` (`cod_localidade`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario_unid_tram`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_unid_tram` (
  `cod_usuario` int NOT NULL,
  `cod_unid_tramitacao` int NOT NULL,
  `ind_responsavel` tinyint NOT NULL DEFAULT '0',
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  UNIQUE KEY `PRIMARY_KEY` (`cod_usuario`,`cod_unid_tramitacao`),
  KEY `idx_usuario` (`cod_usuario`),
  KEY `idx_unid_tramitacao` (`cod_unid_tramitacao`),
  CONSTRAINT `usuario_unid_tram_ibfk_1` FOREIGN KEY (`cod_unid_tramitacao`) REFERENCES `unidade_tramitacao` (`cod_unid_tramitacao`) ON DELETE CASCADE,
  CONSTRAINT `usuario_unid_tram_ibfk_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vinculo_norma_juridica`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vinculo_norma_juridica` (
  `cod_vinculo` int NOT NULL AUTO_INCREMENT,
  `cod_norma_referente` int NOT NULL,
  `cod_norma_referida` int DEFAULT NULL,
  `tip_vinculo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt_observacao_vinculo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `txt_descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cod_vinculo`),
  KEY `tip_vinculo` (`tip_vinculo`),
  KEY `idx_vnj_norma_referente` (`cod_norma_referente`,`cod_norma_referida`,`ind_excluido`),
  KEY `idx_vnj_norma_referida` (`cod_norma_referida`,`cod_norma_referente`,`ind_excluido`),
  KEY `cod_norma_referente` (`cod_norma_referente`),
  KEY `cod_norma_referida` (`cod_norma_referida`),
  CONSTRAINT `vinculo_norma_juridica_ibfk_1` FOREIGN KEY (`cod_norma_referente`) REFERENCES `norma_juridica` (`cod_norma`) ON DELETE CASCADE,
  CONSTRAINT `vinculo_norma_juridica_ibfk_2` FOREIGN KEY (`cod_norma_referida`) REFERENCES `norma_juridica` (`cod_norma`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visita`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visita` (
  `cod_visita` int NOT NULL AUTO_INCREMENT,
  `cod_pessoa` int NOT NULL,
  `dat_entrada` datetime NOT NULL,
  `cod_funcionario` int NOT NULL,
  `num_cracha` int DEFAULT NULL,
  `dat_saida` datetime DEFAULT NULL,
  `txt_atendimento` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `des_situacao` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dat_solucao` date DEFAULT NULL,
  `txt_observacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ind_excluido` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_visita`),
  KEY `cod_funcionario` (`cod_funcionario`),
  KEY `cod_pessoa` (`cod_pessoa`) USING BTREE,
  KEY `dat_entrada` (`dat_entrada`),
  KEY `des_situacao` (`des_situacao`),
  CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`cod_funcionario`) REFERENCES `funcionario` (`cod_funcionario`) ON DELETE CASCADE,
  CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`cod_pessoa`) REFERENCES `pessoa` (`cod_pessoa`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-20  8:42:00
