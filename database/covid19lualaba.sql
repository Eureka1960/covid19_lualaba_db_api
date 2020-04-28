-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 28 avr. 2020 à 09:44
-- Version du serveur :  10.3.15-MariaDB
-- Version de PHP :  7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `covid19lualaba`
--

-- --------------------------------------------------------

--
-- Structure de la table `borders`
--

CREATE TABLE `borders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `borders`
--

INSERT INTO `borders` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Peage', '2020-04-26 18:23:30', '2020-04-26 18:23:30'),
(2, 'Aeroport', '2020-04-26 18:23:30', '2020-04-26 18:23:30');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `health_passenges`
--

CREATE TABLE `health_passenges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body_tempeture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_symptome` tinyint(1) NOT NULL DEFAULT 0,
  `other_symptomes` enum('Toux','Rhume','Fievre','Convalescent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `lockdown` tinyint(1) NOT NULL DEFAULT 0,
  `passengers_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `health_passenges`
--

INSERT INTO `health_passenges` (`id`, `body_tempeture`, `main_symptome`, `other_symptomes`, `lockdown`, `passengers_id`, `created_at`, `updated_at`) VALUES
(1, '39', 1, 'Fievre', 1, 1, '2020-04-26 20:22:00', '2020-04-26 20:22:00'),
(2, '36', 0, 'Fievre', 0, 8, '2020-04-26 21:38:11', '2020-04-26 21:38:11'),
(3, '36', 0, 'Fievre', 0, 9, '2020-04-26 21:40:16', '2020-04-26 21:40:16'),
(4, '36', 0, 'Convalescent', 0, 10, '2020-04-26 21:49:34', '2020-04-26 21:49:34'),
(5, '35', 0, 'Convalescent', 0, 11, '2020-04-26 21:55:58', '2020-04-26 21:55:58'),
(6, '36', 0, 'Rhume', 0, 12, '2020-04-26 22:03:03', '2020-04-26 22:03:03'),
(7, '36', 0, 'Fievre', 0, 13, '2020-04-26 22:06:53', '2020-04-26 22:06:53'),
(8, '36', 0, 'Rhume', 0, 14, '2020-04-26 22:11:03', '2020-04-26 22:11:03'),
(9, '36', 0, 'Rhume', 0, 15, '2020-04-26 22:18:05', '2020-04-26 22:18:05'),
(10, '39', 1, 'Fievre', 0, 16, '2020-04-27 05:23:09', '2020-04-27 05:23:09'),
(11, '39', 1, 'Fievre', 0, 17, '2020-04-28 03:50:05', '2020-04-28 03:50:05');

-- --------------------------------------------------------

--
-- Structure de la table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Hôpital MUANGEJI', '2020-04-26 18:23:30', '2020-04-26 18:23:30'),
(2, 'Zone de santé', '2020-04-26 18:23:30', '2020-04-26 18:23:30'),
(3, 'Hôpital GECAMINE', '2020-04-26 18:23:30', '2020-04-26 18:23:30'),
(4, 'Clinique', '2020-04-26 18:23:30', '2020-04-26 18:23:30');

-- --------------------------------------------------------

--
-- Structure de la table `infected_people`
--

