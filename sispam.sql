-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Jun-2022 às 19:17
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sispam`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro`
--

CREATE TABLE `bairro` (
  `id` int(10) UNSIGNED NOT NULL,
  `bairro` varchar(150) DEFAULT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `bairro`
--

INSERT INTO `bairro` (`id`, `bairro`, `cidade_id`) VALUES
(1, 'Apeú', 1),
(2, 'Área de Invasão', 1),
(3, 'Bairro Novo', 1),
(4, 'Betânia', 1),
(5, 'Bom Jesus', 1),
(6, 'Caiçara', 1),
(7, 'Cariri', 1),
(8, 'Centro', 1),
(9, 'Conjuntos Ypês', 1),
(10, 'Cristo', 1),
(11, 'Distrito Industrial', 1),
(12, 'Estrela', 1),
(13, 'Florestal', 1),
(14, 'Fonte Boa', 1),
(15, 'Heliolândia', 1),
(16, 'Ianetama', 1),
(17, 'Imperador', 1),
(18, 'Imperial', 1),
(19, 'Jaderlândia', 1),
(20, 'Não se Aplica', 1),
(21, 'Nova Olinda', 1),
(22, 'Novo Caiçara', 1),
(23, 'Novo Estrela', 1),
(24, 'Pantanal', 1),
(25, 'Pirapora', 1),
(26, 'Propira', 1),
(27, 'Rouxinol', 1),
(28, 'Sales Jardim', 1),
(29, 'Salgadinho', 1),
(30, 'Santa Catarina', 1),
(31, 'Santa Helena', 1),
(32, 'Santa Lídia', 1),
(33, 'São José', 1),
(34, 'Saudade I', 1),
(35, 'Saudade II', 1),
(36, 'Titanlândia', 1),
(37, 'Tókio', 1),
(38, 'Zona Rural', 1),
(39, 'Japiim', 1),
(40, 'Jardin das Acácias', 1),
(41, 'Milagre', 1),
(42, 'Campus Lindos', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `id` int(10) UNSIGNED NOT NULL,
  `cidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id`, `cidade`) VALUES
(1, 'Castanhal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cprn`
--

CREATE TABLE `cprn` (
  `id` int(10) UNSIGNED NOT NULL,
  `protocolo_id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `acao_id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) DEFAULT NULL,
  `interessado` varchar(255) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `bairro_id` int(10) UNSIGNED NOT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cprn`
--

INSERT INTO `cprn` (`id`, `protocolo_id`, `categoria_id`, `acao_id`, `usuario_id`, `status`, `interessado`, `telefone`, `email`, `descricao`, `endereco`, `cidade_id`, `bairro_id`, `latitude`, `longitude`) VALUES
(5, 5, 1, 1, 42, 1, 'Empreendimento X', '', '', 'SOLICITAÇÕ DE APOIO DE DOAÇÃO DE PLACAS', 'R. Hernane Lameira, 323 - Santa Lídia, Castanhal - PA, 68745-390, Brasil', 1, 10, '-1.2982212', '-47.9269387'),
(6, 6, 1, 1, 42, 1, 'Empreendimento X', '', '', 'SOLICITAÇÕ DE APOIO DE DOAÇÃO DE PLACAS', 'R. Hernane Lameira, 323 - Santa Lídia, Castanhal - PA, 68745-390, Brasil', 1, 10, '-1.3027690547190163', '-47.93783919743652'),
(7, 7, 1, 1, 42, 1, 'Empreendimento X', '', '', 'SOLICITAÇÕ DE APOIO DE DOAÇÃO DE PLACAS', 'R. Hernane Lameira, 323 - Santa Lídia, Castanhal - PA, 68745-390, Brasil', 1, 10, '-1.3027690547190163', '-47.93783919743652');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cprn_anexo`
--

CREATE TABLE `cprn_anexo` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` text NOT NULL,
  `data` date NOT NULL,
  `anexo` varchar(255) DEFAULT NULL,
  `cprn_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cprn_anexo`
--

INSERT INTO `cprn_anexo` (`id`, `nome`, `descricao`, `data`, `anexo`, `cprn_id`) VALUES
(2, NULL, 'Teste', '2022-04-13', 'uploads/cprn/solicitacao/5/13-04-2022_543654f0d0789565d24767aa27375f32.pdf', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cprn_historico`
--

CREATE TABLE `cprn_historico` (
  `id` int(10) UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `cprn_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cprn_historico`
--

INSERT INTO `cprn_historico` (`id`, `data`, `descricao`, `cprn_id`, `usuario_id`) VALUES
(8, '2022-04-05', 'Será agendado a vistoria do local no dia 13/04/2022', 5, 1),
(9, '2022-04-13', 'Foi realizado o cadastro no banco de dados', 6, 1),
(10, '2022-04-13', 'Foi realizado o cadastro no banco de dados', 7, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cprn_origem`
--

CREATE TABLE `cprn_origem` (
  `id` int(10) UNSIGNED NOT NULL,
  `origem` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cprn_origem`
--

INSERT INTO `cprn_origem` (`id`, `origem`) VALUES
(1, 'Poder Executivo'),
(2, 'Poder Judiciário'),
(3, 'Poder Legislativo'),
(4, 'Interna'),
(5, 'Externa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cprn_protocolo`
--

CREATE TABLE `cprn_protocolo` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `tramitacao` int(11) DEFAULT NULL,
  `data_protocolo` date DEFAULT NULL,
  `data_recebimento` date DEFAULT NULL,
  `origem_id` int(10) UNSIGNED NOT NULL,
  `protocolo_id` int(10) UNSIGNED NOT NULL,
  `documento_id` int(10) UNSIGNED NOT NULL,
  `numero_protocolo` varchar(45) DEFAULT NULL,
  `ano_protocolo` varchar(10) DEFAULT NULL,
  `numero_oficio` varchar(45) DEFAULT NULL,
  `ano_oficio` varchar(10) DEFAULT NULL,
  `numero_memorando` varchar(45) DEFAULT NULL,
  `ano_memorando` varchar(10) DEFAULT NULL,
  `solicitante_id` int(10) UNSIGNED NOT NULL,
  `prazo` varchar(255) DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cprn_protocolo`
--

INSERT INTO `cprn_protocolo` (`id`, `tipo`, `tramitacao`, `data_protocolo`, `data_recebimento`, `origem_id`, `protocolo_id`, `documento_id`, `numero_protocolo`, `ano_protocolo`, `numero_oficio`, `ano_oficio`, `numero_memorando`, `ano_memorando`, `solicitante_id`, `prazo`, `hash`) VALUES
(5, 'solicitacao', 8, '2022-04-06', '2022-04-13', 1, 1, 2, '555', '2022', '444', '2022', '', '', 3, '', '7a66223817ab467b820a0df17da05c01'),
(6, 'solicitacao', 8, '2022-04-06', '2022-04-13', 1, 1, 2, '555', '2022', '444', '2022', '', '', 3, '', '6b5c6aae3fcb9be9bb090142a05ae4d8'),
(7, 'solicitacao', 8, '2022-04-06', '2022-04-13', 1, 1, 2, '555', '2022', '4442', '2022', '', '', 3, '', 'b865cd2f67503459522f96046225d024');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cprn_solicitante`
--

CREATE TABLE `cprn_solicitante` (
  `id` int(10) UNSIGNED NOT NULL,
  `solicitante` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cprn_solicitante`
--

INSERT INTO `cprn_solicitante` (`id`, `solicitante`) VALUES
(1, 'Prefeitura Municipal de Castanhal'),
(2, 'Ministério Público do Estado do Pará'),
(3, 'Externo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cprn_tipo_categoria`
--

CREATE TABLE `cprn_tipo_categoria` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cprn_tipo_categoria`
--

INSERT INTO `cprn_tipo_categoria` (`id`, `categoria`) VALUES
(1, 'Apoio à Gestão dos Resíduos Sólidos '),
(2, 'Arborização'),
(3, 'Bacias Hidrográficas'),
(4, 'Educação Ambiental'),
(5, 'Parque Natural Municipal de Castanhal'),
(6, 'Programa Municípios Verdes'),
(7, 'Programação Extra'),
(8, 'Sistema de Coleta Seletiva');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cprn_tipo_documento`
--

CREATE TABLE `cprn_tipo_documento` (
  `id` int(10) UNSIGNED NOT NULL,
  `documento` varchar(100) DEFAULT NULL,
  `tipo_protocolo_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cprn_tipo_documento`
--

INSERT INTO `cprn_tipo_documento` (`id`, `documento`, `tipo_protocolo_id`) VALUES
(1, 'E-mail', 1),
(2, 'Formulário de Solicitação', 1),
(3, 'Memorando', 1),
(4, 'Ofício', 1),
(5, 'Outros', 1),
(6, 'Requerimento', 1),
(7, 'Outros', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cprn_tipo_protocolo`
--

CREATE TABLE `cprn_tipo_protocolo` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_protocolo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cprn_tipo_protocolo`
--

INSERT INTO `cprn_tipo_protocolo` (`id`, `tipo_protocolo`) VALUES
(1, 'Documento'),
(2, 'Processo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cprn_tipo_solicitacao`
--

CREATE TABLE `cprn_tipo_solicitacao` (
  `id` int(11) NOT NULL,
  `acao` varchar(100) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cprn_tipo_solicitacao`
--

INSERT INTO `cprn_tipo_solicitacao` (`id`, `acao`, `categoria_id`) VALUES
(1, 'CONCISSS', 1),
(2, 'Plantio', 2),
(3, 'Plano de Arborização', 2),
(4, 'Doação de Mudas', 2),
(5, 'Vistoria Técnica', 3),
(6, 'Projetos', 3),
(7, 'Placas Educativas', 4),
(8, 'Campanhas Educativas', 4),
(9, 'Projetos', 4),
(10, 'Outros', 5),
(11, 'Plano de Manejo', 5),
(12, 'Elaboração de CAR', 6),
(13, 'Evento Interno', 7),
(14, 'Evento Externo', 7),
(15, 'Reunião', 7),
(16, 'Treinamento', 7),
(17, 'Lixeiras de Coleta Seletiva', 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cprn_vistoria`
--

CREATE TABLE `cprn_vistoria` (
  `id` int(10) UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `cprn_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cprn_vistoria`
--

INSERT INTO `cprn_vistoria` (`id`, `data`, `descricao`, `cprn_id`) VALUES
(2, '2022-04-13', 'Realizado a vistoria do local', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `abreviacao` varchar(45) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `figura` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`id`, `nome`, `abreviacao`, `endereco`, `cep`, `cnpj`, `telefone`, `email`, `site`, `figura`) VALUES
(1, 'Secretaria Municipal de Meio Ambiente - Castanhal/PA', 'SEMMA', 'R. Quincas Nascimento - Saudade I, Castanhal - PA', ' 68741-040', '05.121.991/0001-84', '(91) 3711-5959', 'semma@castanhal.pa.gov.br', 'semma@castanhal.pa.gov.br', 'uploads/empresa/8822d5d6339a368bfe91ed698b960fcc.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_anexo_denuncia`
--

CREATE TABLE `fisc_anexo_denuncia` (
  `id` int(10) UNSIGNED NOT NULL,
  `denuncia_id` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `anexo` varchar(255) DEFAULT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_anexo_solicitacao`
--

CREATE TABLE `fisc_anexo_solicitacao` (
  `id` int(10) UNSIGNED NOT NULL,
  `solicitacao_id` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `anexo` varchar(255) DEFAULT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_defesa_denuncia`
--

CREATE TABLE `fisc_defesa_denuncia` (
  `id` int(11) NOT NULL,
  `denuncia_id` int(10) UNSIGNED NOT NULL,
  `protocolo_id` int(10) UNSIGNED NOT NULL,
  `descricao` text NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_defesa_solicitacao`
--

CREATE TABLE `fisc_defesa_solicitacao` (
  `id` int(11) NOT NULL,
  `denuncia_id` int(10) UNSIGNED NOT NULL,
  `protocolo_id` int(10) UNSIGNED NOT NULL,
  `descricao` text NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_denuncia`
--

CREATE TABLE `fisc_denuncia` (
  `id` int(10) UNSIGNED NOT NULL,
  `protocolo_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) DEFAULT NULL,
  `tipo_denuncia_id` int(10) UNSIGNED NOT NULL,
  `infracao_id` int(10) UNSIGNED NOT NULL,
  `classificacao_id` int(10) UNSIGNED NOT NULL,
  `denunciado` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `bairro_id` int(10) UNSIGNED NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `denunciante` varchar(255) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_denuncia`
--

INSERT INTO `fisc_denuncia` (`id`, `protocolo_id`, `usuario_id`, `status`, `tipo_denuncia_id`, `infracao_id`, `classificacao_id`, `denunciado`, `descricao`, `cidade_id`, `bairro_id`, `endereco`, `latitude`, `longitude`, `denunciante`, `telefone`, `email`) VALUES
(18, 23, 20, 1, 5, 13, 17, 'Conhecido como Joca ', 'Os denunciantes informam que o senhor conhecido como Joca, faz descarte irregular de resíduos no seu próprio quintal', 1, 1, 'Por trás da escola caic', '', '', '', '', ''),
(20, 25, 39, 1, 1, 4, 1, 'João paulo (Ceara)', 'Denunciante informa que o senhor joão paulo (ceara) cria porco e bode na sua residencia, onde vem causando mau cheiro, e ele deixa os animais solto na rua.', 1, 1, '', '', '', '', '', ''),
(21, 26, 20, 1, 7, 24, 17, 'Chácara Santa rosa', 'Os moradores da chácara santa rosa fazem queimadas diariamente, sendo que tem idosos, muitas crianças e até recém nascidos na rua.', 1, 1, '', '', '', 'Helber de oliveira gonçalves ', '91 98145-7717', ''),
(22, 27, 34, 1, 2, 7, 5, 'SÍTIO SÃO FRANCISCO', 'desmatamento', 1, 1, '', '', '', '', '', ''),
(23, 28, 20, 1, 6, 14, 1, 'BRUNO  NIGHT SOM (LOJA)', 'O denunciante informa que na loja bruno night som trabalha com instalação de som automotivo onde vem prejudicando a vizinhança com o som auto fora de horario, ate 12 horas da noite ate aos finais de semana', 1, 1, 'Alameda castanhal', '', '', '', '', ''),
(24, 29, 20, 1, 2, 7, 5, 'Elias', 'Desmatamento na beira do igarapé', 1, 1, '', '', '', 'Maria da Costa Perreira', '', ''),
(25, 30, 20, 1, 6, 15, 1, 'Dona raimunda e a gloria ', 'poluição sonora  com som alto', 1, 1, '', '', '', '', '', ''),
(26, 31, 20, 1, 6, 14, 1, 'casquinha de carangueijo', 'poluição sonora ', 1, 1, 'rua dom pedro II', '', '', '', '', ''),
(27, 32, 20, 1, 4, 12, 13, 'Mauro dono do lava jato', 'emissão de efluentes em área inadequada ', 1, 10, 'barão do rio branco ao lado da expofac', '', '', '', '', ''),
(28, 33, 20, 1, 2, 7, 6, 'Rafaela', 'queimada', 1, 1, 'rua santo antonio', '', '', '', '', ''),
(29, 34, 20, 1, 7, 22, 1, 'GM COSTA', 'barulhos constantes e cheiro de tintas e soda', 1, 1, 'travessa minervina afonso barros', '', '', 'CMDPI', '', ''),
(30, 35, 20, 1, 2, 8, 1, 'imobiliária kobaiashi', 'queimada e supressão de árvores ', 1, 1, 'comandante assis em frente a academia F5', '', '', '', '', ''),
(31, 36, 20, 1, 2, 9, 11, 'moradores', 'corta de plantas ', 1, 1, '', '', '', '', '', ''),
(32, 37, 20, 1, 7, 22, 1, 'ao lado do sindtaxi', 'poluição atmosferica', 1, 1, '', '', '', '', '', ''),
(33, 38, 20, 1, 2, 7, 5, 'não informado', 'desmatamento ', 1, 1, '', '', '', '', '', ''),
(34, 39, 20, 1, 2, 7, 7, 'não informado ', 'desmatamento', 1, 1, '', '', '', '', '', ''),
(35, 40, 20, 1, 7, 24, 1, 'SEU lira ', 'queimada com fumaça', 1, 1, '', '', '', '', '', ''),
(36, 41, 20, 1, 5, 13, 17, 'J ANTONIO DA SILVA E CIA LTDA', 'despejo de resíduos solidos irregular ', 1, 1, '', '', '', 'ANTONIO AUGUSTO', '', ''),
(37, 42, 20, 1, 5, 13, 16, 'Ambulantes da Praça do Apeú', 'Denunciante informa que os ambulantes da Praça do Apeú estão fazendo descarte irregular dos resíduos', 1, 1, 'Av. Barão do Rio Branco s/n', '', '', 'Sub-Prefeitura do Apeú', '989223286', ''),
(38, 43, 20, 1, 6, 18, 1, 'Frutaria Verdurao', 'Denunciante informa que na Frutaria Verdurão está colocando um carro som para fazer propaganda com som muito alto.', 1, 1, 'Tv. Banjamin Constant,539', '', '', 'Anônima', '', ''),
(39, 44, 20, 1, 5, 13, 16, 'Claudia Resco', 'Resíduos Sólidos causando entupimento de tubulação de esgoto.', 1, 1, 'Residencial Beira Rio  (Agrovila Macapazinho)', '', '', 'Anônima', '9888885099', ''),
(40, 45, 20, 1, 5, 13, 16, 'Mateus Br', 'A denunciada afirma que a lixeira do supermercado é em frente a casa dela, e o fedor é insuportável, e  o lixo é recolhido uma vez por semana, (isso quando é recolhido). Disse ainda que os caminhões e caminhoneiros ficam fazendo bagunça, bebendo, as vezes', 1, 1, 'Br 316, próximo ao restaurante Boi Brvo', '', '', 'Anônima', '', ''),
(41, 47, 20, 1, 2, 7, 4, 'Wagner', 'O denunciante informa que o senhor Wagner esta tirando madeira e aterro do local informado. O terreno que esta sendo e uma área de APP, próximo de igarapés. O denunciante também fez o CAR no seu nome, onde ele não é proprietário da área.   ', 1, 38, 'Sítio São Francisco, Agrovila Macapazinho (atrás do cemitério)', '', '', 'Raimundo Jorge Bentes Ferreira', '(91) 98877-2229', ''),
(42, 48, 20, 1, 3, 28, 1, 'Condomínio Parque Paraíso', 'Denunciante informa que o Condomínio Parque Paraíso fez aberturas no muro (e gradeou as aberturas) para o escoamento de água, causando grande erosão nas proximidades, vem afetando arvores próximas.', 1, 1, 'Rod. Transcastanhal, próximo a rotatória ', '', '', 'Anônima', '', ''),
(43, 50, 20, 1, 5, 13, 1, 'Frango Assado do Paui', 'O denunciante informa que todo os dias o Sr Piaui joga pena de galinha, saco plástico, garrafa pet e caixa de papelão n canal próximo da loja Araújo Material de Construção.', 1, 1, 'Esquina da Pedro Porpino com o canal Jose Priante', '', '', 'Anônima ', '', ''),
(44, 53, 20, 1, 4, 12, 12, 'J. ANTÔNIO DA SILVA E CIA LTDA (CASTANHAL TRANSPORTES E CONSTRUÇÕES)', 'O denunciante informa que a Empresa mencionada, por causa de uma obra de construção habitacional, direcionou para a propriedade que confina ao lado direito, uma tubulação que segundo a empresa são das águas da chuva. A mesma é tomada pela vermelhidão de u', 1, 1, 'Estrada do Papuquara, próximo ao arte fazenda', '', '', 'Ântonio Augusto Lameira do Amaral Júnior', '(91) 98561-9755', 'agt.junior39@gmail.com'),
(45, 84, 39, 1, 1, 1, 1, 'ALLAN E AECIO', 'O denunciante informa que o Sr. Allan e Aecio pegaram 9 gatos que pertencem ao Sr. Elcimar e abandonaram na estrada do Papuquara sem o seu consentimento, até o momento 3 gatos foram resgatados.', 1, 1, '', '', '', 'Elcimar Feitosa de Oliveira Junior', '984810796', ''),
(46, 85, 33, 1, 3, 10, 0, 'SALLES E VALLE EMPREENDIMENTOS', 'AUTO DE INFRAÇÃO 036/2021', 1, 10, '', '', '', '', '', ''),
(47, 86, 33, 1, 3, 10, 0, 'SALLES E VALLE EMPREENDIMENTOS MOBILIARIOS LTDA', '', 1, 10, '', '', '', '', '', ''),
(48, 87, 33, 1, 3, 10, 0, 'SALLES E VALLE EMPREENDIMENTOS MOBILIARIOS LTDA', '', 1, 10, '', '', '', '', '', ''),
(49, 88, 33, 1, 3, 10, 0, 'SALLES E VALLE EMPREENDIMENTOS MOBILIARIOS LTDA', '', 1, 10, '', '', '', '', '', ''),
(50, 89, 33, 1, 3, 10, 0, 'SALLES E VALLE EMPREENDIMENTOS MOBILIARIOS LTDA', '', 1, 10, '', '', '', '', '', ''),
(51, 90, 33, 1, 3, 10, 0, 'SALLES E VALLE EMPREENDIMENTOS MOBILIARIOS LTDA', '', 1, 10, '', '', '', '', '', ''),
(52, 91, 33, 1, 3, 10, 0, 'SALLES E VALLE EMPREENDIMENTOS MOBILIARIOS LTDA', '', 1, 10, '', '', '', '', '', ''),
(54, 104, 20, 1, 6, 29, 0, 'OLIPIO ROCHA (FABRICA DE AÇAI NORTE FRUTIS)', 'ENUNCIANTE INFORMA QUE A FABRICA NORTE FRUTIS ESTA FAZENDO MUITO BARULHO, E  PROVOCANDO MAL CHEIRO', 1, 33, '', '', '', '', '', ''),
(55, 105, 33, 1, 3, 11, 1, 'DESMATAMENTO AO LADO DA CASA DA DENUNCIANTE', '', 1, 1, '', '', '', '', '', ''),
(56, 106, 20, 1, 6, 14, 0, 'LUCAR', 'A SRA VITÓRIA INFORMA QUE TEM UM NETO AUTISTA, QUE FAZ AULAS E TERAPIAS NA ÁREA EXTERNA DA CASA, E O BARULHO ALTO CAUSA BASTANTE INCOMODO TANTO PARA A CRIANÇA COMO PARA OS PROFISSIONAIS.', 1, 6, '', '', '', '', '', ''),
(57, 107, 20, 1, 6, 14, 0, 'LAVA JATO', 'DENUNCIANTE INFORMA QUE O LAVA JATO FAZ LAVAGEM DOS CARROS NA RUA E OS PRODUTOS USADOS VEM AFETANDO OS VIZINHOS COM CHEIRO FORTE E BARULHO', 1, 31, '', '', '', '', '', ''),
(58, 109, 20, 2, 1, 1, 1, 'CLINICA VETERINARIA MEDEIROS', 'ANIMAIS DA CLÍNICA FAZEM BARULHO DIA E NOITE, PERTURBANDOO SOSSEGO DA VIZINHANÇA.', 1, 1, '', '', '', 'MARIA JOSE DOS SANTOS CARVALHO', '', ''),
(59, 110, 20, 1, 3, 11, 0, 'ALEX', 'DESMATAMENTO', 1, 4, '', '', '', 'ANONIMA', '', ''),
(61, 116, 39, 1, 1, 1, 1, 'JOEL E GEOVANA', 'DENUNCIANTE INFORMA QUE OS DONOS DO CACHORRO BATEM NO ANIMAL E DEIXOU RECENTEMENTE O MESMO PRESO DENTRO DE CASA POE VÁRIOS DIAS SE MÁGUA E ALIMENTO ENQUANDO VIAJAVA.', 1, 6, 'RUA RIMUNDO LEITE PINTO Nº111 CASA B  PROX. VEGAS', '', '', 'ANONIMO', '', ''),
(62, 117, 34, 1, 7, 21, 1, 'NAO INFORMADO', 'POLUIÇÃO AMBIENTAL  ,TINTAS ALTAMENTE TÓXICAS E EXALAM UM CHEIRO MUITO FORTE.', 1, 1, 'ALAMEDA DAS FLORES Nº71', '', '', 'ANTONIO DE PONTES DA SILVA', '993660309', ''),
(63, 119, 34, 1, 2, 7, 5, 'Sitio São Francisco', 'Suposto desmatamento no Sitio São Francisco', 1, 1, '', '', '', 'delegado de policia Nelio Magalhaes da silva', '', ''),
(64, 121, 20, 1, 4, 12, 14, 'LATICINIOS KAMY', 'O DENUNCIANTE INFORMA QUE A EMPRESA LATICINIOS KAMY ESTÁ FAZENDO DESPEJO IRREGULAR DE RESÍDUOS GERADOS NA FABRICAÇÃO DE LEITE EM ESPECÍFICO SORO DE LEITE, O QUAL ESTARIA POLUINDO O CORPO HÍDRICO E NASCENTE PRÓXIMO.', 1, 38, '', '', '', 'ANONIMO', '', ''),
(65, 122, 20, 1, 6, 29, 0, 'MARILENE GONÇAVEIS (MOVELARIA)', 'DENUNCIANTE INFORMA QUE A MOVELARIA FAZ MUITO BARULHO FORA DO HORÁRIO E O DESCARREGAMENTO DE MADEIRA ACONTECE A NOITE FORA DO HORÁRIO TAMBÉM, PROVOCANDO INCOMODO COM O BARULHO.', 1, 23, '', '', '', '', '', ''),
(66, 123, 20, 1, 6, 18, 0, 'LOJA DE CONVENIÊNCIA DO POSTO BOM JESUS', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO (LOJA DE CONVENIÊNCIA), ESTÁ OCORRENDO FESTAS COM UTILIZAÇÃO DE APARELHO SONORO PROVENIENTES DE SOM AUTOMOTIVO DOS CARROS QUE FICAM ESTACIONADOS NO REFERIDO LOCAL, COM INICIO POR VOLTA DAS 22HS COM TÉRMINO POR VOL', 1, 32, '', '', '', 'RODRIGO GHAGA GONÇALVES', '', ''),
(67, 124, 20, 1, 6, 14, 0, 'LAVA JATO JUNIOR', 'DENUNCIANTE INFORMA QUE O LAVA JATO FAZ CONSTANTE BARULHO E O USO DOS PRODUTOS ESTÃO AFETANDO SUA SAÚDE E O CHEIRO DOS PRODUTOS ESTA ADENTRANDO SUA RESIDÊNCIA ', 1, 12, '', '', '', 'ANONIMO', '', ''),
(68, 125, 20, 1, 4, 12, 14, 'FRIGORÍFICO EXTREMO NORTE', 'O DENUNCIANTE INFORMA QUE, O REFERIDO FRIGORÍFICO, ESTÁ DESPEJANDO EFLUENTES/RESÍDUOS DENTRO DO CORPO HÍDRICO LOCALIZADO NA FAZENDA PROGRESSO I, OCASIONANDO A MORTANDADE DE PEIXES E OUTROS ANIMAIS.', 1, 38, '', '', '', 'DIOCLEIO BRITO DOS SANTOS', '', ''),
(69, 126, 20, 1, 6, 15, 0, 'RESIDENCIA 1 (JOSIEL), CASA 2 (CLAUDIA), CASA 3, CASA 6 (IGREJA) E A CASA DO LADO DA IGREJA', 'DENUNCIA REFERENTE A POLUIÇÃO SONORA CONSTANTEMENTE, REFERENTE A RESIDÊNCIA  1 (JOSIEL), CASA 2 (CLAUDIA), CASA 3, CASA 6 (IGREJA) E A CASA DO LADO DA IGREJA', 1, 42, '', '', '', 'ROGERIO LIMA DE ARAUJO', '', ''),
(70, 127, 20, 1, 6, 18, 0, 'ELIELSON', 'DENUNCIA REFERENTE A POLUIÇÃO SONORA, RUIDO DE CAMINHÕES INCOMODANDO A VIZINHANÇA', 1, 31, '', '', '', 'ANONIMO', '', ''),
(71, 128, 20, 1, 6, 14, 0, 'RR ÓTICA', 'DENUNCIA REFERENTE AO ESTABELECIMENTO RR ÓTICA POR  POLUIÇÃO SONORA. A DENUNCIANTE INFORMA QUE JÁ FOI FEITA UMA TENTATIVA AMIGÁVEL PARA RESOLVER A SITUAÇÃO, MAS NÃO HOUVE SOLUÇÃO. QUE O ESTABELECIMENTO COMERCIAL PASSA DOS LIMITES O DIA INTEIRO.', 1, 8, '', '', '', 'ANONIMO', '', ''),
(72, 129, 20, 1, 6, 29, 0, 'MARCELO MOVELARIA', 'DENUNCIANTE INFORMA MUITO BARULHO DE HORÁRIO CONSTANTE, ATÉ FINAIS DE SEMANA', 1, 23, '', '', '', 'SANDRA MARIA DA SILVA MELO', '', ''),
(73, 130, 20, 1, 6, 18, 0, 'ISONETE (CARRO DE SOM DO PALHAÇO)', 'DENUNCIANTE INFORMA QUE CARRO SOM IMPEDE QUE A POPULAÇÃO FAÇA SEU SERVIÇO NAS LOJAS DEVIDO MUITO BARULHO.', 1, 6, '', '', '', 'ANONIMO', '', ''),
(74, 131, 20, 1, 6, 29, 0, 'NOBRE MOVELARIA', 'DENUNCIANTE INFORMA QUE A MOVELARIA FAZ MUITO BARULHO E INFORMA TAMBÉM QUE A MADEIRA DESCARREGADA A NOITE PODE SER ILEGAL, QUE ELE E ALGUNS VIZINHOS RECLAMAM DA POEIRA QUE ADENTRA SUA RESIDENCIA.', 1, 25, '', '', '', 'ANONIMO', '', ''),
(75, 132, 20, 1, 6, 14, 0, 'JAIRO (CLUBE DE TIRO \\\"SÍTIO PARAISO\\\")', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO ESTÁ FUNCIONANDO UM CLUBE DE TIRO, DIARIAMENTE, O QUE VEM OCASIONANDO TRANSTORNOS AOS MORADORES DO ENTORNO DO LOCAL, DEVIDO O SOM ORIUNDO DOS DISPAROS DAS ARMAS DE FOGO.', 1, 1, '', '', '', 'ANONIMO', '', ''),
(76, 133, 20, 1, 6, 14, 0, 'RAMON (PROPRIETÁRIO DO GALPÃO DA 3 DE OUTUBRO)', 'DENUNCIA REFERENTE A POLUIÇÃO SONORA, PROVENIENTE DE FESTAS REALIZADAS PERIODICAMENTE NO \\\" GALPÃO DA 3 DE OUTUBRO\\\"', 1, 38, '', '', '', 'ANONIMO', '', ''),
(77, 134, 20, 1, 7, 21, 0, 'WELLINGTON GONÇALVES ( BRANQUINHO)', 'SEGUNDO DENUNCIANTE, O PROPRIETÁRIO DA MOVELARIA ATEIA FOGO DIARIAMENTE EM RESTOS DE MADEIRA', 1, 16, '', '', '', 'ANONIMO', '', ''),
(78, 135, 20, 1, 4, 12, 13, 'EMPREENDIMENTO HABITACIONAL', 'DENUNCIANTE INFORMA QUE EMPREENDIMENTO HABITACIONAL DIRECIONA TUBULAÇÃO ONDE CORRE LÍQUIDO POLUIDO PARA A PROPRIEDADE VIZINHA QUE POSSUI UMA NASCENTE AFLUENTE DO RIO APEÚ E QUE ESTÁ OCORRENDO SÉRIO RISCO DE DEGRADAÇÃO E EXTINÇÃO. ', 1, 1, '', '', '', 'AUGUSTO JUNIOR', '', ''),
(79, 136, 20, 1, 4, 12, 11, 'RESIDENCIAL MARAÚ', 'SEGUNDO A DENUNCIANTE, RESIDENCIAL MARAÚ ESTA FAZENDO DESPEJO DE RESÍDUOS DA FOSSA EM VIA PÚBLICA', 1, 17, '', '', '', 'ANONIMO', '', ''),
(80, 137, 20, 1, 5, 13, 16, 'EMPRESAS DE DESCARTES DE ENTULHOS', 'O DENUNCIANTE INFORMA QUE VARIAS EMPRESAS DE DESCARTE DE ENTULHOS DESPEJAM DE FORMA IRREGULAR LIXO NA ESTRADA BOA VISTA (RAMAL BAGICO)', 1, 24, '', '', '', 'ANONIMO', '', ''),
(81, 138, 20, 1, 5, 13, 17, 'FAZENDA DO CEARÁ', 'A DENUNCIA REFERENCIA O MAL CHEIRO RECORRENTE VINDO DA FAZENDA, NAS ULTIMAS SEMANAS, ONDE O DENUNCIANTE JÁ VIU VÁRIOS CAMINHÕES DE ENTULHO E DE FRUTARIA ENTRANDO NO LOCAL, COM RESTO DE COMIDA E LIXO, ALÉM DE CONSTRUÍREM UM CHIQUEIRO PRÓXIMO AO MURO QUE DÁ', 1, 33, '', '', '', 'BRUNA SOUSA', '', ''),
(82, 139, 20, 1, 5, 13, 17, 'TERRENO BALDIO', 'O DENUNCIANTE INFORMA QUE A RESIDENCIA DE FRENTE A SUA CASA ESTA ABANDONADA E A POPULAÇÃO ESTA JOGANDO MUITO LIXO', 1, 21, '', '', '', 'ANONIMO', '', ''),
(83, 140, 20, 1, 5, 13, 16, 'CINARA SIND. RECICLAVEIS', 'DESCARTE IRREGULAR DE RESÍDUOS CAUSANDO MAL CHEIRO', 1, 23, '', '', '', 'ANONIMO', '', ''),
(84, 141, 20, 1, 3, 10, 0, 'DONA VANJA', 'SEGUNDO O DENUNCIANTE A SENHORA CONHECIDA COMO VANJA BLOQUEOU O ACESSO AOS MORADORES AO IGARAPÉ DO PACUQUARA, POR MEIO DE UMA CONSTRUÇÃO IRREGULAR SOBRE O REFERIDO IGARAPE. ALÉM DE ESTAR DESPEJANDO ESGOTO NO MESMO IGARAPE ', 1, 38, '', '', '', 'ANONIMO', '', ''),
(85, 142, 20, 1, 7, 23, 0, 'AO LADO DO SÍTIO SANTA ROSA', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO, ESTÃO FAZENDO QUEIMADAS DIARIAMENTE OCASIONANDO TRANSTORNOS AOS MORADORES DO ENTORNO POR CONTA DA GERAÇÃO DA FUMAÇA', 1, 1, '', '', '', 'ANONIMO', '', ''),
(86, 143, 39, 1, 1, 1, 1, 'Anônima', 'Denunciante informa que a Sra Tania deixa o animal preso em uma corrente pequena, sem comida e água.', 1, 39, 'Rua I quadra 33 nº 903 ', '', '', 'Anônimo', '', ''),
(87, 144, 20, 1, 2, 9, 9, 'LAISON SANTOS', 'O DENUNCIANTE INFORMA QUE O SENHOR LAISON SANTOS JOGA VENENO (HERBICIDA ROUNDUP) NAS PLANTAS E GRAMAS DO CONDOMÍNIO NA ÁREA DE CIRCULAÇÃO DE PESSOAS E ANIMAIS DO CONDOMÍNIO, SEM AVISO PRÉVIO E SEM INFORMAÇÃO SE HÁ RESPONSÁVEL TECNICO.', 1, 21, '', '', '', 'TOBIAS SARAIVA CAVALCANTE JUNIOR', '', ''),
(88, 145, 20, 1, 7, 22, 0, 'JORGE', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO ESTÁ FUNCIONANDO UMA OFICINA DE PINTURA DE CAMINHÕES, ONDE O CHEIRO DA TINTA ESTÁ CAUSANDO INCÔMODO AOS MORADORES DO ENTORNO', 1, 34, '', '', '', 'ANONIMO', '', ''),
(89, 146, 20, 1, 7, 23, 0, 'CASA N°10', 'DENUNCIA REFERENTE A POLUIÇÃO ATMOSFÉRICA, A CASA DO LADO DIREITO DA IGREJA FAZ QUEIMADA CONSTANTEMENTE  (CASA N° 10)\r\n\r\nSOLICITANTE PEDE UMA AÇÃO DE EDUCAÇÃO AMBIENTAL NO LOCAL', 1, 42, '', '', '', 'ANONIMO', '', ''),
(90, 147, 20, 1, 7, 21, 0, 'FRANCISCO CHAVES DO NASCIMENTO (COMERCIO SÃO SEBASTIÃO)', 'DENUNCIANTE INFORMA QUE O SENHOR FAZ QUEIMADA DE PRODUTOS, PLÁSTICOS, PAPELÃO E FOLHAS ', 1, 34, '', '', '', 'ANONIMO', '', ''),
(91, 148, 20, 1, 7, 24, 0, 'JUNIOR (PROPRIETÁRIO: FABRICA DE PANELAS)', 'DENUNCIA REFERENTE A POLUIÇÃO SONORA (RUÍDOS) E ATMOSFÉRICA (EMISSÃO DE FUMAÇA), PROVOCADO POR UMA FABRICA DE PANELAS QUE ENCONTRA-SE NOS FUNDOS DA CASA INFORMADA NO ENDEREÇO ACIMA. ', 1, 21, '', '', '', 'ANONIMA', '', ''),
(92, 149, 39, 2, 1, 6, 3, 'Anonimo', 'CAPTURA DE UM PORCO ESPINHO QUE ESTA NA SUA RESIDENCIA ', 1, 1, 'Rua Adilson Rodrigues, n 11', '', '', 'Augusto Cesar Silva da Costa', '', ''),
(93, 150, 20, 1, 7, 20, 0, 'NÃO IDENTIFICADO', 'DENUNCIA REFERENTE A POLUIÇÃO ATMOSFÉRICA, PROVENIENTE DE QUEIMADA, POSSIVELMENTE DE FORNO.', 1, 34, '', '', '', 'ANONIMO', '', ''),
(94, 151, 20, 1, 7, 22, 0, 'NÃO IDENTIFICADO', 'DENUNCIA CONTRA SERRARIA E SERRALHERIA, SEM HORÁRIO DE FUNCIONAMENTO DEFINIDO', 1, 19, '', '', '', 'ANONIMA', '', ''),
(95, 152, 20, 1, 7, 22, 0, 'ROBSON (FÁBRICA DE PANELA DE ALUMÍNIO)', 'SR. ROBSON QUEIMA ALUMÍNIO DIARIAMENTE, CAUSANDO POLUIÇÃO E PREJUDICANDO A SAÚDE DOS MORADORES VIZINHOS', 1, 24, '', '', '', 'ANONIMO', '', ''),
(96, 153, 20, 1, 5, 13, 17, 'NÃO IDENTIFICADO', 'DENUNCIANTE PEDE VISTORIA EM TERRENO BALDIO QUE TEM PRESENÇA DE COBRAS, RATO, BARATAS  E OUTROS. ALÉM DISSO TEM SERVIDO PARA USUÁRIO DE DROGAS À NOITE, PREOCUPANDO OS COMERCIANTES E MORADORES DO LOCAL. A POPULAÇÃO TEM JOGADO LIXO DOMÉSTICO', 1, 6, '', '', '', 'MARCIO POTENCIA', '', ''),
(97, 154, 20, 1, 5, 13, 17, 'JORDANA (UMA DAS DONAS DO BETEL)', 'TERRENO ABANDONADO, SEM LIMPEZA, SERVINDO PARA DESCARTE DE RESÍDUOS, ALÉM DE SERVIR DE ESCONDERIJO PARA MELIANTES', 1, 21, '', '', '', 'ANONIMO', '', ''),
(98, 155, 20, 1, 2, 7, 6, 'CUPÚ, HERON, JANDIÁ, PIMENTA E IRACEMA', 'DESMATAMENTO EM PROPRIEDADE FEITA COM USO DE MOTOSERRA, RETIRADA DE MADEIRA PARA VENDA\r\n\r\nFOTOS E BOLETIM DE OCORRÊNCIA POLICIAL EM ANEXO', 1, 38, '', '', '', 'HIDEYURI YOSHINO', '', ''),
(99, 156, 20, 1, 2, 7, 5, 'FOLOZINHO', 'SEGUNDO O DENUNCIANTE, O ENDEREÇO INFORMADO NÃO POSSUI NUMERAÇÃO DA CASA, O MESMO INFORMOU QUE O REFERIDO LOCAL ENCONTRA-SE AO FINAL DO RAMAL DO CUPIÚBA, APÓS FAZENDA (SEM IDENTIFICAÇÃO DE NOME) E APÓS LINHÃO RECEM CONSTRUÍDO DA EQUATORIAL, AO LADO DIREIT', 1, 38, '', '', '', 'RAIMUNDO DE LIMA BAIA', '', ''),
(100, 157, 20, 1, 2, 9, 0, 'NÃO IDENTIFICADO', 'SUPRESSÃO DE 01 (UM) INDIVÍDUO ARBOREO (MANGUEIRA) SEM PRÉVIA AUTORIZAÇÃO DO ÓRGÃO COMPETENTE', 1, 23, '', '', '', 'ANONIMO', '', ''),
(101, 158, 20, 1, 2, 7, 6, 'NÃO IDENTIFICADO', 'INVASÃO EM PROPRIEDADE PRIVADA, DESMATAMENTO COM USO DE MOTOSSERRA, FABRICAÇÃO DE CARVÃO\r\n\r\nFOI REALIZADO OBOLETIM DE OCORRÊNCIA POLICIAL', 1, 38, '', '', '', 'ANONIMO', '', ''),
(102, 159, 20, 1, 2, 7, 6, 'MANOEL VALDIR (CONHECIDO COMO VALDO)', 'O DENUNCIANTE, PROPRIETÁRIO DO TERRENO INFORMADO, O SR CONHECIDO COMO VALDO, INVADIU A PROPRIEDADE, RETIROU AS ÁRVORES PRÓXIMAS AO CORPO HÍDRICO DO LOCAL, ALÉM DE PROVOCAR QUEIMADAS NO MESMO LOCAL.', 1, 38, '', '', '', 'MANOEL RONALDO GOMES RODRIGUES', '', ''),
(103, 160, 20, 1, 5, 13, 17, 'NÃO INFORMADO', 'DENUNCIA REFERENTE A UM TERRENO QUE OS MORADORES NÃO MANTÉM O MESMO NAS CONDIÇÕES MÍNIMAS DE LIMPEZA, GERANDO EM ÉPOCAS DE INVERNO FOCOS DE MOSQUITOS DA DENGUE E DEMAIS.', 1, 8, '', '', '', 'ANONIMO', '', ''),
(104, 162, 20, 1, 5, 13, 16, 'CÂMARA MUNICIPAL DE CASTANHAL', 'A CÂMARA MUNICIPAL DE CASTANHAL DESCARTA SEUS RESÍDUOS EM SACOS PLÁSTICOS PRETO NA SAÍDA DO ESTACIONAMENTO E NÃO POSSUEM LIXEIRA ADEQUADA PARA ADICIONAMENTO DOS SACOS ATÉ QUE SEJA EFETUADA A COLETA, OCASIONANDO COM QUE OUTROS REALIZEM O DESPEJO DE SEUS RE', 1, 21, '', '', '', 'CPRN/ED. AMBIENTAL SEMMA', '', ''),
(105, 163, 20, 1, 8, 27, 0, 'JOÃO', 'O DENUNCIANTE INFORMA QUE O DENUNCIADO SR. JOÃO ESTA FAZENDO O PREPARO DE CARNE NO QUINTAL PARA COMERCIALIZAR, ESTA PROVOCANDO FORTE ODOR.', 1, 23, '', '', '', 'ANONIMO', '', ''),
(106, 164, 20, 1, 5, 13, 17, 'NÃO IDENTIFICADO', 'O DENUNCIANTE SOLICITA AVERIGUAÇÃO, SE O DESCARTE IRREGULAR QUE ESTÁ OCORRENDO NO REFERIDO TERRENO MENCIONADO (PARTICULAR), ESTÁ OCORRENDO POR PARTE DA PREFEITURA DE CASTANHAL, OU AINDA, OUTRA EMPRESA, ONDE SE CONFIRMADO, SE AS MESMAS POSSUEM LICENÇA E/OU', 1, 17, '', '', '', 'ANONIMO', '', ''),
(107, 165, 20, 1, 5, 13, 0, 'NÃO IDENTIFICADO', 'SOLICITAR UMA VISTORIA NO LOCAL E INTEIRAR SOBRE O ACÚMULO DE LIXO DE DIVERSOS TIPOS NO CANAL QUE PASSA AOS FUNDOS DO CONDOMÍNIO, QUE RECEBE AS ÁGUAS PLUVIAIS DO BAIRRO NOVO ESTRELA E DA RUA 1º DE MAIO.', 1, 12, '', '', '', 'CONDOMÍNIO QUINTA DO LAGO ', '', ''),
(108, 166, 20, 1, 3, 11, 0, 'AREAL DO SHIGUEO', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO ACIMA, O DENUNCIANTE ESTÁ RETIRANDO AREIA DO LOCAL, PROVOCANDO EROSÃO PARA O INTERIOR DO TERRENO DO MESMO.', 1, 38, '', '', '', 'BENEDITO RUY ASSUNÇÃO DA COSTA', '', ''),
(109, 167, 20, 1, 3, 11, 0, 'DONA FÁTIMA E CARLOS CANCELA', 'O DENUNCIANTE INFORMA QUE AS PESSOAS (DONA FÁTIMA E CARLOS CANCELA) ESTÃO TIRANDO DE FORMA IRREGULAR ARENOSO. ARGILA E PEDRAS DO RAMAL DO CIPÓ.', 1, 38, '', '', '', 'ANONIMO', '', ''),
(110, 168, 20, 1, 8, 27, 0, 'FRANCISCO DO BOM REMÉDIO', 'SEGUNDO O DENUNCIANTE, DENUNCIADO CONSTRUIU FORNO PARA FABRICAÇÃO DE CARVÃO SEM A LICENÇA;', 1, 38, '', '', '', 'OLINDINA DA SILVA E SILVA', '', ''),
(111, 169, 20, 1, 3, 11, 0, 'WILLIAN (DONO DO MAQUINÁRIO)', 'SEGUNDO O DENUNCIANTE, O SR CONHECIDO COMO WILLIAN (DONO DO MAQUINÁRIO) ESTÁ REALIZANDO A RETIRADA DE MATERIAL ARENOSO NO TERRENO DO INCRA.', 1, 38, '', '', '', 'ANONIMO', '', ''),
(112, 170, 20, 1, 8, 27, 0, 'PROPRIETÁRIOS IAGO E IURE, DONK DECK PUB', 'FALTA DE DOCUMENTAÇÃO E INSTALAÇÕES INADEQUADAS DO EMPREENDIMENTO', 1, 12, '', '', '', 'ANONIMO', '', ''),
(113, 171, 20, 1, 8, 27, 0, 'RESTAURANTE SABOR PROSA', 'AUSÊNCIA DE LICENÇA AMBIENTAL', 1, 1, '', '', '', 'ANONIMO', '', ''),
(114, 172, 20, 1, 8, 27, 0, 'CASA DO CONSTRUTOR', 'A DENUNCIANTE ESTA SOLICITANDO A AVERIGUAÇÃO DE LICENÇA AMBIENTAL DO ESTABELECIMENTO CASA DO CONSTRUTOR, POIS A AREIA QUE FICA EXPOSTA DE FORMA INCORRETA ESTA ADENTRANDO SUA RESIDENCIA QUE FICA AO LADO ', 1, 36, '', '', '', 'SORAYA PORTO', '', ''),
(115, 173, 20, 1, 6, 29, 0, 'GM METALURGICA', 'O DENUNCIANTE INFORMA QUE A METALURGIA ESTA FAZENDO MUITO BARULHO FORA DE HORÁRIO, O CHEIRO DE TINTA ESTA, MUITO FORTE , PREJUDICANDO OS VIZINHOS', 1, 5, '', '', '', 'ANONIMO', '', ''),
(116, 174, 20, 1, 6, 18, 0, 'COLÉGIO LEITE VESTIBULARES', 'VENHO APRESENTAR DENÚNCIA DE POLUIÇÃO SONORA QUE OCORRE NESTE MOMENTO EM FRENTE AO COLÉGIO LEITE VESTIBULARES.', 1, 8, '', '', '', 'PEDRO MONTEIRO', '', ''),
(117, 175, 20, 1, 5, 13, 16, 'FABRICA DE RAÇÃO SERIP', 'DENUNCIANTE INFORMA QUE A FABRICA DE RAÇÃO ESTA PROVOCANDO FORTE ODOR E O FUNCIONAMENTO DA FABRICA VAI ATÉ HORÁRIOS INAPROPRIADOS E A FABRICA ESTAVA FAZENDO DESPEJO DOS RESÍDUOS NA RUA', 1, 36, '', '', '', 'ANONIMO', '', ''),
(118, 176, 20, 1, 5, 13, 17, 'MILTON', 'O DENUNCIANTE SR ALEXANDRE INFORMA QUE O DENUNCIADO (MILTON) ESTA JOGANDO RESÍDUOS NO TERRENO AO LADO DA SUA RESIDENCIA, SENDO QUE O ACUSADO JÁ HAVIA FEITO UM ACORDO COM O DENUNCIANTE NO MINISTÉRIO PÚBLICO DE NÃO DESCARTAR MAS RESÍDUOS NO LOCAL', 1, 6, '', '', '', 'ALEXANDRO XAVIER NUNES', '', ''),
(119, 177, 20, 1, 4, 12, 12, 'FABRICA DE AÇAÍ VITÓRIA', 'DESPEJO DE EFLUENTES NO RIO APEÚ', 1, 1, '', '', '', 'ANONIMA', '', ''),
(120, 178, 20, 1, 3, 11, 0, 'JORGE LUIZ', 'EXTRAÇÃO DE MATERIAL (BARRO). PROX. AO IGARAPÉ', 1, 38, '', '', '', 'ANONIMO', '', ''),
(121, 179, 20, 1, 4, 12, 12, 'EMPREENDIMENTO HABITACIONAL', 'DENUNCIANTE INFORMA QUE EMPREENDIMENTO HABITACIONAL DIRECIONA TUBULAÇÃO ONDE CORRE LÍQUIDO POLUIDO PARA A PROPRIEDADE VIZINHA QUE POSSUI UMA NASCENTE AFLUENTE DO RIO APEÚ E QUE ESTÁ OCORRENDO SÉRIO RISCO DE DEGRADAÇÃO E EXTINÇÃO.', 1, 8, '', '', '', 'AUGUSTO JUNIOR', '', ''),
(122, 180, 20, 1, 7, 23, 0, 'ARATAIA', 'O DENUNCIANTE INFORMA QUE O SR ARATAIA, FAZ QUEIMADA DE LIXO E PNEUS EM UM TERRENO AO LADO DA CAS DELE', 1, 8, '', '', '', 'ANONIMA', '', ''),
(123, 181, 20, 1, 2, 7, 0, 'NÃO INFORMADO', 'SEGUNDO O DENUNCIANTE INFORMA QUE UM GRUPO DE PESSOAS ESTÃO DESMATANDO E FAZENDO QUEIMADA', 1, 38, '', '', '', 'ANONIMO', '', ''),
(124, 182, 20, 1, 2, 7, 4, 'DONO DA FAZENDA', 'O DENUNCIANTE INFORMA QUE O DONO DA FAZENDA ESTA DESMATANDO ', 1, 38, '', '', '', 'ANONIMO', '', ''),
(125, 183, 20, 1, 2, 8, 0, 'MARIA', 'O DENUNCIANTE INFORMA QUE A VIZINHA DELA FAZ QUEIMADA DE FOLHAS NO TERRENO DELA, PREJUDICANDO A DENUNCIANTE POIS A FUMAÇA  ENTRA NA SUA RESIDÊNCIA', 1, 12, '', '', '', 'ANONIMO', '', ''),
(126, 184, 20, 1, 7, 23, 0, 'AO LADO DO SÍTIO SANTA ROSA', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO, ESTÃO FAZENDO QUEIMADAS DIARIAMENTE OCASIONANDO TRANSTORNOS AOS MORADORES DO ENTORNO POR CONTA DA GERAÇÃO DE FUMAÇA', 1, 1, '', '', '', 'ANONIMO', '', ''),
(127, 185, 39, 1, 1, 1, 1, 'SEM NOME', 'ANIMAL PRESO NO QUINTAL O DIA TODO PEGANDO CHUVA E COM FOME, CADELA PASSA DIA E NOITE CHORANDO.', 1, 2, 'TV.2 DE NOVEMBRO, CASA 06- AO LADO DE UM BAR CHAMADO : ESTOU NO TRABALHO', '', '', 'POLYANA', '', ''),
(128, 186, 20, 1, 6, 14, 0, 'ACADEMIA GARDNA FEMININA', 'DENUNCIANTE INFORMA QUE O BARULHO CAUSADO PELA ACADEMIA, DE 06 HORAS DA MANHÃ ÀS 21 HORAS DA NOITE, CAUSA MUITOS TRANSTORNOS, PREJUDICANDO A VIZINHANÇA INTEIRA. SEM LICENÇA DE OPERAÇÃO.', 1, 33, 'RUA HONÓRIO BANDEIRA Nº 301', '', '', 'ANONIMA', '', ''),
(129, 187, 20, 1, 7, 20, 0, 'WELITON OU KINHA', 'O SENHOR LUCAS INFORMA QUE O DENUNCIADO (WELITON) FAZ ARMAZENAMENTO DE ADUBO (SANGUE DE BOI) NA SUA LOCALIDADE, ONDE VEM PREJUDICANDO A POPULAÇÃO COM O FORTE ODOR', 1, 38, '', '', '', 'LUCAS NASCIMENTO SILVA', '', ''),
(130, 188, 20, 1, 2, 9, 8, 'MORADORES DO LOTE 23, QUADRA 32', 'A DENUNCIANTE INFORMA QUE OS MORADORES DO LOTE 23 QUADRA 32 DO LOTEAMENTO SALES JARDINS DERRUBARAM DUAS ÁRVORES E ESTÃO DESCOBRINDO TODO PISO DO TERRENO DA ÁREA DE PRESERVAÇÃO AMBIENTAL QUE FICA A MARGEM DO IGARAPÉ E QUE CAUSARÁ ASSOREAMENTO DO MESMO.', 1, 36, '', '', '', 'MARIA DE LOURDES', '', ''),
(131, 189, 20, 1, 2, 9, 9, 'MARIA DARLENE E RAIMUNDO NONATO', 'O DENUNCIANTE INFORMA QUE OS DONOS DO SÍTIO, ESTÃO FAZENDO DERRUBADA E QUEIMADA IRREGULAR DA MATA VIRGEM DO LOCAL', 1, 38, '', '', '', 'ANONIMA', '', ''),
(132, 190, 20, 1, 3, 11, 0, 'WILLIAN (DONO DO MAQUINÁRIO)', 'SEGUNDO O DENUNCIANTE, O SR CONHECIDO COMO WILLIAN (DONO DO MAQUINÁRIO) ESTÁ REALIZANDO A RETIRADA DE MATERIAL ARENOSO NO TERRENO DO INCRA.', 1, 38, '', '', '', 'ANONIMO', '', ''),
(133, 191, 20, 1, 3, 10, 0, 'NÃO INFORMADO', 'MORADOR CONSTRUINDO CERCA, INVADINDO ÁREA DE PRESERVAÇÃO DO RIO APEÚ, SUPRIMINDO INDIVÍDUOS ARBÓREOS DA ÁREA EM QUESTÃO', 1, 1, '', '', '', 'ANONIMO', '', ''),
(134, 192, 20, 1, 5, 13, 17, 'NÃO INFORMADO', 'TERRENO ABANDONADO SERVINDO PARA DESCARTE IRREGULAR DE RESÍDUOS E DE ESCONDERIJO PARA MELIANTE.', 1, 21, '', '', '', 'ANONIMO', '', ''),
(135, 193, 20, 1, 6, 14, 0, 'DROGARIA MAXI POPULAR', 'DENUNCIANTE INFORMA QUE A DROGARIA PÕE CAIXAS DE SOM NA CALÇADA, E TOCA SOM ALTO O DIA INTEIRO SEM INTERRUPÇÃO, NO HORÁRIO DE 08H DA MANHÃ ATÉ AS 22H. A DENUNCIANTE  AINDA EXPÕE QUE A DROGARIA NÃO SE PREOCUPA COM OS MORADORES DO PRÉDIO AO LADO, QUE COM A ', 1, 8, '', '', '', 'ANONIMO', '', ''),
(136, 194, 20, 1, 2, 7, 4, 'OZIO OU JUNIOR', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO, O SR. CONHECIDO COMO \\\"OZIO\\\", ESTÁ DESMATANDO E DEGRADANDO A NASCENTE DO IGARAPÉ (ÁGUA BOA).', 1, 38, '', '', '', 'RAIMUNDO PEREIRA CARDOSO', '', ''),
(137, 195, 20, 1, 7, 22, 0, 'ANONIMO', 'SEGUNDO DENUNCIANTE, O PROPRIETÁRIO TRABALHA COM REPARAÇÃO DE CARROCERIA DE CAMINHÃO E SOLDA. USO DE MADEIRA PREJUDICANDO A SAÚDE AOS MORADORES VIZINHOS.', 1, 38, '', '', '', 'ANONIMO', '', ''),
(138, 196, 20, 1, 7, 21, 0, 'ANONIMO', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO, ESTÁ FUNCIONANDO UM BAR E COMÉRCIO DE PEIXE. ONDE ESTE ULTIMO É TRATADO NO LOCAL E DESPEJADO EM VIA PÚBLICA, OCASIONADO MAU CHEIRO.', 1, 37, '', '', '', 'ANONIMO', '', ''),
(139, 197, 34, 1, 3, 10, 0, 'EQUATORIAL', 'PEDIDO DE VISTORIA NAS OBRAS DA EQUARIAL  NA LINHA DE TRANSMISSÃO 138 KM MODELO - TERRA ALTA SE ESTÁ PASSANDO PASSANDO EM ÁREA DE APP.', 1, 12, 'ESTRADA CASTANHAL- TERRA ALTA', '', '', 'POLO DE PROTEÇÃO DA BIODIVERSIDADE E USO SUSTENTÁVEIS DOS RECURSOS NATURAIS(POLOPROBIO)', '(91)988082760', 'poloprobio@yahoo.com.br'),
(140, 198, 39, 1, 1, 4, 0, 'FAZENDA DO CEARÁ', 'DENUNCIA A CERCA DE MAL CHEIRO, ENTULHOS, LIXO E UM CHIQUEIRO E ANIMAIS SOLTOS DA FAZENDA DO CEARÁ.', 1, 38, 'FAZENDA CEARA PROXIMO AO CONJUNTO VIVERDE', '', '', 'BRUNA', '', 'bruna.s_sousa@hotmail.com'),
(141, 199, 20, 1, 2, 7, 5, 'RITA ELIZETE CARDOSO', 'SEGUNDO O DENUNCIANTE, O SENHOR CONHECIDO COMO \\\"PEDRO\\\"ESTÁ REALIZANDO CORTE DE ÁRVORES (DESMATAMENTO) NA PROPRIEDADE DA MESMA, SEM AUTORIZAÇÃO', 1, 38, '', '', '', 'RITA ELIZETE CARDOSO', '', ''),
(142, 200, 20, 1, 7, 21, 0, 'NÃO INFORMADO', 'SEU RINALDO INFORMA QUE O DENUNCIADO FAZ QUEIMADA DE ALUMÍNIO FORA DE HORÁRIO', 1, 21, '', '', '', 'RINALDO SANTOS GUERREIRO', '', ''),
(143, 201, 20, 1, 2, 9, 9, 'DAVID ALVES MARQUES', 'RETIRADA IRREGULAR DE QUATRO (04) ÁRVORES DA ESPÉCIE HEVEA BRASILIENSIS', 1, 42, '', '', '', 'ANONIMO', '', ''),
(144, 209, 20, 1, 6, 31, 0, 'IGREJA ASSEMBLÉIA DE DEUS (SR VICTOR)', 'POLUIÇÃO SONORA EM IGREJA, SOM MUITO ALTO, CAUSANDO TRANSTORNOS A VIZINHANÇA', 1, 41, '', '', '', 'JESSICA DE ARAÚJO GADELHA', '', ''),
(145, 210, 20, 1, 5, 13, 17, 'NÃO INFORMADO (TERRENO BALDIO)', 'O TERRENO FOI ABANDONADO  PELO (A) PROPRIETÁRIO (A), O QUE ESTÁ OCASIONANDO DIVERSOS PREJUÍZOS AO MEIO AMBIENTE LOCAL, TENDO EM VISTA QUE A FALTA DE LIMPEZA NO TERRENO FACILITA PROLIFERAÇÃO DE COBRAS, SAPOS E AFINS, DEIXANDO A COMUNIDADE LOCAL A MERCÊ DE ', 1, 6, '', '', '', 'PODER LEGISLATIVO (REGINALDO MOTA DE SOUZA) ', '', ''),
(146, 211, 20, 1, 8, 25, 0, 'AUTOCENTER NETTO MENDES LTDA-ME', 'VERIFICAR SE O EMPREENDIMENTO AUTOCENTER NETTO MENDES LTDA-ME PROVIDENCIOU O ATENDIMENTO A LISTA DE PENDÊNCIAS ELABORADAS POR ESSA SECRETARIA.', 1, 34, '', '', '', 'MPPA', '', ''),
(147, 212, 34, 1, 3, 10, 0, 'CELPA EQUATORIAL ENERGIA', '', 1, 38, 'ESTRA CASTANHAL/TERRA ALTA', '', '', 'POLOPROBIO', '', ''),
(148, 213, 20, 1, 6, 29, 0, 'FÁBRICA NO IMPERADOR', 'INFORMAR AS PROVIDÊNCIA ADOTADAS PARA FÁBRICA LOCALIZADA NA TRAVESSA ACRE, BAIRRO IMPERADOR, QUE ESTARIA CAUSANDO POLUIÇÃO AMBIENTAL', 1, 17, '', '', '', 'MPPA', '', ''),
(149, 214, 20, 1, 6, 29, 0, 'FABRICA NO IMPERADOR', 'INFORMAR AS PROVIDÊNCIA ADOTADAS PARA FÁBRICA LOCALIZADA NA TRAVESSA ACRE, BAIRRO IMPERADOR, QUE ESTARIA CAUSANDO POLUIÇÃO AMBIENTAL', 1, 17, '', '', '', 'MPPA', '', ''),
(150, 215, 20, 1, 8, 27, 0, 'V.B. EVANGELISTA NETO-,ME', 'VERIFICAR SE O EMPREENDIMENTO V.B. EVANGELISTA NETO-ME PROVIDENCIOU O ATENDIMENTO À LISTA DE PENDÊNCIAS ELABORADAS POR ESSA SECRETARIA E QUAIS MEDIDAS FORAM ADOTADAS PELA COORDENADORIA DE FISCALIZAÇÃO. ', 1, 34, '', '', '', 'MPPA', '', ''),
(151, 216, 20, 1, 8, 27, 0, 'V.B. EVANGELISTA NETO-ME', 'VERIFICAR SE O EMPREENDIMENTO V.B. EVANGELISTA NETO-ME PROVIDENCIOU O ATENDIMENTO À LISTA DE PENDÊNCIAS ELABORADAS POR ESSA SECRETARIA E QUAIS MEDIDAS FORAM ADOTADAS PELA COORDENADORIA DE FISCALIZAÇÃO. ', 1, 34, '', '', '', 'MPPA', '', ''),
(152, 217, 20, 1, 8, 27, 0, '3 JOTAS AGRO COMÉRCIO LTDA-ME', 'ENCAMINHAR RELATÓRIO PERTINENTE À FISCALIZAÇÃO REALIZADA NO EMPREENDIMENTO 3 JOTA AGRO COMÉRCIO LTDA-ME', 1, 19, '', '', '', 'MPPA', '', ''),
(153, 218, 20, 1, 8, 27, 0, '3 JOTAS AGRO COMÉRCIO LTDA-ME', 'ENCAMINHAR RELATÓRIO PERTINENTE À FISCALIZAÇÃO REALIZADA NO EMPREENDIMENTO 3 JOTA AGRO COMÉRCIO LTDA-ME', 1, 19, '', '', '', 'MPPA', '', ''),
(154, 219, 34, 1, 5, 13, 17, 'CUPUÍ', 'Apurar e colher elementos que identifiquem os envolvidos e os danos de suposta infração ambiental decorrente de resíduos de mandioca provenientes da produção de farinha, de responsabilidade do Sr. EDINALDO NUNES, conhecido como CUPUÍ', 1, 38, '', '', '', 'MPPA', '', ''),
(155, 220, 34, 1, 5, 13, 17, 'CUPIÚ', 'Apurar e colher elementos que identifiquem os envolvidos e os danos de suposta infração ambiental decorrente de resíduos de mandioca provenientes da produção de farinha, de responsabilidade do Sr. EDINALDO NUNES, conhecido como CUPUÍ', 1, 38, '', '', '', 'MPPA', '', ''),
(156, 221, 34, 1, 5, 13, 17, 'MILTON', 'Apurar a notícia de armazenamento irregular de resíduos sólidos recicláveis', 1, 6, '', '', '', 'MPPA', '', ''),
(157, 222, 20, 1, 6, 29, 0, 'FÁBRICA DO IMPERADOR', 'Notícia de Fato n° 000530-040/2021 - Apurar notícia de possível poluição ambiental ocasionada por uma Fábrica localizada na Travessa Acre, Imperador.', 1, 17, '', '', '', 'MPPA', '', ''),
(158, 223, 34, 1, 3, 10, 0, 'NÃO INFORMADO', 'Inquérito Civil n° 002944-040/2016 - Apurar a notícia de eventual dano ambiental ocorrido na fonte hídrica denominada Igarapé Vermelho, localizada na Comunidade Santa Luzia, Km06 da Rodovia Castanhal - São Francisco do Pará', 1, 38, '', '', '', 'MPPA', '', ''),
(159, 224, 33, 1, 8, 27, 0, 'CONSTRUNORTE', 'Procedimento Administrativo n° 001922-040/2017 - Acompanhar e fiscalizar a atuação dos órgãos municipais para compelir a empresa CONSTRUNORTE, localizada na Trav. Floriano Peixoto nº120, Bairro Pirapora, município de Castanhal, a se adequar às normas ambi', 1, 25, '', '', '', 'MPPA', '', ''),
(160, 225, 33, 1, 6, 14, 0, 'Oficina de manutenção e reparação de máquinas', 'Procedimento Administrativo n° 002519-040/2016 - Acompanhar e fiscalizar a atuação dos órgãos municipais a fim de compelir o estabelecimento de oficina de manutenção e reparação de máquinas, localizada no Conjunto Tangarás, quadra 04, casa 24, Bairro Font', 1, 14, '', '', '', 'MPPA', '', ''),
(161, 226, 33, 1, 8, 27, 0, 'BEER HOUSE-24', 'Procedimento Administrativo n°001345-040/2018 - Acompanhar e fiscalizar as medidas que serão adotadas pelo Município de Castanhal e outros órgãos público, a fim de compelir o estabelecimento comercial denominado BEER HOUSE-24, localizada na Rua Kennedy, e', 1, 12, '', '', '', 'MPPA', '', ''),
(162, 227, 33, 1, 8, 27, 0, 'ISOESTE', 'Inquérito Civil nº 003598-040/2018 - Apurar a responsabilidade e extensão dos supostos danos ambientais ocasionados pelas atividades desenvolvidas pela empresa ISOESTE, localizada na Av. Presidente Vargas, Bairro Jardelândia, município de Castanhal', 1, 19, '', '', '', 'MPPA', '', ''),
(163, 228, 33, 1, 8, 27, 0, 'ISOESTE', 'Inquérito Civil nº 003598-040/2018 - Apurar a responsabilidade e extensão dos supostos danos ambientais ocasionados pelas atividades desenvolvidas pela empresa ISOESTE, localizada na Av. Presidente Vargas, Bairro Jaderlândia, município de Castanhal', 1, 19, '', '', '', 'MPPA', '', ''),
(164, 229, 20, 1, 6, 14, 0, 'DEPOSITO DE BEBIDAS 24 HORAS', 'Notícia de Fato n° 001691-040/2021 - Apurar notícia de poluição sonora/pertubação do sossego alheio/crime ambiental oriunda do funcionamento do estabelecimento denominado \\\\\\\"DEPOSITO DE BEBIDAS 24 HORAS\\\\\\\"', 1, 34, '', '', '', 'MPPA', '', ''),
(165, 230, 20, 1, 6, 14, 0, 'DEPOSITO DE BEBIDAS 24 HORAS', 'Notícia de Fato n° 001691-040/2021 - Apurar notícia de poluição sonora/pertubação do sossego alheio/crime ambiental oriunda do funcionamento do estabelecimento denominado \\\\\\\"DEPOSITO DE BEBIDAS 24 HORAS\\\\\\\"', 1, 34, '', '', '', 'MPPA', '', ''),
(166, 231, 33, 1, 8, 27, 0, 'BAR DO LITRÃO', 'Procedimento Administrativo n° 001968-040/2018 - Acompanhar e fiscalizar as medidas que serão adotadas pelo Município de Castanhal e outros órgãos públicos, a fim de compelir o estabelecimento comercial denominado BAR DO LITRÃO, localizado na Av. Barão do', 1, 21, '', '', '', 'MPPA', '', ''),
(167, 232, 20, 1, 6, 31, 0, 'IGREJA ASSEMBLÉIA DE DEUS', 'Notícia de Fato n° 001337-040/2021 - Apurar a notícia de poluição sonora/pertubação do sossego alheio decorrente da realização de cultos e eventos na Igreja Assembléia de Deus localizada na Alameda das Orquídeas', 1, 21, '', '', '', 'MPPA', '', ''),
(168, 233, 20, 1, 6, 14, 0, 'LAVA JATO DOS CARLINHOS', 'Procedimento Preparatório n° 000478-040/2020 - Apurar suposta infração ambiental consistente na prática de poluição sonora, ocasionada pelo exercício das atividades exercidas pelo LAVA JATO DO SEU CARLINH', 1, 21, '', '', '', 'MPPA', '', ''),
(169, 234, 20, 1, 7, 21, 0, 'BAR DO PIPA', 'Notícia de Fato n° 002524-040/2021 - Apurar possível infração ambiental consistente na prática de poluição sonora/pertubação do sossego alheio oriundos do funcionamento do estabelecimento denominado BAR DO PIPA.', 1, 38, '', '', '', 'MPPA', '', ''),
(170, 235, 20, 1, 8, 27, 0, 'LANCHONETE DO EINSTEN', 'Inquérito Civil n° 003855-040/2019 - Apurar possível infração ambiental consistente na prática de poluição sonora, ocasionada pelas atividades do estabelecimento denominado \\\\\\\"Lanchonete do Einstein\\\\\\\"', 1, 16, '', '', '', 'MPPA', '', ''),
(171, 236, 20, 1, 6, 31, 0, 'IGREJA BATISTA VITÓRIA EM CRISTO', 'Inquérito Civil nº 006066-040/2019 - Apurar suposta infração ambiental ocasionada pela Igreja Batista Vitória em Cristo', 1, 14, '', '', '', 'MPPA', '', ''),
(172, 237, 34, 1, 8, 27, 0, 'OFICINA BOA ESPERANÇA', 'Procedimento Administrativo n° 007311-040/2017 - Acompanhar as medidas que serão adotadas pelo Município de Castanhal para compelir o estabelecimento denominado OFICINA BOA ESPERANÇA a adequar-se às normas ambientais.', 1, 19, '', '', '', 'MPPA', '', ''),
(173, 238, 34, 1, 2, 8, 1, 'NÃO INFORMADO', 'Notícia de Fato n° 004711-040/2021 -DESMATAMENTO - SUPRESSÃO DE ÁRVORE DO SÍTIO SÃO FRANCISCO SEM AUTORIZAÇÃO DOS PROPRIETÁRIOS', 1, 1, '', '', '', 'MPPA', '', ''),
(174, 239, 20, 1, 7, 21, 0, 'LAVA JATO', 'LAVA JATO FAZ LAVAGEM NA RUA E OS PRODUTOS USADOS ESTÃO AFETANDO  OS VIZINHIS COM CHEIRO FORTE E BARULHO', 1, 31, 'RUA BENEVIDES ESQUINA COM TV. MOEMA PROX A ESCOLA JOSE SALLES', '', '', 'ANONIMO', '', ''),
(175, 240, 20, 1, 2, 9, 11, 'PRAÇA JOSÉ JOÃO', 'Notícia de Fato n° 044917-003/2021- Dano ambiental a flora - Corte irregular de árvores na Praça José João', 1, 34, '', '', '', 'MPPA', '', ''),
(176, 241, 20, 1, 4, 12, 14, 'AMAZON POLPAS', 'NOTÍCIA DE FATO N° 004650-040/2021 - DANO AMBIENTAL AO CURSO D\\\\\\\'ÁGUA E AO SOLO DECORRENTE DO DESPEJO DOS RESÍDUOS DAS ATIVIDADES DESENVOLVIDAS NA EMPRESA AMAZON POLPAS', 1, 38, '', '', '', 'MPPA', '', ''),
(177, 242, 20, 1, 2, 9, 0, 'NÃO INFORMADO', 'NOTÍCIA DE FATO N° 004184-040/2021 - ARQUIVAMENTO DO PEDIDO DE REMOÇÃO DE UMA CASTANHEIRA', 1, 7, '', '', '', 'MPPA', '', ''),
(178, 243, 34, 1, 3, 10, 0, 'NÃO INFORMADO', 'Procedimento Preparatório nº003550-040/2020 - Apurar danos de suposta infração ambiental', 1, 38, '', '', '', 'MPPA', '', ''),
(179, 244, 33, 1, 3, 28, 0, 'VALLE EMPREENDIMENTO', 'Solicita vistoria técnica na Valle Empreendimentos  por possível dano ambiental.', 1, 1, '', '', '', 'MPPA', '', ''),
(180, 245, 20, 1, 5, 13, 16, 'FEIRA DA CEASA', 'Solicita vistoria técnica na Feira da Ceasa, a fim de verificar a situação de descarte de resíduos provenientes das atividades desenvolvidas em referida feira.', 1, 8, '', '', '', 'MPPA', '', ''),
(181, 246, 33, 1, 6, 15, 0, 'MARIA DO ESPIRITO SANTO', 'NOTÍCIA SOBRE A EMISSÃO DE RUÍDOS PROVENIENTES DA UTILIZAÇÃO DE INSTRUMENTOS SONOROS NA RESIDÊNCIA DA SRA. MARIA DO ESPIRITO SANTO,', 1, 14, '', '', '', 'MPPA', '', ''),
(182, 247, 20, 1, 8, 27, 0, 'OBRA DA COMPANHIA DE SANEAMENTO DO PARÁ  NA UNIDADE DA COHAB', 'DOCUMENTAÇÃO SOBRE OBRA DA UNIDADE DO SETOR COHAB DA COMPANHIA DE SANEAMENTO DO PARÁ DESCRITAS NO ITEM 4.2 NO REQUERIDO OFÍCIO.', 1, 34, '', '', '', 'MPPA', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_historico_denuncia`
--

CREATE TABLE `fisc_historico_denuncia` (
  `id` int(10) UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `denuncia_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_historico_denuncia`
--

INSERT INTO `fisc_historico_denuncia` (`id`, `data`, `descricao`, `usuario_id`, `denuncia_id`) VALUES
(27, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 18),
(28, '2021-10-11', 'Alteração realizada com sucesso!', 21, 18),
(30, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 20),
(31, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 21),
(32, '2021-10-11', 'Alteração realizada com sucesso!', 21, 20),
(33, '2021-10-11', 'Alteração realizada com sucesso!', 21, 21),
(34, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 22),
(35, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 23),
(36, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 24),
(37, '2021-10-11', 'Alteração realizada com sucesso!', 21, 24),
(38, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 25),
(39, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 26),
(40, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 27),
(41, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 28),
(42, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 29),
(43, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 30),
(44, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 31),
(45, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 32),
(46, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 33),
(47, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 34),
(48, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 35),
(49, '2021-10-11', 'Foi realizado o cadastro da denúncia no banco de dados', 21, 36),
(50, '2021-10-13', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 37),
(51, '2021-10-13', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 38),
(52, '2021-10-13', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 39),
(53, '2021-10-13', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 40),
(54, '2021-10-13', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 41),
(55, '2021-10-13', 'dasdsad sdsa dsad sad sadsa dsa dsa ', 1, 41),
(56, '2021-10-13', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 42),
(57, '2021-10-13', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 43),
(58, '2021-10-13', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 44),
(59, '2021-10-15', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 45),
(60, '2021-10-15', 'DENÚNCIA FOI REPASSADA À VETERINÁRIA LOUYSSE PARA AVERIGUAÇÃO', 23, 45),
(61, '2021-10-19', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 46),
(62, '2021-10-19', 'Resposta ao Auto de Infração nº36/2021', 23, 46),
(63, '2021-10-19', 'Foi repassado nesta data ao Técnico à Apreciação e devidas providências', 23, 46),
(64, '2021-10-19', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 47),
(65, '2021-10-19', 'REPOSTA AO AUTO DE INFRAÇAO 35/2021', 23, 47),
(66, '2021-10-19', 'REPASSADO NESTA DATA AO TECNICO ALVINO PARA AS DEVIDAS PROVIDÊNCIAS.', 23, 47),
(67, '2021-10-19', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 48),
(68, '2021-10-19', 'RESPOSTA AO AUTO DE INFRAÇÃO 34/2021', 23, 48),
(69, '2021-10-19', 'FOI ENTREGUE NESTA DATA AO TECNICO ALVINO À APRECIAÇÃO E RESPOSTA.', 23, 48),
(70, '2021-10-19', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 49),
(71, '2021-10-19', 'AUTO DE INFRAÇÃO 33/2021', 23, 49),
(72, '2021-10-19', 'ENCAMINHADO NESTA DATA AO TECNICO ALVINO PARA APRECIAÇAO E ESPOSTA', 23, 49),
(73, '2021-10-19', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 50),
(74, '2021-10-19', 'AUTO DE INFRAÇÃO Nº32/2021', 23, 50),
(75, '2021-10-19', 'REPASSADO NESTA DATA PARA TECNICO ALVINO PARA APRECIAÇÃO E RESPOSTA.', 23, 50),
(76, '2021-10-19', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 51),
(77, '2021-10-19', 'AUTO DE INFRAÇÃO 31/2021', 23, 51),
(78, '2021-10-19', 'ENCAMINHADO NESTA DATA PARA O TECNICO ALVINO PARA APRECIAÇÃO E RESPOSTA', 23, 51),
(79, '2021-10-19', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 52),
(80, '2021-10-19', 'AUTO DE INFRAÇÃO Nº30/2021', 23, 52),
(81, '2021-10-19', 'FOI REAPASSADO NESTA DATA RESPOSTA DO AUTO DE INFRAÇÃO Nº30/2021 PARA O TECNICO ALVINO PARA APRECIAÇÃO E RESPOSTA', 23, 52),
(86, '2021-10-22', 'Alteração realizada com sucesso!', 22, 18),
(87, '2021-10-22', 'Alteração realizada com sucesso!', 22, 35),
(88, '2021-10-22', 'Alteração realizada com sucesso!', 22, 36),
(89, '2021-10-22', 'Alteração realizada com sucesso!', 22, 34),
(90, '2021-10-22', 'Alteração realizada com sucesso!', 22, 33),
(91, '2021-10-22', 'Alteração realizada com sucesso!', 22, 32),
(92, '2021-10-22', 'Alteração realizada com sucesso!', 22, 31),
(93, '2021-10-22', 'Alteração realizada com sucesso!', 22, 30),
(94, '2021-10-22', 'Alteração realizada com sucesso!', 22, 29),
(95, '2021-10-22', 'Alteração realizada com sucesso!', 22, 42),
(96, '2021-10-22', 'Alteração realizada com sucesso!', 22, 28),
(97, '2021-10-22', 'Alteração realizada com sucesso!', 22, 26),
(98, '2021-10-22', 'Alteração realizada com sucesso!', 22, 23),
(99, '2021-10-22', 'Alteração realizada com sucesso!', 22, 24),
(100, '2021-10-22', 'Alteração realizada com sucesso!', 22, 25),
(101, '2021-10-22', 'Alteração realizada com sucesso!', 22, 37),
(102, '2021-10-22', 'Alteração realizada com sucesso!', 22, 22),
(103, '2021-10-25', 'Alteração realizada com sucesso!', 22, 21),
(104, '2021-10-25', 'Alteração realizada com sucesso!', 22, 43),
(105, '2021-10-25', 'Alteração realizada com sucesso!', 22, 44),
(106, '2021-10-25', 'Alteração realizada com sucesso!', 22, 39),
(107, '2021-10-25', 'Alteração realizada com sucesso!', 22, 40),
(108, '2021-10-25', 'Alteração realizada com sucesso!', 22, 38),
(109, '2021-10-25', 'Alteração realizada com sucesso!', 22, 20),
(110, '2021-10-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 54),
(111, '2021-10-25', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 55),
(112, '2021-10-25', 'REPASSADO NESTA DATA PARA O TECNICO RONALDO MOTA PARA FISCALIZAÇAO.', 23, 55),
(113, '2021-10-26', 'Repassado nesta data ao técnico Ronaldo Mota para apreciação , fiscalização e parecer técnico.', 23, 27),
(114, '2021-10-26', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 56),
(115, '2021-10-26', 'REPASSADO NESTA DATA PARA TÉCNICO RONALDO MOTA , PARA APRECIAÇÃO ,FISCALIZAÇÃO E PARECER TÉCNICO.', 23, 56),
(116, '2021-10-26', 'Alteração realizada com sucesso!', 23, 20),
(117, '2021-10-26', 'REPASSADA A TÉCNICA LOUYSSE PARA APRECIAÇÃO , FISCALIZAÇÃO E OARECER TÉCNICO.', 23, 20),
(118, '2021-10-26', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 57),
(119, '2021-10-26', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 58),
(120, '2021-10-26', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 59),
(123, '2021-10-27', 'Alteração realizada com sucesso!', 39, 20),
(124, '2021-10-27', 'Alteração realizada com sucesso!', 39, 20),
(125, '2021-10-27', 'Alteração realizada com sucesso!', 39, 45),
(126, '2021-10-27', 'REPASSADO NESTA DATA PARA O TECNICO ALVINO PARA APRECIAÇÃO FISCALIZAÇÃO E PARECER TECNICO', 23, 40),
(127, '2021-10-27', 'FOI REPASSADO NESTA DATA PARA O TÉCNICO ÍTALO PARA APRECIAÇÃO , FISCALIZAÇÃO E PARECER TECNICO.', 23, 59),
(128, '2021-10-27', 'ENCAMINHADO NESTA DATA PARA VETERINÁRIA LOUYSSE PARA APRECIAÇÃO ,FISCALIZAÇÃO E PARECER TECNICO.', 23, 58),
(129, '2021-11-05', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 61),
(130, '2021-11-05', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 62),
(131, '2021-11-08', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 63),
(132, '2021-11-08', 'REPASSADO NESTA DATA PARA O TÉCNICO RONALDO PARA APRECIAÇÃO E RELATÓRIO TÉCNICO', 23, 63),
(133, '2021-11-08', 'REPASSADO NESTA DATA PARA TECNICO ITALO PARA FICALIZAÇÃO E PARECER TECNICO', 23, 42),
(134, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 64),
(135, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 65),
(136, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 66),
(137, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 67),
(138, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 68),
(139, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 69),
(140, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 70),
(141, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 71),
(142, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 72),
(143, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 73),
(144, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 74),
(145, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 75),
(146, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 76),
(147, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 77),
(148, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 78),
(149, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 79),
(150, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 80),
(151, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 81),
(152, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 82),
(153, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 83),
(154, '2021-11-11', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 84),
(155, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 85),
(156, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 86),
(157, '2021-11-12', 'REPASSADO NESTA DATA PARA TECNICA LOUYSSE PARA AS DEVIDAS PROVIDÊNIAS', 23, 86),
(158, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 87),
(159, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 88),
(160, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 89),
(161, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 90),
(162, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 91),
(163, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 92),
(164, '2021-11-12', 'REPASSADO NESTA PARA TECNICA LOUYSSE PARA CAPTURA DO ANIMAR E POSTERIOR RELATORIO', 23, 92),
(165, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 93),
(166, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 94),
(167, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 95),
(168, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 96),
(169, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 97),
(170, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 98),
(171, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 99),
(172, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 100),
(173, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 101),
(174, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 102),
(175, '2021-11-12', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 103),
(176, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 104),
(177, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 105),
(178, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 106),
(179, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 107),
(180, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 108),
(181, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 109),
(182, '2021-11-16', 'Alteração realizada com sucesso!', 39, 92),
(183, '2021-11-16', 'Alteração realizada com sucesso!', 39, 92),
(184, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 110),
(185, '2021-11-16', 'Os agentes de fiscalização se deslocaram até o endereço, no entanto o solicitante não atendeu as chamadas realizadas, atendeu meia hora e  informou que o animal já havia fugido para uma área de mata atrás da sua residência. ', 39, 92),
(186, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 111),
(187, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 112),
(188, '2021-11-16', 'Foi realizada fiscalização pelas agentes Louysse Monteiro e Josy Senna, na qual em conversa o responsável pela clínica, Sergio Medeiros foi informado da solicitação, o mesmo já havia tomado algumas providências a respeito, conversando com a  requerente. ', 39, 58),
(189, '2021-11-16', 'Alteração realizada com sucesso!', 39, 58),
(190, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 113),
(191, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 114),
(192, '2021-11-16', 'Alteração realizada com sucesso!', 39, 58),
(193, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 115),
(194, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 116),
(195, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 117),
(196, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 118),
(197, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 119),
(198, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 120),
(199, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 121),
(200, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 122),
(201, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 123),
(202, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 124),
(203, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 125),
(204, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 126),
(205, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 127),
(206, '2021-11-16', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 128),
(207, '2021-11-17', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 129),
(208, '2021-11-17', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 130),
(209, '2021-11-17', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 131),
(210, '2021-11-17', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 132),
(211, '2021-11-17', 'REPASSADA NESTA DATA PARA A TECNICA LOUYSSE PARA DEVIDAS PROVIDÊNCIAS.', 23, 127),
(212, '2021-11-23', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 133),
(213, '2021-11-23', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 134),
(214, '2021-11-23', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 135),
(215, '2021-11-23', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 136),
(216, '2021-11-23', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 137),
(217, '2021-11-23', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 138),
(218, '2021-11-23', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 139),
(219, '2021-11-23', 'Repassado nesta data para o técnico Italo, para averiguação e parecer. ', 23, 139),
(220, '2021-11-23', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 140),
(221, '2021-11-23', 'Repassada nesta data para a técnica Louysse para averiguação e parecer técnico.', 23, 140),
(222, '2021-11-24', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 141),
(223, '2021-11-24', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 142),
(224, '2021-11-24', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 143),
(225, '2021-11-24', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 144),
(226, '2021-11-24', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 145),
(227, '2021-11-24', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 146),
(228, '2021-11-24', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 147),
(229, '2021-11-24', 'Repassado nesta data para técnico Ítalo para averiguação e resposta.', 23, 147),
(230, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 148),
(231, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 149),
(232, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 150),
(233, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 151),
(234, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 152),
(235, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 153),
(236, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 154),
(237, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 155),
(238, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 156),
(239, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 157),
(240, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 158),
(241, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 159),
(242, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 160),
(243, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 161),
(244, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 162),
(245, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 163),
(246, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 164),
(247, '2021-11-25', 'Repassado nesta data para Técnico Alvino para andamento de processo  ', 23, 148),
(248, '2021-11-25', 'Repassado nesta data para técnico Alvino.', 23, 149),
(249, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 165),
(250, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 166),
(251, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 167),
(252, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 168),
(253, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 169),
(254, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 170),
(255, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 171),
(256, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 172),
(257, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 173),
(258, '2021-11-25', 'Repassado nesta data para Tecnica Duda .', 23, 27),
(259, '2021-11-25', 'Foi realizado o cadastro da denúncia no banco de dados', 23, 174),
(260, '2021-11-25', 'REPASSADO NESTA DATA PARA TECNICA DUDA', 23, 174),
(261, '2021-11-25', 'Repassada nesta data para tecnica Mª da Conceição para providências', 23, 173),
(262, '2021-11-25', 'Alteração realizada com sucesso!', 23, 173),
(263, '2021-11-25', 'Foi repassado nesta data para tecnico Italo para resolução', 23, 173),
(264, '2021-11-25', 'Repassado nesta data para tecnico Italo ', 23, 63),
(265, '2021-11-25', 'Alteração realizada com sucesso!', 23, 63),
(266, '2021-11-26', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 175),
(267, '2021-11-26', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 176),
(268, '2021-11-26', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 177),
(269, '2021-11-26', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 178),
(270, '2021-11-26', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 179),
(271, '2021-11-26', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 180),
(272, '2021-11-26', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 181),
(273, '2021-11-26', 'Foi realizado o cadastro da denúncia no banco de dados', 22, 182),
(274, '2021-11-26', 'Repassado nesta data para técnico Ítalo', 23, 22),
(275, '2021-11-26', 'Alteração realizada com sucesso!', 23, 22),
(276, '2021-11-26', 'Repassado nesta data para técnico Alvino', 23, 55),
(277, '2021-11-26', 'Alteração realizada com sucesso!', 23, 55),
(278, '2021-11-26', 'Repassado nesta data para Ítalo', 23, 62),
(279, '2021-11-26', 'Alteração realizada com sucesso!', 23, 62),
(280, '2021-11-26', 'Alteração realizada com sucesso!', 23, 62);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_historico_solicitacao`
--

CREATE TABLE `fisc_historico_solicitacao` (
  `id` int(10) UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `solicitacao_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_historico_solicitacao`
--

INSERT INTO `fisc_historico_solicitacao` (`id`, `data`, `descricao`, `usuario_id`, `solicitacao_id`) VALUES
(7, '2021-10-13', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 3),
(8, '2021-10-13', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 4),
(10, '2021-10-13', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 6),
(11, '2021-10-13', 'Alteração realizada com sucesso!', 1, 6),
(12, '2021-10-13', 'Alteração realizada com sucesso!', 1, 6),
(13, '2021-10-13', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 7),
(14, '2021-10-14', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 8),
(15, '2021-10-14', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 9),
(66, '2021-10-15', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 30),
(67, '2021-10-15', 'Encaminhado nesta data para apreciação do ASJUR.', 23, 30),
(68, '2021-10-15', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 31),
(69, '2021-10-15', 'Alteração realizada com sucesso!', 23, 31),
(70, '2021-10-15', 'Enviado nesta data para  ASJUR apreciação e resposta.', 23, 31),
(71, '2021-10-15', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 32),
(72, '2021-10-15', 'Enviado nesta data para  ASJUR apreciação e resposta.', 23, 32),
(73, '2021-10-15', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 33),
(74, '2021-10-15', 'Enviado nesta data para  ASJUR apreciação e resposta.', 23, 33),
(75, '2021-10-15', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 34),
(76, '2021-10-15', 'PROC: 00167/2021 - Enviado nesta data para  ASJUR apreciação e resposta. ', 23, 34),
(77, '2021-10-15', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 35),
(78, '2021-10-15', 'PROC:230/2021 - ENVIADO NESTA DATA PARA ASJUR PARA APRECIAÇÃO E RESPOSTA.', 23, 35),
(79, '2021-10-15', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 36),
(80, '2021-10-15', ' ENVIADO NESTA DATA PARA ASJUR PARA APRECIAÇÃO E RESPOSTA.', 23, 36),
(81, '2021-10-19', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 37),
(82, '2021-10-19', 'Alteração realizada com sucesso!', 23, 37),
(83, '2021-10-19', 'Alteração realizada com sucesso!', 23, 37),
(84, '2021-10-19', 'ENVIADO NESTA DATA AO JURIDICO PARA APRECISAÇÃO E RESPOSTA', 23, 37),
(85, '2021-10-19', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 38),
(86, '2021-10-19', 'ENVIADO NESTA DATA PARA APRECIAÇAO DO JURIDICO', 23, 38),
(87, '2021-10-19', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 39),
(88, '2021-10-19', 'ENVIADO NESTA DATA PARA APRECIAÇÃO DO JURIDICO', 23, 39),
(98, '2021-10-22', 'Foi realizado o cadastro da solicitação no banco de dados', 22, 46),
(99, '2021-10-25', 'Foi realizado o cadastro da solicitação no banco de dados', 22, 47),
(104, '2021-10-26', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 48),
(105, '2021-10-27', 'ENVIADO NESTA DATA PARA TECNICO ALVINO , PARA APRECIAÇÃO E PROSSEGUIMENTO NA JUNTADA DE DOCUNTOS.', 23, 48),
(106, '2021-10-27', 'Alteração realizada com sucesso!', 23, 48),
(107, '2021-11-03', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 49),
(108, '2021-11-03', 'REPASSADO NESTA DATA PARA TECNICO ALVINO PARA APRECIAÇÃO E RELATORIO TECNICO', 23, 49),
(109, '2021-11-03', 'EWPASSADO NESTA DATA PARA ASJUR PARA ANÁLISE E PROVIDENCIAS', 23, 49),
(114, '2021-11-05', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 52),
(115, '2021-11-05', 'ENVIADO RESPOSTA NESTA DATA NEGANDO SOLICITAÇÃO ATRAVES DE OFICIO .', 23, 52),
(116, '2021-11-05', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 53),
(117, '2021-11-09', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 54),
(118, '2021-11-09', 'REPASSADO NESTA DATA PARA COORDENADORA DE FISCALIZAÇÃO MARIA DA CONCEIÇÃO B. DA COSTA.', 23, 54),
(119, '2021-11-12', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 55),
(132, '2021-11-26', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 63),
(133, '2021-11-26', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 64),
(134, '2021-11-26', 'Repassado nesta data para a Coordenadora Mª Conceilçao', 23, 64),
(135, '2021-11-26', 'Foi realizado o cadastro da solicitação no banco de dados', 23, 65),
(136, '2021-11-26', 'Repassado nesta data para Coordenadora MªConceição', 23, 65);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_origem`
--

CREATE TABLE `fisc_origem` (
  `id` int(10) UNSIGNED NOT NULL,
  `origem` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_origem`
--

INSERT INTO `fisc_origem` (`id`, `origem`) VALUES
(1, 'Denúncia Externa'),
(2, 'Denuncia Interna'),
(3, 'Poder Executivo'),
(4, 'Poder Judiciário'),
(5, 'Poder Legislativo'),
(6, 'Interna'),
(7, 'Externa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_protocolo`
--

CREATE TABLE `fisc_protocolo` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `tramitacao` int(11) NOT NULL,
  `data_protocolo` date DEFAULT NULL,
  `protocolo_id` int(10) UNSIGNED NOT NULL,
  `tipo_documento_id` int(10) UNSIGNED NOT NULL,
  `origem_id` int(10) UNSIGNED NOT NULL,
  `numero_protocolo` varchar(45) DEFAULT NULL,
  `ano_protocolo` varchar(10) DEFAULT NULL,
  `numero_oficio` varchar(45) DEFAULT NULL,
  `ano_oficio` varchar(10) DEFAULT NULL,
  `numero_memorando` varchar(45) DEFAULT NULL,
  `ano_memorando` varchar(10) DEFAULT NULL,
  `id_solicitante` int(3) UNSIGNED NOT NULL,
  `prazo` varchar(255) NOT NULL,
  `hash` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_protocolo`
--

INSERT INTO `fisc_protocolo` (`id`, `tipo`, `tramitacao`, `data_protocolo`, `protocolo_id`, `tipo_documento_id`, `origem_id`, `numero_protocolo`, `ano_protocolo`, `numero_oficio`, `ano_oficio`, `numero_memorando`, `ano_memorando`, `id_solicitante`, `prazo`, `hash`) VALUES
(23, 'denuncia', 100, '2021-10-05', 1, 2, 1, '01352/2021', '2021', '', '', '', '', 3, '', '552c8321cfd1f2615ddb198854f1cff7'),
(25, 'denuncia', 133, '2021-08-04', 1, 2, 1, '00987/2021', '2021', '', '', '', '', 3, '', '691be7daabfd94df77d2f3a792edff00'),
(26, 'denuncia', 125, '2021-08-24', 1, 2, 1, '01079/2021', '2021', '', '', '', '', 3, '', '74c99801396534dbd1bea2835a21a50c'),
(27, 'denuncia', 121, '2021-09-01', 1, 2, 1, '01339/2021', '2021', '1601/2021', '2021', '', '', 3, '', '9e62aea9f336bb14595b78b98f1af888'),
(28, 'denuncia', 116, '2021-08-12', 1, 2, 1, '01024/2021', '2021', '', '', '', '', 3, '', '2e1037114b2178be76d8a6d7611eca7c'),
(29, 'denuncia', 117, '2021-09-27', 1, 2, 1, '01308/2021', '2021', '', '', '', '', 3, '', '864c9201e1b02ba7b573e3bb08ce371f'),
(30, 'denuncia', 118, '2021-08-27', 1, 2, 1, '01108/2021', '2021', '', '', '', '', 3, '', '2706c7b97209dc48ed8460adb31323f5'),
(31, 'denuncia', 115, '2021-07-27', 1, 4, 1, '00949/2021', '2021', '196/2021', '2021', '', '', 2, '', '5cc2a3beca655b34ce60d14a62ed7bc7'),
(32, 'denuncia', 0, '2021-09-21', 1, 2, 1, '01273/2021', '2021', '', '', '', '', 3, '', '94144c01463a11b8358c99e582c881e2'),
(33, 'denuncia', 114, '2021-09-23', 1, 2, 1, '01289/2021', '2021', '', '', '', '', 3, '', 'e35645a1aab9854f9a626009dc3e4d83'),
(34, 'denuncia', 111, '2021-09-24', 1, 4, 1, '01303/2021', '2021', '037/2021', '2021', '', '', 3, '', '1d13cfd40c4019e4ce0a212a0bae842b'),
(35, 'denuncia', 110, '2021-10-10', 1, 2, 1, '01343/2021', '2021', '', '', '', '', 3, '', '0aff33d4c34c4fdf5d40f51b41353e9e'),
(36, 'denuncia', 109, '2021-08-20', 1, 2, 1, '01064/2021', '2021', '', '', '', '', 3, '', '5a7525ce729a1bc1d4722f9c170e598b'),
(37, 'denuncia', 108, '2021-08-16', 1, 2, 1, '01039/2021', '2021', '', '', '', '', 3, '', '6638b2c550d5ab04d4899b593e18e026'),
(38, 'denuncia', 107, '2021-08-12', 1, 2, 1, '01021/2021', '2021', '', '', '', '', 3, '', '4324f48635c34c16ec00ec31edfe6089'),
(39, 'denuncia', 106, '2021-08-10', 1, 2, 1, '01009/2021', '2021', '', '', '', '', 3, '', '8a08627030d7734e6b2bfc34ea960ae3'),
(40, 'denuncia', 101, '2021-08-08', 1, 2, 1, '00994/2021', '2021', '', '', '', '', 3, '', 'ce6ba07dcdc9f3809da766eefd117ccf'),
(41, 'denuncia', 102, '2021-05-21', 1, 2, 1, '0591/2021', '2021', '', '', '', '', 3, '', 'b138bd7a8690bb719b41039e1eda8679'),
(42, 'denuncia', 120, '2021-09-01', 1, 2, 1, '01153/2021', '2021', '', '', '', '', 3, '', '146f22a4ef1415a04e226059d29b14ee'),
(43, 'denuncia', 132, '2021-09-01', 1, 2, 1, '01154/2021', '2021', '', '', '', '', 3, '', '25b6e10b3f9f8d59c35c78a5bf59e72d'),
(44, 'denuncia', 128, '2021-07-06', 1, 2, 1, '00841/2021', '2021', '', '', '', '', 3, '', '685e793e52e804769d972450ee5164d1'),
(45, 'denuncia', 129, '2021-09-08', 1, 2, 1, '01180/2021', '2021', '', '', '', '', 3, '', 'c2df5b9243b38b8727e5769d0f9c60c1'),
(46, 'solicitacao', 0, '2021-07-05', 1, 4, 7, '00834/2021', '2021', '01/2021', '2021', '', '', 3, '', '000a70411801c564d9731a78f2171823'),
(47, 'denuncia', 0, '2021-10-01', 1, 2, 1, '01339/2021', '2021', '', '', '', '', 3, '', '1053f2aad47c5df229713645e63c35b9'),
(48, 'denuncia', 113, '2021-09-24', 1, 2, 1, '01307/2021', '2021', '', '', '', '', 3, '', '698066c4a50c3947d2353f925531a7f8'),
(49, 'solicitacao', 9, '2021-10-13', 1, 4, 3, '01151/2021', '2021', '074/2021', '2021', '', '', 1, '', 'e9e9f15d7a4a4cc6756786b26c095148'),
(50, 'denuncia', 126, '2021-08-18', 1, 2, 1, '01046/2021', '2021', '', '', '', '', 3, '', 'b5a69d8c1b1974a74c11253482f3bcfb'),
(52, 'solicitacao', 0, '2021-10-07', 2, 8, 3, '00223/2021', '2021', '798/2021', '2021', '', '', 1, '', '6d050dce5d95e64a62d4486e13611739'),
(53, 'denuncia', 127, '2021-10-08', 1, 2, 1, '01373/2021', '2021', '', '', '', '', 3, '', 'ea437efe44eb956f0b62e0bb1e29bb7c'),
(54, 'solicitacao', 15, '2021-07-09', 1, 4, 7, '0865/2021', '2021', '378/2021', '2021', '', '', 3, '', 'e8e898a33f1b97f4b99b26eece0ca097'),
(55, 'solicitacao', 24, '2021-10-14', 1, 7, 7, '01387/2021', '2021', '', '', '', '', 3, '', 'f62e9bdac6afef682308e67c3ddc9d0b'),
(56, 'solicitacao', 30, '2021-09-20', 2, 8, 3, '00194/2021', '2021', '226/2021', '2021', '', '', 1, '', '1c6d19508dfacd1519068e7c1c9f683f'),
(77, 'solicitacao', 55, '2021-08-31', 2, 8, 3, '00163/2021', '2021', '813/2021', '2021', '', '', 1, '', 'fca192a7aa3532277609d9ca32c02f63'),
(78, 'solicitacao', 58, '2021-10-11', 2, 8, 3, '00227/2021', '2021', '957/2021', '2021', '', '', 1, '', 'd24edec5393ba499a56612603bb0825e'),
(79, 'solicitacao', 61, '2021-10-06', 2, 8, 3, '00219/2021', '2021', '869/2021', '2021', '', '', 1, '', '51e94cb5d60868ea8afc2d394586fec0'),
(80, 'solicitacao', 60, '2021-09-27', 2, 8, 3, '1311/2021', '2021', '0783/2021', '2021', '', '', 1, '', '23a2469f9b57f9c0e3b0f5fff95abc7f'),
(81, 'solicitacao', 62, '2021-09-02', 2, 8, 3, '00167/2021', '2021', '0571/2021', '2021', '', '', 1, '', '0ef14a457d4fe6aa450e1c07c746ec6d'),
(82, 'solicitacao', 63, '2021-10-13', 2, 8, 3, '00230/2021', '2021', '074/2021', '2021', '', '', 1, '', '76c2d7f0fe461e5e5d12ee941946bd53'),
(83, 'solicitacao', 64, '2021-07-27', 2, 8, 3, '00129/2021', '2021', '0579/2021', '2021', '', '', 1, '', 'ef906907373c5cc1ea96e5f29f6d1753'),
(84, 'denuncia', 0, '2021-10-14', 1, 2, 1, '01392/2021', '2021', '', '', '', '', 3, '', '78ea2e691d0be9c1879d90e717cd3656'),
(85, 'denuncia', 72, '2021-10-19', 1, 5, 3, '1412/2021', '2021', '', '', '', '', 1, '', 'ddaaf7ffc39682d22ba2d8f0a5ccbc17'),
(86, 'denuncia', 71, '2021-10-19', 1, 5, 3, '1411/2021', '2021', '', '', '', '', 1, '', '19e4d0537eb0704fe87acfc32db482bd'),
(87, 'denuncia', 69, '2021-10-19', 1, 5, 3, '1410/2021', '2021', '', '', '', '', 1, '', '858b06108d5be708f8c232979613b6b0'),
(88, 'denuncia', 68, '2021-10-19', 1, 5, 3, '1409/2021', '2021', '', '', '', '', 1, '', '69bdaa7c39fd6430a56385a081ddfecd'),
(89, 'denuncia', 67, '2021-10-19', 1, 5, 3, '1408/2021', '2021', '', '', '', '', 1, '', '5c876793f4b28df551027143d3222a2d'),
(90, 'denuncia', 66, '2021-10-19', 1, 5, 3, '1407/2021', '2021', '', '', '', '', 1, '', '06852066a98bf29340f605c03d0aff5d'),
(91, 'denuncia', 65, '2021-10-19', 1, 5, 3, '1406/2021', '2021', '', '', '', '', 1, '', 'cfe5828688c58abf037fa692d6dd0bd2'),
(92, 'solicitacao', 49, '2021-10-14', 2, 8, 3, '00233/2021', '2021', '364/2021', '2021', '', '', 1, '', 'e7ac0dbd9ba7e715d72fa200dc52baac'),
(93, 'solicitacao', 73, '2021-09-23', 1, 4, 3, '0199/2021', '2021', '00199/2021', '2021', '', '', 1, '', 'f41c54a141e80226f719fc4ca6824332'),
(94, 'solicitacao', 74, '2021-09-02', 2, 8, 3, '165/2021', '2021', '586/2021', '2021', '', '', 1, '', '1a245294470c3251dc765054fef40a0f'),
(102, 'solicitacao', 119, '2021-10-05', 1, 4, 4, '01348/2021', '2021', '1601', '2021', '', '', 3, '', '54ad098e19dd07ec2cd9d9a9c487b2bc'),
(103, 'solicitacao', 130, '2021-07-05', 1, 4, 1, '008434/2021', '2021', '01', '2021', '', '', 3, '', '70fd4078f4841c94e18756262bc1e80b'),
(104, 'denuncia', 131, '2021-09-15', 1, 2, 1, '01238/2021', '2021', '', '', '', '', 3, '', 'e16370de2663232dcaeaa5ce811e3e79'),
(105, 'denuncia', 139, '2021-10-20', 1, 2, 1, '1419/2021', '2021', '', '', '', '', 3, '', '2afb5bbbf63ed8499f61fff3e124d56e'),
(106, 'denuncia', 150, '2021-10-06', 1, 2, 7, '01359/2021', '2021', '', '', '', '', 3, '', '9f952358d64f090f49efc6628cc8fdf6'),
(107, 'denuncia', 149, '2021-09-28', 1, 2, 7, '01318/2021', '2021', '', '', '', '', 3, '', 'bb773d59f48d24fbb642216f00b66f0b'),
(108, 'solicitacao', 142, '2021-10-25', 1, 4, 7, '1449/2021', '2021', '706/2021', '2021', '', '', 3, '', '48673cc85a9eaa5b67ea300996bf6b85'),
(109, 'denuncia', 145, '2021-10-25', 1, 2, 7, '1452/2021', '2021', '', '', '', '', 3, '', '5e1043daa246024719d79dc1ba0dfebf'),
(110, 'denuncia', 158, '2021-10-19', 1, 2, 1, '01413/2021', '2021', '', '', '', '', 3, '', 'a7fa86bdd122453ca32ed3e384d3e812'),
(112, 'solicitacao', 193, '2021-11-03', 2, 6, 1, '257/2021', '2021', '', '', '', '', 3, '', 'ce97f6ffc6985ed3964d210083cc9c63'),
(115, 'solicitacao', 223, '2021-11-05', 1, 4, 3, '1486/2021', '2021', '082/2021', '2021', '', '', 3, '', '0acaf0a72caf5d1615cf1dbf054f94ca'),
(116, 'denuncia', 245, '2021-11-05', 1, 2, 1, '1493/2021', '2021', '', '', '', '', 3, '', '44d9b57c7226f800949a058fd0241b33'),
(117, 'denuncia', 246, '2021-11-05', 1, 2, 1, '1494/2021', '2021', '', '', '', '', 3, '', '4e2b5339e8ee0f29907c1db13e20f281'),
(118, 'solicitacao', 240, '2021-11-05', 2, 8, 6, '260/2021', '2021', '', '', '147/2021', '2021', 1, '', 'c8c51a0a55dda6908fe14d71572eda08'),
(119, 'denuncia', 119, '2021-10-05', 1, 4, 4, '1348/2021', '2021', '1602/2021', '2021', '', '', 3, '', '5d136ea8ae101ba9f9c1bc4bcd24e06b'),
(120, 'solicitacao', 267, '2021-11-08', 1, 4, 4, '1502/2021', '2021', '389/2021', '2021', '', '', 2, '', '877a7395697245ec6bb1ed50c5cd3252'),
(121, 'denuncia', 305, '2021-06-21', 1, 2, 1, '00755/2021', '2021', '', '', '', '', 3, '', '467e8856904520110c3b3cc245998da4'),
(122, 'denuncia', 307, '2021-05-19', 1, 2, 1, '00580/2021', '2021', '', '', '', '', 3, '', 'd907a076a022c438de0afe8069ad1491'),
(123, 'denuncia', 308, '2021-05-13', 1, 2, 1, '00555/2021', '2021', '', '', '', '', 3, '', '38cfb114d8da4bf8c63b20f439a1c457'),
(124, 'denuncia', 309, '2021-05-17', 1, 2, 1, '00568/2021', '2021', '', '', '', '', 3, '', '1325316b57cb7c61593e144a9d7fdadf'),
(125, 'denuncia', 312, '2020-10-30', 1, 2, 1, '01391/2020', '2021', '', '', '', '', 3, '', '636e22a7ff536b5f92be8400f69c7cea'),
(126, 'denuncia', 314, '2021-05-06', 1, 2, 1, '00508/2021', '2021', '', '', '', '', 3, '', '179b9be186c223463966087d95dbe19c'),
(127, 'denuncia', 316, '2021-05-06', 1, 2, 1, '00501/2021', '2021', '', '', '', '', 3, '', '229cff994f29bba918039483ba2c584e'),
(128, 'denuncia', 317, '2021-06-18', 1, 2, 1, '00746/2021', '2021', '', '', '', '', 3, '', '142e103c2f88a2572c75539b1d975c84'),
(129, 'denuncia', 319, '2021-05-25', 1, 2, 1, '00618/2021', '2021', '', '', '', '', 3, '', '3daa4e280fda818fa5d249d41fa83265'),
(130, 'denuncia', 320, '2021-05-25', 1, 2, 1, '00617/2021', '2021', '', '', '', '', 3, '', '8a52463f61fadd0500a13111cb7640c0'),
(131, 'denuncia', 322, '2021-05-19', 1, 2, 1, '00579/2021', '2021', '', '', '', '', 3, '', 'e33cd8bbf81a75482371489989979b63'),
(132, 'denuncia', 323, '2021-04-26', 1, 2, 1, '00443/2021', '2021', '', '', '', '', 3, '', 'eca938996594ee09afb00e690a9f5cd6'),
(133, 'denuncia', 325, '2021-05-05', 1, 2, 1, '00497/2021', '2021', '', '', '', '', 3, '', '65c74715032f412fdfdbaec8dc2d6c6b'),
(134, 'denuncia', 326, '2021-02-02', 1, 2, 1, '00102/2021', '2021', '', '', '', '', 3, '', 'f338d390fd56cca48897bce5c675b735'),
(135, 'denuncia', 328, '2021-06-10', 1, 2, 1, '00709/2021', '2021', '', '', '', '', 3, '', 'c5b04464ff906e343d7047801426af09'),
(136, 'denuncia', 329, '2021-04-23', 1, 2, 1, '00430/2021', '2021', '', '', '', '', 3, '', '2b1efb368d0283c834404252de24c12a'),
(137, 'denuncia', 331, '2021-06-14', 1, 2, 1, '00716/2021', '2021', '', '', '', '', 3, '', 'a1d00a09c0e684940aa61f00180cc76b'),
(138, 'denuncia', 333, '2021-03-29', 1, 1, 1, '00340/2021', '2021', '', '', '', '', 3, '', '4a2e50c808efef1689fe564dffa94564'),
(139, 'denuncia', 335, '2021-05-24', 1, 2, 1, '00599/2021', '2021', '', '', '', '', 3, '', '68e4558d2e0aff56fc3337b9bfbcc28e'),
(140, 'denuncia', 337, '2021-05-10', 1, 2, 1, '00528/2021', '2021', '', '', '', '', 3, '', '95b71023b30301408a2ee5ae56793f71'),
(141, 'denuncia', 338, '2021-06-30', 1, 2, 1, '00812/2021', '2021', '', '', '', '', 3, '', '5da61a8d243639c20384b06ae3f0a13d'),
(142, 'denuncia', 355, '2021-04-27', 1, 2, 1, '0447/2021', '2021', '', '', '', '', 3, '', 'ee80fe8c7c8bd1727f59eea5df8ec240'),
(143, 'denuncia', 345, '2021-11-11', 1, 2, 1, '1526/2021', '2021', '', '', '', '', 3, '', '93ab6af9776896c899f35bade6331e6f'),
(144, 'denuncia', 354, '2021-06-14', 1, 2, 1, '00715/2021', '2021', '', '', '', '', 3, '', '451f904b3951d9da7933ce7036abc861'),
(145, 'denuncia', 357, '2021-04-27', 1, 2, 1, '00445/2021', '2021', '', '', '', '', 3, '', 'ad6d625bbb6deec67f8386d51622d2ac'),
(146, 'denuncia', 358, '2021-05-06', 1, 2, 1, '00509/2021', '2021', '', '', '', '', 3, '', 'bf1974337baf2a91ef25133a8666632f'),
(147, 'denuncia', 359, '2021-05-20', 1, 2, 1, '00584/2021', '2021', '', '', '', '', 3, '', 'cc8e7ff3ad60984135d1bcd24a656fe4'),
(148, 'denuncia', 368, '2021-04-29', 1, 2, 1, '00473/2021', '2021', '', '', '', '', 3, '', 'd357e75166d72c883065a7c33767914e'),
(149, 'denuncia', 367, '2021-11-12', 1, 2, 1, '1534/2021', '2021', '', '', '', '', 3, '', '862c60397563d3ee0b478a2e966dd812'),
(150, 'denuncia', 370, '2021-05-04', 1, 2, 1, '00487/2021', '2021', '', '', '', '', 3, '', '60c4ae19e69e652acecf63c1ab4a44d3'),
(151, 'denuncia', 372, '2021-04-28', 1, 2, 1, '00458/2021', '2021', '', '', '', '', 3, '', '19eadc436315f8f081c2897e881c0960'),
(152, 'denuncia', 375, '2021-04-12', 1, 2, 1, '00384/2021', '2021', '', '', '', '', 3, '', 'd5a6ab7f727b7bd9610dae612a216718'),
(153, 'denuncia', 378, '2021-03-29', 1, 1, 1, '00335/2021', '2021', '', '', '', '', 3, '', '011d1bdd581c6a9f6557fb2de6e9a232'),
(154, 'denuncia', 379, '2021-03-11', 1, 2, 1, '00266/2021', '2021', '', '', '', '', 3, '', '40e6ccfe71d8e1c862d43d73e28c295f'),
(155, 'denuncia', 380, '2021-02-09', 1, 2, 1, '00117/2021', '2021', '', '', '', '', 3, '', '032642a69f6edee9f64af833b29a9929'),
(156, 'denuncia', 382, '2021-05-12', 1, 2, 1, '00547/2021', '2021', '', '', '', '', 3, '', '3f1da219c303bb6853a16f0c2482e3e8'),
(157, 'denuncia', 387, '2021-06-29', 1, 2, 1, '00790/2021', '2021', '', '', '', '', 3, '', 'dd4e9c6bff89b90e4a98c030e183b0bc'),
(158, 'denuncia', 389, '2021-03-26', 1, 2, 1, '00325/2021', '2021', '', '', '', '', 3, '', 'f18712ca138b6b7f1b5724376c71bf98'),
(159, 'denuncia', 390, '2021-05-07', 1, 2, 1, '00516/2021', '2021', '', '', '', '', 3, '', '123dd694eaf162ba7fee02ee871682a0'),
(160, 'denuncia', 394, '2021-05-06', 1, 2, 1, '00511/2021', '2021', '', '', '', '', 3, '', '6e68c30836755313902af215b2c31e01'),
(161, 'solicitacao', 381, '2021-11-12', 2, 8, 3, '272/2021', '2021', '899/2021', '2021', '', '', 1, '', '8cac24e7d05005285bb2cb5ed29ea9c3'),
(162, 'denuncia', 410, '2021-08-31', 1, 2, 2, '01139/2021', '2021', '', '', '', '', 1, '', '596b9469722f1f327218af632996fa20'),
(163, 'denuncia', 411, '2021-07-12', 1, 2, 1, '00888/2021', '2021', '', '', '', '', 3, '', '308475e5e62b4970df25d4dccf45110e'),
(164, 'denuncia', 413, '2021-07-09', 1, 2, 1, '00862/2021', '2021', '', '', '', '', 3, '', '36c032f5d806e97955769eadcc46e9b4'),
(165, 'denuncia', 130, '2021-07-05', 1, 4, 1, '00834/2021', '2021', '01/2021', '2021', '', '', 3, '', '1bc443af22094925554f7b5d9f76e150'),
(166, 'denuncia', 415, '2021-05-26', 1, 2, 1, '00643/2021', '2021', '', '', '', '', 3, '', '3fa7e7609b501d95db075403f5b93681'),
(167, 'denuncia', 416, '2021-06-14', 1, 2, 1, '00717/2021', '2021', '', '', '', '', 3, '', 'c391402b58c9653eaf3302c88a24f34c'),
(168, 'denuncia', 417, '2021-03-12', 1, 2, 1, '00273/2021', '2021', '', '', '', '', 3, '', 'f901acae613e118df72b39b7f3487a7e'),
(169, 'denuncia', 419, '2021-12-04', 1, 2, 1, '01569/2021', '2021', '', '', '', '', 3, '', '11e6f8a8aea74ee2015c25170e84df2c'),
(170, 'denuncia', 420, '2021-11-23', 1, 2, 1, '01509/2020', '2020', '', '', '', '', 3, '', 'ab5963e3289e8621b1f749f82217cf54'),
(171, 'denuncia', 422, '2021-08-03', 1, 2, 1, '00840/2020', '2020', '', '', '', '', 3, '', '765714fa5bbaede2a60bcc30ee8c8500'),
(172, 'denuncia', 426, '2021-07-26', 1, 2, 1, '00931/2021', '2021', '', '', '', '', 3, '', '6c66a2bf95e282dfb4b13e6d19c4eaca'),
(173, 'denuncia', 429, '2021-08-20', 1, 2, 1, '01061/2021', '2021', '', '', '', '', 3, '', '070aa4317a5a0e0dd3c60b301427a21d'),
(174, 'denuncia', 431, '2021-05-21', 1, 2, 1, '00595/2021', '2021', '', '', '', '', 3, '', '7cc5c48412770dd9367e4431eccc291c'),
(175, 'denuncia', 432, '2021-09-14', 1, 2, 1, '01220/2021', '2021', '', '', '', '', 3, '', 'c816d916c41b579d87c52b8fdf291e9b'),
(176, 'denuncia', 433, '2021-07-07', 1, 2, 1, '00849/2021', '2021', '', '', '', '', 3, '', '015e964a834f880656d163875a9ab43b'),
(177, 'denuncia', 434, '2021-09-08', 1, 2, 1, '01187/2021', '2021', '', '', '', '', 3, '', '2afc1c569cec11bfb9a91ddfc71f2bd8'),
(178, 'denuncia', 435, '2021-03-29', 1, 2, 1, '00337/2021', '2021', '', '', '', '', 3, '', '46326d112d77621706268e2ed005ed91'),
(179, 'denuncia', 102, '2021-05-21', 1, 1, 1, '00591/2021', '2021', '', '', '', '', 3, '', '90bd9efe714f692eb622894580e12dd4'),
(180, 'denuncia', 12, '2021-10-13', 1, 2, 1, '01384/2021', '2021', '', '', '', '', 3, '', 'b5784fb8a6baaa98bda70861c846bdf6'),
(181, 'denuncia', 436, '2021-07-19', 1, 2, 1, '00907/2021', '2021', '', '', '', '', 3, '', 'a112515022638dc3f3035b38b0690b6d'),
(182, 'denuncia', 437, '2021-08-12', 1, 2, 1, '01025/2021', '2021', '', '', '', '', 3, '', '7dfef2ebad9034c86e831e67b65d8553'),
(183, 'denuncia', 438, '2021-07-08', 1, 2, 1, '00851/2021', '2021', '', '', '', '', 3, '', '2e8a60dd3d145e1f59a7c62f77a60ead'),
(184, 'denuncia', 355, '2021-04-27', 1, 2, 1, '00447/2021', '2021', '', '', '', '', 3, '', '85469ce6b7af19d2f29ff65570f0175d'),
(185, 'denuncia', 444, '2021-11-16', 1, 2, 1, '1548/2021', '2021', '', '', '', '', 3, '', '3a0f3df2e155e16868a97a78ab1d1364'),
(186, 'denuncia', 440, '2021-11-16', 1, 2, 1, '1545/2021', '2021', '', '', '', '', 3, '', '61e5809104cbd5ff21e92874fba90fb1'),
(187, 'denuncia', 446, '2021-07-07', 1, 2, 1, '00846/2021', '2021', '', '', '', '', 3, '', 'a32ac94c5727bb35253dee676bb5e7df'),
(188, 'denuncia', 447, '2021-07-12', 1, 2, 1, '00873/2021', '2021', '', '', '', '', 3, '', '070a365d410dd1972e08459df2cc6362'),
(189, 'denuncia', 448, '2021-10-07', 1, 2, 1, '01363/2021', '2021', '', '', '', '', 3, '', 'b86a0912c2941505ee8a401b8f8ab9d3'),
(190, 'denuncia', 419, '2020-12-04', 1, 2, 1, '01569/2021', '2021', '', '', '', '', 3, '', '3adb2558eaf158c295c7428315c4d8e4'),
(191, 'denuncia', 496, '2021-04-14', 1, 2, 1, '00393/2021', '2021', '', '', '', '', 3, '', '6c656e7acf30822a7b977d01e97ec112'),
(192, 'denuncia', 498, '2021-03-26', 1, 4, 1, '00328/2021', '2021', '', '', '', '', 3, '', 'e4a059312401ad9bfe7f2e9b8f986fea'),
(193, 'denuncia', 500, '2021-08-31', 1, 2, 1, '01143/2021', '2021', '', '', '', '', 3, '', 'f52448de2d9fea0b5024db45c11f62da'),
(194, 'denuncia', 504, '2021-02-26', 1, 2, 1, '00197/2021', '2021', '', '', '', '', 3, '', '8beb9ae8c825362882e185bb505b8475'),
(195, 'denuncia', 505, '2021-04-08', 1, 2, 1, '00369/2021', '2021', '', '', '', '', 3, '', '6ac45d8ae0ad8e0311d251151b19ecf6'),
(196, 'denuncia', 506, '2021-01-13', 1, 2, 1, '00032/2021', '2021', '', '', '', '', 3, '', '671e24acd64b3059279f99455c50c8d1'),
(197, 'denuncia', 479, '2021-11-22', 1, 4, 1, '1570/2021', '2021', '029/2021', '2021', '', '', 3, '', '8221b27a175013d8bcbed79dc03d3fd7'),
(198, 'denuncia', 468, '2021-11-18', 1, 2, 1, '1563/2021', '2021', '', '', '', '', 3, '', '2cbf1a2398ba68157f048459f84ce258'),
(199, 'denuncia', 511, '2021-01-05', 1, 2, 1, '00001/2021', '2021', '', '', '', '', 3, '', '09db27ec14a23e57946275b35c9d9792'),
(200, 'denuncia', 512, '2021-06-18', 1, 2, 1, '00747/2021', '2021', '', '', '', '', 3, '', '529383c1e95f224db630befc5b47a2cc'),
(201, 'denuncia', 514, '2021-04-22', 1, 2, 1, '00425/2021', '2021', '', '', '', '', 3, '', '981af0c5e3e51d1020b9bf3f21c7b5bc'),
(209, 'denuncia', 513, '2021-04-23', 1, 2, 1, '00434/2021', '2021', '', '', '', '', 3, '', 'a27dc77d6e0de274ef26c2ca0dff2ff8'),
(210, 'denuncia', 532, '2021-03-05', 1, 4, 5, '00233/2021', '2021', '78/2021-GAB02', '2021', '', '', 3, '', '5da776ad7a6c119a70905211a1c4341b'),
(211, 'denuncia', 533, '2021-05-26', 1, 4, 4, '00639/2021', '2021', '099/2021', '2021', '', '', 2, '', 'e10f69692285b2ec08bb78ac2ef2e5d8'),
(212, 'denuncia', 539, '2020-12-03', 1, 4, 4, '1560/2020', '2020', '328/2020', '2020', '', '', 2, '030', 'ba9a1108211208cde59c77000fab7a93'),
(213, 'denuncia', 524, '2021-05-25', 1, 4, 4, '00611/2021', '2021', '072/2021', '2021', '', '', 2, '015', '8ee40c84e31f7ec2b9543e7f507c7ff3'),
(214, 'denuncia', 525, '2021-03-02', 1, 4, 4, '00216/2021', '2021', '037/2021', '2021', '', '', 2, '015', 'e3fddf9a63ba1c6ba18bb4eeb7b8b592'),
(215, 'denuncia', 517, '2021-05-26', 1, 4, 4, '00636/2021', '2021', '095/2021-MP/6ªPJ', '2021', '', '', 2, '015', '18b6d12e566d8eb535c46eec7d17ff9f'),
(216, 'denuncia', 518, '2021-11-16', 1, 4, 4, '01477/2020', '2020', '297/2020', '2020', '', '', 2, '015', '466d72791d115be85c782fe6aa4e5877'),
(217, 'denuncia', 520, '2021-05-26', 1, 4, 4, '0068/2021', '2021', '098/2021', '2021', '', '', 2, '015', '3cdf438d006348fe3094db1cf883e756'),
(218, 'denuncia', 521, '2020-12-09', 1, 4, 4, '01587/2020', '2020', '339/2020', '2020', '', '', 2, '', '746d3b2b60aae610d2854c0783c19005'),
(219, 'denuncia', 36, '2021-06-08', 1, 4, 4, '00693/2021', '2021', '133/2021', '2021', '', '', 2, '', '48af6ae5ebf8a62df151dc7775dfc60e'),
(220, 'denuncia', 38, '2021-07-15', 1, 4, 4, '00901/2021', '2021', '177/2021', '2021', '', '', 2, '', 'a58702f63baa290fe98145f347640829'),
(221, 'denuncia', 27, '2021-07-20', 1, 4, 4, '00916/2021', '2021', '192/2021', '2021', '', '', 2, '', '7839a46288b8cca04d59c69595e960e6'),
(222, 'denuncia', 28, '0000-00-00', 1, 4, 4, '00917/2021', '2021', '187/2021', '2021', '', '', 2, '', '55be8a87c78bb4efb085ed5d6c75d253'),
(223, 'denuncia', 29, '2021-07-28', 1, 4, 4, '00950/2021', '2021', '204/2021', '2021', '', '', 2, '', '7ef512076af6b0cf91d7c92d869164f5'),
(224, 'denuncia', 31, '2021-08-04', 1, 4, 4, '00981/2021', '2021', '216/2021', '2021', '', '', 2, '', '9c340f3a09e3c26be69606acfd6c77b3'),
(225, 'denuncia', 32, '2021-08-04', 1, 4, 4, '00982/2021', '2021', '215/2021', '2021', '', '', 2, '', 'f4645d263dbedb941c573df3a0516ad1'),
(226, 'denuncia', 33, '2021-08-04', 1, 4, 4, '00983/2021', '2021', '221/2021', '2021', '', '', 2, '', '485c05dbd84ebd39eb8be60e33a22c35'),
(227, 'denuncia', 34, '2020-12-17', 1, 4, 4, '01631/2020', '2020', '350/2020', '2020', '', '', 2, '', '36c4e7421db597fe55b494545ee89e51'),
(228, 'denuncia', 35, '2021-05-25', 1, 4, 4, '00616/2021', '2021', '074/2021', '2021', '', '', 2, '', '0c2bf23f300e6eee28cef2808860dd16'),
(229, 'denuncia', 39, '2021-06-15', 1, 4, 4, '0725/2021', '2021', '143/2021', '2021', '', '', 2, '', '8afa1203dee217dd99d17d7a6a4d96a6'),
(230, 'denuncia', 40, '2021-07-15', 1, 4, 4, '00899/2021', '2021', '179/2021', '2021', '', '', 2, '', '31f0787e973044bc1e9f09a16389391b'),
(231, 'denuncia', 41, '2021-07-15', 1, 4, 4, '00902/2021', '2021', '178/2021', '2021', '', '', 2, '', 'c7f2f07bba58888eff5d80af0f9a4f1d'),
(232, 'denuncia', 42, '2021-07-20', 1, 4, 4, '00915/2021', '2021', '193/2021', '2021', '', '', 2, '', '15a5c2fb40832d3e6c1a940e886972f8'),
(233, 'denuncia', 21, '2021-07-15', 1, 4, 4, '00898/2021', '2021', '183/2021', '2021', '', '', 2, '', 'afd03c6e339d9d86cc4e16564f939fad'),
(234, 'denuncia', 22, '2021-07-15', 1, 4, 4, '00897/2021', '2021', '184/2021', '2021', '', '', 2, '', '8000ef203386a12b08dde1c8ddb9cf0e'),
(235, 'denuncia', 23, '2021-06-08', 1, 4, 4, '00691/2021', '2021', '135/2021', '2021', '', '', 2, '', 'e968c6a796ccb3e1db24fb58d18b3cdf'),
(236, 'denuncia', 25, '2021-06-08', 1, 4, 4, '00689/2021', '2021', '139/2021', '2021', '', '', 2, '', '753b6d860bedfe03d7d643b4b24c0b66'),
(237, 'denuncia', 26, '2021-06-08', 1, 4, 4, '00692/2021', '2021', '132/2021', '2021', '', '', 2, '', '65383bf01ef51f0707163aad82cac453'),
(238, 'denuncia', 91, '2021-10-21', 1, 4, 4, '01432/2021', '2021', '365/2021', '2021', '', '', 2, '', 'e8c2633a800741faa6e5e1ff43286658'),
(239, 'denuncia', 149, '2021-09-28', 1, 2, 1, '1318/2021', '2021', '', '', '', '', 3, '', '458386bac70a9b34b578b7f7feba1619'),
(240, 'denuncia', 92, '2021-10-21', 1, 4, 4, '01433/2021', '2021', '366/2021', '2021', '', '', 2, '020', '608636d18e0a2468a8b877fff624c2e6'),
(241, 'denuncia', 94, '2021-10-21', 1, 4, 4, '01435/2021', '2021', '361/2021', '2021', '', '', 2, '', '848a334505d59fcd16aa30f4ee308170'),
(242, 'denuncia', 93, '2021-10-21', 1, 4, 4, '01434/2021', '2021', '371/2021', '2021', '', '', 2, '', 'acef9a93b27495e8af72e1996dd5632a'),
(243, 'denuncia', 19, '2021-06-02', 1, 4, 4, '0671/2021', '2021', '094/2021', '2021', '', '', 2, '020', '04f69a96d697854e2d279a2f38c30e1b'),
(244, 'denuncia', 104, '2021-11-04', 1, 4, 4, '1483/2021', '2021', '369/2021', '2021', '', '', 2, '', '18112eac14f956f8f7bcf51f2b29cd54'),
(245, 'denuncia', 218, '2021-11-04', 1, 4, 4, '1484/2021', '2021', '375/2021', '2021', '', '', 2, '', 'c16f767f6cffb917ac45fcad8d5ee029'),
(246, 'denuncia', 531, '2021-02-02', 1, 4, 4, '00106/2021', '2021', '002/2021', '2021', '', '', 2, '', '6d33b5d2a465d131b474a9ef4b800063'),
(247, 'denuncia', 75, '2021-10-19', 1, 4, 4, '01415/2021', '2021', '377/2021', '2021', '', '', 2, '', 'ada68cc0512da320c40fcdc2fabb6bb9'),
(248, 'solicitacao', 545, '2021-11-25', 1, 4, 5, '1605/2021', '2021', '017/2021', '2021', '', '', 3, '', '63546c95c3927f5249f6e098cc23f695'),
(249, 'solicitacao', 545, '2021-11-25', 1, 4, 5, '1605/2021', '2021', '017/2021', '2021', '', '', 3, '', '7502bc034002dbf056257a77579eb07d'),
(250, 'solicitacao', 542, '2021-11-25', 1, 4, 4, '1604/2021', '2021', '446/2021', '2021', '', '', 2, '', '5c1cba43ba7c016bbf5144bd3ca1ca46');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_solicitacao`
--

CREATE TABLE `fisc_solicitacao` (
  `id` int(10) UNSIGNED NOT NULL,
  `protocolo_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) DEFAULT NULL,
  `tipo_solicitacao_id` int(11) NOT NULL,
  `solicitante` varchar(255) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cidade_id` int(10) UNSIGNED NOT NULL,
  `bairro_id` int(10) UNSIGNED NOT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_solicitacao`
--

INSERT INTO `fisc_solicitacao` (`id`, `protocolo_id`, `usuario_id`, `status`, `tipo_solicitacao_id`, `solicitante`, `telefone`, `email`, `descricao`, `endereco`, `cidade_id`, `bairro_id`, `latitude`, `longitude`) VALUES
(3, 46, 20, 1, 15, 'Condomínio Residencial Quinta do Lago', '', '', 'Vistoria no local para verificar o acúmulo de lixo de diversos tipos no canal que passa nos fundos do condomínio, que recebe as águas pluviais do Bairro Novo Estrela e da Rua 1º de Maio. Esse lixo e terra estão sendo jogados no açude  do Ibirapuera, que t', 'Tv. 1º de maio,2677', 1, 21, '', ''),
(4, 49, 20, 1, 15, 'SECULT', '91992277670', '', 'Solicita 10 tábuas de 6 metros  para serem usadas no andaime para montagem das árvores gigantes do Projeto Meu Querido Natal.', 'Rua Senador lemos,710', 1, 8, '', ''),
(6, 52, 20, 1, 9, 'SEMUTRAN', '', '', 'Solicitar 150 ripões 3,5 metros para postes de placas de sinalização vertical de trânsito.', 'Rua Senador Lemos,1023 Centro', 1, 8, '', ''),
(7, 54, 20, 1, 15, 'AMAZON POLPAS', '', '', 'Solicitação da cópia dos processos administrativos punitivos concernentes à Amazon Polpas', 'km 04 PA CASTANHAL-CURUÇA', 1, 38, '', ''),
(8, 55, 20, 1, 4, 'LEDWYLSON SILVA CORREA', '91984178032', '', 'ENTREGA VOLUNTARIA DE UM PAPAGAIO', 'ALAMEDA MALVINAS,228 PROX. ESCOLA CAIC', 1, 34, '', ''),
(9, 56, 20, 1, 9, 'HOSPITAL MUNICIPAL', '', '', 'SOLICITAÇÃO MADEIRA PARA FABRICAÇÃO DE ESTANTES PARA ARQUIVO NO HOSPITAL MINICIPAL', '', 1, 10, '', ''),
(30, 77, 34, 1, 9, 'SEMEL', '', '', 'Solicita 02 peças de madeira  de 04 metros para quadra de vôlei Praça do Tiro de Guerra.', '', 1, 12, '', ''),
(31, 78, 34, 1, 15, 'SEMEL', '', '', 'Solicita 02 peças de madeira de 04 metros para lateral do campo dos veteranos.', '', 1, 12, '', ''),
(32, 79, 34, 1, 15, 'SEMOB', '', '', 'SOLICITA 10 DUZIAS DE TABUAS FORTE PARA SEREM UTILIZADAS PARA FAZER UMA PONTE SOBRE O IGARAPE DA COMUNIDADE SAO JOAQUIM RAMAL NOSSA SENHORA , AGROVILA 03 DE OUTUBRO.', '', 1, 38, '', ''),
(33, 80, 34, 1, 15, 'SEMOB', '', '', 'SOLICITA 05 DUZIAS DE PRANCHÃO DE MADEIRA PARA SEREM UTILIZADOS EM OBRAS NESTA SECRETARIA.', '', 1, 12, '', ''),
(34, 81, 34, 1, 15, 'SEMOB', '', '', 'SOLICITA 02 DUZIAS DE RIPÕES PARA SEREM UTILIZADOS NO TAPUME DE FECHAMENTO DA PRAÇA DO CRISTO REDENTOR. ', '', 1, 10, '', ''),
(35, 82, 34, 1, 15, 'MEU QUERIDO NATAL', '', '', 'SOLICITA 10 (DEZ) TABUAS DE 06 METROS PARA SEREM USADOS NO ANDAIME PARA A MONTAGEM DAS ARVORES GIGANTES DO PROJETO MEU QUERIDO NATAL.', '', 1, 12, '', ''),
(36, 83, 34, 1, 15, 'SEMOB', '', '', 'SOLICITA 10(DEZ) DÚZIAS DE PERNAMANCA E 10 (DEZ) DÚZIAS DE RIPÕES PARA SEREM UTILIZADAS NO TRAPICHE DA AGROVILA DE MACAPAZINHO.', '', 1, 38, '', ''),
(37, 92, 20, 1, 15, 'SEMADA', '', '', 'SOLICITA 50 PERNA MANCAS E 60UNIDADES DE RIPAS PARA SEREM UTILIZADAS NO MODELO RURAL  NA AREA DO PARQUE DE EXPOSIÇOES.', '', 1, 10, '', ''),
(38, 93, 20, 1, 9, 'SEMOB', '', '', 'SOLICITA02 DUZIAS DE PRANCHA DE MADEIRA PARA SEREM UTILIZADAS NO ANDAIME DA CAIXA DAGUA', '', 1, 12, '', ''),
(39, 94, 20, 1, 9, 'SEMOB', '', '', '04 DUZIAS DE PRANCHÃO E 10 DUZIAS DE RIPÃO PARA SEREM UTILIZADAS NO TRAPICHE DA AGROVILA DE MACAPAZINHO', '', 1, 38, '', ''),
(46, 102, 20, 1, 15, '12ª SECCIONAL DO JADERLÂNDIA', '', '', 'SUPOSTO DESMATAMENTO QUE ESTARIA OCORRENDO NO SÍTIO SÃO FRANCISCO ', '', 1, 38, '', ''),
(47, 103, 20, 1, 15, 'CONDÔMINOS DO CONDOMÍNIO RESIDENCIAL QUINTA DO LAGO', '', '', 'SOLICITAR UMA VISTORIA NO LOCAL E INTEIRAR SOBRE ACÚMULO DE LIXO DE DIVERSOS TIPOS NO CANAL QUE PASSA AOS FUNDOS DO CONDOMÍNIO, QUE RECEBE AS ÁGUAS PLUVIAIS DO BAIRRO NOVO ESTRELA E DA RUA 1° DE MAIO.', '', 1, 21, '', ''),
(48, 108, 33, 1, 15, 'RAMOS ENGENHARIA', '', '', 'JUNTADA DE DOCUMENTOS AO PROCESSO Nº 1351/2019 COMO RESPOSTA A NOTIFICAÇÃO Nº 063/2021 E AUTO DE INFRAÇÃO Nº028/2021 DIRECIONADA A EMPRESA SÃO FRANCISCO INDUSTRIA E COM. DE POLPAS EIRELLI. ', '', 1, 38, '', ''),
(49, 112, 33, 1, 17, 'ANONIMO', '', '', 'ABERTURA DE PAP CONTRA MARIA FERREIRA DA LUZ,  REF. AUTO DE INFRAÇÃO Nº13/2021', '', 1, 6, '', ''),
(52, 115, 20, 2, 5, '5º BPM', '', '', 'SOLICITA APOIO PARA OPERAÇÃO SOSSEGO NO PERÍODO DE 05 À 28 DE NOVEMBRO DE 2021 ', '', 1, 5, '', ''),
(53, 118, 20, 1, 9, 'CPRN', '', '', 'SOLICITAÇAO DE MADEIRA PARA RAMPA DE ACESSO ESTANDE PARQUE DE EXPOSICOES', '', 1, 21, '', ''),
(54, 120, 20, 2, 8, 'MPPA', '', '', 'COMPARECIMENTO A PROMOTORIA DE JUSTIÇA NA DATA 17/11/2021 ÀS 10:00 HORAS, PARA REUNIÃO SOBRE OBRAS DE RECUPERAÇÃO DA ÁREA DE EROSÃO NO TERRENO ONDE SEENCONTRA A ESCOLO DE ARTES SÃO LUCAS, BAIRRO FONTE BOA.', '', 1, 14, '', ''),
(55, 161, 34, 1, 9, 'SEMUTRAN', '', '', 'Solicita 150 peças de madeira de 4 metros para postes de placas de sinalização vertical de trânsito.', '', 1, 8, '', ''),
(63, 248, 20, 2, 15, 'VEREADOR ROSIMAR POSSIDONIO DO NASCIMENTO', '', '', 'Convite para comparecer  a Câmara Municipal de Castanhal no dia 01/12/2021 a fim de prestar esclarecimentos acerca dos animais que transitam pelas ruas.', '', 1, 10, '', ''),
(64, 249, 20, 2, 15, 'VEREADOR ROSIMAR POSSIDONIO DO NASCIMENTO', '', '', 'Convite para comparecer  a Câmara Municipal de Castanhal no dia 01/12/2021 a fim de prestar esclarecimentos acerca dos animais que transitam pelas ruas.', '', 1, 10, '', ''),
(65, 250, 20, 1, 15, 'MPPA', '', '', '', '', 1, 8, '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_solicitante`
--

CREATE TABLE `fisc_solicitante` (
  `id` int(10) UNSIGNED NOT NULL,
  `solicitante` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_solicitante`
--

INSERT INTO `fisc_solicitante` (`id`, `solicitante`) VALUES
(1, 'Prefeitura Municipal de Castanhal'),
(2, 'Ministério Público do Estado do Pará'),
(3, 'Externo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_tipo_classificao`
--

CREATE TABLE `fisc_tipo_classificao` (
  `id` int(10) UNSIGNED NOT NULL,
  `infracao_id` int(10) UNSIGNED NOT NULL,
  `classificacao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_tipo_classificao`
--

INSERT INTO `fisc_tipo_classificao` (`id`, `infracao_id`, `classificacao`) VALUES
(1, 1, 'Animais Domésticos'),
(2, 1, 'Animais Sinantrópicos'),
(3, 1, 'Animais Silvestres'),
(4, 7, 'Em Área de APP'),
(5, 7, 'Em Terreno Particular'),
(6, 7, 'Em Terreno Próprio'),
(7, 7, 'Em Terreno Público'),
(8, 9, 'Em Área de APP'),
(9, 9, 'Em Terreno Particular'),
(10, 9, 'Em Terreno Próprio'),
(11, 9, 'Em Via Pública'),
(12, 12, 'Em Corpo Hídrico'),
(13, 12, 'De Origem Domésticos'),
(14, 12, 'De Origem Industriais'),
(15, 12, 'Em Via Pública'),
(16, 13, 'Em Via Pública'),
(17, 13, 'Em Terreno Particular');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_tipo_denuncia`
--

CREATE TABLE `fisc_tipo_denuncia` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_denuncia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_tipo_denuncia`
--

INSERT INTO `fisc_tipo_denuncia` (`id`, `tipo_denuncia`) VALUES
(1, 'Fauna'),
(2, 'Flora'),
(3, 'Degradação / Poluição'),
(4, 'Efluentes'),
(5, 'Resíduos Sólidos'),
(6, 'Poluição Sonora'),
(7, 'Poluição Atmosférica'),
(8, 'Administrativa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_tipo_documento`
--

CREATE TABLE `fisc_tipo_documento` (
  `id` int(10) UNSIGNED NOT NULL,
  `documento` varchar(100) DEFAULT NULL,
  `protocolo_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_tipo_documento`
--

INSERT INTO `fisc_tipo_documento` (`id`, `documento`, `protocolo_id`) VALUES
(1, 'E-mail', 1),
(2, 'Formulário de Denúncia', 1),
(3, 'Memorando', 1),
(4, 'Ofício', 1),
(5, 'Outros', 1),
(6, 'Processo Administrativo Punitivo', 2),
(7, 'Requerimento', 1),
(8, 'Doação de Madeira', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_tipo_infracao`
--

CREATE TABLE `fisc_tipo_infracao` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_denuncia_id` int(10) UNSIGNED NOT NULL,
  `infracao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_tipo_infracao`
--

INSERT INTO `fisc_tipo_infracao` (`id`, `tipo_denuncia_id`, `infracao`) VALUES
(1, 1, 'Maus Tratos Contra Animais'),
(2, 1, 'Tráfico de Animais '),
(3, 1, 'Caça'),
(4, 1, 'Animal em Cativeiro sem Registro'),
(5, 1, 'Pesca Ilegal'),
(6, 1, 'Outros'),
(7, 2, 'Desmatamento'),
(8, 2, 'Queima Ilegal de Vegetação'),
(9, 2, 'Supressão Vegetal sem Autorização de Orgão Ambiental'),
(10, 3, 'Construção em Área de Preservação Permanente (APP)'),
(11, 3, 'Extração de Mineral Sem Autorização de Orgão Ambiental'),
(12, 4, 'Lançamentos Irregular de Efluentes'),
(13, 5, 'Descarte Irregular'),
(14, 6, 'Fonte: Estabelecimentos Comerciais '),
(15, 6, 'Fonte: Residências'),
(16, 6, 'Fonte: Bar'),
(17, 6, 'Fonte: Casa de Show'),
(18, 6, 'Fonte: Automóvel'),
(19, 6, 'Fonte: Construção '),
(20, 7, 'Fonte: Residências'),
(21, 7, 'Fonte: Estabelecimentos Comerciais '),
(22, 7, 'Fonte: Estabelecimentos Industriais'),
(23, 7, 'Fonte: Queima de Resíduos Domésticos'),
(24, 7, 'Fonte: Emissão de Fumaça'),
(25, 8, 'Cumprimento de Condicionantes Intepestivo'),
(26, 8, 'Indeferimento de Processo de Licenciamento'),
(27, 8, 'Funcionamento de Empreendimento sem Licença Ambiental'),
(28, 3, 'Erosão do Solo'),
(29, 6, 'Fonte: Estabelecimentos Industriais'),
(31, 6, 'Fonte: Igreja');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_tipo_protocolo`
--

CREATE TABLE `fisc_tipo_protocolo` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_protocolo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_tipo_protocolo`
--

INSERT INTO `fisc_tipo_protocolo` (`id`, `tipo_protocolo`) VALUES
(1, 'Documento'),
(2, 'Processo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_tipo_solicitacao`
--

CREATE TABLE `fisc_tipo_solicitacao` (
  `id` int(11) NOT NULL,
  `tipo_solicitacao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_tipo_solicitacao`
--

INSERT INTO `fisc_tipo_solicitacao` (`id`, `tipo_solicitacao`) VALUES
(1, 'Armazenamento de Madeira'),
(2, 'Atividade de Fiscalização'),
(3, 'Captura de Animais Domésticos'),
(4, 'Captura de Animais Silvestres'),
(5, 'Colaboração'),
(6, 'Convênio'),
(7, 'Convite'),
(8, 'Convocação'),
(9, 'Doação de Madeira'),
(10, 'Elaboração de Projeto'),
(11, 'Entrega de Defesa de Auto de Infração'),
(12, 'Entrega de Documentações Pendentes'),
(13, 'Informações'),
(14, 'Nota Técnica'),
(15, 'Ofício'),
(16, 'Outros'),
(17, 'Parece Técnico'),
(18, 'Processo'),
(19, 'Prorrogação de Prazo'),
(20, 'Relatório de Fiscalização');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_vistoria_denuncia`
--

CREATE TABLE `fisc_vistoria_denuncia` (
  `id` int(10) UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `instrumento` text NOT NULL,
  `denuncia_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fisc_vistoria_denuncia`
--

INSERT INTO `fisc_vistoria_denuncia` (`id`, `data`, `descricao`, `instrumento`, `denuncia_id`) VALUES
(36, '2021-11-16', 'Foi realizada fiscalização pelas agentes Louysse Monteiro e Josy Senna, na qual em conversa o responsável pela clínica, Sergio Medeiros foi informado da solicitação, o mesmo já havia tomado algumas providências a respeito, conversando com a  requerente. ', 'VII – Relatório de Fiscalização Ambiental; ', 58);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisc_vistoria_solicitacao`
--

CREATE TABLE `fisc_vistoria_solicitacao` (
  `id` int(10) UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `instrumento` text NOT NULL,
  `solicitacao_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lic_enquadramento`
--

CREATE TABLE `lic_enquadramento` (
  `cod` int(11) UNSIGNED NOT NULL,
  `anexo` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `tipologia` text NOT NULL,
  `unidade` varchar(255) NOT NULL,
  `potencial` varchar(255) NOT NULL,
  `modalidade` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `lic_enquadramento`
--

INSERT INTO `lic_enquadramento` (`cod`, `anexo`, `categoria`, `tipologia`, `unidade`, `potencial`, `modalidade`) VALUES
(1, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Criação de caprinos e ovinos', 'NCC - N° DE CABEÇAS / CRIAÇÃO (Unidade)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(2, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Criação de suínos', 'NCC - N° DE CABEÇAS / CRIAÇÃO (Unidade)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(3, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'AGROSILVIPASTORIL', 'Avicultura para postura e abate (frango, codorna e outros)', 'NA – NÚMERO DE AVES (Abate / Postura)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(4, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Criação de avestruz', 'NA – NÚMERO DE AVES (Abate / Postura)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(5, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Criação de equinos - equinocultura', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(6, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Criação de bovinos', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(7, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Criação de bubalinos', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(8, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Helicicultura', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(9, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Cunicultura', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(10, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Cultura de ciclo curto', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(11, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Cultura de ciclo longo', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(12, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Cultivo de plantas medicinais e aromáticas', 'AUH - ÁREA ÚTIL (Ha) ', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(13, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Cultivo flores e plantas ornamentais', 'AUH - ÁREA ÚTIL (Ha) ', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(14, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Sistemas agroflorestal e agrossilvipastoril', 'ATH - ÁREA TOTAL (Ha)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(15, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AGROSILVIPASTORIL', 'Reflorestamento', 'AUH - ÁREA ÚTIL (Ha) ', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(16, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Carcinicultura nativa em viveiro escavado', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(17, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Comercialização e manejo de recursos aquáticos vivos', 'NCA – NÚMERO DE CABEÇA ANO', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(18, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Ostreicultura nativa', 'AUH - ÁREA ÚTIL (Ha) ', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(19, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Estação de larvicultura de espécies nativas', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(20, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Piscicultura nativa em tanques', 'V – VOLUME (m3)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(21, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Piscicultura nativa em tanques/raceway, inclusive espécies ornamentais', 'V – VOLUME (m3)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(22, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Piscicultura nativa em tanque rede, inclusive áreas em parques aquícolas', 'V – VOLUME (m3)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(23, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Piscicultura nativa em viveiro escavado e barragem, inclusive espécies ornamentais', 'AUH - ÁREA ÚTIL (Ha) ', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(24, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Piscicultura de pesque e pague / pesque e solte', 'ATH - ÁREA TOTAL (Ha)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(25, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Policultivo de piscicultura com carcinicultura, espécie nativa', 'AUH - ÁREA ÚTIL (Ha) ', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(26, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Ranicultura', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(27, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Tabuleiro de reprodução de quelônios e jacarés com fins científicos', 'ATH - ÁREA TOTAL (Ha)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(28, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Comércio varejista de animais vivos, excetoanimais aquáticos vivos, e de artigos e alimentos para animais de estimação', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(29, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Malacocultura terrestre', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(30, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'AQUICULTURA E PESCA', 'Infra estrutura especializada em turismo de pesca esportiva', 'ATH - ÁREA TOTAL (Ha)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(31, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'COMÉRCIO ATACADISTA DE PRODUTOS INFLAMÁVEIS / QUÍMICOSE POSTOS DE SERVIÇOS / ABASTECIMENTO', 'Posto Revendedor, Posto de Abastecimento, Posto Varejista de Querosene e Gasolina de Aviação, exceto Posto Flutuante', 'CAM – CAPACIDADE DE ARMAZENAMENTO (m3)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(32, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'COMÉRCIO ATACADISTA DE PRODUTOS INFLAMÁVEIS / QUÍMICOSE POSTOS DE SERVIÇOS / ABASTECIMENTO', 'Terminais/Bases de distribuição de combustíveis e lubrificantes e Transportador Revendedor Retalhista (TRR), exceto Transportador Revendedor Retalhista naNavegação Interior (TRRNI)', 'CAM – CAPACIDADE DE ARMAZENAMENTO (m3)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(33, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'COMÉRCIO ATACADISTA DE PRODUTOS INFLAMÁVEIS / QUÍMICOSE POSTOS DE SERVIÇOS / ABASTECIMENTO', 'Descomissionamento de Posto Revendedor, Posto de Abastecimento, Posto Varejista de Querosene e Gasolina de Aviação', 'CAM – CAPACIDADE DE ARMAZENAMENTO (m3)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(34, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'COMÉRCIO ATACADISTA DE PRODUTOS INFLAMÁVEIS / QUÍMICOSE POSTOS DE SERVIÇOS / ABASTECIMENTO', 'Instalação/ substituição de tanques e/ou equipamentos com ou sem reforma, desde que o posto tenha sido licenciado no município', 'CAM – CAPACIDADE DE ARMAZENAMENTO (m3)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(35, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'COMÉRCIO ATACADISTA DE PRODUTOS INFLAMÁVEIS / QUÍMICOSE POSTOS DE SERVIÇOS / ABASTECIMENTO', 'Comércio atacadista e armazenamento de gás', 'CAT – CAPACIDA DE ARMAZENAMENTO (Ton.)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(36, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'COMÉRCIO ATACADISTA DE PRODUTOS INFLAMÁVEIS / QUÍMICOSE POSTOS DE SERVIÇOS / ABASTECIMENTO', 'Comércio atacadista e armazenamento de álcool carburante, combustíveis derivados depetróleo e lubrificantes especificados (classificados) ou não', 'CAM – CAPACIDADE DE ARMAZENAMENTO (m3)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(37, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'COMÉRCIO ATACADISTA DE PRODUTOS INFLAMÁVEIS / QUÍMICOSE POSTOS DE SERVIÇOS / ABASTECIMENTO', 'Comércio atacadista e armazenamento de produtos químicos', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(38, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'COMÉRCIO ATACADISTA DE PRODUTOS INFLAMÁVEIS / QUÍMICOSE POSTOS DE SERVIÇOS / ABASTECIMENTO', 'Comércio atacadista e armazenamento de biocombustível (álcool, biodiesel)', 'CAM – CAPACIDADE DE ARMAZENAMENTO (m3)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(39, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Parcelamento do solo / loteamento / desmembramento, sem fracionamento', 'ATH - ÁREA TOTAL (Ha)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(40, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Conjunto habitacional de interesse social', 'ATH - ÁREA TOTAL (Ha)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(41, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Condomínio habitacional horizontal, sem fracionamento', 'NUH – NÚMERO DE UNIDADES HABITACIONAIS (Unidade)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(42, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Requalificação ambiental de áreas urbanas antropizadas / descaracterizadas', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(43, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Edificação unifamiliar, em áreas protegidas ou sensíveis', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(44, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Autódromo e kartódromo', 'ATH - ÁREA TOTAL (Ha)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(45, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Hipódromo', 'ATH - ÁREA TOTAL (Ha)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(46, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Cais / muro de arrimo ou contenção, sem urbanização', 'CPM – COMPRIMENTO (Metro)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(47, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Cais / muro de arrimo ou contenção, com urbanização', 'CPM – COMPRIMENTO (Metro)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(48, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Dragagem em cursos d’água', 'VM – VOLUME DE MATERIAL MOVIMENTADO (m³)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(49, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Derrocamento em cursos d’água', 'VM – VOLUME DE MATERIAL MOVIMENTADO (m³)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(50, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Barragem e/ou dique para formação de açude e/ou perenização de lago', 'AI - ÁREA INUNDADA (Ha)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(51, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Heliporto / heliponto', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(52, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Ponte e pontilhão, em corpo hídrico, sem navegabilidade', 'CPM – COMPRIMENTO (Metro)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(53, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Pátio regulador (triagem) de caminhões com atividades de apoio que geram resíduosperigosos', 'NCD – NÚMERO DE CAMINHÃO DIA', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(54, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Pátio regulador (triagem) de caminhões', 'NCD – NÚMERO DE CAMINHÃO DIA', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(55, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Estabelecimentos Pré-Embarque', 'NCD – NÚMERO DE CAMINHÃO DIA', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(56, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Instalação portuária dentro ou fora do porto organizado, terminal de uso privado eestação de transbordo somente para cargas não perigosas', 'MTM - MOVIMENTAÇÃO (Ton./Mês)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(57, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Instalação portuária dentro ou fora do porto organizado, terminal de uso privado e estação de transbordo para cargas em geral,incluindo perigosas', 'MTM - MOVIMENTAÇÃO (Ton./Mês)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(58, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Instalação portuária de passageiros, definalidade turística, trapiche, ancoradouro, rampa de acesso e marina', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(59, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Cemitério', 'NJ – NÚMERO DE JAZIGOS', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(60, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Descomissionamento do cemitério', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(61, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Hospital, clínicas e congêneres, exceto com radioterapia e quimioterapia', 'NL – NÚMERO DE LEITOS (Unidade)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(62, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Serviços de diagnóstico por registro gráfico/ métodos ópticos – ECG, EEG, endoscopia eoutros exames análogos', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(63, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Laboratórios de análises clínicas, biológicas,radiológicas, físico-químicas e outros análogos', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(64, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Atividades de serviços de complementação diagnóstica e terapêutica não especificadas anteriormente', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(65, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Complexo turístico', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(66, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Hotel/Apart-Hotel em áreas sensíveis ou áreas protegidas', 'NL – NÚMERO DE LEITOS (Unidade)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(67, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Pousada em áreas sensíveis ou protegidas', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(68, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Parque temático/diversão', 'ATH - ÁREA TOTAL (Ha)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(69, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Hotel de ecoturismo /hotel fazenda', 'AUH - ÁREA ÚTIL (Ha) ', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(70, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Pátio de estocagem de minério/coque', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(71, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Clínica de reabilitação/tratamento para a dependência química', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(72, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Serviços de hemoterapia/bancos de células etecidos humanos', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(73, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OBRAS CIVIS E DE INFRA- ESTRUTURAS', 'Implantação de equipamentos comunitários (cultura, saúde, lazer e similares)', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(74, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'COMÉRCIO, TRANSPORTE E SERVIÇOS DE SUBSTÂNCIAS / PRODUTOS PERIGOSOS E POLUENTES', 'Prestação de serviços com substâncias e produtos perigosos/fitossanitários/domissanitários com utilização de controle de pragas e vetores,dentro do limite municipal', 'CA - CLIENTELA ATENDIDA (Mensal)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(75, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'PESQUISA, LAVRA E BENEFICIAMENTO MINERAL', 'Lavra garimpeira (PLG) – minerais garimpáveis', 'AR - ÁREA REQUERIDA NO DNPM (Ha)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(76, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'PESQUISA, LAVRA E BENEFICIAMENTO MINERAL', 'Extração de areia, cascalho, argila e seixo, dentro de corpos hídricos', 'AR - ÁREA REQUERIDA NO DNPM (Ha)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(77, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'PESQUISA, LAVRA E BENEFICIAMENTO MINERAL', 'Extração de areia, saibro, cascalho, argila e seixo, fora de corpos hídricos, com ou sembeneficiamento associado', 'AR - ÁREA REQUERIDA NO DNPM (Ha)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(78, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'PESQUISA, LAVRA E BENEFICIAMENTO MINERAL', 'Extração de rocha ornamental (granito/basalto/etc.)', 'AR - ÁREA REQUERIDA NO DNPM (Ha)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(79, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'PESQUISA, LAVRA E BENEFICIAMENTO MINERAL', 'Extração de rochas para uso imediato na construção civil (brita ou pedra de talhe)', 'AR - ÁREA REQUERIDA NO DNPM (Ha)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(80, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'PESQUISA, LAVRA E BENEFICIAMENTO MINERAL', 'Extração e beneficiamento de gema', 'AR - ÁREA REQUERIDA NO DNPM (Ha)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(81, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'PESQUISA, LAVRA E BENEFICIAMENTO MINERAL', 'Fechamento de mina', 'AR - ÁREA REQUERIDA NO DNPM (Ha)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(82, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'PESQUISA, LAVRA E BENEFICIAMENTO MINERAL', 'Britagem de rochas para uso imediato na construção civil', 'VPTD - VOLUME DE PRODUÇÃO (t / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(83, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'GERAÇÃO, TRANSMISSÃO E DISTRIBUIÇÃO DE ENERGIAELÉTRICA', 'Micro e pequena central hidrelétrica, sem formação de reservatório', 'P – POTÊNCIA (Kw)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(84, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'GERAÇÃO, TRANSMISSÃO E DISTRIBUIÇÃO DE ENERGIAELÉTRICA', 'Parque solar', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(85, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'GERAÇÃO, TRANSMISSÃO E DISTRIBUIÇÃO DE ENERGIAELÉTRICA', 'Parque eólico', 'P – POTÊNCIA (Kw)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(86, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'GERAÇÃO, TRANSMISSÃO E DISTRIBUIÇÃO DE ENERGIAELÉTRICA', 'Sistema de distribuição (LD e SE)', 'T - Tensão (kV)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(87, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'GERAÇÃO, TRANSMISSÃO E DISTRIBUIÇÃO DE ENERGIAELÉTRICA', 'Linha de distribuição', 'T - Tensão (kV)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(88, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'GERAÇÃO, TRANSMISSÃO E DISTRIBUIÇÃO DE ENERGIAELÉTRICA', 'Rede de Distribuição Rural - RDR', 'T - Tensão (kV)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(89, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'GERAÇÃO, TRANSMISSÃO E DISTRIBUIÇÃO DE ENERGIAELÉTRICA', 'Subestação', 'T - Tensão (kV)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(90, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'GERAÇÃO, TRANSMISSÃO E DISTRIBUIÇÃO DE ENERGIAELÉTRICA', 'Usina termelétrica à biomassa', 'P – POTÊNCIA (Kw)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(91, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PAPEL E CELULOSE', 'Fabricação de papel e papelão', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(92, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PAPEL E CELULOSE', 'Indústria de celulose', 'VPTA – VOLUME DE PRODUÇAÕ (t/ano)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(93, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Abate de aves', 'NDC - N° DE CABEÇAS (Unidade/Dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(94, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Matadouro/Frigorifico, exceto aves', 'NDC - N° DE CABEÇAS (Unidade/Dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(95, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Beneficiamento/ moagem de produtos alimentares', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(96, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Beneficiamento de açaí', 'VPTD - VOLUME DE PRODUÇÃO (t / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(97, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Beneficiamento de leite e industrialização deleite e derivados (iogurte, leite, sorvete, coalhada etc.)', 'VPL - VOLUME DE PRODUÇÃO (l / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(98, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Fabricação de bebidas alcoólicas', 'VPL - VOLUME DE PRODUÇÃO (l / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(99, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Fabricação de bebidas não alcoólicas', 'VPL - VOLUME DE PRODUÇÃO (l / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(100, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Refino / preparação de óleo e gordura vegetal', 'VPTD - VOLUME DE PRODUÇÃO (t / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(101, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Preparação de derivados do leite (queijo, manteiga, requeijão)', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(102, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Fabricação de produtos alimentícios', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(103, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Envase de bebidas, exceto água mineral', 'VPL - VOLUME DE PRODUÇÃO (l / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(104, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS MINERAIS NÃO METALICOS', 'Aparelhamento de pedras para construção eexecução de trabalhos em mármore, ardósia, granito e outras pedras', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(105, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DE PRODUTOS MINERAIS NÃO METALICOS', 'Fabricação de cal virgem, hidratada ou extinta', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(106, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS MINERAIS NÃO METALICOS', 'Fabricação de produtos cerâmicos não-refratários para uso estrutural na construção', 'VPP – POTÊNCIA (Kw)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(107, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MECÂNICA', 'Fabricação de motores de combustão interna', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(108, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MECÂNICA', 'Fabricação de embarcações e de peças e acessórios (estaleiro)', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(109, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MECÂNICA', 'Fabricação de máquinas, aparelhos, peças e equipamentos não elétricos para transmissão e instalação hidráulicas, pneumáticas, térmicas, de ventilação, de refrigeração eoutros', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(110, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MECÂNICA', 'Fabricação de máquinas, aparelhos, peças e acessórios com / sem tratamento térmico e/ou tratamento de superfície e/ou fundição', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(111, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA METALÚRGICA E SIDERÚRGICA', 'Metalurgia de metais preciosos', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(112, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA METALÚRGICA E SIDERÚRGICA', 'Produção de soldas e anodos', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(113, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA METALÚRGICA E SIDERÚRGICA', 'Serviços de usinagem, solda, tratamento e revestimento em metais', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(114, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA METALÚRGICA E SIDERÚRGICA', 'Tratamento de metais', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(115, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA QUÍMICA', 'Extração de óleos brutos, de óleos de essências vegetais e de matérias graxasanimais', 'VPTD - VOLUME DE PRODUÇÃO (t / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(116, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA QUÍMICA', 'Fabricação de preparados para limpeza, desinfetantes, inseticidas e afins', 'VPL - VOLUME DE PRODUÇÃO (l / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(117, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA QUÍMICA', 'Fabricação produtos farmacêutico, medicinais e veterinários', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(118, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA QUÍMICA', 'Fabricação de cosméticos, produtos de perfumaria e de higiene pessoal', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(119, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA QUÍMICA', 'Fabricação de sabões, detergente e glicerina, inclusive sintéticos', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(120, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA QUÍMICA', 'Fabricação de laminados planos e tubulares de material plástico', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(121, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA QUÍMICA', 'Produção de álcool', 'VPL - VOLUME DE PRODUÇÃO (l / dia)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(122, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA QUÍMICA', 'Fabricação de couro sintético', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(123, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA TEXTIL', 'Acabamento de fios e tecidos, não processado em fiações e tecelagens', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(124, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA TEXTIL', 'Beneficiamento de fibras têxteis, vegetal, animal e sintéticas', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(125, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MADEIREIRA', 'Desdobro de madeira em tora para madeira serrada /laminada/ faqueada', 'VPA – VOLUME PRODUZIDO ANUAL SERRADO, LAMINADO/FAQUEADO(m³/ano)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(126, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MADEIREIRA', 'Desdobro de madeira em tora para produção de madeira serrada e seu beneficiamento/secagem', 'VPA – VOLUME PRODUZIDO ANUAL SERRADO, LAMINADO/FAQUEADO(m³/ano)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(127, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MADEIREIRA', 'Desdobro de madeira em tora para produçãode lâminas de madeira para fabricação de compensados', 'VPA – VOLUME PRODUZIDO ANUAL SERRADO, LAMINADO/FAQUEADO(m³/ano)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(128, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MADEIREIRA', 'Beneficiamento de madeira', 'VPA – VOLUME PRODUZIDO ANUAL SERRADO, LAMINADO/FAQUEADO(m³/ano)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(129, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MADEIREIRA', 'Beneficiamento e secagem de madeira serrada', 'VPA – VOLUME PRODUZIDO ANUAL SERRADO, LAMINADO/FAQUEADO(m³/ano)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(130, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MADEIREIRA', 'Produção de compensados', 'VPA – VOLUME PRODUZIDO ANUAL SERRADO, LAMINADO/FAQUEADO(m³/ano)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(131, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MADEIREIRA', 'Briqueteiras/pellets', 'VPTA – VOLUME DE PRODUÇAÕ (t/ano)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(132, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MADEIREIRA', 'Secagem/ bitolagem de madeira para comércio e/ou exportação', 'VPA – VOLUME PRODUZIDO ANUAL SERRADO, LAMINADO/FAQUEADO(m³/ano)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(133, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MADEIREIRA', 'Aproveitamento de aparas de madeireiras', 'VPA – VOLUME PRODUZIDO ANUAL SERRADO, LAMINADO/FAQUEADO(m³/ano)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário'),
(134, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA MADEIREIRA', 'Produção de cavaco', 'VPA – VOLUME PRODUZIDO ANUAL SERRADO, LAMINADO/FAQUEADO(m³/ano)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(135, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DIVERSA', 'Produção de concreto e argamassa', 'VPM – VOLUME DE PRODUCAO (m3/ mês)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(136, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DIVERSA', 'Usina de asfalto, inclusive móvel', 'VPTD - VOLUME DE PRODUÇÃO (t / dia)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(137, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DIVERSA', 'Fabricação de lâmpadas', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(138, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'INDÚSTRIA DIVERSA', 'Fabricação de resinas plásticas e fibras artificiais', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(139, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'SANEAMENTO', 'Captação, tratamento, distribuição de água potável sem o uso de barragem de acumulação, exceto sistemas públicos estaduais', 'PA - POPULAÇÃO ATENDIDA EM N° DE HABITANTES (Unidade)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(140, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'SANEAMENTO', 'Canalização/retificação de cursos d\'águas em áreas urbanas', 'CPK - COMPRIMENTO (Km)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(141, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'SANEAMENTO', 'Coleta, transporte, estação elevatória, tratamento e destinação final de esgotos sanitários', 'VTD – VOLUME TRATADO (m³/dia)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(142, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'SANEAMENTO', 'Complexo de destinação final de resíduos sólidos urbanos – Aterro, reciclagem, compostagem, com ou sem incineração (População atendida pelo sistema)', 'PA - POPULAÇÃO ATENDIDA EM N° DE HABITANTES (Unidade)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(143, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'SANEAMENTO', 'Aterro sanitário, sem fracionamento', 'PA - POPULAÇÃO ATENDIDA EM N° DE HABITANTES (Unidade)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(144, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'SANEAMENTO', 'Pirólise para tratamento de resíduos sólidos urbanos, exceto incineração', 'PA - POPULAÇÃO ATENDIDA EM N° DE HABITANTES (Unidade)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(145, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'SANEAMENTO', 'Interceptores e emissários de esgotos sanitários (população atendida pelo sistema)', 'PA - POPULAÇÃO ATENDIDA EM N° DE HABITANTES (Unidade)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(146, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'SANEAMENTO', 'Remediação de áreas contaminadas por lançamento de resíduos sólidos urbanos', 'CA - CLIENTELA ATENDIDA (Mensal)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(147, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OUTRAS TIPOLOGIA NÃO CLASSIFICADAS OU NÃOESPECIFICADAS', 'Usina de cogeração de energia', 'PK - POTÊNCIA (KVA)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(148, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OUTRAS TIPOLOGIA NÃO CLASSIFICADAS OU NÃOESPECIFICADAS', 'Aterro industrial', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(149, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OUTRAS TIPOLOGIA NÃO CLASSIFICADAS OU NÃOESPECIFICADAS', 'Interceptores e emissários de esgoto industrial', 'COM', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(150, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OUTRAS TIPOLOGIA NÃO CLASSIFICADAS OU NÃOESPECIFICADAS', 'Remediação de áreas contaminadas por hidrocarboneto e/ou substâncias e produtos perigosos', 'VMC – VOLUME DE MATERIAL CONTAMINADO (m³)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário'),
(151, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OUTRAS TIPOLOGIA NÃO CLASSIFICADAS OU NÃOESPECIFICADAS', 'Sistema de tratamento de emissões atmosféricas', 'VSP – POTÊNCIA (Kw)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(152, 'ANEXO I - 153 Tipologias de impacto local até o limite definido pelo porte do empreendimento', 'OUTRAS TIPOLOGIA NÃO CLASSIFICADAS OU NÃOESPECIFICADAS', 'Sistema/Estações de tratamento de efluentes industriais', 'ATM - AREA TOTAL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário'),
(153, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'AGROSILVIPASTORIL', 'Manejo de açaizais', 'AUH - ÁREA ÚTIL (Ha) ', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(154, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'AGROSILVIPASTORIL', 'Extração de palmito (Área plantada)', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado '),
(155, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'AGROSILVIPASTORIL', 'Apicultura sem beneficiamento', 'NCO – NÚMERO DE COLMEIAS (Unidades)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(156, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'AGROSILVIPASTORIL', 'Viveiro de mudas', 'AUH - ÁREA ÚTIL (Ha) ', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(157, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'AQUICULTURA E PESCA', 'Carcinicultura exótica em sistemas fechados', 'V – VOLUME (m3)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(158, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'AQUICULTURA E PESCA', 'Terminal ou entreposto pesqueiro com beneficiamento de pescados', 'VPTD - VOLUME DE PRODUÇÃO (t / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(159, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'AQUICULTURA E PESCA', 'Terminal ou entreposto de recepção de armazenamento, comercialização e/oufrigorificação de pescado', 'VPTD - VOLUME DE PRODUÇÃO (t / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(160, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'AQUICULTURA E PESCA', 'Unidade de beneficiamento de pescados', 'VPTD - VOLUME DE PRODUÇÃO (t / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(161, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'AQUICULTURA E PESCA', 'Aproveitamento de resíduos de pescado', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado '),
(162, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de carnes – açougues', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(163, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de lubrificantes', 'CAM – CAPACIDADE DE ARMAZENAMENTO (m3)', 'ALTO (III)', 'Dispensa de Licenciamento Ambiental '),
(164, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de gás liquefeito de petróleo (GLP)', 'CAT – CAPACIDA DE ARMAZENAMENTO (Tonelada)', 'ALTO (III)', 'Licenciamento Ambiental Simplificado'),
(165, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de equipamentos de informática e comunicação', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(166, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de artigos culturais, recreativos e esportivos', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(167, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de produtos de perfumaria e cosméticos e artigos médicos, ópticos e ortopédicos e higiene pessoal', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(168, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de artigos de colchoaria, somente a comercialização (venda)', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(169, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de mercadorias em geral, compredominância de produtos alimentícios – minimercados, mercearias e armazéns', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(170, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de mercadorias em lojas de conveniência', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(171, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de pescados e frutos do mar', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(172, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de jornais e revistas (bancas de revistas)', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(173, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de livros', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(174, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de artigos de papelaria', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(175, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de artigos de ótica (óculos, armações, lentes de contato e outros artigos óticos)', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(176, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de artigos médicos e ortopédicos (Máquinas e equipamentos odontológicos, médicos, hospitalares e laboratoriais)', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(177, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de produtos de cama, mesa e banho', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(178, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de armas e munições', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(179, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de hortifrutigranjeiros', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(180, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de artigos de caça, pesca e camping', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(181, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de embarcações e outros veículos recreativos; peças e acessórios', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(182, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de ferragens, madeira e materiais de construção', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental ');
INSERT INTO `lic_enquadramento` (`cod`, `anexo`, `categoria`, `tipologia`, `unidade`, `potencial`, `modalidade`) VALUES
(183, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de tintas e materiais para pintura', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(184, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de material elétrico', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(185, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de vidro', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(186, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de plantas e flores naturais', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(187, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de animais vivos e de artigos e alimentos para animais de estimação', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(188, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de produtos saneantes domissanitários', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(189, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de fogos de artifício e artigos pirotécnicos', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(190, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de armas e munições', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(191, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de materiais metálicos e não- metálicos (Sucataria)', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(192, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de produtos farmacêuticos, sem manipulação de fórmulas', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(193, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de produtos farmacêuticos, com manipulação de fórmulas', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(194, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio varejista de medicamentos homeopáticos', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(195, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio a varejo de automóveis, camionetas e utilitários usados', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(196, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio a varejo de automóveis, camionetas e utilitários novos', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(197, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Comércio de peças e acessórios para veículos automotores (e/ou motocicletas)', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(198, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO VAREJISTA', 'Padaria e confeitaria com predominância de produção própria', 'VPK - POTÊNCIA (KVA)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(199, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de equipamentos de informática e comunicação', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(200, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio por atacado de caminhões novos e usados', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(201, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio por atacado de ônibus e micro-ônibus novos e usados', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(202, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de mercadorias em geral, com predominância de insumos agropecuários, exceto agrotóxico', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(203, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de cerveja, chope, vinho, cachaça, refrigerante e outras bebidas com atividade de fracionamento e acondicionamento', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(204, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de medicamentos e drogas de uso humano, sem manipulação', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(205, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de grãos e sementes em geral', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(206, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de cereais e leguminosas beneficiados, farinhas, amidos e féculas, com atividade de fracionamento e acondicionamentoassociada', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(207, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de frutas, verduras, raízes, tubérculos, hortaliças e legumes frescos', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(208, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de aves vivas e ovos', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(209, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de farinhas, amidos e féculas', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(210, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de máquinas, aparelhos e equipamentos para uso agropecuário', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(211, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de embalagens', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(212, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de artigos descartáveis em geral', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(213, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de leite e laticínios', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(214, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de carnes bovinas e suínas e derivados', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(215, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de aves abatidas e derivados', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(216, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de pescados e frutos do mar', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(217, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de carnes e derivados de outros animais', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(218, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de produtos alimentícios em geral', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(219, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de produtos alimentícios em geral, com atividade de fracionamento e acondicionamento associada', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(220, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio por atacado de reboques e semi reboques novos e usados', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(221, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de água mineral', 'CAM – CAPACIDADE DE ARMAZENAMENTO (m3)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(222, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de materiais de construção em geral', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(223, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'COMÉRCIO ATACADISTA', 'Comércio atacadista de resíduos de papel e papelão', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(224, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'HOTEL E SIMILARES', 'Albergues', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(225, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'HOTEL E SIMILARES', 'Campings', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(226, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'HOTEL E SIMILARES', 'Motel', 'NAP – POTÊNCIA (Kw)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(227, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'HOTEL E SIMILARES', 'Pensões', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(228, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'HOTEL E SIMILARES', 'Hotel/Apart-hotel, exceto em áreas sensíveis ou áreas protegidas', 'NL – NÚMERO DE LEITOS (Unidade)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(229, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'HOTEL E SIMILARES', 'Pousada, exceto em áreas sensíveis ou protegidas', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(230, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'HOTEL E SIMILARES', 'Alojamento em dormitórios e aluguel de imóveis residenciais por curta temporada', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(231, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SANEAMENTO', 'Drenagem superficial de águas pluviais', 'CPM – COMPRIMENTO (Metro)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(232, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SANEAMENTO', 'Higienização e prestação de serviços c/ banheiro químico', 'V – VOLUME (m3)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(233, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SANEAMENTO', 'Instalações hidrossanitárias domiciliares', 'UH - UNIDADE HABITACIONAL (Unidade)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(234, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SANEAMENTO', 'Limpa fossa com Estação de Tratamento de Esgoto', 'V – VOLUME (m3)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(235, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SANEAMENTO', 'Sistema simplificado de abastecimento de água (Perfuração de poço, captação e tratamento com pastilhas de hipoclorito de cálcio)', 'PA - POPULAÇÃO ATENDIDA EM N° DE HABITANTES (Unidade)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(236, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SANEAMENTO', 'Substituição de redes de água e de esgoto', 'CPM – COMPRIMENTO (Metro)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(237, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SANEAMENTO', 'Tratamento, limpeza e manutenção de reservatórios de água / bebedouros', 'CA - CLIENTELA ATENDIDA (Mensal)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(238, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SANEAMENTO', 'Tratamento individual de esgoto, com fossa filtro sumidouro', 'V – VOLUME (m3)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(239, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SANEAMENTO', 'Tratamento e disposição de resíduos não perigosos', 'PA - POPULAÇÃO ATENDIDA EM N° DE HABITANTES (Unidade)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(240, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Construção de cisternas e caixas d’águas', 'AH', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental'),
(241, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Construção, reforma e ampliação de estabelecimento de ensino público e privado', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental'),
(242, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Canteiro de obras com instalações administrativas e outras atividades de apoio (oficina, tancagem,usina de asfalto, entre outras)', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado'),
(243, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Construção de habitações rurais', 'UH - UNIDADE HABITACIONAL (Unidade)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(244, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Construção de habitação urbana', 'UH - UNIDADE HABITACIONAL (Unidade)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental'),
(245, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Demolição de edifícios e outras atividades', 'ATM - AREA TOTAL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(246, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Desmembramento em lotes urbanos já constituídos', 'ATM - AREA TOTAL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(247, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Edificação multifamiliar vertical', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(248, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Condomínio habitacional horizontal, sem fracionamento', 'NUH – NÚMERO DE UNIDADES HABITACIONAIS (Unidade)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(249, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Alojamento com cozinha, refeitório, lavanderia, instalações administrativas, de lazer e outras', 'NAP – POTÊNCIA (Kw)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(250, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Centro de Pesquisa/Ensino', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(251, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Execução ou pavimentação (asfáltica, blokretrígida e outros) em vias com drenagem pluvial preexistente ou execução com drenagem pluvial', 'CPK - COMPRIMENTO (Km)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(252, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Reforma / Revitalização de edificações para fins residenciais e comerciais, lazer, práticas esportivas e de utilidade pública, inclusive serviços de limpeza e pintura (Externa e interna) de paredesem edificações', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(253, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Reforma de Posto de Saúde', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(254, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Recuperação e melhoria de estrada vicinal com construção e/ou substituição de pontes', 'CPK - COMPRIMENTO (Km)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(255, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Shopping center, supermercado e hipermercado', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(256, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INFRAESTRUTURA E OBRAS CIVIS', 'Substituição e/ou reforma de pontes ou pontilhões em estrada vicinal', 'CPK - COMPRIMENTO (Km)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(257, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'RESTAURANTES E SIMILARES', 'Bares e outros estabelecimentos especializados em servir bebidas', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(258, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'RESTAURANTES E SIMILARES', 'Restaurantes e Similares', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(259, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'RESTAURANTES E SIMILARES', 'Quiosque (barraca) de praia (serviços ambulantes de alimentação)', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(260, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'RESTAURANTES E SIMILARES', 'Fornecimento de alimentos preparadospreponderantemente para empresas (Cozinha Industrial)', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(261, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'RESTAURANTES E SIMILARES', 'Lanchonetes, casas de chá, de sucos e similares', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(262, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'RESTAURANTES E SIMILARES', 'Serviços de alimentação para eventos e recepções', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(263, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ARMAZENAMENTO', 'Armazém para grãos/cereais sem beneficiamento', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(264, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ARMAZENAMENTO', 'Armazém para grãos/cereais com beneficiamento', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(265, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ARMAZENAMENTO', 'Silos para grãos / cereais sem beneficiamento', 'CAT – CAPACIDA DE ARMAZENAMENTO (Tonelada)', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(266, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ARMAZENAMENTO', 'Silos para grãos / cereais com beneficiamento', 'CAT – CAPACIDA DE ARMAZENAMENTO (Tonelada)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(267, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'TRANSMISSÃO E DISTRIBUIÇÃO DE ENERGIA ELÉTRICA', 'Gerador de Energia / Grupo Gerador de Energia', 'PK - POTÊNCIA (KVA)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(268, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES DE PUBLICIDADE NÃO ESPECIFICADAS ANTERIORMENTE', 'Comércio e instalação de painéis publicitários', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(269, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES DE PUBLICIDADE NÃO ESPECIFICADAS ANTERIORMENTE', 'Montagem de stands para eventos', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(270, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SERVIÇOS DE ORGANIZAÇÃO DE FEIRAS, CONGRESSOS, EXPOSIÇÕES E FESTAS', 'Feira livre ou coberta', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(271, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'PESCA E ATIVIDADES ESPORTIVAS', 'Atividades esportivas não especificadasanteriormente (esportes motorizados como automóveis, karts, motos, etc.)', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(272, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'PESCA E ATIVIDADES ESPORTIVAS', 'Torneio de pesca esportiva', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(273, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES E SERVIÇOS', 'Cabeleireiros e outras atividades de tratamento de beleza', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(274, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES E SERVIÇOS', 'Serviços de acabamento com tinturaria, tingimento, lavanderia, toalheiros, estamparia e outros', 'VPK - POTÊNCIA (KVA)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(275, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES E SERVIÇOS', 'Atividades funerárias e serviços relacionados', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(276, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES AUXILIARES DOS TRANSPORTES AÉREOS', 'Hangar', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(277, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES AUXILIARES DOS TRANSPORTES AÉREOS', 'Aeródromo Privado', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(278, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES AUXILIARES DOS TRANSPORTES TERRESTRES', 'Estacionamento de veículos', 'ATM - AREA TOTAL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(279, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES AUXILIARES DOS TRANSPORTES TERRESTRES', 'Garagem de ônibus/transportadora e seus anexos', 'ATM - AREA TOTAL (m2)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(280, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES AUXILIARES DOS TRANSPORTES TERRESTRES', 'Transporte Rodoviário e Fluvial de cargas secas e não perigosas', 'NV – VOLUME (m3)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(281, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES AUXILIARES DOS TRANSPORTES TERRESTRES', 'Transporte Rodoviário e Fluvial de resíduos sólidos, inclusive sucata – Classe II B (inerte)', 'NV – VOLUME (m3)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(282, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SERVIÇOS DE INSTALAÇÃO, MANUTENÇÃO E REPARAÇÃO DE ACESSÓRIOS PARA VEÍCULOSAUTOMOTORES', 'Instalação e manutenção de sistema de ar- condicionado automotivo', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(283, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SERVIÇOS EM VEÍCULOS', 'Serviços Automotivos: venda de peças, oficina mecânica, troca de óleo, borracharia e serviços decambagem, alinhamento e balanceamento', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário '),
(284, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SERVIÇOS EM VEÍCULOS', 'Lavagem de veículos, lubrificação, polimento, lava-jato e troca de óleo', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(285, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SERVIÇOS EM VEÍCULOS', 'Recondicionamento e recuperação de motores para veículos automotores', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(286, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SAÚDE HUMANA E SERVIÇOS SOCIAIS', 'Clínica de reabilitação', 'AUH - ÁREA ÚTIL (Ha) ', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(287, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'SAÚDE HUMANA E SERVIÇOS SOCIAIS', 'Clínica médica com recursos para realização de procedimentos cirúrgicos', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(288, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'LOJAS DE DEPARTAMENTOS, MAGAZINES E SIMILARES', 'Lojas de departamentos ou magazines', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(289, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'LOJAS DE DEPARTAMENTOS, MAGAZINES E SIMILARES', 'Lojas de variedades, exceto lojas de departamentos ou magazines', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(290, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Indústria gráfica', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado '),
(291, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de artefatos de joalheria e ourivesaria', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(292, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de letras, letreiros, painéis e placas de qualquer material inclusive luminosos', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(293, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de produtos diversos, tais como:- Artefatos de pelos, plumas, chifres e garras, etc.- Perucas, inclusive cílios postiços e afins- Artigos para festas, carnaval, etc.- Garrafas térmicas e outros recipientes térmicos- Isqueiros de qualquer material e acendedores automáticos para fogões- Velas de cera, sebo, estearina, etc.- Artefatos escolares não compreendidos em outros grupos (giz, figuras geométricas, globos e material didático em geral)- Caixões mortuários- Artefatos diversos não especificados ou não classificados (adornos para árvores de natal, piteiras, cigarreiras, cachimbos, flores e frutos artificiais,manequins, etc.)', 'VPK - POTÊNCIA (KVA)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(294, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de artefatos de funilaria e latoaria em chapas de aço, ferro, cobre, zinco e folha deflandres', 'VPTA – VOLUME DE PRODUÇAÕ (t/ano)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(295, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de pneumáticos e câmara de ar', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(296, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de ferramentas e utensílios para trabalhos manuais /industriais (ex. ferramentas de corte, enxadas, foices, machados, pás, martelos,tarraxas, semelhantes etc.)', 'VPTA – VOLUME DE PRODUÇAÕ (t/ano)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(297, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de colchões, sem produção de espuma', 'VPP – POTÊNCIA (Kw)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(298, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de artefatos de borracha natural', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(299, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Recondicionamento /recuperação de pneumático', 'VPP – POTÊNCIA (Kw)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(300, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Beneficiamento de borracha natural', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(301, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de artefatos de borracha sintética', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(302, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de artigos para viagem, bolsas e semelhantes de qualquer material', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(303, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de artefatos de couro:- Couro de uso pessoal como porta-notas, porta-documentos e semelhantes- Selaria e artigos de couro para pequenos animais- Correias de transmissão e artigos de couro para máquinas- Pulseiras não-metálicas para relógios', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(304, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de artefatos de couro natural/ peles e produtos similares', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(305, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Secagem e salga de peles', 'VPP – POTÊNCIA (Kw)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(306, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de cola animal', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(307, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de recipientes de aço para embalagem de gases, combustíveis, lubrificantes, latões,tambores e outros', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(308, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Preparação do fumo, fabricação de cigarros, charutos e cigarrilhas, e outras atividades de elaboração do tabaco não especificados ou nãoclassificados', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(309, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de bancos e estofados para veículos automotores', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(310, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA EM GERAL', 'Fabricação de calçados em geral', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(311, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'FABRICAÇÃO DE MÓVEIS', 'Fabricação de móveis com predominância de madeira', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(312, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'FABRICAÇÃO DE MÓVEIS', 'Fabricação de móveis com predominância de metal', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(313, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'FABRICAÇÃO DE MÓVEIS', 'Movelaria / Marcenaria / Carpintaria / Secagem', 'VCA - CLIENTELA ATENDIDA (Mensal)', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório '),
(314, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Beneficiamento de frutas, exceto açaí', 'VPTD - VOLUME DE PRODUÇÃO (t / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(315, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Beneficiamento de sal mineral para alimentação animal', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado '),
(316, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Beneficiamento de mel', 'VPK - POTÊNCIA (KVA)', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(317, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Envase de água purificada, adicionada ou não sais minerais', 'VPL - VOLUME DE PRODUÇÃO (l / dia)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário '),
(318, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Fabricação de caramelos, doces e similares', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(319, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Fabricação de conservas de frutas, legumes e outros vegetais e de doces', 'VPK - POTÊNCIA (KVA)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(320, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Fabricação de gelo comum', 'VPTD - VOLUME DE PRODUÇÃO (t / dia)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(321, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Fabricação de fécula, amido e seus derivados', 'VPK - POTÊNCIA (KVA)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(322, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Beneficiamento de palmito', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado '),
(323, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Produção de charqueados, conservas de carnes e gorduras de origem animal', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(324, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Fabricação de fermento e leveduras', 'VPK - POTÊNCIA (KVA)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(325, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Fabricação de vinagre', 'VPL - VOLUME DE PRODUÇÃO (l / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(326, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Fabricação de ração balanceada e alimentos preparados para animais', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(327, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Fabricação de especiarias, molhos, temperos e condimentos', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário '),
(328, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS ALIMENTÍCIOS E BEBIDAS', 'Torrefação e/ou moagem de café', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado '),
(329, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS MINERAIS NÃO METALICOS', 'Fabricação de peças, artefatos, ornatos e estruturas de cimento, concreto, fibrocimento egesso', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(330, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS MINERAIS NÃO METALICOS', 'Fabricação de artigos de grés e de material cerâmico refratário', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(331, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS MINERAIS NÃO METALICOS', 'Fabricação e elaboração de vidro e cristal', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(332, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA DE PRODUTOS MINERAIS NÃO METALICOS', 'Fabricação de artigos de vidro e cristal', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário '),
(333, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA METALÚRGICA e SIDERÚRGICA', 'Produção de artefatos estampados de metal', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(334, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA METALÚRGICA e SIDERÚRGICA', 'Fabricação de artefatos de metais não ferrosos', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(335, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA METALÚRGICA e SIDERÚRGICA', 'Fabricação de artefatos de metais ferrosos', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(336, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA QUÍMICA', 'Fabricação de artefatos de couro sintético', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(337, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA QUÍMICA', 'Misturadora de preparados para limpeza, desinfetantes, inseticidas e afins', 'VPL - VOLUME DE PRODUÇÃO (l / dia)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(338, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA QUÍMICA', 'Misturadora de Fertilizantes Mistos e GranuladosComplexo (NPK – Nitrogenados, Fosfatados e Potássicos)', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(339, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA QUÍMICA', 'Fabricação de gases industriais', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(340, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA QUÍMICA', 'Fabricação de embalagens de material plástico', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(341, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA QUÍMICA', 'Fabricação de tubos e acessórios de material plástico para uso na construção', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(342, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA QUÍMICA', 'Produção de artigos de material plástico, injetados, extrusados, laminados, prensados, em outras formas, inclusive reciclados', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(343, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Áreas livres de uso públicos de cultura, esporte, lazer e similares: praças, parques, calçadas, palcos', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(344, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Central de triagem e/ou Central de Compostagem e/ou Central de Reciclagem', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'ALTO (III)', 'Licenciamento Ambiental Simplificado '),
(345, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Centro receptivo', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(346, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Clubes sociais, esportivos e similares', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(347, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Coleta, transporte de resíduos de construção civil, exceto perigoso', 'NV – VOLUME (m3)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário '),
(348, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Depósito de recebimento de embalagem vazias de agrotóxico', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(349, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Destinação final de resíduos de construção civil, exceto perigoso', 'V – VOLUME (m3)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário '),
(350, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Higiene e embelezamento de animais domésticos', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(351, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Limpeza em prédios e em domicílios', 'CA - CLIENTELA ATENDIDA (Mensal)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(352, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Manufatura reversa', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado '),
(353, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Manutenção e reparação de máquinas e equipamentos industriais', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(354, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Manutenção elétrica (reparação de geradores, transformadores, motores elétricos etc.)', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(355, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Montagem e instalação de sistemas eequipamentos de iluminação e sinalização em locais públicos municipais', 'CPM – COMPRIMENTO (Metro)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(356, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Obras de montagem industrial', 'ATM - AREA TOTAL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado '),
(357, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Posto de coleta para exames laboratoriais clínicos e consultas médicas', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado '),
(358, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Produção de espetáculos de rodeio, vaquejadas e similares', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(359, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Provedores de acesso e redes de comunicação', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(360, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Publicidade volante', 'NV – VOLUME (m3)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório '),
(361, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Recarga de cartuchos para equipamentos de informática', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(362, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Reciclagem', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(363, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Reciclagem de papel', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(364, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Recondicionamento de motores elétricos', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(365, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Reparação e manutenção de equipamentos eletroeletrônicos de uso pessoal e doméstico', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(366, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Reparação e manutenção de computadores e de equipamentos periféricos', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(367, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Transporte, coleta e destinação final de resíduos sólidos urbanos', 'NV – VOLUME (m3)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(368, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Triagem e compostagem', 'VPTM – VOLUME DE PRODUCAO (t / mês)', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(369, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Terminal logístico de cargas gerais e perigosas', 'AUH - ÁREA ÚTIL (Ha) ', 'MÉDIO (II)', 'Licenciamento Ambiental Ordinário '),
(370, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Depósito/Comércio de substâncias e produtos perigosos', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário '),
(371, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Prensagem de material reciclável/ enfardamento trituração e outros', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Licenciamento Ambiental Simplificado '),
(372, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Telefonia celular', 'NSA – NÚMERO SITE/ANTENA (Unidade)', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado '),
(373, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Distrito / Delegacia de Polícia', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(374, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Transporte aquaviário de passageiros', 'NV – VOLUME (m3)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(375, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'OUTRAS ATIVIDADES NÃO ESPECIFICADA ANTERIORMENTE', 'Construção, reforma ou ampliação de quadras de esportes, praças, campos de futebol, centros de eventos, igrejas, templos religiosos, feira livre ou coberta, mercado, creches, centros de inclusão digital, bem como outras obras civis de interesse social (exceto conjunto habitacional de interessesocial)', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Dispensa de Licenciamento Ambiental '),
(376, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES VETERINÁRIAS', 'Atividades veterinárias – Petshop', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Declaratório ');
INSERT INTO `lic_enquadramento` (`cod`, `anexo`, `categoria`, `tipologia`, `unidade`, `potencial`, `modalidade`) VALUES
(377, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES VETERINÁRIAS', 'Clínicas e hospitais de animais domésticos', 'AUM - AREA UTIL (m2)', 'ALTO (III)', 'Licenciamento Ambiental Simplificado '),
(378, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES VETERINÁRIAS', 'Comércio varejista de produtos veterinários – Petshop / Comércio varejista de medicamentos veterinários', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(379, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES DE RECREAÇÃO E LAZER NÃO ESPECIFICADAS ANTERIORMENTE', 'Casas de festas e eventos', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado '),
(380, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES DE RECREAÇÃO E LAZER NÃO ESPECIFICADAS ANTERIORMENTE', 'Discotecas, danceterias, salões de dança e similares', 'AUM - AREA UTIL (m2)', 'MÉDIO (II)', 'Licenciamento Ambiental Simplificado '),
(381, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'EXTRAÇÃO DE MINERAIS NÃO-METÁLICOS', 'Extração de calcário e outros produtos rochosos de aplicação direta na agricultura', 'AR - ÁREA REQUERIDA NO DNPM (Ha)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(382, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'EXTRAÇÃO DE MINERAIS NÃO-METÁLICOS', 'Beneficiamento de calcário e outros produtos rochosos de aplicação direta na agricultura', 'VPTD - VOLUME DE PRODUÇÃO (t / dia)', 'ALTO (III)', 'Licenciamento Ambiental Ordinário '),
(383, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'PESQUISA, LAVRA E BENEFICIAMENTO MINERAL', 'Pesquisa mineral, sem lavra experimental', 'AR - ÁREA REQUERIDA NO DNPM (Ha)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário '),
(384, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'PESQUISA, LAVRA E BENEFICIAMENTO MINERAL', 'Explotação e envaze de água mineral', 'VCL - VOLUME CAPTADO (l/dia)', 'BAIXO (I)', 'Licenciamento Ambiental Ordinário '),
(385, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'INDÚSTRIA MECÂNICA', 'Construção de embarcações para esporte e lazer', 'AUM - AREA UTIL (m2)', 'BAIXO (I)', 'Dispensa de Licenciamento Ambiental '),
(386, 'ANEXO II - 235 Tipologias de impacto local (todos os portes/tamanhos)', 'ATIVIDADES LIGADAS AO PATRIMÔNIO CULTURAL E AMBIENTAL', 'Jardim botânico', 'AUH - ÁREA ÚTIL (Ha) ', 'BAIXO (I)', 'Licenciamento Ambiental Declaratório ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lic_enquadramento_porte`
--

CREATE TABLE `lic_enquadramento_porte` (
  `cod` int(11) UNSIGNED NOT NULL,
  `cod_enquadramento` int(11) NOT NULL,
  `porte` varchar(40) NOT NULL,
  `limite_minimo` double NOT NULL,
  `limite_maximo` double NOT NULL,
  `observacao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `lic_enquadramento_porte`
--

INSERT INTO `lic_enquadramento_porte` (`cod`, `cod_enquadramento`, `porte`, `limite_minimo`, `limite_maximo`, `observacao`) VALUES
(1, 1, 'Mínimo (A)', 0, 200, ''),
(2, 2, 'Mínimo (A)', 0, 100, ''),
(3, 3, 'Mínimo (A)', 0, 1000, ''),
(4, 4, 'Mínimo (A)', 0, 50, ''),
(5, 5, 'Mínimo (A)', 0, 100, ''),
(6, 6, 'Mínimo (A)', 0, 100, ''),
(7, 7, 'Mínimo (A)', 0, 100, ''),
(8, 8, 'Mínimo (A)', 0, 100, ''),
(9, 9, 'Mínimo (A)', 0, 500, ''),
(10, 10, 'Mínimo (A)', 0, 100, ''),
(11, 11, 'Mínimo (A)', 0, 100, ''),
(12, 12, 'Mínimo (A)', 0, 100, ''),
(13, 13, 'Mínimo (A)', 0, 100, ''),
(14, 14, 'Mínimo (A)', 0, 500, ''),
(15, 15, 'Mínimo (A)', 0, 100, ''),
(16, 16, 'Mínimo (A)', 0, 2, ''),
(17, 17, 'Mínimo (A)', 0, 5000, ''),
(18, 18, 'Mínimo (A)', 0, 2, ''),
(19, 19, 'Mínimo (A)', 0, 10, ''),
(20, 20, 'Mínimo (A)', 0, 50, ''),
(21, 21, 'Mínimo (A)', 0, 100, ''),
(22, 22, 'Mínimo (A)', 0, 100, ''),
(23, 23, 'Mínimo (A)', 0, 1, ''),
(24, 24, 'Mínimo (A)', 0, 10, ''),
(25, 25, 'Mínimo (A)', 0, 1, ''),
(26, 26, 'Mínimo (A)', 0, 500, ''),
(27, 27, 'Mínimo (A)', 0, 20, ''),
(28, 28, 'Mínimo (A)', 0, 100, ''),
(29, 29, 'Mínimo (A)', 0, 100, ''),
(30, 30, 'Mínimo (A)', 0, 10, ''),
(31, 31, 'Mínimo (A)', 0, 30, ''),
(32, 32, 'Mínimo (A)', 0, 30, ''),
(33, 33, 'Mínimo (A)', 0, 30, ''),
(34, 34, 'Mínimo (A)', 0, 30, ''),
(35, 35, 'Mínimo (A)', 0, 10, ''),
(36, 36, 'Mínimo (A)', 0, 50, ''),
(37, 37, 'Mínimo (A)', 0, 50, ''),
(38, 38, 'Mínimo (A)', 0, 50, ''),
(39, 39, 'Mínimo (A)', 0, 10, ''),
(40, 40, 'Mínimo (A)', 0, 10, ''),
(41, 41, 'Mínimo (A)', 0, 75, ''),
(42, 42, 'Mínimo (A)', 0, 5, ''),
(43, 43, 'Mínimo (A)', 0, 500, ''),
(44, 44, 'Mínimo (A)', 0, 2, ''),
(45, 45, 'Mínimo (A)', 0, 2, ''),
(46, 46, 'Mínimo (A)', 0, 500, ''),
(47, 47, 'Mínimo (A)', 0, 500, ''),
(48, 48, 'Mínimo (A)', 0, 1000, ''),
(49, 49, 'Mínimo (A)', 0, 1000, ''),
(50, 50, 'Mínimo (A)', 0, 0.2, ''),
(51, 51, 'Mínimo (A)', 0, 200, ''),
(52, 52, 'Mínimo (A)', 0, 10, ''),
(53, 53, 'Mínimo (A)', 0, 20, ''),
(54, 54, 'Mínimo (A)', 0, 20, ''),
(55, 55, 'Mínimo (A)', 0, 500, ''),
(56, 56, 'Mínimo (A)', 0, 1000, ''),
(57, 57, 'Mínimo (A)', 0, 1000, ''),
(58, 58, 'Mínimo (A)', 0, 5000, ''),
(59, 59, 'Mínimo (A)', 0, 5000, ''),
(60, 60, 'Mínimo (A)', 0, 5000, ''),
(61, 61, 'Mínimo (A)', 0, 50, ''),
(62, 62, 'Mínimo (A)', 0, 100, ''),
(63, 63, 'Mínimo (A)', 0, 50, ''),
(64, 64, 'Mínimo (A)', 0, 100, ''),
(65, 65, 'Mínimo (A)', 0, 1, ''),
(66, 66, 'Mínimo (A)', 0, 50, ''),
(67, 67, 'Mínimo (A)', 0, 100, ''),
(68, 68, 'Mínimo (A)', 0, 5, ''),
(69, 69, 'Mínimo (A)', 0, 100, ''),
(70, 70, 'Mínimo (A)', 0, 50, ''),
(71, 71, 'Mínimo (A)', 0, 100, ''),
(72, 72, 'Mínimo (A)', 0, 50, ''),
(73, 73, 'Mínimo (A)', 0, 100, ''),
(74, 74, 'Mínimo (A)', 0, 200, ''),
(75, 75, 'Mínimo (A)', 0, 50, ''),
(76, 76, 'Mínimo (A)', 0, 10, ''),
(77, 77, 'Mínimo (A)', 0, 10, ''),
(78, 78, 'Mínimo (A)', 0, 1, ''),
(79, 79, 'Mínimo (A)', 0, 1, ''),
(80, 80, 'Mínimo (A)', 0, 5, ''),
(81, 81, 'Mínimo (A)', 0, 1, ''),
(82, 82, 'Mínimo (A)', 0, 50, ''),
(83, 83, 'Mínimo (A)', 0, 1000, ''),
(84, 84, 'Mínimo (A)', 0, 10, ''),
(85, 85, 'Mínimo (A)', 0, 1000, ''),
(86, 86, 'Mínimo (A)', 0, 10, ''),
(87, 87, 'Mínimo (A)', 0, 10, ''),
(88, 88, 'Mínimo (A)', 0, 3, ''),
(89, 89, 'Mínimo (A)', 0, 10, ''),
(90, 90, 'Mínimo (A)', 0, 500, ''),
(91, 91, 'Mínimo (A)', 0, 500, ''),
(92, 92, 'Mínimo (A)', 0, 5000, ''),
(93, 93, 'Mínimo (A)', 0, 1000, ''),
(94, 94, 'Mínimo (A)', 0, 100, ''),
(95, 95, 'Mínimo (A)', 0, 100, ''),
(96, 96, 'Mínimo (A)', 0, 10, ''),
(97, 97, 'Mínimo (A)', 0, 1000, ''),
(98, 98, 'Mínimo (A)', 0, 10000, ''),
(99, 99, 'Mínimo (A)', 0, 10000, ''),
(100, 100, 'Mínimo (A)', 0, 10, ''),
(101, 101, 'Mínimo (A)', 0, 10, ''),
(102, 102, 'Mínimo (A)', 0, 3000, ''),
(103, 103, 'Mínimo (A)', 0, 5000, ''),
(104, 104, 'Mínimo (A)', 0, 500, ''),
(105, 105, 'Mínimo (A)', 0, 200, ''),
(106, 106, 'Mínimo (A)', 0, 3000, ''),
(107, 107, 'Mínimo (A)', 0, 3000, ''),
(108, 108, 'Mínimo (A)', 0, 3000, ''),
(109, 109, 'Mínimo (A)', 0, 500, ''),
(110, 110, 'Mínimo (A)', 0, 500, ''),
(111, 111, 'Mínimo (A)', 0, 500, ''),
(112, 112, 'Mínimo (A)', 0, 500, ''),
(113, 113, 'Mínimo (A)', 0, 500, ''),
(114, 114, 'Mínimo (A)', 0, 500, ''),
(115, 115, 'Mínimo (A)', 0, 10, ''),
(116, 116, 'Mínimo (A)', 0, 500, ''),
(117, 117, 'Mínimo (A)', 0, 200, ''),
(118, 118, 'Mínimo (A)', 0, 3000, ''),
(119, 119, 'Mínimo (A)', 0, 500, ''),
(120, 120, 'Mínimo (A)', 0, 3000, ''),
(121, 121, 'Mínimo (A)', 0, 200, ''),
(122, 122, 'Mínimo (A)', 0, 200, ''),
(123, 123, 'Mínimo (A)', 0, 1000, ''),
(124, 124, 'Mínimo (A)', 0, 200, ''),
(125, 125, 'Mínimo (A)', 0, 1000, ''),
(126, 126, 'Mínimo (A)', 0, 3000, ''),
(127, 127, 'Mínimo (A)', 0, 3000, ''),
(128, 128, 'Mínimo (A)', 0, 3000, ''),
(129, 129, 'Mínimo (A)', 0, 3000, ''),
(130, 130, 'Mínimo (A)', 0, 5000, ''),
(131, 131, 'Mínimo (A)', 0, 10000, ''),
(132, 132, 'Mínimo (A)', 0, 3000, ''),
(133, 133, 'Mínimo (A)', 0, 3000, ''),
(134, 134, 'Mínimo (A)', 0, 5000, ''),
(135, 135, 'Mínimo (A)', 0, 200, ''),
(136, 136, 'Mínimo (A)', 0, 10, ''),
(137, 137, 'Mínimo (A)', 0, 200, ''),
(138, 138, 'Mínimo (A)', 0, 500, ''),
(139, 139, 'Mínimo (A)', 0, 5000, ''),
(140, 140, 'Mínimo (A)', 0, 50, ''),
(141, 141, 'Mínimo (A)', 0, 5000, ''),
(142, 142, 'Mínimo (A)', 0, 5000, ''),
(143, 143, 'Mínimo (A)', 0, 5000, ''),
(144, 144, 'Mínimo (A)', 0, 5000, ''),
(145, 145, 'Mínimo (A)', 0, 5000, ''),
(146, 146, 'Mínimo (A)', 0, 0, 'Tipologia de competência do município, desde que o aterro sanitário esteja sendo licenciado por este ente federativo'),
(147, 147, 'Mínimo (A)', 0, 500, ''),
(148, 148, 'Mínimo (A)', 0, 500, ''),
(149, 149, 'Mínimo (A)', 0, 50, ''),
(150, 150, 'Mínimo (A)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(151, 151, 'Mínimo (A)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(152, 152, 'Mínimo (A)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(153, 153, 'Mínimo (A)', 0, 100, ''),
(154, 154, 'Mínimo (A)', 0, 100, ''),
(155, 155, 'Mínimo (A)', 0, 200, ''),
(156, 156, 'Mínimo (A)', 0, 100, ''),
(157, 157, 'Mínimo (A)', 0, 500, ''),
(158, 158, 'Mínimo (A)', 0, 2, ''),
(159, 159, 'Mínimo (A)', 0, 10, ''),
(160, 160, 'Mínimo (A)', 0, 10, ''),
(161, 161, 'Mínimo (A)', 0, 500, ''),
(162, 162, 'Mínimo (A)', 0, 30, ''),
(163, 163, 'Mínimo (A)', 0, 50, ''),
(164, 164, 'Mínimo (A)', 0, 1, ''),
(165, 165, 'Mínimo (A)', 0, 50, ''),
(166, 166, 'Mínimo (A)', 0, 50, ''),
(167, 167, 'Mínimo (A)', 0, 50, ''),
(168, 168, 'Mínimo (A)', 0, 50, ''),
(169, 169, 'Mínimo (A)', 0, 50, ''),
(170, 170, 'Mínimo (A)', 0, 50, ''),
(171, 171, 'Mínimo (A)', 0, 50, ''),
(172, 172, 'Mínimo (A)', 0, 50, ''),
(173, 173, 'Mínimo (A)', 0, 50, ''),
(174, 174, 'Mínimo (A)', 0, 50, ''),
(175, 175, 'Mínimo (A)', 0, 50, ''),
(176, 176, 'Mínimo (A)', 0, 50, ''),
(177, 177, 'Mínimo (A)', 0, 50, ''),
(178, 178, 'Mínimo (A)', 0, 50, ''),
(179, 179, 'Mínimo (A)', 0, 50, ''),
(180, 180, 'Mínimo (A)', 0, 50, ''),
(181, 181, 'Mínimo (A)', 0, 50, ''),
(182, 182, 'Mínimo (A)', 0, 50, ''),
(183, 183, 'Mínimo (A)', 0, 50, ''),
(184, 184, 'Mínimo (A)', 0, 50, ''),
(185, 185, 'Mínimo (A)', 0, 50, ''),
(186, 186, 'Mínimo (A)', 0, 50, ''),
(187, 187, 'Mínimo (A)', 0, 50, ''),
(188, 188, 'Mínimo (A)', 0, 50, ''),
(189, 189, 'Mínimo (A)', 0, 50, ''),
(190, 190, 'Mínimo (A)', 0, 50, ''),
(191, 191, 'Mínimo (A)', 0, 50, ''),
(192, 192, 'Mínimo (A)', 0, 50, ''),
(193, 193, 'Mínimo (A)', 0, 50, ''),
(194, 194, 'Mínimo (A)', 0, 50, ''),
(195, 195, 'Mínimo (A)', 0, 50, ''),
(196, 196, 'Mínimo (A)', 0, 50, ''),
(197, 197, 'Mínimo (A)', 0, 50, ''),
(198, 198, 'Mínimo (A)', 0, 200, ''),
(199, 199, 'Mínimo (A)', 0, 50, ''),
(200, 200, 'Mínimo (A)', 0, 400, ''),
(201, 201, 'Mínimo (A)', 0, 400, ''),
(202, 202, 'Mínimo (A)', 0, 200, ''),
(203, 203, 'Mínimo (A)', 0, 90, ''),
(204, 204, 'Mínimo (A)', 0, 50, ''),
(205, 205, 'Mínimo (A)', 0, 50, ''),
(206, 206, 'Mínimo (A)', 0, 50, ''),
(207, 207, 'Mínimo (A)', 0, 50, ''),
(208, 208, 'Mínimo (A)', 0, 50, ''),
(209, 209, 'Mínimo (A)', 0, 30, ''),
(210, 210, 'Mínimo (A)', 0, 100, ''),
(211, 211, 'Mínimo (A)', 0, 50, ''),
(212, 212, 'Mínimo (A)', 0, 50, ''),
(213, 213, 'Mínimo (A)', 0, 50, ''),
(214, 214, 'Mínimo (A)', 0, 50, ''),
(215, 215, 'Mínimo (A)', 0, 50, ''),
(216, 216, 'Mínimo (A)', 0, 50, ''),
(217, 217, 'Mínimo (A)', 0, 50, ''),
(218, 218, 'Mínimo (A)', 0, 100, ''),
(219, 219, 'Mínimo (A)', 0, 100, ''),
(220, 220, 'Mínimo (A)', 0, 400, ''),
(221, 221, 'Mínimo (A)', 0, 90, ''),
(222, 222, 'Mínimo (A)', 0, 400, ''),
(223, 223, 'Mínimo (A)', 0, 50, ''),
(224, 224, 'Mínimo (A)', 0, 200, ''),
(225, 225, 'Mínimo (A)', 0, 500, ''),
(226, 226, 'Mínimo (A)', 0, 10, ''),
(227, 227, 'Mínimo (A)', 0, 200, ''),
(228, 228, 'Mínimo (A)', 0, 50, ''),
(229, 229, 'Mínimo (A)', 0, 200, ''),
(230, 230, 'Mínimo (A)', 0, 200, ''),
(231, 231, 'Mínimo (A)', 0, 500, ''),
(232, 232, 'Mínimo (A)', 0, 4, ''),
(233, 233, 'Mínimo (A)', 0, 3, ''),
(234, 234, 'Mínimo (A)', 0, 30000, ''),
(235, 235, 'Mínimo (A)', 0, 5, ''),
(236, 236, 'Mínimo (A)', 0, 1000, ''),
(237, 237, 'Mínimo (A)', 0, 10, ''),
(238, 238, 'Mínimo (A)', 0, 1000, ''),
(239, 239, 'Mínimo (A)', 0, 2000, ''),
(240, 240, 'Mínimo (A)', 0, 0, ''),
(241, 241, 'Mínimo (A)', 0, 50, ''),
(242, 242, 'Mínimo (A)', 0, 0.1, ''),
(243, 243, 'Mínimo (A)', 0, 4, ''),
(244, 244, 'Mínimo (A)', 0, 4, ''),
(245, 245, 'Mínimo (A)', 0, 10, ''),
(246, 246, 'Mínimo (A)', 0, 50, ''),
(247, 247, 'Mínimo (A)', 0, 300, ''),
(248, 248, 'Mínimo (A)', 0, 10, ''),
(249, 249, 'Mínimo (A)', 0, 10, ''),
(250, 250, 'Mínimo (A)', 0, 0.5, ''),
(251, 251, 'Mínimo (A)', 0, 2, ''),
(252, 252, 'Mínimo (A)', 0, 50, ''),
(253, 253, 'Mínimo (A)', 0, 50, ''),
(254, 254, 'Mínimo (A)', 0, 2, ''),
(255, 255, 'Mínimo (A)', 0, 5000, ''),
(256, 256, 'Mínimo (A)', 0, 0.1, ''),
(257, 257, 'Mínimo (A)', 0, 30, ''),
(258, 258, 'Mínimo (A)', 0, 50, ''),
(259, 259, 'Mínimo (A)', 0, 10, ''),
(260, 260, 'Mínimo (A)', 0, 50, ''),
(261, 261, 'Mínimo (A)', 0, 30, ''),
(262, 262, 'Mínimo (A)', 0, 50, ''),
(263, 263, 'Mínimo (A)', 0, 100, ''),
(264, 264, 'Mínimo (A)', 0, 100, ''),
(265, 265, 'Mínimo (A)', 0, 4, ''),
(266, 266, 'Mínimo (A)', 0, 4, ''),
(267, 267, 'Mínimo (A)', 0, 500, ''),
(268, 268, 'Mínimo (A)', 0, 50, ''),
(269, 269, 'Mínimo (A)', 0, 50, ''),
(270, 270, 'Mínimo (A)', 0, 500, ''),
(271, 271, 'Mínimo (A)', 0, 500, ''),
(272, 272, 'Mínimo (A)', 0, 500, ''),
(273, 273, 'Mínimo (A)', 0, 30, ''),
(274, 274, 'Mínimo (A)', 0, 100, ''),
(275, 275, 'Mínimo (A)', 0, 100, ''),
(276, 276, 'Mínimo (A)', 0, 500, ''),
(277, 277, 'Mínimo (A)', 0, 10, ''),
(278, 278, 'Mínimo (A)', 0, 400, ''),
(279, 279, 'Mínimo (A)', 0, 500, ''),
(280, 280, 'Mínimo (A)', 0, 5, ''),
(281, 281, 'Mínimo (A)', 0, 5, ''),
(282, 282, 'Mínimo (A)', 0, 400, ''),
(283, 283, 'Mínimo (A)', 0, 500, ''),
(284, 284, 'Mínimo (A)', 0, 500, ''),
(285, 285, 'Mínimo (A)', 0, 500, ''),
(286, 286, 'Mínimo (A)', 0, 200, ''),
(287, 287, 'Mínimo (A)', 0, 200, ''),
(288, 288, 'Mínimo (A)', 0, 200, ''),
(289, 289, 'Mínimo (A)', 0, 100, ''),
(290, 290, 'Mínimo (A)', 0, 50, ''),
(291, 291, 'Mínimo (A)', 0, 50, ''),
(292, 292, 'Mínimo (A)', 0, 100, ''),
(293, 293, 'Mínimo (A)', 0, 100, ''),
(294, 294, 'Mínimo (A)', 0, 200, ''),
(295, 295, 'Mínimo (A)', 0, 200, ''),
(296, 296, 'Mínimo (A)', 0, 200, ''),
(297, 297, 'Mínimo (A)', 0, 20, ''),
(298, 298, 'Mínimo (A)', 0, 200, ''),
(299, 299, 'Mínimo (A)', 0, 50, ''),
(300, 300, 'Mínimo (A)', 0, 200, ''),
(301, 301, 'Mínimo (A)', 0, 200, ''),
(302, 302, 'Mínimo (A)', 0, 200, ''),
(303, 303, 'Mínimo (A)', 0, 200, ''),
(304, 304, 'Mínimo (A)', 0, 200, ''),
(305, 305, 'Mínimo (A)', 0, 20, ''),
(306, 306, 'Mínimo (A)', 0, 200, ''),
(307, 307, 'Mínimo (A)', 0, 200, ''),
(308, 308, 'Mínimo (A)', 0, 200, ''),
(309, 309, 'Mínimo (A)', 0, 200, ''),
(310, 310, 'Mínimo (A)', 0, 200, ''),
(311, 311, 'Mínimo (A)', 0, 500, ''),
(312, 312, 'Mínimo (A)', 0, 500, ''),
(313, 313, 'Mínimo (A)', 0, 1500, ''),
(314, 314, 'Mínimo (A)', 0, 5, ''),
(315, 315, 'Mínimo (A)', 0, 300, ''),
(316, 316, 'Mínimo (A)', 0, 100, ''),
(317, 317, 'Mínimo (A)', 0, 500, ''),
(318, 318, 'Mínimo (A)', 0, 200, ''),
(319, 319, 'Mínimo (A)', 0, 100, ''),
(320, 320, 'Mínimo (A)', 0, 5, ''),
(321, 321, 'Mínimo (A)', 0, 100, ''),
(322, 322, 'Mínimo (A)', 0, 10, ''),
(323, 323, 'Mínimo (A)', 0, 10, ''),
(324, 324, 'Mínimo (A)', 0, 100, ''),
(325, 325, 'Mínimo (A)', 0, 500, ''),
(326, 326, 'Mínimo (A)', 0, 10, ''),
(327, 327, 'Mínimo (A)', 0, 10, ''),
(328, 328, 'Mínimo (A)', 0, 10, ''),
(329, 329, 'Mínimo (A)', 0, 1000, ''),
(330, 330, 'Mínimo (A)', 0, 500, ''),
(331, 331, 'Mínimo (A)', 0, 750, ''),
(332, 332, 'Mínimo (A)', 0, 1000, ''),
(333, 333, 'Mínimo (A)', 0, 200, ''),
(334, 334, 'Mínimo (A)', 0, 200, ''),
(335, 335, 'Mínimo (A)', 0, 200, ''),
(336, 336, 'Mínimo (A)', 0, 1000, ''),
(337, 337, 'Mínimo (A)', 0, 500, ''),
(338, 338, 'Mínimo (A)', 0, 100, ''),
(339, 339, 'Mínimo (A)', 0, 1000, ''),
(340, 340, 'Mínimo (A)', 0, 1000, ''),
(341, 341, 'Mínimo (A)', 0, 1000, ''),
(342, 342, 'Mínimo (A)', 0, 1000, ''),
(343, 343, 'Mínimo (A)', 0, 200, ''),
(344, 344, 'Mínimo (A)', 0, 1000, ''),
(345, 345, 'Mínimo (A)', 0, 200, ''),
(346, 346, 'Mínimo (A)', 0, 200, ''),
(347, 347, 'Mínimo (A)', 0, 5, ''),
(348, 348, 'Mínimo (A)', 0, 100, ''),
(349, 349, 'Mínimo (A)', 0, 25, ''),
(350, 350, 'Mínimo (A)', 0, 100, ''),
(351, 351, 'Mínimo (A)', 0, 15, ''),
(352, 352, 'Mínimo (A)', 0, 1000, ''),
(353, 353, 'Mínimo (A)', 0, 100, ''),
(354, 354, 'Mínimo (A)', 0, 100, ''),
(355, 355, 'Mínimo (A)', 0, 200, ''),
(356, 356, 'Mínimo (A)', 0, 10, ''),
(357, 357, 'Mínimo (A)', 0, 100, ''),
(358, 358, 'Mínimo (A)', 0, 100, ''),
(359, 359, 'Mínimo (A)', 0, 100, ''),
(360, 360, 'Mínimo (A)', 0, 1, ''),
(361, 361, 'Mínimo (A)', 0, 100, ''),
(362, 362, 'Mínimo (A)', 0, 1000, ''),
(363, 363, 'Mínimo (A)', 0, 150, ''),
(364, 364, 'Mínimo (A)', 0, 100, ''),
(365, 365, 'Mínimo (A)', 0, 100, ''),
(366, 366, 'Mínimo (A)', 0, 100, ''),
(367, 367, 'Mínimo (A)', 0, 5, ''),
(368, 368, 'Mínimo (A)', 0, 1000, ''),
(369, 369, 'Mínimo (A)', 0, 5, ''),
(370, 370, 'Mínimo (A)', 0, 250, ''),
(371, 371, 'Mínimo (A)', 0, 200, ''),
(372, 372, 'Mínimo (A)', 0, 1, ''),
(373, 373, 'Mínimo (A)', 0, 150, ''),
(374, 374, 'Mínimo (A)', 0, 15, ''),
(375, 375, 'Mínimo (A)', 0, 150, ''),
(376, 376, 'Mínimo (A)', 0, 100, ''),
(377, 377, 'Mínimo (A)', 0, 100, ''),
(378, 378, 'Mínimo (A)', 0, 100, ''),
(379, 379, 'Mínimo (A)', 0, 150, ''),
(380, 380, 'Mínimo (A)', 0, 150, ''),
(381, 381, 'Mínimo (A)', 0, 10, ''),
(382, 382, 'Mínimo (A)', 0, 50, ''),
(383, 383, 'Mínimo (A)', 0, 100, ''),
(384, 384, 'Mínimo (A)', 0, 5000, ''),
(385, 385, 'Mínimo (A)', 0, 100, ''),
(386, 386, 'Mínimo (A)', 0, 10, ''),
(387, 1, 'Pequeno (B)', 200, 500, ''),
(388, 2, 'Pequeno (B)', 100, 400, ''),
(389, 3, 'Pequeno (B)', 1000, 5000, ''),
(390, 4, 'Pequeno (B)', 50, 75, ''),
(391, 5, 'Pequeno (B)', 100, 400, ''),
(392, 6, 'Pequeno (B)', 100, 400, ''),
(393, 7, 'Pequeno (B)', 100, 400, ''),
(394, 8, 'Pequeno (B)', 100, 400, ''),
(395, 9, 'Pequeno (B)', 500, 1000, ''),
(396, 10, 'Pequeno (B)', 100, 400, ''),
(397, 11, 'Pequeno (B)', 100, 400, ''),
(398, 12, 'Pequeno (B)', 100, 400, ''),
(399, 13, 'Pequeno (B)', 100, 400, ''),
(400, 14, 'Pequeno (B)', 500, 1000, ''),
(401, 15, 'Pequeno (B)', 100, 400, ''),
(402, 16, 'Pequeno (B)', 2, 4, ''),
(403, 17, 'Pequeno (B)', 5000, 10000, ''),
(404, 18, 'Pequeno (B)', 2, 4, ''),
(405, 19, 'Pequeno (B)', 10, 20, ''),
(406, 20, 'Pequeno (B)', 50, 150, ''),
(407, 21, 'Pequeno (B)', 100, 200, ''),
(408, 22, 'Pequeno (B)', 100, 400, ''),
(409, 23, 'Pequeno (B)', 1, 2, ''),
(410, 24, 'Pequeno (B)', 10, 20, ''),
(411, 25, 'Pequeno (B)', 1, 2, ''),
(412, 26, 'Pequeno (B)', 500, 1000, ''),
(413, 27, 'Pequeno (B)', 20, 50, ''),
(414, 28, 'Pequeno (B)', 100, 400, ''),
(415, 29, 'Pequeno (B)', 100, 400, ''),
(416, 30, 'Pequeno (B)', 10, 20, ''),
(417, 31, 'Pequeno (B)', 30, 60, ''),
(418, 32, 'Pequeno (B)', 30, 60, ''),
(419, 33, 'Pequeno (B)', 30, 60, ''),
(420, 34, 'Pequeno (B)', 30, 60, ''),
(421, 35, 'Pequeno (B)', 10, 25, ''),
(422, 36, 'Pequeno (B)', 50, 75, ''),
(423, 37, 'Pequeno (B)', 50, 75, ''),
(424, 38, 'Pequeno (B)', 50, 75, ''),
(425, 39, 'Pequeno (B)', 10, 20, ''),
(426, 40, 'Pequeno (B)', 10, 20, ''),
(427, 41, 'Pequeno (B)', 75, 200, ''),
(428, 42, 'Pequeno (B)', 5, 10, ''),
(429, 43, 'Pequeno (B)', 500, 1000, ''),
(430, 44, 'Pequeno (B)', 2, 5, ''),
(431, 45, 'Pequeno (B)', 2, 4, ''),
(432, 46, 'Pequeno (B)', 500, 1000, ''),
(433, 47, 'Pequeno (B)', 500, 1000, ''),
(434, 48, 'Pequeno (B)', 1000, 3000, ''),
(435, 49, 'Pequeno (B)', 1000, 3000, ''),
(436, 50, 'Pequeno (B)', 0.2, 0.4, ''),
(437, 51, 'Pequeno (B)', 200, 500, ''),
(438, 52, 'Pequeno (B)', 10, 25, ''),
(439, 53, 'Pequeno (B)', 20, 50, ''),
(440, 54, 'Pequeno (B)', 20, 50, ''),
(441, 55, 'Pequeno (B)', 500, 1000, ''),
(442, 56, 'Pequeno (B)', 1000, 3000, ''),
(443, 57, 'Pequeno (B)', 1000, 3000, ''),
(444, 58, 'Pequeno (B)', 5000, 7000, ''),
(445, 59, 'Pequeno (B)', 5000, 7000, ''),
(446, 60, 'Pequeno (B)', 5000, 7000, ''),
(447, 61, 'Pequeno (B)', 50, 75, ''),
(448, 62, 'Pequeno (B)', 100, 200, ''),
(449, 63, 'Pequeno (B)', 50, 150, ''),
(450, 64, 'Pequeno (B)', 100, 200, ''),
(451, 65, 'Pequeno (B)', 1, 2, ''),
(452, 66, 'Pequeno (B)', 50, 100, ''),
(453, 67, 'Pequeno (B)', 100, 200, ''),
(454, 68, 'Pequeno (B)', 5, 10, ''),
(455, 69, 'Pequeno (B)', 100, 300, ''),
(456, 70, 'Pequeno (B)', 50, 75, ''),
(457, 71, 'Pequeno (B)', 100, 200, ''),
(458, 72, 'Pequeno (B)', 50, 150, ''),
(459, 73, 'Pequeno (B)', 100, 400, ''),
(460, 74, 'Pequeno (B)', 200, 400, ''),
(461, 75, 'Pequeno (B)', 50, 100, ''),
(462, 76, 'Pequeno (B)', 10, 20, ''),
(463, 77, 'Pequeno (B)', 10, 50, ''),
(464, 78, 'Pequeno (B)', 1, 2, ''),
(465, 79, 'Pequeno (B)', 1, 2, ''),
(466, 80, 'Pequeno (B)', 5, 10, ''),
(467, 81, 'Pequeno (B)', 1, 2, ''),
(468, 82, 'Pequeno (B)', 50, 100, ''),
(469, 83, 'Pequeno (B)', 1000, 3000, ''),
(470, 84, 'Pequeno (B)', 10, 30, ''),
(471, 85, 'Pequeno (B)', 1000, 3000, ''),
(472, 86, 'Pequeno (B)', 10, 30, ''),
(473, 87, 'Pequeno (B)', 10, 30, ''),
(474, 88, 'Pequeno (B)', 3, 7, ''),
(475, 89, 'Pequeno (B)', 10, 30, ''),
(476, 90, 'Pequeno (B)', 500, 1000, ''),
(477, 91, 'Pequeno (B)', 500, 1000, ''),
(478, 92, 'Pequeno (B)', 5000, 7000, ''),
(479, 93, 'Pequeno (B)', 1000, 10000, ''),
(480, 94, 'Pequeno (B)', 100, 200, ''),
(481, 95, 'Pequeno (B)', 100, 200, ''),
(482, 96, 'Pequeno (B)', 10, 20, ''),
(483, 97, 'Pequeno (B)', 1000, 10000, ''),
(484, 98, 'Pequeno (B)', 10000, 100000, ''),
(485, 99, 'Pequeno (B)', 10000, 100000, ''),
(486, 100, 'Pequeno (B)', 10, 20, ''),
(487, 101, 'Pequeno (B)', 10, 20, ''),
(488, 102, 'Pequeno (B)', 3000, 7000, ''),
(489, 103, 'Pequeno (B)', 5000, 20000, ''),
(490, 104, 'Pequeno (B)', 500, 750, ''),
(491, 105, 'Pequeno (B)', 200, 400, ''),
(492, 106, 'Pequeno (B)', 3000, 7000, ''),
(493, 107, 'Pequeno (B)', 3000, 7000, ''),
(494, 108, 'Pequeno (B)', 3000, 7000, ''),
(495, 109, 'Pequeno (B)', 500, 1000, ''),
(496, 110, 'Pequeno (B)', 500, 1000, ''),
(497, 111, 'Pequeno (B)', 500, 1000, ''),
(498, 112, 'Pequeno (B)', 500, 1000, ''),
(499, 113, 'Pequeno (B)', 500, 1000, ''),
(500, 114, 'Pequeno (B)', 500, 1000, ''),
(501, 115, 'Pequeno (B)', 10, 20, ''),
(502, 116, 'Pequeno (B)', 500, 750, ''),
(503, 117, 'Pequeno (B)', 200, 400, ''),
(504, 118, 'Pequeno (B)', 3000, 7000, ''),
(505, 119, 'Pequeno (B)', 500, 1000, ''),
(506, 120, 'Pequeno (B)', 3000, 7000, ''),
(507, 121, 'Pequeno (B)', 200, 400, ''),
(508, 122, 'Pequeno (B)', 200, 400, ''),
(509, 123, 'Pequeno (B)', 1000, 3000, ''),
(510, 124, 'Pequeno (B)', 200, 400, ''),
(511, 125, 'Pequeno (B)', 1000, 4000, ''),
(512, 126, 'Pequeno (B)', 3000, 7000, ''),
(513, 127, 'Pequeno (B)', 3000, 7000, ''),
(514, 128, 'Pequeno (B)', 3000, 7000, ''),
(515, 129, 'Pequeno (B)', 3000, 7000, ''),
(516, 130, 'Pequeno (B)', 5000, 10000, ''),
(517, 131, 'Pequeno (B)', 10000, 25000, ''),
(518, 132, 'Pequeno (B)', 3000, 7000, ''),
(519, 133, 'Pequeno (B)', 3000, 7000, ''),
(520, 134, 'Pequeno (B)', 5000, 7000, ''),
(521, 135, 'Pequeno (B)', 200, 400, ''),
(522, 136, 'Pequeno (B)', 10, 20, ''),
(523, 137, 'Pequeno (B)', 200, 400, ''),
(524, 138, 'Pequeno (B)', 500, 1000, ''),
(525, 139, 'Pequeno (B)', 5000, 20000, ''),
(526, 140, 'Pequeno (B)', 50, 100, ''),
(527, 141, 'Pequeno (B)', 5000, 20000, ''),
(528, 142, 'Pequeno (B)', 5000, 20000, ''),
(529, 143, 'Pequeno (B)', 5000, 20000, ''),
(530, 144, 'Pequeno (B)', 5000, 10000, ''),
(531, 145, 'Pequeno (B)', 5000, 20000, ''),
(532, 146, 'Pequeno (B)', 0, 0, 'Tipologia de competência do município, desde que o aterro sanitário esteja sendo licenciado por este ente federativo'),
(533, 147, 'Pequeno (B)', 500, 750, ''),
(534, 148, 'Pequeno (B)', 500, 1000, ''),
(535, 149, 'Pequeno (B)', 50, 100, ''),
(536, 150, 'Pequeno (B)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(537, 151, 'Pequeno (B)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(538, 152, 'Pequeno (B)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(539, 153, 'Pequeno (B)', 100, 200, ''),
(540, 154, 'Pequeno (B)', 100, 300, ''),
(541, 155, 'Pequeno (B)', 200, 300, ''),
(542, 156, 'Pequeno (B)', 100, 200, ''),
(543, 157, 'Pequeno (B)', 501, 1000, ''),
(544, 158, 'Pequeno (B)', 2, 5, ''),
(545, 159, 'Pequeno (B)', 10, 50, ''),
(546, 160, 'Pequeno (B)', 10, 20, ''),
(547, 161, 'Pequeno (B)', 500, 1000, ''),
(548, 162, 'Pequeno (B)', 30, 150, ''),
(549, 163, 'Pequeno (B)', 50, 200, ''),
(550, 164, 'Pequeno (B)', 1, 2, ''),
(551, 165, 'Pequeno (B)', 50, 200, ''),
(552, 166, 'Pequeno (B)', 50, 200, ''),
(553, 167, 'Pequeno (B)', 50, 200, ''),
(554, 168, 'Pequeno (B)', 50, 200, ''),
(555, 169, 'Pequeno (B)', 50, 200, ''),
(556, 170, 'Pequeno (B)', 50, 200, ''),
(557, 171, 'Pequeno (B)', 50, 200, ''),
(558, 172, 'Pequeno (B)', 50, 200, ''),
(559, 173, 'Pequeno (B)', 50, 200, ''),
(560, 174, 'Pequeno (B)', 50, 200, ''),
(561, 175, 'Pequeno (B)', 50, 200, ''),
(562, 176, 'Pequeno (B)', 50, 200, ''),
(563, 177, 'Pequeno (B)', 50, 200, ''),
(564, 178, 'Pequeno (B)', 50, 200, ''),
(565, 179, 'Pequeno (B)', 50, 200, ''),
(566, 180, 'Pequeno (B)', 50, 200, ''),
(567, 181, 'Pequeno (B)', 50, 200, ''),
(568, 182, 'Pequeno (B)', 50, 200, ''),
(569, 183, 'Pequeno (B)', 50, 200, ''),
(570, 184, 'Pequeno (B)', 50, 200, ''),
(571, 185, 'Pequeno (B)', 50, 200, ''),
(572, 186, 'Pequeno (B)', 50, 200, ''),
(573, 187, 'Pequeno (B)', 50, 200, ''),
(574, 188, 'Pequeno (B)', 50, 200, ''),
(575, 189, 'Pequeno (B)', 50, 200, ''),
(576, 190, 'Pequeno (B)', 50, 200, ''),
(577, 191, 'Pequeno (B)', 50, 200, ''),
(578, 192, 'Pequeno (B)', 50, 200, ''),
(579, 193, 'Pequeno (B)', 50, 200, ''),
(580, 194, 'Pequeno (B)', 50, 200, ''),
(581, 195, 'Pequeno (B)', 50, 200, ''),
(582, 196, 'Pequeno (B)', 50, 200, ''),
(583, 197, 'Pequeno (B)', 50, 200, ''),
(584, 198, 'Pequeno (B)', 200, 800, ''),
(585, 199, 'Pequeno (B)', 50, 200, ''),
(586, 200, 'Pequeno (B)', 400, 750, ''),
(587, 201, 'Pequeno (B)', 400, 750, ''),
(588, 202, 'Pequeno (B)', 200, 400, ''),
(589, 203, 'Pequeno (B)', 90, 150, ''),
(590, 204, 'Pequeno (B)', 50, 100, ''),
(591, 205, 'Pequeno (B)', 50, 100, ''),
(592, 206, 'Pequeno (B)', 50, 100, ''),
(593, 207, 'Pequeno (B)', 50, 100, ''),
(594, 208, 'Pequeno (B)', 50, 100, ''),
(595, 209, 'Pequeno (B)', 30, 75, ''),
(596, 210, 'Pequeno (B)', 100, 250, ''),
(597, 211, 'Pequeno (B)', 50, 100, ''),
(598, 212, 'Pequeno (B)', 50, 100, ''),
(599, 213, 'Pequeno (B)', 50, 100, ''),
(600, 214, 'Pequeno (B)', 50, 100, ''),
(601, 215, 'Pequeno (B)', 50, 100, ''),
(602, 216, 'Pequeno (B)', 50, 100, ''),
(603, 217, 'Pequeno (B)', 50, 100, ''),
(604, 218, 'Pequeno (B)', 100, 250, ''),
(605, 219, 'Pequeno (B)', 100, 250, ''),
(606, 220, 'Pequeno (B)', 400, 750, ''),
(607, 221, 'Pequeno (B)', 90, 150, ''),
(608, 222, 'Pequeno (B)', 400, 750, ''),
(609, 223, 'Pequeno (B)', 50, 100, ''),
(610, 224, 'Pequeno (B)', 200, 500, ''),
(611, 225, 'Pequeno (B)', 500, 800, ''),
(612, 226, 'Pequeno (B)', 10, 30, ''),
(613, 227, 'Pequeno (B)', 200, 500, ''),
(614, 228, 'Pequeno (B)', 50, 150, ''),
(615, 229, 'Pequeno (B)', 200, 500, ''),
(616, 230, 'Pequeno (B)', 200, 500, ''),
(617, 231, 'Pequeno (B)', 500, 1000, ''),
(618, 232, 'Pequeno (B)', 4, 10, ''),
(619, 233, 'Pequeno (B)', 3, 15, ''),
(620, 234, 'Pequeno (B)', 30000, 90000, ''),
(621, 235, 'Pequeno (B)', 5, 20, ''),
(622, 236, 'Pequeno (B)', 1000, 5000, ''),
(623, 237, 'Pequeno (B)', 10, 30, ''),
(624, 238, 'Pequeno (B)', 1000, 2000, ''),
(625, 239, 'Pequeno (B)', 2000, 6000, ''),
(626, 240, 'Pequeno (B)', 0, 0, ''),
(627, 241, 'Pequeno (B)', 50, 200, ''),
(628, 242, 'Pequeno (B)', 0.1, 0.2, ''),
(629, 243, 'Pequeno (B)', 4, 10, ''),
(630, 244, 'Pequeno (B)', 4, 10, ''),
(631, 245, 'Pequeno (B)', 10, 50, ''),
(632, 246, 'Pequeno (B)', 50, 200, ''),
(633, 247, 'Pequeno (B)', 300, 750, ''),
(634, 248, 'Pequeno (B)', 10, 25, ''),
(635, 249, 'Pequeno (B)', 10, 25, ''),
(636, 250, 'Pequeno (B)', 0.5, 1, ''),
(637, 251, 'Pequeno (B)', 2, 7, ''),
(638, 252, 'Pequeno (B)', 50, 200, ''),
(639, 253, 'Pequeno (B)', 50, 200, ''),
(640, 254, 'Pequeno (B)', 2, 7, ''),
(641, 255, 'Pequeno (B)', 5000, 10000, ''),
(642, 256, 'Pequeno (B)', 0.1, 0.2, ''),
(643, 257, 'Pequeno (B)', 30, 75, ''),
(644, 258, 'Pequeno (B)', 50, 200, ''),
(645, 259, 'Pequeno (B)', 10, 20, ''),
(646, 260, 'Pequeno (B)', 50, 200, ''),
(647, 261, 'Pequeno (B)', 30, 120, ''),
(648, 262, 'Pequeno (B)', 50, 200, ''),
(649, 263, 'Pequeno (B)', 100, 400, ''),
(650, 264, 'Pequeno (B)', 100, 400, ''),
(651, 265, 'Pequeno (B)', 4, 10, ''),
(652, 266, 'Pequeno (B)', 4, 10, ''),
(653, 267, 'Pequeno (B)', 500, 1000, ''),
(654, 268, 'Pequeno (B)', 50, 150, ''),
(655, 269, 'Pequeno (B)', 50, 150, ''),
(656, 270, 'Pequeno (B)', 500, 1500, ''),
(657, 271, 'Pequeno (B)', 500, 1500, ''),
(658, 272, 'Pequeno (B)', 500, 1500, ''),
(659, 273, 'Pequeno (B)', 30, 150, ''),
(660, 274, 'Pequeno (B)', 100, 500, ''),
(661, 275, 'Pequeno (B)', 100, 300, ''),
(662, 276, 'Pequeno (B)', 500, 1500, ''),
(663, 277, 'Pequeno (B)', 10, 20, ''),
(664, 278, 'Pequeno (B)', 400, 1500, ''),
(665, 279, 'Pequeno (B)', 500, 1500, ''),
(666, 280, 'Pequeno (B)', 5, 15, ''),
(667, 281, 'Pequeno (B)', 5, 15, ''),
(668, 282, 'Pequeno (B)', 400, 1500, ''),
(669, 283, 'Pequeno (B)', 500, 1500, ''),
(670, 284, 'Pequeno (B)', 500, 1500, ''),
(671, 285, 'Pequeno (B)', 500, 1500, ''),
(672, 286, 'Pequeno (B)', 200, 500, ''),
(673, 287, 'Pequeno (B)', 200, 500, ''),
(674, 288, 'Pequeno (B)', 200, 500, ''),
(675, 289, 'Pequeno (B)', 100, 300, ''),
(676, 290, 'Pequeno (B)', 50, 150, ''),
(677, 291, 'Pequeno (B)', 50, 150, ''),
(678, 292, 'Pequeno (B)', 100, 500, ''),
(679, 293, 'Pequeno (B)', 100, 500, ''),
(680, 294, 'Pequeno (B)', 200, 500, ''),
(681, 295, 'Pequeno (B)', 200, 500, ''),
(682, 296, 'Pequeno (B)', 200, 500, ''),
(683, 297, 'Pequeno (B)', 20, 50, ''),
(684, 298, 'Pequeno (B)', 200, 500, ''),
(685, 299, 'Pequeno (B)', 50, 150, ''),
(686, 300, 'Pequeno (B)', 200, 500, ''),
(687, 301, 'Pequeno (B)', 200, 500, ''),
(688, 302, 'Pequeno (B)', 200, 500, ''),
(689, 303, 'Pequeno (B)', 200, 500, ''),
(690, 304, 'Pequeno (B)', 200, 500, ''),
(691, 305, 'Pequeno (B)', 20, 50, ''),
(692, 306, 'Pequeno (B)', 200, 500, ''),
(693, 307, 'Pequeno (B)', 200, 500, ''),
(694, 308, 'Pequeno (B)', 200, 500, ''),
(695, 309, 'Pequeno (B)', 200, 500, ''),
(696, 310, 'Pequeno (B)', 200, 500, ''),
(697, 311, 'Pequeno (B)', 500, 2000, ''),
(698, 312, 'Pequeno (B)', 500, 2000, ''),
(699, 313, 'Pequeno (B)', 1500, 5000, ''),
(700, 314, 'Pequeno (B)', 5, 20, ''),
(701, 315, 'Pequeno (B)', 300, 1000, ''),
(702, 316, 'Pequeno (B)', 100, 500, ''),
(703, 317, 'Pequeno (B)', 500, 2000, ''),
(704, 318, 'Pequeno (B)', 200, 500, ''),
(705, 319, 'Pequeno (B)', 100, 500, ''),
(706, 320, 'Pequeno (B)', 5, 20, ''),
(707, 321, 'Pequeno (B)', 100, 500, ''),
(708, 322, 'Pequeno (B)', 10, 50, ''),
(709, 323, 'Pequeno (B)', 10, 50, ''),
(710, 324, 'Pequeno (B)', 100, 500, ''),
(711, 325, 'Pequeno (B)', 500, 2000, ''),
(712, 326, 'Pequeno (B)', 10, 50, ''),
(713, 327, 'Pequeno (B)', 10, 50, ''),
(714, 328, 'Pequeno (B)', 10, 50, ''),
(715, 329, 'Pequeno (B)', 1000, 2000, ''),
(716, 330, 'Pequeno (B)', 500, 1000, ''),
(717, 331, 'Pequeno (B)', 750, 1500, ''),
(718, 332, 'Pequeno (B)', 1000, 1500, ''),
(719, 333, 'Pequeno (B)', 200, 500, ''),
(720, 334, 'Pequeno (B)', 200, 500, ''),
(721, 335, 'Pequeno (B)', 200, 500, ''),
(722, 336, 'Pequeno (B)', 1000, 5000, ''),
(723, 337, 'Pequeno (B)', 500, 2000, ''),
(724, 338, 'Pequeno (B)', 100, 200, ''),
(725, 339, 'Pequeno (B)', 1000, 8000, ''),
(726, 340, 'Pequeno (B)', 1000, 5000, ''),
(727, 341, 'Pequeno (B)', 1000, 5000, ''),
(728, 342, 'Pequeno (B)', 1000, 6000, ''),
(729, 343, 'Pequeno (B)', 200, 500, ''),
(730, 344, 'Pequeno (B)', 1000, 5000, ''),
(731, 345, 'Pequeno (B)', 200, 300, ''),
(732, 346, 'Pequeno (B)', 200, 300, ''),
(733, 347, 'Pequeno (B)', 5, 20, ''),
(734, 348, 'Pequeno (B)', 100, 200, ''),
(735, 349, 'Pequeno (B)', 25, 100, ''),
(736, 350, 'Pequeno (B)', 100, 200, ''),
(737, 351, 'Pequeno (B)', 15, 30, ''),
(738, 352, 'Pequeno (B)', 1000, 5000, ''),
(739, 353, 'Pequeno (B)', 100, 200, ''),
(740, 354, 'Pequeno (B)', 100, 200, ''),
(741, 355, 'Pequeno (B)', 200, 300, ''),
(742, 356, 'Pequeno (B)', 10, 50, ''),
(743, 357, 'Pequeno (B)', 100, 200, ''),
(744, 358, 'Pequeno (B)', 100, 200, ''),
(745, 359, 'Pequeno (B)', 100, 200, ''),
(746, 360, 'Pequeno (B)', 1, 4, ''),
(747, 361, 'Pequeno (B)', 100, 200, ''),
(748, 362, 'Pequeno (B)', 1000, 5000, ''),
(749, 363, 'Pequeno (B)', 150, 300, ''),
(750, 364, 'Pequeno (B)', 100, 200, ''),
(751, 365, 'Pequeno (B)', 100, 200, ''),
(752, 366, 'Pequeno (B)', 100, 200, ''),
(753, 367, 'Pequeno (B)', 5, 7, ''),
(754, 368, 'Pequeno (B)', 1000, 5000, ''),
(755, 369, 'Pequeno (B)', 5, 7, ''),
(756, 370, 'Pequeno (B)', 250, 400, ''),
(757, 371, 'Pequeno (B)', 200, 300, ''),
(758, 372, 'Pequeno (B)', 1, 4, ''),
(759, 373, 'Pequeno (B)', 150, 300, ''),
(760, 374, 'Pequeno (B)', 15, 30, ''),
(761, 375, 'Pequeno (B)', 150, 300, ''),
(762, 376, 'Pequeno (B)', 100, 200, ''),
(763, 377, 'Pequeno (B)', 100, 200, ''),
(764, 378, 'Pequeno (B)', 100, 200, ''),
(765, 379, 'Pequeno (B)', 150, 300, ''),
(766, 380, 'Pequeno (B)', 150, 300, ''),
(767, 381, 'Pequeno (B)', 10, 50, ''),
(768, 382, 'Pequeno (B)', 50, 150, ''),
(769, 383, 'Pequeno (B)', 100, 2000, ''),
(770, 384, 'Pequeno (B)', 5000, 30000, ''),
(771, 385, 'Pequeno (B)', 100, 200, ''),
(772, 386, 'Pequeno (B)', 10, 50, ''),
(773, 1, 'Médio (C)', 500, 1000, ''),
(774, 2, 'Médio (C)', 400, 800, ''),
(775, 3, 'Médio (C)', 5000, 10000, ''),
(776, 4, 'Médio (C)', 75, 120, ''),
(777, 5, 'Médio (C)', 400, 700, ''),
(778, 6, 'Médio (C)', 400, 700, ''),
(779, 7, 'Médio (C)', 400, 700, ''),
(780, 8, 'Médio (C)', 400, 700, ''),
(781, 9, 'Médio (C)', 1000, 2000, ''),
(782, 10, 'Médio (C)', 400, 700, ''),
(783, 11, 'Médio (C)', 400, 700, ''),
(784, 12, 'Médio (C)', 400, 700, ''),
(785, 13, 'Médio (C)', 400, 700, ''),
(786, 14, 'Médio (C)', 1000, 2000, ''),
(787, 15, 'Médio (C)', 400, 700, ''),
(788, 16, 'Médio (C)', 4, 6, ''),
(789, 17, 'Médio (C)', 10000, 20000, ''),
(790, 18, 'Médio (C)', 4, 6, ''),
(791, 19, 'Médio (C)', 20, 50, ''),
(792, 20, 'Médio (C)', 150, 220, ''),
(793, 21, 'Médio (C)', 200, 500, ''),
(794, 22, 'Médio (C)', 400, 700, ''),
(795, 23, 'Médio (C)', 2, 4, ''),
(796, 24, 'Médio (C)', 20, 30, ''),
(797, 25, 'Médio (C)', 2, 5, ''),
(798, 26, 'Médio (C)', 1000, 2000, ''),
(799, 27, 'Médio (C)', 50, 150, ''),
(800, 28, 'Médio (C)', 400, 700, ''),
(801, 29, 'Médio (C)', 400, 700, ''),
(802, 30, 'Médio (C)', 20, 30, ''),
(803, 31, 'Médio (C)', 60, 105, ''),
(804, 32, 'Médio (C)', 60, 105, ''),
(805, 33, 'Médio (C)', 60, 105, ''),
(806, 34, 'Médio (C)', 60, 105, ''),
(807, 35, 'Médio (C)', 25, 45, ''),
(808, 36, 'Médio (C)', 75, 110, ''),
(809, 37, 'Médio (C)', 75, 110, ''),
(810, 38, 'Médio (C)', 75, 110, ''),
(811, 39, 'Médio (C)', 20, 50, ''),
(812, 40, 'Médio (C)', 20, 50, ''),
(813, 41, 'Médio (C)', 200, 350, ''),
(814, 42, 'Médio (C)', 10, 15, ''),
(815, 43, 'Médio (C)', 1000, 2500, ''),
(816, 44, 'Médio (C)', 5, 7, ''),
(817, 45, 'Médio (C)', 4, 6, ''),
(818, 46, 'Médio (C)', 1000, 1500, ''),
(819, 47, 'Médio (C)', 1000, 1500, ''),
(820, 48, 'Médio (C)', 3000, 5000, ''),
(821, 49, 'Médio (C)', 3000, 5000, ''),
(822, 50, 'Médio (C)', 0.4, 0.6, ''),
(823, 51, 'Médio (C)', 500, 800, ''),
(824, 52, 'Médio (C)', 25, 35, ''),
(825, 53, 'Médio (C)', 50, 150, ''),
(826, 54, 'Médio (C)', 50, 150, ''),
(827, 55, 'Médio (C)', 1000, 2000, ''),
(828, 56, 'Médio (C)', 3000, 5000, ''),
(829, 57, 'Médio (C)', 3000, 5000, ''),
(830, 58, 'Médio (C)', 7000, 12000, ''),
(831, 59, 'Médio (C)', 7000, 12000, ''),
(832, 60, 'Médio (C)', 7000, 10000, ''),
(833, 61, 'Médio (C)', 75, 110, ''),
(834, 62, 'Médio (C)', 200, 500, ''),
(835, 63, 'Médio (C)', 150, 220, ''),
(836, 64, 'Médio (C)', 200, 500, ''),
(837, 65, 'Médio (C)', 2, 3, ''),
(838, 66, 'Médio (C)', 100, 150, ''),
(839, 67, 'Médio (C)', 200, 500, ''),
(840, 68, 'Médio (C)', 10, 15, ''),
(841, 69, 'Médio (C)', 300, 500, ''),
(842, 70, 'Médio (C)', 75, 110, ''),
(843, 71, 'Médio (C)', 200, 500, ''),
(844, 72, 'Médio (C)', 150, 220, ''),
(845, 73, 'Médio (C)', 400, 700, ''),
(846, 74, 'Médio (C)', 400, 600, ''),
(847, 75, 'Médio (C)', 100, 200, ''),
(848, 76, 'Médio (C)', 20, 30, ''),
(849, 77, 'Médio (C)', 50, 150, ''),
(850, 78, 'Médio (C)', 2, 5, ''),
(851, 79, 'Médio (C)', 2, 5, ''),
(852, 80, 'Médio (C)', 10, 20, ''),
(853, 81, 'Médio (C)', 2, 5, ''),
(854, 82, 'Médio (C)', 100, 130, ''),
(855, 83, 'Médio (C)', 3000, 5000, ''),
(856, 84, 'Médio (C)', 30, 80, ''),
(857, 85, 'Médio (C)', 3000, 5000, ''),
(858, 86, 'Médio (C)', 30, 60, ''),
(859, 87, 'Médio (C)', 30, 60, ''),
(860, 88, 'Médio (C)', 7, 12, ''),
(861, 89, 'Médio (C)', 30, 60, ''),
(862, 90, 'Médio (C)', 1000, 2000, ''),
(863, 91, 'Médio (C)', 1000, 2000, ''),
(864, 92, 'Médio (C)', 7000, 10000, ''),
(865, 93, 'Médio (C)', 10000, 25000, ''),
(866, 94, 'Médio (C)', 200, 300, ''),
(867, 95, 'Médio (C)', 200, 500, ''),
(868, 96, 'Médio (C)', 20, 50, ''),
(869, 97, 'Médio (C)', 10000, 30000, ''),
(870, 98, 'Médio (C)', 100000, 150000, ''),
(871, 99, 'Médio (C)', 100000, 150000, ''),
(872, 100, 'Médio (C)', 20, 50, ''),
(873, 101, 'Médio (C)', 20, 50, ''),
(874, 102, 'Médio (C)', 7000, 10000, ''),
(875, 103, 'Médio (C)', 20000, 50000, ''),
(876, 104, 'Médio (C)', 750, 1000, ''),
(877, 105, 'Médio (C)', 400, 600, ''),
(878, 106, 'Médio (C)', 7000, 12000, ''),
(879, 107, 'Médio (C)', 7000, 10000, ''),
(880, 108, 'Médio (C)', 7000, 10000, ''),
(881, 109, 'Médio (C)', 1000, 2000, ''),
(882, 110, 'Médio (C)', 1000, 2000, ''),
(883, 111, 'Médio (C)', 1000, 2000, ''),
(884, 112, 'Médio (C)', 1000, 2000, ''),
(885, 113, 'Médio (C)', 1000, 2000, ''),
(886, 114, 'Médio (C)', 1000, 2000, ''),
(887, 115, 'Médio (C)', 20, 30, ''),
(888, 116, 'Médio (C)', 750, 1000, ''),
(889, 117, 'Médio (C)', 400, 600, ''),
(890, 118, 'Médio (C)', 7000, 10000, ''),
(891, 119, 'Médio (C)', 1000, 2000, ''),
(892, 120, 'Médio (C)', 7000, 10000, ''),
(893, 121, 'Médio (C)', 400, 600, ''),
(894, 122, 'Médio (C)', 400, 600, ''),
(895, 123, 'Médio (C)', 3000, 5000, ''),
(896, 124, 'Médio (C)', 400, 600, ''),
(897, 125, 'Médio (C)', 4000, 7000, ''),
(898, 126, 'Médio (C)', 7000, 10000, ''),
(899, 127, 'Médio (C)', 7000, 10000, ''),
(900, 128, 'Médio (C)', 7000, 10000, ''),
(901, 129, 'Médio (C)', 7000, 10000, ''),
(902, 130, 'Médio (C)', 10000, 20000, ''),
(903, 131, 'Médio (C)', 25000, 70000, ''),
(904, 132, 'Médio (C)', 7000, 12000, ''),
(905, 133, 'Médio (C)', 7000, 12000, ''),
(906, 134, 'Médio (C)', 7000, 10000, ''),
(907, 135, 'Médio (C)', 400, 600, ''),
(908, 136, 'Médio (C)', 20, 50, ''),
(909, 137, 'Médio (C)', 400, 600, ''),
(910, 138, 'Médio (C)', 1000, 2000, ''),
(911, 139, 'Médio (C)', 20000, 70000, ''),
(912, 140, 'Médio (C)', 100, 130, ''),
(913, 141, 'Médio (C)', 20000, 50000, ''),
(914, 142, 'Médio (C)', 20000, 50000, ''),
(915, 143, 'Médio (C)', 20000, 50000, ''),
(916, 144, 'Médio (C)', 10000, 20000, ''),
(917, 145, 'Médio (C)', 20000, 50000, ''),
(918, 146, 'Médio (C)', 0, 0, 'Tipologia de competência do município, desde que o aterro sanitário esteja sendo licenciado por este ente federativo'),
(919, 147, 'Médio (C)', 750, 1000, ''),
(920, 148, 'Médio (C)', 1000, 2000, ''),
(921, 149, 'Médio (C)', 100, 250, ''),
(922, 150, 'Médio (C)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(923, 151, 'Médio (C)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(924, 152, 'Médio (C)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(925, 153, 'Médio (C)', 200, 500, ''),
(926, 154, 'Médio (C)', 300, 500, ''),
(927, 155, 'Médio (C)', 300, 500, ''),
(928, 156, 'Médio (C)', 200, 300, ''),
(929, 157, 'Médio (C)', 1000, 2000, ''),
(930, 158, 'Médio (C)', 5, 20, ''),
(931, 159, 'Médio (C)', 50, 100, ''),
(932, 160, 'Médio (C)', 20, 30, ''),
(933, 161, 'Médio (C)', 1000, 5000, ''),
(934, 162, 'Médio (C)', 150, 300, ''),
(935, 163, 'Médio (C)', 200, 400, ''),
(936, 164, 'Médio (C)', 2, 5, ''),
(937, 165, 'Médio (C)', 200, 500, ''),
(938, 166, 'Médio (C)', 200, 500, ''),
(939, 167, 'Médio (C)', 200, 500, ''),
(940, 168, 'Médio (C)', 200, 500, ''),
(941, 169, 'Médio (C)', 200, 500, ''),
(942, 170, 'Médio (C)', 200, 500, ''),
(943, 171, 'Médio (C)', 200, 500, ''),
(944, 172, 'Médio (C)', 200, 500, ''),
(945, 173, 'Médio (C)', 200, 500, ''),
(946, 174, 'Médio (C)', 200, 500, ''),
(947, 175, 'Médio (C)', 200, 500, ''),
(948, 176, 'Médio (C)', 200, 500, ''),
(949, 177, 'Médio (C)', 200, 500, ''),
(950, 178, 'Médio (C)', 200, 500, ''),
(951, 179, 'Médio (C)', 200, 500, ''),
(952, 180, 'Médio (C)', 200, 500, ''),
(953, 181, 'Médio (C)', 200, 500, ''),
(954, 182, 'Médio (C)', 200, 500, ''),
(955, 183, 'Médio (C)', 200, 500, ''),
(956, 184, 'Médio (C)', 200, 500, ''),
(957, 185, 'Médio (C)', 200, 500, ''),
(958, 186, 'Médio (C)', 200, 500, ''),
(959, 187, 'Médio (C)', 200, 500, ''),
(960, 188, 'Médio (C)', 200, 500, ''),
(961, 189, 'Médio (C)', 200, 500, ''),
(962, 190, 'Médio (C)', 200, 500, ''),
(963, 191, 'Médio (C)', 200, 500, ''),
(964, 192, 'Médio (C)', 200, 500, ''),
(965, 193, 'Médio (C)', 200, 500, ''),
(966, 194, 'Médio (C)', 200, 500, ''),
(967, 195, 'Médio (C)', 200, 500, ''),
(968, 196, 'Médio (C)', 200, 500, ''),
(969, 197, 'Médio (C)', 200, 500, ''),
(970, 198, 'Médio (C)', 800, 2000, ''),
(971, 199, 'Médio (C)', 200, 500, ''),
(972, 200, 'Médio (C)', 750, 2000, ''),
(973, 201, 'Médio (C)', 750, 2000, ''),
(974, 202, 'Médio (C)', 400, 700, ''),
(975, 203, 'Médio (C)', 150, 210, ''),
(976, 204, 'Médio (C)', 100, 250, ''),
(977, 205, 'Médio (C)', 100, 250, ''),
(978, 206, 'Médio (C)', 100, 250, ''),
(979, 207, 'Médio (C)', 100, 250, ''),
(980, 208, 'Médio (C)', 100, 250, ''),
(981, 209, 'Médio (C)', 75, 150, ''),
(982, 210, 'Médio (C)', 250, 750, ''),
(983, 211, 'Médio (C)', 100, 250, ''),
(984, 212, 'Médio (C)', 100, 250, ''),
(985, 213, 'Médio (C)', 100, 250, ''),
(986, 214, 'Médio (C)', 100, 250, ''),
(987, 215, 'Médio (C)', 100, 250, ''),
(988, 216, 'Médio (C)', 100, 250, ''),
(989, 217, 'Médio (C)', 100, 250, ''),
(990, 218, 'Médio (C)', 250, 750, ''),
(991, 219, 'Médio (C)', 250, 750, ''),
(992, 220, 'Médio (C)', 750, 2000, ''),
(993, 221, 'Médio (C)', 150, 210, ''),
(994, 222, 'Médio (C)', 750, 2000, ''),
(995, 223, 'Médio (C)', 100, 250, ''),
(996, 224, 'Médio (C)', 500, 1000, ''),
(997, 225, 'Médio (C)', 800, 2000, ''),
(998, 226, 'Médio (C)', 30, 50, ''),
(999, 227, 'Médio (C)', 500, 1000, ''),
(1000, 228, 'Médio (C)', 150, 250, ''),
(1001, 229, 'Médio (C)', 500, 1000, ''),
(1002, 230, 'Médio (C)', 500, 1000, ''),
(1003, 231, 'Médio (C)', 1000, 2000, ''),
(1004, 232, 'Médio (C)', 4, 10, ''),
(1005, 233, 'Médio (C)', 15, 27, ''),
(1006, 234, 'Médio (C)', 90000, 120000, ''),
(1007, 235, 'Médio (C)', 20, 25, ''),
(1008, 236, 'Médio (C)', 5000, 10000, ''),
(1009, 237, 'Médio (C)', 30, 60, ''),
(1010, 238, 'Médio (C)', 2000, 3000, ''),
(1011, 239, 'Médio (C)', 6000, 15000, ''),
(1012, 240, 'Médio (C)', 0, 0, ''),
(1013, 241, 'Médio (C)', 200, 400, ''),
(1014, 242, 'Médio (C)', 0.2, 0.3, ''),
(1015, 243, 'Médio (C)', 10, 20, ''),
(1016, 244, 'Médio (C)', 10, 20, ''),
(1017, 245, 'Médio (C)', 50, 75, ''),
(1018, 246, 'Médio (C)', 200, 500, ''),
(1019, 247, 'Médio (C)', 750, 3000, ''),
(1020, 248, 'Médio (C)', 25, 60, ''),
(1021, 249, 'Médio (C)', 25, 60, ''),
(1022, 250, 'Médio (C)', 1, 3, ''),
(1023, 251, 'Médio (C)', 7, 20, ''),
(1024, 252, 'Médio (C)', 200, 500, ''),
(1025, 253, 'Médio (C)', 200, 500, ''),
(1026, 254, 'Médio (C)', 7, 20, ''),
(1027, 255, 'Médio (C)', 10000, 30000, ''),
(1028, 256, 'Médio (C)', 0.2, 0.3, ''),
(1029, 257, 'Médio (C)', 75, 150, ''),
(1030, 258, 'Médio (C)', 200, 400, ''),
(1031, 259, 'Médio (C)', 20, 40, ''),
(1032, 260, 'Médio (C)', 200, 400, ''),
(1033, 261, 'Médio (C)', 120, 200, ''),
(1034, 262, 'Médio (C)', 200, 400, ''),
(1035, 263, 'Médio (C)', 400, 800, ''),
(1036, 264, 'Médio (C)', 400, 800, ''),
(1037, 265, 'Médio (C)', 10, 15, ''),
(1038, 266, 'Médio (C)', 10, 15, ''),
(1039, 267, 'Médio (C)', 1000, 2500, ''),
(1040, 268, 'Médio (C)', 150, 300, ''),
(1041, 269, 'Médio (C)', 150, 300, ''),
(1042, 270, 'Médio (C)', 1500, 2500, ''),
(1043, 271, 'Médio (C)', 1500, 2500, ''),
(1044, 272, 'Médio (C)', 1500, 2500, ''),
(1045, 273, 'Médio (C)', 150, 450, ''),
(1046, 274, 'Médio (C)', 500, 1000, ''),
(1047, 275, 'Médio (C)', 300, 750, ''),
(1048, 276, 'Médio (C)', 1500, 2500, ''),
(1049, 277, 'Médio (C)', 20, 45, ''),
(1050, 278, 'Médio (C)', 1500, 2500, ''),
(1051, 279, 'Médio (C)', 1500, 2500, ''),
(1052, 280, 'Médio (C)', 15, 30, ''),
(1053, 281, 'Médio (C)', 15, 30, ''),
(1054, 282, 'Médio (C)', 1500, 2500, ''),
(1055, 283, 'Médio (C)', 1500, 2500, ''),
(1056, 284, 'Médio (C)', 1500, 2500, ''),
(1057, 285, 'Médio (C)', 1500, 2500, ''),
(1058, 286, 'Médio (C)', 500, 1500, ''),
(1059, 287, 'Médio (C)', 500, 1500, ''),
(1060, 288, 'Médio (C)', 500, 1500, ''),
(1061, 289, 'Médio (C)', 300, 750, ''),
(1062, 290, 'Médio (C)', 150, 300, ''),
(1063, 291, 'Médio (C)', 150, 300, ''),
(1064, 292, 'Médio (C)', 500, 1000, ''),
(1065, 293, 'Médio (C)', 500, 1000, ''),
(1066, 294, 'Médio (C)', 500, 1000, ''),
(1067, 295, 'Médio (C)', 500, 1500, ''),
(1068, 296, 'Médio (C)', 500, 1000, ''),
(1069, 297, 'Médio (C)', 50, 100, ''),
(1070, 298, 'Médio (C)', 500, 1500, ''),
(1071, 299, 'Médio (C)', 150, 400, ''),
(1072, 300, 'Médio (C)', 500, 1500, ''),
(1073, 301, 'Médio (C)', 500, 1500, ''),
(1074, 302, 'Médio (C)', 500, 1500, ''),
(1075, 303, 'Médio (C)', 500, 1500, ''),
(1076, 304, 'Médio (C)', 500, 1500, ''),
(1077, 305, 'Médio (C)', 50, 100, ''),
(1078, 306, 'Médio (C)', 500, 1500, ''),
(1079, 307, 'Médio (C)', 500, 1500, ''),
(1080, 308, 'Médio (C)', 500, 1500, ''),
(1081, 309, 'Médio (C)', 500, 1500, ''),
(1082, 310, 'Médio (C)', 500, 1500, ''),
(1083, 311, 'Médio (C)', 2000, 4000, ''),
(1084, 312, 'Médio (C)', 2000, 4000, ''),
(1085, 313, 'Médio (C)', 5000, 10000, ''),
(1086, 314, 'Médio (C)', 20, 75, ''),
(1087, 315, 'Médio (C)', 1000, 2000, ''),
(1088, 316, 'Médio (C)', 500, 1000, ''),
(1089, 317, 'Médio (C)', 2000, 5000, ''),
(1090, 318, 'Médio (C)', 500, 1500, ''),
(1091, 319, 'Médio (C)', 500, 1000, ''),
(1092, 320, 'Médio (C)', 20, 75, ''),
(1093, 321, 'Médio (C)', 500, 1000, ''),
(1094, 322, 'Médio (C)', 50, 100, ''),
(1095, 323, 'Médio (C)', 50, 100, ''),
(1096, 324, 'Médio (C)', 500, 1000, ''),
(1097, 325, 'Médio (C)', 2000, 5000, ''),
(1098, 326, 'Médio (C)', 50, 100, ''),
(1099, 327, 'Médio (C)', 50, 100, ''),
(1100, 328, 'Médio (C)', 50, 100, ''),
(1101, 329, 'Médio (C)', 2000, 3000, ''),
(1102, 330, 'Médio (C)', 1000, 2500, ''),
(1103, 331, 'Médio (C)', 1500, 2500, ''),
(1104, 332, 'Médio (C)', 1500, 2500, ''),
(1105, 333, 'Médio (C)', 500, 1500, ''),
(1106, 334, 'Médio (C)', 500, 1500, ''),
(1107, 335, 'Médio (C)', 500, 1500, ''),
(1108, 336, 'Médio (C)', 5000, 10000, ''),
(1109, 337, 'Médio (C)', 2000, 5000, ''),
(1110, 338, 'Médio (C)', 200, 500, ''),
(1111, 339, 'Médio (C)', 8000, 16000, ''),
(1112, 340, 'Médio (C)', 5000, 18000, ''),
(1113, 341, 'Médio (C)', 5000, 18000, ''),
(1114, 342, 'Médio (C)', 6000, 9000, ''),
(1115, 343, 'Médio (C)', 500, 1500, ''),
(1116, 344, 'Médio (C)', 5000, 10000, ''),
(1117, 345, 'Médio (C)', 300, 500, ''),
(1118, 346, 'Médio (C)', 300, 500, ''),
(1119, 347, 'Médio (C)', 20, 35, ''),
(1120, 348, 'Médio (C)', 200, 500, ''),
(1121, 349, 'Médio (C)', 100, 300, ''),
(1122, 350, 'Médio (C)', 200, 500, ''),
(1123, 351, 'Médio (C)', 30, 50, ''),
(1124, 352, 'Médio (C)', 5000, 10000, ''),
(1125, 353, 'Médio (C)', 200, 500, ''),
(1126, 354, 'Médio (C)', 200, 500, ''),
(1127, 355, 'Médio (C)', 300, 500, ''),
(1128, 356, 'Médio (C)', 50, 75, ''),
(1129, 357, 'Médio (C)', 200, 500, ''),
(1130, 358, 'Médio (C)', 200, 500, ''),
(1131, 359, 'Médio (C)', 200, 500, ''),
(1132, 360, 'Médio (C)', 4, 6, ''),
(1133, 361, 'Médio (C)', 200, 500, ''),
(1134, 362, 'Médio (C)', 5000, 10000, ''),
(1135, 363, 'Médio (C)', 300, 500, ''),
(1136, 364, 'Médio (C)', 200, 500, ''),
(1137, 365, 'Médio (C)', 200, 500, ''),
(1138, 366, 'Médio (C)', 200, 500, ''),
(1139, 367, 'Médio (C)', 7, 10, ''),
(1140, 368, 'Médio (C)', 5000, 10000, ''),
(1141, 369, 'Médio (C)', 7, 10, ''),
(1142, 370, 'Médio (C)', 400, 750, ''),
(1143, 371, 'Médio (C)', 300, 500, ''),
(1144, 372, 'Médio (C)', 4, 6, ''),
(1145, 373, 'Médio (C)', 300, 500, ''),
(1146, 374, 'Médio (C)', 30, 50, ''),
(1147, 375, 'Médio (C)', 300, 500, ''),
(1148, 376, 'Médio (C)', 200, 500, ''),
(1149, 377, 'Médio (C)', 200, 500, ''),
(1150, 378, 'Médio (C)', 200, 500, ''),
(1151, 379, 'Médio (C)', 300, 500, ''),
(1152, 380, 'Médio (C)', 300, 500, ''),
(1153, 381, 'Médio (C)', 50, 150, ''),
(1154, 382, 'Médio (C)', 150, 500, ''),
(1155, 383, 'Médio (C)', 2000, 5000, ''),
(1156, 384, 'Médio (C)', 30000, 50000, ''),
(1157, 385, 'Médio (C)', 200, 500, ''),
(1158, 386, 'Médio (C)', 50, 75, ''),
(1159, 1, 'Grande (D)', 1000, 2000, ''),
(1160, 2, 'Grande (D)', 800, 1300, ''),
(1161, 3, 'Grande (D)', 10000, 11000, ''),
(1162, 4, 'Grande (D)', 120, 180, ''),
(1163, 5, 'Grande (D)', 700, 1200, ''),
(1164, 6, 'Grande (D)', 700, 1200, ''),
(1165, 7, 'Grande (D)', 700, 1200, ''),
(1166, 8, 'Grande (D)', 700, 1200, ''),
(1167, 9, 'Grande (D)', 2000, 3500, ''),
(1168, 10, 'Grande (D)', 700, 1200, ''),
(1169, 11, 'Grande (D)', 700, 1200, ''),
(1170, 12, 'Grande (D)', 700, 1200, ''),
(1171, 13, 'Grande (D)', 700, 1200, ''),
(1172, 14, 'Grande (D)', 2000, 3000, ''),
(1173, 15, 'Grande (D)', 700, 1200, ''),
(1174, 16, 'Grande (D)', 6, 8, ''),
(1175, 17, 'Grande (D)', 20000, 35000, ''),
(1176, 18, 'Grande (D)', 6, 8, ''),
(1177, 19, 'Grande (D)', 50, 70, ''),
(1178, 20, 'Grande (D)', 220, 350, ''),
(1179, 21, 'Grande (D)', 500, 700, ''),
(1180, 22, 'Grande (D)', 700, 1200, ''),
(1181, 23, 'Grande (D)', 4, 6, ''),
(1182, 24, 'Grande (D)', 30, 40, ''),
(1183, 25, 'Grande (D)', 5, 7, ''),
(1184, 26, 'Grande (D)', 2000, 3500, ''),
(1185, 27, 'Grande (D)', 150, 220, ''),
(1186, 28, 'Grande (D)', 700, 1200, ''),
(1187, 29, 'Grande (D)', 700, 1200, ''),
(1188, 30, 'Grande (D)', 30, 40, ''),
(1189, 31, 'Grande (D)', 105, 120, ''),
(1190, 32, 'Grande (D)', 105, 120, ''),
(1191, 33, 'Grande (D)', 105, 120, ''),
(1192, 34, 'Grande (D)', 105, 120, ''),
(1193, 35, 'Grande (D)', 45, 60, ''),
(1194, 36, 'Grande (D)', 110, 150, ''),
(1195, 37, 'Grande (D)', 110, 150, ''),
(1196, 38, 'Grande (D)', 110, 150, ''),
(1197, 39, 'Grande (D)', 50, 70, ''),
(1198, 40, 'Grande (D)', 50, 70, ''),
(1199, 41, 'Grande (D)', 350, 500, ''),
(1200, 42, 'Grande (D)', 15, 20, ''),
(1201, 43, 'Grande (D)', 2500, 3800, ''),
(1202, 44, 'Grande (D)', 7, 10, ''),
(1203, 45, 'Grande (D)', 6, 8, ''),
(1204, 46, 'Grande (D)', 1500, 2000, ''),
(1205, 47, 'Grande (D)', 1500, 2000, ''),
(1206, 48, 'Grande (D)', 5000, 7000, ''),
(1207, 49, 'Grande (D)', 5000, 7000, ''),
(1208, 50, 'Grande (D)', 0.6, 0.8, ''),
(1209, 51, 'Grande (D)', 800, 1100, ''),
(1210, 52, 'Grande (D)', 35, 45, ''),
(1211, 53, 'Grande (D)', 150, 220, ''),
(1212, 54, 'Grande (D)', 150, 220, ''),
(1213, 55, 'Grande (D)', 2000, 3500, ''),
(1214, 56, 'Grande (D)', 5000, 7000, ''),
(1215, 57, 'Grande (D)', 5000, 7000, ''),
(1216, 58, 'Grande (D)', 12000, 20000, ''),
(1217, 59, 'Grande (D)', 12000, 20000, ''),
(1218, 60, 'Grande (D)', 10000, 18000, ''),
(1219, 61, 'Grande (D)', 110, 150, ''),
(1220, 62, 'Grande (D)', 500, 700, ''),
(1221, 63, 'Grande (D)', 220, 350, ''),
(1222, 64, 'Grande (D)', 500, 700, ''),
(1223, 65, 'Grande (D)', 3, 4, ''),
(1224, 66, 'Grande (D)', 150, 250, ''),
(1225, 67, 'Grande (D)', 500, 700, ''),
(1226, 68, 'Grande (D)', 15, 20, ''),
(1227, 69, 'Grande (D)', 500, 700, ''),
(1228, 70, 'Grande (D)', 110, 150, ''),
(1229, 71, 'Grande (D)', 500, 700, ''),
(1230, 72, 'Grande (D)', 220, 350, ''),
(1231, 73, 'Grande (D)', 700, 1200, ''),
(1232, 74, 'Grande (D)', 600, 800, ''),
(1233, 75, 'Grande (D)', 200, 300, ''),
(1234, 76, 'Grande (D)', 30, 40, ''),
(1235, 77, 'Grande (D)', 150, 250, ''),
(1236, 78, 'Grande (D)', 5, 7, ''),
(1237, 79, 'Grande (D)', 5, 7, ''),
(1238, 80, 'Grande (D)', 20, 30, ''),
(1239, 81, 'Grande (D)', 5, 7, ''),
(1240, 82, 'Grande (D)', 130, 180, ''),
(1241, 83, 'Grande (D)', 5000, 7000, ''),
(1242, 84, 'Grande (D)', 80, 120, ''),
(1243, 85, 'Grande (D)', 5000, 7000, ''),
(1244, 86, 'Grande (D)', 60, 100, ''),
(1245, 87, 'Grande (D)', 60, 100, ''),
(1246, 88, 'Grande (D)', 12, 22, ''),
(1247, 89, 'Grande (D)', 60, 100, ''),
(1248, 90, 'Grande (D)', 2000, 3500, ''),
(1249, 91, 'Grande (D)', 2000, 3500, ''),
(1250, 92, 'Grande (D)', 10000, 15000, ''),
(1251, 93, 'Grande (D)', 25000, 30000, ''),
(1252, 94, 'Grande (D)', 300, 400, ''),
(1253, 95, 'Grande (D)', 500, 700, ''),
(1254, 96, 'Grande (D)', 50, 70, ''),
(1255, 97, 'Grande (D)', 30000, 45000, ''),
(1256, 98, 'Grande (D)', 150000, 200000, ''),
(1257, 99, 'Grande (D)', 150000, 200000, ''),
(1258, 100, 'Grande (D)', 50, 70, ''),
(1259, 101, 'Grande (D)', 50, 100, ''),
(1260, 102, 'Grande (D)', 10000, 13000, ''),
(1261, 103, 'Grande (D)', 50000, 70000, ''),
(1262, 104, 'Grande (D)', 1000, 1500, ''),
(1263, 105, 'Grande (D)', 600, 800, ''),
(1264, 106, 'Grande (D)', 12000, 20000, ''),
(1265, 107, 'Grande (D)', 10000, 13000, ''),
(1266, 108, 'Grande (D)', 10000, 13000, ''),
(1267, 109, 'Grande (D)', 2000, 3500, ''),
(1268, 110, 'Grande (D)', 2000, 3500, ''),
(1269, 111, 'Grande (D)', 2000, 3500, ''),
(1270, 112, 'Grande (D)', 2000, 3500, ''),
(1271, 113, 'Grande (D)', 2000, 3500, ''),
(1272, 114, 'Grande (D)', 2000, 3500, ''),
(1273, 115, 'Grande (D)', 30, 40, ''),
(1274, 116, 'Grande (D)', 1000, 1500, ''),
(1275, 117, 'Grande (D)', 600, 800, ''),
(1276, 118, 'Grande (D)', 10000, 13000, ''),
(1277, 119, 'Grande (D)', 2000, 3500, ''),
(1278, 120, 'Grande (D)', 10000, 13000, ''),
(1279, 121, 'Grande (D)', 600, 800, ''),
(1280, 122, 'Grande (D)', 600, 800, ''),
(1281, 123, 'Grande (D)', 5000, 7000, ''),
(1282, 124, 'Grande (D)', 600, 800, ''),
(1283, 125, 'Grande (D)', 7000, 10000, ''),
(1284, 126, 'Grande (D)', 10000, 13000, ''),
(1285, 127, 'Grande (D)', 10000, 13000, ''),
(1286, 128, 'Grande (D)', 10000, 13000, ''),
(1287, 129, 'Grande (D)', 10000, 13000, ''),
(1288, 130, 'Grande (D)', 20000, 35000, ''),
(1289, 131, 'Grande (D)', 70000, 130000, ''),
(1290, 132, 'Grande (D)', 12000, 20000, ''),
(1291, 133, 'Grande (D)', 12000, 20000, ''),
(1292, 134, 'Grande (D)', 10000, 15000, ''),
(1293, 135, 'Grande (D)', 600, 800, ''),
(1294, 136, 'Grande (D)', 50, 70, ''),
(1295, 137, 'Grande (D)', 600, 800, ''),
(1296, 138, 'Grande (D)', 2000, 3500, ''),
(1297, 139, 'Grande (D)', 70000, 110000, ''),
(1298, 140, 'Grande (D)', 130, 180, ''),
(1299, 141, 'Grande (D)', 50000, 70000, ''),
(1300, 142, 'Grande (D)', 50000, 70000, ''),
(1301, 143, 'Grande (D)', 50000, 70000, ''),
(1302, 144, 'Grande (D)', 20000, 35000, ''),
(1303, 145, 'Grande (D)', 50000, 70000, ''),
(1304, 146, 'Grande (D)', 0, 0, 'Tipologia de competência do município, desde que o aterro sanitário esteja sendo licenciado por este ente federativo'),
(1305, 147, 'Grande (D)', 1000, 1500, ''),
(1306, 148, 'Grande (D)', 2000, 3500, '');
INSERT INTO `lic_enquadramento_porte` (`cod`, `cod_enquadramento`, `porte`, `limite_minimo`, `limite_maximo`, `observacao`) VALUES
(1307, 149, 'Grande (D)', 250, 400, ''),
(1308, 150, 'Grande (D)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(1309, 151, 'Grande (D)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(1310, 152, 'Grande (D)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(1311, 153, 'Grande (D)', 500, 1000, ''),
(1312, 154, 'Grande (D)', 500, 1000, ''),
(1313, 155, 'Grande (D)', 500, 1000, ''),
(1314, 156, 'Grande (D)', 300, 500, ''),
(1315, 157, 'Grande (D)', 2000, 5000, ''),
(1316, 158, 'Grande (D)', 20, 50, ''),
(1317, 159, 'Grande (D)', 100, 300, ''),
(1318, 160, 'Grande (D)', 30, 60, ''),
(1319, 161, 'Grande (D)', 5000, 9000, ''),
(1320, 162, 'Grande (D)', 300, 500, ''),
(1321, 163, 'Grande (D)', 400, 600, ''),
(1322, 164, 'Grande (D)', 5, 8, ''),
(1323, 165, 'Grande (D)', 500, 800, ''),
(1324, 166, 'Grande (D)', 500, 800, ''),
(1325, 167, 'Grande (D)', 500, 800, ''),
(1326, 168, 'Grande (D)', 500, 800, ''),
(1327, 169, 'Grande (D)', 500, 800, ''),
(1328, 170, 'Grande (D)', 500, 800, ''),
(1329, 171, 'Grande (D)', 500, 800, ''),
(1330, 172, 'Grande (D)', 500, 800, ''),
(1331, 173, 'Grande (D)', 500, 800, ''),
(1332, 174, 'Grande (D)', 500, 800, ''),
(1333, 175, 'Grande (D)', 500, 800, ''),
(1334, 176, 'Grande (D)', 500, 800, ''),
(1335, 177, 'Grande (D)', 500, 800, ''),
(1336, 178, 'Grande (D)', 500, 800, ''),
(1337, 179, 'Grande (D)', 500, 800, ''),
(1338, 180, 'Grande (D)', 500, 800, ''),
(1339, 181, 'Grande (D)', 500, 800, ''),
(1340, 182, 'Grande (D)', 500, 800, ''),
(1341, 183, 'Grande (D)', 500, 800, ''),
(1342, 184, 'Grande (D)', 500, 800, ''),
(1343, 185, 'Grande (D)', 500, 800, ''),
(1344, 186, 'Grande (D)', 500, 800, ''),
(1345, 187, 'Grande (D)', 500, 800, ''),
(1346, 188, 'Grande (D)', 500, 800, ''),
(1347, 189, 'Grande (D)', 500, 800, ''),
(1348, 190, 'Grande (D)', 500, 800, ''),
(1349, 191, 'Grande (D)', 500, 800, ''),
(1350, 192, 'Grande (D)', 500, 800, ''),
(1351, 193, 'Grande (D)', 500, 800, ''),
(1352, 194, 'Grande (D)', 500, 800, ''),
(1353, 195, 'Grande (D)', 500, 800, ''),
(1354, 196, 'Grande (D)', 500, 800, ''),
(1355, 197, 'Grande (D)', 500, 800, ''),
(1356, 198, 'Grande (D)', 2000, 3000, ''),
(1357, 199, 'Grande (D)', 500, 800, ''),
(1358, 200, 'Grande (D)', 2000, 5000, ''),
(1359, 201, 'Grande (D)', 2000, 5000, ''),
(1360, 202, 'Grande (D)', 700, 900, ''),
(1361, 203, 'Grande (D)', 210, 300, ''),
(1362, 204, 'Grande (D)', 250, 500, ''),
(1363, 205, 'Grande (D)', 250, 750, ''),
(1364, 206, 'Grande (D)', 250, 750, ''),
(1365, 207, 'Grande (D)', 250, 750, ''),
(1366, 208, 'Grande (D)', 250, 750, ''),
(1367, 209, 'Grande (D)', 150, 500, ''),
(1368, 210, 'Grande (D)', 750, 2000, ''),
(1369, 211, 'Grande (D)', 250, 750, ''),
(1370, 212, 'Grande (D)', 250, 750, ''),
(1371, 213, 'Grande (D)', 250, 750, ''),
(1372, 214, 'Grande (D)', 250, 750, ''),
(1373, 215, 'Grande (D)', 250, 750, ''),
(1374, 216, 'Grande (D)', 250, 750, ''),
(1375, 217, 'Grande (D)', 250, 750, ''),
(1376, 218, 'Grande (D)', 750, 2000, ''),
(1377, 219, 'Grande (D)', 750, 2000, ''),
(1378, 220, 'Grande (D)', 2000, 5000, ''),
(1379, 221, 'Grande (D)', 210, 300, ''),
(1380, 222, 'Grande (D)', 2000, 5000, ''),
(1381, 223, 'Grande (D)', 250, 750, ''),
(1382, 224, 'Grande (D)', 1000, 2000, ''),
(1383, 225, 'Grande (D)', 2000, 4000, ''),
(1384, 226, 'Grande (D)', 50, 100, ''),
(1385, 227, 'Grande (D)', 1000, 2000, ''),
(1386, 228, 'Grande (D)', 250, 400, ''),
(1387, 229, 'Grande (D)', 1000, 2000, ''),
(1388, 230, 'Grande (D)', 1000, 2000, ''),
(1389, 231, 'Grande (D)', 2000, 10000, ''),
(1390, 232, 'Grande (D)', 10, 20, ''),
(1391, 233, 'Grande (D)', 27, 40, ''),
(1392, 234, 'Grande (D)', 120000, 150000, ''),
(1393, 235, 'Grande (D)', 25, 30, ''),
(1394, 236, 'Grande (D)', 10000, 20000, ''),
(1395, 237, 'Grande (D)', 60, 100, ''),
(1396, 238, 'Grande (D)', 3000, 4000, ''),
(1397, 239, 'Grande (D)', 15000, 50000, ''),
(1398, 240, 'Grande (D)', 0, 0, ''),
(1399, 241, 'Grande (D)', 400, 750, ''),
(1400, 242, 'Grande (D)', 0.3, 0.4, ''),
(1401, 243, 'Grande (D)', 20, 50, ''),
(1402, 244, 'Grande (D)', 20, 50, ''),
(1403, 245, 'Grande (D)', 75, 150, ''),
(1404, 246, 'Grande (D)', 500, 1000, ''),
(1405, 247, 'Grande (D)', 3000, 6000, ''),
(1406, 248, 'Grande (D)', 60, 90, ''),
(1407, 249, 'Grande (D)', 60, 90, ''),
(1408, 250, 'Grande (D)', 3, 6, ''),
(1409, 251, 'Grande (D)', 20, 30, ''),
(1410, 252, 'Grande (D)', 500, 1000, ''),
(1411, 253, 'Grande (D)', 500, 1000, ''),
(1412, 254, 'Grande (D)', 20, 30, ''),
(1413, 255, 'Grande (D)', 30000, 50000, ''),
(1414, 256, 'Grande (D)', 0.3, 0.4, ''),
(1415, 257, 'Grande (D)', 150, 300, ''),
(1416, 258, 'Grande (D)', 400, 750, ''),
(1417, 259, 'Grande (D)', 40, 60, ''),
(1418, 260, 'Grande (D)', 400, 750, ''),
(1419, 261, 'Grande (D)', 200, 350, ''),
(1420, 262, 'Grande (D)', 400, 750, ''),
(1421, 263, 'Grande (D)', 800, 1200, ''),
(1422, 264, 'Grande (D)', 800, 1200, ''),
(1423, 265, 'Grande (D)', 15, 30, ''),
(1424, 266, 'Grande (D)', 15, 30, ''),
(1425, 267, 'Grande (D)', 2500, 5000, ''),
(1426, 268, 'Grande (D)', 300, 800, ''),
(1427, 269, 'Grande (D)', 300, 800, ''),
(1428, 270, 'Grande (D)', 2500, 4000, ''),
(1429, 271, 'Grande (D)', 2500, 4000, ''),
(1430, 272, 'Grande (D)', 2500, 4000, ''),
(1431, 273, 'Grande (D)', 450, 1000, ''),
(1432, 274, 'Grande (D)', 1000, 2000, ''),
(1433, 275, 'Grande (D)', 750, 1500, ''),
(1434, 276, 'Grande (D)', 2500, 4000, ''),
(1435, 277, 'Grande (D)', 45, 75, ''),
(1436, 278, 'Grande (D)', 2500, 4000, ''),
(1437, 279, 'Grande (D)', 2500, 4000, ''),
(1438, 280, 'Grande (D)', 30, 50, ''),
(1439, 281, 'Grande (D)', 30, 50, ''),
(1440, 282, 'Grande (D)', 2500, 4000, ''),
(1441, 283, 'Grande (D)', 2500, 4000, ''),
(1442, 284, 'Grande (D)', 2500, 4000, ''),
(1443, 285, 'Grande (D)', 2500, 4000, ''),
(1444, 286, 'Grande (D)', 1500, 3000, ''),
(1445, 287, 'Grande (D)', 1500, 3000, ''),
(1446, 288, 'Grande (D)', 1500, 3000, ''),
(1447, 289, 'Grande (D)', 750, 1500, ''),
(1448, 290, 'Grande (D)', 300, 800, ''),
(1449, 291, 'Grande (D)', 300, 800, ''),
(1450, 292, 'Grande (D)', 1000, 2000, ''),
(1451, 293, 'Grande (D)', 1000, 2000, ''),
(1452, 294, 'Grande (D)', 1000, 2000, ''),
(1453, 295, 'Grande (D)', 1500, 3000, ''),
(1454, 296, 'Grande (D)', 1000, 2000, ''),
(1455, 297, 'Grande (D)', 100, 200, ''),
(1456, 298, 'Grande (D)', 1500, 3000, ''),
(1457, 299, 'Grande (D)', 400, 800, ''),
(1458, 300, 'Grande (D)', 1500, 3000, ''),
(1459, 301, 'Grande (D)', 1500, 3000, ''),
(1460, 302, 'Grande (D)', 1500, 3000, ''),
(1461, 303, 'Grande (D)', 1500, 3000, ''),
(1462, 304, 'Grande (D)', 1500, 3000, ''),
(1463, 305, 'Grande (D)', 100, 200, ''),
(1464, 306, 'Grande (D)', 1500, 3000, ''),
(1465, 307, 'Grande (D)', 1500, 3000, ''),
(1466, 308, 'Grande (D)', 1500, 3000, ''),
(1467, 309, 'Grande (D)', 1500, 3000, ''),
(1468, 310, 'Grande (D)', 1500, 3000, ''),
(1469, 311, 'Grande (D)', 4000, 6000, ''),
(1470, 312, 'Grande (D)', 4000, 6000, ''),
(1471, 313, 'Grande (D)', 10000, 15000, ''),
(1472, 314, 'Grande (D)', 75, 150, ''),
(1473, 315, 'Grande (D)', 2000, 3000, ''),
(1474, 316, 'Grande (D)', 1000, 2000, ''),
(1475, 317, 'Grande (D)', 5000, 10000, ''),
(1476, 318, 'Grande (D)', 1500, 3000, ''),
(1477, 319, 'Grande (D)', 1000, 2000, ''),
(1478, 320, 'Grande (D)', 75, 150, ''),
(1479, 321, 'Grande (D)', 1000, 2000, ''),
(1480, 322, 'Grande (D)', 100, 200, ''),
(1481, 323, 'Grande (D)', 100, 200, ''),
(1482, 324, 'Grande (D)', 1000, 2000, ''),
(1483, 325, 'Grande (D)', 5000, 10000, ''),
(1484, 326, 'Grande (D)', 100, 200, ''),
(1485, 327, 'Grande (D)', 100, 200, ''),
(1486, 328, 'Grande (D)', 100, 200, ''),
(1487, 329, 'Grande (D)', 3000, 4000, ''),
(1488, 330, 'Grande (D)', 2500, 3000, ''),
(1489, 331, 'Grande (D)', 2500, 3500, ''),
(1490, 332, 'Grande (D)', 2500, 3500, ''),
(1491, 333, 'Grande (D)', 1500, 3000, ''),
(1492, 334, 'Grande (D)', 1500, 3000, ''),
(1493, 335, 'Grande (D)', 1500, 3000, ''),
(1494, 336, 'Grande (D)', 10000, 20000, ''),
(1495, 337, 'Grande (D)', 5000, 10000, ''),
(1496, 338, 'Grande (D)', 500, 1000, ''),
(1497, 339, 'Grande (D)', 16000, 36000, ''),
(1498, 340, 'Grande (D)', 18000, 25000, ''),
(1499, 341, 'Grande (D)', 18000, 25000, ''),
(1500, 342, 'Grande (D)', 9000, 12000, ''),
(1501, 343, 'Grande (D)', 1500, 3000, ''),
(1502, 344, 'Grande (D)', 10000, 15000, ''),
(1503, 345, 'Grande (D)', 500, 1000, ''),
(1504, 346, 'Grande (D)', 500, 1000, ''),
(1505, 347, 'Grande (D)', 35, 50, ''),
(1506, 348, 'Grande (D)', 500, 1000, ''),
(1507, 349, 'Grande (D)', 300, 750, ''),
(1508, 350, 'Grande (D)', 500, 1000, ''),
(1509, 351, 'Grande (D)', 50, 70, ''),
(1510, 352, 'Grande (D)', 10000, 15000, ''),
(1511, 353, 'Grande (D)', 500, 1000, ''),
(1512, 354, 'Grande (D)', 500, 1000, ''),
(1513, 355, 'Grande (D)', 500, 1000, ''),
(1514, 356, 'Grande (D)', 75, 150, ''),
(1515, 357, 'Grande (D)', 500, 1000, ''),
(1516, 358, 'Grande (D)', 500, 1000, ''),
(1517, 359, 'Grande (D)', 500, 1000, ''),
(1518, 360, 'Grande (D)', 6, 10, ''),
(1519, 361, 'Grande (D)', 500, 1000, ''),
(1520, 362, 'Grande (D)', 10000, 15000, ''),
(1521, 363, 'Grande (D)', 500, 1000, ''),
(1522, 364, 'Grande (D)', 500, 1000, ''),
(1523, 365, 'Grande (D)', 500, 1000, ''),
(1524, 366, 'Grande (D)', 500, 1000, ''),
(1525, 367, 'Grande (D)', 10, 15, ''),
(1526, 368, 'Grande (D)', 10000, 15000, ''),
(1527, 369, 'Grande (D)', 10, 15, ''),
(1528, 370, 'Grande (D)', 750, 1500, ''),
(1529, 371, 'Grande (D)', 500, 1000, ''),
(1530, 372, 'Grande (D)', 6, 10, ''),
(1531, 373, 'Grande (D)', 500, 1000, ''),
(1532, 374, 'Grande (D)', 50, 100, ''),
(1533, 375, 'Grande (D)', 500, 1000, ''),
(1534, 376, 'Grande (D)', 500, 1000, ''),
(1535, 377, 'Grande (D)', 500, 1000, ''),
(1536, 378, 'Grande (D)', 500, 1000, ''),
(1537, 379, 'Grande (D)', 500, 1000, ''),
(1538, 380, 'Grande (D)', 500, 1000, ''),
(1539, 381, 'Grande (D)', 150, 300, ''),
(1540, 382, 'Grande (D)', 500, 1000, ''),
(1541, 383, 'Grande (D)', 5000, 10000, ''),
(1542, 384, 'Grande (D)', 50000, 1000, ''),
(1543, 385, 'Grande (D)', 500, 1000, ''),
(1544, 386, 'Grande (D)', 75, 150, ''),
(1545, 1, 'Exepcional (E)', 2000, 3000, ''),
(1546, 2, 'Exepcional (E)', 1300, 2000, ''),
(1547, 3, 'Exepcional (E)', 11000, 12000, ''),
(1548, 4, 'Exepcional (E)', 180, 250, ''),
(1549, 5, 'Exepcional (E)', 1200, 2000, ''),
(1550, 6, 'Exepcional (E)', 1200, 2000, ''),
(1551, 7, 'Exepcional (E)', 1200, 2000, ''),
(1552, 8, 'Exepcional (E)', 1200, 2000, ''),
(1553, 9, 'Exepcional (E)', 3500, 5000, ''),
(1554, 10, 'Exepcional (E)', 1200, 2000, ''),
(1555, 11, 'Exepcional (E)', 1200, 2000, ''),
(1556, 12, 'Exepcional (E)', 1200, 2000, ''),
(1557, 13, 'Exepcional (E)', 1200, 2000, ''),
(1558, 14, 'Exepcional (E)', 3000, 4000, ''),
(1559, 15, 'Exepcional (E)', 1200, 2000, ''),
(1560, 16, 'Exepcional (E)', 8, 10, ''),
(1561, 17, 'Exepcional (E)', 35000, 50000, ''),
(1562, 18, 'Exepcional (E)', 8, 10, ''),
(1563, 19, 'Exepcional (E)', 70, 100, ''),
(1564, 20, 'Exepcional (E)', 350, 500, ''),
(1565, 21, 'Exepcional (E)', 700, 1000, ''),
(1566, 22, 'Exepcional (E)', 1200, 2000, ''),
(1567, 23, 'Exepcional (E)', 6, 8, ''),
(1568, 24, 'Exepcional (E)', 40, 50, ''),
(1569, 25, 'Exepcional (E)', 7, 10, ''),
(1570, 26, 'Exepcional (E)', 3500, 5000, ''),
(1571, 27, 'Exepcional (E)', 220, 300, ''),
(1572, 28, 'Exepcional (E)', 1200, 2000, ''),
(1573, 29, 'Exepcional (E)', 1200, 2000, ''),
(1574, 30, 'Exepcional (E)', 40, 50, ''),
(1575, 31, 'Exepcional (E)', 120, 150, ''),
(1576, 32, 'Exepcional (E)', 120, 150, ''),
(1577, 33, 'Exepcional (E)', 120, 150, ''),
(1578, 34, 'Exepcional (E)', 120, 150, ''),
(1579, 35, 'Exepcional (E)', 60, 70, ''),
(1580, 36, 'Exepcional (E)', 150, 200, ''),
(1581, 37, 'Exepcional (E)', 150, 200, ''),
(1582, 38, 'Exepcional (E)', 150, 200, ''),
(1583, 39, 'Exepcional (E)', 70, 100, ''),
(1584, 40, 'Exepcional (E)', 70, 100, ''),
(1585, 41, 'Exepcional (E)', 500, 800, ''),
(1586, 42, 'Exepcional (E)', 20, 25, ''),
(1587, 43, 'Exepcional (E)', 3800, 5000, ''),
(1588, 44, 'Exepcional (E)', 10, 15, ''),
(1589, 45, 'Exepcional (E)', 8, 10, ''),
(1590, 46, 'Exepcional (E)', 2000, 3000, ''),
(1591, 47, 'Exepcional (E)', 2000, 3000, ''),
(1592, 48, 'Exepcional (E)', 7000, 10000, ''),
(1593, 49, 'Exepcional (E)', 7000, 10000, ''),
(1594, 50, 'Exepcional (E)', 0.8, 1, ''),
(1595, 51, 'Exepcional (E)', 0, 1100, ''),
(1596, 52, 'Exepcional (E)', 45, 60, ''),
(1597, 53, 'Exepcional (E)', 220, 300, ''),
(1598, 54, 'Exepcional (E)', 220, 300, ''),
(1599, 55, 'Exepcional (E)', 3500, 5000, ''),
(1600, 56, 'Exepcional (E)', 7000, 10000, ''),
(1601, 57, 'Exepcional (E)', 7000, 10000, ''),
(1602, 58, 'Exepcional (E)', 20000, 30000, ''),
(1603, 59, 'Exepcional (E)', 20000, 30000, ''),
(1604, 60, 'Exepcional (E)', 18000, 25000, ''),
(1605, 61, 'Exepcional (E)', 150, 200, ''),
(1606, 62, 'Exepcional (E)', 700, 1000, ''),
(1607, 63, 'Exepcional (E)', 350, 500, ''),
(1608, 64, 'Exepcional (E)', 700, 1000, ''),
(1609, 65, 'Exepcional (E)', 4, 6, ''),
(1610, 66, 'Exepcional (E)', 250, 400, ''),
(1611, 67, 'Exepcional (E)', 700, 1000, ''),
(1612, 68, 'Exepcional (E)', 20, 30, ''),
(1613, 69, 'Exepcional (E)', 700, 1200, ''),
(1614, 70, 'Exepcional (E)', 150, 200, ''),
(1615, 71, 'Exepcional (E)', 700, 1000, ''),
(1616, 72, 'Exepcional (E)', 350, 500, ''),
(1617, 73, 'Exepcional (E)', 1200, 2000, ''),
(1618, 74, 'Exepcional (E)', 800, 1000, ''),
(1619, 75, 'Exepcional (E)', 300, 500, ''),
(1620, 76, 'Exepcional (E)', 40, 50, ''),
(1621, 77, 'Exepcional (E)', 250, 300, ''),
(1622, 78, 'Exepcional (E)', 7, 10, ''),
(1623, 79, 'Exepcional (E)', 7, 10, ''),
(1624, 80, 'Exepcional (E)', 30, 50, ''),
(1625, 81, 'Exepcional (E)', 7, 10, ''),
(1626, 82, 'Exepcional (E)', 180, 200, ''),
(1627, 83, 'Exepcional (E)', 7000, 10000, ''),
(1628, 84, 'Exepcional (E)', 120, 180, ''),
(1629, 85, 'Exepcional (E)', 7000, 10000, ''),
(1630, 86, 'Exepcional (E)', 100, 138, ''),
(1631, 87, 'Exepcional (E)', 100, 138, ''),
(1632, 88, 'Exepcional (E)', 22, 34.5, ''),
(1633, 89, 'Exepcional (E)', 100, 138, ''),
(1634, 90, 'Exepcional (E)', 3500, 5000, ''),
(1635, 91, 'Exepcional (E)', 3500, 5000, ''),
(1636, 92, 'Exepcional (E)', 15000, 20000, ''),
(1637, 93, 'Exepcional (E)', 30000, 40000, ''),
(1638, 94, 'Exepcional (E)', 400, 500, ''),
(1639, 95, 'Exepcional (E)', 700, 1000, ''),
(1640, 96, 'Exepcional (E)', 70, 100, ''),
(1641, 97, 'Exepcional (E)', 45000, 60000, ''),
(1642, 98, 'Exepcional (E)', 200000, 300000, ''),
(1643, 99, 'Exepcional (E)', 200000, 300000, ''),
(1644, 100, 'Exepcional (E)', 70, 100, ''),
(1645, 101, 'Exepcional (E)', 100, 150, ''),
(1646, 102, 'Exepcional (E)', 13000, 18000, ''),
(1647, 103, 'Exepcional (E)', 70000, 100000, ''),
(1648, 104, 'Exepcional (E)', 1500, 2500, ''),
(1649, 105, 'Exepcional (E)', 800, 1000, ''),
(1650, 106, 'Exepcional (E)', 20000, 30000, ''),
(1651, 107, 'Exepcional (E)', 13000, 18000, ''),
(1652, 108, 'Exepcional (E)', 13000, 18000, ''),
(1653, 109, 'Exepcional (E)', 3500, 5000, ''),
(1654, 110, 'Exepcional (E)', 3500, 5000, ''),
(1655, 111, 'Exepcional (E)', 3500, 5000, ''),
(1656, 112, 'Exepcional (E)', 3500, 5000, ''),
(1657, 113, 'Exepcional (E)', 3500, 5000, ''),
(1658, 114, 'Exepcional (E)', 3500, 5000, ''),
(1659, 115, 'Exepcional (E)', 40, 50, ''),
(1660, 116, 'Exepcional (E)', 1500, 3000, ''),
(1661, 117, 'Exepcional (E)', 800, 1000, ''),
(1662, 118, 'Exepcional (E)', 13000, 18000, ''),
(1663, 119, 'Exepcional (E)', 3500, 5000, ''),
(1664, 120, 'Exepcional (E)', 13000, 18000, ''),
(1665, 121, 'Exepcional (E)', 800, 1000, ''),
(1666, 122, 'Exepcional (E)', 800, 1000, ''),
(1667, 123, 'Exepcional (E)', 7000, 10000, ''),
(1668, 124, 'Exepcional (E)', 800, 1000, ''),
(1669, 125, 'Exepcional (E)', 10000, 13000, ''),
(1670, 126, 'Exepcional (E)', 13000, 17000, ''),
(1671, 127, 'Exepcional (E)', 13000, 17000, ''),
(1672, 128, 'Exepcional (E)', 13000, 17000, ''),
(1673, 129, 'Exepcional (E)', 13000, 17000, ''),
(1674, 130, 'Exepcional (E)', 35000, 50000, ''),
(1675, 131, 'Exepcional (E)', 130000, 200000, ''),
(1676, 132, 'Exepcional (E)', 20000, 28800, ''),
(1677, 133, 'Exepcional (E)', 20000, 30000, ''),
(1678, 134, 'Exepcional (E)', 15000, 20000, ''),
(1679, 135, 'Exepcional (E)', 800, 1000, ''),
(1680, 136, 'Exepcional (E)', 70, 100, ''),
(1681, 137, 'Exepcional (E)', 800, 1000, ''),
(1682, 138, 'Exepcional (E)', 3500, 5000, ''),
(1683, 139, 'Exepcional (E)', 110000, 150000, ''),
(1684, 140, 'Exepcional (E)', 180, 200, ''),
(1685, 141, 'Exepcional (E)', 70000, 100000, ''),
(1686, 142, 'Exepcional (E)', 70000, 100000, ''),
(1687, 143, 'Exepcional (E)', 70000, 100000, ''),
(1688, 144, 'Exepcional (E)', 35000, 50000, ''),
(1689, 145, 'Exepcional (E)', 70000, 100000, ''),
(1690, 146, 'Exepcional (E)', 0, 0, 'Tipologia de competência do município, desde que o aterro sanitário esteja sendo licenciado por este ente federativo'),
(1691, 147, 'Exepcional (E)', 1500, 2500, ''),
(1692, 148, 'Exepcional (E)', 3500, 5000, ''),
(1693, 149, 'Exepcional (E)', 400, 600, ''),
(1694, 150, 'Exepcional (E)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(1695, 151, 'Exepcional (E)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(1696, 152, 'Exepcional (E)', 0, 0, 'Atividade Secundária, dependente do porte da atividade principal licenciada pelo município'),
(1697, 153, 'Exepcional (E)', 1000, 0, ''),
(1698, 154, 'Exepcional (E)', 1000, 0, ''),
(1699, 155, 'Exepcional (E)', 1000, 0, ''),
(1700, 156, 'Exepcional (E)', 500, 0, ''),
(1701, 157, 'Exepcional (E)', 5000, 0, ''),
(1702, 158, 'Exepcional (E)', 50, 0, ''),
(1703, 159, 'Exepcional (E)', 300, 0, ''),
(1704, 160, 'Exepcional (E)', 60, 0, ''),
(1705, 161, 'Exepcional (E)', 9000, 0, ''),
(1706, 162, 'Exepcional (E)', 500, 0, ''),
(1707, 163, 'Exepcional (E)', 600, 0, ''),
(1708, 164, 'Exepcional (E)', 8, 0, ''),
(1709, 165, 'Exepcional (E)', 800, 0, ''),
(1710, 166, 'Exepcional (E)', 800, 0, ''),
(1711, 167, 'Exepcional (E)', 800, 0, ''),
(1712, 168, 'Exepcional (E)', 800, 0, ''),
(1713, 169, 'Exepcional (E)', 800, 0, ''),
(1714, 170, 'Exepcional (E)', 800, 0, ''),
(1715, 171, 'Exepcional (E)', 800, 0, ''),
(1716, 172, 'Exepcional (E)', 800, 0, ''),
(1717, 173, 'Exepcional (E)', 800, 0, ''),
(1718, 174, 'Exepcional (E)', 800, 0, ''),
(1719, 175, 'Exepcional (E)', 800, 0, ''),
(1720, 176, 'Exepcional (E)', 800, 0, ''),
(1721, 177, 'Exepcional (E)', 800, 0, ''),
(1722, 178, 'Exepcional (E)', 800, 0, ''),
(1723, 179, 'Exepcional (E)', 800, 0, ''),
(1724, 180, 'Exepcional (E)', 800, 0, ''),
(1725, 181, 'Exepcional (E)', 800, 0, ''),
(1726, 182, 'Exepcional (E)', 800, 0, ''),
(1727, 183, 'Exepcional (E)', 800, 0, ''),
(1728, 184, 'Exepcional (E)', 800, 0, ''),
(1729, 185, 'Exepcional (E)', 800, 0, ''),
(1730, 186, 'Exepcional (E)', 800, 0, ''),
(1731, 187, 'Exepcional (E)', 800, 0, ''),
(1732, 188, 'Exepcional (E)', 800, 0, ''),
(1733, 189, 'Exepcional (E)', 800, 0, ''),
(1734, 190, 'Exepcional (E)', 800, 0, ''),
(1735, 191, 'Exepcional (E)', 800, 0, ''),
(1736, 192, 'Exepcional (E)', 800, 0, ''),
(1737, 193, 'Exepcional (E)', 800, 0, ''),
(1738, 194, 'Exepcional (E)', 800, 0, ''),
(1739, 195, 'Exepcional (E)', 800, 0, ''),
(1740, 196, 'Exepcional (E)', 800, 0, ''),
(1741, 197, 'Exepcional (E)', 800, 0, ''),
(1742, 198, 'Exepcional (E)', 3000, 0, ''),
(1743, 199, 'Exepcional (E)', 800, 0, ''),
(1744, 200, 'Exepcional (E)', 5000, 0, ''),
(1745, 201, 'Exepcional (E)', 5000, 0, ''),
(1746, 202, 'Exepcional (E)', 900, 0, ''),
(1747, 203, 'Exepcional (E)', 300, 0, ''),
(1748, 204, 'Exepcional (E)', 500, 0, ''),
(1749, 205, 'Exepcional (E)', 750, 0, ''),
(1750, 206, 'Exepcional (E)', 750, 0, ''),
(1751, 207, 'Exepcional (E)', 750, 0, ''),
(1752, 208, 'Exepcional (E)', 750, 0, ''),
(1753, 209, 'Exepcional (E)', 500, 0, ''),
(1754, 210, 'Exepcional (E)', 2000, 0, ''),
(1755, 211, 'Exepcional (E)', 750, 0, ''),
(1756, 212, 'Exepcional (E)', 750, 0, ''),
(1757, 213, 'Exepcional (E)', 750, 0, ''),
(1758, 214, 'Exepcional (E)', 750, 0, ''),
(1759, 215, 'Exepcional (E)', 750, 0, ''),
(1760, 216, 'Exepcional (E)', 750, 0, ''),
(1761, 217, 'Exepcional (E)', 750, 0, ''),
(1762, 218, 'Exepcional (E)', 2000, 0, ''),
(1763, 219, 'Exepcional (E)', 2000, 0, ''),
(1764, 220, 'Exepcional (E)', 5000, 0, ''),
(1765, 221, 'Exepcional (E)', 300, 0, ''),
(1766, 222, 'Exepcional (E)', 5000, 0, ''),
(1767, 223, 'Exepcional (E)', 750, 0, ''),
(1768, 224, 'Exepcional (E)', 2000, 0, ''),
(1769, 225, 'Exepcional (E)', 4000, 0, ''),
(1770, 226, 'Exepcional (E)', 100, 0, ''),
(1771, 227, 'Exepcional (E)', 2000, 0, ''),
(1772, 228, 'Exepcional (E)', 400, 0, ''),
(1773, 229, 'Exepcional (E)', 2000, 0, ''),
(1774, 230, 'Exepcional (E)', 2000, 0, ''),
(1775, 231, 'Exepcional (E)', 10000, 0, ''),
(1776, 232, 'Exepcional (E)', 20, 0, ''),
(1777, 233, 'Exepcional (E)', 40, 0, ''),
(1778, 234, 'Exepcional (E)', 150000, 0, ''),
(1779, 235, 'Exepcional (E)', 30, 0, ''),
(1780, 236, 'Exepcional (E)', 20000, 0, ''),
(1781, 237, 'Exepcional (E)', 100, 0, ''),
(1782, 238, 'Exepcional (E)', 4000, 0, ''),
(1783, 239, 'Exepcional (E)', 50000, 0, ''),
(1784, 240, 'Exepcional (E)', 0, 0, ''),
(1785, 241, 'Exepcional (E)', 750, 0, ''),
(1786, 242, 'Exepcional (E)', 0.5, 0, ''),
(1787, 243, 'Exepcional (E)', 50, 0, ''),
(1788, 244, 'Exepcional (E)', 50, 0, ''),
(1789, 245, 'Exepcional (E)', 150, 0, ''),
(1790, 246, 'Exepcional (E)', 1000, 0, ''),
(1791, 247, 'Exepcional (E)', 6000, 0, ''),
(1792, 248, 'Exepcional (E)', 90, 0, ''),
(1793, 249, 'Exepcional (E)', 90, 0, ''),
(1794, 250, 'Exepcional (E)', 6, 0, ''),
(1795, 251, 'Exepcional (E)', 30, 0, ''),
(1796, 252, 'Exepcional (E)', 1000, 0, ''),
(1797, 253, 'Exepcional (E)', 1000, 0, ''),
(1798, 254, 'Exepcional (E)', 30, 0, ''),
(1799, 255, 'Exepcional (E)', 50000, 0, ''),
(1800, 256, 'Exepcional (E)', 0.5, 0, ''),
(1801, 257, 'Exepcional (E)', 300, 0, ''),
(1802, 258, 'Exepcional (E)', 750, 0, ''),
(1803, 259, 'Exepcional (E)', 60, 0, ''),
(1804, 260, 'Exepcional (E)', 750, 0, ''),
(1805, 261, 'Exepcional (E)', 350, 0, ''),
(1806, 262, 'Exepcional (E)', 750, 0, ''),
(1807, 263, 'Exepcional (E)', 1200, 0, ''),
(1808, 264, 'Exepcional (E)', 1200, 0, ''),
(1809, 265, 'Exepcional (E)', 30, 0, ''),
(1810, 266, 'Exepcional (E)', 30, 0, ''),
(1811, 267, 'Exepcional (E)', 5000, 0, ''),
(1812, 268, 'Exepcional (E)', 800, 0, ''),
(1813, 269, 'Exepcional (E)', 800, 0, ''),
(1814, 270, 'Exepcional (E)', 4000, 0, ''),
(1815, 271, 'Exepcional (E)', 4000, 0, ''),
(1816, 272, 'Exepcional (E)', 4000, 0, ''),
(1817, 273, 'Exepcional (E)', 1000, 0, ''),
(1818, 274, 'Exepcional (E)', 2000, 0, ''),
(1819, 275, 'Exepcional (E)', 1500, 0, ''),
(1820, 276, 'Exepcional (E)', 4000, 0, ''),
(1821, 277, 'Exepcional (E)', 75, 0, ''),
(1822, 278, 'Exepcional (E)', 4000, 0, ''),
(1823, 279, 'Exepcional (E)', 4000, 0, ''),
(1824, 280, 'Exepcional (E)', 50, 0, ''),
(1825, 281, 'Exepcional (E)', 50, 0, ''),
(1826, 282, 'Exepcional (E)', 4000, 0, ''),
(1827, 283, 'Exepcional (E)', 4000, 0, ''),
(1828, 284, 'Exepcional (E)', 4000, 0, ''),
(1829, 285, 'Exepcional (E)', 4000, 0, ''),
(1830, 286, 'Exepcional (E)', 3000, 0, ''),
(1831, 287, 'Exepcional (E)', 3000, 0, ''),
(1832, 288, 'Exepcional (E)', 3000, 0, ''),
(1833, 289, 'Exepcional (E)', 1500, 0, ''),
(1834, 290, 'Exepcional (E)', 800, 0, ''),
(1835, 291, 'Exepcional (E)', 800, 0, ''),
(1836, 292, 'Exepcional (E)', 2000, 0, ''),
(1837, 293, 'Exepcional (E)', 2000, 0, ''),
(1838, 294, 'Exepcional (E)', 2000, 0, ''),
(1839, 295, 'Exepcional (E)', 3000, 0, ''),
(1840, 296, 'Exepcional (E)', 2000, 0, ''),
(1841, 297, 'Exepcional (E)', 200, 0, ''),
(1842, 298, 'Exepcional (E)', 3000, 0, ''),
(1843, 299, 'Exepcional (E)', 800, 0, ''),
(1844, 300, 'Exepcional (E)', 3000, 0, ''),
(1845, 301, 'Exepcional (E)', 3000, 0, ''),
(1846, 302, 'Exepcional (E)', 3000, 0, ''),
(1847, 303, 'Exepcional (E)', 3000, 0, ''),
(1848, 304, 'Exepcional (E)', 3000, 0, ''),
(1849, 305, 'Exepcional (E)', 200, 0, ''),
(1850, 306, 'Exepcional (E)', 3000, 0, ''),
(1851, 307, 'Exepcional (E)', 3000, 0, ''),
(1852, 308, 'Exepcional (E)', 3000, 0, ''),
(1853, 309, 'Exepcional (E)', 3000, 0, ''),
(1854, 310, 'Exepcional (E)', 3000, 0, ''),
(1855, 311, 'Exepcional (E)', 6000, 0, ''),
(1856, 312, 'Exepcional (E)', 6000, 0, ''),
(1857, 313, 'Exepcional (E)', 15000, 0, ''),
(1858, 314, 'Exepcional (E)', 150, 0, ''),
(1859, 315, 'Exepcional (E)', 3000, 0, ''),
(1860, 316, 'Exepcional (E)', 2000, 0, ''),
(1861, 317, 'Exepcional (E)', 10000, 0, ''),
(1862, 318, 'Exepcional (E)', 3000, 0, ''),
(1863, 319, 'Exepcional (E)', 2000, 0, ''),
(1864, 320, 'Exepcional (E)', 150, 0, ''),
(1865, 321, 'Exepcional (E)', 2000, 0, ''),
(1866, 322, 'Exepcional (E)', 200, 0, ''),
(1867, 323, 'Exepcional (E)', 200, 0, ''),
(1868, 324, 'Exepcional (E)', 2000, 0, ''),
(1869, 325, 'Exepcional (E)', 10000, 0, ''),
(1870, 326, 'Exepcional (E)', 200, 0, ''),
(1871, 327, 'Exepcional (E)', 200, 0, ''),
(1872, 328, 'Exepcional (E)', 200, 0, ''),
(1873, 329, 'Exepcional (E)', 4000, 0, ''),
(1874, 330, 'Exepcional (E)', 3000, 0, ''),
(1875, 331, 'Exepcional (E)', 3500, 0, ''),
(1876, 332, 'Exepcional (E)', 3500, 0, ''),
(1877, 333, 'Exepcional (E)', 3000, 0, ''),
(1878, 334, 'Exepcional (E)', 3000, 0, ''),
(1879, 335, 'Exepcional (E)', 3000, 0, ''),
(1880, 336, 'Exepcional (E)', 20000, 0, ''),
(1881, 337, 'Exepcional (E)', 10000, 0, ''),
(1882, 338, 'Exepcional (E)', 1000, 0, ''),
(1883, 339, 'Exepcional (E)', 36000, 0, ''),
(1884, 340, 'Exepcional (E)', 25000, 0, ''),
(1885, 341, 'Exepcional (E)', 25000, 0, ''),
(1886, 342, 'Exepcional (E)', 12000, 0, ''),
(1887, 343, 'Exepcional (E)', 3000, 0, ''),
(1888, 344, 'Exepcional (E)', 15000, 0, ''),
(1889, 345, 'Exepcional (E)', 1000, 0, ''),
(1890, 346, 'Exepcional (E)', 1000, 0, ''),
(1891, 347, 'Exepcional (E)', 50, 0, ''),
(1892, 348, 'Exepcional (E)', 1000, 0, ''),
(1893, 349, 'Exepcional (E)', 750, 0, ''),
(1894, 350, 'Exepcional (E)', 1000, 0, ''),
(1895, 351, 'Exepcional (E)', 70, 0, ''),
(1896, 352, 'Exepcional (E)', 15000, 0, ''),
(1897, 353, 'Exepcional (E)', 1000, 0, ''),
(1898, 354, 'Exepcional (E)', 1000, 0, ''),
(1899, 355, 'Exepcional (E)', 1000, 0, ''),
(1900, 356, 'Exepcional (E)', 150, 0, ''),
(1901, 357, 'Exepcional (E)', 1000, 0, ''),
(1902, 358, 'Exepcional (E)', 1000, 0, ''),
(1903, 359, 'Exepcional (E)', 1000, 0, ''),
(1904, 360, 'Exepcional (E)', 10, 0, ''),
(1905, 361, 'Exepcional (E)', 1000, 0, ''),
(1906, 362, 'Exepcional (E)', 15000, 0, ''),
(1907, 363, 'Exepcional (E)', 1000, 0, ''),
(1908, 364, 'Exepcional (E)', 1000, 0, ''),
(1909, 365, 'Exepcional (E)', 1000, 0, ''),
(1910, 366, 'Exepcional (E)', 1000, 0, ''),
(1911, 367, 'Exepcional (E)', 15, 0, ''),
(1912, 368, 'Exepcional (E)', 15000, 0, ''),
(1913, 369, 'Exepcional (E)', 15, 0, ''),
(1914, 370, 'Exepcional (E)', 1500, 0, ''),
(1915, 371, 'Exepcional (E)', 1000, 0, ''),
(1916, 372, 'Exepcional (E)', 10, 0, ''),
(1917, 373, 'Exepcional (E)', 1000, 0, ''),
(1918, 374, 'Exepcional (E)', 100, 0, ''),
(1919, 375, 'Exepcional (E)', 1000, 0, ''),
(1920, 376, 'Exepcional (E)', 1000, 0, ''),
(1921, 377, 'Exepcional (E)', 1000, 0, ''),
(1922, 378, 'Exepcional (E)', 1000, 0, ''),
(1923, 379, 'Exepcional (E)', 1000, 0, ''),
(1924, 380, 'Exepcional (E)', 1000, 0, ''),
(1925, 381, 'Exepcional (E)', 300, 0, ''),
(1926, 382, 'Exepcional (E)', 1000, 0, ''),
(1927, 383, 'Exepcional (E)', 10000, 0, ''),
(1928, 384, 'Exepcional (E)', 1000, 0, ''),
(1929, 385, 'Exepcional (E)', 1000, 0, ''),
(1930, 386, 'Exepcional (E)', 150, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lic_enquadramento_valor_taxa`
--

CREATE TABLE `lic_enquadramento_valor_taxa` (
  `cod` int(11) UNSIGNED NOT NULL,
  `porte` varchar(255) NOT NULL,
  `potencial` varchar(255) NOT NULL,
  `licenca` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `lic_enquadramento_valor_taxa`
--

INSERT INTO `lic_enquadramento_valor_taxa` (`cod`, `porte`, `potencial`, `licenca`, `valor`) VALUES
(1, 'Mínimo (A)', 'BAIXO (I)', 'LP - LICENÇA PRÉVIA', 'R$ 187,48'),
(2, 'Mínimo (A)', 'MÉDIO (II)', 'LP - LICENÇA PRÉVIA', 'R$ 232,22'),
(3, 'Mínimo (A)', 'ALTO (III)', 'LP - LICENÇA PRÉVIA', 'R$ 306,78'),
(4, 'Pequeno (B)', 'BAIXO (I)', 'LP - LICENÇA PRÉVIA', 'R$ 377,09'),
(5, 'Pequeno (B)', 'MÉDIO (II)', 'LP - LICENÇA PRÉVIA', 'R$ 464,44'),
(6, 'Pequeno (B)', 'ALTO (III)', 'LP - LICENÇA PRÉVIA', 'R$ 609,31'),
(7, 'Médio (C)', 'BAIXO (I)', 'LP - LICENÇA PRÉVIA', 'R$ 681,74'),
(8, 'Médio (C)', 'MÉDIO (II)', 'LP - LICENÇA PRÉVIA', 'R$ 939,53'),
(9, 'Médio (C)', 'ALTO (III)', 'LP - LICENÇA PRÉVIA', 'R$ 1.383,27'),
(10, 'Grande (D)', 'BAIXO (I)', 'LP - LICENÇA PRÉVIA', 'R$ 1.095,05'),
(11, 'Grande (D)', 'MÉDIO (II)', 'LP - LICENÇA PRÉVIA', 'R$ 1.693,71'),
(12, 'Grande (D)', 'ALTO (III)', 'LP - LICENÇA PRÉVIA', 'R$ 2.769,59'),
(13, 'Exepcional (E)', 'BAIXO (I)', 'LP - LICENÇA PRÉVIA', 'R$ 1.744,84'),
(14, 'Exepcional (E)', 'MÉDIO (II)', 'LP - LICENÇA PRÉVIA', 'R$ 3.050,80'),
(15, 'Exepcional (E)', 'ALTO (III)', 'LP - LICENÇA PRÉVIA', 'R$ 5.534,91'),
(16, 'Mínimo (A)', 'BAIXO (I)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 355,08'),
(17, 'Mínimo (A)', 'MÉDIO (II)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 431,77'),
(18, 'Mínimo (A)', 'ALTO (III)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 555,34'),
(19, 'Pequeno (B)', 'BAIXO (I)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 707,31'),
(20, 'Pequeno (B)', 'MÉDIO (II)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 856,44'),
(21, 'Pequeno (B)', 'ALTO (III)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 1.107,83'),
(22, 'Médio (C)', 'BAIXO (I)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 1.289,63'),
(23, 'Médio (C)', 'MÉDIO (II)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 1.756,91'),
(24, 'Médio (C)', 'ALTO (III)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 2.525,29'),
(25, 'Grande (D)', 'BAIXO (I)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 2.060,86'),
(26, 'Grande (D)', 'MÉDIO (II)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 3.163,01'),
(27, 'Grande (D)', 'ALTO (III)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 5.043,49'),
(28, 'Exepcional (E)', 'BAIXO (I)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 3.295,10'),
(29, 'Exepcional (E)', 'MÉDIO (II)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 5.692,56'),
(30, 'Exepcional (E)', 'ALTO (III)', 'LI - LICENÇA DE INSTALAÇÃO', 'R$ 10.084,13'),
(31, 'Mínimo (A)', 'BAIXO (I)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 355,08'),
(32, 'Mínimo (A)', 'MÉDIO (II)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 602,21'),
(33, 'Mínimo (A)', 'ALTO (III)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 951,60'),
(34, 'Pequeno (B)', 'BAIXO (I)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 712,99'),
(35, 'Pequeno (B)', 'MÉDIO (II)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 1.204,41'),
(36, 'Pequeno (B)', 'ALTO (III)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 1.903,20'),
(37, 'Médio (C)', 'BAIXO (I)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 1.292,47'),
(38, 'Médio (C)', 'MÉDIO (II)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 2.462,39'),
(39, 'Médio (C)', 'ALTO (III)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 5.050,59'),
(40, 'Grande (D)', 'BAIXO (I)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 2.059,44'),
(41, 'Grande (D)', 'MÉDIO (II)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 4.448,38'),
(42, 'Grande (D)', 'ALTO (III)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 8.669,51'),
(43, 'Exepcional (E)', 'BAIXO (I)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 3.295,10'),
(44, 'Exepcional (E)', 'MÉDIO (II)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 8.007,65'),
(45, 'Exepcional (E)', 'ALTO (III)', 'LO - LICENÇA DE OPERAÇÃO', 'R$ 17.339,02'),
(46, 'Mínimo (A)', 'BAIXO (I)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 202,90'),
(47, 'Mínimo (A)', 'MÉDIO (II)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 304,35'),
(48, 'Mínimo (A)', 'ALTO (III)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 405,80'),
(49, 'Pequeno (B)', 'BAIXO (I)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 507,25'),
(50, 'Pequeno (B)', 'MÉDIO (II)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 608,70'),
(51, 'Pequeno (B)', 'ALTO (III)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 710,15'),
(52, 'Médio (C)', 'BAIXO (I)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 811,60'),
(53, 'Médio (C)', 'MÉDIO (II)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 1.014,50'),
(54, 'Médio (C)', 'ALTO (III)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 1.521,75'),
(55, 'Grande (D)', 'BAIXO (I)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 2.029,00'),
(56, 'Grande (D)', 'MÉDIO (II)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 2.536,25'),
(57, 'Grande (D)', 'ALTO (III)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 3.043,50'),
(58, 'Exepcional (E)', 'BAIXO (I)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 5.072,50'),
(59, 'Exepcional (E)', 'MÉDIO (II)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 10.145,00'),
(60, 'Exepcional (E)', 'ALTO (III)', 'AUTORIZAÇÃO DE FUNCIONAMENTO - AF', 'R$ 15.217,50'),
(61, 'Mínimo (A)', 'BAIXO (I)', 'AUTORIZAÇÕES - AU', 'R$ 101,45'),
(62, 'Mínimo (A)', 'MÉDIO (II)', 'AUTORIZAÇÕES - AU', 'R$ 152,18'),
(63, 'Mínimo (A)', 'ALTO (III)', 'AUTORIZAÇÕES - AU', 'R$ 202,90'),
(64, 'Pequeno (B)', 'BAIXO (I)', 'AUTORIZAÇÕES - AU', 'R$ 253,63'),
(65, 'Pequeno (B)', 'MÉDIO (II)', 'AUTORIZAÇÕES - AU', 'R$ 304,35'),
(66, 'Pequeno (B)', 'ALTO (III)', 'AUTORIZAÇÕES - AU', 'R$ 355,08'),
(67, 'Médio (C)', 'BAIXO (I)', 'AUTORIZAÇÕES - AU', 'R$ 405,80'),
(68, 'Médio (C)', 'MÉDIO (II)', 'AUTORIZAÇÕES - AU', 'R$ 507,25'),
(69, 'Médio (C)', 'ALTO (III)', 'AUTORIZAÇÕES - AU', 'R$ 760,88'),
(70, 'Grande (D)', 'BAIXO (I)', 'AUTORIZAÇÕES - AU', 'R$ 1.014,50'),
(71, 'Grande (D)', 'MÉDIO (II)', 'AUTORIZAÇÕES - AU', 'R$ 1.268,13'),
(72, 'Grande (D)', 'ALTO (III)', 'AUTORIZAÇÕES - AU', 'R$ 1.521,75'),
(73, 'Exepcional (E)', 'BAIXO (I)', 'AUTORIZAÇÕES - AU', 'R$ 2.536,25'),
(74, 'Exepcional (E)', 'MÉDIO (II)', 'AUTORIZAÇÕES - AU', 'R$ 5.072,50'),
(75, 'Exepcional (E)', 'ALTO (III)', 'AUTORIZAÇÕES - AU', 'R$ 7.608,75'),
(76, 'Mínimo (A)', 'BAIXO (I)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 355,08'),
(77, 'Mínimo (A)', 'MÉDIO (II)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 602,21'),
(78, 'Mínimo (A)', 'ALTO (III)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 951,60'),
(79, 'Pequeno (B)', 'BAIXO (I)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 712,99'),
(80, 'Pequeno (B)', 'MÉDIO (II)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 1.204,41'),
(81, 'Pequeno (B)', 'ALTO (III)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 1.903,20'),
(82, 'Médio (C)', 'BAIXO (I)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 1.292,47'),
(83, 'Médio (C)', 'MÉDIO (II)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 2.462,39'),
(84, 'Médio (C)', 'ALTO (III)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 5.050,59'),
(85, 'Grande (D)', 'BAIXO (I)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 2.059,44'),
(86, 'Grande (D)', 'MÉDIO (II)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 4.448,38'),
(87, 'Grande (D)', 'ALTO (III)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 8.669,51'),
(88, 'Exepcional (E)', 'BAIXO (I)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 3.295,10'),
(89, 'Exepcional (E)', 'MÉDIO (II)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 8.007,65'),
(90, 'Exepcional (E)', 'ALTO (III)', 'LICENÇA DE ATIVIDADE RURAL - LAR', 'R$ 17.339,02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrimonio`
--

CREATE TABLE `patrimonio` (
  `id` int(10) UNSIGNED NOT NULL,
  `setor_id` int(10) UNSIGNED NOT NULL,
  `item` text NOT NULL,
  `status_tombamento_id` int(10) UNSIGNED NOT NULL,
  `numero_tombamento` varchar(30) NOT NULL,
  `ano_aquisicao` int(11) NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `classificacao_id` int(10) UNSIGNED NOT NULL,
  `fonte_recurso_id` int(10) UNSIGNED NOT NULL,
  `valor` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `anexo` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `dir_hash` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrimonio_classificacao`
--

CREATE TABLE `patrimonio_classificacao` (
  `id` int(10) UNSIGNED NOT NULL,
  `classificacao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `patrimonio_classificacao`
--

INSERT INTO `patrimonio_classificacao` (`id`, `classificacao`) VALUES
(1, 'Material de consumo'),
(2, 'Material permanente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrimonio_fonte_recurso`
--

CREATE TABLE `patrimonio_fonte_recurso` (
  `id` int(10) UNSIGNED NOT NULL,
  `fonte_recurso` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `patrimonio_fonte_recurso`
--

INSERT INTO `patrimonio_fonte_recurso` (`id`, `fonte_recurso`) VALUES
(1, 'Municipal'),
(2, 'Estadual'),
(3, 'Federal'),
(4, 'Doação de parceiros');

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrimonio_status`
--

CREATE TABLE `patrimonio_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `patrimonio_status`
--

INSERT INTO `patrimonio_status` (`id`, `status`) VALUES
(1, 'Servível'),
(2, 'Inservível');

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrimonio_tombamento`
--

CREATE TABLE `patrimonio_tombamento` (
  `id` int(10) UNSIGNED NOT NULL,
  `tombamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `patrimonio_tombamento`
--

INSERT INTO `patrimonio_tombamento` (`id`, `tombamento`) VALUES
(1, 'Tombado'),
(2, 'Sem Tombamento');

-- --------------------------------------------------------

--
-- Estrutura da tabela `protocolo`
--

CREATE TABLE `protocolo` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_id` int(10) UNSIGNED NOT NULL,
  `objetivo_id` int(10) UNSIGNED NOT NULL,
  `numero_protocolo` varchar(45) NOT NULL,
  `data` date DEFAULT NULL,
  `interessado` varchar(255) DEFAULT NULL,
  `cpf_cpnj` varchar(50) NOT NULL,
  `processo` int(11) DEFAULT NULL,
  `contato` varchar(255) DEFAULT NULL,
  `protocolista_id` int(10) UNSIGNED NOT NULL,
  `numero_folhas` varchar(45) DEFAULT NULL,
  `assunto` text DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `cidade` int(11) DEFAULT NULL,
  `bairro` int(11) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `protocolo`
--

INSERT INTO `protocolo` (`id`, `tipo_id`, `objetivo_id`, `numero_protocolo`, `data`, `interessado`, `cpf_cpnj`, `processo`, `contato`, `protocolista_id`, `numero_folhas`, `assunto`, `descricao`, `cidade`, `bairro`, `endereco`, `numero`, `latitude`, `longitude`) VALUES
(2, 2, 24, '00210/2021', '2021-09-28', 'PPF COM E SERV EIRELI', '', 0, '(91) 3721-4278', 1, '47', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-04/L.O-2021', 1, 21, 'R. PAES DE CARVALHO', '600', '', ''),
(4, 1, 4, '01344/2021', '2021-10-04', 'coordenadoria de fiscalização', '', 0, '', 1, '2', 'denuncia referente a caça irregular', '', 1, 1, '', '', '', ''),
(5, 1, 10, '01345/2021', '2021-10-04', 'coordenadoria de licenciamento', '', 0, '', 1, '4', 'juntada de processo ,copia da publicação no jornal', '', 1, 1, '', '', '', ''),
(6, 1, 10, '01346/2021', '2021-10-04', 'FAZENDA CASTANHA', '', 0, '', 1, '11', 'DOCUMENTOS PARA ANEXAR AO PROCESSO EM RESPOSTA AO TERMO DE NOTIFICAÇÃO Nº 00104/2021\r\n', '', 1, 1, '', '', '', ''),
(8, 1, 1, '01364/2021', '2021-10-07', 'PATRICK DE OLIVEIRA RAMOS ', '', 0, '', 1, '16', 'CARTA CONSULTA CNPJ:006.011.652-84', '', 1, 1, '', '', '', ''),
(9, 2, 29, '01365/2021', '2021-10-13', 'MEU QUERIDO NATAL', '', 0, '', 1, '15', 'SOLICITAÇÃO DE MADEIRA PARA MEU QUERIDO NATAL ', '', 1, 1, '', '', '', ''),
(10, 1, 17, '01382/2021', '2021-10-13', 'COMPIR', '', 0, '', 1, '3', 'OFICIO DE N:001/2021-COMPIR -CONVITE PARA REUNIÃO', '', 1, 1, '', '', '', ''),
(11, 1, 12, '01383/2021', '2021-10-13', 'MARIO MORREIRA DA CONCEIÇÃO ', '', 0, '', 1, '3', 'APLICAÇÃO DE FORMULARIO', '', 1, 1, '', '', '', ''),
(12, 1, 4, '01384/2021', '2021-10-13', 'ANONIMO', '', 0, '', 1, '2', 'DENUNCIA ANONIMA', 'DENUNCIA REFERENTE A QUEIMADA ', 1, 1, '', '', '', ''),
(13, 1, 10, '01385/2021', '2021-10-13', 'VIALE AUTOMOVEIS LTDA', '', 0, '', 1, '3', 'JUNTADA DE DOCUMENTOS ALVARA SANITARIO', 'COMPRIMENTO DE CONDICIONANTE DA LICENÇA DE OPERAÇÃO DE N:0027/2021, REQUERIDA NO PROC: N:875/2018 ', 1, 1, '', '', '', ''),
(14, 2, 29, '00223/2021', '2021-08-04', 'SEMUTRAN', '', 0, '', 1, '3', 'DOAÇÃO DE MADEIRA', '', 1, 1, '', '', '', ''),
(15, 1, 12, '00378/2021', '2021-07-09', 'AMAZON POLPAS', '', 0, '', 1, 's/n', 'Solicitação da cópia dos processos administrativos punitivos concernentes à Amazon Polpas', 'Não foi vinculado ao processo em si ainda', 1, 38, 'km 4 rod. castanhal/curuça', '', '', ''),
(19, 1, 12, '00671/2021', '2021-06-02', 'MPPA', '', 0, '', 1, '1', 'Procedimento Preparatório nº003550-040/2020 - Apurar danos de suposta infração ambiental', '', 1, 38, '', '', '', ''),
(20, 1, 10, '01386/2021', '2021-10-14', 'HIGHLINE DO BRASIL II INFRAESTRUTURA DE TELECOMUNICAÇÃO ', '', 47, '', 32, '5', 'CUMPRIMENTO DE CONDICIONANTE LP-LI', 'PUBLICAÇÃO NO DIARIO OFICIAL ', 1, 1, '', '', '', ''),
(21, 1, 12, '00898/2021', '2021-07-15', 'MPPA', '', 0, '', 22, '9', 'Procedimento Preparatório n° 000478-040/2020 - Apurar suposta infração ambiental consistente na prática de poluição sonora, ocasionada pelo exercício das atividades exercidas pelo LAVA JATO DO SEU CARLINHOS.', 'Ofício n° 183/2021 - MP/6ªPJ', 1, 21, 'RUA 1° DE MAIO', '', '', ''),
(22, 1, 12, '00897/2021', '2021-07-15', 'MPPA', '', 0, '', 22, '5', 'Notícia de Fato n° 002524-040/2021 - Apurar possível infração ambiental consistente na prática de poluição sonora/pertubação do sossego alheio oriundos do funcionamento do estabelecimento denominado BAR DO PIPA. ', 'Ofício n° 184/2021-MP/6ªPJ', 1, 38, 'RUA DO PARQUE DE EXPOSIÇÃO', '', '', ''),
(23, 1, 12, '00691/2021', '2021-06-08', 'MPPA', '', 0, '', 22, '4', 'Inquérito Civil n° 003855-040/2019 - Apurar possível infração ambiental consistente na prática de poluição sonora, ocasionada pelas atividades do estabelecimento denominado \"Lanchonete do Einstein\" ', 'Ofício nº 135/2021-MP/6ªPJ', 1, 16, 'Rua João Soares de Melo', '', '', ''),
(24, 1, 18, '01387/2021', '2021-10-14', 'LEDWYLSON SILVA CORREA', '', 0, '', 1, '2', 'ENTREGA VOLUNTARIA ', 'ENTREGA VOLUNTARIA DE UM PAPAGAIO', 1, 1, '', '', '', ''),
(25, 1, 12, '00689/2021', '2021-06-08', 'MPPA', '', 0, '', 22, '7', 'Inquérito Civil nº 006066-040/2019 - Apurar suposta infração ambiental ocasionada pela Igreja Batista Vitória em Cristo', 'Ofício n° 139/2021-MP/6ªPJ', 1, 14, 'RUA 09', '', '', ''),
(26, 1, 12, '00692/2021', '2021-06-08', 'MPPA', '', 0, '', 22, '6', 'Procedimento Administrativo n° 007311-040/2017 - Acompanhar as medidas que serão adotadas pelo Município de Castanhal para compelir o estabelecimento denominado OFICINA BOA ESPERANÇA a adequar-se às normas ambientais.', 'Ofício n° 132/2021-MP/6ªPJ', 1, 19, 'Rua Laureno Francisco Alves Melo', '', '', ''),
(27, 1, 12, '00916/2021', '2021-07-20', 'MPPA', '', 0, '', 22, '6', 'Notícia de Fato n° 002937-040/2021 - Apurar a notícia de armazenamento irregular de resíduos sólidos recicláveis.', 'Ofício n° 192/2021-MP/6ªPJ', 1, 6, 'RUA RAIMUNDO PINTO LEITE', '', '', ''),
(28, 1, 12, '00917/2021', '2021-07-20', 'MPPA', '', 0, '', 1, '4', 'Notícia de Fato n° 000530-040/2021 - Apurar notícia de possível poluição ambiental ocasionada por uma Fábrica localizada na Travessa Acre, Imperador. ', 'Ofício n° 187/2021-MP/6ªPJ', 1, 17, 'Travessa Acre', '', '', ''),
(29, 1, 12, '00950/2021', '2021-07-28', 'MPPA', '', 0, '', 22, '3', 'Inquérito Civil n° 002944-040/2016 - Apurar a notícia de eventual dano ambiental ocorrido na fonte hídrica denominada Igarapé Vermelho, localizada na Comunidade Santa Luzia, Km06 da Rodovia Castanhal - São Francisco do Pará', 'Ofício n° 204/2021-MP/6ªPJ', 1, 38, 'COMUNIDADE SANTA LUZIA', '', '', ''),
(30, 2, 29, '00194/2021', '2021-09-20', 'SECRETARIA MUNICIPAL DE SAUDE ', '', 0, '37213871', 23, '9', 'SOLICITAÇÃO DE MADEIRA PARA O HOSPITAL MUNICIPAL', '', 1, 10, '', '', '', ''),
(31, 1, 12, '00981/2021', '2021-08-04', 'MPPA', '', 0, '', 22, '5', 'Procedimento Administrativo n° 001922-040/2017 - Acompanhar e fiscalizar a atuação dos órgãos municipais para compelir a empresa CONSTRUNORTE, localizada na Trav. Floriano Peixoto nº120, Bairro Pirapora, município de Castanhal, a se adequar às normas ambientais.', 'Ofício n° 216/2021- MP/6ªPJ', 1, 25, 'TRAV. FLORIANO PEIXOTO', '', '', ''),
(32, 1, 12, '00982/2021', '2021-08-04', 'MPPA', '', 0, '', 22, '9', 'Procedimento Administrativo n° 002519-040/2016 - Acompanhar e fiscalizar a atuação dos órgãos municipais a fim de compelir o estabelecimento de oficina de manutenção e reparação de máquinas, localizada no Conjunto Tangarás, quadra 04, casa 24, Bairro Fonte Boa. a se adequar às normas ambientais.', 'Ofício n° 215/2021-MP/6ªPJ', 1, 14, '', '', '', ''),
(33, 1, 12, '00983/2021', '2021-08-04', 'MPPA', '', 0, '', 22, '11', 'Procedimento Administrativo n°001345-040/2018 - Acompanhar e fiscalizar as medidas que serão adotadas pelo Município de Castanhal e outros órgãos público, a fim de compelir o estabelecimento comercial denominado BEER HOUSE-24, localizada na Rua Kennedy, esquina com Trav. Quintino Bocaiúva, Bairro Estrela, a se adequar as normas ambientais.', 'Ofício nº 221/2021-MP/6ªPJ', 1, 12, '', '', '', ''),
(34, 1, 12, '01631/2020', '2020-12-17', 'MPPA', '', 0, '', 22, '3', 'Inquérito Civil nº 003598-040/2018 - Apurar a responsabilidade e extensão dos supostos danos ambientais ocasionados pelas atividades desenvolvidas pela empresa ISOESTE, localizada na Av. Presidente Vargas, Bairro Jardelândia, município de Castanhal', 'Ofício n° 350/2020-MP/6ªPJ', 1, 19, '', '', '', ''),
(35, 1, 12, '00616/2021', '2021-05-25', 'MPPA', '', 0, '', 22, '8', 'Inquérito Civil nº 003598-040/2018 - Apurar a responsabilidade e extensão dos supostos danos ambientais ocasionados pelas atividades desenvolvidas pela empresa ISOESTE, localizada na Av. Presidente Vargas, Bairro Jardelândia, município de Castanhal', 'Ofício n° 074/2021-MP/6ªPJ', 1, 19, '', '', '', ''),
(36, 1, 12, '00693/2021', '2021-06-08', 'MPPA', '', 0, '', 22, '3', 'Procedimento Preparatório nº 000739/2020. Apurar e colher elementos que identifiquem os envolvidos e os danos de suposta infração ambiental decorrente de resíduos de mandioca provenientes da produção de farinha, de responsabilidade do Sr. EDINALDO NUNES, conhecido como Cupuí. ', 'Ofício n° 133/2021-MP/6ªPJ', 1, 38, '', '', '', ''),
(38, 1, 12, '00901/2021', '2021-07-15', 'MPPA', '', 0, '', 22, '4', 'Procedimento Preparatório n°000739-040/2020 -Apurar e colher elementos que identifiquem os envolvidos e os danos de suposta infração ambiental decorrente de resíduos de mandioca provenientes da produção de farinha, de responsabilidade do Sr. EDINALDO NUNES, conhecido como CUPUÍ', 'Ofício n° 177/2021- MP/6ªPJ', 1, 38, '', '', '', ''),
(39, 1, 12, '00725/2021', '2021-06-15', 'MPPA', '', 0, '', 1, '4', 'Notícia de Fato n° 001691-040/2021 - Apurar notícia de poluição sonora/pertubação do sossego alheio/crime ambiental oriunda do funcionamento do estabelecimento denominado \"DEPOSITO DE BEBIDAS 24 HORAS\"', 'Ofício n ° 143/2021-MP/6ªPJ', 1, 34, '', '', '', ''),
(40, 1, 12, '00899/2021', '2021-07-15', 'MPPA', '', 0, '', 22, '4', 'Notícia de Fato n° 001691-040/2021 - Apurar notícia de poluição sonora/pertubação do sossego alheio/crime ambiental oriunda do funcionamento do estabelecimento denominado \"DEPOSITO DE BEBIDAS 24 HORAS\"', 'Ofício 179/2021-MP/6ªPJ', 1, 34, '', '', '', ''),
(41, 1, 12, '00902/2021', '2021-07-15', 'MPPA', '', 0, '', 22, '22', 'Procedimento Administrativo n° 001968-040/2018 - Acompanhar e fiscalizar as medidas que serão adotadas pelo Município de Castanhal e outros órgãos públicos, a fim de compelir o estabelecimento comercial denominado BAR DO LITRÃO, localizado na Av. Barão do Rio Branco, em frente à Padaria Pão de Ouro, Bairro Nova Olinda, Município de Castanhal, a se adequar às normas ambientais.', 'Ofício nº178/2021- MP/6ªPJ', 1, 21, '', '', '', ''),
(42, 1, 12, '00915/2021', '2021-07-20', 'MPPA', '', 0, '', 22, '4', 'Notícia de Fato n° 001337-040/2021 - Apurar a notícia de poluição sonora/pertubação do sossego alheio decorrente da realização de cultos e eventos na Igreja Assembléia de Deus localizada na Alameda das Orquídeas ', 'Ofício n° 193/2021-MP/6ªPJ', 1, 21, '', '', '', ''),
(43, 1, 10, '01388/2021', '2021-10-14', 'YAN TEXEIRA NUNEZ', '', 0, '', 16, '5', 'PUBLICAÇÃO NO DIARIO OFICIAL E COMPROVANTE DE TAXA ', 'JUNTADA DE DOCUMENTOS REFERENTE AO PROCESSO  DE EVENTO TEMPORARIO N:00228/2021/PROC', 0, 0, '', '', '', ''),
(44, 1, 10, '01389/2021', '2021-10-14', 'F G COMERCIO DE MOVEIS ', '', 53, '', 1, '4', 'complementação ao processo  n:00156/2021', 'comprovante de taxa ', 1, 1, '', '', '', ''),
(45, 1, 11, '01390/2021', '2021-10-14', 'PREFEITURA MUNICIPAL DE CASTANHAL ,PROCURADORIA GERAL DO MUNICIPO', '', 0, '', 1, '8', 'RESPOSTA AO OFICIO N:284/2021', 'DOCUMENTOS REFERENTES A RESPOSTA ENVIADA AO MINISTERIO PUBLICO EM ATENÇÃO AO  OFICIO DE N:284/2021', 1, 1, '', '', '', ''),
(46, 2, 20, '00231/2021', '2021-10-14', 'SAMUEL GUSMÃO ', '', 0, '', 16, '7', 'LICENÇA PRA EVENTO TEMPORARIO', '', 0, 0, '', '', '', ''),
(47, 2, 25, '00024/2021', '2021-02-26', 'HIGHLINE DO BRASIL II / ALDA CLEIA DE SOUZA ABREU ', '', 0, '', 1, '20', 'solicitação de licença prévia e licença de instalação', 'HIGHLINE DO BRASIL II / ALDA CLEIA DE SOUZA ABREU  - solicitação de lp/li.', 1, 38, 'Av Castanhal/terra Alta KM 19', 'SN', '-1.0389593', '-47.90685149999999'),
(48, 2, 24, '00232/2021', '2021-10-14', 'SÃO CRISTOVÃO PEÇAS E SERVIÇOS LTDA(OFICINA SÃO CRISTOVÃO)', '', 0, '(91)998184-7976', 41, '27', 'LICENÇA DE OPERAÇÃO -LO', 'LICENÇA DE OPERAÇÃO CNPJ :41.460.947/0001-62\r\nCAIXA-05/ L.O -2021', 1, 8, 'R. CÔNEGO LUÍS LEITÃO ', '1695', '', ''),
(49, 2, 29, '00233/2021', '2021-10-14', 'SEMADA', '', 0, '', 23, '4', 'DOAÇÃO DE MADEIRA ', 'DOAÇÃO DE MADEIRA ', 1, 1, '', '', '', ''),
(50, 1, 10, '01393/2021', '2021-10-14', 'amazonflex industria e comercio de embalagens', '', 0, '', 16, '3', 'JUNTADA DE DOCUMENTOS ALVARA SANITARIO', '', 0, 0, '', '', '', ''),
(51, 1, 5, '01222/2021', '2021-10-14', 'asdasdas', '', 0, '', 1, '12', '21321', '', 0, 0, '', '', '', ''),
(52, 1, 12, '01394/2021', '2021-10-15', 'SEMOB', '', 0, '', 16, '2', 'SOLICITAÇÃO DE PLACA PRA EDUCAÇÃO AMBIENTAL', 'OFICIO N:0898/2021 SOLICITAÇÃO DE PLACAS', 0, 0, '', '', '', ''),
(53, 2, 24, '00156/2021', '2021-08-24', 'F G COMERCIO DE MÓVEIS LTDA', '', 0, '(91)3711-1829', 41, '93', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-03/L.O-2021', 1, 12, 'R. COMANDANTE FRANCISCO DE ASSIS', '2121', '', ''),
(54, 1, 10, '01389/2021', '2021-10-14', 'F G COMERCIO DE MÓVEIS LTDA', '', 53, '', 32, '4', 'JUNTADA PARA DOCUMENTO FG COMERCIO', '', 1, 12, '', '', '', ''),
(55, 2, 29, '00163/2021', '2021-08-31', 'SEMEL', '', 0, '', 23, '8', 'SOLICITAÇAO DE MADEIRA', '', 1, 12, '', '', '', ''),
(56, 2, 25, '00182/2021', '2021-09-15', 'PREFEITURA DE CASTANHAL /FEIRA GOURMET NO BAIRRO JADERLÂNDIA', '', 0, '', 41, '20', 'LICENÇA PRÉVIA E E LICENÇA DE INSTALAÇÃO- L.P/LI ', 'CAIXA-01/P.M.C- L.P/L.I-2021', 1, 19, 'R. ADAILSON DA  SILVA RODRIGUES', 'SN', '', ''),
(57, 1, 10, '01391/2021', '2021-10-14', 'PREFEITURA DE CASTANHAL FEIRA GOURMET NO BAIRRO JADERLANDIA', '', 56, '', 32, '50', 'JUNTA DE DOCUMENTOS', '', 0, 0, '', '', '', ''),
(58, 2, 29, '00227/2021', '2021-10-11', 'SEMEL', '', 0, '', 23, '8', 'SOLICITAÇÃO DE MADEIRA', '', 1, 12, '', '', '', ''),
(59, 1, 1, '01349/2021', '2021-10-05', 'A A BRITO CARDOSO ', '', 0, '9137211562', 24, '15', 'CARTA CONSULTA ', '', 1, 12, 'RUA KAZUMA OYAMA ', '2666', '', ''),
(60, 2, 29, '01311/2021', '2021-09-30', 'SEMOB', '', 0, '', 23, '9', 'SOLICITAÇAO DE MADEIRA', '', 1, 12, '', '', '', ''),
(61, 2, 29, '00219/2021', '2021-10-06', 'SEMOB', '', 0, '', 23, '8', 'SOLICITAÇAO DE MADEIRA', '', 1, 12, '', '', '', ''),
(62, 2, 29, '00167/2021', '2021-09-02', 'SEMOB', '', 0, '', 23, '7', 'SOLICITAÇAO DE MADEIRA', '', 1, 12, '', '', '', ''),
(63, 2, 29, '00230/2021', '2021-10-13', 'MEU QUERIDO NATAL ', '', 0, '', 23, '19', 'SOLICITAÇAO MADEIRA', '', 1, 0, '', '', '', ''),
(64, 2, 29, '00129/2021', '2021-07-27', 'SEMOB', '', 0, '', 23, '7', 'SOLICITAÇÃO DE MADEIRA', '', 1, 12, '', '', '', ''),
(65, 1, 14, '01406/2021', '2021-10-19', 'salles e valle imobiliaria', '', 0, '', 16, '28', 'DEFESA ADMINISTRATIVA', 'AUTO DE INFRAÇÃO N:30/2021', 0, 0, '', '', '', ''),
(66, 1, 14, '01407/2021', '2021-10-19', 'SALLES EMPREENDIMENTO IMOBILIARIO', '', 0, '', 16, '34', 'DEFESA ADMINISTRATIVA', 'AUTRO DE INFRAÇÃO N:31/2021', 0, 0, '', '', '', ''),
(67, 1, 14, '01408/2021', '2021-10-19', 'SALLES E VALLE EMPREENDIMENTO', '', 0, '', 16, '23', 'DEFESA ADMINISTRATIVO', 'AUTO DE INFRAÇÃO N:33/2021', 0, 0, '', '', '', ''),
(68, 1, 14, '01409/2021', '2021-10-19', 'SALLES VALLE EMPREENDIMENTO', '', 0, '', 16, '12', 'DEFESA ADMINISTRATIVA', 'AUTO DE INFRAÇÃO N:33/2021', 0, 0, '', '', '', ''),
(69, 1, 14, '01410/2021', '2021-10-19', 'SALLES E VALLE EMPREENDIMENTO IMOBILIARIO', '', 0, '', 16, '31', 'DEFESA ADMINISTRATIVA', 'AUTO DE INFRAÇÃO N:34/2021', 0, 0, '', '', '', ''),
(70, 1, 14, '01410/2021', '2021-10-19', 'SALLES E VALLE EMPREENDIMENTO IMOBILIARIO', '', 0, '', 16, '31', 'DEFESA ADMINISTRATIVA', 'AUTO DE INFRAÇÃO N:34/2021', 0, 0, '', '', '', ''),
(71, 1, 14, '01411/2021', '2021-10-19', 'SALLES VALLES EMPREENDIMENTO', '', 0, '', 16, '18', 'DEFESA ADMINISTRATIVA', 'AUTO DE INFRAÇÃO N:35/2021', 0, 0, '', '', '', ''),
(72, 1, 14, '01412/2021', '2021-10-19', 'SALLES EVALLE EMPREENDIMENTO', '', 0, '', 16, '26', 'DEFESA ADMINISTRATIVA', 'AUTO DE INFRAÇÃO N:36/2021', 0, 0, '', '', '', ''),
(73, 2, 29, '00199/2021', '2021-09-23', 'SEMOB', '', 0, '', 23, '4', 'SOLICITAÇÃO DE MADEIRA', '', 1, 12, '', '', '', ''),
(74, 2, 29, '00165/2021', '2021-09-02', 'SEMOB', '', 0, '', 23, '8', 'SOLICITAÇÃO DE MADEIRA', '', 1, 12, '', '', '', ''),
(75, 1, 12, '01415/2021', '2021-10-19', 'MPPA', '', 0, '', 23, '23', 'PROCEDIMENTO ADMINISTRATIVO Nº002596-040/2021 COSANPA', '', 1, 0, '', '', '', ''),
(76, 2, 25, '00240/2021', '2021-10-20', 'PREFEITO MUNICIPAL DE CASTANHAL/CONSTRUÇÃO DA PRAÇA DO PROPIRA', '', 0, 'ambiental.planejamento@castanhal.pa.gov.br', 41, '5', 'SOLICITAÇÃO  DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO', 'CAIXA-01/P.M.C-L.P/L.I-2021', 1, 33, 'TV HONÓRIO BANDEIRA, ENTRE RUA PROJETADA VII E RUA PROJETADA X', 'S/N', '', ''),
(77, 2, 22, '00241/2021', '2021-10-20', 'PREFEITO MUNICIPAL DE CASTANHAL/SEDE DA SECRETARIA DE SAÚDE CASTANHAL', '', 0, 'AMBIENTAL.PLANEJAMENTO@CASTANHAL.PA.GOV.BR', 41, '5', 'SOLICITAÇÃO DE LICENÇA DE INSTALAÇÃO-L.I', 'CAIXA -01/P.M.C- L.I-2021', 1, 10, 'RUA MAJOR WILSON SANTOS, PRÓX. AO HOSPITAL MUNICIPAL DE CASTANHAL', 'S/N', '', ''),
(78, 2, 22, '00242/2021', '2021-10-20', 'PREFEITO MUNICIPAL DE CASTANHAL/ REFORMA E AMPLIAÇÃO DA PRAÇA DO JADERLÂNDIA', '', 0, 'AMBIENTAL.PLANEJAMENTO@CASTANHAL.PA.GOV.BR', 41, '5', 'SOLICITAÇÃO DE LICENÇA DE INSTALAÇÃO-L.I', 'CAIXA-01/P.M.C- L.I/2021', 1, 19, 'RUA ADAILSON DA SILVA RODRIGUES, ENTRE RUA FERREIRA DA PAZ E TV MANUEL RAIMUNDO', 'S/N', '', ''),
(79, 2, 24, '00243/2021', '2021-10-21', 'MARIA EMANUELE GOMES DO CARMO', '', 0, '91988994886', 35, '57', 'COMÉRCIO ATACADISTA DE DEFENSIVOS AGRÍCOLAS, ADUBOS, FERTILIZANTES E CORRETIVOS DO SOLO', 'AGROGOMES COMÉRCIO DE PRODUTOS AGROPECUARIOS LTDA, CNPJ: 24.968.886/0001-20, AV PRESIDENTE GETULIO VARGAS, Nº 2428, CENTRO, CASTANHAL', 1, 8, 'AV PRESIDENTE GETULIO VARGAS', '2428', '', ''),
(80, 2, 20, '00244/2021', '2021-10-21', 'ALLAN CHRISTIAN DE MELO OLIVEIRA', '', 0, '91981433124', 35, '22', 'AUTORIZAÇÃO PARA EVENTO TEMPORÁRIO', 'EVENTO: HALLOWEEN MARAJOARA, DIA: 30/10/2021, LOCAL: RESTAURANTE E PEIXARIA MARAJOARA, RUA HERNANI LAMEIRA, Nº 508, PIRAPORA, CASTANHAL', 1, 25, 'RUA HERNANI LAMEIRA', '508', '', ''),
(81, 1, 10, '01422/2021', '2021-10-21', 'E M C KOSEKI EIRELI - LOJA POSTO PALMEIRA', '', 124, 'phoenix.belem@phoenixambiental.com.br', 32, '4', 'JUNTADA DE DOCUMENTO AO PROCESSO Nº 00528/2018', 'OFÍCIO Nº 349/2021-PHO, E M C KOSEKI EIRELI (LOJA POSTO PALMEIRA)', 1, 8, 'AV PRESIDENTE GETULIO VARGAS', '2205', '', ''),
(82, 1, 18, '01423/2021', '2021-10-21', 'LETÍCIA CAROLINA DA SILVA LOPES/ENGª. SANITARISTA E AMBIENTAL', '', 77, '', 32, '3', 'SOLICITAÇÃO DE DECLARAÇÃO DE TRÂMITE', 'OFÍCIO Nº 629/2021/SEPLAGE, SOLICITAÇÃO DE DECLARAÇÃO DE TRÂMITE REFERENTE PROCESSO Nº 00241/2021/PROC', 1, 10, 'RUA MAJOR WILSON SANTOS', 'S/N', '', ''),
(83, 1, 18, '01424/2021', '2021-10-21', 'LETÍCIA CAROLINA DA SILVA LOPES/ENGª. SANITARISTA E AMBIENTAL', '', 76, '', 32, '3', 'SOLICITAÇÃO DE DECLARAÇÃO DE TRÂMITE', 'OFÍCIO Nº 630/2021/SEPLAGE, SOLICITAÇÃO DE DECLARAÇÃO DE TRÂMITE REFERENTE PROCESSO Nº 00240/2021/PROC', 1, 33, '', '3', '', ''),
(84, 1, 18, '01425/2021', '2021-10-21', 'LETÍCIA CAROLINA DA SILVA LOPES/ENGª. SANITARISTA E AMBIENTAL', '', 78, 'ambiental.planejamento@castanhal.pa.gov.br', 32, '3', 'SOLICITAÇÃO DE DECLARAÇÃO DE TRÂMITE', 'OFÍCIO Nº 631/2021/SEPLAGE, SOLICITAÇÃO DE DECLARAÇÃO DE TRÂMITE REFERENTE PROCESSO Nº 00242/2021/PROC', 1, 19, '', '', '', ''),
(85, 1, 18, '01426/2021', '2021-10-21', 'VALTER COSTA E SILVA/ENGª', '', 0, 'obras@castanhal.pa.gov.br', 35, '3', 'SOLICITAÇÃO DE PARECER TÉCNICO', 'OFÍCIO Nº 0949/2021-SEMOB, REF: PROJETO DE AMPLIAÇÃO DO SISTEMA DE ESGOTAMENTO SANITÁRIO NA BACIA HIDROGRÁFICA DO IGARAPÉ\r\nSECRETARIA MUNICIPAL DE OBRAS E URBANISMO', 1, 12, 'TV QUINTINO BOCAIÚVA', '2643', '', ''),
(86, 1, 18, '01427/2021', '2021-10-21', 'VALTER COSTA E SILVA/ENGª', '', 0, '', 35, '3', 'SOLICITAÇÃO DE PARECER TÉCNICO', 'OFÍCIO Nº 0950/2021-SEMOB, REF: MURO DE CONTENÇÃOM, A FIM DE EVITAR A DEGRADAÇÃO DA NASCENTE DO IGARAPÉ ITAQUI', 1, 12, 'TV QUINTINO BOCAIÚVA', '2643', '', ''),
(87, 1, 18, '01428/2021', '2021-10-21', 'ANA PAULA GOMES MENDONÇA/COORDENADORA TÉCNICA', '', 0, 'aliancaservicosblm@gmail.com', 35, '2', 'SOLICITAÇÃO DE INFORMAÇÃOES', 'OFÍCIO - ALIANÇA - 032, SOLICITAÇÃO DE INFORMAÇÕES PARA ELABORAÇÃO DO PLANO DE SANEAMENTO BÁSICO\r\nALIANÇA PROJETOS E SERVIÇOS ESPECIALIZADOS DE APOIO ADMINISTRATIVO EIRELI', 1, 0, '', '', '', ''),
(88, 1, 18, '01429/2021', '2021-10-21', 'ANA PAULA GOMES MENDONÇA/COORDENADORA TÉCNICA', '', 0, 'aliancaservicosblm@gmail.com', 35, '2', 'SOLICITAÇÃO DE INFORMAÇÕES', 'OFÍCIO - ALIANÇA - 034, SOLICITAÇÃO DE INFORMAÇÕES PARA ELABORAÇÃO DO PLANO DE SANEAMENTO BÁSICO\r\nALIANÇA PROJETOS E SERVIÇOS ESPECIALIZADOS DE APOIO ADMINISTRATIVO EIRELI', 1, 0, '', '', '', ''),
(89, 1, 18, '01430/2021', '2021-10-21', 'ELIANA GOMES DA SILVA/ENGª. AGRÔNOMA', '', 0, 'eliana.gomes@egdasconsultoria.com.br', 35, '2', 'SOLICITAÇÃO DE CANCELAMENTO DE PROCESSO', 'OFÍCIO Nº 023/2021, SOLICITAÇÃO DE CANCELAMENTO DO PROCESSO Nº 01731/2018, K2 EMPORIO AGRICOLA EIRELI\r\nEGDAS CONSULTORIA AGRÍCOLA E AMBIENTAL', 1, 0, '', '', '', ''),
(90, 1, 10, '01431/2021', '2021-10-21', 'ERBERTH SILVEIRA CARVALHO', '', 0, 'erberth@nortegeo.net', 35, '43', 'ATENDIMENTO DE CONDICIONANTE', 'ATENDIMENTO DE CONDICIONANTE DA LO Nº 018/2019, PROCESSO Nº 00174/2018, \r\nSINDICATO RURAL DE CASTANHAL', 1, 0, '', '', '', ''),
(91, 1, 18, '01432/2021', '2021-10-21', 'CRISTINA MARIA DE QUEIROZ COLARES/PROMOTORA DE JUSTIÇA TÍTULAR DA 6ª PROMOTORIA DE JUSTIÇA CÍVEL E DE DEFESA COMUNITÁRIA E CIDADANIA DE CASTANHAL', '', 0, '', 35, '12', 'SOLICITAÇÃO DE MEDIDAS', 'OFÍCIO Nº 365/2021-MP/6ªPJ, SOLICITAÇÃO PARA REALIZAÇÃO DE VISTORIA NA ÁREA DENOMINADA SÍTIO SÃO FRANCISCO, LOCALIZADA NA AGROVILA DE MACAPAZINHO, ZONA RURAL DESTE MUNICÍPIO.\r\nMINISTÉRIO PÚBLICO DO ESTADO DO PARÁ.', 1, 8, 'AV PRESIDENTE GETULIO VARGAS', '2638', '', ''),
(92, 1, 18, '01433/2021', '2021-10-21', 'CRISTINA MARIA DE QUEIROZ COLARES/PROMOTORA DE JUSTIÇA TÍTULAR DA 6ª PROMOTORIA DE JUSTIÇA CÍVEL E DE DEFESA COMUNITÁRIA E CIDADANIA DE CASTANHAL', '', 0, '', 35, '4', 'SOLICITAÇÃO DE INFORMAÇÕES', 'OFÍCIO Nº 366/2021-MP6ªPJ, SOLICITAÇÃO DE INFORMAÇÕES ACERCA DE EVENTUAL CORTE IRREGULAR DE ÁRVORES NA PRAÇA JOSÉ JOÃO, NESTE MUNICÍPIO.\r\nMINISTÉRIO PÚBLICO DO ESTADO DO PARÁ\r\n', 1, 8, 'AV PRESIDENTE GETULIO VARGAS', '2638', '', ''),
(93, 1, 18, '01434/2021', '2021-10-21', 'CRISTINA MARIA DE QUEIROZ COLARES/PROMOTORA DE JUSTIÇA TÍTULAR DA 6ª PROMOTORIA DE JUSTIÇA CÍVEL E DE DEFESA COMUNITÁRIA E CIDADANIA DE CASTANHAL', '', 0, '', 35, '3', 'DESPACHO MINISTERIAL', 'OFÍCIO Nº 371/2021-MP/6ªPJ, CÓPIA DO DESPACHO MINISTERIAL DETERNAMINANDO ARQUIVAMENTO, REF: ÁRVORE CASTANHEIRA LOCALIZADA NA ÁREA DO PARQUE NATURAL MUNICIPAL DE CASTANHAL.\r\nMINISTÉRIO PÚBLICO DO ESTADO DO PARÁ', 1, 8, 'AV PRESIDENTE GETULIO VARGAS', '2638', '', ''),
(94, 1, 18, '01435/2021', '2021-10-21', 'CRISTINA MARIA DE QUEIROZ COLARES/PROMOTORA DE JUSTIÇA TÍTULAR DA 6ª PROMOTORIA DE JUSTIÇA CÍVEL E DE DEFESA COMUNITÁRIA E CIDADANIA DE CASTANHAL', '', 0, '', 35, '10', 'SOLICITAÇÃO DE VISTORIA', 'OFÍCIO Nº 361/2021-MP/6ªPJ, SOLICITAÇÃO DE VISTORIA NA EMPRESA AMAZON POPAS IND. E COM. POLPAS DA AMAZÔNIA LTDA, SITUADA NA ROD CASTANHAL - CURUÇÁ, KM 04, ZONA RURAL, CASTANHAL\r\nMINISTÉRIO PÚBLICO DO ESTADO DO PARÁ', 1, 8, 'AV PRESIDENTE GETULIO VARGAS', '2638', '', ''),
(95, 1, 10, '01436/2021', '2021-10-21', 'PATRICK DE OLIVEIRA RAMOS/ENG.', '', 0, 'patrick@ramosengenharia.info', 35, '3', 'JUNTADA DE DOCUMENTOS', 'OFÍCIO Nº 691/2021, JUNTADA REF: PROCESSO Nº 00485/2020/PROC\r\nC. ELIZIA DE RESENDE - EPP', 1, 0, '', '', '', ''),
(96, 2, 25, '00245/2021', '2021-10-21', 'PREFEITURA MUNICIPAL( ACADEMIA AO AR LIVRE, NO  KM 07)', '', 0, '', 41, '07', 'SOLICITAÇÃO DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO', 'CAIXA -01- P.M.C/ L.P.I - 2021', 1, 38, 'RUA JOÃO PAULO 2º/AGROVILA DO KM 07', 'S/N', '', ''),
(97, 2, 25, '00246/2021', '2021-10-21', 'PREFEITURA MUNICIPAL/ACADEMIA CONJUNTO JAPIM', '', 0, '', 41, '0701', 'SOLICITAÇÃO DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO', 'CAIXA-01/P.M.C.-L.P.I-2021', 1, 39, 'RUA MODELO 3', 'S/N', '', ''),
(98, 2, 25, '00247/2021', '2021-10-21', 'PREFEITURA MUNICIPAL/ACADEMIA AGROVILA NAZARÉ', '', 0, '', 41, '07', 'SOLICITAÇÃO DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO', 'CAIXA-01/P.M.C- L.P.I/2021 ', 1, 38, 'AVENIDA NAZARÉ / AGROVILA NAZARÉ', 'S/N', '', ''),
(99, 2, 25, '00248/2021', '2021-10-21', 'PREFEITURA MUNICIPAL/ACADEMIA AO AR LIVRE DO CONJUNTO DOS IPÊS', '', 0, '', 41, '07', 'SOLICITAÇÃO DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO- L.P/L.I', 'DECLARAÇÃO\r\nCAIXA -01/P.M.C.- L.P/L.I-2021', 1, 14, 'RUA D', 'S/N', '', ''),
(100, 1, 4, '01352/2021', '2021-10-05', 'ANÔNIMO', '', 0, '', 22, '5', 'DESCARTE IRREGULAR DE RESÍDUOS - ', ' DESCARTE IRREGULAR DE RESÍDUOS NO SEU PRÓPRIO QUINTAL', 1, 35, '', '', '', ''),
(101, 1, 4, '00994/2021', '2021-08-05', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO ATMOSFÉRICA', 'QUEIMADA', 1, 32, '', '', '', ''),
(102, 1, 4, '00591/2021', '2021-05-21', 'ANTÔNIO AUGUSTO LAMEIRA DO AMARAL JÚNIOR', '', 0, '', 22, '19', 'DESPEJO IRREGULAR DE RESÍDUOS - CORPO HÍDRICO ', '', 1, 1, '', '', '', ''),
(103, 1, 10, '01437/2021', '2021-10-22', 'sifra', '', 0, '', 16, '3', 'TERMO DE AUTORIZAÇÃO DE USO DE ESPAÇO PUBLICO N:58/2021', 'JUNTADA AO PROCESSO N:00231/2021/PROC', 0, 0, '', '', '', ''),
(104, 1, 10, '01438/2021', '2021-10-22', 'EMC KOSEKI POSTO PALMEIRA', '', 124, '', 32, '5', 'ATENDIMENTO DE CONDICIONANTE N:0024/2021', 'PUBLICAÇÃO NO DIARIO E JORNAL AMAZONIA ( EMC-KOSEKI POSTO PALMEIRAS )', 1, 1, '', '', '', ''),
(105, 1, 10, '01439/2021', '2021-10-22', 'EMC-KOSEKI POSTO ESTRELA', '', 0, '', 16, '5', 'ATENDIMENTO DE CONDICIONANTE DA LICENÇA OPERAÇÃO N:0024/2021', 'PUBLICAÇÃO NO DIARIO E JORNAL AMAZONIA ', 0, 0, '', '', '', ''),
(106, 1, 4, '01009/2021', '2021-08-10', 'ANÔNIMO', '', 0, '', 22, '2', 'DESMATAMENTO', 'DESMATAMENTO COM MOTOSSERRA', 1, 0, '', '', '', ''),
(107, 1, 4, '01021/2021', '2021-08-12', 'ANÔNIMO', '', 0, '', 22, '2', 'DESMATAMENTO', 'O DENUNCIANTE INFORMA QUE O DENUNCIADO TRABALHA COM MADEIRA PARA FABRICAÇÃO DE BRINQUEDOS E FAZ QUEIMADAS DAS MADEIRAS E SERRAGEM ONDE VEM PREJUDICANDO OS VIZINHOS COM FUMAÇA E POEIRA.', 1, 0, '', '', '', ''),
(108, 1, 4, '01039/2021', '2021-08-16', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO ATMOSFÉRICA', 'ADUBO ORGÂNICO', 1, 25, '', '', '', ''),
(109, 1, 4, '01064/2021', '2021-08-20', 'ELEN SILVA', '', 0, '', 22, '6', 'SUPRESSÃO DE VEGETAÇÃO', 'MORADORES CORTARAM PLANTAS DO CANTEIRO', 1, 0, '', '', '', ''),
(110, 1, 4, '01343/2021', '2021-10-04', 'ANÔNIMO', '', 0, '', 22, '6', 'QUEIMADA E SUPRESSÃO DE ÁRVORES', 'IMOBILIÁRIA ESTA FAZENDO SUPRESSÕES DE ARVORES E QUEIMADAS', 1, 8, '', '', '', ''),
(111, 1, 12, '01303/2021', '2021-09-24', 'CMDPI', '', 0, '', 22, '2', 'POLUIÇÃO SONORA E ATMOSFÉRICA', 'A SENHORA DEUSIRENE REIS CAVALCANTE DENUNCIOU AO CMDPI, BARULHOS E CHEIROS DE TINTA E SODA CAUSADO PELA EMPRESAS GM COSTA', 1, 5, '', '', '', ''),
(112, 1, 4, '01273/2021', '2021-09-21', 'ANÔNIMO', '', 0, '', 22, '2', 'EMISSÃO DE EFLUENTES EM ÁREA INADEQUADA', 'DENUNCIANTE INFORMOU QUE A ÁGUA USADA NO LAVA JATO ESCORRE PARA O SEU TERRENO, CAUSANDO ALAGAMENTO O DIA INTEIRO, DURANTE TODA A SEMANA', 1, 10, '', '', '', ''),
(113, 1, 4, '01307/2021', '2021-09-24', 'ANÔNIMO', '', 0, '', 22, '10', 'EROSÃO DO SOLO', 'O DENUNCIANTE INFORMA QUE O CONDOMÍNIO PARQUE PARAISO FEZ ABERTURAS NO MURO PARA O ESCOAMENTO DA ÁGUA, CAUSANDO GRANDE EROSÃO NAS PROXIMIDADES E AFETANDO AS ÁRVORES', 1, 23, '', '', '', ''),
(114, 1, 4, '01289/2021', '2021-09-23', 'ANÔNIMO', '', 0, '', 22, '2', 'QUEIMADA', 'DENUNCIANTE INFORMA QUE NESSE LOCAL A SENHORA RAFAELA FAZ QUEIMADA CONSTANTE DE LIXO, ONDE A FUMAÇA SE ESPALHA E AFETA OS DEMAIS VIZINHOS', 1, 15, '', '', '', ''),
(115, 1, 12, '00949/2021', '2021-07-27', 'MPPA', '', 0, '', 22, '18', 'POLUIÇÃO SONORA', 'OFÍCIO N° 196/2021 -PERTUBAÇÃO DO SOSSEGO PÚBLICO, OCASIONADO PELO FUNCIONAMENTO DO ESTABELECIMENTO  COMERCIAL DENOMINADO \"CASQUINHA DE CARANGUEJO\"', 1, 12, '', '', '', ''),
(116, 1, 4, '01024/2021', '2021-08-12', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'O DENUNCIANTE INFORMA QUE NA LOJA BRUNO NIGHT SOM, TRABALHA COM INSTALAÇÃO DE SOM AUTOMOTIVO ONDE VEM PREJUDICANDO A VIZINHANÇA COM O SOM ALTO FORA DE HORÁRIO, ATE 12 HORAS DAS NOITE ', 1, 16, '', '', '', ''),
(117, 1, 4, '01308/2021', '2021-09-27', 'MARIA DA COSTA PERREIRA', '', 0, '', 22, '2', 'DESMATAMENTO', 'DENUNCIANTE INFORMA QUE O SR ELIAS ESTA DESMATANDO NA BEIRA DO IGARAPÉ NO TERRENO DA SENHORA MARIA DA COSTA', 1, 38, '', '', '', ''),
(118, 1, 4, '01108/2021', '2021-08-27', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'DENUNCIANTE INFORMA QUE A DONA RAIMUNDA E A DONA GLÓRIA VIZINHAS FAZEM FESTAS NAS SUAS RESIDENCIAS COM SOM AUTO A NOITE TODA AOS FINS DE SEMANAS ONDE VEM PREJUDICANDO OS VIZINHOS COM OS BARULHOS', 1, 14, '', '', '', ''),
(119, 1, 12, '01348/2021', '2021-10-05', '12ª SECCIONAL DO JADERLÂNDIA', '', 0, '', 22, '3', 'DESMATAMENTO', 'SUPOSTO DESMATAMENTO QUE ESTARIA OCORRENDO NO SÍTIO SÃO FRANCISCO', 1, 38, '', '', '', ''),
(120, 1, 4, '01153/2021', '2021-09-01', 'SUB PREFEITURA DO APEU', '', 0, '', 22, '6', 'descarte irregular de resíduos sólidos', 'DENUNCIANTE INFORMA QUE OS AMBULANTES DA PRAÇA DO APEU ESTÃO FAZENDO DESCARTE IRREGULAR DOS RESÍDUOS', 1, 1, '', '', '', ''),
(121, 1, 4, '01339/2021', '2021-10-01', 'RAIMUNDO JORGE BENTES FERREIRA', '', 0, '', 22, '4', 'DESMATAMENTO', 'O DENUNCIANTE INFORMA QUE O SENHOR WAGNE ESTA TIRANDO MADEIRA E ATERRO DO LOCAL INFORMADO. ', 1, 38, '', '', '', ''),
(122, 1, 10, '01443/2021', '2021-10-22', 'claro pacah 04', '', 0, '', 16, '31', 'atendimento a notificação n:077/2021', 'requerimento de atendimento de notificação n:077/2021 ao processo de n:00353/2019', 0, 0, '', '', '', ''),
(123, 2, 28, '00530/2018', '2018-04-19', 'EMC KOSEKI EIRELI (LOJA DE CONVENIENCIA POSTA ESTRELA)', '', 0, '', 32, '20', 'SOLICITAÇÃO DE RENOVAÇÃO DE LICENÇA DE OPERAÇÃO', '', 1, 12, '', 'S/N', '', ''),
(124, 2, 28, '00528/2018', '2018-04-19', 'EMC KOSEKI EIRELI (LOJA DE CONVENIENCIA POSTO PALMEIRA)', '', 2, '', 32, '20', 'SOLICITAÇÃO DE RENOVAÇÃO DE LICENÇA OPERACIONAL', '', 1, 8, '', 'S/N', '', ''),
(125, 1, 4, '01079/2021', '2021-08-24', 'HELBER DE OLIVEIRA GONÇALVES', '', 0, '', 22, '5', 'POLUIÇÃO ATMOSFÉRICA - QUEIMADAS', 'OS MORADORES DA CHÁCARA SANTA ROSA FAZEM QUEIMADAS DIARIAMENTE, SENDO QUE TEM IDOSOS, MUITAS CRIANÇAS E ATÉ RECÉM NASCIDO NA RUA', 1, 0, '', '', '', ''),
(126, 1, 4, '01046/2021', '2021-08-18', 'ANÔNIMO', '', 0, '', 22, '2', 'DESCARTE IRREGULAR DE RESÍDUOS SÓLIDOS', 'O DENUNCIANTE INFORMA QUE TODO OS DIAS O SR PIAUI JOGA PENA DE GALINHA, SACO PLASTICO E GARRAFA PET E CAIXAS DE PAPELÃO NO CANAL PRÓXIMO DA LOJA ARAUJO MATERIAL DE CONSTRUÇÃO.', 1, 16, '', '', '', ''),
(127, 1, 4, '01373/2021', '2021-10-08', 'ANTÔNIO AUGUSTO LAMEIRA DO AMARAL JÚNIOR', '', 0, '', 22, '13', 'POLUIÇÃO DE EFLUENTES', 'O DENUNCIANTE INFORMA QUE A EMPRESA MENCIONADA, POR CAUSA DE UMA OBRA DE CONSTRUÇÃO HABITACIONAL, DIRECIONOU PARA A PROPRIEDADE QUE CONFINA AO LADO DIREITO, UMA TUBULAÇÃO QUE SEGUNDO A EMPRESA SÃO DAS ÁGUAS DA CHUVA. A MESMA É TOMADA PELA VERMELHIDÃO DE UM MATERIAL ARENOSO QUE PROVEM DE TERRAS REVIRADAS PELAS MÁQUINAS PESADAS PARA ALTERAR O SOLO E FICAR ADEQUADO PARA CONSTRUÇÃO CIVIL, LEVANDO TAMBÉM RESÍDUOS COMO GARRAFA PET E ETC.', 1, 0, '', '', '', ''),
(128, 1, 4, '00841/2021', '2021-07-06', 'ANÔNIMO', '', 0, '', 22, '2', 'DESCARTE IRREGULAR DE RESÍDUOS SÓLIDOS', 'RESÍDUOS SÓLIDOS CAUSANDO ENTUPIMENTO DE TUBULAÇÃO DE ESGOTO.', 1, 38, '', '', '', ''),
(129, 1, 4, '01180/2021', '2021-09-08', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO ATMOSFÉRICA E DESCARTE DE RESÍDUOS', 'A DENUNCIANTE AFIRMA QUE A LIXEIRA DO SUPERMERCADO É EM FRENTE A CASA DELA, E O FEDOR É INSUPORTÁVEL, E  O LIXO É RECOLHIDO UMA VEZ POR SEMANA, (ISSO QUANDO É RECOLHIDO). DISSE AINDA QUE OS CAMINHÕES E CAMINHONEIROS FICAM FAZENDO BAGUNÇA, BEBENDO, AS VEZES ATÉ DISCUTINDO POR LÁ, A CARGA E O FEDOR TAMBÉM NÃO ESTÁ SENDO FÁCIL DE SUPORTAR.  ', 1, 0, '', '', '', ''),
(130, 1, 12, '00834/2021', '2021-07-05', 'CONDÔMINOS DO CONDOMÍNIO RESIDENCIAL QUINTA DO LAGO', '', 0, '', 22, '5', 'DESCARTE IRREGULAR DE RESÍDUOS', 'SOLICITAR UMA VISTORIA NO LOCAL E INTEIRAR SOBRE O ACÚMULO DE LIXO DE DIVERSOS TIPOS NO CANAL QUE PASSA AOS FUNDOS DO CONDOMÍNIO, QUE RECEBE AS ÁGUAS PLUVIAIS DO BAIRRO NOVO ESTRELA E DA RUA 1º DE MAIO. ', 1, 21, '', '', '', ''),
(131, 1, 4, '01238/2021', '2021-09-15', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'DENUNCIANTE INFORMA QUE A FABRICA NORTE FRUTIS ESTA FAZENDO MUITO BARULHO, E PROVOCANDO MAL CHEIRO ', 1, 33, '', '', '', ''),
(132, 1, 4, '01154/2021', '2021-09-01', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'DENUNCIANTE INFORMA QUE NA FRUTARIA VERDURÃO ESTA COLOCANDO CARRO SOM PARA FAZER PROPAGANDA COM SOM MUITO AUTO.', 1, 8, '', '', '', ''),
(133, 1, 4, '00987/2021', '2021-08-04', 'ANÔNIMO', '', 0, '', 22, '2', 'CRIAÇÃO DE PORCO E BODE', 'DENUNCIANTE INFORMA QUE O SENHOR JOÃO PAULO (CEARA) CRIA PORCO E BODE NA SUA RESIDENCIA, ONDE VEM CAUSANDO MAU CHEIRO, E ELE DEIXA OS ANIMAIS SOLTO NA RUA.', 1, 33, '', '', '', ''),
(134, 1, 4, '00987/2021', '2021-08-04', 'ANÔNIMO', '', 0, '', 22, '2', 'CRIAÇÃO DE PORCO E BODE', 'DENUNCIANTE INFORMA QUE O SENHOR JOÃO PAULO (CEARA) CRIA PORCO E BODE NA SUA RESIDENCIA, ONDE VEM CAUSANDO MAU CHEIRO, E ELE DEIXA OS ANIMAIS SOLTO NA RUA.', 1, 33, '', '', '', ''),
(135, 1, 4, '01444/2021', '2021-10-25', 'Regina lucia perreira', '', 0, '', 16, '24', 'DOCUMENTO ENVIADOS POR EMAIL PARA ANEXA A DENUNCIA DE PROTOCOLO DE N: 01419/2021/DOC', 'EXAMES E LAUDOS MEDICOS ENVIADOS POR VIA EMAIL PARA ANEXA AO DOCUMENTO DE N: 01419/2021/DOC', 0, 0, '', '', '', ''),
(136, 1, 10, '01445/2021', '2021-10-25', 'VANDIZIO O DA SILVA', '', 138, '', 32, '8', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE N:00208/2021/PROC', 'DOCUMENTOS ENVIADOS POR EMAIL ,PARA ANEXA AO PROCESSO DE N:00208/2021/PROC', 1, 1, '', '', '', ''),
(137, 1, 10, '01446/2021', '2021-10-25', 'BRASFER COMERCIAL LTDA ', '', 140, '', 32, '10', 'JUNTADA DE DOCUMENTO ', 'DOCUMENTOS PARA SER ANEXADO AO PROCESO DE N:01746/2019', 1, 1, '', '', '', ''),
(138, 2, 25, '00208/2021', '2021-09-27', 'VANDIZIO O DA SILVA ', '', 0, '(91)98889-2952', 41, '76', 'SOLICITAÇÃO DE LICENÇA PRÉVIA E DE INSTALAÇÃO', 'CAIXA-01----> LP/LI-2021', 1, 19, 'R. DOUTOR LAURENO FRANCISCO ALVES DE MELO', '386', '', ''),
(139, 1, 4, '01419/2021', '2021-10-20', 'REGINA LUCIA PEREIRA', '', 0, '', 23, '29', 'DESMATAMENTO', '', 1, 38, '', '', '', ''),
(140, 2, 24, '01746/2019', '2019-10-10', 'BRASFER COMERCIAL LTDA', '', 0, '', 32, '20', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO -LO', '', 1, 10, '', 'S/N', '', ''),
(141, 1, 10, '01448/2021', '2021-10-25', 'EQUATORIAL', '', 0, '', 16, '7', 'ALTERAÇÃO  NO TRAÇADO', 'ENCAMINHADO A JUSTIFICATIVA PELO QUAL SERA NECESSARIO A ALTERAÇÃO DO TRAÇADO', 0, 0, '', '', '', ''),
(142, 1, 10, '01449/2021', '2021-10-25', 'SAO FRANCISCO INDUSTRIA E COMERCIO DE POLPAS EIRELE', '', 0, '', 16, '7', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE N:01351/2019', 'SOLICITAÇÃO DE JUNTADA DE DOCUMENTOS REFERENTE AO PROCESSO DE N:01351/2019 COMO RESPOSTA A NOTIFICAÇÃO DE N:063/2021', 0, 0, '', '', '', ''),
(143, 1, 30, '01450/2021', '2021-10-25', 'CASTANHAL COMERCIO DE POLPAS', '', 0, '', 16, '4', 'DECLARAÇÃO DE TRAMITE ', 'SOLICITAR A DECLARAÇÃO DE TRAMITE DO PROCESSO DE L.O DE N:00032/2020/PROC', 0, 0, '', '', '', ''),
(144, 1, 12, '01451/2021', '2021-10-25', 'SEBASTIAN BAUER', '', 0, '', 16, '2', 'CONSULTA MANIFESTAÇÃO', 'CONSULTA MANIFESTAÇÃO\r\n', 0, 0, '', '', '', ''),
(145, 1, 4, '01452/2021', '2021-10-25', 'maria jose dos santos carvalho', '', 0, '', 16, '2', 'maus tratos', 'denuncia referente a maus tratos e pertubação ', 0, 0, '', '', '', ''),
(146, 1, 13, '01453/2021', '2021-10-25', 'prefeitura municipal de castanhal coordenadoria de cerimonial', '', 0, '', 16, '2', 'convite via oficio', 'convite pra prestigiar a entrega da revitalização do cras jaderlandia', 0, 0, '', '', '', ''),
(147, 1, 13, '01454/2021', '2021-10-25', 'prefeitura municipal de castanhal coordenadoria de cerimonial', '', 0, '', 16, '2', 'convite via oficio de n:258/2021', 'entrega da revitalização da praça olavo bilac', 0, 0, '', '', '', ''),
(148, 1, 3, '01455/2021', '2021-10-26', 'forum nacional de gestores e limpeza', '', 0, '', 16, '3', 'convocação pra reunião via email', 'envia por email', 0, 0, '', '', '', ''),
(149, 1, 4, '01318/2021', '2021-09-28', 'Anônimo', '', 0, '', 23, '2', 'POLUIÇÃO AMBIENTAL', '', 1, 31, 'RUA BENEVIDES ESQUINA COM TV. MOEMA', 'S/N', '', ''),
(150, 1, 4, '01359/2021', '2021-10-06', 'VITÓRIA HENRIQUES MOTA ', '', 0, '', 22, '2', 'PERTUBAÇÃO DE SOSSEGO ALHEIO E POLUIÇÃO SONORA', 'A SRA VITÓRIA INFORMA QUE TEM UM NETO AUTISTA, QUE FAZ AULAS DE TERAPIA NA ÁREA EXTERNA DA CASA, E O BARULHO ALTO CAUSA BASTANTE INCOMODO TANTO PARA CRIANÇA COMO PARA OS PROFISSIONAIS. ', 1, 0, '', '', '', ''),
(151, 1, 10, '01456/2021', '2021-10-26', 'claro pacah 04', '', 0, '', 16, '3', 'juntada ,resposta de notificação', 'resposta de notificação de n:086/2021', 0, 0, '', '', '', ''),
(152, 1, 12, '01457/2021', '2021-10-26', 'ACAJOB', '', 0, '', 16, '3', 'ANIVERSARIO DE EXISTENCIA CAMPONESA ', 'ASSOCIAÇÃO COMUNITARIA DOS AGRICULTORES DO ASSENTAMENTO JOÃO BATISTA II,ANIVERSARIO DE EXISTENCIA CAMPONESA', 0, 0, '', '', '', ''),
(153, 1, 12, '01458/2021', '2021-10-26', 'PREFEITURA MUNICIPAL DE CASTANHAL', '', 0, '', 16, '2', 'CONITE PARA PRESTIGIAR A ENTREGA DA REVITALIZAÇÃO DO CRAS JADERLANDIA ', 'OFICIO DE N:267/2021-GAB', 0, 0, '', '', '', ''),
(154, 1, 12, '01459/2021', '2021-10-26', 'PREFEITURA MUNICIPAL DE CASTANHAL', '', 0, '', 16, '2', 'PROJETO ,TERMO DE REFERENCIA E SEUS ANEXOS DO HORTO FLORESTAL', 'OFICIO DE N:300/2021-GAB', 0, 0, '', '', '', ''),
(155, 1, 13, '01460/2021', '2021-10-26', 'prefeitura municipal de castanhal coordenadoria de cerimonial', '', 0, '', 16, '2', 'CONVITE/REDIFICAR DATA', 'PRESTIGIAR A ENTREGA DA REVITALIZAÇÃO DA PRAÇA OLAVO BILAC', 0, 0, '', '', '', ''),
(156, 1, 12, '01461/2021', '2021-10-26', 'PREFEITURA MUNICIPAL DE CASTANHAL (CINTIA SAYURI IUCHI)', '', 0, '', 16, '5', 'SOLICITANDO O CANCELAMENTO DO PEDIDO DE TAXA DAM', 'CANCELAMENTO DE PROCESSO PARA EQUISIÇÃO DE LICENÇA PREVIA', 0, 0, '', '', '', ''),
(157, 1, 10, '01462/2021', '2021-10-26', 'SILVANI DAMAS', '', 0, '', 16, '3', 'JUNTADA DE DOCUMENTO PARA ASV', 'COMPROVANTE DE TAXA DE ASV', 0, 0, '', '', '', ''),
(158, 1, 4, '01413/2021', '2021-10-19', 'Anônimo', '', 0, '', 23, '3', 'DESMATAMENTO', '', 1, 4, '', '', '', ''),
(159, 1, 12, '01463/2021', '2021-10-27', 'PREFEITURA MUNICIPAL DE CASTANHAL', '', 0, '', 16, '6', 'requerimento/processo n:2021/10/11227', 'memorando de n:157/2021/cla/semma-pmc orientação juridica da certidão de uso e ocupação do solo para fins de instrução do processo', 0, 0, '', '', '', ''),
(160, 1, 12, '01464/2021', '2021-10-27', 'CAMPUS UNIVERSITARIO DE CASTANHAL', '', 0, '', 16, '2', 'SOLICITAÇÃO DE TENDA PARA O EVENTO OUTUBRO ROSA', 'OFICIO DE N:103/2021/IMV', 0, 0, '', '', '', ''),
(161, 2, 19, '00253/2021', '2021-10-28', 'condominio campo belo', '', 0, '', 16, '14', 'autorização para supressão ', 'asv para condominio campo belo', 0, 0, '', '', '', ''),
(162, 1, 10, '01465/2021', '2021-10-28', 'secretatia municipal de planejamento e gestão', '', 0, '', 16, '14', 'alteração de documentos ', 'alteraçã de documentos referente ao processo de n:00024/2021/proc estadio maximino porpino (modelao)', 0, 0, '', '', '', ''),
(163, 1, 12, '01466/2021', '2021-10-28', 'ASSOSIAÇÃO S.O.S CRIANÇA FELIZ', '', 0, '', 16, '2', 'SOLICITAR A COLABORAÇÃO PARA ORNAMENTAÇÃO NATALINA', 'OFICIO DE N:008/2021', 0, 0, '', '', '', ''),
(164, 2, 24, '00161/2020', '2020-10-08', 'T.A DE GOIS COMÉRCIO DE BEBIDAS LTDA', '', 0, '(91)98853-5044', 41, '52', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', '', 1, 21, 'RUA BELÉM,ANEXO B', '16', '-1.2890403', '-47.9520912'),
(165, 2, 24, '00162/2020', '2020-10-09', 'PRO ÊNFASE INDÚSTRIA E COMÉRCIO DE MÁQUINAS LTDA', '', 0, '(91)98260-3459', 41, '49', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', '', 1, 0, 'AV.  MAXIMINO PORPINO', '1205', '-1.2920989', '-47.9246485'),
(166, 2, 28, '00101/2020', '2020-08-04', 'FUMITO TASHIRO', '', 0, '(91)98210-1111', 41, '29', 'SOLICITAÇÃO DE RENOVAÇÃO DE LICENÇA DE OPERAÇÃO', '', 1, 38, 'ESTRADA DE IRACEMA', 'S/N', '', ''),
(167, 2, 24, '00148/2020', '2020-09-24', 'MARIA DAS GRAÇAS DA SILVA BEZERRA 093034464249/CLUB DO COWBOY', '', 0, '', 41, '40', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', '', 1, 12, 'TV. QUINTINO BOCAIÚVA', '04', '', ''),
(168, 2, 24, '00134/2021', '2021-07-29', 'ORLANDO FERREIRA DA MATA', '', 0, '(91)98429-1526', 41, '25', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', '', 1, 38, 'TV.SANTO ANTÔNIO/COLÔNIA DO CUPIÚBA 1', '41', '-1.2860917', '-47.9467392'),
(169, 2, 24, '00128/2021', '2021-07-22', 'ELISON ANDREY LOPES LOPES MATOS 01308951213', '', 0, '(91)99942-1466', 41, '49', 'SOLICITAÇÃO DE LICENCIAMENTO DE OPERAÇÃO', '', 1, 34, 'RUA DR. RUI LUIZ DE ALMEIDA', '721', '-1.3080666', '-47.94039979999999'),
(170, 2, 24, '00084/2021', '2021-05-20', 'M MACIEL E SILVA', '', 0, '(91)98205-4071', 41, '46', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', '', 1, 33, 'ALAMEDA IMPERIAL', '1002', '-1.2797144', '-47.9219679'),
(171, 2, 24, '00161/2021', '2021-08-27', 'JR COMÉRCIO DE SUCATA LTDA', '', 0, '(91)99830-4197', 41, '41', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', '', 1, 16, 'RUA SENADOR LEMOS', '1459 A', '', ''),
(172, 1, 4, '01467/2021', '2021-10-29', 'RENATO GRIPP', '', 0, '', 16, '5', 'QUEIMADA ( POLUIÇÃO ATMOSFERICA)', 'DENUNCIA SOBRE POLUIÇÃO ATMOSFERICA', 0, 0, '', '', '', ''),
(173, 2, 24, '00131/2021', '2021-07-27', 'LELIANE KIKUCHI PIRES', '', 0, '(00131/2021', 41, '48', 'SOLICITAÇÃO DE LICENÇA AMBIENTAL', '', 1, 0, 'RUA SN-OITO/CONJUNTO TANGARAS', '418 A', '', ''),
(174, 2, 24, '00169/2021', '2021-09-02', 'C&E PRE-MOLDADOS LTDA', '', 0, '(91)98421-0229', 41, '55', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', '', 1, 6, 'RUA JOSÉ CAETANO/PRÓXIMO AO COMERCIAL CAIÇARA', '17', '', ''),
(175, 2, 24, '00108/2021', '2021-07-01', 'BAR DEPÓSITO PARADA TOP/JEANE KAROLAINY COSTA MONTEIRO', '', 0, '(941) 99981-4791', 41, '17', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO ', '', 1, 32, 'RUA ANTÔNIO HORÁCIO', 'S/N', '-1.3012007', '-47.9152063'),
(176, 2, 24, '00108/2021', '2021-07-01', 'BAR DEPÓSITO PARADA TOP/JEANE KAROLAINY COSTA MONTEIRO', '', 0, '(941) 99981-4791', 41, '17', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO ', '', 1, 32, 'RUA ANTÔNIO HORÁCIO', 'S/N', '-1.3012007', '-47.9152063'),
(177, 2, 24, '00164/2021', '2021-09-01', 'KANAI SERVIÇOS E COMÉRCIO LTDA-EPP', '', 0, '(91)99245-2984', 41, '63', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO ', '', 1, 38, 'VILA IRACEMA', 'S/N', '', ''),
(178, 2, 24, '00566/2021', '2021-05-17', 'CRIAR INDÚTRIA E COMÉRCIO DE MÓVEIS LTDA', '', 0, '(91)99163-4286', 41, '4', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', '', 1, 12, 'AV. MAXIMINO PORPINO DA SILVA', '5541', '', ''),
(179, 1, 4, '01468/2021', '2021-10-29', 'anonimo', '', 0, '', 16, '2', 'DENUCIA REFERENTE A MAUS TRATOS', 'MAUS TRATOS CONTRA CACHORRO', 0, 0, '', '', '', ''),
(180, 1, 11, '01469/2021', '2021-10-29', 'secretaria municipal de suprimentos e licitação ', '', 0, '', 16, '2', 'designação de fiscais', 'memorando n:505/2021-licitação ', 0, 0, '', '', '', ''),
(181, 2, 24, '00254/2021', '2021-10-29', 'Eliomar araujo de souza', '', 0, '', 41, '57', 'LICENÇA DE OPERAÇÃO-LO', 'LICENÇA DE OPERAÇÃO SOB CNPJ:22.721.170/0001-06 NORTE FRIGO LTDA\r\n\r\nCAIXA- 02 / L.O-2021', 1, 1, '', '', '', ''),
(182, 2, 24, '00157/2021', '2021-08-25', 'M.E MATEUS COMERCIO E MÓVEIS LTDA', '', 0, '(91)99179-2203', 41, '85', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', '', 1, 12, 'R. COMANDANTE FRANCISCO DE ASSIS', '2.121/1º ANDAR', '', ''),
(183, 2, 24, '00115/2021', '2021-07-09', 'R N DO ESPÍRITO SANTO COMÉRCIO DE VIDROS', '', 0, '(91) 98701-7067', 41, '53', 'SOLICITAÇÃO DE LICENÇA AMBIENTAL', '', 1, 33, 'R. ITAMARATÍ', '320', '', ''),
(184, 2, 24, '00197/2021', '2021-09-22', 'PARAZINHO COMÉRCIO ATACADISTA LTDA', '', 0, '(91) 99184-0244', 41, '50', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-02/ L.O-2021', 1, 8, 'AV. PRESIDENTE VARGAS', '5608', '', ''),
(185, 1, 10, '01471/2021', '2021-10-29', 'para comercio de polpas de frutas ', '', 0, '', 16, '4', 'documentos listados acima da licença de operação lo. :0020/2021', 'segue anexo os documentos de comprovação das publicaçoes', 0, 0, '', '', '', ''),
(186, 1, 10, '01472/2021', '2021-11-03', 'kj representaçoes', '', 0, '', 16, '10', 'consulta  para verificação se ha necessidade de licença ambiental', 'consulta -kj representaçoes', 0, 0, '', '', '', ''),
(187, 2, 24, '00183/2021', '2021-09-15', 'HIGIENIZADORA CARAJÁS LTDA', '', 0, '(91)99169-5752', 41, '40', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-02/L.O-2021', 1, 23, 'TV. FLORIANO PEIXOTO', '4006', '', ''),
(188, 1, 12, '01473/2021', '2021-11-03', 'samuel guimarães andrade', '', 0, '', 16, '3', 'evento encontro de cães ', 'oficio de n:01/2021', 0, 0, '', '', '', ''),
(189, 2, 24, '00255/2021', '2021-11-03', 'M.ALEXANDRE DA SILVA ', '', 0, '', 41, '50', 'LICENÇA DE OPERAÇÃO PARA ATIVIDADE DE SRVIÇOS AUTOMOTIVOS', 'LICENÇA DE OPERAÇÃO -LO\r\nCAIXA-03/L.O-2021', 1, 1, '', '', '', ''),
(190, 2, 24, '00184/2021', '2021-09-15', 'HIGIENIZADORA CARAJÁS LTDA', '', 0, '(91)99169-5752', 41, '50', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-02/ L.O - 2021\r\n', 1, 23, 'TV. FLORIANO PEIXOTO', '4046', '', ''),
(191, 2, 24, '00185/2021', '2021-09-15', 'HIGIENIZADORA CARAJÁS LTDA', '', 0, '(91)99169-5752', 41, '44', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-02/L.O-2021', 1, 23, 'TV. FLORIANO PEIXOTO', '4046', '', ''),
(192, 2, 24, '00195/2021', '2021-09-20', 'CONSÓRCIO CSR/CCM/GETEL', '', 0, '(96)99178-7509', 41, '518', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA -02/ L.O-2021', 1, 1, 'RODOVIA BR 316, KM 57', 'S/N', '', ''),
(193, 2, 27, '00257/2021', '2021-11-03', 'maria ferreira da luz', '', 0, '', 16, '13', 'administrativo punitivo -pap', 'EM ATENÇÃO AO MEMORANDO DE N:151/2021/COFISC/SEMMA-PMC REF: AO AUTO DE INFRAÇÃO 013/2021 MARIA FERREIRA DA LUZ\r\n', 0, 0, '', '', '', ''),
(194, 2, 24, '00122/2021', '2021-07-20', 'ROSENILDO NUNES RODRIGUES', '', 0, '(91)984353177', 41, '12', 'SOLICITAÇÃO DE LICENÇA OPERAÇÃO', 'CAIXA-03/L.O-2021', 1, 21, 'RUA BRASILIA', '13', '', ''),
(195, 2, 24, '00130/2021', '2021-07-27', 'CASMED MEDICAMENTOS LTDA', '', 0, '(91)99984-0211 ', 41, '22', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-03/L.O-2021', 1, 16, 'PASSAGEM TÊXTIL', '302-A', '', ''),
(196, 1, 10, '01475/2021', '2021-11-03', 'Equatorial', '', 0, '', 16, '20', 'juntada de documentos', '', 1, 20, 'boa vista, castanhal ', 'S/N', '', ''),
(197, 2, 24, '00095/2021', '2021-06-24', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', '', 0, '(91)98429-1526', 41, '45', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-03/L.O-2021', 1, 17, 'RODOVIA PA 320', '23', '', ''),
(198, 1, 10, '01476/2021', '2021-11-03', 'AGROSOLO COMERCIO DE DEFENSIVOS AGRICOLAS', '', 0, '', 16, '4', 'OBTENÇÃO DA LICENÇA AMBIENTAL', 'DECLARAÇÃO DE DISPENSA DE OUTORGA. REF AO PROC. Nº 00050/2021\r\n', 0, 0, '', '', '', ''),
(199, 1, 10, '01477/2021', '2021-11-03', 'FLAMBOYANT', '', 0, '', 16, '5', 'JUNTADA ', 'CONDICIONANTE DO PROCESSO N : 026/2018\r\n', 0, 0, '', '', '', ''),
(200, 2, 19, '00258/2021', '2021-11-03', 'THAIGO PATRYCK SILVA PANTOJA ', '', 0, '', 16, '12', 'SUPRESSÃO', 'ASV', 0, 0, '', '', '', ''),
(201, 2, 24, '00101/2021', '2021-06-28', 'R I B DE OLIVEIRA- ( REAL ALIMENTOS)', '', 0, '(91)98269-3497', 41, '83', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-03/L.O-2021', 1, 28, 'R 108/QUADRA 133,LOTE 33', '33', '', ''),
(202, 2, 24, '00146/2021', '2021-08-10', 'GRANDE CORREIA COMÉRCIO DE VEÍCULOS', '', 0, '(71)3186-5981', 41, '100', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-03/L.O-2021', 1, 10, 'AV. PRESIDENTE GETÚLIO VARGAS', '1040', '', ''),
(203, 1, 10, '01478/2021', '2021-11-04', 'POSTO ICCAR', '', 0, '', 16, '4', 'JUNTADA POSTO ICCAR .', 'ATENDIMENTO A CONDICIONANTE  SOB O PROC:151/2020', 0, 0, '', '', '', ''),
(204, 1, 10, '01479/2021', '2021-11-04', 'POSTO ICCAR', '', 0, '', 16, '5', 'JUNTADA POSTO ICCAR ', 'ATENDIMENTO A CONDICIONANTE DO PROCESSO DE N:151/2021', 0, 0, '', '', '', ''),
(205, 2, 24, '00040/2020', '2020-02-19', 'POSTO CASTANHAL LTDA', '', 0, '9198085-0342', 26, '108', 'LICENÇA DE OPERAÇÃO', '', 1, 8, 'RUA CORONEL LEAL ', '1345', '', ''),
(206, 2, 24, '00158/2021', '2021-08-24', 'YAMADA PIPPER COMERCIO DE IMPORTAÇÃO E EXPORTAÇÃO', '', 0, '(91)98124-8709', 41, '59', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-03/L.O-2021', 1, 5, 'AV. PRESIDENTE GETÚLIO VARGAS', '5858 D', '', ''),
(207, 2, 24, '00140/2021', '2021-08-04', 'TREVO AUTO SERVIÇOS EIRELE', '', 0, '(91)3721-6567', 41, '40', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-03/L.O-2021', 1, 6, 'RUA CEARÁ', '3253', '', ''),
(208, 1, 10, '01480/2021', '2021-11-04', 'AMERICAN TOWER DO BRASIL', '', 0, '', 16, '5', 'RESPOSTA DE NOTIFICAÇÃO', 'RESPOSTA DE NOTIFICAÇÃO REFERENTE AO PROC DE N:0065/2021', 0, 0, '', '', '', ''),
(209, 1, 10, '01481/2021', '2021-11-04', 'AMERICAN TOWER DO BRASIL', '', 0, '', 16, '5', 'RESPOSTA DE NOTIFICAÇÃO ', 'RESPOSTA DE NOTIFICAÇÃO SOB O POC: DE N: 0066/2021', 0, 0, '', '', '', ''),
(210, 1, 10, '01482/2021', '2021-11-04', 'TOP NORTE ', '', 0, '', 16, '24', 'JUNTADA AO PROCESSO DE N:0223/2020', 'RESPOSTA DE NOTIFICAÇÃO DE N:080/2021 PARA COMPOR O PROCESSO DA EMPRESSA TOP NORTE', 0, 0, '', '', '', ''),
(211, 2, 24, '00256/2021', '2021-11-03', 'FONTEPLAST INDÚSTRIA DE EMBALAGENS LTDA', '', 0, '(91)3721-1072', 41, '39', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-03/ L.O-2021', 1, 12, 'R. PRINCESA ISABEL ', '103', '', ''),
(212, 2, 24, '00211/2021', '2021-09-28', 'L C B PONTES EIRELI-ME( L A PONTES) ', '', 0, '(91)98880-6975', 41, '43', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-04/ L.O-2021', 0, 34, 'AV.ALTAMIRA', '208', '', ''),
(213, 2, 24, '00141/2021', '2021-08-04', 'OFICINA TREVO REPARADORA DE VEÍCULOS LTDA', '', 0, '(91)3721-6567', 41, '42', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-04/L.O-2021', 1, 6, 'AL.IMPERIAL', '1576', '', ''),
(214, 2, 24, '00171/2021', '2021-09-08', 'SOCIEDADE RECANTO VERDE CASTANHAL- ASSISTÊNCIA PÓSTUMA LTDA', '', 0, '(91)3721-8460', 41, '87', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-04/L.O-2021', 1, 21, 'AV. BARÃO DO RIO BRANCO', '1109', '', ''),
(215, 1, 12, '01483/2021', '2021-11-04', 'MINISTERIO PUBLICO', '', 0, '', 16, '22', 'NOTICIA DE FATO N:004477', 'OFICIO DE N:369/2021-MP', 0, 0, '', '', '', ''),
(216, 2, 24, '00213/2021', '2021-09-29', 'AUTO POSTO BARÃO COMÉRCIO DE DERIVADOS DE PETRÓLEO LTDA( POSTO BOM JESUS)', '', 0, '(91) 98085-0342', 41, '47', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO ', 'CAIXA-04/L.O-2021', 1, 21, 'AV. BARÃO DO RIO BRANCO', '108', '', '');
INSERT INTO `protocolo` (`id`, `tipo_id`, `objetivo_id`, `numero_protocolo`, `data`, `interessado`, `cpf_cpnj`, `processo`, `contato`, `protocolista_id`, `numero_folhas`, `assunto`, `descricao`, `cidade`, `bairro`, `endereco`, `numero`, `latitude`, `longitude`) VALUES
(217, 2, 24, '00058/2021', '2021-04-14', 'I. A. CORECHA DISTRIBUIDORA DE GÁS( IVAN GÁS)', '', 0, '(91)3711-5275', 41, '58', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA -04/L.O-2021', 1, 6, 'R. COMANDANTE FRANCISCO DE ASSIS', '3744', '', ''),
(218, 1, 12, '01484/2021', '2021-11-04', 'MINISTERIO PUBLICO', '', 0, '', 16, '3', 'NOTICIA DE FATO N:003485-040/2021', 'OFICIO N:375/2021-MP', 0, 0, '', '', '', ''),
(219, 1, 11, '01485/2021', '2021-11-04', 'Lucilene rodrigues DA SILVA', '', 0, '', 16, '6', 'MEMORANDO -SEHAB', 'MEMORANDO DE N:234/2021-SEHAB', 0, 0, '', '', '', ''),
(220, 2, 19, '00259/2021', '2021-11-04', 'MARIA JOSE  FERREIRA DOS SANTOS', '', 0, '', 16, '5', 'PODA DE ARVORE POR INTERFERENCIA ELETRICA.', 'PODA', 0, 0, '', '', '', ''),
(221, 2, 24, '00168/2021', '2021-09-02', 'RECICLO RECICLAGEM E COMPOSTAGEM(RAFAEL MODESTO BARRETO 00257618201', '', 0, '(91)98054-4826', 41, '110', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-04/L.O-2021', 1, 35, 'R.FRANCISCO MAGALHÃES', '1869', '', ''),
(222, 2, 24, '00218/2021', '2021-10-05', 'H & T NOGUEIRA LTDA-PPE ( ANTÔNIO HÉRCULES ARAÚJO NOGUEIRA)(SÍTIO SÃO RAIMUNDO) ', '', 0, '(91) 988812-3734', 41, '66', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-04/L.O-2021', 1, 38, 'RODOVIA PA-136,KM 10(CASTANHAL-CURUÇÁ),SÍTIO SÃO RAIMUNDO', 'S/N', '', ''),
(223, 1, 11, '01486/2021', '2021-11-04', '5 BPM-BATALÃO CORONEL MAGELA ', '', 0, '', 16, '2', 'OFICIO N:082/2021-P/3', 'SOLICITAÇÃO DA OPERAÇÃO SOSSEGO CASTANHAL ', 0, 0, '', '', '', ''),
(224, 2, 31, '00070/2021', '2021-05-03', 'PARA PLACAS E SERVIÇOS EIRELI(PARA PLACAS)', '', 0, '(91)99376-8193', 41, '52', 'SOLICITAÇÃO DE AUTORIZAÇÃO DE FUNCIONAMENTO- AF', 'CAIXA-01/ A.F-2021', 1, 21, 'R. MAJOR WILSON', '60', '', ''),
(225, 2, 25, '00143/2021', '2021-08-05', 'SALLES DISTRIBUIDORA E REVENDEDORA DE COMBUSTÍVEL(SALLES)', '', 0, '(91)3721-2417', 41, 'S/N', 'SOLICITAÇÃO DE LICENÇA PREVIA-LP E LICENÇA DE INSTALAÇÃO-LI', 'CAIXA-01----> LP/LI-2021', 1, 38, 'AV. JOSÉ SALLES/ AERODROMO SALLES', 'S/N', '', ''),
(226, 2, 25, '00220/2020', '2021-11-09', 'Equatorial Pará Distribuidora de Energia S.A', '', 0, '913721-1045', 26, '183', 'NOTA TÉCNICA', '', 1, 20, '', '', '', ''),
(227, 2, 26, '00236/2021', '2021-10-19', 'CASTANHAL EMPREENDIMENTOS IMOBILIARIOS SPE  LTDA', '', 0, '(91) 3255-0012', 41, '96', 'SOLICITAÇÃO DE LICENÇA PRÉVIA-L.P', 'CAIXA-01/ LP-2021', 1, 17, 'RODOVIA PA-320,KM 03', 'S/N', '', ''),
(228, 2, 24, '00222/2021', '2021-10-06', 'J M DE SAMPAIO EIRELI (CHARCUTARIA 3J)', '', 0, '(91)98356-0087', 41, '033', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-05/L.O-2021', 1, 38, 'ROD. CASTANHAL/CURUÇÁ,TRAVESSA JOSE DE ALENCAR/KM 7', 'S/N', '', ''),
(229, 2, 24, '00220/2021', '2021-10-06', 'FUNDIÇÃO MELO LTDA', '', 0, '(91)3721-3472', 41, '66', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-05/L.O-2021', 1, 10, 'AV. PRESIDENTE GETÚLIO VARGAS', '9848-D', '', ''),
(230, 2, 24, '00221/2021', '2021-10-06', 'CASA DE SHOW E EVENTOS PARAÍSO', '', 0, '(91)99224-6807', 41, '63', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-05/L.O-2021', 1, 16, 'R. PEDRO PORPINO', '257', '', ''),
(231, 1, 10, '01487/2021', '2021-11-05', 'FAZENDA SANTA LUIZA', '', 0, '', 16, '2', 'REF: AO PROCESSO DE N:00827/2018 ', 'OFICIO DE N:568/2021', 0, 0, '', '', '', ''),
(232, 1, 10, '01488/2021', '2021-11-05', 'POSTO ICCAR', '', 0, '', 16, '4', 'JUNTADA AO PROC: N:0151/2020', 'PUBLICAÇÃO NO DIARIO OFICIAL ', 0, 0, '', '', '', ''),
(233, 1, 10, '01489/2021', '2021-11-05', 'POSTO ICCAR', '', 0, '', 16, '4', 'JUNTADA AO POC: N:0151/2021 REFERENTE A LP N:005/2021', 'PUBLICAÇÃO NO DIARIO OFICIAL', 0, 0, '', '', '', ''),
(234, 2, 19, '00260/2021', '2021-11-05', 'JOSE MARIA TAVARES MACHADO', '', 0, '', 16, '4', 'SOLICITAÇÃO DE PODA', 'SOLICITAÇÃO DE PODA POR INTERVENÇÃO ELETRICA ', 0, 0, '', '', '', ''),
(235, 2, 24, '00225/2021', '2021-10-08', 'SEDEX GÁS', '', 0, '(91)99191-2008', 41, '42', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-05/L.O-2021', 1, 23, 'AL. LILIANE SOUZA,LOTE 20', '20', '', ''),
(236, 2, 24, '00229/2021', '2021-10-13', 'EDUARDO MEDEIROS BEZERRA 59538813200(GASPAR LAVAGEM)', '', 0, '(91) 3721-1796', 41, '36', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA -05/L.O-2021', 1, 6, 'R. DOM  PEDRO', '36', '', ''),
(237, 2, 24, '00237/2021', '2021-10-19', 'AIRES E MADEIRA LTDA(CENTRO VETERINÁRIO VIDAPET)', '', 0, '(91)98946-1790', 41, '40', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA -05/L.O-2021', 1, 12, 'R. EXPEDITO PONTE DE ARAUJO', '469', '', ''),
(238, 1, 10, '01490/2021', '2021-11-05', 'AGROFERT LTDA', '', 0, '', 16, '16', 'RIA-RELATORIO  DE INFORMAÇOES AMBIENTAL ANUAL', 'JUNTADA PARA PROC: N:0034/2019', 0, 0, '', '', '', ''),
(239, 1, 10, '01491/2021', '2021-11-05', 'AGROGOMES  COMERCIO DE PRODUTOS', '', 0, '', 16, '4', 'PUBLICAÇOES DOS JORNAIS ', 'JUNTADA REFERENTE AO PROC: N:00243/2021 ', 0, 0, '', '', '', ''),
(240, 2, 29, '00261/2021', '2021-11-05', 'ADRIANA MARCIA MEDEIROS ', '', 0, '', 16, '5', 'SOLICITAÇÃO DE MADEIRA ', 'CONFECCIONAR 2(DUAS) RAMPAS PARA ACESSO A CADEIRANTE', 1, 1, '', '', '', ''),
(241, 2, 24, '00235/2021', '2021-10-15', 'A. SILVA SILVEIRA & CIA ( HOTEL ESTRELA)', '', 0, '(91)99977-1406', 41, '70', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-05/L.O-2021', 1, 6, 'TV. BEIJAMIN CONSTANT', '146', '', ''),
(242, 1, 12, '01492/2021', '2021-11-05', 'SUPERITENCIA DO IBAMA ', '', 0, '', 16, '4', 'SOLICITAÇÃO DE REPARO ', 'SOLICITAÇÃO DE REPARO NA REDE ELETRICA DE IMOVEIS E ENVIO DA APOLICE', 0, 0, '', '', '', ''),
(243, 2, 23, '00138/2019', '2019-01-30', 'BIG FRUIT AGROINDUSTRIA E COMERCIO DE POLPAS DE FRUTAS EIRELI', '', 0, '(91)98290-2122', 41, '79', 'SOLICITAÇÃO DE LICENÇA DE INSTALAÇÃO/OPERAÇÃO-L.I.O', 'CAIXA-01/ L.I.O.-2019/2020', 1, 0, 'RODOVIA PA 136, KM 04', 'S/N', '', ''),
(244, 2, 23, '00057/2021', '2020-05-22', 'J M CARNEIRO EIRELI ( JOELSON GÁS)', '', 0, '9198807-0312', 41, '17', 'SOLICITAÇÃO DE LICENÇA DE INSTALAÇÃO/OPERAÇÃO-L.I.O', 'CAIXA -01/ L.I.O.-2019/2020', 1, 12, 'AL. SANTA CLARA', '2737', '', ''),
(245, 1, 4, '01493/2021', '2021-11-05', 'ANONIMO', '', 0, '', 16, '2', 'MAUS TRATOS', 'DENUNCIA ANONIMA REFERENTE A MAUS TRATOS', 0, 0, '', '', '', ''),
(246, 1, 4, '01494/2021', '2021-11-05', 'ANTONIO DE PONTES DA SILVA', '', 0, '', 23, '4', 'POLUIÇÃO AMBIENTAL ', 'DENUNCIA REFENTE A POLUIÇÃO AMBIENTAL ', 1, 1, '', '', '', ''),
(247, 1, 12, '01495/2021', '2021-11-05', 'REGINALDO MOTA DE SOUZA', '', 0, '', 16, '2', 'SOLICITAÇÃO DE ROÇAGEM ', 'SOLICITAÇÃO DE ROÇAGEM NA AREA INTERNA DO ESPAÇO SANTA LIDIA ', 0, 0, '', '', '', ''),
(248, 1, 10, '01496/2021', '2021-11-08', 'AÇAI PREMIUM ', '', 0, '', 16, '4', 'JUNTADA DE DOCUMENTO', 'JUNTADA AO PROC:0722/2018 COM FINALIDADE DE INFORMA E SOLICITAR ORIENTAÇÃO SOBRE A SEGUINTE PROCEDIMENTO \r\n', 0, 0, '', '', '', ''),
(249, 1, 3, '01497/2021', '2021-11-08', 'forum nacional de gestores e limpeza', '', 0, '', 16, '2', 'CONVITE', 'ASSEMBLEIA EXTRAORDINARIA DO FORUM NACIONAL DE GESTORE DE LIMPEZA URBANA E MANEJO DE RESIDUOS SOLIDOS \r\n', 0, 0, '', '', '', ''),
(250, 2, 25, '00249/2021', '2021-10-21', 'PREFEITURA MUNICIPAL DE CASTANHAL/ ACADEMIA DA PRAÇA DO PACUQUARA', '', 0, '', 41, '07', 'SOLICITAÇÃO DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO', 'CAIXA-01/P.M.C-L.P/L.I-2021', 1, 1, 'AGRUVILA  PACUQUARA', 'S/N', '', ''),
(251, 2, 19, '00262/2021', '2021-11-08', 'ROSANGELA DOS SANTOS COUTINHO', '', 0, '', 16, '10', 'AUTORIZAÇÃO PARA SUPRESSÃO', 'ASV PARA A SENHORA ROSANGELA DOS SANTOS COUTINHO', 0, 0, '', '', '', ''),
(252, 2, 25, '00250/2021', '2021-10-21', 'PREFEITURA MUNICIPAL DE CASTANHAL/ACADEMIA AO AR LIVRE NO BOM JESUS', '', 0, '', 41, '07', 'SOLICITAÇÃO DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO-L.P/L.I', 'CAIXA-01/P.M.C-L.P/L.I-2021', 1, 5, 'RUA FRANCISCO PEREIRA LAGO', 'S/N', '', ''),
(253, 2, 25, '00251/2021', '2021-10-21', 'PREFEITURA MUNICIPAL DE CASTANHAL/ACADEMIA AO AR LIVRE NA AGROVILA SÃO RAIMUNDO', '', 0, '', 41, '07', 'SOLICITAÇÃO DE LICENÇA  PRÉVIA E LICENÇA DE INSTALAÇÃO', 'CAIXA-01/P.M.C- L.P/L.I-2021', 1, 38, 'AV. SÃO RAIMUNDO/AGROVILA SÃO RAIMUNDO', 'S/N', '', ''),
(254, 1, 10, '01498/2021', '2021-11-08', 'BACABA VEICULOS LTDA', '', 0, '', 16, '12', 'JUNTADA DE DOCUMENTOS', 'EM ATENÇÃO AO PROC DE N:01633/2018 REFERENTE A EMPRESA BACABA VEICULOS LTDA\r\n', 0, 0, '', '', '', ''),
(255, 2, 25, '00252/2021', '2021-10-21', 'PREFEITURA MUNICIPAL DE CASTANHAL/PRAÇA DA JADERLÂNDIA BR', '', 0, '', 41, '07', 'SOLICITAÇÃO DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO- L.P/L.I', 'CAIXA-01/P.M.C- L.P/L.I-2021', 1, 19, 'AV. PRESIDENTE GETÚLIO VARGAS', 'S/N', '', ''),
(256, 1, 4, '01499/2021', '2021-11-08', 'ANONIMO', '', 0, '', 16, '2', 'DENUNCA SOBRE POLUIÇÃO', 'POLUIÇÃO ATMOSFERICA SOB O EMPREENDIMENTO O FRANGO ASSADO', 0, 0, '', '', '', ''),
(257, 2, 25, '00238/2021', '2021-10-21', 'PREFEITURA MUNICIPAL DE CASTANHAL/ CONSTRUÇÃO DE QUADRA POLIESPORTIVA  COBERTA NA AGROVILA SÃO RAIMUNDO', '', 0, '', 41, '19', 'SOLICITAÇÃO DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO- L.P/L.I', 'CAIXA-01/P.M.C- L.P/L.I-2021', 1, 38, 'R. MARIA DE NAZARÉ TORRES/AGROVILA SÃO RAIMUNDO', 'S/N', '', ''),
(258, 2, 25, '00172/2021', '2021-09-14', 'PREFEITURA MUNICIPAL DE CASTANHAL/ QUADRA POLIESPORTIVA COBERTA DO CONJUNTO TANGARAS', '', 0, '', 41, '16', 'SOLICITAÇÃO DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO- LP/LI', 'CAIXA-01/P.M.C- LP/LI-2021', 1, 14, 'PRAÇA DO TANGARAS/ENTRE R. WE-10 E R. WE-08', '', '', ''),
(259, 2, 25, '00175/2021', '2021-09-14', 'PREFEITURA MUNICIPAL DE CASTANHAL/CONSTRUÇÃO DA QUADRA COBERTA NO PARQUE DOS CASTANHAIS', '', 0, '', 41, '16', 'SOLICITAÇÃO DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO ', 'CAIXA -01/P.M.C-L.P/LI-2021', 1, 23, 'AV. CRISTO REDENTOR/ ENTRE A. IMPARADOR E AL. NOVA OLINDA', 'S/N', '', ''),
(260, 2, 25, '00176/2021', '2021-09-14', 'PREFEITURA MUNICIPAL DE CASTANHAL/ CONSTRUÇÃO DA QUADRA COBERTA DA AGROVILA PACUQUARA', '', 0, '', 41, '16', 'SOLICITAÇÃO  DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO', 'CAIXA-01/P.M.C- L.P/L.I- 2021', 1, 38, 'R. JOSUÉ DE MATOS/AGROVILA PACUQUARA', 'S/N', '', ''),
(261, 2, 25, '00177/2021', '2021-09-14', 'PREFEITURA MUNICIPAL DE CASTANHAL/CONSTRUÇÃO DA QUADRA COBERTA DA AGROVILA  BACABAL', '', 0, '', 41, '15', 'SOLICITAÇÃO  DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO', 'CAIXA-01/P.M.C-L.P/L.I-2021', 1, 38, 'R. MAGALHÃES BARATA/ AGROVILA BACABAL', 'S/N', '', ''),
(262, 2, 25, '00178/2021', '2021-09-14', 'PREFEITURA MUNICIPAL DE CASTANHAL/ CONSTRUÇÃO DA QUADRA COBERTA DA AGROVILA CALÚCIA', '', 0, '', 41, '08', 'SOLICITAÇÃO  DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO', 'CAIXA -01/P.M.C-L.P/L.I-2021', 1, 38, 'RUA PRINCIPAL/ AGROVILA CALÚCIA', 'S/N', '', ''),
(263, 2, 25, '00179/2021', '2021-09-14', 'PREFEITURA MUNICIPAL DE CASTANHAL/ CONSTRUÇÃO DE PRAÇA E CAMPO DE FUTEBOL DA COHAB', '', 0, '', 41, '07', 'SOLICITAÇÃO  DE LICENÇA PRÉVIA E LICENÇA DE INSTALAÇÃO', 'CAIXA-01/P.M.C-L.P/L.I-2021', 1, 34, 'AV. DUQUE DE CAXIAS', 'S/N', '', ''),
(264, 1, 10, '01500/2021', '2021-11-08', 'AUTO POSTO BARÃO COMERCIO DE DERIVADOS PETROLEO', '', 0, '', 16, '64', 'RESPOSTA DE NOTIFICAÇÃO DE N:00120/2021/CLA', 'JUNTADA DE DOCUMENTO ', 0, 0, '', '', '', ''),
(265, 1, 10, '01501/2021', '2021-11-08', 'F M COMERCIO E SERVIÇOS ', '', 0, '', 16, '3', 'OFICIO ', 'SOICITAÇÃO DE PRORROGAÇÃO DE PRAZO REFERENTE AO PRO:0099/2021/PROC', 0, 0, '', '', '', ''),
(266, 2, 22, '00181/2021', '2021-09-15', 'PREFEITURA MUNICIPAL DE CASTANHAL/ ESTAÇÃO MARIA FUMAÇA', '', 0, '', 41, '22', 'SOLICITAÇÃO DE LICENÇA DE INSTALAÇÃO-L.I', 'CAIXA-01/P.M.C-L.I/2021', 1, 12, 'TV. QUINTINO BOCAIÚVA', '', '', ''),
(267, 1, 12, '01502/2021', '2021-11-08', 'MINISTERIO PUBLICO', '', 0, '', 16, '2', 'NOTICIA DE FATO N:002814-040/2021', 'OFICIO DE N:389/2021-MP', 0, 0, '', '', '', ''),
(268, 2, 22, '00180/2021', '2021-09-15', 'PREFEITURA MUNICIPAL DE CASTANHAL/ REFORMA E AMPLIAÇÃO DA FEIRA DO BAIRRO SANTA LÍDIA(MILAGRE)', '', 0, '', 41, '27', 'SOLICITAÇÃO DE LICENÇA DE INSTALAÇÃO- L.I', 'CAIXA- 01/P.M.C- L.I/2021', 1, 32, 'R. ANTÔNIO HORÁCIO', 'S/N', '', ''),
(269, 2, 22, '00173/2021', '2021-09-14', 'PREFEITO MUNICIPAL DE CASTANHAL/ QUADRA COBERTA DO CONJUNTO JAPIM', '', 0, '', 41, '16', 'SOLICITAÇÃO DE LICENÇA DE INSTALAÇÃO- L.I', 'CAIXA-01/ P.M.C- L.I -2021', 1, 40, 'TRAVESSA H', 'S/N', '', ''),
(270, 1, 10, '01503/2021', '2021-11-09', 'PAROQUIA SANTA MARIA MAE DE DEUS', '', 0, '', 16, '3', 'COMPROVANTE', 'COMPROVANTE DE TAXA PARA ASV ', 0, 0, '', '', '', ''),
(271, 2, 21, '00263/2021', '2021-11-09', 'FAZENDA BELA VISTA II E SITIO SANTO ANTONIO', '', 0, '', 16, '42', 'LICENÇA DE ATIVIDADE RUAL-LAR', 'LICENÇA DE ATIVIDADE RURAL FAZENDA BELA VISTA II E SITIO SANTO ANTONIO', 0, 0, '', '', '', ''),
(272, 2, 25, '00049/2021', '2021-03-30', 'CENTRO DE ATENDIMENTO A SAÚDE DA CRIANÇA', '', 0, '3721-4261', 26, '94', 'SOLICITAÇÃO DE LICENÇA DE LP -LI', '00049/2021', 1, 10, 'ALAMEDA MANOEL PORPINO', 'S/Nº', '', ''),
(273, 1, 10, '01504/2021', '2021-11-09', 'ASSAI ATACADISTA', '', 0, '', 16, '62', 'JUNTADA DE DOCUMENTOS ', 'RIA- RELATORIO DE INFORMAÇÃO AMBIENTAL ANUAL REFERENTE AO ANO 2020/2021 REFERENTE A LICENÇA 031/2019 ,PROC:00222/2019\r\n', 0, 0, '', '', '', ''),
(274, 2, 28, '00165/2020', '2020-10-16', 'NORTFRUTAS EIRELI', '', 0, '(91)9 8290-2122', 41, '78', 'SOLICITAÇÃO DE RENOVAÇÃO DE LICENÇA DE OPERAÇÃO- RLO', 'CAIXA-02/L.O 2020', 1, 0, 'AL. LIBERDADE', '5537', '', ''),
(275, 1, 12, '01505/2021', '2021-11-09', 'SEMADA', '', 0, '', 16, '2', 'INDICAÇÃO DE REPRESENTANTE ', 'OFICIO DE N:404/2021/PMC/SEMADA', 0, 0, '', '', '', ''),
(276, 2, 24, '00219/2021', '2020-12-15', 'W P CINTRA EIRELI/Sr. WARLEY PIRES CINTRA', '', 0, '(91) 98429-1526', 41, '46', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA-02/L.O-2020', 1, 16, 'AV. PRESIDENTE GETÚLIO VARGAS', '1028', '', ''),
(277, 2, 24, '00224/2020', '2020-12-17', 'AMMEQ/HIAGO M DA S ARAUJO EIRELI', '', 0, '(91)98768-6838', 41, '28', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA-02/L.O-2020', 1, 33, 'R. DOM PEDRO II', '970', '', ''),
(278, 2, 24, '00093/2020', '2020-07-27', 'ORNATTA COMÉRCIO DE MÓVEIS SOB MEDIDA LTDA/ORNATTA MÓVEIS SOB MEDIDA E ACESSÓRIOS', '', 0, '(91) 98454-8656', 41, '55', 'SOLICITAÇÃO DE  LICENÇA DE OPERAÇÃO-L.O', 'CAIXA-02/ L.O-2020', 1, 8, 'R. PAES DE CARVALHO', '916', '', ''),
(279, 2, 24, '00189/2020', '2020-11-18', 'DISTRIBUIDORA CORECHA COMÉRCIO DE GÁS LTDA/CORECHA GÁS', '', 0, '(91) 99940-2028', 41, '52', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA - 02/ L.O-2020', 1, 0, 'AV. C / QUADRA 52-SALLES JARDINS I', '01', '', ''),
(280, 2, 24, '00180/2020', '2020-10-29', 'BARBOSA REBOK EIRELI/ BARBOSA REBOK', '', 0, '(91)98137-4742', 41, '22', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA-02/L.O-2020', 1, 16, 'AV. PRESIDENTE GETÚLIO VARGAS', '4971', '', ''),
(281, 1, 12, '01506/2021', '2021-11-09', 'SEMADA', '', 0, '', 16, '8', 'DISPONIBILIDADE DE SERVIDORES', 'OFICIO DE N:395/2021/PMC/SEMADA', 0, 0, '', '', '', ''),
(282, 1, 12, '01507/2021', '2021-11-09', 'SECRETARIA DE CULTURA-SECULT', '', 0, '', 16, '2', 'SOLICITAÇÃO DO HORTO MUNICIPAL', 'OFICIO DE N:529/2021-SECULT', 0, 0, '', '', '', ''),
(283, 2, 24, '00173/2020', '2020-10-22', 'ERNANE GONÇALVES DE ASSIS/ PNEULÂNDIA', '', 0, '(91) 98237-7634', 41, '51', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA -02/ L.O -2020', 1, 0, 'AV. PRESIDENTE GETÚLIO VARGAS/ESQ. COM A RUA OITO', '196', '', ''),
(284, 2, 19, '00264/2021', '2021-11-09', 'JOCIENE DA SILVA TEXEIRA ', '', 0, '', 16, '8', 'SUPRESSÃO VEGETAL ', 'ASV DE UMA ARVORE DE IPE ROXO ', 0, 0, '', '', '', ''),
(285, 2, 24, '00234/2020', '2020-12-30', 'SOCIEDADE RECANTO CASTANHAL-ASSISTÊNCIA PÓSTUMA/SOCIEDADE RECANTO VERDE', '', 0, '(91)99201-4245', 41, '127', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA-02/L.O-2020', 1, 21, 'AV. BARÃO DO RIO BRANCO', '1109', '', ''),
(286, 2, 24, '00103/2020', '2020-08-05', 'E A COSTA AMORIM COMERCIO DE GÁS/DISTRIBUIDORA AMORIM', '', 0, '(91)3711-0359', 41, '42', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA -03/ L.O-2020', 1, 33, 'TV. SÓLON BOTELHO', '28', '', ''),
(287, 2, 24, '00023/2020', '2020-01-31', 'MERCADÃO COMÉRCIO DE CARNES EIRELI/ MERCADÃO DAS CARNES', '', 0, '(91) 99991-6400', 41, '38', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA-03/ L.O - 2020', 1, 14, 'RUA XI', '44', '', ''),
(288, 2, 24, '00080/2020', '2020-07-15', 'J G A COLDEBELLA/SOFT CLEAN LAVANDERIA', '', 0, '(91) 98202-4133', 41, '2271', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA-03/L.O-2020', 1, 12, 'R. COMANDANTE FRANCISCO DE ASSIS', '2271', '', ''),
(289, 2, 24, '00078/2020', '2020-07-09', 'F A DO NASCIMENTO FABRICAÇÃO LTDA- ME', '', 0, '(91) 99170-9218', 41, '100', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA-03/L.O-2020', 1, 0, 'R. JOAQUIM DE MATOS', '185', '', ''),
(290, 2, 24, '00037/2020', '2020-02-17', 'LUCIANA VIEIRA MARIANO', '', 0, '(91)98429-1526', 41, '53', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA-03/L.O-2020', 1, 35, 'AL. W2', '159', '', ''),
(291, 1, 10, '01508/2021', '2021-11-09', 'bela iaça polpas de frutas ', '', 0, '', 16, '2', 'declaração de tramite', 'solicitação de declarçaõ de tramite', 0, 0, '', '', '', ''),
(292, 1, 10, '01509/2021', '2021-11-09', 'petruz fruit industria comercio e distribuidora', '', 0, '', 16, '2', 'Declaração de tramite', 'SOLICITAÇÃO DE DECLARAÇÃO DE TRAMITE ', 0, 0, '', '', '', ''),
(293, 1, 12, '01510/2021', '2021-11-09', 'SECRETARIA DE CULTURA E DESENVOLVIMENTO AGRARIO', '', 0, '', 16, '2', 'RESPOSTA A SOLICITAÇÃO DE AUTORIZAÇÃO DE POLDA', 'OFICIO DE N:246/2021/FMS', 0, 0, '', '', '', ''),
(294, 1, 12, '01511/2021', '2021-11-09', 'MINISTERIO PUBLICO', '', 0, '', 16, '5', 'REQUERIMENTO DE PROCESSO', 'N: PROCESSO 2021/11/11682\r\n', 0, 0, '', '', '', ''),
(295, 1, 12, '01512/2021', '2021-11-09', 'TRIBUNAL DE JUSTIÇA DO ESTADO DO PARA', '', 0, '', 16, '4', 'REWUERIMENTO DE PROCESSO', 'N: PROCESSO 2021/11/11665\r\n\r\n', 0, 0, '', '', '', ''),
(296, 1, 12, '01513/2021', '2021-11-09', 'SEMAS', '', 0, '', 16, '2', 'SOLICITAÇÃO', 'OFICIO DE N:053/2021 CRAS JADERLANDIA ', 0, 0, '', '', '', ''),
(297, 2, 24, '00090/2020', '2020-07-24', 'PREFEITURA MUNICIPAL DE CASTANHAL/UBS JAPIM', '', 0, '', 41, '31', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'ANEXO: 00667/2018/PROC- L.P/L.I( ENTRADA EM 15/05/20218)\r\nCAIXA-03/L.O-2020', 1, 39, 'TV. D/ ESQUINA COM A RUA MODELO 02', 'S/N', '', ''),
(298, 2, 24, '00127/2020', '2020-08-28', 'EDVAN GRIPP/ LATICÍNIO RANCHO GALILEU', '', 0, '(91)98853-6866', 41, '07', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-03/L.O-2020', 1, 38, 'ROD. CASTANHAL SÃO FRANCISCO,KM9', 'S/N', '', ''),
(299, 2, 24, '00120/2020', '2020-08-20', 'CLENILSON LOPES ALEIXO 51308657234/CASA DE SHOWS PARADA TOP', '', 0, '', 41, '12', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA-03/L.O-2020', 1, 33, 'TV. VITÓRIA RÉGIA', '472', '', ''),
(300, 2, 26, '00118/2021', '2021-07-14', 'IUCHI CENTRO DE SAUDE ', '', 0, '9198197-8407', 26, '50', 'CANCELAMENTO DE LICENÇA PRÉVIA ', '', 1, 8, 'AVENIDA BARÃO DO RIO BRANCO ', '2425', '', ''),
(301, 1, 12, '01514/2021', '2021-11-10', 'Glimar soares de oliveira ', '', 0, '', 16, '2', 'SOLICITANDO O CANCELAMENTO DE PEDIDO DE ASV ', 'OFICIO DE N:001/2021', 0, 0, '', '', '', ''),
(302, 1, 10, '01516/2021', '2021-11-10', 'NUTRI AÇAI IND. E COM DE POLPAS ', '', 0, '', 16, '17', 'SOLICITAR A JUNTADA DE DOCUMENTOS  AO PROC:017/2019 REFERENTE A EMPRESA NUTRI AÇAI INDUSTRIA E COMERCIO DE POLPAS', 'OFICIO DE N:744/2021', 0, 0, '', '', '', ''),
(303, 1, 10, '01517/2021', '2021-11-10', 'JF AMORIN E CIA LTDA', '', 0, '', 16, '10', 'RESPOSTA DE NOTIFICAÇÃO  00118/2021/CLA SOB PROTOCOLO DE N:00190/2021/PROC\r\n', 'OFICIO N:580/2021', 0, 0, '', '', '', ''),
(304, 1, 12, '01515/2021', '2021-11-10', 'POLYMEDH', '', 0, '', 16, '6', 'SOLICITAÇÃO DE VISITA  NO ESTABELECIMENTO COMERCIAL DE RECICLAGEM  \r\n', 'POLYMEDH ', 0, 0, '', '', '', ''),
(305, 1, 4, '00755/2021', '2021-06-21', 'ANÔNIMO', '', 0, '', 22, '2', 'DESPEJO IRREGULAR DE RESÍDUOS PRÓXIMO A CORPO HÍDRICO', 'O DENUNCIANTE INFORMA QUE A EMPRESA LATICINIOS KAMY ESTÁ FAZENDO DESPEJO IRREGULAR DE RESÍDUOS GERADOS NA FABRICAÇÃO DE LEITE EM ESPECÍFICO SORO DE LEITE, O QUAL ESTARIA POLUINDO O CORPO HÍDRICO E NASCENTE PRÓXIMO.', 1, 38, '', '', '', ''),
(306, 2, 24, '00268/2021', '2021-11-11', 'GUAMA POLPAS INDUSTRIAS E EXPORTAÇÃO ', '', 0, '', 16, '30', 'LICENÇA DE OPERAÇÃO', 'LICENÇA DE OPERAÇÃO SOB CNPJ:34.268.600/0001-57\r\n', 0, 0, '', '', '', ''),
(307, 1, 4, '00580/2021', '2021-05-19', 'FRANCISCO SIMÃO DE OLIVEIRA SILVA', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'DENUNCIANTE INFORMA QUE A MOVELARIA FAZ MUITO BARULHO FORA DO HORÁRIO E O DESCARREGAMENTO DE MADEIRA ACONTECE A NOITE FORA DO HORÁRIO TAMBÉM, PROVOCANDO INCOMODO COM O BARULHO.', 1, 23, '', '', '', ''),
(308, 1, 4, '00555/2021', '2021-05-13', 'RODRIGO CHAGAS GONÇALVES ', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO (LOJA DE CONVENIÊNCIA), ESTÁ OCORRENDO FESTAS COM UTILIZAÇÃO DE APARELHO SONORO PROVENIENTES DE SOM AUTOMOTIVO DOS CARROS QUE FICAM ESTACIONADOS NO REFERIDO LOCAL, COM INICIO POR VOLTA DAS 22HS COM TÉRMINO POR VOLTA DAS 8HS DO DIA SEGUINTE, CAUSANDO TRANSTORNOS AO DENUNCIANTES POR CONTA DO INTENSO RUÍDO. ', 1, 32, '', '', '', ''),
(309, 1, 4, '00568/2021', '2021-05-17', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO AMBIENTAL E SONORA', 'DENUNCIANTE INFORMA QUE O LAVA JATO FAZ CONSTANTE BARULHO E O USO DOS PRODUTOS ESTÃO AFETANDO SUA SAÚDE E O CHEIRO DOS PRODUTOS ESTA ADENTRANDO SUA RESIDÊNCIA ', 1, 12, '', '', '', ''),
(310, 2, 24, '00069/2020', '2020-06-26', 'INDÚSTRIA DE GUARDANAPOS DIPAPEL  LTDA', '', 0, '(91) 3721-1072', 41, '60', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA -04/ L.O -2020', 1, 12, 'TV. OSASCO', '466', '', ''),
(311, 2, 24, '00050/2020', '2020-04-30', 'K.W. CINTRA LTDA', '', 0, '(91) 98429-1526', 41, '64', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-04/ L.O-2020', 1, 16, 'AV. PRESIDENTE GETÚLIO VARGAS', '1028', '', ''),
(312, 1, 4, '01391/2020', '2020-10-30', 'DIOCLEIO BRITO DOS SANTOS', '', 0, '', 1, '14', 'DESPEJO DE EFLUENTES EM CORPO HÍDRICO', 'O DENUNCIANTE INFORMA QUE, O REFERIDO FRIGORÍFICO, ESTÁ DESPEJANDO EFLUENTES/RESÍDUOS DENTRO DO CORPO HÍDRICO LOCALIZADO NA FAZENDA PROGRESSO I, OCASIONANDO A MORTANDADE DE PEIXES E OUTROS ANIMAIS.', 1, 38, '', '', '', ''),
(313, 2, 24, '00102/2020', '2020-08-04', 'MARCOS R. FERNANDES/ SORVETES ULA-ULA', '', 0, '3721-1796', 41, '21', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-04/L.O-2020', 1, 12, 'AL. TIRADENTES', '1127', '', ''),
(314, 1, 4, '00508/2021', '2021-05-06', 'ROGERIO LIMA DE ARAUJO', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'DENUNCIA REFERENTE A POLUIÇÃO SONORA CONSTANTEMENTE, REFERENTE A RESIDENCIA 1 (JOSIEL). CASA 2 (CLAUDIA), CASA 3, CASA 6 (IGREJA) E A CASA AO LADO DA IGREJA.', 1, 0, '', '', '', ''),
(315, 2, 24, '00045/2020', '2020-02-28', 'PÃO DA VIDA IND. E COM. DE PRODUTOS ALIMENTÍCIOS LTDA(PÃO DA VIDA)/MAX SANDE GOES MACHADO', '', 0, '(91) 98429-1526', 41, '116', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA-04/L.O-2020', 1, 21, 'AV. BARÃO DO RIO BRANCO', '2649', '', ''),
(316, 1, 4, '00501/2021', '2021-05-06', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'DENUNCIA REFERENTE A POLUIÇÃO SONORA, RUIDO DE CAMINHÕES INCOMODANDO A VIZINHANÇA', 1, 31, '', '', '', ''),
(317, 1, 4, '00746/2021', '2021-06-18', 'ANÔNIMO', '', 0, '', 22, '3', 'POLUIÇÃO SONORA', 'DENUNCIA REFERENTE AO ESTABELECIMENTO RR ÓTICA POR  POLUIÇÃO SONORA. A DENUNCIANTE INFORMA QUE JÁ FOI FEITA UMA TENTATIVA AMIGÁVEL PARA RESOLVER A SITUAÇÃO, MAS NÃO HOUVE SOLUÇÃO. QUE O ESTABELECIMENTO COMERCIAL PASSA DOS LIMITES O DIA INTEIRO.', 1, 8, '', '', '', ''),
(318, 2, 24, '00130/2020', '2020-09-04', 'RICHENE E SALLES AGRONEGÓCIOS E SERVIÇOS LTDA', '', 0, '(91)98763-2945', 41, '68', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA-04/ L.O-2020', 1, 21, 'TV. BENJAMIN CONSTANT', 'BOX 23', '', ''),
(319, 1, 4, '00618/2021', '2021-05-25', 'SANDRA MARIA DA SILVA MELO', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'DENUNCIANTE INFORMA MUITO BARULHO DE HORÁRIO CONSTANTE, ATÉ FINAIS DE SEMANA', 1, 0, 'RUA 1 DE MAIO', '', '', ''),
(320, 1, 4, '00617/2021', '2021-05-25', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'DENUNCIANTE INFORMA QUE CARRO SOM IMPEDE QUE A POPULAÇÃO FAÇA SEUS SERVIÇOS NAS LOJAS DEVIDO MUITO BARULHO ', 1, 6, '', '', '', ''),
(321, 2, 24, '00062/2020', '2020-06-16', 'ANTÔNIO FERREIRA DO NASCIMENTO / LEGAUTO', '', 0, '(91) 99962-0707', 41, '153', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA - 04/ L.O- 2020', 1, 21, 'TV. SANTA HELENA', '153', '', ''),
(322, 1, 4, '00579/2021', '2021-05-19', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO AMBIENTAL E SONORA', 'DENUNCIANTE INFORMA QUE A MOVELARIA FAZ MUITO BARULHO E INFORMA TAMBÉM QUE A MADEIRA DESCARREGADA A NOITE PODE SER ILEGAL, QUE ELE E ALGUNS VIZINHOS RECLAMAM DA POEIRA QUE ADENTRA SUA RESIDENCIA.', 1, 25, '', '', '', ''),
(323, 1, 4, '00443/2021', '2021-04-20', 'ANÔNIMO', '', 0, '', 22, '3', 'POLUIÇÃO SONORA', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO ESTÁ FUNCIONANDO UM CLUBE DE TIRO, DIARIAMENTE, O QUE VEM OCASIONANDO TRANSTORNOS AOS MORADORES DO ENTORNO DO LOCAL, DEVIDO O SOM ORIUNDO DOS DISPAROS DAS ARMAS DE FOGO.', 1, 1, '', '', '', ''),
(324, 2, 24, '00022/2020', '2020-01-30', 'ANA PAULA NASCIMENTO DE MORAES', '', 0, '(91) 98429-1526', 41, ' 56', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA-04/L.O-2020', 1, 21, 'R. COMANDANTE FRANCISCO DE ASSIS', '999', '', ''),
(325, 1, 4, '00497/2021', '2021-05-05', 'ANÔNIMO', '', 0, '', 22, '4', 'POLUIÇÃO SONORA', 'DENUNCIA REFERENTE A POLUIÇÃO SONORA, PROVENIENTE DE FESTAS REALIZADAS PERIODICAMENTE NO \" GALPÃO DA 3 DE OUTUBRO\"', 1, 38, '', '', '', ''),
(326, 1, 4, '00102/2021', '2021-02-02', 'ANÔNIMO', '', 0, '', 22, '2', 'QUEIMADA FEITA POR MOVELARIA DIARIAMENTE', 'SEGUNDO DENUNCIANTE, O PROPRIETÁRIO DA MOVELARIA ATEIA FOGO DIARIAMENTE EM RESTOS DE MADEIRA', 1, 16, '', '', '', ''),
(327, 2, 24, '01261/2019', '2019-08-01', 'TIM S/A / TIM( ESTAÇÃO DE RÁDIO BASE- da EMPRESA GRUPO TORRESUR)', '', 0, '(11)4119-6000', 41, '168', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA- 01/ L.O - 2019', 1, 6, 'AL. ELIAS MOREIRA/ ESTRADA PARA MARUDÁ) ', '315', '', ''),
(328, 1, 4, '00709/2021', '2021-06-10', 'AUGUSTO JUNIOR', '', 0, '', 22, '18', 'DESPEJO IRREGULAR DE RESÍDUOS', 'DENUNCIANTE INFORMA QUE EMPREENDIMENTO HABITACIONAL DIRECIONA TUBULAÇÃO ONDE CORRE LÍQUIDO POLUIDO PARA A PROPRIEDADE VIZINHA QUE POSSUI UMA NASCENTE AFLUENTE DO RIO APEÚ E QUE ESTÁ OCORRENDO SÉRIO RISCO DE DEGRADAÇÃO E EXTINÇÃO. ', 1, 1, '', '', '', ''),
(329, 1, 4, '00430/2021', '2021-04-23', 'ANÔNIMO', '', 0, '', 22, '2', 'DESPEJO DE RESÍDUOS DA FOSSA EM VIA PÚBLICA', 'SEGUNDO A DENUNCIANTE, RESIDENCIAL MARAÚ ESTA FAZENDO DESPEJO DE RESÍDUOS DA FOSSA EM VIA PÚBLICA', 1, 17, '', '', '', ''),
(330, 2, 24, '00619/2019', '2019-04-22', 'AUTO POSTO COMERCIAL ALIANÇA LTDA/ ARTUR FELIPE NAKAUTH FREIRES', '', 0, '(91)998054-1239', 41, '166', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA-01/ L.O - 2019', 1, 21, 'AV. DUQUE DE CAXIAS', '2173', '', ''),
(331, 1, 4, '00716/2021', '2021-06-14', 'ANÔNIMO', '', 0, '', 22, '7', 'POLUIÇÃO AMBIENTAL', 'O DENUNCIANTE INFORMA QUE VARIAS EMPRESAS DE DESCARTE DE ENTULHOS DESPEJAM DE FORMA IRREGULAR LIXO NA ESTRADA BOA VISTA (RAMAL BAGICO)', 1, 24, '', '', '', ''),
(332, 1, 10, '01518/2021', '2021-11-11', 'Petruz fruity', '', 0, '', 16, '9', 'JUNTADA ', 'CUMPRIMENTO DE CONDICIONANTE DA L.O PETRUZ FRUITY \r\n', 0, 0, '', '', '', ''),
(333, 1, 4, '00340/2021', '2021-03-29', 'ANÔNIMO', '', 0, '', 22, '2', 'RESÍDUO SÓLIDOS E POLUIÇÃO ATMOSFÉRICA', 'A DENUNCIA REFERENCIA O MAL CHEIRO RECORRENTE VINDO DA FAZENDA, NAS ULTIMAS SEMANAS, ONDE O DENUNCIANTE JÁ VIU VÁRIOS CAMINHÕES DE ENTULHO E DE FRUTARIA ENTRANDO NO LOCAL, COM RESTO DE COMIDA E LIXO, ALÉM DE CONSTRUÍREM UM CHIQUEIRO PRÓXIMO AO MURO QUE DÁ ACESSO AO CONJUNTO.  INFORMA TAMBÉM QUE OS ANIMAIS DESSA FAZENDA FICAM NAS REDONDEZAS DE UM CANAL PROXIMO AO CONJUNTO E QUE PODEM CAUSAR ACIDENTES  POR SEREM ANIMAIS DE GRANDE PORTE.', 1, 0, '', '', '', ''),
(334, 1, 10, '01519/2021', '2021-11-11', 'bela iaça polpas de frutas ', '', 0, '', 16, '9', 'JUNTADA', 'CUMPRIMENTO DE CONDICIONANTE DA L.O BELA IAÇA\r\n', 0, 0, '', '', '', ''),
(335, 1, 4, '00599/2021', '2021-05-24', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO AMBIENTAL', 'O DENUNCIANTE INFORMA QUE A RESIDENCIA DE FRENTE A SUA CASA ESTA ABANDONADA E A POPULAÇÃO ESTA JOGANDO MUITO LIXO', 1, 21, '', '', '', ''),
(336, 1, 10, '01520/2021', '2021-11-11', 'HIGHILE DO BRASIL II INFRAESTRUTURA ', '', 0, '', 16, '4', 'JUNTADA', 'ATENDIMENTO DE CONDICIONANTE N:0024/2021\r\n', 0, 0, '', '', '', ''),
(337, 1, 4, '00528/2021', '2021-05-10', 'ANÔNIMO', '', 0, '', 22, '2', 'DESCARTE IRREGULAR DE RESÍDUOS', 'DESCARTE IRREGULAR DE RESÍDUOS CAUSANDO MAL CHEIRO', 1, 23, '', '', '', ''),
(338, 1, 4, '00812/2021', '2021-06-30', 'ANÔNIMO', '', 0, '', 22, '7', 'CONSTRUÇÃO IRREGULAR SOBRE CORPO HÍDRICO, DESPEJO IRREGULAR DE ESGOTO EM CORPO HÍDRICO, CORTE IRREGULAR DE ÁRVORE (DESMATAMENTO)', 'SEGUNDO O DENUNCIANTE A SENHORA CONHECIDA COMO VANJA BLOQUEOU O ACESSO AOS MORADORES AO IGARAPÉ DO PACUQUARA, POR MEIO DE UMA CONSTRUÇÃO IRREGULAR SOBRE O REFERIDO IGARAPE. ALÉM DE ESTAR DESPEJANDO ESGOTO NO MESMO IGARAPE ', 1, 38, '', '', '', ''),
(339, 1, 10, '01521/2021', '2021-11-11', 'E.M.C KOSEKI', '', 0, '', 16, '21', 'JUNTADA', 'ATENDIMENTO DE CONDICIONANTE Nº 028/2018\r\n', 0, 0, '', '', '', ''),
(340, 2, 24, '02075/2019', '2019-11-29', 'AUTO POSTO ESTRELA COMÉRCIO DE DERIVADOS DE PETRÓLEO/POSTO BOM JESUS ', '', 0, '(91) 99818-0043', 41, '161', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', '', 1, 12, 'AL. LIBERDADE', '3305', '', ''),
(341, 1, 10, '01522/2021', '2021-11-11', 'SUPER POSTO IMPERADOR LTDA', '', 0, '', 16, '50', 'JUNTADA', 'ATENDIMENTO DE CONDICIONANTE Nº 031/2018\r\n', 0, 0, '', '', '', ''),
(342, 1, 10, '01523/2021', '2021-11-11', 'POSTO DE COMBUSTIVEL NOVO ESTRELA ', '', 0, '', 16, '51', 'JUNTADA', 'ATENDIMENTO A CONDICIONANTE DE LICENÇA DE OPERAÇÃO Nº 033/2018\r\n', 0, 0, '', '', '', ''),
(343, 1, 12, '01524/2021', '2021-11-11', 'SEMADA', '', 0, '', 16, '2', 'OFICIO N:407/2021/PMC/SEMADA', 'ENCAMINHAMENTO DE SOLICITAÇÃO DE PODAS', 0, 0, '', '', '', ''),
(344, 1, 10, '01525/2021', '2021-11-11', 'SBA TORRES BRASIL', '', 0, '', 16, '6', 'JUNTADA', ' JUNTADA DOCUMENTAL AO PROCESSO DE LICENÇA AMBIENTAL DE REGULARIZAÇÃO DE N° 048/2021\r\n', 0, 0, '', '', '', ''),
(345, 1, 10, '01526/2021', '2021-11-11', 'ANONIMO', '', 0, '', 16, '2', 'DENUNCIA ANONIMA', 'DENUNCIA REFERENTE  A MAUS TRATOS', 0, 0, '', '', '', ''),
(346, 1, 12, '01527/2021', '2021-11-11', 'COORDENADORIA DE CERIMONIAL', '', 0, '', 16, '2', 'CONVITE', 'CONVITE DE INAUGURAÇÃO DO CENTRO DE DIAGNOSTICOS DE CASTANHAL\r\n', 0, 0, '', '', '', ''),
(347, 1, 11, '01528/2021', '2021-11-11', 'SECRETARIA DE SUPRIMENTOS E LICITAÇÃO', '', 0, '', 16, '2', 'DESIGNAÇÃO DE FISCAIS', 'MEMORANDO DE SOLICITAÇÃO DE FISCAIS\r\n', 0, 0, '', '', '', ''),
(348, 1, 12, '01529/2021', '2021-11-11', 'MADRE MARIA VIGANOR', '', 0, '', 16, '2', 'SOLICITAÇÃO DE POLDA ', 'SOLICITAÇÃO DE PODAGEM SOBRE O OFICIO DE N:070/2021\r\n', 0, 0, '', '', '', ''),
(349, 1, 10, '01530/2021', '2021-11-11', 'SEA TELECON', '', 0, '', 16, '82', 'JUNTADA ', 'ATENDIMENTO DA NOTIFICAÇÃO DE N:0096/2021/CLA\r\n', 0, 0, '', '', '', ''),
(350, 2, 24, '01888/2019', '2019-10-31', 'POSTO ICCAR LTDA', '', 0, '(91) 3202-7038', 41, '+ DE 200', 'SOLICITAÇÃO DE  LICENÇA DE OPERAÇÃO', 'CAIXA-01/L.O-2019', 1, 6, 'ROD. CASTANHAL/CURUÇÁ', 'S/N', '', ''),
(351, 2, 24, '01258/2019', '2019-08-01', 'TIM S/A- TIM/(ESTAÇÃO RÁDIO BASE DA EMPRESA EMRATEL)', '', 0, '(11)4119-6000', 41, '187', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA 02/ L.O -2019', 1, 19, 'ROD. BR- 316', 'S/N', '', ''),
(352, 2, 24, '01259/2019', '2019-08-01', 'TIM S/A - TIM(ESTAÇÃO RÁDIO BASE DA EMPRESA GRUPO TORRESUR)', '', 0, '(91)98022-0549', 41, '183', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O ', 'CAIXA-02/ L.O- 2019', 1, 8, 'TV. FLORIANDO PEIXOTO', '2153', '', ''),
(353, 2, 24, '01264/2019', '2019-08-01', 'TIM S/A -TIM (ESTAÇÃO RÁDIO BASE DA OPERADORA OI)', '', 0, '(91)98022-0549', 41, '185', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA-02/L.O-2019', 1, 8, 'R. MAXIMINO PORPINO', '1518', '', ''),
(354, 1, 4, '00715/2021', '2021-06-14', 'ANÔNIMO', '', 0, '', 22, '2', 'ENVENENAMENTO DAS PLANTAS', 'O DENUNCIANTE INFORMA QUE O SENHOR LAILSON SANTOS JOGA VENENO (HERBICIDA ROUNBAT) NAS PLANTAS E GRAMAS DO CONDOMÍNIO NA ÁREA DE CIRCULAÇÃO DE PESSOAS E ANIMAIS DO CONDOMÍNIO, SEM AVISO PRÉVIO E SEM INFORMAÇÃO SE HÁ RESPONSÁVEL TÉCNICO', 1, 21, '', '', '', ''),
(355, 1, 4, '00447/2021', '2021-04-27', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO ATMOSFÉRICA (QUEIMADA)', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO, ESTÃO FAZENDO QUEIMADAS DIARIAMENTE OCASIONANDO TRANSTORNOS AOS MORADORES DO ENTORNO POR CONTA DA GERAÇÃO DA FUMAÇA', 1, 1, '', '', '', ''),
(356, 2, 24, '01522/2019', '2019-09-11', 'LÍDER COMÉRCIO E INDÚSTRIA LTDA(SUPERMERCADOS LIDER)/ OSCAR CORREA RODRIGUÊS', '', 0, '(91) 4008-1304', 41, '104', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA-02/ L.O -2019', 1, 8, 'AV. FLORIANO PEIXOTO', '1391', '', ''),
(357, 1, 4, '00445/2021', '2021-04-27', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO ATMOSFÉRICA ', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO ESTÁ FUNCIONANDO UMA OFICINA DE PINTURA DE CAMINHÕES, ONDE O CHEIRO DA TINTA ESTÁ CAUSANDO INCÔMODO AOS MORADORES DO ENTORNO.', 1, 34, '', '', '', ''),
(358, 1, 4, '00509/2021', '2021-05-06', 'ROGERIO LIMA DE ARAUJO', '', 0, '', 22, '2', 'POLUIÇÃO ATMOSFÉRICA', 'DENUNCIA REFERENTE A POLUIÇÃO ATMOSFÉRICA, A CASA DO LADO DIREITO DA IGREJA FAZ QUEIMADA CONSTANTEMENTE  (CASA N° 10)\r\n\r\nSOLICITANTE PEDE UMA AÇÃO DE EDUCAÇÃO AMBIENTAL NO LOCAL', 1, 42, '', '', '', ''),
(359, 1, 4, '00584/2021', '2021-05-20', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO ATMOSFÉRICA', 'DENUNCIANTE INFORMA QUE O SENHOR FRANCISCO FAZ QUEIMADA DE PRODUTOS, PLÁSTICOS, PAPELÃO E FOLHAS', 1, 34, '', '', '', ''),
(360, 2, 24, '01055/2019', '2019-07-01', 'CORECHA E CRUZ LTDA - KELLY GÁS ', '', 0, '91 98444-4214', 26, '44', 'LICENÇA DE OPERAÇÃO / CAIXA 3/2019', '', 1, 7, 'ALAMEDA HORTÊNCIA ', '33', '', ''),
(361, 1, 10, '01532/2021', '2021-11-12', 'Hotel durma bem', '', 0, '', 16, '21', 'PROTOCOLO DE CONDICIONANTE', 'PROTOCOLO DE CONDICIONANTE DA LO Nº 029/2018\r\n', 0, 0, '', '', '', ''),
(362, 2, 24, '00074/2019', '2019-01-17', 'RAIMUNDO FABIANO SILVA NEVES 78919479291', '', 0, '(91)99965-9475', 41, '36', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA 02/L.O-2019', 1, 6, 'AL. PADRE VIEIRA / QUADRA E', '02', '', ''),
(363, 2, 24, '00458/2019', '2019-03-22', 'FURGOES CASTANHAL INDUSTRIA E COMERCIO LTDA ', '', 0, '91 98290-2122', 26, '63', 'LICENÇA DE OPERAÇÃO / CAIXA 3/2019', '', 1, 16, 'AVENIDA MARECHAL DEODORO', '1100', '', ''),
(364, 1, 10, '01533/2021', '2021-11-12', 'ICONE IND.DE EMBALAGENS EIRELI', '', 0, '', 16, '7', 'JUNTADA OFICIO DE N:679/2021', 'CUMPRIMENTO DE CONDICIONANTES DA NOTIFICAÇÃO Nº 0444/2014\r\n', 0, 0, '', '', '', ''),
(365, 2, 24, '01510/2019', '2019-09-09', 'PREFEITURA MUNICIPAL DE CASTANHAL/ USINA DE ASFALTO A FRIO', '', 0, '', 41, '80', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA-02/L.O-2019', 1, 38, 'RAMAL DO PACUQUARA', 'S/N', '', ''),
(366, 2, 24, '00363/2019', '2019-03-01', 'BAR E DEPOSITO L.G ', '', 0, '91 98300-5142', 26, '55', 'LICENÇA DE OPERAÇÃO CAIXA 3/2019', '', 1, 12, 'TRAVESSA QUINTINO BOCAIUVA ', 'BOX 3', '', ''),
(367, 1, 4, '01534/2021', '2021-11-12', 'AUGUSTO CESAR SILVA DA COSTA ', '', 0, '', 16, '2', 'CAPTURA DE UM PORCO ESPINHO', 'SOLICITANTE REQUER A CAPTURA DE UM PORCO ESPINHO ', 0, 0, '', '', '', ''),
(368, 1, 4, '00473/2021', '2021-04-29', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO SONORA E ATMOSFÉRICA', 'DENUNCIA REFERENTE A POLUIÇÃO SONORA (RUÍDOS) E ATMOSFÉRICA (EMISSÃO DE FUMAÇA), PROVOCADO POR UMA FABRICA DE PANELAS QUE ENCONTRA-SE NOS FUNDOS DA CASA INFORMADA NO ENDEREÇO ACIMA. ', 1, 21, '', '', '', ''),
(369, 2, 24, '00741/2019', '2019-05-13', 'JUVENAL COSTA RIBEIRO/MERCADINHO JUVENAL', '', 0, '(91) 98832-7393', 41, '19', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO-L.O', 'CAIXA -02/L.O-2019', 1, 14, 'R. X/CONJUNTO FONTE BOA', '19', '', ''),
(370, 1, 4, '00487/2021', '2021-05-04', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO ATMOSFÉRICA', 'DENUNCIA REFERENTE A POLUIÇÃO ATMOSFÉRICA, PROVENIENTE DE QUEIMADA, POSSIVELMENTE DE FORNO.', 1, 34, '', '', '', ''),
(371, 2, 24, '00907/2015', '2015-08-25', 'CERÂMICA TROPICAL ', '', 0, '91 98271-0011', 26, '202', 'LICENÇA DE OPERAÇÃO CAIXA 3/2015', '', 1, 19, 'AVENIDA PRESIDENTE GETULIO VARGAS BR 316', '', '', ''),
(372, 1, 4, '00458/2021', '2021-04-20', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO ATMOSFÉRICA E POLUIÇÃO SONORA', 'DENUNCIA CONTRA SERRARIA E SERRALHERIA, SEM HORÁRIO DE FUNCIONAMENTO DEFINIDO', 1, 19, '', '', '', ''),
(373, 2, 24, '00858/2017', '2017-08-01', 'CERÂMICA TROPICAL ', '', 371, '', 26, '316', 'LICENÇA DE OPERAÇÃO CAIXA 3/2019', '', 1, 19, '', '', '', ''),
(374, 2, 24, '00109/2019', '2019-01-24', 'CERÂMICA TROPICAL ', '', 371, '', 26, '69', 'RENOVAÇÃO DE OPERAÇÃO CAIXA 3/2015 ', '', 0, 0, '', '', '', ''),
(375, 1, 4, '00384/2021', '2021-04-12', 'ANÔNIMO', '', 0, '', 22, '2', 'POLUIÇÃO CAUSADA POR FÁBRICA DE PANELA DE ALUMÍNIO', 'SR. ROBSON QUEIMA ALUMÍNIO DIARIAMENTE, CAUSANDO POLUIÇÃO E PREJUDICANDO A SAÚDE DOS MORADORES VIZINHOS', 1, 24, '', '', '', ''),
(376, 2, 24, '00175/2019', '2019-02-04', 'MATEUS SUPERMERCADO ', '', 0, '91 98226-5753', 26, '188', 'LICENÇA DE OPERAÇÃO CAIXA 3/2019 ', '', 1, 21, 'AVENIDA FRANCISCO MARTINS BARATA ', '722', '', ''),
(377, 2, 24, '00175/2019', '2019-02-04', 'MATEUS SUPERMERCADO ', '', 376, '', 26, '297', 'LICENÇA DE OPERAÇÃO CAIXA 3/2019', '', 0, 0, '', '', '', ''),
(378, 1, 4, '00335/2021', '2021-03-29', 'ANÔNIMO', '', 0, '', 22, '3', 'TERRENO BALDIO', 'DENUNCIANTE PEDE VISTORIA EM TERRENO BALDIO QUE TEM PRESENÇA DE COBRAS, RATO, BARATAS  E OUTROS. ALÉM DISSO TEM SERVIDO PARA USUÁRIO DE DROGAS À NOITE, PREOCUPANDO OS COMERCIANTES E MORADORES DO LOCAL. A POPULAÇÃO TEM JOGADO LIXO DOMÉSTICO', 1, 6, '', '', '', ''),
(379, 1, 4, '00266/2021', '2021-03-11', 'ANÔNIMO', '', 0, '', 22, '3', 'DESCARTE DE RESÍDUOS IRREGULAR', 'TERRENO ABANDONADO, SEM LIMPEZA, SERVINDO PARA DESCARTE DE RESÍDUOS, ALÉM DE SERVIR DE ESCONDERIJO MELIANTES', 1, 21, '', '', '', ''),
(380, 1, 4, '00117/2021', '2021-02-09', 'ANÔNIMO', '', 0, '', 22, '4', 'CRIME AMBIENTAL, DESMATAMENTO COM USO DE MOTOSERRA', 'DESMATAMENTO EM PROPRIEDADE FEITA COM USO DE MOTOSERRA, RETIRADA DE MADEIRA PARA VENDA\r\n\r\nFOTOS E BOLETIM DE OCORRÊNCIA POLICIAL EM ANEXO', 1, 38, '', '', '', ''),
(382, 1, 4, '00547/2021', '2021-05-12', 'RAIMUNDO DE LIMA BAIA', '', 0, '', 22, '2', 'CORTE DE MADEIRA PARA FABRICAÇÃO DE CARVÃO', 'SEGUNDO O DENUNCIANTE, O ENDEREÇO INFORMADO NÃO POSSUI NUMERAÇÃO DA CASA, O MESMO INFORMOU QUE O REFERIDO LOCAL ENCONTRA-SE AO FINAL DO RAMAL DO CUPIÚBA, APÓS FAZENDA (SEM IDENTIFICAÇÃO DE NOME) E APÓS LINHÃO RECEM CONSTRUÍDO DA EQUATORIAL, AO LADO DIREITO.\r\n\r\nOBS: O MESMO INFORMOU QUE PODERÁ SER PROCURADO PARA A FACILITAÇÃO DO ACESSO AO LOCAL DA DENUNCIA.', 1, 38, '', '', '', ''),
(383, 2, 24, '01020/2019', '2019-06-27', 'SOM DIAGNOSTICOS LTDA ', '', 0, '91 99942-6744', 26, '201', 'LICENÇA DE OPERAÇÃO CAIXA 3/2019', '', 1, 8, 'AVENIDA PRESIDENTE GETULIO VARGAS ', '2990', '', ''),
(384, 2, 24, '00769/2019', '2019-05-17', 'ROMERO LIMA BABBONI ', '', 0, '91 98864-0926', 26, '47', 'LICENÇA DE OPERAÇÃO CAIXA 3/2019', '', 1, 31, 'AVENIDA BARÃO DO RIO BRANCO ', '', '', ''),
(385, 2, 24, '01802/2019', '2019-10-17', 'C.M.C REIS SILVA EIRELI/ VOVÓ ALIMENTOS', '', 0, '91 98299-3777', 26, '36', 'LICENÇA DE OPERAÇÃO CAIXA 3/20109', '', 1, 12, 'RUA BENJAMINCONSTANT ', '1505', '', ''),
(386, 2, 24, '02112/2019', '2019-12-04', 'PSS GOMES FABRICAÇÃO DE POLPAS DE FRUTAS ', '', 0, '91 98715-4156', 26, '45', 'LICENÇA DE OPERAÇÃO CAIXA 3/2019', '', 1, 1, 'ALAMEDA FRANCISCO SALES AMARAL ', '45', '', ''),
(387, 1, 4, '00790/2021', '2021-06-29', 'ANÔNIMO', '', 0, '', 22, '2', 'SUPRESSÃO DE VEGETAÇÃO', 'SUPRESSÃO DE 01 (UM) INDIVÍDUO ARBOREO (MANGUEIRA) SEM PRÉVIA AUTORIZAÇÃO DO ÓRGÃO COMPETENTE', 1, 23, '', '', '', ''),
(388, 2, 24, '00986/2019', '2019-06-21', 'HOSPITAL FRANISCO MAGALHÃES LTDA -ME ', '', 0, '91 98444-4214', 26, '127', 'LICENÇA DE OPERAÇÃO CAIXA 3/2019', '', 1, 8, 'AVENIDA QUINTINO BOCAIÚVA ', '127', '', ''),
(389, 1, 4, '00325/2021', '2021-03-26', 'ANÔNIMO', '', 0, '', 22, '3', 'DESMATAMENTO', 'INVASÃO EM PROPRIEDADE PRIVADA, DESMATAMENTO COM USO DE MOTOSSERRA, FABRICAÇÃO DE CARVÃO\r\n\r\nFOI REALIZADO OBOLETIM DE OCORRÊNCIA POLICIAL', 1, 38, '', '', '', ''),
(390, 1, 4, '00516/2021', '2021-05-07', 'MANOEL RONALDO GOMES RODRIGUES', '', 0, '', 22, '6', 'DESMATAMENTO E QUEIMADA IRREGULAR', 'O DENUNCIANTE, PROPRIETÁRIO DO TERRENO INFORMADO, O SR CONHECIDO COMO VALDO, INVADIU A PROPRIEDADE, RETIROU AS ÁRVORES PRÓXIMAS AO CORPO HÍDRICO DO LOCAL, ALÉM DE PROVOCAR QUEIMADAS NO MESMO LOCAL.', 1, 38, '', '', '', ''),
(391, 2, 24, '01758/2019', '2019-10-11', 'L.B. FERNANDES COMÉRCIO DE ALIMENTOS ', '', 0, '91 98816-9090', 26, '95', 'LICENÇA DE OPERAÇÃO CAIXA 3/2019', '', 1, 12, 'RUA TIRADENTES ', '3371', '', ''),
(392, 2, 24, '00621/2019', '2019-04-22', 'J.R. PASSOS CAMPOS ', '', 0, '91 988087069', 26, '35', 'LICENÇA DE OPERAÇÃO CAIXA 4/2019', '', 1, 34, 'JOÃO COELHO DA MOTA ', '685', '', ''),
(393, 2, 24, '01759/2019', '2019-10-11', 'T.R CHAGAS COMÉRCIO ', '', 0, '91 98816-9090', 26, '96', 'LICENÇA DE OPERAÇÃO CAIXA 5 ', '', 1, 12, 'RUA KAZUMA OYAMA ', '', '', ''),
(394, 1, 4, '00511/2021', '2021-05-06', 'Anônimo', '', 0, '', 22, '8', 'POLUIÇÃO ATMOSFÉRICA', 'DENUNCIA REFERENTE A UM TERRENO QUE OS MORADORES NÃO MANTÉM O MESMO NAS CONDIÇÕES MÍNIMAS DE LIMPEZA, GERANDO EM ÉPOCAS DE INVERNO FOCOS DE MOSQUITOS DA DENGUE E DEMAIS.', 1, 8, '', '', '', ''),
(395, 2, 24, '00802/2019', '2019-05-21', 'SILVA E CLAUDIA COMERCIO DE MATERIAIS DE CONSTRUÇÃO LTDA ', '', 0, '91 98290-2122', 26, '120', 'LICENÇA DE OPERAÇÃO CAIXA 5/2019', '', 1, 35, 'AVENIDA RAIMUNDO PADUA DA COSTA ', '100', '', ''),
(396, 2, 24, '01769/2019', '2019-10-14', 'ALVARO REMIGIO DE ARAUJO FILHO ', '', 0, '91 98158-7847', 26, '72', 'LICENÇA DE OPERAÇÃO CAIXA 5/2019', '', 0, 0, '', '', '', ''),
(397, 2, 24, '00222/2019', '2019-02-11', 'SENDAS DISTRIBUIDORA S/A', '', 0, '91 98144-1313', 26, '192', 'LICENÇA DE OPERAÇÃO CAIXA 5/2019', '', 0, 0, '', '', '', ''),
(398, 2, 24, '00222/2019', '2019-02-11', 'SENDAS DISTRIBUIDORA S/A', '', 397, '', 26, '390', 'LICENÇA DE OPERAÇÃO CAIXA 5/2019', '', 1, 19, 'AVENIDA GETULIO VARGAS ', '', '', ''),
(399, 2, 24, '00222/2019', '2019-02-11', 'SENDAS DISTRIBUIDORA S/A', '', 397, '', 26, '454', 'LICENÇA DE OPERAÇÃO CAIXA 5/2019', '', 1, 19, 'AVENIDA GETULIO VARGAS ', '', '', ''),
(400, 1, 12, '01535/2021', '2021-11-12', 'GABINETE DO VEREADO ELIZEU FRANCO', '', 0, '', 16, '2', 'SOLICITAR LIXEIRA SELETIVA', 'OFICIO DE N:033/2021-GBV', 0, 0, '', '', '', ''),
(401, 1, 10, '01536/2021', '2021-11-12', 'AUTO POSTO ATLANTICO', '', 0, '', 16, '3', 'JUNTADA', 'PUBLICAÇÃO NO JORNAL AMAZONIA', 0, 0, '', '', '', ''),
(402, 1, 12, '01537/2021', '2021-11-12', 'SECRETARIA DE AGRICULTURA', '', 0, '', 16, '2', 'TERMO DE CEDENCIA ', 'TERMO DE CEDÊNCIA', 0, 0, '', '', '', ''),
(403, 2, 24, '02019/2019', '2019-11-21', 'REGIONALIND. DE ALIMEN TOS PARA ANIMAIS EIRELI', '', 0, '91 98867-7677', 26, '68', 'LICENÇA DE OPERAÇÃO CAIXA 6/2019', '', 1, 38, 'RODOVIA PA 140', 'KM 08', '', ''),
(404, 2, 24, '01390/2019', '2019-08-21', 'ALUPRATA LAMINAÇÃO DE ALUMINIOL EIRELI', '', 0, '91 3721-4702', 26, '53', 'LICENÇA DE OPERAÇÃO CAIXA 6/2019', '', 1, 11, 'AVENIDA GETULIO VARGAS ', '9848 B', '', ''),
(405, 2, 24, '00070/2019', '2019-10-17', 'GINASIO POLIESPORTIVO LOYOLA PASSARINHO', '', 0, '91 98836-7792', 26, '65', 'LICENÇA DE OPERAÇÃO CAIXA 6/2019', '', 1, 12, 'RUA EXPEDITO PONTES DE ARAÚJO', '', '', ''),
(406, 2, 24, '01175/2019', '2019-07-18', 'MONTE VERDE AGROMIX COMERCIO DE PRODUTOS AGRICOLAS LTDA ', '', 0, '91 98073-0802', 26, '116', 'LICENÇA DE OPERAÇÃOL CAIXA 6/2019', '', 1, 8, 'AVENIDA PRESIDENTE GETULIO VARGAS ', '2660', '', ''),
(407, 2, 24, '01477/2019', '2019-09-08', 'M.N.DE OLIVEIRA MAIRA -ME ', '', 0, '91 98290-2122', 26, '129', 'LICENÇA DE OPERAÇÃO CAIXA 6/2019', '', 1, 25, 'AVENIDA MAXIMINO PORPINO DA SILVA ', '729', '', ''),
(408, 2, 24, '00554/2016', '2016-07-14', 'M.N.DE OLIVEIRA MEIRA - ME ', '', 0, '91 98290-2122', 26, '36', 'RENOVAÇÃO DE LICENÇA DE OPERAÇÃO CAIXA 6', '', 1, 25, 'AVENIDA MAXIMINO PORPINO DA SILVA ', '729', '', ''),
(409, 2, 24, '00321/2014', '2014-06-18', 'M.N.DE OLIVEIRA MAIRA -ME ', '', 407, '', 26, '44', 'LICENÇA DE OPERAÇÃO CAIXA6/2014', '', 0, 0, '', '', '', ''),
(410, 1, 4, '01139/2021', '2021-08-31', 'CPRN/ ED. AMBIENTAL SEMMA', '', 0, '', 22, '5', 'DESCARTE INCORRETO DE RESÍDUOS SÓLIDOS', 'A CÂMARA MUNICIPAL DE CASTANHAL DESCARTA SEUS RESÍDUOS EM SACOS PLÁSTICOS PRETO NA SAÍDA DO ESTACIONAMENTO E NÃO POSSUEM LIXEIRA ADEQUADA PARA ADICIONAMENTO DOS SACOS ATÉ QUE SEJA EFETUADA A COLETA, OCASIONANDO COM QUE OUTROS REALIZEM O DESPEJO DE SEUS RESÍDUOS SOBRE O MESMO INFRINGINDO A LEI 12305/2010', 1, 21, '', '', '', ''),
(411, 1, 4, '00888/2021', '2021-07-12', 'Anônimo', '', 0, '', 22, '2', 'POLUIÇÃO ATMOSFÉRICA, AVERIGUAÇÃO DE LICENCIAMENTO AMBIENTAL', 'O DENUNCIANTE INFORMA QUE O DENUNCIADO SR. JOÃO ESTA FAZENDO O PREPARO DE CARNE NO QUINTAL PARA COMERCIALIZAR, ESTA PROVOCANDO FORTE ODOR.', 1, 23, '', '', '', ''),
(412, 1, 10, '01538/2021', '2021-11-16', 'AUTO POSTO BARÃO COMÉRCIO DE DERIVADOS DE PETRÓLEO LTDA.', '', 0, '', 16, '09', 'RESPOSTA À NOTIFICAÇÃO 00120/2021/CLA', 'APRESENTAR AS CONDICIONANTES DA REFERIDA NOTIFICAÇÃO.', 0, 0, '', '', '', ''),
(413, 1, 4, '00862/2021', '2021-07-09', 'Anônimo', '', 0, '', 22, '2', 'DESCARTE IRREGULAR DE RESÍDUOS SÓLIDOS', 'O DENUNCIANTE SOLICITA AVERIGUAÇÃO, SE O DESCARTE IRREGULAR QUE ESTÁ OCORRENDO NO REFERIDO TERRENO MENCIONADO (PARTICULAR), ESTÁ OCORRENDO POR PARTE DA PREFEITURA DE CASTANHAL, OU AINDA, OUTRA EMPRESA, ONDE SE CONFIRMADO, SE AS MESMAS POSSUEM LICENÇA E/OU AUTORIZAÇÕES, PARA REALIZAR ESTE TIPO DE PROCEDIMENTO NO LOCAL.', 1, 17, '', '', '', ''),
(414, 1, 10, '01539/2021', '2021-11-16', 'SBA TORRES BRASIL LTDA.', '', 0, '', 16, '04', 'JUNTADA DOCUMENTAL À PROCESSO DE LA', 'JUNTADA DE LICENÇA SANITÁRIA AO PROCESSO DE Nº 047/2021', 0, 0, '', '', '', ''),
(415, 1, 4, '00643/2021', '2021-05-26', 'BENEDITO RUY ASSUNÇÃO DA COSTA', '', 0, '', 22, '2', 'EXTRAÇÃO DE AREIA', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO ACIMA, O DENUNCIANTE ESTÁ RETIRANDO AREIA DO LOCAL, PROVOCANDO EROSÃO PARA O INTERIOR DO TERRENO DO MESMO.', 1, 38, '', '', '', ''),
(416, 1, 4, '00717/2021', '2021-06-14', 'Anônimo', '', 0, '', 22, '2', 'EXTRAÇÃO DE AREIA IRREGULAR', 'O DENUNCIANTE INFORMA QUE AS PESSOAS (DONA FÁTIMA E CARLOS CANCELA) ESTÃO TIRANDO DE FORMA IRREGULAR ARENOSO. ARGILA E PEDRAS DO RAMAL DO CIPÓ.', 1, 38, '', '', '', ''),
(417, 1, 4, '00273/2021', '2021-03-13', 'OLINDINA DA SILVA E SILVA', '', 0, '', 22, '3', 'FORNO PARA FABRICAÇÃO DE CARVÃO SEM LICENÇA', 'SEGUNDO O DENUNCIANTE, DENUNCIADO CONSTRUIU FORNO PARA FABRICAÇÃO DE CARVÃO SEM A LICENÇA;', 1, 38, '', '', '', ''),
(418, 1, 10, '01540/2021', '2021-11-16', 'SBA TORRES BRASIL LTDA.', '', 0, '', 16, '04', 'JUNTADA DOCUMENTAL À PROCESSO DE LA', 'JUNTADA DE LICENÇA SANITÁRIA AO PROCESSO Nº 046/2021.', 0, 0, '', '', '', ''),
(419, 1, 4, '01569/2020', '2020-12-04', 'Anônimo', '', 0, '', 22, '2', 'RETIRADA DE AREIA, PIÇARRA, ARGILA E PEDRA', 'SEGUNDO O DENUNCIANTE, O SR CONHECIDO COMO WILLIAN (DONO DO MAQUINÁRIO) ESTÁ REALIZANDO A RETIRADA DE MATERIAL ARENOSO NO TERRENO DO INCRA.', 1, 38, '', '', '', ''),
(420, 1, 4, '01509/2020', '2020-11-23', 'Anônimo', '', 0, '', 22, '2', 'FALTA DE DOCUMENTAÇÃO E INSTALAÇÕES INADEQUADAS DO EMPREENDIMENTO', 'FALTA DE DOCUMENTAÇÃO E INSTALAÇÕES INADEQUADAS DO EMPREENDIMENTO', 1, 12, '', '', '', ''),
(421, 1, 10, '01541/2021', '2021-11-16', 'SBA TORRES BRASIL LTDA.', '', 0, '', 16, '04', 'JUNTADA DOCUMENTAL À PROCESSO DE LA.', 'JUNTADA DE LICENÇA SANITÁRIA AO PROCESSO DE N° 048/2021.', 0, 0, '', '', '', ''),
(422, 1, 4, '00840/2020', '2020-08-03', 'Anônimo', '', 0, '', 22, '2', 'AUSÊNCIA DE LICENÇA AMBIENTAL', 'AUSÊNCIA DE LICENÇA AMBIENTAL', 1, 1, '', '', '', ''),
(423, 1, 12, '01542/2021', '2021-11-16', 'MINISTÉRIO PÚBLICO DO ESTADO DO PARÁ.', '', 0, '', 16, '02', 'PROCEDIMENTO ADMINISTRATIVO PARA ACOMPANHAMENTO DE TAC.', 'REITERAÇÃO AOS TERMOS DOS OFÍCIOS DE Nº 0080/2021 - MP/6ª PJ de 20/05/2021 e Nº 0278/2021 - MP/ 6ª PJ de 20/08/2021.', 0, 0, '', '', '', ''),
(424, 1, 12, '01543/2021', '2021-11-16', 'MINISTÉRIO PÚBLICO DO ESTADO DO PARÁ.', '', 0, '', 16, '05', 'NOTÍCIA DE FATO Nº 005224 - 040/2021. \r\n', 'SOLICITAR VISTORIA NA EMPRESA MACUXI FRUITS COM. POLPAS IMPORTAÇÃO E EXPORTAÇÃO. \r\nDENÚNCIA DE POSSÍVEL CRIME AMBIENTAL.', 0, 0, '', '', '', ''),
(425, 2, 19, '00270/2021', '2021-11-16', 'ANTÔNIA JAQUELINE AUGUSTO FARIAS', '', 0, '(91)98358-2574', 16, '09', 'SUPRESSÃO VEGETAL - ASV', 'PEDIDO DE SUPRESSÃO DE UMA PALMEIRA AZUL.', 0, 0, '', '', '', ''),
(426, 1, 4, '00931/2021', '2021-07-26', 'SORAYA PORTO', '', 0, '', 22, '5', 'VERIFICAÇÃO DE LICENÇA AMBIENTAL E POLUIÇÃO ATMOSFÉRICA', 'A DENUNCIANTE ESTA SOLICITANDO A AVERIGUAÇÃO DE LICENÇA AMBIENTAL DO ESTABELECIMENTO CASA DO CONSTRUTOR, POIS A AREIA QUE FICA EXPOSTA DE FORMA INCORRETA ESTA ADENTRANDO SUA RESIDENCIA QUE FICA AO LADO ', 1, 36, '', '', '', ''),
(427, 2, 24, '00271/2021', '2021-11-16', 'NORTE BRASIL M. ÁGUAS LTDA.', '', 0, '(91)99104-9184', 16, '41', 'LICENÇA DE OPERAÇÃO - LO', 'REQUERIMENTO DE LO PARA A ATIVIDADE DE FABRICAÇÃO DE BEBIDAS NÃO ALCOÓLICAS.', 0, 0, '', '', '', ''),
(428, 2, 29, '00272/2021', '2021-11-16', 'SEMUTRAN', '', 0, '', 16, '02', 'DOAÇÃO DE MADEIRA', 'SOLICITAÇÃO DE MADEIRA DO OFÍCIO Nº 0899/2021 - SEMUTRAN\r\n', 0, 0, '', '', '', '');
INSERT INTO `protocolo` (`id`, `tipo_id`, `objetivo_id`, `numero_protocolo`, `data`, `interessado`, `cpf_cpnj`, `processo`, `contato`, `protocolista_id`, `numero_folhas`, `assunto`, `descricao`, `cidade`, `bairro`, `endereco`, `numero`, `latitude`, `longitude`) VALUES
(429, 1, 4, '01061/2021', '2021-08-20', 'Anônimo', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'O DENUNCIANTE INFORMA QUE A METALURGIA ESTA FAZENDO MUITO BARULHO FORA DE HORÁRIO, O CHEIRO DE TINTA ESTA, MUITO FORTE , PREJUDICANDO OS VIZINHOS', 1, 5, '', '', '', ''),
(430, 2, 24, '00273/2021', '2021-11-16', 'CONDOMÍNIO CAMPO BELO', '', 0, '(91)98429 - 1526', 16, '37', 'LICENÇA DE OPERAÇÃO - LO', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO À ATIVIDADE DE CONDOMÍNIO HORIZONTAL, SEM FRACIONAMENTO.', 0, 0, '', '', '', ''),
(431, 1, 4, '00595/2021', '2021-05-21', 'PEDRO MONTEIRO', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'VENHO APRESENTAR DENÚNCIA DE POLUIÇÃO SONORA QUE OCORRE NESTE MOMENTO EM FRENTE AO COLÉGIO LEITE VESTIBULARES.', 1, 8, '', '', '', ''),
(432, 1, 4, '01220/2021', '2021-09-14', 'Anônimo', '', 0, '', 22, '2', 'DESPEJO IRREGULAR DE RESÍDUOS E POLUIÇÃO', 'DENUNCIANTE INFORMA QUE A FABRICA DE RAÇÃO ESTA PROVOCANDO FORTE ODOR E O FUNCIONAMENTO DA FABRICA VAI ATÉ HORÁRIOS INAPROPRIADOS E A FABRICA ESTAVA FAZENDO DESPEJO DOS RESÍDUOS NA RUA', 1, 0, '', '', '', ''),
(433, 1, 4, '00849/2021', '2021-07-07', 'ALEXANDRO XAVIER NUNES', '', 0, '', 22, '4', 'DESCARTE DE RESÍDUOS SÓLIDOS', 'O DENUNCIANTE SR ALEXANDRE INFORMA QUE O DENUNCIADO (MILTON) ESTA JOGANDO RESÍDUOS NO TERRENO AO LADO DA SUA RESIDENCIA, SENDO QUE O ACUSADO JÁ HAVIA FEITO UM ACORDO COM O DENUNCIANTE NO MINISTÉRIO PÚBLICO DE NÃO DESCARTAR MAS RESÍDUOS NO LOCAL', 1, 6, '', '', '', ''),
(434, 1, 4, '01187/2021', '2021-09-08', 'Anônimo', '', 0, '', 22, '2', 'POLUIÇÃO AMBIENTAL', 'DESPEJO DE EFLUENTES NO RIO APEÚ', 1, 1, '', '', '', ''),
(435, 1, 4, '00337/2021', '2021-03-29', 'Anônimo', '', 0, '', 22, '2', 'EXTRAÇÃO DE MATERIAL (BARRO)', 'EXTRAÇÃO DE MATERIAL (BARRO). PROX. AO IGARAPÉ', 1, 38, '', '', '', ''),
(436, 1, 4, '00907/2021', '2021-07-19', 'Anônimo', '', 0, '', 22, '2', 'DESMATAMENTO', 'SEGUNDO O DENUNCIANTE INFORMA QUE UM GRUPO DE PESSOAS ESTÃO DESMATANDO E FAZENDO QUEIMADA', 1, 38, '', '', '', ''),
(437, 1, 4, '01025/2021', '2021-08-12', 'Anônimo', '', 0, '', 22, '2', 'DESMATAMENTO E POLUIÇÃO', 'O DENUNCIANTE INFORMA QUE O DONO DA FAZENDA ESTA DESMATANDO ', 1, 38, '', '', '', ''),
(438, 1, 4, '00851/2021', '2021-07-08', 'Anônimo', '', 0, '', 22, '2', 'POLUÇÃO ATMOSFÉRICA', 'O DENUNCIANTE INFORMA QUE A VIZINHA DELA FAZ QUEIMADA DE FOLHAS NO TERRENO DELA, PREJUDICANDO A DENUNCIANTE POIS A FUMAÇA  ENTRA NA SUA RESIDÊNCIA', 1, 12, '', '', '', ''),
(439, 1, 10, '01544/2021', '2021-11-16', 'VIA MARCONI VEÍCULOS LTDA.', '', 0, '3311 - 5544', 16, '117', 'JUNTADA DE DOCUMENTOS.', 'RESPOSTA AO TERMO DE NOTIFICAÇÃO Nº 0101/2021/CLA.', 0, 0, '', '', '', ''),
(440, 1, 4, '01545/2021', '2021-11-16', 'DENÚNCIA ANÔNIMA', '', 0, '', 16, '007', 'DENÚNCIA ANÔNIMA DE POLUIÇÃO SONORA', 'POLUIÇÃO SONORA CAUSADA POR ACADEMIA, QUE FICA EM UMA RESIDÊNCIA.', 0, 0, '', '', '', ''),
(441, 1, 18, '01546/2021', '2021-11-16', 'ANA LÚCIA SILVA MARQUES', '', 0, '(91)98826-4361', 16, '004', 'SOLICITAÇÃO DE PODA DE ÁRVORE.', 'SOLICITAÇÃO DE PODA DE ÁRVORE, POIS A MESMA ESTÁ INTERFERINDO NA FIAÇÃO ELÉTRICA, HAVENDO ATÉ CURTO CIRCÚITO NO LOCAL.', 0, 0, '', '', '', ''),
(442, 1, 12, '01547/2021', '2021-11-16', 'COORDENADOR DO PROJETO APERANGA - BENEDITO SANTIAGO', '', 0, '', 16, '002', 'SOLICITAÇÃO DE VISITA TÉCNICA', 'SOLICITAÇÃO DE VISITA TÉCNICA TÉCNICA A ÁREA DAS CASTANHEIRAS.', 0, 0, '', '', '', ''),
(443, 2, 19, '00274/2021', '2021-11-16', 'JOSÉ ALVES FEITOSA O. JÚNIOR', '', 0, '(91)98535 - 8816', 16, '009', 'AUTORIZAÇÃO DE SUPRESSÃO E PODA.', 'CASA INABITADA. ', 0, 0, '', '', '', ''),
(444, 1, 4, '01548/2021', '2021-11-16', 'ANONIMO', '', 0, '', 16, '4', 'DENUNCIA DE MAUS TRATOS ', 'DENUNCIA FEITA VIA EMAIL ,ONDE TEM UM VIDEO ANEXO ENCAMINHADO A COFISC', 0, 0, '', '', '', ''),
(445, 1, 10, '01549/2021', '2021-11-16', 'AMERICA TOWER', '', 0, '', 16, '8', 'RESPOSTA DE NOTIFICAÇÃO 089/2021 E 090/2021', 'JUNTADA DE DOCUMENTAÇÃO ', 0, 0, '', '', '', ''),
(446, 1, 4, '00846/2021', '2021-07-07', 'LUCAS NASCIMENTO SILVA', '', 0, '', 22, '2', 'POLUIÇÃO ATMOSFÉRICA', 'O SENHOR LUCAS INFORMA QUE O DENUNCIADO (WELITON) FAZ ARMAZENAMENTO DE ADUBO (SANGUE DE BOI) NA SUA LOCALIDADE, ONDE VEM PREJUDICANDO A POPULAÇÃO COM O FORTE ODOR', 1, 38, '', '', '', ''),
(447, 1, 4, '00873/2021', '2021-07-12', 'MARIA DE LOURDES', '', 0, '', 22, '4', 'SUPRESSÃO VEGETAL', 'A DENUNCIANTE INFORMA QUE OS MORADORES DO LOTE 23 QUADRA 32 DO LOTEAMENTO SALES JARDINS DERRUBARAM DUAS ÁRVORES E ESTÃO DESCOBRINDO TODO PISO DO TERRENO DA ÁREA DE PRESERVAÇÃO AMBIENTAL QUE FICA A MARGEM DO IGARAPÉ E QUE CAUSARÁ ASSOREAMENTO DO MESMO.', 1, 36, '', '', '', ''),
(448, 1, 4, '01363/2021', '2021-10-07', 'Anônimo', '', 0, '', 22, '2', 'DERRUBADA IRREGULAR DE MATA VIRGEM', 'O DENUNCIANTE INFORMA QUE OS DONOS DO SÍTIO, ESTÃO FAZENDO DERRUBADA E QUEIMADA IRREGULAR DA MATA VIRGEM DO LOCAL', 1, 38, '', '', '', ''),
(449, 1, 10, '01550/2021', '2021-11-17', 'CABOCLO REPRESENTAÇÃOES IMPORTAÇÃO, EXPORTAÇÃO E AGROPECUÁRIA LTDA.', '', 0, '(91)3259-5177', 16, '52', 'JUNTADA DE DOCUMENTO - LAR', 'ALTERAÇÃO NO REQUERIMENTO PADRÃO REFERENTE A RENOVAÇÃO DE LAR.', 0, 0, '', '', '', ''),
(450, 2, 21, '00275/2021', '2021-11-17', 'FAZENDA XINGU II', '', 0, '(91)3259-5177', 16, '60', 'LICENÇA AMBIENTAL RURAL - LAR', 'LAR - PARA ATIVIDADE DE PECUÁRIA DE CRIAÇÃO DE BOVINOS.', 0, 0, '', '', '', ''),
(451, 2, 29, '00278/2021', '2021-11-17', 'UNIVERSIDADE FEDERAL', '', 0, '', 16, '4', 'solicitação de madeira', 'doação de madeira apreendida pela semma ', 0, 0, '', '', '', ''),
(452, 1, 10, '01551/2021', '2021-11-17', 'FAZENDA CASTANHA', '', 0, '', 16, '04', 'JUNTADA DE DOCUMENTO', 'JUNTADA DE DOCUMENTO AO PROCESSO DE LICENCIAMENTO AMBIENTAL DA FAZENDA CASTANHA.', 0, 0, '', '', '', ''),
(453, 1, 12, '01552/2021', '2021-11-17', 'SEMAD', '', 0, '', 16, '02', 'ENCAMINHAMENTO DE SERVIDOR.', 'ENCAMINHAMENTO DE SERVIDOR BRAÇAL PARA A SEMMA. OFÍCIO Nº 0438/2021-SEMAD', 0, 0, '', '', '', ''),
(454, 1, 12, '01553/2021', '2021-11-17', 'MINISTÉRIO PÚBLICO DO ESTADO DO PARÁ.', '', 0, '', 16, '03', 'SOLICITAÇÃO DE INFORMAÇÕES - OFÍCIO Nº 0395/2021-MP/6ªPJ CÍVEL', 'SOLICITAÇÃO NO PRAZO DE 72H, DO Nº ATUALIZADO DA CONTA DO FUNDO MUNICIPAL DE MEIO AMBIENTE.', 0, 0, '', '', '', ''),
(455, 2, 24, '00276/2021', '2021-11-17', 'LIFE LOCAÇÃO E CONSTRUÇÃO CIVIL EIRELI', '', 0, '(91)98816-7010', 16, '58', 'LICENÇA DE OPERAÇÃO - LO', 'LICENCIAMENTO DE CONSTRUÇÃO DE HABITAÇÕES URBANAS.', 0, 0, '', '', '', ''),
(456, 2, 24, '00277/2021', '2021-11-17', 'IMPÉRIO PAVIMENTAÇÃO E LOCAÇÃO EIRELI', '', 0, '(91)99963-2290', 16, '059', 'LICENÇA DE OPERAÇÃO - LO', 'CONSTRUÇÃO DE HABITAÇÕES URBANAS E LOCAÇÃO DE MÁQUINAS, EQUIPAMENTOS E VEÍCULOS SEM CONDUTOR.', 0, 0, '', '', '', ''),
(457, 1, 12, '01554/2021', '2021-11-17', 'MINISTÉRIO PÚBLICO DO ESTADO DO PARÁ.', '', 0, '', 16, '003', 'OFÍCIO Nº 0395/2021 - MP/6ª PJ CÍVEL\r\n', 'OFÍCIO DO MINISTÉRIO PÚBLICO DE  Nº 0395/2021 - MP/6ª PJ CÍVEL\r\n', 0, 0, '', '', '', ''),
(458, 1, 10, '01555/2021', '2021-11-17', 'AUTO POSTO BARÃO COMÉRCIO DE DERIVADOS DE PETRÓLEO LTDA.', '', 0, '', 16, '006', 'JUNTADA DE DOCUMENTOS PARA CUMPRIMENTO DE CONDICIONANTES', 'CUMPRIMENTO DE CONDICIONANTES DA L.I. Nº 0002/2021', 0, 0, '', '', '', ''),
(459, 1, 10, '01556/2021', '2021-11-17', 'AUTO POSTO BARÃO COMÉRCIO DE DERIVADOS DE PETRÓLEO LTDA.', '', 0, '', 16, '017', 'JUNTADA DE DOCUMENTOS EM RESPOSTA A NOTIFICAÇÃO Nº 0092/2021', 'RESPOSTA A NOTIFICAÇÃO DO PROCESSO Nº 00213/2021/PROC', 0, 0, '', '', '', ''),
(460, 1, 10, '01557/2021', '2021-11-17', 'AMAZON POLPAS IND. E CM. DE POLPAS DA AMAZÔNIA LTDA.', '', 0, '', 16, '003', 'SOLICITAÇÃO DE PRORROGAÇÃO DE PRAZO PARA ATENDIMENTO DE CONDICIONANTE.', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE Nº 01801/2018.', 0, 0, '', '', '', ''),
(461, 1, 12, '01558/2021', '2021-11-18', 'FAZENDA SÃO JOSÉ I - ANTÔNIO EUSTÁQUIO DE OLIVEIRA', '', 0, '', 16, '002', 'SOLICITAÇÃO DE ANDAMENTO DE PROCESSO', 'SOLICITAÇÃO DE ANDAMENTO DE PROCESSO DE LICENÇA DE ATIVIDADE RURAL - LAR Nº 00058/2020.', 0, 0, '', '', '', ''),
(462, 2, 22, '00279/2021', '2021-11-18', 'PREFEITURA MUNICIPAL DE CASTANHAL - SEPLAGE', '', 0, '98814-3419', 16, '0051', 'LICENÇA DE INSTALAÇÃO - LI', 'REQUERIMENTO DE LICENÇA DE INSTALAÇÃO - LI DA ESTAÇÃO GOURMET DO APEÚ.', 1, 1, '', '', '', ''),
(463, 1, 10, '01553/2021', '2021-11-18', 'GUAMÁ POLPAS INDÚSTRIA E EXPORTAÇÃO LTDA.', '', 0, '(91)98290 -2122', 16, '004', 'JUNTADA DE DOCUMENTO', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE Nº 00268/2021.', 0, 0, '', '', '', ''),
(464, 1, 10, '01559/2021', '2021-11-18', 'IMPERADOR DISTRIBUIDORA, COMÉRCIO E SERVIÇOS LTDA.', '', 0, '', 16, '03', 'JUNTADA DE DOCUMENTOS', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE Nº 0095/2021/PROC. - BOM DEMAIS ALIMENTOS, COMÉRCIO EIRELI.', 0, 0, '', '', '', ''),
(465, 1, 4, '01560/2021', '2021-11-18', 'DENÚNCIA ANÔNIMA', '', 0, '', 16, '002', 'DENÚNCIA ANÔNIMA', 'DENÚNCIA SOBRE INVASÃO DE ÁREAS VERDES DA PREFEITURA MUNICIPAL.', 0, 0, '', '', '', ''),
(466, 1, 10, '01561/2021', '2021-11-18', 'TROPOC - PRODUTOS TROPICAIS DE CASTANHAL LTDA.', '', 0, '', 16, '105', 'JUNTADA DE DOCUMENTO', 'JUNTADA DE DOCUMENTOS PARA ATENDIMENTO DE CONDICIONANTES DA LO Nº 020/2018 - TROPOC.', 0, 0, '', '', '', ''),
(467, 1, 10, '01562/2021', '2021-11-18', 'LABORATÓRIO DE PATOLOGIA CLÍNICA DR. PAULO AZEVEDO.', '', 0, '', 16, '031', 'JUNTADA DE DOCUMENTOS', 'JUNTADA DE DOCUMENTOS REFERENTE AO PROCESSO DE Nº 00010/2021. LABORATÓRIO PAULO AZEVEDO.', 0, 0, '', '', '', ''),
(468, 1, 4, '01563/2021', '2021-11-19', 'ANONIMO', '', 0, '', 16, '6', 'DENUNCIA ', 'DENUNCIA SOBRE POLUIÇÃO ATMOSFÉRICA NO BAIRRO SÃO JOSÉ.\r\n', 0, 0, '', '', '', ''),
(469, 1, 10, '01564/2021', '2021-11-19', 'AUTO POSTO BARÃO COMÉRCIO DE DERIVADOS DE PETRÓLEO LTDA.', '', 0, '', 16, '003', 'CUMPRIMENTO DE CONDICIONANTE DA L. I. Nº 002/2021.', 'COMPROVAÇÃO DA PUBLICAÇÃO DA LICENÇA DE INSTALAÇÃO DO PROCESSO Nº 00007/2020/PROC.', 0, 0, '', '', '', ''),
(470, 2, 20, '00280/2021', '2021-11-19', 'GOLDEM CLASSICS', '', 0, '(91)98165-9606', 16, '16', 'EVENTO TEMPORÁRIO', 'EVENTO GOLDEM CLASSIC', 0, 0, '', '', '', ''),
(471, 2, 24, '00281/2021', '2021-11-19', 'CASMED COMERCIO DE ARTIGOS HOSPITALARES', '', 0, '', 16, '64', 'LICENÇA DE OPERAÇÃO ', 'LICENÇA DE OPERAÇÃO CNPJ: 07.332.016/0001-40\r\n', 0, 0, '', '', '', ''),
(472, 2, 24, '00282/2021', '2021-11-19', 'MELO & ROLIM IND. E COM. DE ALUMÍNIO LTDA.', '', 0, '', 16, '5', 'LICENÇA DE OPERAÇÃO', 'LICENÇA DE OPERAÇÃO CNPJ: 43.946.890/0001-31\r\n', 0, 0, '', '', '', ''),
(473, 1, 12, '01565/2021', '2021-11-19', 'SEMAS', '', 0, '', 16, '2', 'SOLICITAÇÃO DE PODAGEM', 'OFICIO DE N:1248/2021/SEMAS', 0, 0, '', '', '', ''),
(474, 2, 29, '00283/2021', '2021-11-19', 'SEMADA', '', 0, '', 16, '4', 'DOAÇÃO DE MADEIRA', 'SOLICITAÇÃO DE MADEIRA PARA A COSNTRUÇÃO DE UMA CASA VEGETAÇÃO', 0, 0, '', '', '', ''),
(475, 1, 10, '01566/2021', '2021-11-19', 'AUTO POSTO CASTANHAL II COMÉRCIO DE DERIVADOS DE PETRÓLEO LTDA.', '', 0, '', 16, '009', 'CUMPRIMENTO DE CONDICIONANTE', 'CUMPRIMENTO DE CONDICIONANTE DO PROCESSO DE Nº 00475/2018/PROC.', 0, 0, '', '', '', ''),
(476, 1, 10, '01567/2021', '2021-11-19', 'AUTO POSTO CASTANHAL IV COMÉRCIO DE DERIVADOS DE PETRÓLEO LTDA.', '', 0, '', 16, '009', 'CUMPRIMENTO DE CONDICIONANTE.', 'CUMPRIMENTO DE CONDICIONANTE DA L. O. 0010/2021, DO PROCESSO DE Nº 51/2020/PROC.', 0, 0, '', '', '', ''),
(477, 1, 3, '01568/2021', '2021-11-19', 'COORDENADORIA DE CERIMONIAL', '', 0, '', 16, '002', 'OFÍCIO CIRCULAR - CONVITE - COORDENADORIA DE CERIMONIAL', 'CONVITE PARA A FORMATURA DO \"1° CURSO DE FORMAÇÃO DE INSTRUTORES DE CÃES DE POLÍCIA\", E TAMBÉM A FORMATURA DO \"CURSO DE II ROMU\"', 0, 0, '', '', '', ''),
(478, 1, 4, '01569/2021', '2021-11-22', 'GUILHERME OLIVEIRA', '', 0, '(91)98563-7591', 16, '002', 'DENÚNCIA/SOLICITAÇÃO', 'DENÚNCIA SOBRE CRIAÇÃO DE PORCOS SEM RESPONSABILIDADE AMBIENTAL, COM GRANDE LIXÃO A CÉU ABERTO E QUEIMADAS.', 0, 0, '', '', '', ''),
(479, 1, 12, '01570/2021', '2021-11-22', 'FRANCISCO SAMONEK', '', 0, '(91)98808-2760', 16, '003', 'OFÍCIO Nº 029/2021 SOLICITAÇÃO DE VISTORIA', 'SOLICITAÇÃO DE VISTORIA PARA VERIFICAR CUMPRIMENTO DE TAC 004789-040/2018.', 0, 0, '', '', '', ''),
(480, 1, 10, '01571/2021', '2021-11-22', 'VANDÍZIO O. DA SILVA EIRELI.', '', 138, '', 41, '017', 'JUNTADA DE DOCUMENTOS', 'JUNTADA DE DOCUMENTOS REF. AO PROCESSO N°00208/2021/PROC.', 1, 1, '', '', '', ''),
(481, 1, 10, '01572/2021', '2021-11-22', 'AUTO POSTO BARÃO COMÉRCIO DE DERIVADOS DE PETRÓLEO LTDA.', '', 0, '(91)98085-0342', 16, '006', 'JUNTADA DE DOCUMENTOS - AUTO POSTO BARÃO COMÉRCIO DE DERIVADOS DE PETRÓLEO LTDA.', 'JUNTADA DE DOCUMENTOS REF. AO TERMO DE NOTIFICAÇÃO Nº 092/2021.', 0, 0, '', '', '', ''),
(482, 1, 10, '01573/2021', '2021-11-22', 'CONDOMÍNIO CAMPO BELO', '', 430, '(91)98429-1526', 41, '003', 'JUNTADA DE DOCUMENTOS', 'JUNTADA DE DOCUMENTOS REF. ATENDIMENTO DE NOTIFICAÇÃO Nº 085/2021.', 1, 32, 'AV. UNIVERSITÁRIA', 'S/N', '', ''),
(483, 1, 10, '01574/2021', '2021-11-22', 'PARÁ COMÉRCIO DE POLPA DE FRUTAS LTDA.', '', 0, '', 16, '0005', 'JUNTADA DE DOCUMENTOS.', 'JUNTADA DE DOCUMENTOS REF. AO TERMO DE AQUISIÇÃO DE MATERIAIS DA SEMMA/CASTANHAL -  Nº PROCESSO 00395/2018.', 0, 0, '', '', '', ''),
(484, 1, 12, '01575/2021', '2021-11-22', 'XINGU FRUIT POLPAS DE FRUTAS INDÚSTRIA E COMÉRCIO EIRELI', '', 0, '', 41, '006', 'JUNTADA DE DOCUMENTOS.', 'JUNTADA DE DOCUMENTOS REF. AO TERMO DE AQUISIÇÃO DE MATERIAIS DA SEMMA/CASTANHAL -   OFÍCIO  N° 769/2021.', 1, 1, '', '', '', ''),
(485, 1, 12, '01576/2021', '2021-11-22', 'CASTANHAL COMÉRCIO DE POLPAS LTDA - ME', '', 497, '(91)98429-9440', 41, '0004', 'JUNTADA DE DOCUMENTOS SOLICITANDO DECLARAÇÃO DE TRAMITAÇÃO.', 'JUNTADA DE DOCUMENTOS E SOLICITAÇÃO DE DECLARAÇÃO DE TRAMITAÇÃO DE PROCESSO DE L. O. Nº 00032/2020/PROC.', 1, 1, '', '', '', ''),
(486, 2, 24, '00286/2021', '2021-11-22', 'SANTA LUZIA DISTRIBUIDORA E COMÉRCIO DE CARNES EIRELI.', '', 0, '', 16, '042', 'LICENÇA DE OPERAÇÃO - LO', 'PROCESSO REFERENTE A LICENÇA DE OPERAÇÃO - LO.', 0, 0, '', '', '', ''),
(487, 1, 4, '01577/2021', '2021-11-22', 'ANÔNIMA', '', 0, '', 16, '002', 'MAUS TRATOS', 'SOLICITAÇÃO DE RESGATE DE ANIMAL DOMÉSTICO ( CACHORRO) POR MAUS TRATOS ', 0, 0, '', '', '', ''),
(488, 1, 10, '01578/2021', '2021-11-22', 'AUTO POSTO BARÃO COMÉRCIO DE DERIVADOS DE PETRÓLEO LTDA.', '', 0, '', 16, '003', 'JUNTADA DE DOCUMENTOS', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE Nº 00213/2021/PROC.', 0, 0, '', '', '', ''),
(489, 1, 18, '01579/2021', '2021-11-23', 'PAULO SÉRGIO DE MATOS FERREIRA', '', 0, '', 16, '003', 'SOLICITAÇÃO DE PODA \r\n', 'SOLICITAÇÃO DE PODA DE ÁRVORES POR INTERFERÊNCIA NA PASSAGEM DE ÔNIBUS\r\n', 0, 0, '', '', '', ''),
(490, 1, 10, '01580/2021', '2021-11-23', 'ESTORIL COMÉRCIO VAREJISTA DE MERCADORIAS E SERVIÇOS LTDA.', '', 0, '', 16, '009', 'JUNTADA DE DOCUMENTOS', 'JUNTADA DE DOCUMENTO REF. A NOTIFICAÇÃO Nº 083/2021, REF. AO PROCESSO Nº 00144/2021.', 0, 0, '', '', '', ''),
(491, 1, 4, '01581/2021', '2021-11-23', 'ANÔNIMA', '', 0, '', 16, '003', 'DENÚNCIA ANÔNIMA', 'DENÚNCIA SOLICITANDO VISTORIA REFERENTE DESCARTE INDEVIDO DE LIXÃO.', 1, 1, '', '', '', ''),
(492, 1, 10, '01582/2021', '2021-11-23', 'OKAJIMA DISTRIBUIÇÃO E COMÉRCIO LTDA.', '', 0, '', 16, '003', 'JUNTADA DE DOCUMENTO.', 'JUNTADA DE DOCUMENTO REF. A PROCESSO DE NÚMERO 01054/2020/DOC.', 0, 0, '', '', '', ''),
(493, 2, 19, '00287/2021', '2021-11-23', 'COORDENADOR DA INFRAESTRUTURA DA SEMED - EDIELSON LIMA DA SILVA', '', 0, '', 16, '002', 'SUPRESSÃO DE ÁRVORE', 'SOLICITAÇÃO DE UMA SUPRESSÃO DE ÁRVORENA ESCOLA RAIMUNDA AMARAL.', 0, 0, '', '', '', ''),
(494, 1, 18, '01583/2021', '2021-11-23', 'H. MEDEIROS ALVES LTDA - PSICULTURA ESTRELA DALVA.', '', 0, '', 16, '002', 'SOLICITAÇÃO DE DECLARAÇÃO DE TRÂMITE.', 'SOLICITAÇÃO DE DECLARAÇÃO DE TRÂMITE DE PROCESSO Nº 01978/2019, REF. A LAR.', 0, 0, '', '', '', ''),
(495, 1, 18, '01584/2021', '2021-11-23', 'PRODUTOR DE FARINHA ESPECIAL LTDA.', '', 0, '', 16, '002', 'SOLICITAÇÃO DE DECLARAÇÃO DE TRÂMITE.', 'SOLICITAÇÃO DE DECLARAÇÃO DE TRÂMITE REFERENTE AO PROCESSO DE Nº 0110/2018.', 0, 0, '', '', '', ''),
(496, 1, 4, '00393/2021', '2021-04-14', 'Anônimo', '', 0, '', 22, '2', 'CONSTRUÇÃO EM ÁREA DE APP E DESMATAMENTO', 'MORADOR CONSTRUINDO CERCA, INVADINDO ÁREA DE PRESERVAÇÃO DO RIO APEÚ, SUPRIMINDO INDIVÍDUOS ARBÓREOS DA ÁREA EM QUESTÃO', 1, 1, '', '', '', ''),
(497, 2, 24, '00032/2020', '2020-02-06', 'CASTANHAL COMÉRCIO DE POLPAS LTDA-ME', '', 0, '91 98290-2122', 41, '253', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO', 'CAIXA-05/ L.O-2020\r\n(L.A.O- LICENÇA AMBIENTAL ORDINÁRIO)', 1, 1, '', '', '', ''),
(498, 1, 12, '00328/2021', '2021-03-26', 'ANONIMO', '', 0, '', 22, '5', 'DESCARTE IRREGULAR DE RESÍDUOS ', 'TERRENO ABANDONADO SERVINDO PARA DESCARTE IRREGULAR DE RESÍDUOS E DE ESCONDERIJO PARA MELIANTE.', 1, 21, '', '', '', ''),
(499, 1, 10, '01585/2021', '2021-11-23', 'PETRUZ FUIT INDÚSTRIA, COMÉRCIO E DISTRIBUIDORA LTDA.', '', 0, '', 16, '004', 'JUNTADA DE DOCUMENTO', 'JUNTADE DE DOCUMENTO - BOLETO DE PAGAMENTO DE DECLARAÇÃO DE TRÂMITE EM ATENDIMENTO A L. O. DO PROCESSO Nº 0012/2021/PROC.', 0, 0, '', '', '', ''),
(500, 1, 4, '01143/2021', '2021-08-31', 'Anônimo', '', 0, '', 22, '2', 'POLUIÇÃO SONORA', 'DENUNCIANTE INFORMA QUE A DROGARIA PÕE CAIXAS DE SOM NA CALÇADA, E TOCA SOM ALTO O DIA INTEIRO SEM INTERRUPÇÃO, NO HORÁRIO DE 08H DA MANHÃ ATÉ AS 22H. A DENUNCIANTE  AINDA EXPÕE QUE A DROGARIA NÃO SE PREOCUPA COM OS MORADORES DO PRÉDIO AO LADO, QUE COM A PANDEMIA, A MAIORIA SÃO IDOSOS E OUTROS TRABALHAM A HOME OFFICE.', 1, 8, '', '', '', ''),
(501, 1, 10, '01586/2021', '2021-11-23', 'BELA IAÇA POLPAS DE FRUTAS INDÚSTRIA E COMÉRCIO LTDA.', '', 0, '', 16, '004', 'JUNTADA DE DOCUMENTO', 'JUNTADE DE DOCUMENTO - BOLETO DE PAGAMENTO DE DECLARAÇÃO DE TRÂMITE EM ATENDIMENTO A L. O. DO PROCESSO Nº 0011/2021/PROC.', 0, 0, '', '', '', ''),
(502, 1, 10, '01587/2021', '2021-11-23', 'IOLANDEILDE BOA PIMENTEL', '', 0, '', 16, '002', 'JUNTADA DE DOCUMENTO.', 'JUNTADA DE DOCUMENTO - BOLETO DE PAGAMENTO DE SUPRESSÃO DE ÀRVORE REF. AO PROCESSO DE Nº 00285/2021.', 0, 0, '', '', '', ''),
(503, 1, 10, '01588/2021', '2021-11-23', 'CASA DE SHOWS E EVENTOS PARAÍSO LTDA - ME.', '', 0, '', 16, '009', 'JUNTADA DE DOCUMENTOS.', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE Nº 00221/2021.', 0, 0, '', '', '', ''),
(504, 1, 4, '00197/2021', '2021-02-26', 'RAIMUNDO PEREIRA CARDOSO', '', 0, '', 22, '2', 'DESMATAMENTO ILEGAL E DEGRADAÇÃO EM IGARAPÉ', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO, O SR. CONHECIDO COMO \"OZIO\", ESTÁ DESMATANDO E DEGRADANDO A NASCENTE DO IGARAPÉ (ÁGUA BOA).', 1, 38, '', '', '', ''),
(505, 1, 4, '00369/2021', '2021-04-08', 'Anônimo', '', 0, '', 22, '5', 'POLUIÇÃO AMBIENTAL', 'SEGUNDO O DENUNCIANTE, O PROPRIETÁRIO TRABALHA COM REPARAÇÃO DE CARROCERIA DE CAMINHÃO E SOLDA, USO DE MADEIRA PREJUDICANDO A SAÚDE DOS MORADORES.', 1, 38, '', '', '', ''),
(506, 1, 4, '00032/2021', '2021-01-13', 'Anônimo', '', 0, '', 22, '2', 'POLUIÇÃO ATMOSFÉRICA', 'SEGUNDO O DENUNCIANTE, NO LOCAL INFORMADO, ESTÁ FUNCIONANDO UM BAR E COMÉRCIO DE PEIXE. ONDE ESTE ULTIMO É TRATADO NO LOCAL E DESPEJADO EM VIA PÚBLICA, OCASIONADO MAU CHEIRO.', 1, 37, '', '', '', ''),
(507, 1, 4, '01589/2021', '2021-11-23', 'ANÔNIMA', '', 0, '', 16, '002', 'DENÚNCIA ANÔNIMA', 'DENUNCIA ANÔNIMA ENVIADA POR EMAIL, REFERENTE A POLUIÇÃO E CRIAÇÃO DE PORCOS.', 0, 0, '', '', '', ''),
(508, 1, 1, '01590/2021', '2021-11-23', 'F. B. DISTRIBUIDORA DE ALIMENTOS LTDA.', '', 0, '', 16, '010', 'CARTA CONSULTA', 'CARTA CONSULTA DA EMPRESA F. B. DISTRIBUIDORA DE ALIMENTOS LTDA.', 0, 0, '', '', '', ''),
(509, 1, 11, '01591/2021', '2021-11-23', 'LUCILENE RODRIGUES DA SILVA', '', 0, '', 16, '002', 'MEMORANDO SEHAB', 'MEM. Nº 0253/2021, REITERANDO MEM. JÁ ENVIADO DE Nº0234/2021, SOLICITANDO  PARECER TÉCNICO REFERENTE A REGULARIZAÇÃO FUNDIÁRIA DO PROCESSO Nº 01485/2021.', 1, 1, '', '', '', ''),
(510, 2, 29, '00289/2021', '2021-11-23', 'CPRN - JOSÉ RONALDO FILHO', '', 0, '', 16, '004', 'SOLICITAÇÃO DE MADEIRA', 'SOLICITAÇÃO DE MADEIRA PARA CONFECÇÃO DE ESTRUTURA DE PLACAS EDUCATIVAS.', 1, 1, '', '', '', ''),
(511, 1, 4, '00001/2021', '2021-01-05', 'RITA ELIZETE CARDOSO', '', 0, '', 22, '2', 'SUPRESSÃO VEGETAL', 'SEGUNDO O DENUNCIANTE, O SENHOR CONHECIDO COMO \"PEDRO\"ESTÁ REALIZANDO CORTE DE ÁRVORES (DESMATAMENTO) NA PROPRIEDADE DA MESMA, SEM AUTORIZAÇÃO', 1, 38, '', '', '', ''),
(512, 1, 4, '00747/2021', '2021-06-18', 'RINALDO SANTOS GUERREIRO', '', 0, '', 22, '12', 'QUEIMADA', 'SEU RINALDO INFORMA QUE O DENUNCIADO FAZ QUEIMADA DE ALUMÍNIO FORA DE HORÁRIO', 1, 21, '', '', '', ''),
(513, 1, 4, '00434/2021', '2021-04-23', 'JESSICA DE ARAÚJO GADELHA', '', 0, '', 22, '9', 'POLUIÇÃO SONORA', 'POLUIÇÃO SONORA EM IGREJA, SOM MUITO ALTO, CAUSANDO TRANSTORNO A VIZINHANÇA.', 1, 41, '', '', '', ''),
(514, 1, 4, '00425/2021', '2021-04-22', 'Anônimo', '', 0, '', 22, '7', 'SUPRESSÃO VEGETAL', 'RETIRADA IRREGULAR DE QUATRO (04) ÁRVORES DA ESPÉCIE HEVEA BRASILIENSIS', 1, 42, '', '', '', ''),
(515, 1, 10, '01592/2021', '2021-11-24', 'FAZENDA VALE DA PALMEIRA', '', 0, '(91)98429-1526', 16, '014', 'JUNTADA DE DOCUMENTOS.', 'JUNTADA DE DOCUMENTOS REF. AO PROCESSO DE Nº 00057/2021.', 0, 0, '', '', '', ''),
(516, 1, 10, '01593/2021', '2021-11-24', 'FAZENDA SÃO JOSÉ I - ANTÔNIO EUSTÁQUIO DE OLIVEIRA', '', 0, '(91)98429-1526', 16, '005', 'JUNTADA DE DOCUMENTOS.', 'JUNTADA DE DOCUMENTOS REF. AO PROCESSO DE Nº 00058/2021.', 0, 0, '', '', '', ''),
(517, 1, 12, '00636/2021', '2021-05-26', 'MPPA', '', 0, '', 22, '2', 'PENDÊNCIAS DO EMPREENDIMENTO V.B. EVANGELISTA NETO-ME', 'VERIFICAR SE O EMPREENDIMENTO V.B. EVANGELISTA NETO-ME PROVIDENCIOU O ATENDIMENTO À LISTA DE PENDÊNCIAS ELABORADAS POR ESSA SECRETARIA E QUAIS MEDIDAS FORAM ADOTADAS PELA COORDENADORIA DE FISCALIZAÇÃO. ', 1, 34, '', '', '', ''),
(518, 1, 12, '01477/2020', '2020-11-16', 'MPPA', '', 0, '', 22, '11', 'PENDÊNCIAS DO EMPREENDIMENTO V.B. EVANGELISTA NETO-ME', 'VERIFICAR SE O EMPREENDIMENTO V.B. EVANGELISTA NETO-ME PROVIDENCIOU O ATENDIMENTO À LISTA DE PENDÊNCIAS ELABORADAS POR ESSA SECRETARIA E QUAIS MEDIDAS FORAM ADOTADAS PELA COORDENADORIA DE FISCALIZAÇÃO. ', 1, 34, '', '', '', ''),
(519, 1, 12, '01594/2021', '2021-11-24', 'TRIBUNAL DE JUSTIÇA DO ESTADO DO PARA', '', 0, '', 16, '005', 'REQUERIMENTO PROCESSO.', 'REQUERIMENTO DE REITERAÇÃO DE PROCESSO DE Nº 0266/2021 DE 18/08/2021.', 0, 0, '', '', '', ''),
(520, 1, 12, '00638/2021', '2021-05-26', 'MPPA', '', 0, '', 22, '2', 'RELATÓRIO À FISCALIZAÇÃO', 'ENCAMINHAR RELATÓRIO PERTINENTE À FISCALIZAÇÃO REALIZADA NO EMPREENDIMENTO 3 JOTA AGRO COMÉRCIO LTDA-ME', 1, 19, '', '', '', ''),
(521, 1, 12, '01587/2020', '2020-12-09', 'MPPA', '', 0, '', 22, '4', 'INFORMAÇÕES PERTINENTES A FISCALIZAÇÃO', 'ENCAMINHAR INFORMAÇÕES PERTINENTE À FISCALIZAÇÃO REALIZADA NO EMPREENDIMENTO 3 JOTA AGRO COMÉRCIO LTDA-ME', 1, 19, '', '', '', ''),
(522, 1, 10, '01595/2021', '2021-11-24', 'SUPER POSTO PALMEIRA LTDA', '', 0, '', 16, '005', 'JUNTADA DE DOCUMENTOS.', 'JUNTADA DE DOCUMENTOS REFERENTE AO PROCESSO Nº 00269/2021.', 0, 0, '', '', '', ''),
(523, 1, 10, '01596/2021', '2021-11-24', 'AUTO POSTO CASTANHAL II', '', 0, '', 16, '015', 'JUNTADA DE DOCUMENTO.', 'JUNTADA DE DOCUMENTO COMO CUMPRIMENTO DE L.O. Nº 0033/2019  REFER. AO PROCESSO Nº 0475/2018.', 0, 0, '', '', '', ''),
(524, 1, 12, '00611/2021', '2021-05-25', 'MPPA', '', 0, '', 22, '2', 'POLUIÇÃO AMBIENTAL', 'INFORMAR AS PROVIDÊNCIA ADOTADAS PARA FÁBRICA LOCALIZADA NA TRAVESSA ACRE, BAIRRO IMPERADOR, QUE ESTARIA CAUSANDO POLUIÇÃO AMBIENTAL', 1, 17, '', '', '', ''),
(525, 1, 12, '00216/2021', '2021-03-02', 'MPPA', '', 0, '', 22, '14', 'POLUIÇÃO AMBIENTAL', 'INFORMAR AS PROVIDÊNCIA ADOTADAS PARA FÁBRICA LOCALIZADA NA TRAVESSA ACRE, BAIRRO IMPERADOR, QUE ESTARIA CAUSANDO POLUIÇÃO AMBIENTAL', 1, 17, '', '', '', ''),
(527, 1, 10, '01597/2021', '2021-11-24', 'SENDAS DISTRIBUIDORA S/A.', '', 0, '', 16, '004', 'JUNTADA DE DOCUMENTOS.', 'JUNTADA DE DOCUMENTOS REF. A ENTREGA DE CONDICIONANTE REF. A L. O. Nº 031/2019 DO PROCESSO Nº 0222/2019.', 0, 0, '', '', '', ''),
(530, 1, 13, '01598/2021', '2021-11-24', 'SECULT - ERIVALDO HOLANDA MARQUES PEREIRA', '', 0, '', 16, '04', 'INFORME SOBRE PROGRAMAÇÃO', 'OFÍCIO Nº 573/2021 -SECULT - PROGRAMAÇÃO DO PROJETO MEU QUERIDO NATAL.\r\n', 0, 0, '', '', '', ''),
(531, 1, 12, '00106/2021', '2021-02-02', 'MPPA', '', 0, '', 23, '4', 'POLUIÇÃO SONORA', 'NOTÍCIA SOBRE A EMISSÃO DE RUÍDOS PROVENIENTES DA UTILIZAÇÃO DE INSTRUMENTOS SONOROS NA RESIDÊNCIA DA SRA. MARIA DO ESPIRITO SANTO, ', 1, 14, 'CONJ.IPE RUA WE 15N202.QUADRA 19 BLOCO 02 APTO 202', '202', '', ''),
(532, 1, 12, '00233/2021', '2021-03-05', 'PODER LEGISLATIVO (REGINALDO MOTA DE SOUZA)', '', 0, '', 22, '5', 'TERRENO BALDIO- OFÍCIO  N°78/2021', 'O TERRENO FOI ABANDONADO  PELO (A) PROPRIETÁRIO (A), O QUE ESTÁ OCASIONANDO DIVERSOS PREJUÍZOS AO MEIO AMBIENTE LOCAL, TENDO EM VISTA QUE A FALTA DE LIMPEZA NO TERRENO FACILITA PROLIFERAÇÃO DE COBRAS, SAPOS E AFINS, DEIXANDO A COMUNIDADE LOCAL A MERCÊ DE TAIS PROLIFERAÇÕES.', 1, 6, '', '', '', ''),
(533, 1, 12, '00639/2021', '2021-05-26', 'MPPA', '', 0, '', 22, '3', 'LICENÇA AMBIENTAL', 'VERIFICAR SE O EMPREENDIMENTO AUTOCENTER NETTO MENDES LTDA-ME PROVIDENCIOU O ATENDIMENTO A LISTA DE PENDÊNCIAS ELABORADAS POR ESSA SECRETARIA.', 1, 34, '', '', '', ''),
(534, 2, 24, '00032/2020', '2020-02-06', 'ALDA SILENE SOUSA DOS SANTOS/CASTANHAL COMÉRCIO DE POLPAS LTDA - ME', '', 0, '91 98429-9440, 91 98290-2122', 35, '253', 'LICENÇA DE OPERAÇÃO - LO', 'CAIXA 05 - LO - 2020 - ORDINÁRIO', 1, 38, 'ROD BR 316, KM 64', 'S/N', '', ''),
(535, 2, 24, '00106/2020', '2020-08-07', 'YGOR MAGALHÃES MIRANDA/MEMORIAL CAMPO SANTO LTDA - ME', '', 0, '91 3721-3296, 91 98414-4529', 35, '159', 'LICENÇA DE OPERAÇÃO - LO', 'CAIXA 05 - LO - 2020', 1, 16, 'ROD BR 316, KM 77', 'S/N', '', ''),
(536, 1, 12, '01599/2021', '2021-11-24', 'AMAZON POLPAS IND. E COM. DE POLPAS DA AMAZÔNIA LTDA.', '', 0, '', 16, '002', 'SOLICITAÇÃO DE CÓPIA DE PROCESSO', 'OFÍCIO Nº 0611/2021 SOLICITANDO CÓPIA DE PROCESSOS ADM. PUNITIVOS DA EMPRESA AMAZON POLPAS.', 0, 0, '', '', '', ''),
(537, 1, 10, '01600/2021', '2021-11-24', 'GRANFRUTO INDÚSTRIA E COMÉRCIO DE POLPAS LTDA.', '', 0, '', 16, '022', 'JUNTADA DE DOCUMENTO ', 'JUNTADA DE DOCUMENTO EM ATENDIMENTO A CONDICIONANTE REF. AO PROCESSO Nº 00597/2018 DA L. O. Nº 0011/2020.', 0, 0, '', '', '', ''),
(538, 1, 10, '01601/2021', '2021-11-24', 'FAZENDA SÃO JOSÉ I - ANTÔNIO EUSTÁQUIO DE OLIVEIRA', '', 0, '', 16, '006', 'JUNTADA DE DOCUMENTOS.', 'JUNTADA DE DOCUMENTO REF. AO PROCESSO DE Nº 0058/2020/PROC.', 0, 0, '', '', '', ''),
(539, 1, 12, '01560/2020', '2020-12-03', 'MPPA', '', 0, '', 23, 'S/N', 'FISCALIZAÇÃO AREA DE TRANSMISSAO 138KV MODELO-TERRA ALTA DE RESPONSABILIDADE DA EMPRESA CELPA-EQUATORIAL ENERGIA', '', 1, 38, 'ESTRADA CASTANHAL TERRA ALTA', '', '', ''),
(540, 1, 10, '01602/2021', '2021-11-25', 'EMPRESA MARIA TRANSPORTES', '', 0, '', 16, '005', 'JUNTADA DE DOCUMENTOS ', 'JUNTADA DE DOCUMENTOS REF. A PROCESSO DE 2019 DA EMPRESA MARIA TRANSPORTES.', 1, 1, '', '', '', ''),
(541, 1, 10, '01603/2021', '2021-11-25', 'ANTÔNIO EUSTÁQUIO DE OLIVEIRA - FAZENDA SÃO JOSÉ I', '', 0, '', 16, '002', 'JUNTADA DE DOCUMENTOS.', 'JUNTADA DE DOCUMENTO REF. A RETIFICAÇÃO DO OFÍCIO DE Nº 0778/2021.', 0, 0, '', '', '', ''),
(542, 1, 12, '01604/2021', '2021-11-25', 'MINISTÉRIO PÚBLICO DO ESTADO DO PARÁ.', '', 0, '', 16, '015', 'OFÍCIO Nº 0446/2021', 'SOLICITANDO INFORMAÇÕES ACERCA DAS MEDIDAS DA VIGILÂNCIA SANITÁRIA E ZOONOSES.', 0, 0, '', '', '', ''),
(543, 2, 24, '00927/2018', '2018-07-04', 'A.M. RODRIGUES DA SILVA -ME (TORNEADORA SILVA)', '', 0, '91 9920-8009', 41, '200', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA-01/ L.O- 2018; L.A.O', 1, 8, 'R. MAXIMINO PORPINO DA SILVA', '1205', '', ''),
(544, 2, 24, '00933/2018', '2018-07-05', 'BRUNA RAFAELA DE MORAES E MORAES 00564247286( NOSSO QUINTAL CASTANHAL)', '', 0, '91 98420-7999', 41, '175', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA-01/ L.O - 2018- DISPENSA DE LICENCIAMENTO AMBIENTAL', 1, 25, 'TV. FLORIANDO PEIXOTO', '1080', '', ''),
(545, 1, 12, '01605/2021', '2021-11-25', 'ROSIMAR POSIDONIO', '', 0, '', 16, '4', 'CONVITE ', 'OFICIO DE N:017/2021', 0, 0, '', '', '', ''),
(546, 1, 12, '01606/2021', '2021-11-25', 'PODER LEGISLATIVO DE CASTANHAL', '', 0, '', 16, '003', 'REQUERIMENTO', 'OFÍCIO Nº 0515/2021-DL, COMUNICADO SOBRE REQUERIMENTO DE Nº 2092/2021, DE AUTORIA DA VEREADORA PAULA TITAN.', 0, 0, '', '', '', ''),
(547, 2, 24, '00075/2018', '2018-01-19', 'ALICE M. DAS NEVES LIMA ( CASQUINHA DE CARANGUEIJO )', '', 0, '91 98420 7999', 41, '236', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA-01/ L.O-2018-DLA', 1, 12, 'R DOM PEDRO II', '139', '', ''),
(548, 1, 4, '01318/2021', '2021-09-28', 'Anônimo', '', 0, '', 23, '1', 'POLUÇÃO AMBIENTAL', 'PRODUTOS USADOS PELO LAVA JATO E BARULHO', 1, 31, 'RUA BENEVIDES ESQUINA COM TV. MOEMA', 'S/N', '', ''),
(549, 2, 24, '01393/2018', '2018-08-25', 'BSB PRODUTORA DE EQUIPAMENTOS DE PROTEÇÃO INDIVIDUAL S.A', '', 0, '3712 1600', 41, '339', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA-01/ L.O - 2018- L.A.O', 1, 38, 'ROD. BR- 316 KM-76', 'S/N', '', ''),
(550, 1, 10, '01607/2021', '2021-11-26', 'almada exportadora', '', 0, '', 16, '19', 'juntada ao termo de notificação n:1074/2021', 'oficio de n:121/2021/adm', 0, 0, '', '', '', ''),
(551, 2, 24, '00937/2018', '2018-07-05', 'S.M.P. DE OLIVEIRA & CIA LTDA(PORTAL SERVIÇO)', '', 0, '9 8117-7197', 41, '120', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO- L.O', 'CAIXA - 02/ L.O-2018- L.A.O', 1, 30, 'AV. PRESIDENTE GETÚLIO VARGAS', '421', '', ''),
(552, 1, 10, '01608/2021', '2021-11-26', 'lider comercio e industria ltda', '', 0, '', 16, '3', 'declaração de tramite ', 'oficio:007/eng-amb/2021', 0, 0, '', '', '', ''),
(553, 1, 10, '01609/2021', '2021-11-26', 'AÇAI DA SAFRA', '', 0, '', 16, '10', 'JUNTADA DE DOCUMENTOS A RESPOSTA DE NOTIFICAÇÃO ', 'DOCUMENTOS PARA SER ANEXADOS AO PROCESSO 37/2021', 0, 0, '', '', '', ''),
(554, 1, 10, '01610/2021', '2021-11-26', 'GOLDEN CLASSICS', '', 0, '', 16, '003', 'COMPROVANTE DE PAGAMENTO', 'COMPROVANTE DE PAGAMENTO REF. TAXA DE L. T. - JOELSON MELO', 0, 0, '', '', '', ''),
(555, 2, 31, '02000/2018', '2021-12-20', 'joab', '12312', 220, '12312', 1, '12312', '12321', '1231312', 1, 8, '12321', '12321', '-23.29961381', '-45.982465412321');

-- --------------------------------------------------------

--
-- Estrutura da tabela `protocolo_anexo`
--

CREATE TABLE `protocolo_anexo` (
  `id` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `anexo` varchar(255) DEFAULT NULL,
  `protocolo_id` int(10) UNSIGNED NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `protocolo_historico`
--

CREATE TABLE `protocolo_historico` (
  `id` int(10) UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `protocolo_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `protocolo_historico`
--

INSERT INTO `protocolo_historico` (`id`, `data`, `descricao`, `usuario_id`, `protocolo_id`) VALUES
(48, '2021-09-28', 'Realizado o cadastro deste protocolo no banco de dados', 16, 2),
(51, '2021-10-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 4),
(52, '2021-10-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 5),
(53, '2021-10-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 6),
(63, '2021-10-06', 'Realizado alteração deste protocolo no banco de dados', 1, 6),
(64, '2021-10-06', 'Realizado alteração deste protocolo no banco de dados', 1, 5),
(73, '2021-10-07', 'Realizado o cadastro deste protocolo no banco de dados', 16, 8),
(74, '2021-10-07', 'Realizado alteração deste protocolo no banco de dados', 1, 5),
(75, '2021-10-07', 'Realizado alteração deste protocolo no banco de dados', 1, 6),
(76, '2021-10-13', 'Realizado o cadastro deste protocolo no banco de dados', 16, 9),
(77, '2021-10-13', 'Realizado o cadastro deste protocolo no banco de dados', 16, 10),
(78, '2021-10-13', 'Realizado o cadastro deste protocolo no banco de dados', 16, 11),
(79, '2021-10-13', 'Realizado o cadastro deste protocolo no banco de dados', 16, 12),
(80, '2021-10-13', 'Realizado o cadastro deste protocolo no banco de dados', 16, 13),
(81, '2021-10-13', 'Realizado o cadastro deste protocolo no banco de dados', 1, 14),
(82, '2021-10-13', 'Realizado o cadastro deste protocolo no banco de dados', 23, 15),
(84, '2021-10-13', 'Realizado alteração deste protocolo no banco de dados', 1, 15),
(85, '2021-10-13', 'Realizado alteração deste protocolo no banco de dados', 1, 14),
(86, '2021-10-13', 'Realizado alteração deste protocolo no banco de dados', 1, 15),
(87, '2021-10-13', 'Realizado alteração deste protocolo no banco de dados', 1, 2),
(88, '2021-10-13', 'Realizado alteração deste protocolo no banco de dados', 1, 14),
(89, '2021-10-13', 'Realizado alteração deste protocolo no banco de dados', 1, 14),
(97, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 23, 19),
(98, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 16, 20),
(99, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 21),
(100, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 22),
(101, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 23),
(102, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 16, 24),
(103, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 25),
(104, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 26),
(105, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 27),
(106, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 28),
(107, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 29),
(108, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 23, 30),
(109, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 31),
(110, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 32),
(111, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 33),
(112, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 34),
(113, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 35),
(114, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 36),
(116, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 38),
(117, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 39),
(118, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 40),
(119, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 41),
(120, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 22, 42),
(121, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 16, 43),
(122, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 16, 44),
(123, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 16, 45),
(124, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 16, 46),
(125, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 32, 47),
(126, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 32, 20),
(127, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 16, 48),
(128, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 16, 49),
(129, '2021-10-14', 'Realizado o cadastro deste protocolo no banco de dados', 16, 50),
(131, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 2),
(132, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 4),
(133, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 5),
(134, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 6),
(135, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 8),
(136, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 9),
(137, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 10),
(138, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 11),
(139, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 12),
(140, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 13),
(141, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 15),
(142, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 19),
(143, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 24),
(144, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 28),
(145, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 39),
(146, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 44),
(147, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 45),
(148, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 49),
(149, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 48),
(150, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 47),
(151, '2021-10-14', 'Realizado alteração deste protocolo no banco de dados', 1, 14),
(152, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 16, 52),
(153, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 32, 53),
(154, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 32, 54),
(155, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 23, 55),
(156, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 32, 56),
(157, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 32, 57),
(158, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 23, 58),
(159, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 24, 59),
(160, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 23, 60),
(161, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 23, 61),
(162, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 23, 62),
(163, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 23, 63),
(164, '2021-10-15', 'Realizado o cadastro deste protocolo no banco de dados', 23, 64),
(165, '2021-10-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 65),
(166, '2021-10-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 66),
(167, '2021-10-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 67),
(168, '2021-10-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 68),
(169, '2021-10-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 69),
(170, '2021-10-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 70),
(171, '2021-10-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 71),
(172, '2021-10-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 72),
(173, '2021-10-19', 'Realizado alteração deste protocolo no banco de dados', 23, 49),
(174, '2021-10-19', 'Realizado o cadastro deste protocolo no banco de dados', 23, 73),
(175, '2021-10-19', 'Realizado o cadastro deste protocolo no banco de dados', 23, 74),
(176, '2021-10-20', 'Realizado o cadastro deste protocolo no banco de dados', 23, 75),
(177, '2021-10-20', 'Realizado o cadastro deste protocolo no banco de dados', 35, 76),
(178, '2021-10-20', 'Realizado o cadastro deste protocolo no banco de dados', 35, 77),
(179, '2021-10-20', 'Realizado o cadastro deste protocolo no banco de dados', 35, 78),
(193, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 79),
(194, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 80),
(195, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 81),
(196, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 82),
(197, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 83),
(198, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 84),
(199, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 85),
(200, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 86),
(201, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 87),
(202, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 88),
(203, '2021-10-21', 'Realizado alteração deste protocolo no banco de dados', 1, 44),
(204, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 89),
(205, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 90),
(206, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 91),
(207, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 92),
(208, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 93),
(209, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 94),
(210, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 35, 95),
(211, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 26, 96),
(212, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 26, 97),
(213, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 26, 98),
(214, '2021-10-21', 'Realizado o cadastro deste protocolo no banco de dados', 26, 99),
(215, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 100),
(216, '2021-10-22', 'Realizado alteração deste protocolo no banco de dados', 22, 100),
(217, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 101),
(218, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 102),
(219, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 103),
(220, '2021-10-22', 'Realizado alteração deste protocolo no banco de dados', 22, 102),
(221, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 104),
(222, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 105),
(223, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 106),
(224, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 107),
(225, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 108),
(226, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 109),
(227, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 110),
(228, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 111),
(229, '2021-10-22', 'Realizado alteração deste protocolo no banco de dados', 22, 111),
(230, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 112),
(231, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 113),
(232, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 114),
(233, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 115),
(234, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 116),
(235, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 117),
(236, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 118),
(237, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 119),
(238, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 120),
(239, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 22, 121),
(240, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 122),
(241, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 32, 123),
(242, '2021-10-22', 'Realizado o cadastro deste protocolo no banco de dados', 32, 124),
(243, '2021-10-22', 'Realizado alteração deste protocolo no banco de dados', 32, 104),
(244, '2021-10-22', 'Realizado alteração deste protocolo no banco de dados', 32, 104),
(245, '2021-10-22', 'Realizado alteração deste protocolo no banco de dados', 32, 84),
(246, '2021-10-22', 'Realizado alteração deste protocolo no banco de dados', 32, 83),
(247, '2021-10-22', 'Realizado alteração deste protocolo no banco de dados', 32, 82),
(248, '2021-10-22', 'Realizado alteração deste protocolo no banco de dados', 32, 81),
(249, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 22, 125),
(250, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 22, 126),
(251, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 22, 127),
(252, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 22, 128),
(253, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 22, 129),
(254, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 22, 130),
(255, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 22, 131),
(256, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 22, 132),
(257, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 22, 133),
(258, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 22, 134),
(259, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 135),
(260, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 136),
(261, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 137),
(262, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 32, 138),
(263, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 23, 139),
(264, '2021-10-25', 'Realizado alteração deste protocolo no banco de dados', 32, 136),
(265, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 32, 140),
(266, '2021-10-25', 'Realizado alteração deste protocolo no banco de dados', 32, 137),
(267, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 141),
(268, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 142),
(269, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 143),
(270, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 144),
(271, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 145),
(272, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 146),
(273, '2021-10-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 147),
(274, '2021-10-26', 'Realizado o cadastro deste protocolo no banco de dados', 16, 148),
(275, '2021-10-26', 'Realizado o cadastro deste protocolo no banco de dados', 23, 149),
(276, '2021-10-26', 'Realizado o cadastro deste protocolo no banco de dados', 22, 150),
(277, '2021-10-26', 'Realizado o cadastro deste protocolo no banco de dados', 16, 151),
(278, '2021-10-26', 'Realizado o cadastro deste protocolo no banco de dados', 16, 152),
(279, '2021-10-26', 'Realizado o cadastro deste protocolo no banco de dados', 16, 153),
(280, '2021-10-26', 'Realizado o cadastro deste protocolo no banco de dados', 16, 154),
(281, '2021-10-26', 'Realizado o cadastro deste protocolo no banco de dados', 16, 155),
(282, '2021-10-26', 'Realizado o cadastro deste protocolo no banco de dados', 16, 156),
(283, '2021-10-26', 'Realizado o cadastro deste protocolo no banco de dados', 16, 157),
(284, '2021-10-26', 'Realizado o cadastro deste protocolo no banco de dados', 23, 158),
(290, '2021-10-27', 'Realizado o cadastro deste protocolo no banco de dados', 16, 159),
(291, '2021-10-27', 'Realizado o cadastro deste protocolo no banco de dados', 16, 160),
(292, '2021-10-28', 'Realizado o cadastro deste protocolo no banco de dados', 16, 161),
(293, '2021-10-28', 'Realizado o cadastro deste protocolo no banco de dados', 16, 162),
(294, '2021-10-28', 'Realizado o cadastro deste protocolo no banco de dados', 16, 163),
(295, '2021-10-28', 'Realizado o cadastro deste protocolo no banco de dados', 41, 164),
(296, '2021-10-28', 'Realizado o cadastro deste protocolo no banco de dados', 41, 165),
(297, '2021-10-28', 'Realizado o cadastro deste protocolo no banco de dados', 41, 166),
(298, '2021-10-28', 'Realizado o cadastro deste protocolo no banco de dados', 41, 167),
(299, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 168),
(300, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 169),
(301, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 170),
(302, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 171),
(303, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 16, 172),
(304, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 173),
(305, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 174),
(306, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 175),
(307, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 176),
(308, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 177),
(309, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 178),
(310, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 16, 179),
(311, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 16, 180),
(312, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 16, 181),
(313, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 182),
(316, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 183),
(317, '2021-10-29', 'Realizado o cadastro deste protocolo no banco de dados', 41, 184),
(318, '2021-11-03', 'Realizado alteração deste protocolo no banco de dados', 41, 184),
(319, '2021-11-03', 'Realizado alteração deste protocolo no banco de dados', 41, 181),
(320, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 16, 185),
(321, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 16, 186),
(322, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 41, 187),
(323, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 16, 188),
(324, '2021-11-03', 'Realizado alteração deste protocolo no banco de dados', 41, 187),
(325, '2021-11-03', 'Realizado alteração deste protocolo no banco de dados', 41, 187),
(326, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 16, 189),
(327, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 41, 190),
(328, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 41, 191),
(329, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 41, 192),
(330, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 16, 193),
(331, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 41, 194),
(332, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 41, 195),
(333, '2021-11-03', 'Realizado alteração deste protocolo no banco de dados', 41, 195),
(334, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 26, 196),
(335, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 41, 197),
(336, '2021-11-03', 'Realizado alteração deste protocolo no banco de dados', 16, 196),
(337, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 16, 198),
(338, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 16, 199),
(339, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 16, 200),
(340, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 41, 201),
(341, '2021-11-03', 'Realizado o cadastro deste protocolo no banco de dados', 41, 202),
(342, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 203),
(343, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 204),
(344, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 26, 205),
(345, '2021-11-04', 'Realizado alteração deste protocolo no banco de dados', 26, 205),
(346, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 206),
(347, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 207),
(348, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 208),
(349, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 209),
(350, '2021-11-04', 'Realizado alteração deste protocolo no banco de dados', 41, 189),
(351, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 210),
(352, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 211),
(353, '2021-11-04', 'Realizado alteração deste protocolo no banco de dados', 41, 211),
(354, '2021-11-04', 'Realizado alteração deste protocolo no banco de dados', 41, 53),
(355, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 212),
(356, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 213),
(357, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 214),
(358, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 215),
(359, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 216),
(360, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 217),
(361, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 218),
(362, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 219),
(363, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 220),
(364, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 221),
(365, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 222),
(366, '2021-11-04', 'Realizado alteração deste protocolo no banco de dados', 41, 2),
(367, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 16, 223),
(368, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 224),
(369, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 225),
(370, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 26, 226),
(371, '2021-11-04', 'Realizado alteração deste protocolo no banco de dados', 41, 138),
(372, '2021-11-04', 'Realizado o cadastro deste protocolo no banco de dados', 41, 227),
(373, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 41, 228),
(374, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 41, 229),
(375, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 41, 230),
(376, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 16, 231),
(377, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 16, 232),
(378, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 16, 233),
(379, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 16, 234),
(380, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 41, 235),
(381, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 41, 236),
(382, '2021-11-05', 'Realizado alteração deste protocolo no banco de dados', 41, 48),
(383, '2021-11-05', 'Realizado alteração deste protocolo no banco de dados', 41, 48),
(384, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 41, 237),
(385, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 16, 238),
(386, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 16, 239),
(387, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 16, 240),
(388, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 41, 241),
(389, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 16, 242),
(390, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 41, 243),
(391, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 41, 244),
(392, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 16, 245),
(393, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 16, 246),
(394, '2021-11-05', 'Realizado o cadastro deste protocolo no banco de dados', 16, 247),
(395, '2021-11-05', 'Realizado alteração deste protocolo no banco de dados', 41, 96),
(396, '2021-11-05', 'Realizado alteração deste protocolo no banco de dados', 41, 96),
(397, '2021-11-05', 'Realizado alteração deste protocolo no banco de dados', 41, 97),
(398, '2021-11-05', 'Realizado alteração deste protocolo no banco de dados', 41, 98),
(399, '2021-11-08', 'Realizado alteração deste protocolo no banco de dados', 16, 240),
(400, '2021-11-08', 'Realizado alteração deste protocolo no banco de dados', 16, 240),
(401, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 16, 248),
(402, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 16, 249),
(403, '2021-11-08', 'Realizado alteração deste protocolo no banco de dados', 41, 99),
(404, '2021-11-08', 'Realizado alteração deste protocolo no banco de dados', 41, 99),
(405, '2021-11-08', 'Realizado alteração deste protocolo no banco de dados', 41, 99),
(406, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 250),
(407, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 16, 251),
(408, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 252),
(409, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 253),
(410, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 16, 254),
(411, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 255),
(412, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 16, 256),
(413, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 257),
(414, '2021-11-08', 'Realizado alteração deste protocolo no banco de dados', 41, 56),
(415, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 258),
(416, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 259),
(417, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 260),
(418, '2021-11-08', 'Realizado alteração deste protocolo no banco de dados', 41, 260),
(419, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 261),
(420, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 262),
(421, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 263),
(422, '2021-11-08', 'Realizado alteração deste protocolo no banco de dados', 41, 77),
(423, '2021-11-08', 'Realizado alteração deste protocolo no banco de dados', 41, 78),
(424, '2021-11-08', 'Realizado alteração deste protocolo no banco de dados', 41, 76),
(425, '2021-11-08', 'Realizado alteração deste protocolo no banco de dados', 41, 76),
(426, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 16, 264),
(427, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 16, 265),
(428, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 266),
(429, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 16, 267),
(430, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 268),
(431, '2021-11-08', 'Realizado o cadastro deste protocolo no banco de dados', 41, 269),
(432, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 270),
(433, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 271),
(434, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 26, 272),
(435, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 273),
(436, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 274),
(437, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 275),
(438, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 276),
(439, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 277),
(440, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 278),
(441, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 279),
(442, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 280),
(443, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 281),
(444, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 282),
(445, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 283),
(446, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 284),
(447, '2021-11-09', 'Realizado alteração deste protocolo no banco de dados', 41, 214),
(448, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 285),
(449, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 286),
(450, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 287),
(451, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 288),
(452, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 289),
(453, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 290),
(454, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 291),
(455, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 292),
(456, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 293),
(457, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 294),
(458, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 295),
(459, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 16, 296),
(460, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 297),
(461, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 298),
(462, '2021-11-09', 'Realizado o cadastro deste protocolo no banco de dados', 41, 299),
(463, '2021-11-10', 'Realizado o cadastro deste protocolo no banco de dados', 26, 300),
(464, '2021-11-10', 'Realizado o cadastro deste protocolo no banco de dados', 16, 301),
(465, '2021-11-10', 'Realizado o cadastro deste protocolo no banco de dados', 16, 302),
(466, '2021-11-10', 'Realizado o cadastro deste protocolo no banco de dados', 16, 303),
(467, '2021-11-10', 'Realizado o cadastro deste protocolo no banco de dados', 16, 304),
(468, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 305),
(469, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 306),
(470, '2021-11-11', 'Realizado alteração deste protocolo no banco de dados', 22, 305),
(471, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 307),
(472, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 308),
(473, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 309),
(474, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 310),
(475, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 311),
(476, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 312),
(477, '2021-11-11', 'Realizado alteração deste protocolo no banco de dados', 1, 312),
(478, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 313),
(479, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 314),
(480, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 315),
(481, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 316),
(482, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 317),
(483, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 318),
(484, '2021-11-11', 'Realizado alteração deste protocolo no banco de dados', 41, 318),
(485, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 319),
(486, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 320),
(487, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 321),
(488, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 322),
(489, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 323),
(490, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 324),
(491, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 325),
(492, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 326),
(493, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 327),
(494, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 328),
(495, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 329),
(496, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 330),
(497, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 331),
(498, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 332),
(499, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 333),
(500, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 334),
(501, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 335),
(502, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 336),
(503, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 337),
(504, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 22, 338),
(505, '2021-11-11', 'Realizado alteração deste protocolo no banco de dados', 22, 338),
(506, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 339),
(507, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 340),
(508, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 341),
(509, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 342),
(510, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 343),
(511, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 344),
(512, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 345),
(513, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 346),
(514, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 347),
(515, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 348),
(516, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 16, 349),
(517, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 350),
(518, '2021-11-11', 'Realizado alteração deste protocolo no banco de dados', 41, 350),
(519, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 351),
(520, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 352),
(521, '2021-11-11', 'Realizado o cadastro deste protocolo no banco de dados', 41, 353),
(522, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 354),
(523, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 355),
(524, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 41, 356),
(525, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 357),
(526, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 358),
(527, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 359),
(528, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 360),
(529, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 16, 361),
(530, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 41, 362),
(531, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 363),
(532, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 16, 364),
(533, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 41, 365),
(534, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 366),
(535, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 16, 367),
(536, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 368),
(537, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 41, 369),
(538, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 370),
(539, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 371),
(540, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 372),
(541, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 373),
(542, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 374),
(543, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 375),
(544, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 376),
(545, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 377),
(546, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 378),
(547, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 379),
(548, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 380),
(550, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 382),
(551, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 383),
(552, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 384),
(553, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 385),
(554, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 386),
(555, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 387),
(556, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 388),
(557, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 389),
(558, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 390),
(559, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 391),
(560, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 392),
(561, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 393),
(562, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 22, 394),
(563, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 395),
(564, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 396),
(565, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 397),
(566, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 398),
(567, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 399),
(568, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 16, 400),
(569, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 16, 401),
(570, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 16, 402),
(571, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 403),
(572, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 404),
(573, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 405),
(574, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 406),
(575, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 407),
(576, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 408),
(577, '2021-11-12', 'Realizado o cadastro deste protocolo no banco de dados', 26, 409),
(578, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 410),
(579, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 411),
(580, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 412),
(581, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 413),
(582, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 414),
(583, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 415),
(584, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 416),
(585, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 417),
(586, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 418),
(587, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 419),
(588, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 420),
(589, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 421),
(590, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 422),
(591, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 423),
(592, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 424),
(593, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 425),
(594, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 426),
(595, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 427),
(596, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 428),
(597, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 429),
(598, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 430),
(599, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 431),
(600, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 432),
(601, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 433),
(602, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 434),
(603, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 435),
(604, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 436),
(605, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 437),
(606, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 22, 438),
(607, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 439),
(608, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 440),
(609, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 441),
(610, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 442),
(611, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 443),
(612, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 444),
(613, '2021-11-16', 'Realizado o cadastro deste protocolo no banco de dados', 16, 445),
(614, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 22, 446),
(615, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 22, 447),
(616, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 22, 448),
(617, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 16, 449),
(618, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 16, 450),
(619, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 16, 451),
(620, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 16, 452),
(621, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 16, 453),
(622, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 16, 454),
(623, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 16, 455),
(624, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 16, 456),
(625, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 16, 457),
(626, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 16, 458),
(627, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 16, 459),
(628, '2021-11-17', 'Realizado o cadastro deste protocolo no banco de dados', 16, 460),
(629, '2021-11-18', 'Realizado o cadastro deste protocolo no banco de dados', 16, 461),
(630, '2021-11-18', 'Realizado o cadastro deste protocolo no banco de dados', 16, 462),
(631, '2021-11-18', 'Realizado alteração deste protocolo no banco de dados', 16, 462),
(632, '2021-11-18', 'Realizado o cadastro deste protocolo no banco de dados', 16, 463),
(633, '2021-11-18', 'Realizado o cadastro deste protocolo no banco de dados', 16, 464),
(634, '2021-11-18', 'Realizado o cadastro deste protocolo no banco de dados', 16, 465),
(635, '2021-11-18', 'Realizado o cadastro deste protocolo no banco de dados', 16, 466),
(636, '2021-11-18', 'Realizado o cadastro deste protocolo no banco de dados', 16, 467),
(637, '2021-11-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 468),
(638, '2021-11-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 469),
(639, '2021-11-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 470),
(640, '2021-11-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 471),
(641, '2021-11-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 472),
(642, '2021-11-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 473),
(643, '2021-11-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 474),
(644, '2021-11-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 475),
(645, '2021-11-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 476),
(646, '2021-11-19', 'Realizado o cadastro deste protocolo no banco de dados', 16, 477),
(647, '2021-11-22', 'Foi realizada a ação no dia 19/11/2021 e feito o Relatório de nº 043/2021 para registro', 40, 52),
(648, '2021-11-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 478),
(649, '2021-11-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 479),
(650, '2021-11-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 480),
(651, '2021-11-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 481),
(652, '2021-11-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 482),
(653, '2021-11-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 483),
(654, '2021-11-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 484),
(655, '2021-11-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 485),
(656, '2021-11-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 486),
(657, '2021-11-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 487),
(658, '2021-11-22', 'Realizado o cadastro deste protocolo no banco de dados', 16, 488),
(659, '2021-11-23', 'Realizado alteração deste protocolo no banco de dados', 41, 480),
(660, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 489),
(661, '2021-11-23', 'Realizado alteração deste protocolo no banco de dados', 41, 482),
(662, '2021-11-23', 'Realizado alteração deste protocolo no banco de dados', 41, 482),
(663, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 490),
(664, '2021-11-23', 'Realizado alteração deste protocolo no banco de dados', 41, 484),
(665, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 491),
(666, '2021-11-23', 'Realizado alteração deste protocolo no banco de dados', 16, 491),
(667, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 492),
(668, '2021-11-23', 'Realizado alteração deste protocolo no banco de dados', 41, 484),
(669, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 493),
(670, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 494),
(671, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 495),
(672, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 22, 496),
(673, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 41, 497),
(674, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 22, 498),
(675, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 499),
(676, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 22, 500),
(677, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 501),
(678, '2021-11-23', 'Realizado alteração deste protocolo no banco de dados', 41, 497),
(679, '2021-11-23', 'Realizado alteração deste protocolo no banco de dados', 41, 485),
(680, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 502);
INSERT INTO `protocolo_historico` (`id`, `data`, `descricao`, `usuario_id`, `protocolo_id`) VALUES
(681, '2021-11-23', 'Realizado alteração deste protocolo no banco de dados', 41, 485),
(682, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 503),
(683, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 22, 504),
(684, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 22, 505),
(685, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 22, 506),
(686, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 507),
(687, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 508),
(688, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 509),
(689, '2021-11-23', 'Realizado alteração deste protocolo no banco de dados', 16, 509),
(690, '2021-11-23', 'Realizado o cadastro deste protocolo no banco de dados', 16, 510),
(691, '2021-11-23', 'Realizado alteração deste protocolo no banco de dados', 16, 510),
(692, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 22, 511),
(693, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 22, 512),
(694, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 22, 513),
(695, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 22, 514),
(696, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 16, 515),
(697, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 16, 516),
(698, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 22, 517),
(699, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 22, 518),
(700, '2021-11-24', 'Realizado alteração deste protocolo no banco de dados', 22, 518),
(701, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 16, 519),
(702, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 22, 520),
(703, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 22, 521),
(704, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 16, 522),
(705, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 16, 523),
(706, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 22, 524),
(707, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 22, 525),
(709, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 16, 527),
(712, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 16, 530),
(713, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 23, 531),
(715, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 22, 532),
(716, '2021-11-24', 'Realizado alteração deste protocolo no banco de dados', 22, 532),
(717, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 22, 533),
(718, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 35, 534),
(719, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 35, 535),
(720, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 16, 536),
(721, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 16, 537),
(722, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 16, 538),
(723, '2021-11-24', 'Realizado o cadastro deste protocolo no banco de dados', 23, 539),
(724, '2021-11-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 540),
(725, '2021-11-25', 'Realizado alteração deste protocolo no banco de dados', 16, 540),
(726, '2021-11-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 541),
(727, '2021-11-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 542),
(728, '2021-11-25', 'Realizado o cadastro deste protocolo no banco de dados', 41, 543),
(729, '2021-11-25', 'Realizado o cadastro deste protocolo no banco de dados', 41, 544),
(730, '2021-11-25', 'Realizado alteração deste protocolo no banco de dados', 41, 544),
(731, '2021-11-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 545),
(732, '2021-11-25', 'Realizado o cadastro deste protocolo no banco de dados', 16, 546),
(733, '2021-11-25', 'Realizado o cadastro deste protocolo no banco de dados', 41, 547),
(734, '2021-11-25', 'Realizado o cadastro deste protocolo no banco de dados', 23, 548),
(735, '2021-11-25', 'Realizado o cadastro deste protocolo no banco de dados', 41, 549),
(736, '2021-11-26', 'Realizado o cadastro deste protocolo no banco de dados', 16, 550),
(737, '2021-11-26', 'Realizado o cadastro deste protocolo no banco de dados', 41, 551),
(738, '2021-11-26', 'Realizado o cadastro deste protocolo no banco de dados', 16, 552),
(739, '2021-11-26', 'Realizado o cadastro deste protocolo no banco de dados', 16, 553),
(740, '2021-11-26', 'Realizado alteração deste protocolo no banco de dados', 23, 246),
(741, '2021-11-26', 'Realizado o cadastro deste protocolo no banco de dados', 16, 554),
(742, '2021-11-29', 'Realizado alteração deste protocolo no banco de dados', 1, 2),
(746, '2021-12-09', 'Realizado o cadastro deste protocolo no banco de dados', 1, 555);

-- --------------------------------------------------------

--
-- Estrutura da tabela `protocolo_objetivo`
--

CREATE TABLE `protocolo_objetivo` (
  `id` int(10) UNSIGNED NOT NULL,
  `objetivo` varchar(100) DEFAULT NULL,
  `tipo_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `protocolo_objetivo`
--

INSERT INTO `protocolo_objetivo` (`id`, `objetivo`, `tipo_id`) VALUES
(1, 'Carta Consulta', 1),
(2, 'Comunicado', 1),
(3, 'Convite', 1),
(4, 'Denuncia', 1),
(5, 'Devolução', 1),
(6, 'Documento', 1),
(7, 'Encaminhamento', 1),
(8, 'Informação', 1),
(9, 'Informativo', 1),
(10, 'Juntada de Documento', 1),
(11, 'Memorando', 1),
(12, 'Ofício', 1),
(13, 'Ofício Circular', 1),
(14, 'Recurso Auto de Infração', 1),
(15, 'Recurso Penalidade Imposta', 1),
(16, 'Requerimento', 1),
(17, 'Reunião', 1),
(18, 'Solicitação', 1),
(19, 'Autorização de Supressão Vegetal - ASV', 2),
(20, 'Evento Temporário', 2),
(21, 'Licença Ambiental Rural - LAR', 2),
(22, 'Licença de Instalação - LI', 2),
(23, 'Licença de Instalação E Licença De Operação - LIO', 2),
(24, 'Licença de Operação - LO', 2),
(25, 'Licença de Prévia e Licença de Instalação - LP/LI', 2),
(26, 'Licença Prévia - LP', 2),
(27, 'Processo Administrativo Punitivo - PAP', 2),
(28, 'Renovação De Licença De Operação - RLO', 2),
(29, 'Doação de Madeira', 2),
(30, 'Solicitação de Declaração de Tramite', 1),
(31, 'Autorização de Funcionamento - AF', 2),
(32, 'Solicitação de Poda ou Corte', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `protocolo_tipo`
--

CREATE TABLE `protocolo_tipo` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `protocolo_tipo`
--

INSERT INTO `protocolo_tipo` (`id`, `tipo`) VALUES
(1, 'Documento'),
(2, 'Processo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `setor`
--

CREATE TABLE `setor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `abreviacao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `setor`
--

INSERT INTO `setor` (`id`, `nome`, `abreviacao`) VALUES
(1, 'Coordenadoria de Proteção dos Recursos Naturais e Educação\r\nAmbiental', 'CPRN'),
(2, 'Coordenadoria de Gestão Administrativa e Financeira', 'COAF'),
(3, 'Coordenadoria de Licenciamento Ambiental', 'CLA'),
(4, 'Coordenadoria de Fiscalização Ambiental', 'COFISC'),
(5, 'Assessoria Jurídica', 'ASJUR'),
(6, 'Arquivos da Secretária', 'ARQUIVO'),
(7, 'Protocolo da Secretária', 'PROTOCOLO'),
(8, 'Assessoria Técnica e de Estudos legislativos', 'ASTEC'),
(9, 'Secretário de Meio Ambiente', 'GABINETE'),
(10, 'Assessoria de Tecnologia da Informação e de Geotecnologia', 'ASTIGEO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ti_chamado`
--

CREATE TABLE `ti_chamado` (
  `id` int(10) UNSIGNED NOT NULL,
  `setor_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `assunto_id` int(10) UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `anexo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ti_chamado`
--

INSERT INTO `ti_chamado` (`id`, `setor_id`, `usuario_id`, `status_id`, `assunto_id`, `data`, `descricao`, `anexo`) VALUES
(9, 1, 27, 4, 17, '2021-10-13', 'Solicitado manutenção no notebook da coordenação.', ''),
(10, 1, 27, 4, 17, '2021-10-13', 'Solicitado manutenção no notebook do servidor Weden Lobo.', ''),
(11, 1, 27, 4, 19, '2021-10-13', 'Solicitado o puxamento cabeamento de rede para o notebook da cordenação.', ''),
(12, 1, 27, 4, 21, '2021-10-15', 'Solicitado o uso do drone e apoio da assessoria para uma atividade externa. ', ''),
(13, 7, 16, 4, 16, '2021-10-19', 'VERIFICAÇÃO DE COMPUTADOR ATUALIZANDO O SISTEMA OPERACIONAL. ', ''),
(14, 1, 27, 4, 16, '2021-10-19', 'INSTALAÇÃO DE DATA SHOW NO SETOR CPRN ', ''),
(15, 2, 25, 4, 16, '2021-10-20', 'MANUTENÇÃO DE REDE DA IMPRESSORA ', ''),
(18, 10, 1, 4, 9, '2021-10-20', 'Troca dos roteadores na secretaria.', ''),
(19, 1, 27, 4, 17, '2021-10-20', 'Solicitado a manutenção no notebook pessoal utilizado em campo.', ''),
(20, 4, 20, 4, 12, '2021-10-21', 'CRIAÇÃO DE USUARIO NOVO NO SETOR ', ''),
(21, 10, 1, 2, 20, '2021-10-25', 'Criação das artes do crachá de todos os servidores da secretaria.', ''),
(22, 3, 35, 4, 12, '2021-10-26', 'criação de nova senha de usuário ', ''),
(23, 1, 27, 4, 17, '2021-10-26', 'COMPUTADOR COM DEFEITO ', ''),
(24, 2, 24, 4, 14, '2021-10-26', 'MANUNTENÇÃO DE IMPRESSORA ', ''),
(25, 4, 23, 4, 9, '2021-10-27', 'INSTALACAO DE IMPRESSORA ', ''),
(26, 1, 27, 4, 18, '2021-10-29', 'instalação de softwares', ''),
(27, 1, 40, 4, 10, '2021-11-04', 'INSTALAÇÃO DO CAR ', ''),
(28, 3, 41, 4, 14, '2021-11-04', 'recarga de tintas ', ''),
(29, 4, 33, 4, 14, '2021-11-04', 'Recarga de tinta na impressora. ', ''),
(30, 3, 41, 1, 22, '2021-11-04', 'Atribuir verificação de protocolo registrado no sistema e informar no ato do cadastro se o protocolo já está cadastrado.', ''),
(31, 10, 1, 4, 22, '2021-11-04', 'Corrigir as datas do suporte interno, está apresentando de forma incorreta.', ''),
(32, 3, 32, 4, 10, '2021-11-12', 'Mudança de computador entre coordenação. saiu do cprn foi para cla utilizado por Elys Torres', ''),
(33, 6, 38, 4, 9, '2021-11-12', 'Scanner não funcionando.', ''),
(34, 1, 40, 4, 9, '2021-11-12', 'Impressora não funcionando.', ''),
(35, 1, 40, 4, 10, '2021-11-12', 'não da imagem', ''),
(36, 10, 1, 4, 15, '2021-11-12', 'backup de arquivo do servidor', ''),
(37, 3, 32, 4, 19, '2021-11-12', 'Necessita puxar um cabo de rede para elys', ''),
(38, 1, 27, 4, 12, '2021-11-12', 'desativar usuário do servidor de arquivo e no sispam\r\n', ''),
(39, 3, 32, 4, 11, '2021-11-12', 'restrição de acesso ao CPRN e libera CLA para servidora Elys.', ''),
(40, 10, 1, 1, 22, '2021-11-12', 'painel de buscar no suporte interno com problema', ''),
(41, 1, 40, 4, 23, '2021-11-12', 'solicitou um mouse', ''),
(42, 5, 30, 4, 11, '2021-11-12', 'Exibir unidade de rede cla no usuario logado.', ''),
(43, 3, 32, 4, 23, '2021-11-17', 'Necessidade de um cabo VGA é filtro de linha', ''),
(44, 1, 42, 4, 20, '2021-11-19', 'Criação de  placa \\\'não jogue lixo\\\'', ''),
(45, 2, 24, 4, 18, '2021-11-19', 'adobe photoshop 2021', ''),
(46, 3, 32, 4, 17, '2021-11-19', 'Maquina não está ligando.', ''),
(47, 4, 22, 4, 9, '2021-11-19', 'impressora com problema.', ''),
(48, 4, 34, 4, 17, '2021-11-29', 'Solicitado formatação na maquina.', ''),
(49, 4, 23, 4, 14, '2021-11-29', 'Impressora falhando na impressão de documentos', ''),
(50, 4, 23, 1, 18, '2022-01-03', 'Não conseguir abrir o programa de editor de texto Text Marker', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ti_chamado_assunto`
--

CREATE TABLE `ti_chamado_assunto` (
  `id` int(10) UNSIGNED NOT NULL,
  `assunto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ti_chamado_assunto`
--

INSERT INTO `ti_chamado_assunto` (`id`, `assunto`) VALUES
(9, 'Instalação, configuração ou remoção da impressora em rede'),
(10, 'Instalação, atualização ou remoção de computador'),
(11, 'Permissão ou restrinção de acesso a arquivos'),
(12, 'Criação, alteração ou desativação de usuário'),
(13, 'Recuperação de arquivo'),
(14, 'Recarga de tinta ou tone da impressora'),
(15, 'Backup de arquivos'),
(16, 'Outros'),
(17, 'Manutenção em computadores'),
(18, 'Instalação, configuração e desinstalação de \r\nsoftwares'),
(19, 'Manutenção na infraestrutura da rede'),
(20, 'Criação e edição de artes gráficas'),
(21, 'Utilização do drone em atividades'),
(22, 'SISPAM'),
(23, 'Instalação, troca ou remoção de Periférico');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ti_chamado_historico`
--

CREATE TABLE `ti_chamado_historico` (
  `id` int(11) NOT NULL,
  `chamado_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `anexo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ti_chamado_historico`
--

INSERT INTO `ti_chamado_historico` (`id`, `chamado_id`, `status_id`, `usuario_id`, `data`, `descricao`, `anexo`) VALUES
(5, 9, 4, 1, '2021-10-13', 'Manutenção realizada com sucesso.', ''),
(7, 11, 4, 1, '2021-10-13', 'Cabeamento adicionado com sucesso.', ''),
(8, 10, 4, 1, '2021-10-13', 'Manutenção realizada com sucesso.', ''),
(9, 14, 4, 15, '0000-00-00', 'FINALIZADO', ''),
(10, 13, 4, 15, '0000-00-00', 'FINALIZADO', ''),
(11, 15, 4, 15, '0000-00-00', 'MANUTENÇÃO NA REDE A IMPRESSORA CORRIGIDA COM SUCESSO !', ''),
(12, 18, 4, 1, '2021-10-19', 'Foi realizado a troca e configuração dos roteadores da secretaria. ', ''),
(13, 19, 4, 1, '2021-10-21', 'Manutenção realizada com sucesso', ''),
(14, 12, 4, 1, '2021-10-15', 'Foi realizado a participação da assessoria no evento, juntamente com o uso do drone.  ', ''),
(15, 20, 1, 15, '0000-00-00', 'CRIAÇÃO DE USUARIO NOVO NO SETOR ', ''),
(16, 20, 4, 15, '0000-00-00', 'CRIAÇÃO DE USUARIO NO SETOR!\r\n RONALDO O NOME DO NOVO USUARIO.', ''),
(17, 22, 4, 15, '0000-00-00', 'finalização concluída !', ''),
(18, 25, 4, 15, '0000-00-00', 'INSTALACAO DE IMPRESSORA ', ''),
(19, 24, 4, 1, '0000-00-00', 'Impressora estava desconectada da rede.', ''),
(22, 23, 4, 1, '0000-00-00', 'Manutenção e instalação de softwares, atribuído nome no computador de cprn-06.', ''),
(23, 27, 4, 15, '0000-00-00', 'finalizado ', ''),
(24, 28, 4, 15, '0000-00-00', 'finalizado ', ''),
(25, 26, 4, 1, '2021-10-29', 'instalação do software CAR realizada no computador da elys', ''),
(26, 29, 4, 1, '0000-00-00', 'Realizado.', ''),
(27, 39, 4, 1, '0000-00-00', 'adicionado  permissão de acesso ao cla', ''),
(28, 38, 4, 1, '0000-00-00', 'feito', ''),
(30, 37, 4, 1, '0000-00-00', 'feito', ''),
(32, 36, 4, 1, '0000-00-00', 'feito', ''),
(33, 35, 4, 1, '0000-00-00', 'trocou os cabos e volto ao normal', ''),
(34, 34, 4, 1, '0000-00-00', 'resolvido', ''),
(35, 33, 4, 1, '0000-00-00', 'mudança do diretório', ''),
(36, 32, 4, 1, '0000-00-00', 'feito', ''),
(37, 41, 4, 1, '0000-00-00', 'mouse entregue ao servidor weden', ''),
(38, 42, 4, 1, '0000-00-00', 'feito', ''),
(39, 43, 4, 1, '0000-00-00', 'Foi realizado a troca do cabo VGA e filtro de linha.', ''),
(42, 44, 4, 1, '0000-00-00', 'Arte criada e enviada para grafica, coordenações cprn e coaf', ''),
(43, 47, 4, 1, '0000-00-00', 'Problema na atualização do windows, correção realizada.', ''),
(44, 45, 4, 1, '0000-00-00', 'instalação realizada', ''),
(45, 46, 4, 1, '0000-00-00', 'Realizado limpeza no gabinete e voltou a funcionar', ''),
(46, 48, 4, 1, '2021-11-26', 'Realizado', ''),
(49, 31, 4, 1, '2021-11-29', 'Correção realizada', ''),
(50, 21, 2, 1, '2021-11-29', 'Artes em desenvolvimento', ''),
(51, 21, 2, 1, '2021-11-29', 'Aguardando liberação do empenho para enviar para gráfica.', ''),
(52, 49, 4, 1, '2021-11-29', 'Limpeza do cabeçote realizado. ', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ti_chamado_status`
--

CREATE TABLE `ti_chamado_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ti_chamado_status`
--

INSERT INTO `ti_chamado_status` (`id`, `nome`) VALUES
(1, 'Aguardando o Suporte'),
(2, 'Em Andamento'),
(3, 'Cancelado'),
(4, 'Finalizado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tramitacao`
--

CREATE TABLE `tramitacao` (
  `id` int(10) UNSIGNED NOT NULL,
  `protocolo_id` int(10) UNSIGNED NOT NULL,
  `setor_remetente_id` int(10) UNSIGNED NOT NULL,
  `usuario_remetente_id` int(10) UNSIGNED NOT NULL,
  `setor_destinatario_id` int(10) UNSIGNED NOT NULL,
  `usuario_destinatario_id` int(10) UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `anexo` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tramitacao`
--

INSERT INTO `tramitacao` (`id`, `protocolo_id`, `setor_remetente_id`, `usuario_remetente_id`, `setor_destinatario_id`, `usuario_destinatario_id`, `data`, `descricao`, `anexo`, `status`) VALUES
(15, 9, 4, 20, 7, 16, '2021-10-13', 'SOLICITAÇÃO DE TABUAS PARA USO NAS MONTAGENS DO PROJETO QUERIDO NATAL.', '', NULL),
(16, 12, 7, 16, 4, 20, '2021-10-13', 'DENUNCIA REFERENTE A QUEIMADA ', '', NULL),
(17, 13, 7, 16, 3, 26, '2021-10-13', 'JUNTADA DA VIALE AUTOMOVEIS ,REFERENTE A CONDICIONANTES DA LICENÇA DE OPERAÇÃO N:0027/2021 REQUERIDA NO PROCESSO N:875/2018', '', NULL),
(18, 10, 7, 16, 2, 25, '2021-10-13', '', '', NULL),
(19, 15, 4, 23, 5, 28, '2021-10-13', 'Documentação não se encontra em nossa Coordenadoria.', '', NULL),
(28, 20, 7, 16, 3, 26, '2021-10-14', 'ATENDIMENTO DE CONDICIONANTE DA LICENÇA PREVIA N:004/2021 E LICENÇA DE INSTALAÇÃO N:007/2021 DO PROCESSO N:0024/2021', '', NULL),
(29, 24, 7, 16, 4, 20, '2021-10-14', 'ENTREGA VOLUNTARIA DE UM PAPAGAIO', '', NULL),
(31, 43, 7, 16, 3, 26, '2021-10-14', 'PUBLICAÇÃO NO DIARIO E COMPROVANTE DE TAXA ', '', NULL),
(32, 44, 7, 16, 3, 32, '2021-10-14', 'COMPROVANTE DE TAXA DAM ENVIADO POR EMAIL', '', NULL),
(33, 45, 7, 16, 2, 25, '2021-10-14', 'RESPOSTA AO OFICIO DE N:284/2021-MP PARA ARQUIVAMENTO', '', NULL),
(35, 48, 7, 16, 3, 32, '2021-10-14', 'LICENÇA DE OPERAÇÃO -LO', '', NULL),
(36, 46, 7, 16, 3, 32, '2021-10-14', '', '', NULL),
(37, 45, 2, 25, 4, 23, '2021-10-14', 'Resposta ao Ofício nº 284/2021-MP/6ªPJC para arquivamento.', 'NÃO MOVIDO', NULL),
(38, 75, 7, 16, 4, 23, '2021-10-19', 'OFICIO 377/2021', 'NÃO MOVIDO', NULL),
(39, 75, 4, 23, 3, 32, '0000-00-00', 'FOI REALIZADO DESPACHO NESTA DATA POIS A COMPETENCIA DE RESPOSTA E DA COORDENADORIA CLA.', 'NÃO MOVIDO', NULL),
(41, 76, 7, 16, 3, 32, '2021-10-20', '', 'NÃO MOVIDO', NULL),
(55, 104, 7, 16, 3, 32, '2021-10-22', 'PUBLICAÇÃO NO DIARIO E JORNAL AMAZONIA', 'NÃO MOVIDO', NULL),
(56, 105, 7, 16, 3, 32, '2021-10-22', 'PUBLICAÇÃO NO DIARIO E JORNAL AMAZONIA ', 'NÃO MOVIDO', NULL),
(57, 75, 3, 26, 2, 25, '2021-10-22', 'resposta do MP', 'NÃO MOVIDO', NULL),
(58, 122, 7, 16, 3, 32, '2021-10-22', 'requerimento de atendimento a condicionante n:077/2021', 'NÃO MOVIDO', NULL),
(59, 135, 7, 16, 4, 23, '2021-10-25', 'DOCUMENTOS PARA SER ANEXADO A DENUNCIA  DE PROTOCOLO DE N:01419/2021/DOC', 'NÃO MOVIDO', NULL),
(60, 136, 7, 16, 3, 32, '2021-10-25', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE N:00208/2021/PROC', 'NÃO MOVIDO', NULL),
(61, 137, 7, 16, 3, 32, '2021-10-25', 'JUNTADA DE DOCUMENTOS PARA SER ANEXADOS AO PROCESSO DE N:01746/2019', 'NÃO MOVIDO', NULL),
(63, 141, 7, 16, 3, 32, '2021-10-25', 'JUNTADA DE DOCUMENTO ', 'NÃO MOVIDO', NULL),
(64, 142, 7, 16, 3, 32, '2021-10-25', 'JUNTADA DE DOCUMENTOS N:1351/2019 COM RESPOSTA A NOTIFICAÇÃO N:063/2021', 'NÃO MOVIDO', NULL),
(65, 143, 7, 16, 3, 32, '2021-10-25', 'DECLARAÇÃO DE TRAMITE', 'NÃO MOVIDO', NULL),
(66, 144, 7, 16, 2, 25, '2021-10-25', '', 'NÃO MOVIDO', NULL),
(67, 144, 2, 25, 3, 32, '2021-10-25', 'PARA MANIFESTAÇÃO', 'NÃO MOVIDO', NULL),
(68, 146, 7, 16, 2, 25, '2021-10-25', 'oficio de n:250/2021-gab', 'NÃO MOVIDO', NULL),
(69, 147, 7, 16, 2, 25, '2021-10-25', 'oficio de n:258/2021-gab', 'NÃO MOVIDO', NULL),
(70, 145, 7, 16, 4, 23, '2021-10-25', 'denuncia referente a maus tratos ,', 'NÃO MOVIDO', NULL),
(71, 148, 7, 16, 2, 25, '2021-10-26', 'convite enviado por email', 'NÃO MOVIDO', NULL),
(72, 151, 7, 16, 5, 30, '2021-10-26', 'resposta de notificação de n:086/2021/semma', 'NÃO MOVIDO', NULL),
(73, 152, 7, 16, 2, 25, '2021-10-26', 'CONVITE,SOB OFICIO DE N:055/2021', 'NÃO MOVIDO', NULL),
(74, 153, 7, 16, 2, 25, '2021-10-26', 'ENTREGA DA REVITALIZAÇÃO DO CRAS JADERLANDIA ,OFICIO DE N:267/2021-GAB', 'NÃO MOVIDO', NULL),
(75, 154, 7, 16, 2, 25, '2021-10-26', 'OFICIO DE N:300/2021-GABINETE', 'NÃO MOVIDO', NULL),
(76, 155, 7, 16, 2, 25, '2021-10-26', 'OFICIO DE N:276/2021-GAB/ CONVITE /REDIFICAR A DATA', 'NÃO MOVIDO', NULL),
(77, 156, 7, 16, 2, 25, '2021-10-26', 'CANCELAMENTO DE PEDIDO DE LICENÇA ', 'NÃO MOVIDO', NULL),
(78, 157, 7, 16, 3, 32, '2021-10-26', 'COMPROVANTE DE TAXA DE ASV ', 'NÃO MOVIDO', NULL),
(81, 159, 7, 16, 2, 25, '2021-10-27', 'memorando de n:157/2021/cla/semma-pmc orientação juridica da certidão de uso e ocupação do solo para fins de instrução do processo', 'NÃO MOVIDO', NULL),
(82, 160, 7, 16, 2, 25, '2021-10-27', 'OFICIO DE N:103/2021/IMV SOLICITAÇÃO DE TENDA ', 'NÃO MOVIDO', NULL),
(83, 159, 2, 25, 3, 26, '2021-10-27', 'PARA CONHECIMENTO', 'NÃO MOVIDO', NULL),
(84, 156, 2, 25, 3, 41, '2021-10-27', 'PARA MANIFESTAÇÃO', 'NÃO MOVIDO', NULL),
(85, 154, 2, 25, 1, 40, '2021-10-27', 'PARA PROVIDÊNCIAS', 'NÃO MOVIDO', NULL),
(86, 155, 2, 25, 1, 40, '2021-10-27', 'PARA PARTICIPAÇÃO', 'NÃO MOVIDO', NULL),
(87, 155, 2, 25, 4, 23, '2021-10-27', 'PARA PARTICIPAÇÃO', 'NÃO MOVIDO', NULL),
(88, 155, 2, 25, 3, 41, '2021-10-27', 'PARA PARTICIPAÇÃO', 'NÃO MOVIDO', NULL),
(89, 153, 2, 25, 1, 40, '2021-10-27', 'PARA PARTICIPAÇÃO', 'NÃO MOVIDO', NULL),
(90, 153, 2, 25, 3, 41, '2021-10-27', 'PARA PARTICIPAÇÃO', 'NÃO MOVIDO', NULL),
(91, 153, 2, 25, 4, 23, '2021-10-27', 'PARA PARTICIPAÇÃO', 'NÃO MOVIDO', NULL),
(92, 160, 2, 25, 1, 40, '2021-10-28', 'PARA VERIFICAR A POSSIBILIDADE DO EMPRÉSTIMO.\r\nA FACULDADE DE VETERINÁRIA É UMA GRANDE PARCEIRA.', 'NÃO MOVIDO', NULL),
(93, 146, 2, 25, 3, 32, '2021-10-26', '', 'NÃO MOVIDO', NULL),
(94, 161, 7, 16, 3, 32, '2021-10-28', 'asv no condomino campo belo', 'NÃO MOVIDO', NULL),
(95, 162, 7, 16, 3, 32, '2021-10-28', 'alteração de documentos referente ao proc: n:00054/2021/proc', 'NÃO MOVIDO', NULL),
(96, 163, 7, 16, 2, 25, '2021-10-28', 'OFICIO N:008/2021', 'NÃO MOVIDO', NULL),
(97, 163, 2, 25, 1, 40, '2021-10-28', 'PARA PROVIDÊNCIAS.', 'NÃO MOVIDO', NULL),
(98, 172, 7, 16, 4, 23, '2021-10-29', 'DENUNCIA REFERENTE A POLIÇÃO ATMOSFERICA', 'NÃO MOVIDO', NULL),
(99, 179, 7, 16, 4, 23, '2021-10-29', 'DENUNCIA REFERENTE A MAUS TRATOS ', 'NÃO MOVIDO', NULL),
(100, 180, 7, 16, 2, 25, '2021-10-29', 'memorando de n:505/2021-licitação ', 'NÃO MOVIDO', NULL),
(101, 181, 7, 16, 3, 32, '2021-10-29', 'LICENÇA DE OPERAÇÃO -LO', 'NÃO MOVIDO', NULL),
(102, 188, 7, 16, 2, 25, '2021-11-03', 'oficio de n:01/2021 evento encontro de çães', 'NÃO MOVIDO', NULL),
(103, 186, 7, 16, 3, 32, '2021-11-03', 'consulta kj representaçoes', 'NÃO MOVIDO', NULL),
(104, 185, 7, 16, 3, 32, '2021-11-03', 'documentos de comprovoção das publicações atendimento a condicionante prevista na conama n:006/86', 'NÃO MOVIDO', NULL),
(105, 189, 7, 16, 3, 32, '2021-11-03', 'LICENÇA DE OPERAÇÃO PARA ATIVIDADE DE SERVIÇOS AUTOMOTIVOS ', 'NÃO MOVIDO', NULL),
(106, 193, 7, 16, 4, 23, '2021-11-03', 'EM ATENÇÃO AO MEMORANDO DE N:151/2021/COFISC/SEMMA-PMC REF: AO AUTO DE INFRAÇÃO 013/2021 MARIA FERREIRA DA LUZ\r\n', 'NÃO MOVIDO', NULL),
(107, 200, 7, 16, 3, 32, '2021-11-03', 'SUPRESSÃO VEGETAL -ASV ', 'NÃO MOVIDO', NULL),
(108, 198, 7, 16, 3, 32, '2021-11-03', 'DECLARAÇÃO DE DISPENSA DE ORTOGA ', 'NÃO MOVIDO', NULL),
(109, 199, 7, 16, 3, 32, '2021-11-03', 'CONDICIONANTE DO PROCESSO N : 026/2018\r\n', 'NÃO MOVIDO', NULL),
(110, 203, 7, 16, 3, 32, '2021-11-04', 'ATENDIMENTO A CONDICIONANTE SOB O PROCESSO DE N:00151/2020', 'NÃO MOVIDO', NULL),
(111, 204, 7, 16, 3, 32, '2021-11-04', 'ATENDIMENTO A CONDICIONANTE SOB PROCESSO DE N:00151/2021', 'NÃO MOVIDO', NULL),
(112, 205, 3, 26, 2, 25, '2021-11-04', 'ATIVAR MINUTA DE NOTIFICAÇÃO', 'NÃO MOVIDO', NULL),
(113, 208, 7, 16, 5, 30, '2021-11-04', 'RESPOSTA DE NOTIFICAÇÃO SOB PROC:0065/2021', 'NÃO MOVIDO', NULL),
(114, 209, 7, 16, 5, 30, '2021-11-04', 'RESPOSTA DE NOTIFICAÇÃO SOB PROC:0065 E 0066/2021', 'NÃO MOVIDO', NULL),
(115, 210, 7, 16, 5, 30, '2021-11-04', 'NOTIFICAÇÃO JURIDICA DE N:080/2021 PARA COMPOR O PROCESSO DE N:0223/2020', 'NÃO MOVIDO', NULL),
(116, 223, 7, 16, 2, 25, '2021-11-04', 'OFICIO N:082/2021-P/3 SOLICITAÇÃO DA OPERAÇÃO SOSSEGO CASTANHAL', 'NÃO MOVIDO', NULL),
(117, 219, 2, 25, 3, 32, '2021-11-04', 'PAEA ANÁLISE E MANIFESTAÇÃO.\r\nOBS.: CONVERSAR COM O SECRETÁRIO', 'NÃO MOVIDO', NULL),
(118, 215, 2, 25, 4, 23, '2021-11-04', 'PARA ANÁLISE E MANIFESTAÇÃO', 'NÃO MOVIDO', NULL),
(119, 218, 2, 25, 4, 23, '2021-11-04', 'PARA ANÁLISE E MANIFESTAÇÃO', 'NÃO MOVIDO', NULL),
(120, 218, 7, 16, 2, 25, '2021-11-04', '', 'NÃO MOVIDO', NULL),
(121, 232, 7, 16, 3, 32, '2021-11-05', 'JUNTADA ,AO PROC; N: 0151/2020, PUBLICAÇÃO NO DIARIO OFICIAL', 'NÃO MOVIDO', NULL),
(122, 234, 7, 16, 3, 32, '2021-11-05', 'SOLICITAÇÃO DE PODA', 'NÃO MOVIDO', NULL),
(123, 238, 7, 16, 3, 32, '2021-11-05', 'RIA - RELATORIO DE INFORMAÇÃO AMBIENTAL ANUAL', 'NÃO MOVIDO', NULL),
(124, 239, 7, 16, 3, 32, '2021-11-05', 'PUBLICAÇÃO DOS JORNAIS ( PROCESSO 00243/2021)', 'NÃO MOVIDO', NULL),
(125, 240, 7, 16, 4, 23, '2021-11-05', 'SOLICITAÇÃO DE MADEIRA PARA CONFECCIONAR RAMPA PARA ACESSO A CADEIRANTES', 'NÃO MOVIDO', NULL),
(126, 242, 7, 16, 2, 25, '2021-11-05', 'SOLICITAÇÃO DE REPARO NA REDE ELETRICA DE IMOVEIS E ENVIO DA APOLICE', 'NÃO MOVIDO', NULL),
(127, 245, 7, 16, 4, 23, '2021-11-05', 'DENUNCIA ANONIMA ,REFERENTE  A MAUS TRATOS ', 'NÃO MOVIDO', NULL),
(128, 246, 7, 16, 4, 23, '2021-11-05', 'DENUNCIA REFERENTE A POLUIÇÃO AMBIENTAL', 'NÃO MOVIDO', NULL),
(129, 247, 7, 16, 2, 25, '2021-11-05', 'OFICIO DE N: 176/2021 ', 'NÃO MOVIDO', NULL),
(130, 242, 2, 25, 1, 40, '2021-11-05', 'PARA ANÁLISE E PROVIDÊNCIAS.', 'NÃO MOVIDO', NULL),
(131, 249, 7, 16, 2, 25, '2021-11-08', 'ASSEMBLEIA EXTRAORDINARIA DO FORUM NACIONAL DE GESTORE DE LIMPEZAURBANA E MANEJO DE RESIDUOS SOLIDOS \r\n', 'NÃO MOVIDO', NULL),
(133, 248, 7, 16, 3, 32, '2021-11-08', 'JUNTADA AO PROC:0722/2018 COM FINALIDADE DE INFORMA E SOLICITAR ORIENTAÇÃO SOBRE A SEGUINTE PROCEDIMENTO \r\n', 'NÃO MOVIDO', NULL),
(134, 251, 7, 16, 3, 32, '2021-11-08', 'AUTORIZAÇÃO PRA UMA ASV DA ROSANGELA DOS SANTOS COUTINHO\r\n', 'NÃO MOVIDO', NULL),
(135, 254, 7, 16, 3, 32, '2021-11-08', 'EM ATENÇÃO AO PROC DE N:01633/2018 REFERENTE A EMPRESA BACABA VEICULOS LTDA\r\n', 'NÃO MOVIDO', NULL),
(136, 256, 7, 16, 4, 23, '2021-11-08', 'DENUNCIA REFERENTE A POLUIÇÃO ATMOSFERICAMSOB O EMPREENDIMENTO,O FRANGO ASSADO\r\n', 'NÃO MOVIDO', NULL),
(137, 264, 7, 16, 3, 32, '2021-11-08', 'RESPOSTA DE NOTIFICAÇÃO 00120/2021/CLA \r\n', 'NÃO MOVIDO', NULL),
(138, 265, 7, 16, 3, 32, '2021-11-08', 'OFICO SOLICITANDO PRORROGAÇÃO DE PRAZO \r\n', 'NÃO MOVIDO', NULL),
(139, 249, 2, 25, 1, 40, '2021-11-08', 'PARA PARTICIPAÇÃO', 'NÃO MOVIDO', NULL),
(140, 267, 7, 16, 2, 25, '2021-11-08', 'OFICIO N:389/2021-MP\r\n', 'NÃO MOVIDO', NULL),
(141, 267, 2, 25, 4, 23, '2021-11-08', 'PARA ACOMPANHAMENTO', 'NÃO MOVIDO', NULL),
(142, 267, 2, 25, 8, 19, '2021-11-08', 'PARA ACOMPANHAMENTO.', 'NÃO MOVIDO', NULL),
(144, 271, 7, 16, 3, 32, '2021-11-09', 'LICENÇA PARA ATIVIDADE RURAL -LAR', 'NÃO MOVIDO', NULL),
(145, 270, 7, 16, 3, 32, '2021-11-09', 'COMPROVANTE DE TAXA PARA ASV', 'NÃO MOVIDO', NULL),
(146, 273, 7, 16, 3, 32, '2021-11-09', 'RIA- RELATORIO DE INFORMAÇÃO AMBIENTAL ANUAL REFERENTE AO ANO 2020/2021 REFERENTE A LICENÇA 031/2019 ,PROC:00222/2019\r\n', 'NÃO MOVIDO', NULL),
(147, 275, 7, 16, 2, 25, '2021-11-09', 'OFICIO DE N:404/2021/PMC/SEMADA', 'NÃO MOVIDO', NULL),
(148, 281, 7, 16, 2, 25, '2021-11-09', 'OFICIO DE N:395/2021/PMC/SEMADA\r\n', 'NÃO MOVIDO', NULL),
(149, 282, 7, 16, 2, 25, '2021-11-09', 'OFICIO DE N:529/2021- SECULT\r\n', 'NÃO MOVIDO', NULL),
(150, 284, 7, 16, 3, 32, '2021-11-09', 'SOLICITAÇÃO DE UMA ASV NO BAIRRO DO IPE ROXO\r\n', 'NÃO MOVIDO', NULL),
(151, 293, 7, 16, 2, 25, '2021-11-09', 'OFICIO DE N:246/2021/FMS\r\n', 'NÃO MOVIDO', NULL),
(152, 282, 2, 25, 1, 40, '2021-11-09', 'PARA AUTORIZAÇÃO', 'NÃO MOVIDO', NULL),
(153, 275, 2, 25, 1, 40, '2021-11-09', 'PARA INCLUSÃO', 'NÃO MOVIDO', NULL),
(154, 291, 7, 16, 3, 32, '2021-11-09', 'DECLARAÇÃO DE TRAMITE', 'NÃO MOVIDO', NULL),
(155, 292, 7, 16, 3, 32, '2021-11-09', 'DECLARAÇÃO DE TRAMITE', 'NÃO MOVIDO', NULL),
(156, 294, 7, 16, 2, 25, '2021-11-09', 'N: DE PROCESSO 2021/11/11682\r\n', 'NÃO MOVIDO', NULL),
(157, 295, 7, 16, 2, 25, '2021-11-09', 'N: PROCESSO 2021/11/11665\r\n', 'NÃO MOVIDO', NULL),
(158, 296, 7, 16, 2, 25, '2021-11-09', 'OFICIO DE N:053/2021- CRAS JADERLANDIA', 'NÃO MOVIDO', NULL),
(159, 300, 3, 26, 5, 28, '2021-11-10', 'ANALISÉ JURIDICA ', 'NÃO MOVIDO', NULL),
(160, 295, 2, 25, 4, 23, '2021-11-10', 'PARA PROCEDIMENTOS DE FISCALIZAÇÃO', 'NÃO MOVIDO', NULL),
(161, 294, 2, 25, 3, 32, '2021-11-10', 'PARA RESPONDER', 'NÃO MOVIDO', NULL),
(162, 296, 2, 25, 1, 40, '2021-11-10', 'PARA VERIFICAR O AGENDAMENTO E PARTICIPAÇÃO', 'NÃO MOVIDO', NULL),
(163, 296, 2, 25, 4, 23, '2021-11-10', 'PARA VERIFICAR O AGENDAMENTO E PARTICIPAÇÃO', 'NÃO MOVIDO', NULL),
(164, 296, 2, 25, 3, 32, '2021-11-10', 'PARA VERIFICAR O AGENDAMENTO E PARTICIPAÇÃO', 'NÃO MOVIDO', NULL),
(165, 304, 7, 16, 2, 25, '2021-11-11', 'SOLICITAÇÃO DE VISITA  NO ESTABELECIMENTO COMERCIAL DE RECICLAGEM  \r\n', 'NÃO MOVIDO', NULL),
(166, 303, 7, 16, 3, 32, '2021-11-11', 'RESPOSTA DE NOTIFICAÇÃO  00118/2021/CLA SOB PROTOCOLO DE N:00190/2021/PROC\r\n', 'NÃO MOVIDO', NULL),
(167, 302, 7, 16, 3, 32, '2021-11-11', 'SOLICITA A JUNTADA DE DOCUMENTO AO PROCESSO: N:017/2019\r\n', 'NÃO MOVIDO', NULL),
(168, 301, 7, 16, 3, 32, '2021-11-11', 'OFICIO N:001/2021 SOLICITANDO CANCELAMENTO DO PEDIDO DE SOLICITAÇÃO DE ASV \r\n', 'NÃO MOVIDO', NULL),
(169, 306, 7, 16, 3, 32, '2021-11-11', 'LICENÇA DE OPERAÇÃO SOB CNPJ:34.268.600/0001-57\r\n', 'NÃO MOVIDO', NULL),
(170, 304, 2, 25, 4, 23, '2021-11-11', 'PARA PROCEDIMENTOS DE FISCALIZAÇÃO', 'NÃO MOVIDO', NULL),
(171, 332, 7, 16, 3, 32, '2021-11-11', 'CUMPRIMENTO DE CONDICIONANTE DA L.O PETRUZ FRUITY \r\n', 'NÃO MOVIDO', NULL),
(172, 334, 7, 16, 3, 32, '2021-11-11', 'CUMPRIMENTO DE CONDICIONANTE DA L.O BELA IAÇA\r\n', 'NÃO MOVIDO', NULL),
(173, 336, 7, 16, 3, 32, '2021-11-11', 'ATENDIMENTO DE CONDICIONANTE N:0024/2021\r\n', 'NÃO MOVIDO', NULL),
(174, 339, 7, 16, 3, 32, '2021-11-11', 'ATENDIMENTO DE CONDICIONANTE Nº 028/2018\r\n', 'NÃO MOVIDO', NULL),
(175, 341, 7, 16, 3, 32, '2021-11-11', 'ATENDIMENTO DE CONDICIONANTE Nº 031/2018\r\n', 'NÃO MOVIDO', NULL),
(176, 342, 7, 16, 3, 32, '2021-11-11', 'ATENDIMENTO A CONDICIONANTE DE LICENÇA DE OPERAÇÃO Nº 033/2018\r\n', 'NÃO MOVIDO', NULL),
(177, 343, 7, 16, 3, 32, '2021-11-11', ' ENCAMINHAMENTO DE PODAS DO ARQUIVO DA SEMADA\r\n', 'NÃO MOVIDO', NULL),
(178, 344, 7, 16, 3, 32, '2021-11-11', ' JUNTADA DOCUMENTAL AO PROCESSO DE LICENÇA AMBIENTAL DE REGULARIZAÇÃO DE N° 048/2021\r\n', 'NÃO MOVIDO', NULL),
(179, 345, 7, 16, 4, 23, '2021-11-11', 'DENUNCIA REFERENTE A MAUS TRATOS ', 'NÃO MOVIDO', NULL),
(180, 346, 7, 16, 2, 25, '2021-11-11', 'CONVITE DE INAUGURAÇÃO DO CENTRO DE DIAGNOSTICOS DE CASTANHAL\r\n', 'NÃO MOVIDO', NULL),
(181, 347, 7, 16, 2, 25, '2021-11-11', 'MEMORANDO DE SOLICITAÇÃO DE FISCAIS\r\n', 'NÃO MOVIDO', NULL),
(182, 348, 7, 16, 3, 32, '2021-11-11', 'SOLICITAÇÃO DE PODAGEM SOBRE O OFICIO DE N:070/2021\r\n', 'NÃO MOVIDO', NULL),
(183, 349, 7, 16, 3, 32, '2021-11-11', 'ATENDIMENTO DA NOTIFICAÇÃO DE N:0096/2021/CLA\r\n', 'NÃO MOVIDO', NULL),
(184, 361, 7, 16, 3, 32, '2021-11-12', 'PROTOCOLO DE CONDICIONANTE DA LO Nº 029/2018\r\n', 'NÃO MOVIDO', NULL),
(185, 364, 7, 16, 3, 32, '2021-11-12', 'CUMPRIMENTO DE CONDICIONANTES DA NOTIFICAÇÃO Nº 0444/2014\r\n', 'NÃO MOVIDO', NULL),
(186, 367, 7, 16, 4, 23, '2021-11-12', 'SOLICITA A CAPTURA DE UM PORCO ESPINHO', 'NÃO MOVIDO', NULL),
(187, 402, 7, 16, 2, 25, '2021-11-12', 'TERMO DE CEDÊNCIA DE VEICULOS ', 'NÃO MOVIDO', NULL),
(188, 412, 7, 16, 3, 32, '2021-11-16', 'RESPOSTA À NOTIFICAÇÃO DE Nº 00120/2021', 'NÃO MOVIDO', NULL),
(189, 414, 7, 16, 3, 32, '2021-11-16', 'JUNTADA DOCUMENTAL AO PROCESSO Nº 047/2021', 'NÃO MOVIDO', NULL),
(190, 418, 7, 16, 3, 32, '2021-11-16', 'JUNTADA DE LICENÇA SANITÁRIA AO PROCESSO DE Nº 046/2021', 'NÃO MOVIDO', NULL),
(191, 421, 7, 16, 3, 32, '2021-11-16', 'JUNTADA DE LICENÇA SANITÁRIA AO PROCESSO Nº 048/2021.', 'NÃO MOVIDO', NULL),
(192, 423, 7, 16, 2, 25, '2021-11-16', 'PROCESSO ADMINISTRATIVO PARA ACOMPANHAMENTO DE TAC Nº 00480 - 040/2017.', 'NÃO MOVIDO', NULL),
(193, 424, 7, 16, 2, 25, '2021-11-16', 'NOTÍCIA DE FATO Nº 05224 - 040/2021 \r\nSOLICITAÇÃO DE VISTORIA NA EMPRESA MACUXI, PARA APURAR DENÚNCIA DE POSSÍVEL CRIME AMBIENTAL.', 'NÃO MOVIDO', NULL),
(194, 425, 7, 16, 3, 32, '2021-11-16', 'SUPRESSÃO VEGETAL - SUPRESSÃO DE UMA PALMEIRA AZUL.', 'NÃO MOVIDO', NULL),
(195, 427, 7, 16, 3, 32, '2021-11-16', 'REQUERIMENTO DE LO PARA A ATIVIDADE DE FABRICAÇÃO DE BEBIDAS NÃO ALCOÓLICAS.', 'NÃO MOVIDO', NULL),
(196, 428, 7, 16, 4, 23, '2021-11-16', 'SOLICITAÇÃO DE DOAÇÃO DE MADEIRA DO OFÍCIO Nº 0899/2021 - SEMUTRAN\r\n', 'NÃO MOVIDO', NULL),
(197, 430, 7, 16, 3, 32, '2021-11-16', 'SOLICITAÇÃO DE LICENÇA DE OPERAÇÃO À ATIVIDADE DE CONDOMÍNIO HORIZONTAL, SEM FRACIONAMENTO', 'NÃO MOVIDO', NULL),
(198, 439, 7, 16, 3, 32, '2021-11-16', 'RESPOSTA AO TERMO DE NOTIFICAÇÃO Nº 0101/2021/CLA.', 'NÃO MOVIDO', NULL),
(199, 440, 7, 16, 4, 23, '2021-11-16', 'POLUIÇÃO SONORA CAUSADA POR POLUIÇÃO SONORA DE ACADEMIA, SITUADA EM UMA RESIDÊNCIA.', 'NÃO MOVIDO', NULL),
(200, 441, 7, 16, 2, 25, '2021-11-16', 'SOLICITAÇÃO DE PODA DE ÁRVORE.', 'NÃO MOVIDO', NULL),
(201, 442, 7, 16, 2, 25, '2021-11-16', 'SOLICITAÇÃO DE VISITA TÉCNICA A ÁREA DAS CASTANHEIRAS.', 'NÃO MOVIDO', NULL),
(202, 443, 7, 16, 3, 32, '2021-11-16', 'SOLICITAÇÃO DE SUPRESSÃO E PODA. CASA INABITADA.', 'NÃO MOVIDO', NULL),
(203, 444, 7, 16, 4, 23, '2021-11-16', 'DENUNCIA REFERENTE A MAUS TRATOS ,FEITA POR EMAIL', 'NÃO MOVIDO', NULL),
(204, 445, 7, 16, 5, 28, '2021-11-16', 'RESPOSTA DE NOTIFICAÇÃO DE N:089/2021E 090/2021\r\n', 'NÃO MOVIDO', NULL),
(205, 442, 2, 25, 3, 32, '2021-11-17', 'PARA VISITA TÉCNICA', 'NÃO MOVIDO', NULL),
(206, 423, 2, 25, 4, 23, '2021-11-17', 'PARA ANÉLISE E MANIFESTAÇÃO', 'NÃO MOVIDO', NULL),
(207, 424, 2, 25, 4, 23, '2021-11-17', 'PARA PROVIDÊNCIAS', 'NÃO MOVIDO', NULL),
(208, 449, 7, 16, 3, 32, '2021-11-17', 'ALTERAÇÃO NO REQUERIMENTO PADRÃO, DE RENOVAÇÃO DE LICENÇA DE ATIVIDADE RURAL.', 'NÃO MOVIDO', NULL),
(209, 450, 3, 32, 3, 32, '2021-11-17', 'LAR - LICENÇA PARA ATIVIDADE PECUÁRIA DE CRIAÇÃO DE BOVINOS.', 'NÃO MOVIDO', NULL),
(210, 451, 7, 16, 4, 23, '2021-11-17', 'doação de madeira apreendida pela semma', 'NÃO MOVIDO', NULL),
(211, 452, 3, 32, 3, 32, '2021-11-17', 'JUNTADA DE DOCUMENTO AO PROCESSO DE LICENCIAMENTO AMBIENTAL DA FAZENDA CASTANHA.', 'NÃO MOVIDO', NULL),
(212, 453, 7, 16, 2, 25, '2021-11-17', 'ENCAMINHAMENTO DE SERVIDOR BRAÇAL PARA A SEMMA. OFÍCIO Nº 0438/2021/SEMAD', 'NÃO MOVIDO', NULL),
(213, 453, 7, 16, 2, 25, '2021-11-17', 'ENCAMINHAMENTO DE SERVIDOR BRAÇAL PARA A SEMMA. OFÍCIO Nº 0438/2021/SEMAD', 'NÃO MOVIDO', NULL),
(214, 454, 3, 32, 2, 25, '2021-11-17', 'SOLICITAÇÃO NO PRAZO DE 72H, DO Nº ATUALIZADO DA CONTA DO FUNDO MUNICIPAL DE MEIO AMBIENTE.', 'NÃO MOVIDO', NULL),
(215, 455, 3, 32, 3, 32, '2021-11-17', 'LICENCIAMENTO DE CONSTRUÇÃO DE HABITAÇÕES URBANAS.\r\n-LIFE LOCAÇÃO E CONSTRUÕES CIVEL EIRELI-', 'NÃO MOVIDO', NULL),
(216, 456, 7, 16, 3, 32, '2021-11-17', 'CONSTRUÇÃO DE HABITAÇÕES URBANAS E LOCAÇÃO DE MÁQUINAS, EQUIPAMENTOS E VEÍCULOS SEM CONDUTOR.', 'NÃO MOVIDO', NULL),
(217, 457, 7, 16, 2, 25, '2021-11-17', 'OFÍCIO DO MINISTÉRIO PÚBLICO DE  Nº 0395/2021 - MP/6ª PJ CÍVEL', 'NÃO MOVIDO', NULL),
(218, 458, 7, 16, 3, 32, '2021-11-17', 'CUMPRIMENTO DE CONDICIONANTES DA L.I. Nº 0002/2021', 'NÃO MOVIDO', NULL),
(219, 459, 7, 16, 5, 28, '2021-11-17', 'RESPOSTA A NOTIFICAÇÃO DO PROCESSO Nº 00213/2021/PROC', 'NÃO MOVIDO', NULL),
(220, 459, 7, 16, 5, 28, '2021-11-17', 'RESPOSTA A NOTIFICAÇÃO DO PROCESSO Nº 00213/2021/PROC', 'NÃO MOVIDO', NULL),
(221, 460, 7, 16, 3, 32, '2021-11-17', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE Nº 01801/2018.', 'NÃO MOVIDO', NULL),
(222, 461, 7, 16, 3, 32, '2021-11-18', 'SOLICITAÇÃO DE ANDAMENTO DE PROCESSO DE LICENÇA DE ATIVIDADE RURAL - LAR Nº 00058/2020.', 'NÃO MOVIDO', NULL),
(223, 461, 7, 16, 3, 32, '2021-11-18', 'REQUERIMENTO DE LICENÇA DE INSTALAÇÃO DA OBRA DE CONSTRUÇÃO DA ESTAÇÃO GOURMET DO APEÚ.', 'NÃO MOVIDO', NULL),
(224, 462, 7, 16, 7, 16, '2021-11-18', 'REQUERIMENTO DE LICENÇA DE INSTAÇÃO - LI DA ESTAÇÃO GOURMET DO APEÚ.', 'NÃO MOVIDO', NULL),
(225, 463, 7, 43, 3, 32, '2021-11-18', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE Nº 00268/2021.', 'NÃO MOVIDO', NULL),
(226, 464, 7, 43, 3, 32, '2021-11-18', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE Nº 0095/2021/PROC. - BOM DEMAIS ALIMENTOS, COMÉRCIO EIRELI.', 'NÃO MOVIDO', NULL),
(227, 465, 7, 43, 4, 23, '2021-11-18', 'DENÚNCIA SOBRE INVASÃO DE ÁREAS VERDES DA PREFEITURA MUNICIPAL.', 'NÃO MOVIDO', NULL),
(228, 466, 7, 43, 3, 32, '2021-11-18', 'JUNTADA DE DOCUMENTOS PARA ATENDIMENTO DE CONDICIONANTES DA LO Nº 020/2018 - TROPOC.', 'NÃO MOVIDO', NULL),
(229, 467, 7, 43, 3, 32, '2021-11-18', 'JUNTADA DE DOCUMENTOS REFERENTE AO PROCESSO DE Nº 00010/2021. LABORATÓRIO PAULO AZEVEDO.', 'NÃO MOVIDO', NULL),
(230, 468, 7, 16, 4, 23, '2021-11-19', 'DENUNCIA SOBRE POLUIÇÃO ATMOSFÉRICA NO BAIRRO SÃO JOSÉ.\r\n', 'NÃO MOVIDO', NULL),
(231, 469, 7, 43, 5, 30, '2021-11-19', 'COMPROVAÇÃO DA PUBLICAÇÃO DA LICENÇA DE INSTALAÇÃO DO PROCESSO Nº 00007/2020/PROC.', 'NÃO MOVIDO', NULL),
(232, 473, 7, 16, 2, 25, '2021-11-19', 'SOLICITAÇÃO DE PODAGEM SOB N:1248/20218/SEMAS', 'NÃO MOVIDO', NULL),
(233, 475, 7, 43, 3, 32, '2021-11-19', 'CUMPRIMENTO DE CONDICIONANTE DO PROCESSO DE Nº 00475/2018/PROC.', 'NÃO MOVIDO', NULL),
(234, 476, 7, 43, 3, 32, '2021-11-19', 'CUMPRIMENTO DE CONDICIONANTE DA L. O. 0010/2021, DO PROCESSO DE Nº 51/2020/PROC.', 'NÃO MOVIDO', NULL),
(235, 477, 7, 16, 2, 25, '2021-11-19', 'CONVITE PARA A FORMATURA DO \\\"1° CURSO DE FORMAÇÃO DE INSTRUTORES DE CÃES DE POLÍCIA\\\", E TAMBÉM A FORMATURA DO \\\"CURSO DE II ROMU\\\"', 'NÃO MOVIDO', NULL),
(236, 477, 2, 25, 4, 23, '2021-11-19', 'PARA CONHECIMENTO', 'NÃO MOVIDO', NULL),
(237, 478, 7, 43, 4, 23, '2021-11-22', 'DENÚNCIA SOBRE CRIAÇÃO DE PORCOS SEM RESPONSABILIDADE AMBIENTAL, COM GRANDE LIXÃO A CÉU ABERTO E QUEIMADAS.', 'NÃO MOVIDO', NULL),
(238, 479, 7, 16, 2, 25, '2021-11-22', 'SOLICITAÇÃO DE VISTORIA PARA VERIFICAR CUMPRIMENTO DE TAC 004789-040/2018.', 'NÃO MOVIDO', NULL),
(239, 480, 7, 43, 3, 32, '2021-11-22', 'JUNTADA DE DOCUMENTOS REF. AO PROCESSO DE Nº 00208/2021/PROC.', 'NÃO MOVIDO', NULL),
(240, 481, 7, 43, 5, 28, '2021-11-22', 'JUNTADA DE DOCUMENTOS REF. AO TERMO DE  NOTIFICAÇÃO Nº 092/2021 DO AUTO POSTO BARÃO COMÉRCIO DE DERIVADOS DE PETRÓLEO LTDA.', 'NÃO MOVIDO', NULL),
(241, 482, 7, 16, 3, 32, '2021-11-22', 'JUNTADA DE DOCUMENTOS REF. ATENDIMENTO DE NOTIFICAÇÃO Nº 085/2021.', 'NÃO MOVIDO', NULL),
(242, 483, 7, 16, 3, 32, '2021-11-22', 'JUNTADA DE DOCUMENTOS REF. AO TERMO DE AQUISIÇÃO DE MATERIAIS DA SEMMA/CASTANHAL -  Nº PROCESSO 00395/2018.', 'NÃO MOVIDO', NULL),
(243, 484, 7, 16, 3, 32, '2021-11-22', 'JUNTADA DE DOCUMENTOS REF. AO TERMO DE AQUISIÇÃO DE MATERIAIS DA SEMMA/CASTANHAL -  Nº PROCESSO 00882/2017.', 'NÃO MOVIDO', NULL),
(244, 485, 7, 16, 3, 32, '2021-11-22', 'JUNTADA DE DOCUMENTOS E SOLICITAÇÃO DE DECLARAÇÃO DE TRAMITAÇÃO DE PROCESSO DE L. O. Nº 00032/2020/PROC.', 'NÃO MOVIDO', NULL),
(245, 486, 7, 43, 3, 32, '2021-11-22', 'PROCESSO REFERENTE A UMA LILCENÇA DE OPERAÇÃO - LO', 'NÃO MOVIDO', NULL),
(246, 487, 7, 43, 4, 20, '2021-11-22', 'SOLICITAÇÃO DE RESGATE DE ANIMAL DOMÉSTICO ( CACHORRO) POR MAUS TRATOS ', 'NÃO MOVIDO', NULL),
(247, 488, 7, 43, 5, 28, '2021-11-22', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE Nº 00213/2021/PROC.', 'NÃO MOVIDO', NULL),
(249, 488, 5, 44, 3, 32, '2021-11-22', 'Recebido pela coordenadora Thaynara', 'NÃO MOVIDO', NULL),
(250, 489, 7, 43, 2, 25, '2021-11-23', 'SOLICITAÇÃO DE PODA DE ÁRVORES POR INTERFERÊNCIA NA PASSAGEM DE ÔNIBUS', 'NÃO MOVIDO', NULL),
(251, 490, 7, 16, 3, 32, '2021-11-23', 'JUNTADA DE DOCUMENTO REF. A NOTIFICAÇÃO Nº 083/2021, REF. AO PROCESSO Nº 00144/2021.', 'NÃO MOVIDO', NULL),
(252, 491, 7, 43, 4, 23, '2021-11-23', 'DENÚNCIA SOLICITANDO VISTORIA REFERENTE DESCARTE INDEVIDO DE LIXÃO.', 'NÃO MOVIDO', NULL),
(253, 492, 7, 43, 3, 32, '2021-11-23', 'JUNTADA DE DOCUMENTO REF. A PROCESSO DE NÚMERO 01054/2020/DOC.', 'NÃO MOVIDO', NULL),
(254, 493, 7, 43, 3, 32, '2021-11-23', 'SOLICITAÇÃO DE UMA SUPRESSÃO DE ÁRVORENA ESCOLA RAIMUNDA AMARAL.', 'NÃO MOVIDO', NULL),
(255, 494, 7, 43, 3, 32, '2021-11-23', 'SOLICITAÇÃO DE DECLARAÇÃO DE TRÂMITE DE PROCESSO Nº 01978/2019, REF. A LAR.', 'NÃO MOVIDO', NULL),
(256, 495, 7, 43, 3, 32, '2021-11-23', 'SOLICITAÇÃO DE DECLARAÇÃO DE TRÂMITE REFERENTE AO PROCESSO DE Nº 0110/2018.', 'NÃO MOVIDO', NULL),
(257, 499, 7, 43, 3, 32, '2021-11-23', 'JUNTADE DE DOCUMENTO - BOLETO DE PAGAMENTO DE DECLARAÇÃO DE TRÂMITE EM ATENDIMENTO A L. O. DO PROCESSO Nº 0012/2021/PROC.', 'NÃO MOVIDO', NULL),
(258, 501, 7, 43, 3, 32, '2021-11-23', 'JUNTADE DE DOCUMENTO - BOLETO DE PAGAMENTO DE DECLARAÇÃO DE TRÂMITE EM ATENDIMENTO A L. O. DO PROCESSO Nº 0011/2021/PROC.', 'NÃO MOVIDO', NULL),
(259, 502, 7, 43, 3, 32, '2021-11-23', 'JUNTADA DE DOCUMENTO - BOLETO DE PAGAMENTO DE SUPRESSÃO DE ÀRVORE REF. AO PROCESSO DE Nº 00285/2021.', 'NÃO MOVIDO', NULL),
(260, 503, 7, 43, 3, 32, '2021-11-23', 'JUNTADA DE DOCUMENTOS AO PROCESSO DE Nº 00221/2021.', 'NÃO MOVIDO', NULL),
(261, 507, 7, 43, 4, 23, '2021-11-23', 'DENUNCIA ANÔNIMA ENVIADA POR EMAIL, REFERENTE A POLUIÇÃO E CRIAÇÃO DE PORCOS.', 'NÃO MOVIDO', NULL),
(262, 508, 7, 43, 3, 32, '2021-11-23', 'CARTA CONSULTA DA EMPRESA F. B. DISTRIBUIDORA DE ALIMENTOS LTDA.', 'NÃO MOVIDO', NULL),
(263, 509, 7, 43, 2, 25, '2021-11-23', 'MEMORANDO Nº 0234/2021, SOLICITANDO PARECER TÉCNICO REFERENTE A REGULARIZAÇÃO FUNDIÁRIA.', 'NÃO MOVIDO', NULL),
(264, 510, 7, 43, 4, 23, '2021-11-23', 'SOLICITAÇÃO DE MADEIRA PARA CONFECÇÃO DE ESTRUTURA DE PLACAS EDUCATIVAS.', 'NÃO MOVIDO', NULL),
(265, 515, 7, 43, 3, 32, '2021-11-24', 'JUNTADA DE DOCUMENTOS REF. AO PROCESSO DE Nº 00057/2021.', 'NÃO MOVIDO', NULL),
(266, 516, 7, 16, 3, 32, '2021-11-24', 'JUNTADA DE DOCUMENTOS REF. AO PROCESSO DE Nº 00058/2021.', 'NÃO MOVIDO', NULL),
(267, 519, 7, 16, 2, 25, '2021-11-24', 'REQUERIMENTO DE REITERAÇÃO DE PROCESSO DE Nº 0266/2021 DE 18/08/2021.', 'NÃO MOVIDO', NULL),
(268, 522, 7, 16, 3, 32, '2021-11-24', 'JUNTADA DE DOCUMENTOS REFERENTE AO PROCESSO Nº 00269/2021.', 'NÃO MOVIDO', NULL),
(269, 523, 7, 16, 3, 32, '2021-11-24', 'JUNTADA DE DOCUMENTO COMO CUMPRIMENTO DE L.O. Nº 0033/2019  REFER. AO PROCESSO Nº 0475/2018.', 'NÃO MOVIDO', NULL),
(270, 527, 7, 16, 3, 32, '2021-11-24', 'JUNTADA DE DOCUMENTOS REF. A ENTREGA DE CONDICIONANTE REF. A L. O. Nº 031/2019 DO PROCESSO Nº 0222/2019.', 'NÃO MOVIDO', NULL),
(271, 530, 7, 16, 2, 25, '2021-11-24', 'OFÍCIO Nº 573/2021 -SECULT - PROGRAMAÇÃO DO PROJETO MEU QUERIDO NATAL \r\n', 'NÃO MOVIDO', NULL),
(272, 536, 7, 16, 3, 32, '2021-11-24', 'OFÍCIO Nº 0611/2021 SOLICITANDO CÓPIA DE PROCESSOS ADM. PUNITIVOS DA EMPRESA AMAZON POLPAS.', 'NÃO MOVIDO', NULL),
(273, 537, 7, 16, 3, 32, '2021-11-24', 'JUNTADA DE DOCUMENTO EM ATENDIMENTO A CONDICIONANTE REF. AO PROCESSO Nº 00597/2018 DA L. O. Nº 0011/2020.', 'NÃO MOVIDO', NULL),
(274, 538, 7, 43, 3, 32, '2021-11-24', 'JUNTADA DE DOCUMENTO REF. AO PROCESSO DE Nº 0058/2020/PROC.', 'NÃO MOVIDO', NULL),
(275, 540, 7, 43, 3, 32, '2021-11-25', 'JUNTADA DE DOCUMENTOS REF. A PROCESSO DE 2019 DA EMPRESA MARIA TRANSPORTES.', 'NÃO MOVIDO', NULL),
(276, 541, 7, 43, 3, 32, '2021-11-25', 'JUNTADA DE DOCUMENTO REF. A RETIFICAÇÃO DO OFÍCIO DE Nº 0778/2021.', 'NÃO MOVIDO', NULL),
(277, 542, 7, 43, 2, 25, '2021-11-25', 'SOLICITANDO INFORMAÇÕES ACERCA DAS MEDIDAS DA VIGILÂNCIA SANITÁRIA E ZOONOSES.', 'NÃO MOVIDO', NULL),
(278, 545, 7, 16, 2, 25, '2021-11-25', 'OFICIO DE N:017/2021', 'NÃO MOVIDO', NULL),
(279, 546, 7, 43, 2, 25, '2021-11-25', 'OFÍCIO Nº 0515/2021-DL, COMUNICADO SOBRE REQUERIMENTO DE Nº 2092/2021, DE AUTORIA DA VEREADORA PAULA TITAN.', 'NÃO MOVIDO', NULL),
(280, 542, 2, 25, 8, 19, '2021-11-25', 'PARA ANÁLISE E RESPOSTA AO MPPA', 'NÃO MOVIDO', NULL),
(281, 546, 2, 25, 3, 32, '2021-11-26', 'PARA VERIFICAÇÃO', 'NÃO MOVIDO', NULL),
(282, 545, 2, 25, 4, 23, '2021-11-26', 'PARA ANÁLISE E PARTICIPAÇÕES', 'NÃO MOVIDO', NULL),
(283, 519, 2, 25, 3, 32, '2021-11-26', 'PARA ATENDIMENTO DA DEMANDA DA IGREJA BATISTA CASA DE BENÇÃO.', 'NÃO MOVIDO', NULL),
(284, 552, 7, 16, 3, 32, '2021-11-26', 'declaração de tramite ,oficio :007/eng-amb/2021', 'NÃO MOVIDO', NULL),
(285, 550, 7, 16, 3, 32, '2021-11-26', 'termo de notificação n:107/2021', 'NÃO MOVIDO', NULL),
(286, 553, 7, 16, 5, 44, '2021-11-26', 'NOTIFICAÇÃO DO AÇA DA SAFRA PARA SER ANEXADO AO PROCESSO 37/2021', 'NÃO MOVIDO', NULL),
(287, 554, 7, 43, 3, 32, '2021-11-26', 'COMPROVANTE DE PAGAMENTO REF. TAXA DE L. T. - JOELSON MELO', 'NÃO MOVIDO', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) UNSIGNED NOT NULL,
  `setor_id` int(10) UNSIGNED NOT NULL,
  `portaria` varchar(45) DEFAULT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `acesso` int(11) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `data_finalizacao` date DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `setor_id`, `portaria`, `cargo`, `nome`, `usuario`, `email`, `senha`, `acesso`, `data_cadastro`, `data_finalizacao`, `observacao`, `imagem`, `status`) VALUES
(1, 10, '1.137/20', 'Assessor', 'Joab T. Alencar', 'joab.alencar', 'joabtorres1508@gmail.com', '47cafbff7d1c4463bbe7ba972a2b56e3', 10, '2020-08-06', NULL, '', 'uploads/usuarios/553bc7e9d89e214a4e87450c88f4d320.jpg', 1),
(15, 10, '', 'Agente Administrativo', 'Wilken Kimy Oliveira Alves', 'wilken.kimy', 'wilkenkimyalves@gmail.com', '5c6447fd7edb2e6aa908fff0c1fb46c0', 10, '2021-09-28', NULL, '', 'uploads/usuarios/807f467c0418a67a2292b66ebd90ff07.jpg', 1),
(16, 7, '', 'Agente Administrativo', 'Elane Danile Monteiro dos Santos', 'elane.daniele', 'danisantos30360@gmail.com', 'cd523b7d342b8835a3a18cb4ebe5917f', 1, '2021-09-28', NULL, '', 'uploads/usuarios/499f1eccdc4d541be21db056bf0ff459.jpg', 1),
(19, 8, '1.890/2021', 'Assessor', 'Gabriel Holanda Pereira de Medeiros', 'gabriel.medeiros', 'hpm.gabriel@gmail.com', '1e3be126a341be788765c0acfde946bc', 1, '2021-09-15', '2021-09-29', '', 'uploads/usuarios/46718ab3853947986985e2f2fd942232.jpg', 1),
(20, 4, '', 'Coordenadora', 'Maria da Conceição Barbosa da Costa', 'maria.costa', 'asdas@sadsad', '1e3be126a341be788765c0acfde946bc', 1, '0000-00-00', '0000-00-00', '', 'uploads/usuarios/1a219cba4c97d0b69384a14ee8c74a25.jpg', 1),
(21, 4, '', 'Agente Administrativa', 'Ana Karoline Silva - OFF', 'karoline.silvaOFFF', 'karolinesilva20016@gmail.comasdsa', '1e3be126a341be788765c0acfde946bc', 1, '0000-00-00', '0000-00-00', '1', 'uploads/usuarios/864db6e580a2579e05869335f1edd0be.jpg', 0),
(22, 4, '', 'Estagiária', 'Arianny Suzan Ripardo e Silva', 'arianny.silva', 'ariannysuzan@gmail.com', '1e3be126a341be788765c0acfde946bc', 1, '0000-00-00', '0000-00-00', '', 'uploads/usuarios/b1267c4ea41e78c1acb60287f2a0b8f8.jpg', 1),
(23, 4, '', 'Administrador', 'Michelle Cruz de Freitas', 'michelle.freitas', 'michellecruzdefreitas@hotmail.com', 'ca6d508ff5aaf6386e7c325dc6a7fbe5', 1, '0000-00-00', '0000-00-00', '', 'uploads/usuarios/cab7ffbab6a0c2b8d24f8dcd7279d225.jpg', 1),
(24, 2, '17108/1', 'Agente Administrativo', 'Igor Martins Zampolo', 'igor.zampolo', 'igorzampolo@gmail.com', 'e55dd19128967ac7c70297b6f59889f5', 1, '2021-01-20', '0000-00-00', '', 'uploads/usuarios/3ae970bcb877ef0e3383a3cbcae95f7b.jpg', 1),
(25, 2, '1802/21', '', 'José Nonato Neto', 'jose.neto', 'jntec.lte@gmail.com', '433906d4f43dc6aa88d4dcc0f067ce53', 1, '2021-07-19', '0000-00-00', '', 'uploads/usuarios/7ef0d576ec46e8d7a0eddfbfbb75915c.jpg', 1),
(26, 3, '', 'Agente Adminstrativa', 'Ana Karoline Silva', 'karoline.silva', 'karolinesilva20016@gmail.com', '59c1b586500bac4f70e19d3dcb7eebf5', 1, '2021-06-01', '0000-00-00', '', 'uploads/usuarios/e46cbce3d5b290fb6e17573f7f00004a.jpg', 1),
(27, 1, '', 'Coordenadora', 'Adriana Marcia Sousa Medeiros -- Desativado', 'adriana.marcia -- off', 'drikamedeiros41@gmail.com', '1e3be126a341be788765c0acfde946bc', 1, '2021-01-04', '0000-00-00', '', 'uploads/usuarios/user.png', 0),
(28, 5, '', 'Auxiliar de Coordenação', 'Youssef Abdul Massish Neto', 'youssef.abdul', 'youssefmassish@gmail.com', '1e3be126a341be788765c0acfde946bc', 1, '2021-06-01', '0000-00-00', '', 'uploads/usuarios/70977f0ff1c28ef76fe9aa9d555f0a9d.jpg', 1),
(29, 7, '', 'Agente Administrativo', 'Joab T. - Protocolo', 'joab.protocolo', 'joab@sadasdassdsada', '1e3be126a341be788765c0acfde946bc', 1, '2021-10-13', '0000-00-00', '', 'uploads/usuarios/25311d592f68859bbd05ce01481a6e40.jpg', 0),
(30, 5, '', 'Estagiário', 'João Fernando Lobo Abdoral ', 'joao.abdoral', 'joaoabdoral@gmail.com', '1e3be126a341be788765c0acfde946bc', 1, '2021-03-08', '0000-00-00', '', 'uploads/usuarios/user.png', 1),
(32, 3, '', 'Agente Adminstrativo', 'Amanda Débora Pereira Damasceno - OFF', 'amanda.damasceno', 'amandadmasceno@outlook.com', '06191dfefbd3d544903e6887ac75e7dc', 1, '2021-05-01', '0000-00-00', '', 'uploads/usuarios/f256ec26f5ec3ff27b920163c78d26e0.jpg', 0),
(33, 4, '1335/2021', 'Engenheiro Ambiental', 'José Alvino Pereira de Lima Junior', 'jose.alvino', 'j.alvinojr@gmail.com', 'afd2f3d9030c12fce12747757d232736', 1, '2021-02-05', '0000-00-00', '', 'uploads/usuarios/59d2907b81a452e8e88f8d9f7e179569.jpg', 1),
(34, 4, '1751/2021', 'Auxiliar de Coordenação', 'Italo Reis Martins Lima - Desativado', 'italo.reis', 'italoreis.ml@gmail.com', '73627a497fab656b88fe5b1f3e50d91a', 1, '2021-07-07', '0000-00-00', '', 'uploads/usuarios/d5a11f0d1ff58abc6be5c0a2c51a0eb7.jpg', 0),
(35, 3, '', 'zelador', 'Ruyderlan da Cruz Pantoja', 'ruyderlan.pantoja', 'ruyderlan2@gmail.com', 'c243341b5a6c0e3a82fa10a3d7c77f19', 1, '2021-01-01', '0000-00-00', '', 'uploads/usuarios/d032915fa0bd1f7807356d52bd4cef1a.jpg', 1),
(37, 4, '', 'Auxiliar de  Coordenação', 'Ronaldo Mota - Desativado', 'ronaldo.motaOFF', 'jramfilho@hotmail.comOFF', '2c71e593d4e7a4610dcdb9674b2a4e97', 1, '2021-10-21', '0000-00-00', '', 'uploads/usuarios/ef9aab931e7f20d2c74fca38e31055ae.jpg', 0),
(38, 6, '', 'Agente Adminstrativo', 'Rosineia Matos dos Santos', 'rosineia.matos', 'rosineia_matos@hotmail.com', 'e8ae91db74b834c0b09436e408ec15e4', 1, '2021-01-04', '0000-00-00', '', 'uploads/usuarios/5a84e29639f74b4543265ed4d2713c56.jpg', 1),
(39, 4, '', 'Medica Veterinária', 'Louysse Helene Monteiro', 'helene.monteiro', 'helenelouysse@gmail.com', '1e3be126a341be788765c0acfde946bc', 1, '2021-10-05', '0000-00-00', '', 'uploads/usuarios/14fa888b49caf6826379732e90ddf314.jpg', 1),
(40, 1, '212208-2', 'Agente Administrativo', 'Luisa Paixão dos Santos', 'luisa.santos', 'luisadossantos5636@gmail.com', '1e3be126a341be788765c0acfde946bc', 1, '2006-04-01', '0000-00-00', '', 'uploads/usuarios/5cdd19aa13b5e3a263c4abb3892ef2f0.jpg', 1),
(41, 3, '2.100/2021', 'Auxiliar Administrativo - Zona Urbana', 'Idelma Loureiro Frota', 'idelma.frota', 'ilfrotahand@gmail.com', '20e7a53ed14c98cf38daf2d83c82671d', 1, '2021-08-31', '0000-00-00', '', 'uploads/usuarios/af73d51726b4214ab12dda506c43ec34.jpg', 1),
(42, 1, '', 'Coordenador', 'Ronaldo Mota', 'ronaldo.mota', 'jramfilho@hotmail.com', '1e3be126a341be788765c0acfde946bc', 0, '2021-11-16', '0000-00-00', '', 'uploads/usuarios/6067c5ec122469bd4b926260c1247218.jpg', 1),
(43, 7, '211081-7', 'Agente Administrativo', 'Elis Simone Dias de Sousa', 'elis.sousa', 'elis_simone@yahoo.com.br', '1e3be126a341be788765c0acfde946bc', 0, '2021-08-01', '0000-00-00', '', 'uploads/usuarios/user.png', 1),
(44, 5, '', 'Agente Administrativo', 'Debora Caroline Holanda da Silva', 'debora.holanda', 'deboraaholanda@hotmail.com', '1e3be126a341be788765c0acfde946bc', 1, '2021-09-02', '0000-00-00', '', 'uploads/usuarios/8c0e38284a871a70df1bff7b1d7f02a7.jpg', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bairro`
--
ALTER TABLE `bairro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bairro_cidade1` (`cidade_id`);

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cprn`
--
ALTER TABLE `cprn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cofisc_solicitacao_bairro10` (`bairro_id`),
  ADD KEY `fk_cofisc_solicitacao_cidade10` (`cidade_id`),
  ADD KEY `fk_cofisc_solicitacao_usuario10` (`usuario_id`),
  ADD KEY `fk_cprn_cprn_protocolo1` (`protocolo_id`),
  ADD KEY `fk_cprn_cprn_categoria1` (`categoria_id`),
  ADD KEY `fk_cprn_cprn_acao1` (`acao_id`);

--
-- Índices para tabela `cprn_anexo`
--
ALTER TABLE `cprn_anexo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cprn_anexo_cprn1` (`cprn_id`);

--
-- Índices para tabela `cprn_historico`
--
ALTER TABLE `cprn_historico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cprn_historico_cprn1` (`cprn_id`),
  ADD KEY `fk_cprn_historico_usuario1` (`usuario_id`);

--
-- Índices para tabela `cprn_origem`
--
ALTER TABLE `cprn_origem`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cprn_protocolo`
--
ALTER TABLE `cprn_protocolo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cprn_protocolo_cprn_solicitante1` (`solicitante_id`),
  ADD KEY `fk_cprn_protocolo_cprn_origem1` (`origem_id`),
  ADD KEY `fk_cprn_protocolo_cprn_tipo_protocolo1` (`protocolo_id`),
  ADD KEY `fk_cprn_protocolo_cprn_tipo_documento1` (`documento_id`);

--
-- Índices para tabela `cprn_solicitante`
--
ALTER TABLE `cprn_solicitante`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cprn_tipo_categoria`
--
ALTER TABLE `cprn_tipo_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cprn_tipo_documento`
--
ALTER TABLE `cprn_tipo_documento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cprn_tipo_documento_cprn_tipo_protocolo1` (`tipo_protocolo_id`);

--
-- Índices para tabela `cprn_tipo_protocolo`
--
ALTER TABLE `cprn_tipo_protocolo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cprn_tipo_solicitacao`
--
ALTER TABLE `cprn_tipo_solicitacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cprn_acao_cprn_categoria1` (`categoria_id`);

--
-- Índices para tabela `cprn_vistoria`
--
ALTER TABLE `cprn_vistoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cprn_vistoria_cprn1` (`cprn_id`);

--
-- Índices para tabela `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fisc_anexo_denuncia`
--
ALTER TABLE `fisc_anexo_denuncia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fisc_anexo_denuncia_fisc_denuncia1` (`denuncia_id`);

--
-- Índices para tabela `fisc_anexo_solicitacao`
--
ALTER TABLE `fisc_anexo_solicitacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fisc_anexo_solicitacao_fisc_solicitacao1` (`solicitacao_id`);

--
-- Índices para tabela `fisc_defesa_denuncia`
--
ALTER TABLE `fisc_defesa_denuncia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fisc_defesa_protocolo_id` (`protocolo_id`) USING BTREE,
  ADD KEY `fk_fisc_defesa_denuncia_id` (`denuncia_id`) USING BTREE;

--
-- Índices para tabela `fisc_defesa_solicitacao`
--
ALTER TABLE `fisc_defesa_solicitacao`
  ADD KEY `fk_fisc_defesa_solicitacao_protocolo_id` (`protocolo_id`),
  ADD KEY `fk_fisc_defesa_solicitacao_denuncia_id` (`denuncia_id`);

--
-- Índices para tabela `fisc_denuncia`
--
ALTER TABLE `fisc_denuncia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fisc_denuncia_fisc_tipo_denuncia1` (`tipo_denuncia_id`),
  ADD KEY `fk_fisc_denuncia_cidade1` (`cidade_id`),
  ADD KEY `fk_fisc_denuncia_bairro1` (`bairro_id`),
  ADD KEY `fk_fisc_denuncia_fisc_protocolo1` (`protocolo_id`),
  ADD KEY `fk_fisc_denuncia_usuario1` (`usuario_id`),
  ADD KEY `infracao_id` (`infracao_id`);

--
-- Índices para tabela `fisc_historico_denuncia`
--
ALTER TABLE `fisc_historico_denuncia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fisc_historico_usuario1` (`usuario_id`),
  ADD KEY `fk_fisc_historico_fisc_denuncia1` (`denuncia_id`);

--
-- Índices para tabela `fisc_historico_solicitacao`
--
ALTER TABLE `fisc_historico_solicitacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fisc_historico_solicitacao_fisc_solicitacao1` (`solicitacao_id`),
  ADD KEY `fk_fisc_historico_solicitacao_usuario1` (`usuario_id`);

--
-- Índices para tabela `fisc_origem`
--
ALTER TABLE `fisc_origem`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fisc_protocolo`
--
ALTER TABLE `fisc_protocolo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_table1_fisc_tipo_documento1` (`tipo_documento_id`),
  ADD KEY `fk_table1_origem1` (`origem_id`),
  ADD KEY `fk_table1_fisc_protocolo1` (`protocolo_id`) USING BTREE,
  ADD KEY `fk_table_solicitante` (`id_solicitante`);

--
-- Índices para tabela `fisc_solicitacao`
--
ALTER TABLE `fisc_solicitacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fisc_solicitacao_fisc_tipo_solicitação1` (`tipo_solicitacao_id`),
  ADD KEY `fk_fisc_solicitacao_fisc_protocolo1` (`protocolo_id`),
  ADD KEY `fk_fisc_solicitacao_bairro1` (`bairro_id`),
  ADD KEY `fk_fisc_solicitacao_cidade1` (`cidade_id`),
  ADD KEY `fk_fisc_solicitacao_usuario1` (`usuario_id`);

--
-- Índices para tabela `fisc_solicitante`
--
ALTER TABLE `fisc_solicitante`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fisc_tipo_classificao`
--
ALTER TABLE `fisc_tipo_classificao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `infracao_id` (`infracao_id`);

--
-- Índices para tabela `fisc_tipo_denuncia`
--
ALTER TABLE `fisc_tipo_denuncia`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fisc_tipo_documento`
--
ALTER TABLE `fisc_tipo_documento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fisc_tipo_documento_fisc_protocolo1` (`protocolo_id`);

--
-- Índices para tabela `fisc_tipo_infracao`
--
ALTER TABLE `fisc_tipo_infracao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_denuncia_id` (`tipo_denuncia_id`);

--
-- Índices para tabela `fisc_tipo_protocolo`
--
ALTER TABLE `fisc_tipo_protocolo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fisc_tipo_solicitacao`
--
ALTER TABLE `fisc_tipo_solicitacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fisc_vistoria_denuncia`
--
ALTER TABLE `fisc_vistoria_denuncia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fisc_vistoria_denuncia_fisc_denuncia1` (`denuncia_id`);

--
-- Índices para tabela `fisc_vistoria_solicitacao`
--
ALTER TABLE `fisc_vistoria_solicitacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fisc_vistoria_solicitacao_fisc_solicitacao1` (`solicitacao_id`);

--
-- Índices para tabela `lic_enquadramento`
--
ALTER TABLE `lic_enquadramento`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `lic_enquadramento_porte`
--
ALTER TABLE `lic_enquadramento_porte`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `lic_enquadramento_valor_taxa`
--
ALTER TABLE `lic_enquadramento_valor_taxa`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `patrimonio`
--
ALTER TABLE `patrimonio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setor_id` (`setor_id`),
  ADD KEY `status_tombamento_id` (`status_tombamento_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `fonte_recurso_id` (`fonte_recurso_id`),
  ADD KEY `classificacao_id` (`classificacao_id`);

--
-- Índices para tabela `patrimonio_classificacao`
--
ALTER TABLE `patrimonio_classificacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `patrimonio_fonte_recurso`
--
ALTER TABLE `patrimonio_fonte_recurso`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `patrimonio_status`
--
ALTER TABLE `patrimonio_status`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `patrimonio_tombamento`
--
ALTER TABLE `patrimonio_tombamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `protocolo`
--
ALTER TABLE `protocolo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_protocolo_processos_usuario1` (`protocolista_id`),
  ADD KEY `fk_protocolo_protocolo_tipo1` (`tipo_id`),
  ADD KEY `fk_protocolo_protocolo_objetivo1` (`objetivo_id`);

--
-- Índices para tabela `protocolo_anexo`
--
ALTER TABLE `protocolo_anexo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_protocolo_anexo_protocolo1` (`protocolo_id`);

--
-- Índices para tabela `protocolo_historico`
--
ALTER TABLE `protocolo_historico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_protocolo_historico_usuario1` (`usuario_id`),
  ADD KEY `fk_protocolo_historico_protocolo1` (`protocolo_id`);

--
-- Índices para tabela `protocolo_objetivo`
--
ALTER TABLE `protocolo_objetivo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_protocolo_objetivo_protocolo_tipo1` (`tipo_id`);

--
-- Índices para tabela `protocolo_tipo`
--
ALTER TABLE `protocolo_tipo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `setor`
--
ALTER TABLE `setor`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ti_chamado`
--
ALTER TABLE `ti_chamado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chamado_setor` (`setor_id`),
  ADD KEY `fk_chamado_usuario1` (`usuario_id`),
  ADD KEY `fk_chamado_chamado_status1` (`status_id`),
  ADD KEY `fk_ti_chamado_ti_chamado_assunto1` (`assunto_id`);

--
-- Índices para tabela `ti_chamado_assunto`
--
ALTER TABLE `ti_chamado_assunto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ti_chamado_historico`
--
ALTER TABLE `ti_chamado_historico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chamado_historico_chamado1` (`chamado_id`),
  ADD KEY `fk_chamado_historico_chamado_status1` (`status_id`),
  ADD KEY `fk_chamado_historico_usuario1` (`usuario_id`);

--
-- Índices para tabela `ti_chamado_status`
--
ALTER TABLE `ti_chamado_status`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tramitacao`
--
ALTER TABLE `tramitacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tramitacao_protocolo1` (`protocolo_id`),
  ADD KEY `fk_tramitacao_setor1` (`setor_remetente_id`),
  ADD KEY `fk_tramitacao_usuario1` (`usuario_remetente_id`),
  ADD KEY `fk_tramitacao_usuario2` (`usuario_destinatario_id`),
  ADD KEY `fk_tramitacao_setor2` (`setor_destinatario_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_usuario_setor1` (`setor_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bairro`
--
ALTER TABLE `bairro`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cprn`
--
ALTER TABLE `cprn`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cprn_anexo`
--
ALTER TABLE `cprn_anexo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `cprn_historico`
--
ALTER TABLE `cprn_historico`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cprn_origem`
--
ALTER TABLE `cprn_origem`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cprn_protocolo`
--
ALTER TABLE `cprn_protocolo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cprn_solicitante`
--
ALTER TABLE `cprn_solicitante`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cprn_tipo_documento`
--
ALTER TABLE `cprn_tipo_documento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cprn_tipo_protocolo`
--
ALTER TABLE `cprn_tipo_protocolo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `cprn_vistoria`
--
ALTER TABLE `cprn_vistoria`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `fisc_anexo_denuncia`
--
ALTER TABLE `fisc_anexo_denuncia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `fisc_anexo_solicitacao`
--
ALTER TABLE `fisc_anexo_solicitacao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `fisc_defesa_denuncia`
--
ALTER TABLE `fisc_defesa_denuncia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `fisc_denuncia`
--
ALTER TABLE `fisc_denuncia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT de tabela `fisc_historico_denuncia`
--
ALTER TABLE `fisc_historico_denuncia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT de tabela `fisc_historico_solicitacao`
--
ALTER TABLE `fisc_historico_solicitacao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT de tabela `fisc_origem`
--
ALTER TABLE `fisc_origem`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `fisc_protocolo`
--
ALTER TABLE `fisc_protocolo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT de tabela `fisc_solicitacao`
--
ALTER TABLE `fisc_solicitacao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de tabela `fisc_solicitante`
--
ALTER TABLE `fisc_solicitante`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `fisc_tipo_classificao`
--
ALTER TABLE `fisc_tipo_classificao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `fisc_tipo_denuncia`
--
ALTER TABLE `fisc_tipo_denuncia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `fisc_tipo_documento`
--
ALTER TABLE `fisc_tipo_documento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `fisc_tipo_infracao`
--
ALTER TABLE `fisc_tipo_infracao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `fisc_tipo_protocolo`
--
ALTER TABLE `fisc_tipo_protocolo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `fisc_vistoria_denuncia`
--
ALTER TABLE `fisc_vistoria_denuncia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `fisc_vistoria_solicitacao`
--
ALTER TABLE `fisc_vistoria_solicitacao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `lic_enquadramento`
--
ALTER TABLE `lic_enquadramento`
  MODIFY `cod` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;

--
-- AUTO_INCREMENT de tabela `lic_enquadramento_porte`
--
ALTER TABLE `lic_enquadramento_porte`
  MODIFY `cod` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1931;

--
-- AUTO_INCREMENT de tabela `lic_enquadramento_valor_taxa`
--
ALTER TABLE `lic_enquadramento_valor_taxa`
  MODIFY `cod` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de tabela `patrimonio`
--
ALTER TABLE `patrimonio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `patrimonio_classificacao`
--
ALTER TABLE `patrimonio_classificacao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `patrimonio_fonte_recurso`
--
ALTER TABLE `patrimonio_fonte_recurso`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `patrimonio_status`
--
ALTER TABLE `patrimonio_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `patrimonio_tombamento`
--
ALTER TABLE `patrimonio_tombamento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `protocolo`
--
ALTER TABLE `protocolo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=557;

--
-- AUTO_INCREMENT de tabela `protocolo_anexo`
--
ALTER TABLE `protocolo_anexo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `protocolo_historico`
--
ALTER TABLE `protocolo_historico`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=747;

--
-- AUTO_INCREMENT de tabela `protocolo_objetivo`
--
ALTER TABLE `protocolo_objetivo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `protocolo_tipo`
--
ALTER TABLE `protocolo_tipo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `setor`
--
ALTER TABLE `setor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `ti_chamado`
--
ALTER TABLE `ti_chamado`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `ti_chamado_assunto`
--
ALTER TABLE `ti_chamado_assunto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `ti_chamado_historico`
--
ALTER TABLE `ti_chamado_historico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `ti_chamado_status`
--
ALTER TABLE `ti_chamado_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tramitacao`
--
ALTER TABLE `tramitacao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=288;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `bairro`
--
ALTER TABLE `bairro`
  ADD CONSTRAINT `fk_bairro_cidade1` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cprn`
--
ALTER TABLE `cprn`
  ADD CONSTRAINT `fk_cofisc_solicitacao_bairro10` FOREIGN KEY (`bairro_id`) REFERENCES `bairro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cofisc_solicitacao_cidade10` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cofisc_solicitacao_usuario10` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cprn_cprn_acao1` FOREIGN KEY (`acao_id`) REFERENCES `cprn_tipo_solicitacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cprn_cprn_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `cprn_tipo_categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cprn_cprn_protocolo1` FOREIGN KEY (`protocolo_id`) REFERENCES `cprn_protocolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cprn_anexo`
--
ALTER TABLE `cprn_anexo`
  ADD CONSTRAINT `fk_cprn_anexo_cprn1` FOREIGN KEY (`cprn_id`) REFERENCES `cprn` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cprn_historico`
--
ALTER TABLE `cprn_historico`
  ADD CONSTRAINT `fk_cprn_historico_cprn1` FOREIGN KEY (`cprn_id`) REFERENCES `cprn` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cprn_historico_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cprn_protocolo`
--
ALTER TABLE `cprn_protocolo`
  ADD CONSTRAINT `fk_cprn_protocolo_cprn_origem1` FOREIGN KEY (`origem_id`) REFERENCES `cprn_origem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cprn_protocolo_cprn_solicitante1` FOREIGN KEY (`solicitante_id`) REFERENCES `cprn_solicitante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cprn_protocolo_cprn_tipo_documento1` FOREIGN KEY (`documento_id`) REFERENCES `cprn_tipo_documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cprn_protocolo_cprn_tipo_protocolo1` FOREIGN KEY (`protocolo_id`) REFERENCES `cprn_tipo_protocolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cprn_tipo_documento`
--
ALTER TABLE `cprn_tipo_documento`
  ADD CONSTRAINT `fk_cprn_tipo_documento_cprn_tipo_protocolo1` FOREIGN KEY (`tipo_protocolo_id`) REFERENCES `cprn_tipo_protocolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cprn_tipo_solicitacao`
--
ALTER TABLE `cprn_tipo_solicitacao`
  ADD CONSTRAINT `fk_cprn_acao_cprn_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `cprn_tipo_categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cprn_vistoria`
--
ALTER TABLE `cprn_vistoria`
  ADD CONSTRAINT `fk_cprn_vistoria_cprn1` FOREIGN KEY (`cprn_id`) REFERENCES `cprn` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fisc_anexo_denuncia`
--
ALTER TABLE `fisc_anexo_denuncia`
  ADD CONSTRAINT `fk_fisc_anexo_denuncia_fisc_denuncia1` FOREIGN KEY (`denuncia_id`) REFERENCES `fisc_denuncia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fisc_anexo_solicitacao`
--
ALTER TABLE `fisc_anexo_solicitacao`
  ADD CONSTRAINT `fk_fisc_anexo_solicitacao_fisc_solicitacao1` FOREIGN KEY (`solicitacao_id`) REFERENCES `fisc_solicitacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fisc_defesa_denuncia`
--
ALTER TABLE `fisc_defesa_denuncia`
  ADD CONSTRAINT `fk_fisc_defesa_denuncia_id` FOREIGN KEY (`denuncia_id`) REFERENCES `fisc_denuncia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fisc_defesa_protocolo_id` FOREIGN KEY (`protocolo_id`) REFERENCES `protocolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fisc_defesa_solicitacao`
--
ALTER TABLE `fisc_defesa_solicitacao`
  ADD CONSTRAINT `fk_fisc_defesa_solicitacao_denuncia_id` FOREIGN KEY (`denuncia_id`) REFERENCES `fisc_denuncia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fisc_defesa_solicitacao_protocolo_id` FOREIGN KEY (`protocolo_id`) REFERENCES `protocolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fisc_denuncia`
--
ALTER TABLE `fisc_denuncia`
  ADD CONSTRAINT `fisc_denuncia_ibfk_1` FOREIGN KEY (`infracao_id`) REFERENCES `fisc_tipo_infracao` (`id`),
  ADD CONSTRAINT `fk_fisc_denuncia_bairro1` FOREIGN KEY (`bairro_id`) REFERENCES `bairro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fisc_denuncia_cidade1` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fisc_denuncia_fisc_protocolo1` FOREIGN KEY (`protocolo_id`) REFERENCES `fisc_protocolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fisc_denuncia_fisc_tipo_denuncia1` FOREIGN KEY (`tipo_denuncia_id`) REFERENCES `fisc_tipo_denuncia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fisc_denuncia_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fisc_historico_denuncia`
--
ALTER TABLE `fisc_historico_denuncia`
  ADD CONSTRAINT `fk_fisc_historico_fisc_denuncia1` FOREIGN KEY (`denuncia_id`) REFERENCES `fisc_denuncia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fisc_historico_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fisc_historico_solicitacao`
--
ALTER TABLE `fisc_historico_solicitacao`
  ADD CONSTRAINT `fk_fisc_historico_solicitacao_fisc_solicitacao1` FOREIGN KEY (`solicitacao_id`) REFERENCES `fisc_solicitacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fisc_historico_solicitacao_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fisc_protocolo`
--
ALTER TABLE `fisc_protocolo`
  ADD CONSTRAINT `fk_table1_fisc_protocolo1` FOREIGN KEY (`protocolo_id`) REFERENCES `fisc_tipo_protocolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_fisc_tipo_documento1` FOREIGN KEY (`tipo_documento_id`) REFERENCES `fisc_tipo_documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_origem1` FOREIGN KEY (`origem_id`) REFERENCES `fisc_origem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table_solicitante` FOREIGN KEY (`id_solicitante`) REFERENCES `fisc_solicitante` (`id`);

--
-- Limitadores para a tabela `fisc_solicitacao`
--
ALTER TABLE `fisc_solicitacao`
  ADD CONSTRAINT `fk_fisc_solicitacao_bairro1` FOREIGN KEY (`bairro_id`) REFERENCES `bairro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fisc_solicitacao_cidade1` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fisc_solicitacao_fisc_protocolo1` FOREIGN KEY (`protocolo_id`) REFERENCES `fisc_protocolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fisc_solicitacao_fisc_tipo_solicitação1` FOREIGN KEY (`tipo_solicitacao_id`) REFERENCES `fisc_tipo_solicitacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fisc_solicitacao_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fisc_tipo_classificao`
--
ALTER TABLE `fisc_tipo_classificao`
  ADD CONSTRAINT `fisc_tipo_classificao_ibfk_1` FOREIGN KEY (`infracao_id`) REFERENCES `fisc_tipo_infracao` (`id`);

--
-- Limitadores para a tabela `fisc_tipo_documento`
--
ALTER TABLE `fisc_tipo_documento`
  ADD CONSTRAINT `fk_fisc_tipo_documento_fisc_protocolo1` FOREIGN KEY (`protocolo_id`) REFERENCES `fisc_tipo_protocolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fisc_tipo_infracao`
--
ALTER TABLE `fisc_tipo_infracao`
  ADD CONSTRAINT `fisc_tipo_infracao_ibfk_1` FOREIGN KEY (`tipo_denuncia_id`) REFERENCES `fisc_tipo_denuncia` (`id`);

--
-- Limitadores para a tabela `fisc_vistoria_denuncia`
--
ALTER TABLE `fisc_vistoria_denuncia`
  ADD CONSTRAINT `fk_fisc_vistoria_denuncia_fisc_denuncia1` FOREIGN KEY (`denuncia_id`) REFERENCES `fisc_denuncia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fisc_vistoria_solicitacao`
--
ALTER TABLE `fisc_vistoria_solicitacao`
  ADD CONSTRAINT `fk_fisc_vistoria_solicitacao_fisc_solicitacao1` FOREIGN KEY (`solicitacao_id`) REFERENCES `fisc_solicitacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `protocolo`
--
ALTER TABLE `protocolo`
  ADD CONSTRAINT `fk_protocolo_processos_usuario1` FOREIGN KEY (`protocolista_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_protocolo_protocolo_objetivo1` FOREIGN KEY (`objetivo_id`) REFERENCES `protocolo_objetivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_protocolo_protocolo_tipo1` FOREIGN KEY (`tipo_id`) REFERENCES `protocolo_tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `protocolo_anexo`
--
ALTER TABLE `protocolo_anexo`
  ADD CONSTRAINT `fk_protocolo_anexo_protocolo1` FOREIGN KEY (`protocolo_id`) REFERENCES `protocolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `protocolo_historico`
--
ALTER TABLE `protocolo_historico`
  ADD CONSTRAINT `fk_protocolo_historico_protocolo1` FOREIGN KEY (`protocolo_id`) REFERENCES `protocolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_protocolo_historico_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `protocolo_objetivo`
--
ALTER TABLE `protocolo_objetivo`
  ADD CONSTRAINT `fk_protocolo_objetivo_protocolo_tipo1` FOREIGN KEY (`tipo_id`) REFERENCES `protocolo_tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `ti_chamado`
--
ALTER TABLE `ti_chamado`
  ADD CONSTRAINT `fk_chamado_chamado_status1` FOREIGN KEY (`status_id`) REFERENCES `ti_chamado_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chamado_setor` FOREIGN KEY (`setor_id`) REFERENCES `setor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chamado_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ti_chamado_ti_chamado_assunto1` FOREIGN KEY (`assunto_id`) REFERENCES `ti_chamado_assunto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `ti_chamado_historico`
--
ALTER TABLE `ti_chamado_historico`
  ADD CONSTRAINT `fk_chamado_historico_chamado1` FOREIGN KEY (`chamado_id`) REFERENCES `ti_chamado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chamado_historico_chamado_status1` FOREIGN KEY (`status_id`) REFERENCES `ti_chamado_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chamado_historico_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tramitacao`
--
ALTER TABLE `tramitacao`
  ADD CONSTRAINT `fk_tramitacao_protocolo1` FOREIGN KEY (`protocolo_id`) REFERENCES `protocolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tramitacao_setor1` FOREIGN KEY (`setor_remetente_id`) REFERENCES `setor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tramitacao_setor2` FOREIGN KEY (`setor_destinatario_id`) REFERENCES `setor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tramitacao_usuario1` FOREIGN KEY (`usuario_remetente_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tramitacao_usuario2` FOREIGN KEY (`usuario_destinatario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_setor1` FOREIGN KEY (`setor_id`) REFERENCES `setor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
