-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 27 Avril 2016 à 00:55
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `epgm_bdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(70) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(70) COLLATE utf8_bin NOT NULL,
  `username` varchar(70) COLLATE utf8_bin NOT NULL,
  `mdp` varchar(70) COLLATE utf8_bin NOT NULL,
  `id_port` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=27 ;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `nom`, `prenom`, `username`, `mdp`, `id_port`) VALUES
(24, 'GUERRAH', 'ABDELAZIZ', 'AlgerAdmin', 'e6gf5s46h6g4hy83gj59r5g4rz60alger2016', 47),
(25, 'CHANG', 'LI HAN', 'HongKongAdmin', 'e6gf5s46h6g4hy83gj59r5g4rz60hongkong2016', 48),
(26, 'AMRANI', 'IDRIS', 'BejaiaAdmin', 'e6gf5s46h6g4hy83gj59r5g4rz60bejaia2016', 49);

-- --------------------------------------------------------

--
-- Structure de la table `attente`
--

CREATE TABLE IF NOT EXISTS `attente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `id_navire` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `id_port` int(11) NOT NULL,
  `priorite` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=121 ;

--
-- Contenu de la table `attente`
--

INSERT INTO `attente` (`id`, `date`, `id_navire`, `date_debut`, `date_fin`, `id_port`, `priorite`) VALUES
(119, '2016-04-11', 139, '2016-04-24', '2016-04-28', 47, 0),
(120, '2016-04-18', 140, '2016-04-24', '2016-04-30', 47, 5);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_port` int(11) NOT NULL,
  `categories` varchar(70) COLLATE utf8_bin NOT NULL,
  `priorites` varchar(70) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=35 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `id_port`, `categories`, `priorites`) VALUES
(32, 47, '030405060710', '100604070305'),
(33, 48, '0103040506070809101113', '1006070401130308090511'),
(34, 49, '03040607091013', '10060407090313');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `nom` varchar(70) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(70) COLLATE utf8_bin NOT NULL,
  `entreprise` varchar(70) COLLATE utf8_bin NOT NULL,
  `username` varchar(70) COLLATE utf8_bin NOT NULL,
  `mdp` varchar(70) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`nom`, `prenom`, `entreprise`, `username`, `mdp`, `id`) VALUES
('Zemir', 'Assia', 'BRITISH PERTROLEUM', 'zemirassia@gmail.com', 'aa36dc6e81e2ac7ad03e12fedcb6a2c0', 6),
('Baghdali', 'Rachid Abderahmane', 'CEVITAL', 'baghdali@gmail.com', 'aa36dc6e81e2ac7ad03e12fedcb6a2c0', 7),
('Touahria', 'Amel', 'TOTAL', 'touahria@gmail.com', 'aa36dc6e81e2ac7ad03e12fedcb6a2c0', 8),
('Bennani', 'Chahrazed', 'TECHNO', 'bennani@gmail.com', 'aa36dc6e81e2ac7ad03e12fedcb6a2c0', 9),
('Kerkar', 'Nawal', 'OXFORD', 'kerkar@gmail.com', 'aa36dc6e81e2ac7ad03e12fedcb6a2c0', 10),
('Roudali', 'Hemza', 'INTEL', 'roudali@gmail.com', 'aa36dc6e81e2ac7ad03e12fedcb6a2c0', 11);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_navire` int(11) NOT NULL,
  `date` date NOT NULL,
  `tarif` double NOT NULL,
  `penalite` double NOT NULL,
  `remise` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=60 ;

-- --------------------------------------------------------

--
-- Structure de la table `navire`
--

