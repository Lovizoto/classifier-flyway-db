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



-- V2__Cria_tabela_analise_autoria_materia.sql

-- Passo 1: Criar a estrutura da nova tabela de análise com todas as colunas definidas.
CREATE TABLE analise_autoria_materia (
                                         cod_parlamentar INT,
                                         nome_autor VARCHAR(255),
                                         ano_ident_basica INT,
                                         dat_apresentacao DATE,
                                         txt_ementa TEXT,
                                         cod_materia INT NOT NULL,
                                         tipo VARCHAR(100),
                                         tema VARCHAR(100),
                                         subtema VARCHAR(100)

);

-- Passo 2: Inserir os dados das tabelas originais na nova tabela.
-- As colunas 'tipo', 'tema' e 'subtema' ficarão automaticamente NULAS.
INSERT INTO analise_autoria_materia
(cod_parlamentar, nome_autor, ano_ident_basica, dat_apresentacao, txt_ementa, cod_materia)
SELECT
    p.cod_parlamentar,
    COALESCE(p.nom_parlamentar, a.nom_autor) AS nome_autor,
    m.ano_ident_basica,
    m.dat_apresentacao,
    m.txt_ementa,
    m.cod_materia
FROM
    materia_legislativa m
        JOIN
    autoria au ON au.cod_materia = m.cod_materia
        JOIN
    autor a ON a.cod_autor = au.cod_autor
        LEFT JOIN
    parlamentar p ON p.cod_parlamentar = a.cod_parlamentar;




