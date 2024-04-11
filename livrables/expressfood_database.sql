-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 11 avr. 2024 à 12:24
-- Version du serveur : 8.0.36-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `expressFood`
--

-- --------------------------------------------------------

--
-- Structure de la table `bag`
--

CREATE TABLE `bag` (
  `id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `daily_meal_id` int DEFAULT NULL,
  `delivery_person_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `bag`
--

INSERT INTO `bag` (`id`, `quantity`, `daily_meal_id`, `delivery_person_id`) VALUES
(1, 1, 2, 1),
(2, 2, 1, 2),
(3, 3, 3, 3),
(4, 4, 2, 4),
(5, 5, 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `chef`
--

CREATE TABLE `chef` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `chef`
--

INSERT INTO `chef` (`id`, `name`) VALUES
(1, 'Antoine'),
(2, 'Élodie'),
(3, 'Julien'),
(4, 'Claire'),
(5, 'Maxime');

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `id` int NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `address`, `zip_code`, `city`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Jean', 'Dupont', '1985-03-15 00:00:00', '123 rue de la Paix', 75001, 'Paris', '612345678', 'jean.dupont@example.com', '2024-04-08 10:00:00', '2024-04-08 10:00:00'),
(2, 'Marie', 'Durand', '1990-07-20 00:00:00', '456 avenue des Champs', 69002, 'Lyon', '712345678', 'marie.durand@example.com', '2024-04-08 10:00:00', '2024-04-08 10:00:00'),
(3, 'Pierre', 'Martin', '1988-11-03 00:00:00', '789 boulevard des Roses', 33000, 'Bordeaux', '612345678', 'pierre.martin@example.com', '2024-04-08 10:00:00', '2024-04-08 10:00:00'),
(4, 'Sophie', 'Leroy', '1976-05-12 00:00:00', '987 avenue Victor Hugo', 13008, 'Marseille', '712345678', 'sophie.leroy@example.com', '2024-04-08 10:00:00', '2024-04-08 10:00:00'),
(5, 'Thomas', 'Dubois', '1982-09-28 00:00:00', '654 rue Saint-Antoine', 31000, 'Toulouse', '612345678', 'thomas.dubois@example.com', '2024-04-08 10:00:00', '2024-04-08 10:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `daily_meal`
--

CREATE TABLE `daily_meal` (
  `id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `chef_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `daily_meal`
--

INSERT INTO `daily_meal` (`id`, `date`, `chef_id`) VALUES
(1, '2024-04-08 00:00:00', 1),
(2, '2024-04-09 00:00:00', 1),
(3, '2024-04-10 00:00:00', 2),
(4, '2024-04-11 00:00:00', 3);

-- --------------------------------------------------------

--
-- Structure de la table `delivery_person`
--

CREATE TABLE `delivery_person` (
  `id` int NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `status` enum('available','unavailable') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `delivery_person`
--

INSERT INTO `delivery_person` (`id`, `first_name`, `last_name`, `longitude`, `latitude`, `status`) VALUES
(1, 'Pierre', 'Martin', 48.8566, 2.3522, 'available'),
(2, 'Sophie', 'Leroy', 45.764, 4.8357, 'unavailable'),
(3, 'Lucas', 'Moreau', 43.6047, 1.4442, 'available'),
(4, 'Emma', 'Laurent', 50.6292, 3.0573, 'unavailable'),
(5, 'Hugo', 'Lefevre', 47.2184, -1.5536, 'available');

-- --------------------------------------------------------

--
-- Structure de la table `delivery_person_order`
--

CREATE TABLE `delivery_person_order` (
  `delivery_person_id` int NOT NULL,
  `order_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `delivery_person_order`
--

INSERT INTO `delivery_person_order` (`delivery_person_id`, `order_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `meal`
--

CREATE TABLE `meal` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('plat','dessert') DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `meal`
--

INSERT INTO `meal` (`id`, `name`, `type`, `price`, `description`) VALUES
(1, 'Salade', 'plat', 10, 'Salade fraîcheur avec tomates'),
(2, 'Tiramisu', 'dessert', 8, 'Tiramisu classique avec biscuit'),
(3, 'Pizza', 'plat', 12, 'Pizza margherita avec tomates'),
(4, 'Crème brûlée', 'dessert', 9, 'Crème brûlée caramélisée avec vanille et sucre'),
(5, 'Steak frites', 'plat', 15, 'Steak grillé avec pommes de terre frites et salade verte');

-- --------------------------------------------------------

--
-- Structure de la table `meal_daily_meal`
--

CREATE TABLE `meal_daily_meal` (
  `meal_id` int NOT NULL,
  `daily_meal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `meal_daily_meal`
--

INSERT INTO `meal_daily_meal` (`meal_id`, `daily_meal_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('created','in_progress','done') DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `bag_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `date`, `vat`, `total_price`, `numero`, `delivered_at`, `created_at`, `updated_at`, `status`, `customer_id`, `bag_id`) VALUES
(1, '2024-04-08 10:00:00', 0.2, 30, 12345, '2024-04-08 10:00:00', '2024-04-08 10:00:00', '2024-04-09 10:00:00', 'created', 1, 1),
(2, '2024-04-08 11:00:00', 0.2, 25, 54321, '2024-04-08 11:00:00', '2024-04-08 11:00:00', '2024-04-09 11:00:00', 'created', 1, 2),
(3, '2024-04-09 09:00:00', 0.2, 40, 98765, '2024-04-09 09:00:00', '2024-04-09 09:00:00', '2024-04-10 09:00:00', 'created', 2, 2),
(4, '2024-04-09 10:00:00', 0.2, 35, 67890, '2024-04-09 10:00:00', '2024-04-09 10:00:00', '2024-04-10 10:00:00', 'created', 3, 3),
(5, '2024-04-10 12:00:00', 0.2, 45, 13579, '2024-04-10 12:00:00', '2024-04-10 12:00:00', '2024-04-11 12:00:00', 'created', 4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `order_daily_meal`
--

CREATE TABLE `order_daily_meal` (
  `order_id` int NOT NULL,
  `daily_meal_id` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `order_daily_meal`
--

INSERT INTO `order_daily_meal` (`order_id`, `daily_meal_id`, `quantity`) VALUES
(1, 1, 0),
(1, 2, 0),
(2, 3, 0),
(2, 4, 0);

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `id` int NOT NULL,
  `stripe_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`id`, `stripe_id`, `customer_id`, `order_id`) VALUES
(1, 123456, 1, 1),
(2, 789012, 2, 2),
(3, 345678, 3, 3),
(4, 901234, 4, 4),
(5, 567890, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `picture`
--

CREATE TABLE `picture` (
  `id` int NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Déchargement des données de la table `picture`
--

INSERT INTO `picture` (`id`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 'plat1.jpg', '/images/', '2024-04-08 10:00:00', '2024-04-08 10:00:00'),
(2, 'plat2.jpg', '/images/', '2024-04-08 10:00:00', '2024-04-08 10:00:00'),
(3, 'plat3.jpg', '/images/', '2024-04-08 10:00:00', '2024-04-08 10:00:00'),
(4, 'plat4.jpg', '/images/', '2024-04-08 10:00:00', '2024-04-08 10:00:00'),
(5, 'plat5.jpg', '/images/', '2024-04-08 10:00:00', '2024-04-08 10:00:00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bag`
--
ALTER TABLE `bag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_meal_id` (`daily_meal_id`),
  ADD KEY `delivery_person_id` (`delivery_person_id`);

--
-- Index pour la table `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `daily_meal`
--
ALTER TABLE `daily_meal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chef_id` (`chef_id`);

--
-- Index pour la table `delivery_person`
--
ALTER TABLE `delivery_person`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `delivery_person_order`
--
ALTER TABLE `delivery_person_order`
  ADD PRIMARY KEY (`delivery_person_id`,`order_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Index pour la table `meal`
--
ALTER TABLE `meal`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `meal_daily_meal`
--
ALTER TABLE `meal_daily_meal`
  ADD PRIMARY KEY (`meal_id`,`daily_meal_id`),
  ADD KEY `daily_meal_id` (`daily_meal_id`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `bag_id` (`bag_id`);

--
-- Index pour la table `order_daily_meal`
--
ALTER TABLE `order_daily_meal`
  ADD PRIMARY KEY (`order_id`,`daily_meal_id`),
  ADD KEY `daily_meal_id` (`daily_meal_id`);

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Index pour la table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bag`
--
ALTER TABLE `bag`
  ADD CONSTRAINT `bag_ibfk_1` FOREIGN KEY (`daily_meal_id`) REFERENCES `daily_meal` (`id`),
  ADD CONSTRAINT `bag_ibfk_2` FOREIGN KEY (`delivery_person_id`) REFERENCES `delivery_person` (`id`);

--
-- Contraintes pour la table `daily_meal`
--
ALTER TABLE `daily_meal`
  ADD CONSTRAINT `daily_meal_ibfk_1` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`);

--
-- Contraintes pour la table `delivery_person_order`
--
ALTER TABLE `delivery_person_order`
  ADD CONSTRAINT `delivery_person_order_ibfk_1` FOREIGN KEY (`delivery_person_id`) REFERENCES `delivery_person` (`id`),
  ADD CONSTRAINT `delivery_person_order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `meal_daily_meal`
--
ALTER TABLE `meal_daily_meal`
  ADD CONSTRAINT `meal_daily_meal_ibfk_1` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`id`),
  ADD CONSTRAINT `meal_daily_meal_ibfk_2` FOREIGN KEY (`daily_meal_id`) REFERENCES `daily_meal` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`bag_id`) REFERENCES `bag` (`id`);

--
-- Contraintes pour la table `order_daily_meal`
--
ALTER TABLE `order_daily_meal`
  ADD CONSTRAINT `order_daily_meal_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_daily_meal_ibfk_2` FOREIGN KEY (`daily_meal_id`) REFERENCES `daily_meal` (`id`);

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`id`) REFERENCES `meal` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
