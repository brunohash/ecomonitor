-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Tempo de geração: 22/11/2024 às 01:30
-- Versão do servidor: 5.7.39
-- Versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `EcoMonitor`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aparelhos`
--

CREATE TABLE `aparelhos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `Imagem` varchar(300) DEFAULT NULL,
  `consumo_medio` varchar(300) NOT NULL,
  `unidade_medida` varchar(20) DEFAULT 'kWh/h',
  `observacoes` text,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `aparelhos`
--

INSERT INTO `aparelhos` (`id`, `nome`, `Imagem`, `consumo_medio`, `unidade_medida`, `observacoes`, `id_categoria`) VALUES
(31, 'Lâmpada Fluorescente Compacta (20W)', '', '0.02', 'kWh/h', 'Opção eficiente em relação às incandescentes.', 1),
(32, 'Luminária de LED (50W)', '', '0.05', 'kWh/h', 'Usada em escritórios ou residências.', 1),
(33, 'Refletor LED (100W)', '', '0.1', 'kWh/h', 'Ideal para áreas externas.', 1),
(34, 'Lâmpada Halógena (50W)', '', '0.05', 'kWh/h', 'Consumo elevado e vida útil curta.', 1),
(35, 'Lâmpada de LED (15W)', '', '0.015', 'kWh/h', 'Baixo consumo, boa durabilidade.', 1),
(36, 'Lâmpada Incandescente (60W)', '', '0.06', 'kWh/h', 'Consumo muito elevado.', 1),
(37, 'Arandela LED (10W)', '', '0.01', 'kWh/h', 'Ideal para decoração e ambientes pequenos.', 1),
(38, 'Fita de LED (5 metros)', '', '0.05', 'kWh/h', 'Econômica e versátil para diferentes ambientes.', 1),
(39, 'Liquidificador', '', '0.3', 'kWh/h', 'Consumo médio durante uso contínuo.', 2),
(40, 'Batedeira', '', '0.2', 'kWh/h', 'Varia com potência e tempo de uso.', 2),
(41, 'Panela Elétrica', '', '0.8', 'kWh/h', 'Boa alternativa para cozinhar.', 2),
(42, 'Fritadeira Elétrica', '', '1.5', 'kWh/h', 'Consumo por hora de fritura.', 2),
(43, 'Cafeteira Elétrica', '', '0.8', 'kWh/h', 'Consumo ao preparar café.', 2),
(44, 'Torradeira', '', '1.2', 'kWh/h', 'Consumo médio por uso.', 2),
(45, 'Fogão de Indução (1 Boca)', '', '2', 'kWh/h', 'Varia conforme potência e intensidade.', 2),
(46, 'Exaustor de Cozinha', '', '0.1', 'kWh/h', 'Usado para ventilação durante o preparo de alimentos.', 2),
(47, 'Aspirador de Pó', '', '0.5', 'kWh/h', 'Consumo médio em uso contínuo.', 2),
(48, 'Lavadora de Alta Pressão', '', '1.8', 'kWh/h', 'Consumo elevado para limpezas intensivas.', 2),
(49, 'Vaporizador de Roupas', '', '1.6', 'kWh/h', 'Alternativa ao ferro de passar.', 2),
(50, 'Secadora de Roupas', '', '2.5', 'kWh/h', 'Consumo elevado em uso contínuo.', 2),
(51, 'Máquina de Lavar Louça', '', '1.2', 'kWh/h', 'Consumo durante ciclo completo.', 2),
(52, 'Ferreiro de Passar Roupa', '', '1', 'kWh/h', 'Consumo médio durante uso.', 2),
(53, 'Desumidificador de Ar', '', '0.8', 'kWh/h', 'Boa opção para ambientes úmidos.', 2),
(54, 'Console de Videogame', '', '0.15', 'kWh/h', 'Consumo médio durante jogo ativo.', 3),
(55, 'Monitor LED (24 polegadas)', '', '0.03', 'kWh/h', 'Consumo em operação padrão.', 3),
(56, 'Impressora Multifuncional', '', '0.3', 'kWh/h', 'Consumo ao imprimir ou digitalizar.', 3),
(57, 'Servidor de Rede', '', '1.5', 'kWh/h', 'Consumo médio em operação contínua.', 3),
(58, 'Home Theater', '', '0.2', 'kWh/h', 'Consumo médio durante uso ativo.', 3),
(59, 'Rádio AM/FM', '', '0.02', 'kWh/h', 'Consumo baixo durante o uso.', 3),
(60, 'Projetor de Vídeo', '', '0.3', 'kWh/h', 'Consumo médio em apresentações.', 3),
(61, 'Receptor de TV a Cabo', '', '0.05', 'kWh/h', 'Consumo contínuo em standby.', 3),
(62, 'Telefone Sem Fio', '', '0.01', 'kWh/h', 'Consumo muito baixo durante uso contínuo.', 3),
(63, 'Caixa de Som Bluetooth', '', '0.04', 'kWh/h', 'Consumo baixo durante reprodução de áudio.', 3),
(64, 'Impressora Laser', '', '0.5', 'kWh/h', 'Consumo durante impressão contínua.', 4),
(65, 'Furadeira de Bancada', '', '1.2', 'kWh/h', 'Consumo elevado durante uso contínuo.', 4),
(66, 'Computador Desktop', '', '0.3', 'kWh/h', 'Consumo médio durante operação contínua.', 4),
(67, 'Scanner de Documentos', '', '0.2', 'kWh/h', 'Consumo médio durante digitalização.', 4),
(68, 'Ar-condicionado Split (18.000 BTU)', '', '1.8', 'kWh/h', 'Potência maior para ambientes amplos.', 4),
(69, 'Micro-ondas Industrial', '', '1.5', 'kWh/h', 'Consumo elevado durante uso intensivo.', 4),
(70, 'Máquina de Café Expresso', '', '0.8', 'kWh/h', 'Consumo médio durante preparo do café.', 4),
(71, 'Esteira Ergométrica', '', '1', 'kWh/h', 'Consumo médio durante uso contínuo.', 5),
(72, 'Bicicleta Ergométrica', '', '0.2', 'kWh/h', 'Consumo médio por hora.', 5),
(73, 'Aquecedor de Ambiente', '', '2', 'kWh/h', 'Consumo elevado em uso contínuo.', 5),
(74, 'Cama Elétrica', '', '0.3', 'kWh/h', 'Boa opção para aquecer ambientes.', 5),
(75, 'Massageador Elétrico', '', '0.05', 'kWh/h', 'Consumo baixo durante o uso.', 5),
(76, 'string', 'string', 'string', 'string', 'string', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `casa`
--

CREATE TABLE `casa` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(300) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `casa`
--

INSERT INTO `casa` (`id`, `id_usuario`, `nome`, `created_at`) VALUES
(1, 1, 'Minha Casa', '2024-11-21 17:34:18'),
(2, 1, 'minha_casa_1', '2024-11-21 21:09:55'),
(14, 1, 'minha_casa_3', '2024-11-21 21:16:24');

-- --------------------------------------------------------

--
-- Estrutura para tabela `casa_aparelhos`
--

CREATE TABLE `casa_aparelhos` (
  `id` int(11) NOT NULL,
  `id_casa` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_aparelho` int(11) NOT NULL,
  `tempo_consumo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `casa_aparelhos`
--

INSERT INTO `casa_aparelhos` (`id`, `id_casa`, `id_usuario`, `id_aparelho`, `tempo_consumo`) VALUES
(1, 1, 1, 31, 120),
(2, 1, 1, 41, 90),
(3, 1, 1, 54, 180),
(4, 1, 1, 1, 100);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_aparelhos`
--

CREATE TABLE `categoria_aparelhos` (
  `id` int(11) NOT NULL,
  `nome_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `categoria_aparelhos`
--

INSERT INTO `categoria_aparelhos` (`id`, `nome_categoria`) VALUES
(1, 'Iluminação'),
(2, 'Eletrodoméstico'),
(3, 'Eletrônico'),
(4, 'Industrial/Escritório'),
(5, 'Saúde/Fitness'),
(6, 'Ar-Condicionado'),
(7, 'Vigilância'),
(8, 'Cozinha'),
(9, 'Tecnologia'),
(10, 'Automação');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(300) NOT NULL,
  `created_at` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `created_at`) VALUES
(1, 'João Silva', 'joao.silva@email.com', 'senha123', '2024-11-21 17:34:08'),
(3, 'string', 'string', '473287F8298DBA7163A897908958F7C0EAE733E25D2E027992EA2EDC9BED2FA8', '2024-11-21 21:20:44');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aparelhos`
--
ALTER TABLE `aparelhos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `casa`
--
ALTER TABLE `casa`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `casa_aparelhos`
--
ALTER TABLE `casa_aparelhos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categoria_aparelhos`
--
ALTER TABLE `categoria_aparelhos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aparelhos`
--
ALTER TABLE `aparelhos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de tabela `casa`
--
ALTER TABLE `casa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `casa_aparelhos`
--
ALTER TABLE `casa_aparelhos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `categoria_aparelhos`
--
ALTER TABLE `categoria_aparelhos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
