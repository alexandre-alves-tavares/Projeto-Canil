-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 18-Jun-2015 às 21:53
-- Versão do servidor: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bd_henrique`
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
(1, 'Roberto dos Santos Oliveira', '432.556.771-12', 'Avenida Francisco de Souza, 995, Vila Rezende, Piracicaba', '(019)3467-1755', 'rob.santos@gmail.com', '2010-12-01', 'poliana', 'poliana');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Extraindo dados da tabela `animal`
--

INSERT INTO `animal` (`codAnimal`, `nome`, `bairroRecolhimento`, `dataEntrada`, `tipo`, `sexo`, `peso`, `idade`, `cor`, `pelagem`, `raca`, `agressor`, `racao`, `baia`, `observacao`, `foto`) VALUES
(15, 'Tora', 'teste', '2015-06-15', '1', 'femea', 8, '5', 'Branco', 'Outros', 'SRD', 'sim', 'testeteste', 2, ' ', '1.jpg'),
(4, 'Mocinha', 'Centro', '2015-06-10', 'Gato', 'Fêmea', 5, '5', 'Tricolor', 'Curto', 'SRD', 'Não', 'M', 2, ' Encontrada com boa aparência, provelmente foi abandonada.', '2.jpg'),
(5, 'Odin', 'Paulicéia', '2015-06-01', 'Gato', 'Macho', 9, '3 à 6', 'Preto', 'Média', 'Angorá', 'Não', 'G', 3, '', '3.jpg'),
(6, 'Toummas', 'Nova Piracicaba', '2015-06-03', 'Gato', 'Macho', 6, '0 à 1', 'Tricolor', 'Curto', 'SRD', 'Não', 'P', 5, 'Filhote encontrado sozinho em caixa.', '4.jpg'),
(7, 'Peppa', 'Vila Rezende', '2015-06-02', 'Cachorro', 'Femea', 6, '3', 'Amarelo', 'Grande', 'Golden Retrivier', 'Não', 'G', 4, 'Família abandonou', '5.jpg'),
(8, 'Lili', 'Paulista', '2015-06-05', 'Cachorro', 'Fêmea', 1, '0 à 1', 'Marrom', 'Curto', 'SRD', 'Não', 'P', 6, 'Filhote de ninhada.', '7.jpg'),
(9, 'Pitoco', 'Paulista', '2015-06-03', 'Cachorro', 'Macho', 1, '0 a 1', 'Marrom', 'Curto', 'SRD', 'Não', 'P', 6, 'Filhote de ninhada.', '6.jpg'),
(14, 'Scooby', 'Paulista', '2015-06-03', 'Cachorro', 'Macho', 1, '0 a 1', 'Marrom', 'Curto', 'SRD', 'Não', 'P', 6, 'Filhote de ninhada', '8.jpg'),
(43, 'Tiquinha', 'Centro', '2015-06-18', 'Cachorro', 'Femea', 2, '8', 'Outros', 'Médio', 'RND', 'Não', 'Grande', 2, 'Tem dono', '1.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `baia`
--

CREATE TABLE IF NOT EXISTS `baia` (
  `codBaia` int(11) NOT NULL AUTO_INCREMENT,
  `nomeBaia` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codBaia`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `baia`
--

INSERT INTO `baia` (`codBaia`, `nomeBaia`) VALUES
(1, 'BA111'),
(2, 'BA2'),
(3, 'A333'),
(4, 'BA4'),
(5, 'BA5'),
(6, 'BC1'),
(8, 'a874'),
(9, 'Baiateste');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `castracao`
--

INSERT INTO `castracao` (`codCastracao`, `codAnimal`, `dataCastracao`, `codVeterinario`, `observacao`) VALUES
(1, 2, '2015-04-20', 2, 'aaaaaaaaaaaaaa'),
(2, 6, '2015-06-08', 2, 'teste teste'),
(8, 4, '2015-06-17', 2, 'teste'),
(4, 8, '2015-06-08', 2, 'testeoi'),
(5, 8, '2015-06-08', 2, 'testeoi'),
(6, 8, '2015-06-08', 2, 'testeoi'),
(7, 15, '2015-06-08', 2, '123456987 teste deu certo uhuuuuu '),
(9, 15, '2015-06-17', 3, '20202020');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `medicamento`
--

INSERT INTO `medicamento` (`codMedicamento`, `nomeMedicamento`, `tipo`, `doses`, `descricao`) VALUES
(1, 'Rificinaa', 'Outros', 10, 'teste teste '),
(2, 'teste', 'Vacina', 1, 'teste teste');

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
  `dataEntrada` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`codTratamento`),
  KEY `codAnimal` (`codAnimal`),
  KEY `codMedicamento` (`codMedicamento`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `tratamento`
--

INSERT INTO `tratamento` (`codTratamento`, `codAnimal`, `codMedicamento`, `loteMedicamento`, `quantidade`, `intervalo`, `duracao`, `observacao`, `dataEntrada`, `status`) VALUES
(1, 4, 1, '456.hij 25-12-2014', 3, 8, 3, 'Tratamento feito com sucesso', '2015-06-03', 1),
(2, 15, 1, '1', 1, 1, 1, '1', '2015-06-08', 1),
(3, 4, 1, 'teste', 1, 1, 1, 'teste', '2015-06-17', 1),
(4, 42, 1, '1234654', 10, 1, 1, 'teste', '2015-06-18', 1),
(5, 43, 1, 'teste', 10, 12, 3, 'aplica todo ida', '2015-06-18', 1);

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
  `senha` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`codVeterinario`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `veterinario`
--

INSERT INTO `veterinario` (`codVeterinario`, `nome`, `crm`, `cpf`, `endereco`, `telefone`, `email`, `dataContratacao`, `usuario`, `senha`) VALUES
(2, 'Alexandre', '115959', '545451', 'rua cananeia, 190', '34221931', 'alexandre_alt@hotmail.com', '2015-06-08', 'poliana', '5f4dcc3b5aa7'),
(3, 'Alex', '14265', '12345679', 'rua dos alex', '147852369', 'alex@alex.com', '2015-06-14', 'alex', '5f4dcc3b5aa7'),
(4, 'teste', '33254', '48596521470', 'testeteste', '32145844', 'teste@teste', '2015-06-17', 'testeteste', '5f4dcc3b5aa7'),
(6, 'teste123456', '34123', '12345678910', 'testetweq', '2342343', 'teste@teste', '2015-06-18', 'aaaaaa', 'teste');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