CREATE TABLE IF NOT EXISTS `navire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(70) NOT NULL,
  `categorie` enum('Conteneurs','Marchandises diverses','Papeterie','Petrolier','Gazier','Animalier','Cerealier','Sucre','Electronique','Medicaments et produits pharmaceutiques','Produits chimiques','Substances radioactives','Armes et equipements militaires') NOT NULL,
  `proprietaire` varchar(70) NOT NULL,
  `nationalite` varchar(70) NOT NULL,
  `longueur` float NOT NULL,
  `largeur` float NOT NULL,
  `tirant_d_eau` float NOT NULL,
  `type_de_ligne` enum('Reguliere','Non Reguliere') NOT NULL,
  `situation` enum('En mer','En rade','En quai') NOT NULL,
  `id_client` int(11) NOT NULL,
  `trace` varchar(700) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=141 ;

--
-- Contenu de la table `navire`
--

INSERT INTO `navire` (`id`, `nom`, `categorie`, `proprietaire`, `nationalite`, `longueur`, `largeur`, `tirant_d_eau`, `type_de_ligne`, `situation`, `id_client`, `trace`) VALUES
(127, 'Saint-Clarence', 'Conteneurs', 'Jean-Pierre Berger', 'France', 170, 36, 6.5, 'Non Reguliere', 'En mer', 9, 'Marseille Californie Alger'),
(128, 'Patricia', 'Marchandises diverses', 'Hommer Simson', 'France', 89, 24, 5, 'Non Reguliere', 'En mer', 9, 'Hong-Kong Sidney Madagascar Caire Alger'),
(129, 'Wind Dancer', 'Petrolier', 'Tegan Cumpston', 'Etats-Unis', 100, 26, 7, 'Reguliere', 'En mer', 6, 'Shanghai Bussai Houston Bejaia Hong-Kong Rotterdam'),
(130, 'Orion', 'Petrolier', 'Evita Greear', 'Royaume-Unis', 100, 30, 7, 'Reguliere', 'En mer', 6, 'Alger London Dubai Houston'),
(131, 'Theodora', 'Cerealier', 'Adam Crossen', 'Algerie', 65, 21, 5, 'Reguliere', 'En mer', 7, 'Alger Hong-Kong Houston Shanghai'),
(132, 'Tamika', 'Sucre', 'Ahmed Witek', 'France', 62, 12, 5, 'Non Reguliere', 'En mer', 7, 'Alger Hong-Kong Houston Shanghai'),
(133, 'Maria', 'Gazier', 'Lien Simmer', 'Allemagne', 122, 32, 8, 'Reguliere', 'En mer', 8, 'Singapour Houston Berlin Alger'),
(134, 'Ziyad', 'Gazier', 'Hwa Eshelman', 'Allemagne', 122, 32, 8, 'Reguliere', 'En mer', 8, 'Singapour Houston Berlin Alger'),
(135, 'Alice', 'Papeterie', 'Betsey Fronk', 'Afrique-Du-Sud', 86, 12, 5, 'Non Reguliere', 'En mer', 10, 'New-Jersey Vancouver Santos Bejaia'),
(136, 'Titanic', 'Papeterie', 'Willena Doughtie', 'Chine', 86, 12, 5, 'Non Reguliere', 'En mer', 10, 'New-Jersey Vancouver Santos Bejaia'),
(137, 'Corrina', 'Electronique', 'Josiah Drown', 'Algerie', 78, 19, 7, 'Non Reguliere', 'En mer', 11, 'Izmir Djedda Havre Hong Kong'),
(138, 'Dalene', 'Conteneurs', 'Nicky shif', 'Algerie', 78, 19, 7, 'Non Reguliere', 'En mer', 11, 'Izmir Djedda Havre Hong Kong'),
(139, 'Luna', 'Gazier', 'Lien Simmer', 'Allemagne', 122, 32, 8, 'Reguliere', 'En mer', 8, 'Singapour Houston Berlin Alger'),
(140, 'Helene', 'Cerealier', 'Nicky shif', 'Algerie', 78, 19, 7, 'Non Reguliere', 'En mer', 11, 'Izmir Djedda Havre Hong Kong');

-- --------------------------------------------------------

--
-- Structure de la table `port`
--

CREATE TABLE IF NOT EXISTS `port` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emplacement` varchar(70) NOT NULL,
  `nom` varchar(70) NOT NULL,
  `categorie` enum('Maritime') NOT NULL,
  `nbquais` int(11) NOT NULL,
  `pays` varchar(70) NOT NULL,
  `etat` enum('En activite','En travaux','Suspendu') NOT NULL,
  `remise` float NOT NULL,
  `augumentation` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Contenu de la table `port`
--

INSERT INTO `port` (`id`, `emplacement`, `nom`, `categorie`, `nbquais`, `pays`, `etat`, `remise`, `augumentation`) VALUES
(47, '36,873,04', 'Alger', 'Maritime', 3, 'Algerie', 'En activite', 0.25, 0.25),
(48, '21,6115,49', 'Hong Kong', 'Maritime', 5, 'Chine ', 'En activite', 0.25, 0.35),
(49, '36,825,14', 'Bejaia', 'Maritime', 4, 'Algerie', 'En activite', 0.25, 0.25);

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

