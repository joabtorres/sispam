-- MySQL Script generated by MySQL Workbench
-- 11/03/20 11:25:58
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sigai
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sigai
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS sigai DEFAULT CHARACTER SET utf8 ;
USE sigai ;

-- -----------------------------------------------------
-- Table empresa
-- -----------------------------------------------------
DROP TABLE IF EXISTS empresa ;

CREATE TABLE IF NOT EXISTS empresa (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NULL,
  abreviacao VARCHAR(45) NULL,
  endereco VARCHAR(255) NULL,
  cep VARCHAR(45) NULL,
  cnpj VARCHAR(45) NULL,
  telefone VARCHAR(45) NULL,
  email VARCHAR(255) NULL,
  site VARCHAR(255) NULL,
  figura VARCHAR(255) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table setor
-- -----------------------------------------------------
DROP TABLE IF EXISTS setor ;

CREATE TABLE IF NOT EXISTS setor (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NULL,
  abreviacao VARCHAR(45) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table usuario
-- -----------------------------------------------------
DROP TABLE IF EXISTS usuario ;

CREATE TABLE IF NOT EXISTS usuario (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  setor_id INT UNSIGNED NOT NULL,
  portaria VARCHAR(45) NULL,
  cargo VARCHAR(45) NULL,
  nome VARCHAR(255) NOT NULL,
  usuario VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  acesso INT NULL,
  cadastro DATE NULL,
  imagem VARCHAR(255) NULL,
  status INT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX usuario_UNIQUE (usuario ASC),
  UNIQUE INDEX email_UNIQUE (email ASC),
  CONSTRAINT fk_usuario_setor1
    FOREIGN KEY (setor_id)
    REFERENCES setor (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table ti_chamado_status
-- -----------------------------------------------------
DROP TABLE IF EXISTS ti_chamado_status ;

CREATE TABLE IF NOT EXISTS ti_chamado_status (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ti_chamado
-- -----------------------------------------------------
DROP TABLE IF EXISTS ti_chamado ;

CREATE TABLE IF NOT EXISTS ti_chamado (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  setor_id INT UNSIGNED NOT NULL,
  usuario_id INT UNSIGNED NOT NULL,
  status_id INT UNSIGNED NOT NULL,
  assunto VARCHAR(255) NULL,
  data DATETIME NULL,
  descricao TEXT NULL,
  anexo VARCHAR(255) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_chamado_setor
    FOREIGN KEY (setor_id)
    REFERENCES setor (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_chamado_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_chamado_chamado_status1
    FOREIGN KEY (status_id)
    REFERENCES ti_chamado_status (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table ti_chamado_historico
-- -----------------------------------------------------
DROP TABLE IF EXISTS ti_chamado_historico ;

CREATE TABLE IF NOT EXISTS ti_chamado_historico (
  id INT NOT NULL AUTO_INCREMENT,
  chamado_id INT UNSIGNED NOT NULL,
  status_id INT UNSIGNED NOT NULL,
  usuario_id INT UNSIGNED NOT NULL,
  data DATETIME NULL,
  descricao TEXT NULL,
  anexo VARCHAR(255) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_chamado_historico_chamado1
    FOREIGN KEY (chamado_id)
    REFERENCES ti_chamado (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_chamado_historico_chamado_status1
    FOREIGN KEY (status_id)
    REFERENCES ti_chamado_status (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_chamado_historico_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table fisc_tipo_protocolo
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_tipo_protocolo ;

CREATE TABLE IF NOT EXISTS fisc_tipo_protocolo (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo_protocolo VARCHAR(100) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_tipo_documento
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_tipo_documento ;

CREATE TABLE IF NOT EXISTS fisc_tipo_documento (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  documento VARCHAR(100) NULL,
  protocolo_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cofisc_tipo_documento_cofisc_protocolo1
    FOREIGN KEY (protocolo_id)
    REFERENCES fisc_tipo_protocolo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_tipo_denuncia
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_tipo_denuncia ;

CREATE TABLE IF NOT EXISTS fisc_tipo_denuncia (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo_denuncia VARCHAR(100) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table cidade
-- -----------------------------------------------------
DROP TABLE IF EXISTS cidade ;

CREATE TABLE IF NOT EXISTS cidade (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  cidade VARCHAR(100) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bairro
-- -----------------------------------------------------
DROP TABLE IF EXISTS bairro ;

CREATE TABLE IF NOT EXISTS bairro (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  bairro VARCHAR(150) NULL,
  cidade_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_bairro_cidade1
    FOREIGN KEY (cidade_id)
    REFERENCES cidade (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_origem
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_origem ;

CREATE TABLE IF NOT EXISTS fisc_origem (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  origem VARCHAR(100) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_tipo_solicitacao
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_tipo_solicitacao ;

CREATE TABLE IF NOT EXISTS fisc_tipo_solicitacao (
  id INT NOT NULL,
  tipo_solicitacao VARCHAR(100) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_protocolo
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_protocolo ;

CREATE TABLE IF NOT EXISTS fisc_protocolo (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  data_protocolo DATETIME NULL,
  protocolo_id INT UNSIGNED NOT NULL,
  tipo_documento_id INT UNSIGNED NOT NULL,
  origem_id INT UNSIGNED NOT NULL,
  numero_protocolo VARCHAR(45) NULL,
  ano_protocolo VARCHAR(10) NULL,
  numero_oficio VARCHAR(45) NULL,
  ano_oficio VARCHAR(10) NULL,
  numero_memorando VARCHAR(45) NULL,
  ano_memorando VARCHAR(10) NULL,
  hash VARCHAR(32) NULL,
  denuncia_id INT NULL,
  solicitacao_id INT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_table1_cofisc_protocolo1
    FOREIGN KEY (protocolo_id)
    REFERENCES fisc_tipo_protocolo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_table1_cofisc_tipo_documento1
    FOREIGN KEY (tipo_documento_id)
    REFERENCES fisc_tipo_documento (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_table1_origem1
    FOREIGN KEY (origem_id)
    REFERENCES fisc_origem (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_solicitacao
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_solicitacao ;

CREATE TABLE IF NOT EXISTS fisc_solicitacao (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  protocolo_id INT UNSIGNED NOT NULL,
  usuario_id INT UNSIGNED NOT NULL,
  status INT NULL,
  tipo_solicitacao_id INT NOT NULL,
  solicitante VARCHAR(255) NULL,
  telefone VARCHAR(45) NULL,
  email VARCHAR(150) NULL,
  descricao VARCHAR(255) NULL,
  endereco VARCHAR(255) NULL,
  cidade_id INT UNSIGNED NOT NULL,
  bairro_id INT UNSIGNED NOT NULL,
  latitude VARCHAR(45) NULL,
  longitude VARCHAR(45) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cofisc_solicitacao_cofisc_tipo_solicita????o1
    FOREIGN KEY (tipo_solicitacao_id)
    REFERENCES fisc_tipo_solicitacao (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cofisc_solicitacao_cofisc_protocolo1
    FOREIGN KEY (protocolo_id)
    REFERENCES fisc_protocolo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cofisc_solicitacao_bairro1
    FOREIGN KEY (bairro_id)
    REFERENCES bairro (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cofisc_solicitacao_cidade1
    FOREIGN KEY (cidade_id)
    REFERENCES cidade (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cofisc_solicitacao_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_denuncia
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_denuncia ;

CREATE TABLE IF NOT EXISTS fisc_denuncia (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  protocolo_id INT UNSIGNED NOT NULL,
  usuario_id INT UNSIGNED NOT NULL,
  status INT NULL,
  tipo_denuncia_id INT UNSIGNED NOT NULL,
  denunciado VARCHAR(255) NULL,
  descricao VARCHAR(255) NULL,
  cidade_id INT UNSIGNED NOT NULL,
  bairro_id INT UNSIGNED NOT NULL,
  endereco VARCHAR(255) NULL,
  latitude VARCHAR(45) NULL,
  longitude VARCHAR(45) NULL,
  denunciante VARCHAR(255) NULL,
  telefone VARCHAR(45) NULL,
  email VARCHAR(150) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cofisc_denuncia_cofisc_tipo_denuncia1
    FOREIGN KEY (tipo_denuncia_id)
    REFERENCES fisc_tipo_denuncia (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cofisc_denuncia_cidade1
    FOREIGN KEY (cidade_id)
    REFERENCES cidade (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cofisc_denuncia_bairro1
    FOREIGN KEY (bairro_id)
    REFERENCES bairro (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cofisc_denuncia_cofisc_protocolo1
    FOREIGN KEY (protocolo_id)
    REFERENCES fisc_protocolo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cofisc_denuncia_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_historico_denuncia
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_historico_denuncia ;

CREATE TABLE IF NOT EXISTS fisc_historico_denuncia (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  data DATETIME NULL,
  descricao VARCHAR(255) NULL,
  usuario_id INT UNSIGNED NOT NULL,
  denuncia_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cofisc_historico_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cofisc_historico_cofisc_denuncia1
    FOREIGN KEY (denuncia_id)
    REFERENCES fisc_denuncia (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_historico_solicitacao
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_historico_solicitacao ;

CREATE TABLE IF NOT EXISTS fisc_historico_solicitacao (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  data DATETIME NULL,
  descricao VARCHAR(255) NULL,
  usuario_id INT UNSIGNED NOT NULL,
  solicitacao_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cofisc_historico_solicitacao_cofisc_solicitacao1
    FOREIGN KEY (solicitacao_id)
    REFERENCES fisc_solicitacao (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cofisc_historico_solicitacao_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_anexo_denuncia
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_anexo_denuncia ;

CREATE TABLE IF NOT EXISTS fisc_anexo_denuncia (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  denuncia_id INT UNSIGNED NOT NULL,
  nome VARCHAR(255) NULL,
  anexo VARCHAR(255) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cofisc_anexo_denuncia_cofisc_denuncia1
    FOREIGN KEY (denuncia_id)
    REFERENCES fisc_denuncia (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_anexo_solicitacao
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_anexo_solicitacao ;

CREATE TABLE IF NOT EXISTS fisc_anexo_solicitacao (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  solicitacao_id INT UNSIGNED NOT NULL,
  nome VARCHAR(255) NULL,
  anexo VARCHAR(255) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cofisc_anexo_solicitacao_cofisc_solicitacao1
    FOREIGN KEY (solicitacao_id)
    REFERENCES fisc_solicitacao (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_vistoria_denuncia
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_vistoria_denuncia ;

CREATE TABLE IF NOT EXISTS fisc_vistoria_denuncia (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  data DATE NULL,
  descricao TEXT NULL,
  denuncia_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cofisc_vistoria_denuncia_cofisc_denuncia1
    FOREIGN KEY (denuncia_id)
    REFERENCES fisc_denuncia (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table fisc_vistoria_solicitacao
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_vistoria_solicitacao ;

CREATE TABLE IF NOT EXISTS fisc_vistoria_solicitacao (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  data DATE NULL,
  descricao TEXT NULL,
  solicitacao_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cofisc_vistoria_solicitacao_cofisc_solicitacao1
    FOREIGN KEY (solicitacao_id)
    REFERENCES fisc_solicitacao (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table protocolo_tipo
-- -----------------------------------------------------
DROP TABLE IF EXISTS protocolo_tipo ;

CREATE TABLE IF NOT EXISTS protocolo_tipo (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(45) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table protocolo_objetivo
-- -----------------------------------------------------
DROP TABLE IF EXISTS protocolo_objetivo ;

CREATE TABLE IF NOT EXISTS protocolo_objetivo (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  objetivo VARCHAR(45) NULL,
  tipo_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_protocolo_objetivo_protocolo_tipo1
    FOREIGN KEY (tipo_id)
    REFERENCES protocolo_tipo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table protocolo
-- -----------------------------------------------------
DROP TABLE IF EXISTS protocolo ;

CREATE TABLE IF NOT EXISTS protocolo (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo_id INT UNSIGNED NOT NULL,
  objetivo_id INT UNSIGNED NOT NULL,
  numero_protocolo VARCHAR(45) NOT NULL,
  data DATE NULL,
  interessado VARCHAR(255) NULL,
  contato VARCHAR(255) NULL,
  protocolista_id INT UNSIGNED NOT NULL,
  numero_folhas VARCHAR(45) NULL,
  assunto TEXT NULL,
  descricao TEXT NULL,
  cidade INT NULL,
  bairro INT NULL,
  endereco VARCHAR(255) NULL,
  numero VARCHAR(45) NULL,
  latitude VARCHAR(45) NULL,
  longitude VARCHAR(45) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_protocolo_processos_usuario1
    FOREIGN KEY (protocolista_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_protocolo_protocolo_tipo1
    FOREIGN KEY (tipo_id)
    REFERENCES protocolo_tipo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_protocolo_protocolo_objetivo1
    FOREIGN KEY (objetivo_id)
    REFERENCES protocolo_objetivo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table tramitacao
-- -----------------------------------------------------
DROP TABLE IF EXISTS tramitacao ;

CREATE TABLE IF NOT EXISTS tramitacao (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  protocolo_id INT UNSIGNED NOT NULL,
  setor_id INT UNSIGNED NOT NULL,
  usuario_id INT UNSIGNED NOT NULL,
  data DATETIME NULL,
  descricao TEXT NULL,
  anexo VARCHAR(255) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_tramitacao_protocolo1
    FOREIGN KEY (protocolo_id)
    REFERENCES protocolo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_tramitacao_setor1
    FOREIGN KEY (setor_id)
    REFERENCES setor (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_tramitacao_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
