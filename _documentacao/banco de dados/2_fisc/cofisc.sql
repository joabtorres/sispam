
-- -----------------------------------------------------
-- Table fisc_tipo_protocolo
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_tipo_protocolo ;

CREATE TABLE IF NOT EXISTS fisc_tipo_protocolo (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo_protocolo VARCHAR(100) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table fisc_tipo_documento
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_tipo_documento ;

CREATE TABLE IF NOT EXISTS fisc_tipo_documento (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  documento VARCHAR(100) NULL,
  protocolo_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_fisc_tipo_documento_fisc_protocolo1
    FOREIGN KEY (protocolo_id)
    REFERENCES fisc_tipo_protocolo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table fisc_tipo_denuncia
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_tipo_denuncia ;

CREATE TABLE IF NOT EXISTS fisc_tipo_denuncia (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo_denuncia VARCHAR(100) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table fisc_origem
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_origem ;

CREATE TABLE IF NOT EXISTS fisc_origem (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  origem VARCHAR(100) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table fisc_tipo_solicitacao
-- -----------------------------------------------------
DROP TABLE IF EXISTS fisc_tipo_solicitacao ;

CREATE TABLE IF NOT EXISTS fisc_tipo_solicitacao (
  id INT NOT NULL,
  tipo_solicitacao VARCHAR(100) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  CONSTRAINT fk_table1_fisc_protocolo1
    FOREIGN KEY (protocolo_id)
    REFERENCES fisc_tipo_protocolo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_table1_fisc_tipo_documento1
    FOREIGN KEY (tipo_documento_id)
    REFERENCES fisc_tipo_documento (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_table1_origem1
    FOREIGN KEY (origem_id)
    REFERENCES fisc_origem (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  CONSTRAINT fk_fisc_solicitacao_fisc_tipo_solicita????o1
    FOREIGN KEY (tipo_solicitacao_id)
    REFERENCES fisc_tipo_solicitacao (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fisc_solicitacao_fisc_protocolo1
    FOREIGN KEY (protocolo_id)
    REFERENCES fisc_protocolo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fisc_solicitacao_bairro1
    FOREIGN KEY (bairro_id)
    REFERENCES bairro (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fisc_solicitacao_cidade1
    FOREIGN KEY (cidade_id)
    REFERENCES cidade (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fisc_solicitacao_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  CONSTRAINT fk_fisc_denuncia_fisc_tipo_denuncia1
    FOREIGN KEY (tipo_denuncia_id)
    REFERENCES fisc_tipo_denuncia (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fisc_denuncia_cidade1
    FOREIGN KEY (cidade_id)
    REFERENCES cidade (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fisc_denuncia_bairro1
    FOREIGN KEY (bairro_id)
    REFERENCES bairro (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fisc_denuncia_fisc_protocolo1
    FOREIGN KEY (protocolo_id)
    REFERENCES fisc_protocolo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fisc_denuncia_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  CONSTRAINT fk_fisc_historico_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fisc_historico_fisc_denuncia1
    FOREIGN KEY (denuncia_id)
    REFERENCES fisc_denuncia (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  CONSTRAINT fk_fisc_historico_solicitacao_fisc_solicitacao1
    FOREIGN KEY (solicitacao_id)
    REFERENCES fisc_solicitacao (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_fisc_historico_solicitacao_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  CONSTRAINT fk_fisc_anexo_denuncia_fisc_denuncia1
    FOREIGN KEY (denuncia_id)
    REFERENCES fisc_denuncia (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  CONSTRAINT fk_fisc_anexo_solicitacao_fisc_solicitacao1
    FOREIGN KEY (solicitacao_id)
    REFERENCES fisc_solicitacao (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

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
  CONSTRAINT fk_fisc_vistoria_denuncia_fisc_denuncia1
    FOREIGN KEY (denuncia_id)
    REFERENCES fisc_denuncia (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  CONSTRAINT fk_fisc_vistoria_solicitacao_fisc_solicitacao1
    FOREIGN KEY (solicitacao_id)
    REFERENCES fisc_solicitacao (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- cad tipo de protocolo
INSERT INTO fisc_tipo_protocolo (id, tipo_protocolo) VALUES 
('1', 'Documento'), ('2', 'Processo');

-- CAD fisc_tipo_documento
INSERT INTO fisc_tipo_documento (id, documento, protocolo_id) VALUES
('1', 'E-mail', '1'),
('2', 'Formul??rio de Den??ncia', '1'),
('3', 'Memorando', '1'),
('4', 'Of??cio', '1'),
('5', 'Outros', '1'),
('6', 'Processo Administrativo Punitivo', '2'),
('7', 'Requerimento', '1');

-- cad fisc_origem

INSERT INTO fisc_origem (id, origem) VALUES 
('1', 'Den??ncia Externa'),
('2', 'Denuncia Interna'),
('3', 'Poder Executivo'),
('4', 'Poder Judici??rio'),
('5', 'Poder Legislativo'),
('6', 'Interna'),
('7', 'Externa');

 -- CAD fisc_tipo_denuncia
INSERT INTO fisc_tipo_denuncia ( id, tipo_denuncia) VALUES
('1', 'Animais Dom??sticos'),
('2', 'Animais Silvestres'),
('3', 'Apreens??o de Madeira'),
('4', 'Animais Sinantr??picos'),
('5', 'Corpo H??drico'),
('6', 'Cumprimento de condicionantes intempestivo'),
('7', 'Desmatamento'),
('8', 'Efluente Dom??stico'),
('9', 'Efluente Industrial'),
('10', 'Indeferimento de Licenciamento Ambiental'),
('11', 'Indeferimento de processo de licenciamento'),
('12', 'Indeferimento ou Suspens??o de Licen??a'),
('13', 'N??o cumprimento de condicionante'),
('14', 'Outros'),
('15', 'Poda de Indiv??duo Arb??reo'),
('16', 'Polui????o Atmosf??rica'),
('17', 'Polui????o Sonora'),
('18', 'Polui????o Visual'),
('19', 'Queimadas'),
('20', 'Renova????o de licen??a fora do prazo'),
('21', 'Res??duos s??lidos'),
('22', 'Sem Licen??a'),
('23', 'Supress??o de Indiv??duo Arb??reo'),
('24', 'Suspens??o de licen??a'),
('25', 'Terreno Baldio');



-- CAD fisc_tipo_solicitacao
INSERT INTO fisc_tipo_solicitacao (id, tipo_solicitacao) VALUES
('1', 'Armazenamento de Madeira'),
('2', 'Atividade de Fiscaliza????o'),
('3', 'Captura de Animais Dom??sticos'),
('4', 'Captura de Animais Silvestres'),
('5', 'Colabora????o'),
('6', 'Conv??nio'),
('7', 'Convite'),
('8', 'Convoca????o'),
('9', 'Doa????o de Madeira'),
('10', 'Elabora????o de Projeto'),
('11', 'Entrega de Defesa de Auto de Infra????o'),
('12', 'Entrega de Documenta????es Pendentes'),
('13', 'Informa????es'),
('14', 'Nota T??cnica'),
('15', 'Of??cio'),
('16', 'Outros'),
('17', 'Parece T??cnico'),
('18', 'Processo'),
('19', 'Prorroga????o de Prazo'),
('20', 'Relat??rio de Fiscaliza????o');