CREATE TABLE IF NOT EXISTS `poste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('Conteneurs','Marchandises diverses','Papeterie','Petrolier','Gazier','Animalier','Cerealier','Sucre','Electronique','Medicaments et produits pharmaceutiques','Produits chimiques','Substances radioactives','Armes et equipements militaires') NOT NULL,
  `longueur` float NOT NULL,
  `largeur` float NOT NULL,
  `dragage` float NOT NULL,
  `situation` enum('occupe','reserve','libre','en renovation') NOT NULL,
  `id_quai` int(11) NOT NULL,
  `id_port` int(11) NOT NULL,
  `tarif` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=131 ;

--
-- Contenu de la table `poste`
--

INSERT INTO `poste` (`id`, `type`, `longueur`, `largeur`, `dragage`, `situation`, `id_quai`, `id_port`, `tarif`) VALUES
(69, 'Petrolier', 256.67, 67.4, 10, 'libre', 31, 47, 20000),
(70, 'Petrolier', 256.67, 67.4, 10, 'libre', 31, 47, 20000),
(71, 'Petrolier', 256.67, 67.4, 10, 'libre', 31, 47, 20000),
(72, 'Gazier', 135, 69, 10, 'occupe', 31, 47, 17000),
(73, 'Conteneurs', 180, 47, 10, 'libre', 32, 47, 15000),
(74, 'Conteneurs', 180, 47, 10, 'reserve', 32, 47, 1500),
(75, 'Conteneurs', 180, 47, 10, 'libre', 32, 47, 15000),
(76, 'Conteneurs', 180, 47, 10, 'libre', 32, 47, 15000),
(77, 'Cerealier', 180, 47, 10, 'occupe', 32, 47, 15000),
(78, 'Electronique', 89, 36, 8, 'libre', 33, 47, 18000),
(79, 'Marchandises diverses', 102, 40, 8, 'reserve', 33, 47, 18000),
(80, 'Marchandises diverses', 102, 40, 8, 'libre', 33, 47, 18000),
(81, 'Marchandises diverses', 102, 40, 8, 'reserve', 33, 47, 18000),
(82, 'Conteneurs', 235, 89, 12, 'libre', 34, 48, 500),
(83, 'Conteneurs', 235, 89, 12, 'libre', 34, 48, 500),
(84, 'Conteneurs', 235, 89, 12, 'libre', 34, 48, 500),
(85, 'Conteneurs', 235, 89, 12, 'libre', 34, 48, 500),
(86, 'Conteneurs', 235, 89, 12, 'libre', 34, 48, 500),
(87, 'Petrolier', 187.59, 60.3, 10, 'libre', 35, 48, 700),
(88, 'Petrolier', 187.59, 60.3, 10, 'libre', 35, 48, 700),
(89, 'Petrolier', 187.59, 60.3, 10, 'libre', 35, 48, 700),
(90, 'Gazier', 187.59, 60.3, 10, 'libre', 35, 48, 700),
(91, 'Gazier', 187.59, 60.3, 10, 'libre', 35, 48, 700),
(92, 'Marchandises diverses', 113.5, 49.67, 8, 'libre', 36, 48, 480),
(93, 'Marchandises diverses', 113.5, 49.67, 8, 'libre', 36, 48, 480),
(94, 'Marchandises diverses', 113.5, 49.67, 8, 'libre', 36, 48, 480),
(95, 'Animalier', 113.5, 49.67, 8, 'libre', 36, 48, 480),
(96, 'Animalier', 113.5, 49.67, 8, 'libre', 36, 48, 480),
(97, 'Papeterie', 127.5, 49.67, 8, 'libre', 36, 48, 560),
(98, 'Medicaments et produits pharmaceutiques', 127.5, 49.67, 8, 'libre', 37, 48, 560),
(99, 'Medicaments et produits pharmaceutiques', 127.5, 49.67, 8, 'libre', 37, 48, 560),
(100, 'Sucre', 127.5, 49.67, 8, 'libre', 37, 48, 560),
(101, 'Sucre', 127.5, 49.67, 8, 'libre', 37, 48, 560),
(102, 'Produits chimiques', 127.5, 49.67, 8, 'libre', 37, 48, 560),
(103, 'Produits chimiques', 127.5, 49.67, 8, 'libre', 37, 48, 560),
(104, 'Papeterie', 150, 50, 9, 'libre', 38, 48, 690),
(105, 'Papeterie', 150, 50, 9, 'libre', 38, 48, 690),
(106, 'Cerealier', 125, 36, 9, 'libre', 38, 48, 680),
(107, 'Cerealier', 125, 36, 9, 'libre', 38, 48, 680),
(108, 'Electronique', 125, 36, 7, 'libre', 38, 48, 530),
(109, 'Electronique', 125, 36, 7, 'libre', 38, 48, 530),
(110, 'Petrolier', 289.25, 78.5, 8, 'libre', 39, 49, 25000),
(111, 'Petrolier', 289.25, 78.5, 8, 'libre', 39, 49, 25000),
(112, 'Petrolier', 289.25, 78.5, 8, 'libre', 39, 49, 25000),
(113, 'Gazier', 289.25, 78.5, 8, 'libre', 39, 49, 25000),
(114, 'Gazier', 289.25, 78.5, 8, 'libre', 39, 49, 25000),
(115, 'Papeterie', 185, 47, 7, 'libre', 40, 49, 17800),
(116, 'Papeterie', 185, 47, 7, 'libre', 40, 49, 17800),
(117, 'Cerealier', 185, 47, 7, 'libre', 40, 49, 17800),
(118, 'Cerealier', 185, 47, 7, 'libre', 40, 49, 17800),
(119, 'Papeterie', 185, 47, 7, 'libre', 40, 49, 17800),
(120, 'Cerealier', 189, 50, 8, 'libre', 41, 49, 17600),
(121, 'Sucre', 189, 50, 8, 'libre', 41, 49, 17600),
(122, 'Sucre', 187, 50, 8, 'libre', 41, 49, 17600),
(123, 'Sucre', 187, 50, 8, 'libre', 41, 49, 17600),
(124, 'Marchandises diverses', 187, 50, 8, 'libre', 41, 49, 17600),
(125, 'Marchandises diverses', 187, 50, 8, 'libre', 41, 49, 17600),
(126, 'Marchandises diverses', 187, 50, 8, 'libre', 41, 49, 17600),
(127, 'Conteneurs', 187, 50, 10, 'libre', 42, 49, 20000),
(128, 'Conteneurs', 187, 50, 10, 'libre', 42, 49, 20000),
(129, 'Conteneurs', 187, 50, 10, 'libre', 42, 49, 20000),
(130, 'Conteneurs', 187, 50, 10, 'libre', 42, 49, 20000);

-- --------------------------------------------------------

--
-- Structure de la table `quai`
--

CREATE TABLE IF NOT EXISTS `quai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_postes` int(11) NOT NULL,
  `id_port` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_port` (`id_port`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=43 ;

--
-- Contenu de la table `quai`
--

INSERT INTO `quai` (`id`, `nb_postes`, `id_port`) VALUES
(31, 4, 47),
(32, 5, 47),
(33, 4, 47),
(34, 5, 48),
(35, 5, 48),
(36, 6, 48),
(37, 6, 48),
(38, 6, 48),
(39, 5, 49),
(40, 5, 49),
(41, 7, 49),
(42, 4, 49);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_port` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_arrivee` date NOT NULL,
  `date_fin` date NOT NULL,
  `date_sortie` date NOT NULL,
  `id_poste` int(11) NOT NULL,
  `id_navire` int(11) NOT NULL,
  `confirmation` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74 ;

--
-- Contenu de la table `reservation`
--

INSERT INTO `reservation` (`id`, `id_port`, `date_debut`, `date_arrivee`, `date_fin`, `date_sortie`, `id_poste`, `id_navire`, `confirmation`) VALUES
(62, 47, '2014-11-12', '2014-11-12', '2014-12-08', '2014-12-09', 73, 127, 1),
(63, 47, '2016-02-09', '2016-02-10', '2016-02-22', '2016-02-22', 79, 128, 1),
(64, 47, '2015-11-10', '2015-11-10', '2015-11-30', '2015-12-01', 69, 129, 1),
(65, 47, '2016-01-01', '2016-01-02', '2016-01-22', '2016-01-22', 70, 130, 1),
(66, 47, '2016-04-26', '2016-04-26', '2016-04-29', '2016-04-29', 77, 131, 1),
(68, 47, '2016-04-17', '2016-04-17', '2016-04-26', '2016-04-26', 72, 133, 1),
(69, 47, '2016-04-29', '2016-04-29', '2016-05-03', '2016-05-03', 72, 132, 0),
(70, 47, '2016-04-30', '2016-04-30', '2016-05-04', '2016-05-04', 69, 135, 0),
(71, 47, '2016-04-27', '2016-04-27', '2016-05-03', '2016-05-03', 81, 137, 0),
(72, 47, '2016-04-28', '2016-04-28', '2016-05-01', '2016-05-01', 79, 138, 0),
(73, 47, '2016-05-01', '2016-05-01', '2016-05-06', '2016-05-06', 74, 127, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
