-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 27 fév. 2019 à 10:56
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ateliers_cuisine`
--

-- --------------------------------------------------------

--
-- Structure de la table `ateliers`
--

DROP TABLE IF EXISTS `ateliers`;
CREATE TABLE IF NOT EXISTS `ateliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `description` int(11) NOT NULL,
  `date_atelier` date NOT NULL,
  `horaire` datetime NOT NULL,
  `duree` time NOT NULL,
  `dispo` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(10) DEFAULT NULL,
  `specialite` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `mdp`, `email`, `tel`, `specialite`) VALUES
(3, 'boyer', 'Jean', '$2y$10$i5uzfKDO1hvGCX4EdxhEnOv319RqzhFA7Z32rARGwu8fYlnSnNmE.', 'soso@mail.com', '0692221133', 'Patisserie'),
(5, 'boyer', 'Jean', '$2y$10$ACFKJJ61Sxki17q69WWHv.LGfLmWfHJ4ZpeFGQixfDOJTXPbVVehC', 'soso@mail.com', '0692001133', 'Patisserie'),
(6, 'boyer', 'Jean', '$2y$10$yOcQnFcwWJXK3WDhbAEsUeS6rHf3x2HSYjpPLBfiUbq5/U/FH0ihW', 'soso@mail.com', '0692001133', 'Patisserie'),
(7, 'boyer', 'Jean', '$2y$10$ahCq4VZDcLJbAO3HwNxBsORDiKXOrvWmA3so0i7AB8w.AYDZKC.um', 'soso@mail.com', '0692001133', 'Patisserie'),
(8, 'boyer', 'Jean', '$2y$10$F33z4wVE3rFObCaJ6bfesuDyf4qDkaQNGCMG2Pq6y.Adprqj.ywIq', 'soso@mail.com', '0692001133', 'Patisserie'),
(9, 'Elo', 'Elodie', '$2y$10$q27oNunklUQl637rW8jU7ea15xyJh9aAR4a3txZQAkzaQSBpXb5E2', 'elo@mail.com', '0693200237', 'Patisserie'),
(10, 'Payet', 'Jean', '$2y$10$cQfVJA/fE/ff00SXeDhpWOyTOIHgsoJziDh73jMxCwb8UGX.gEL8u', 'jan@mail.com', '0692004466', 'Patisserie'),
(11, 'Payet', 'Jean', '$2y$10$LOvbY/x3HFiNZTvqxdED1uZkFmNj.XEMQNn6RKN3qNg/REadBxwWq', 'jan@mail.com', '0692004466', 'Patisserie'),
(12, 'SAUTRON', 'Océane', '$2y$10$vKwOlfmcjkRR35iJcyMJW.ZXPvaAiYJMV5LpcYKKpKx2hlifRvDYG', 'sautronoceane98@gmail.com', '0693200237', 'Patisserie'),
(13, 'Laderval', 'Bruno', '$2y$10$ijTW21PbREV0gwncFz9S7O32aWwnwq6fX.f1L5M1VES4lHSKgX7iS', 'bruno@gmail.com', '0693200237', 'Patisserie'),
(14, 'Ramasammy', 'Elodie', '$2y$10$z92kLR2GZWPfl/bO110v/Oz9yOZ39PVNSO1KBAZnMxB.6n99HAp2e', 'eee@gmail.com', '0692445566', 'Cuisine creol '),
(15, 'Elo', 'Jean', '666', 'jj@mail.com', '0693455865', 'Cuisine metro');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs_ateliers`
--

DROP TABLE IF EXISTS `utilisateurs_ateliers`;
CREATE TABLE IF NOT EXISTS `utilisateurs_ateliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `id_atelier` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs_roles`
--

DROP TABLE IF EXISTS `utilisateurs_roles`;
CREATE TABLE IF NOT EXISTS `utilisateurs_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
