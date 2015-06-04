-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 04-Jun-2015 às 04:58
-- Versão do servidor: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bd_canil`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adotante`
--

CREATE TABLE IF NOT EXISTS `adotante` (
  `codAdotante` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `codAnimal` int(11) NOT NULL,
  `dataAdocao` date DEFAULT NULL,
  PRIMARY KEY (`codAdotante`),
  KEY `codAnimal` (`codAnimal`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `adotante`
--

INSERT INTO `adotante` (`codAdotante`, `nome`, `cpf`, `endereco`, `telefone`, `email`, `codAnimal`, `dataAdocao`) VALUES
(1, 'Joana Barbosa', '063.876.667-08', 'Rua Governador Joao Paulo, 87, Bairro Alto, Piracicaba', '(019)3425-7570', 'joanabarbosa@gmail.com', 1, '2010-12-01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `agente`
--

CREATE TABLE IF NOT EXISTS `agente` (
  `codAgente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `dataContratacao` date DEFAULT NULL,
  `usuario` varchar(10) NOT NULL,
  `senha` varchar(10) NOT NULL,
  PRIMARY KEY (`codAgente`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `agente`
--

INSERT INTO `agente` (`codAgente`, `nome`, `cpf`, `endereco`, `telefone`, `email`, `dataContratacao`, `usuario`, `senha`) VALUES
(1, 'Roberto dos Santos Oliveira', '432.556.771-12', 'Avenida Francisco de Souza, 995, Vila Rezende, Piracicaba', '(019)3467-1755', 'rob.santos@gmail.com', '2010-12-01', 'robsa', '98765');

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal`
--

CREATE TABLE IF NOT EXISTS `animal` (
  `codAnimal` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT NULL,
  `bairroRecolhimento` varchar(15) DEFAULT NULL,
  `dataEntrada` date DEFAULT NULL,
  `tipo` varchar(8) DEFAULT NULL,
  `sexo` varchar(5) DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `idade` varchar(10) DEFAULT NULL,
  `cor` varchar(10) DEFAULT NULL,
  `pelagem` varchar(10) DEFAULT NULL,
  `raca` varchar(20) DEFAULT NULL,
  `agressor` varchar(3) DEFAULT NULL,
  `racao` varchar(10) DEFAULT NULL,
  `baia` int(11) DEFAULT NULL,
  `observacao` varchar(80) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codAnimal`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Extraindo dados da tabela `animal`
--

INSERT INTO `animal` (`codAnimal`, `nome`, `bairroRecolhimento`, `dataEntrada`, `tipo`, `sexo`, `peso`, `idade`, `cor`, `pelagem`, `raca`, `agressor`, `racao`, `baia`, `observacao`, `foto`) VALUES
(15, '123', '1', NULL, '1', 'macho', 1, '0', 'Branco', 'Outros', '1', 'nao', 'null', 2, ' ', NULL),
(4, 'Teste', '1', NULL, 'Cachorro', 'Macho', 1, '10', 'Branco', 'Curto', '1', 'Sim', '1', 1, ' teste', NULL),
(5, '1', '1', NULL, 'Cachorro', 'Macho', 1, '1', 'Branco', 'Curto', '1', 'Sim', '1', 1, ' teste1', NULL),
(6, '2', '1', NULL, 'Cachorro', 'Macho', 1, '1', 'Branco', 'Curto', '1', 'Sim', '1', 1, ' teste1', NULL),
(7, '3', '1', NULL, 'Cachorro', 'Femea', 1, '1', 'Branco', 'Curto', '1', 'Sim', '1', 1, ' 1', NULL),
(8, '4', '4', NULL, 'Cachorro', 'Macho', 1, '4', 'Branco', 'Curto', '4', 'Sim', '4', 1, ' 4', NULL),
(9, '4', '4', NULL, 'Cachorro', 'Macho', 1, '4', 'Branco', 'Curto', '4', 'Sim', '4', 1, ' 4', NULL),
(14, '1', 'pauliceia', NULL, 'Cachorro', 'Macho', 1, '1', 'Branco', 'Curto', '1', 'Sim', '1', 2, ' teste', NULL),
(11, 'Testefoto', '1', NULL, 'Cachorro', 'Macho', 1, '1', 'Branco', 'Curto', '1', 'Sim', '1', 1, ' teste', 'download (3).jpg'),
(12, 'testefoto1', 'pauliceia', NULL, 'Cachorro', 'Macho', 2, '2', 'Branco', 'Curto', '1', 'Sim', '1', 1, ' teste', 'download (4).jpg'),
(16, 'Scooby', 'pauliceia', NULL, 'Cachorro', 'Macho', 10, '13', 'Branco', 'Curto', 'sem raça definida', 'Não', 'gg', 1, ' teste', NULL),
(17, 'teste', '1', NULL, 'Cachorro', 'Macho', 1, '1', 'Branco', 'Curto', '1', 'Sim', '1', 1, ' teste', NULL),
(18, 'Teste', '1', '2015-06-01', 'Cachorro', 'Macho', 1, '1', 'Branco', 'Curto', '1', 'Sim', '1', 1, ' teste', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `baia`
--

CREATE TABLE IF NOT EXISTS `baia` (
  `codBaia` int(11) NOT NULL AUTO_INCREMENT,
  `nomeBaia` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codBaia`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `baia`
--

INSERT INTO `baia` (`codBaia`, `nomeBaia`) VALUES
(1, 'A1'),
(2, 'A3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `banho`
--

CREATE TABLE IF NOT EXISTS `banho` (
  `codBanho` int(11) NOT NULL AUTO_INCREMENT,
  `codAnimal` int(11) NOT NULL,
  `dataBanho` date NOT NULL,
  `sociavelPessoas` tinyint(1) DEFAULT NULL,
  `sociavelAnimais` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codBanho`),
  KEY `codAnimal` (`codAnimal`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `banho`
--

INSERT INTO `banho` (`codBanho`, `codAnimal`, `dataBanho`, `sociavelPessoas`, `sociavelAnimais`) VALUES
(1, 1, '2015-04-27', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `castracao`
--

CREATE TABLE IF NOT EXISTS `castracao` (
  `codCastracao` int(11) NOT NULL AUTO_INCREMENT,
  `codAnimal` int(11) NOT NULL,
  `dataCastracao` date DEFAULT NULL,
  `codVeterinario` int(11) NOT NULL,
  `observacao` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`codCastracao`),
  KEY `codAnimal` (`codAnimal`),
  KEY `codVeterinario` (`codVeterinario`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `castracao`
--

INSERT INTO `castracao` (`codCastracao`, `codAnimal`, `dataCastracao`, `codVeterinario`, `observacao`) VALUES
(1, 1, '2015-04-20', 1, 'Castracao feita com sucesso');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lazer`
--

CREATE TABLE IF NOT EXISTS `lazer` (
  `codLazer` int(11) NOT NULL AUTO_INCREMENT,
  `codAnimal` int(11) NOT NULL,
  `dataLazer` date NOT NULL,
  `sociavelPessoas` tinyint(1) DEFAULT NULL,
  `sociavelAnimais` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codLazer`),
  KEY `codAnimal` (`codAnimal`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `lazer`
--

INSERT INTO `lazer` (`codLazer`, `codAnimal`, `dataLazer`, `sociavelPessoas`, `sociavelAnimais`) VALUES
(1, 1, '2015-04-27', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicamento`
--

CREATE TABLE IF NOT EXISTS `medicamento` (
  `codMedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `nomeMedicamento` varchar(20) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `doses` int(5) DEFAULT NULL,
  `descricao` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`codMedicamento`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `medicamento`
--

INSERT INTO `medicamento` (`codMedicamento`, `nomeMedicamento`, `tipo`, `doses`, `descricao`) VALUES
(1, 'Rificina', 'Vacina', 11, 'Rificina testee'),
(3, 'teste2', '1', 1, '1'),
(4, 'teste33', 'Outros', 1, '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `microchipagem`
--

CREATE TABLE IF NOT EXISTS `microchipagem` (
  `codMicro` int(11) NOT NULL AUTO_INCREMENT,
  `codAnimal` int(11) NOT NULL,
  `numeroMicrochip` varchar(30) NOT NULL,
  `dataAplicacao` date NOT NULL,
  PRIMARY KEY (`codMicro`),
  KEY `codAnimal` (`codAnimal`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `microchipagem`
--

INSERT INTO `microchipagem` (`codMicro`, `codAnimal`, `numeroMicrochip`, `dataAplicacao`) VALUES
(1, 1, '1234.567.890', '2015-04-03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `recolhimento`
--

CREATE TABLE IF NOT EXISTS `recolhimento` (
  `codRecolhimento` int(11) NOT NULL AUTO_INCREMENT,
  `codAnimal` int(11) NOT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `dataRecolhimento` date DEFAULT NULL,
  PRIMARY KEY (`codRecolhimento`),
  KEY `codAnimal` (`codAnimal`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `recolhimento`
--

INSERT INTO `recolhimento` (`codRecolhimento`, `codAnimal`, `endereco`, `dataRecolhimento`) VALUES
(1, 1, 'Rua Alferes, 157, Bairro Alto', '2015-04-20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tratamento`
--

CREATE TABLE IF NOT EXISTS `tratamento` (
  `codTratamento` int(11) NOT NULL AUTO_INCREMENT,
  `codAnimal` int(11) NOT NULL,
  `codMedicamento` int(11) NOT NULL,
  `loteMedicamento` varchar(20) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `intervalo` int(11) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `observacao` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`codTratamento`),
  KEY `codAnimal` (`codAnimal`),
  KEY `codMedicamento` (`codMedicamento`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tratamento`
--

INSERT INTO `tratamento` (`codTratamento`, `codAnimal`, `codMedicamento`, `loteMedicamento`, `quantidade`, `intervalo`, `duracao`, `observacao`) VALUES
(1, 4, 1, '456.hij 25-12-2014', 3, 8, 3, 'Tratamento feito com sucessoo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veterinario`
--

CREATE TABLE IF NOT EXISTS `veterinario` (
  `codVeterinario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `crm` varchar(10) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `dataContratacao` date DEFAULT NULL,
  `usuario` varchar(10) NOT NULL,
  `senha` varchar(10) NOT NULL,
  PRIMARY KEY (`codVeterinario`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `veterinario`
--

INSERT INTO `veterinario` (`codVeterinario`, `nome`, `crm`, `cpf`, `endereco`, `telefone`, `email`, `dataContratacao`, `usuario`, `senha`) VALUES
(2, 'teste', NULL, NULL, NULL, NULL, '', NULL, 'teste', '123'),
(3, 'teste2', '1', '1', '1', '1', '1', '2015-05-03', 'teste3', '3211'),
(4, 'teste3', NULL, NULL, NULL, NULL, '', NULL, 'teste2', '987'),
(5, 'teste5', NULL, NULL, NULL, NULL, '', NULL, 'teste5', '654');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