CREATE TABLE `infected_people` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `passengers_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hospitals_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name_person_to_contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender_person_to_contact` enum('F','M') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `address_person_to_contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_person_to_contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `infected_people`
--

INSERT INTO `infected_people` (`id`, `passengers_id`, `hospitals_id`, `name_person_to_contact`, `gender_person_to_contact`, `address_person_to_contact`, `phone_person_to_contact`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Prisca MAVAKALA', 'F', '11 chef pweto golf plateau', '0114447854', '2020-04-26 20:22:00', '2020-04-26 20:22:00'),
(2, 17, 3, 'Eric MEYI NZAJI', 'M', '101 Mwengemafuta Golf plateau Lubumbashi', '0844185552', '2020-04-28 03:50:05', '2020-04-28 03:50:05');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(49, '2014_10_12_000000_create_users_table', 1),
(50, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(51, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(52, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(53, '2016_06_01_000004_create_oauth_clients_table', 1),
(54, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(55, '2019_08_19_000000_create_failed_jobs_table', 1),
(56, '2020_03_26_080817_create_borders_table', 1),
(57, '2020_04_26_080738_create_passengers_table', 1),
(58, '2020_04_26_080913_create_hospitals_table', 1),
(59, '2020_04_26_084225_create_infected_people_table', 1),
(60, '2020_04_27_081516_create_health_passenges_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('04fda4e47f813dad64eeeb7041a12e78f71d70b94de459af5fae872e14fdaa4a564af4173927337b', 1, 1, 'Covid19Lualaba', '[]', 0, '2020-04-26 18:23:56', '2020-04-26 18:23:56', '2021-04-26 20:23:56'),
('0879f0210a0ca4ff875fec768870089a25ab2e742e7f899680db8fa5d580b5ab3db07d7054eef8a4', 1, 1, 'Covid19Lualaba', '[]', 0, '2020-04-27 04:51:58', '2020-04-27 04:51:58', '2021-04-27 06:51:58'),
('202e4a44189d4ab8fb84324229b4f05cdf854e25de65dedaef8d588e2231b4a574c0d6f9fa178457', 1, 1, 'Covid19Lualaba', '[]', 0, '2020-04-27 05:15:47', '2020-04-27 05:15:47', '2021-04-27 07:15:47'),
('370716ec75487fe2a89c289bb1a0f1c0623ae581b10516789e80226c9f7ed3ac52eb674dc831a5aa', 1, 1, 'Covid19Lualaba', '[]', 0, '2020-04-28 03:45:41', '2020-04-28 03:45:41', '2021-04-28 05:45:41'),
('4b859447a8890e2f30b11f85ef11656dd53d99e0c2f96c1e077a77e864757249cdb80dd7173a8a7f', 1, 1, 'Covid19Lualaba', '[]', 0, '2020-04-27 23:00:13', '2020-04-27 23:00:13', '2021-04-28 01:00:13'),
('815d3908584c3806e45288ec38ad5fd682fee9a1095a048bc2eab622a60319c331493ab5aaebe609', 1, 1, 'Covid19Lualaba', '[]', 0, '2020-04-27 05:04:26', '2020-04-27 05:04:26', '2021-04-27 07:04:26'),
('857404f0565337fcd4503b4434d3112439b49d1a66763b6ff315e6cfc06733cce27e8979f9d6c5d7', 1, 1, 'Covid19Lualaba', '[]', 0, '2020-04-27 05:05:00', '2020-04-27 05:05:00', '2021-04-27 07:05:00'),
('87991704e4cce2bacec364411b47cacee07aa50b9bb5b58859da7cca60e2ee52341b836ac98fa6c4', 1, 1, 'Covid19Lualaba', '[]', 0, '2020-04-27 04:41:07', '2020-04-27 04:41:07', '2021-04-27 06:41:07'),
('bf60db13cf0ec7c3fcb8f5af10e3d21a8c41560b7f60b6e553d744688d2d07b76e106c7187632b25', 1, 1, 'Covid19Lualaba', '[]', 0, '2020-04-28 05:11:40', '2020-04-28 05:11:40', '2021-04-28 07:11:40'),
('c0e03b427fcfd1572fcef88c5d82079875126e47dc22517e80c132e2a869f11f15adcfeb253412a2', 2, 1, 'Covid19Lualaba', '[]', 0, '2020-04-28 05:18:04', '2020-04-28 05:18:04', '2021-04-28 07:18:04'),
('c0efd460c8ea8c0ba9af669d58418ab63f95177491f54fe5774f0ab569409a6fe40310cb061bac04', 1, 1, 'Covid19Lualaba', '[]', 0, '2020-04-28 05:11:38', '2020-04-28 05:11:38', '2021-04-28 07:11:38'),
('ca1aa9bb59b4e04db69bb880f2677e1499201aea31581c5295248f8777c41817bccad3f80d7948e0', 1, 1, 'Covid19Lualaba', '[]', 0, '2020-04-27 04:53:18', '2020-04-27 04:53:18', '2021-04-27 06:53:18'),
('ca5b3c1cbfe1ebb9765b663c5305fd640a7940afe9842375b6c3afb90a4e0f0d61e74fd33d5e2d60', 2, 1, 'Covid19Lualaba', '[]', 0, '2020-04-28 05:17:16', '2020-04-28 05:17:16', '2021-04-28 07:17:16'),
('ecaeb4272c2a18d03b49e6a163c2fb51beb7f4ddd14144674a05e91442a3c2c899bfb9dfa2781d47', 1, 1, 'Covid19Lualaba', '[]', 0, '2020-04-27 23:27:39', '2020-04-27 23:27:39', '2021-04-28 01:27:39');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'IB9XlMGjTDPz94ytN3yJVXXf12Lp2miW3uqJsX4O', 'http://localhost', 1, 0, 0, '2020-04-26 18:23:49', '2020-04-26 18:23:49'),
(2, NULL, 'Laravel Password Grant Client', '9exfAls8J6XW14t6Zkf6gcBlD4pnZ4S50Rnc4MUO', 'http://localhost', 0, 1, 0, '2020-04-26 18:23:50', '2020-04-26 18:23:50');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-04-26 18:23:50', '2020-04-26 18:23:50');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `passengers`
--

CREATE TABLE `passengers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('F','M') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `address_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cell_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `borders_id` bigint(20) UNSIGNED DEFAULT NULL,
  `covid` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `passengers`
--

INSERT INTO `passengers` (`id`, `full_name`, `gender`, `address_from`, `address_to`, `cell_phone`, `borders_id`, `covid`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'M', 'Salama Lubumbashi', 'Muangeji Kolwezi', '0999999999', 1, 1, '2020-04-26 20:22:00', '2020-04-26 20:22:00'),
(8, 'Jane Doe', 'F', 'Chez elle à la maison', 'Voir sa tante maternelle', '0999999998', 2, 0, '2020-04-26 21:38:11', '2020-04-26 21:38:11'),
(9, 'Jane Doe', 'F', 'Chez elle à la maison', 'Voir sa tante maternelle', '0999999998', 2, 0, '2020-04-26 21:40:16', '2020-04-26 21:40:16'),
(10, 'Huguette BUKAKA', 'F', 'Afrique du sud Johanesburg', 'Lubumbashi Golf meteo', '0898888888', 1, 1, '2020-04-26 21:49:34', '2020-04-28 04:08:57'),
(11, 'Jires NZAJI', 'M', 'From USA', 'To Paris France', '0999999912', 2, 0, '2020-04-26 21:55:58', '2020-04-26 21:55:58'),
(12, 'Fabrice MPIANA', 'M', 'From Kolwezi', 'To Likasi', '0999993399', 1, 0, '2020-04-26 22:03:02', '2020-04-26 22:03:02'),
(13, 'Clarisse MPEMBA', 'F', 'From South Africa', 'To RDCongo Lubumbashi', '0898888811', 2, 0, '2020-04-26 22:06:53', '2020-04-26 22:06:53'),
(14, 'Obed TSHIPAMBA', 'M', 'From Kinshasa', 'To Lubumbashi', '0999999977', 2, 0, '2020-04-26 22:11:03', '2020-04-26 22:11:03'),
(15, 'Sarah PITHANCE', 'F', 'From New-york', 'To Michigan', '0991199944', 1, 0, '2020-04-26 22:18:05', '2020-04-26 22:18:05'),
(16, 'Sally Smith', 'M', 'USA Michigan', 'Kinshasa Gombe', '0198854756', 2, 0, '2020-04-27 05:23:09', '2020-04-27 05:23:09'),
(17, 'Janny Doe', 'F', 'Lubumbashi Kenya', 'Kilua De la mission', '0999999922', 1, 1, '2020-04-28 03:50:05', '2020-04-28 03:50:05');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('F','M') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `credential`, `gender`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Eric MEYI NZAJI', 'meyinzaji@gmail.com', 'Eureka1960', 'M', NULL, '$2y$10$7vi8IpCok9RscnRPIIToJeQtVNsMdvvEpmstCEDB2//sA7Qcy/OPm', NULL, '2020-04-26 18:23:56', '2020-04-26 18:23:56'),
(2, 'John Doe', 'johndoe@gmail.com', 'Fzqm19', 'M', NULL, '$2y$10$XMolAir.CwiYN76l1C5vguO/6Lun9FQ4vRQfiWKfodi4OMQohAId.', NULL, '2020-04-28 05:17:16', '2020-04-28 05:17:16');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `borders`
--
ALTER TABLE `borders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `health_passenges`
--
ALTER TABLE `health_passenges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `health_passenges_passengers_id_index` (`passengers_id`);

--
-- Index pour la table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `infected_people`
--
ALTER TABLE `infected_people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `infected_people_passengers_id_index` (`passengers_id`),
  ADD KEY `infected_people_hospitals_id_index` (`hospitals_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passengers_borders_id_index` (`borders_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_credential_unique` (`credential`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `borders`
--
ALTER TABLE `borders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `health_passenges`
--
ALTER TABLE `health_passenges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `infected_people`
--
ALTER TABLE `infected_people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `health_passenges`
--
ALTER TABLE `health_passenges`
  ADD CONSTRAINT `health_passenges_passengers_id_foreign` FOREIGN KEY (`passengers_id`) REFERENCES `passengers` (`id`);

--
-- Contraintes pour la table `infected_people`
--
ALTER TABLE `infected_people`
  ADD CONSTRAINT `infected_people_hospitals_id_foreign` FOREIGN KEY (`hospitals_id`) REFERENCES `hospitals` (`id`),
  ADD CONSTRAINT `infected_people_passengers_id_foreign` FOREIGN KEY (`passengers_id`) REFERENCES `passengers` (`id`);

--
-- Contraintes pour la table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_borders_id_foreign` FOREIGN KEY (`borders_id`) REFERENCES `borders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
