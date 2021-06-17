-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 17 Haz 2021, 02:18:05
-- Sunucu sürümü: 10.4.19-MariaDB
-- PHP Sürümü: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `oms1`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `category`
--

INSERT INTO `category` (`id`, `title`, `description`) VALUES
(1, 'Giyim', 'Tekstil Ürünleri'),
(3, 'Elektronik', 'Elektronik Eşyalar');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210615145904', '2021-06-15 16:59:12', 137),
('DoctrineMigrations\\Version20210615192210', '2021-06-15 21:23:17', 29),
('DoctrineMigrations\\Version20210615195111', '2021-06-15 21:51:15', 26),
('DoctrineMigrations\\Version20210615201336', '2021-06-15 22:13:48', 47),
('DoctrineMigrations\\Version20210615201534', '2021-06-15 22:15:43', 26),
('DoctrineMigrations\\Version20210615201639', '2021-06-15 22:16:44', 28),
('DoctrineMigrations\\Version20210615203031', '2021-06-15 22:30:40', 27),
('DoctrineMigrations\\Version20210615225118', '2021-06-16 00:52:05', 219);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, 'sbasbug', 'sbasbug', 'suleymanbasbug@hotmail.com', 'suleymanbasbug@hotmail.com', 1, 'Pw.YVzp3Z0F3mz55w2tCUr4cVrIrs7/NZDrybY5xopI', '$2y$13$iIADFtxRRmEm1RUnHYt5ZOCVV4Cvn07ZPae6h0RZZZEbHelcQ0AJ.', '2021-06-17 02:14:37', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `order`
--

INSERT INTO `order` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'cart', '2021-06-16 21:39:00', '2021-06-16 23:27:05'),
(2, 'cart', '2021-06-17 00:03:12', '2021-06-17 00:03:12'),
(3, 'cart', '2021-06-17 01:50:43', '2021-06-17 01:50:43'),
(4, 'cart', '2021-06-17 02:09:30', '2021-06-17 02:09:30');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_ref_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `order_item`
--

INSERT INTO `order_item` (`id`, `product_id`, `order_ref_id`, `quantity`) VALUES
(3, 5, 1, 10),
(4, 5, 2, 4),
(5, 3, 3, 5),
(6, 5, 4, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_size` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `price`, `image_name`, `image_size`, `updated_at`) VALUES
(3, 1, 'Elbise', 1, '60ca906333ca9430850467.jpg', 4274, '2021-06-17 01:59:31'),
(5, 3, 'Cep Telefonu', 1500, '60ca90813b923325133419.png', 491537, '2021-06-17 02:09:30');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Tablo için indeksler `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`);

--
-- Tablo için indeksler `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_52EA1F094584665A` (`product_id`),
  ADD KEY `IDX_52EA1F09E238517C` (`order_ref_id`);

--
-- Tablo için indeksler `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK_52EA1F094584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_52EA1F09E238517C` FOREIGN KEY (`order_ref_id`) REFERENCES `order` (`id`);

--
-- Tablo kısıtlamaları `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
