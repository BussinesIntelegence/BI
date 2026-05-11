-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 11, 2026 at 05:13 PM
-- Server version: 8.0.30
-- PHP Version: 8.5.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wisata_jogja`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriterias`
--

CREATE TABLE `kriterias` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atribut` enum('benefit','cost') COLLATE utf8mb4_unicode_ci NOT NULL,
  `bobot` int NOT NULL DEFAULT '20',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kriterias`
--

INSERT INTO `kriterias` (`id`, `nama`, `atribut`, `bobot`, `created_at`, `updated_at`) VALUES
(1, 'Harga', 'cost', 20, NULL, NULL),
(2, 'Rating', 'benefit', 20, NULL, NULL),
(3, 'Popularitas', 'benefit', 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_05_10_063355_create_wisatas_table', 1),
(5, '2026_05_10_063359_create_kriterias_table', 1),
(6, '2026_05_10_065728_add_gambar_to_wisatas_table', 2),
(7, '2026_05_11_135346_add_bobot_to_kriterias_table', 3),
(8, '2026_05_11_154417_create_reviews_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `wisata_id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `komentar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `wisata_id`, `nama`, `rating`, `komentar`, `status`, `created_at`, `updated_at`) VALUES
(2, 131, 'test', 5, 'test', 'approved', '2026-05-11 07:58:36', '2026-05-11 08:22:18');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('NaRKV9okpRTEVuqv9nGtbj4ysdvjT7djH0iTdDma', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJvemdwMHU1S1R5YXNheFFRTEJFak5MZDYwMTZva1Z3aTByZW1SM0NNIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImZhdm9yaXRlcyI6WyIxMzEiLCIyNiJdLCJhZG1pbl9sb2dpbiI6dHJ1ZX0=', 1778519354);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wisatas`
--

CREATE TABLE `wisatas` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` double NOT NULL DEFAULT '0',
  `total_review` int NOT NULL DEFAULT '0',
  `harga_weekday` int NOT NULL DEFAULT '0',
  `harga_weekend` int NOT NULL DEFAULT '0',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wisatas`
--

INSERT INTO `wisatas` (`id`, `nama`, `kategori`, `rating`, `total_review`, `harga_weekday`, `harga_weekend`, `latitude`, `longitude`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Candi Borobudur', 'budaya dan sejarah', 4.7, 81922, 50000, 50000, -7.607086854, 110.2036226, 'Candi yang pernah masuk sebagai salah satu dari Tujuh Keajaiban Dunia ini dihiasi oleh banyak relief di dinding candi. Relief yang ada di Candi Borobudur mencapai 2.672 dan panjangnya bisa mencapai 6 kilometer', 'borobudur.jpeg', '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(2, 'Candi Prambanan', 'budaya dan sejarah', 4.7, 71751, 50000, 50000, -7.751834561, 110.4915318, 'Candi Prambanan adalah kompleks candi Hindu terbesar di Indonesia yang dibangun pada abad ke-9 masehi. Candi ini dipersembahkan untuk Trimurti, tiga dewa utama Hindu yaitu Brahma sebagai dewa pencipta, Wisnu sebagai dewa pemelihara, dan Siwa sebagai dewa pemusnah. Berdasarkan prasasti Siwagrha nama asli kompleks candi ini adalah Siwagrha (bahasa Sanskerta yang bermakna \'Rumah Siwa\'), dan memang di garbagriha (ruang utama) candi ini bersemayam arca Siwa Mahadewa setinggi tiga meter yang menujukkan bahwa di candi ini dewa Siwa lebih diutamakan.', 'prambanan.jpeg', '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(3, 'Tebing Breksi', 'alam', 4.4, 51431, 10000, 10000, -7.781476547, 110.5045757, 'Tebing Breksi merupakan tempat wisata yang berada di wilayah Kabupaten Sleman. Lokasinya berada di sebelah selatan Candi Prambanan dan berdekatan dengan Candi Ijo serta Kompleks Keraton Boko. tempat ini merupakan perbukitan batuan breksi. dari atas tebing wisatawan dapat melihat keseluruhan kota jogja, bahkan aktivitas masyarakat pun dapat terlihat dari atas tebing, serpeti pesawat yang lepas landas, kendaraan yang hilidr mudik.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(4, 'Gembira Loka Zoo', 'buatan', 4.5, 36337, 20000, 25000, -7.8062344, 110.3967977, 'Gambira Loka adalah kebun binatang yang berada di Yogyakarta. Berisi berbagai macam spesies dari belahan dunia, seperti orangutan, gajah asia, simpanse, harimau, dan lain sebagainya. Kebun Binatang Gembira Loka menjadi daya tarik tersendiri bagi para wisatawan Yogyakarta. Gembira Loka Zoo sempat rusak parah akibat gempa bumi yang mengguncang kota Yogyakarta tahun 2006. Tetapi, setelah direnovasi Kebun Binatang Gembira Loka tetap dicari para wisatawan.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(5, 'The Palace of Yogyakarta (Keraton Yogyakarta)', 'budaya dan sejarah', 4.6, 30091, 8000, 8000, -7.8052845, 110.3642031, 'Kompleks keraton merupakan museum yang menyimpan berbagai koleksi milik kesultanan, termasuk berbagai pemberian dari raja-raja Eropa, replika pusaka keraton, dan gamelan. Dari segi bangunannya, keraton ini merupakan salah satu contoh arsitektur istana Jawa yang terbaik, memiliki balairung-balairung mewah dan lapangan serta paviliun yang luas.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(6, 'Taman Sari', 'budaya dan sejarah', 4.6, 27899, 5000, 5000, -7.809833449, 110.3595117, 'Taman Sari Yogyakarta, merupakan salah satu bangunan milik kesultanan Yogyakarta yang difungsikan sebagai destinasi wisata. Namun selain sebagai destinasi wisata, taman sari pada saat tertentu juga masih digunakan sebagai tempat ritual oleh keluarga raja. Dengan bentuk bangunan arsitektur ala Portugis-Jawa, bangunan di taman ini menjadi daya tarik utama. Meskipun sekarang kondisi bangunan tak lagi utuh seperti saat masih difungsikan sebagai taman kesultanan, namun tetap saja aura keindahan terpancar kuat dari bangunan bangunan di taman ini.', 'tamansari.jpeg', '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(7, 'Hutan Pinus Mangunan Dlingo', 'alam', 4.6, 18271, 3000, 3000, -7.9267837, 110.4319967, 'hutan pinus mangunan yang ada di Jogja bisa menjadi destinasi hutan yang tepat. Disana banyak terdapat pepohonan yang tinggi menjulang, yang dikenal dengan nama Pinus Merkusi. Nggak heran deh kalau banyak wisatawan yang merasa kepincut dengan objek wisata ini, sebab kesejukan dan keindahan pemandangannya benar-benar mempesona mata.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(8, 'Jogja Bay', 'wisata air', 4.4, 16877, 90000, 100000, -7.7478461, 110.4188754, 'Jogja Bay Waterpark (JBW) salah satu waterpark terbesar di asia tenggara yang berlokasi di kota wisata terbesar kedua di Indonesia yaitu Yogyakarta. Dan belakangan ini sudah menjadi salah satu tujuan destinasi wisata di Yogyakarta. Waterpark yang saat ini merupakan atraksi wahana air terbesar, terlengkap berstandar internasional dan memiliki karakter Bajak Laut – dengan bangga menyampaikan sesuai TripAdvisor Internasional telah merilis tahun 2019 “Jogja Bay Waterpark di Yogyakarta sebagai Waterpark Terbaik ke 3 di Asia”. Jogjabay telah tersertifikasi CHSE (Clean, Health, Safety, & Enviroment) dengan score 100% dari Kemenparekraf RI dan Sucofindo.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(9, 'The World Landmarks - Merapi Park Yogyakarta', 'buatan', 4.2, 16201, 15000, 15000, -7.6209046, 110.4216275, 'Merapi Park merupakan tempat wisata yang dihadirkan sebagai tempat rekreasi keluarga. taman bermain dengan taman taman yang tertata rapi dan terkesan sejuk, sangat pas anda habiskan bersma sang buah hati atau kekasih tersayang. taman bunga dan bangku panjang paduan yang sempurna untuk sekedar bercengkrama lepas tanpa terganggu bisingnya lalu lalang kendaraan. tentu saja karena merapi park jogja ini terletak di bawah kaki gunung merapi kaliurang yang sepi dan sejuk. panorama kaki gunung inilah akan membuat hasil jepretan foto Anda menjadi lebih berwarna, cantik dan menarik.', 'merapi.jpeg', '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(10, 'The Lost World Castle', 'buatan, alam', 4.3, 16110, 30000, 30000, -7.6041648, 110.4510042, 'Di dalam The Lost World Casle, pengunjung disuguhkan potret gagahnya Gunung Merapi. Selain itu, di dalam objek wisata ini terdapat berbagai latar untuk mengambil foto yang menarik, di antaranya taman koboi, awan putih, sepeda motor terbang, sayap bidadari, dan lain-lain. Selain itu, ada juga latar foto trik tiga-dimensi berupa air terjun, permadani terbang, dan beberapa bunga sakura tiruan yang turut menghidupkan suasana.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(11, 'Fort Vredeburg Museum', 'budaya dan sejarah', 4.6, 15281, 3000, 3000, -7.8002016, 110.3663044, 'Letak Benteng Vredeburg Yogyakarta di kawasan nol kilometer pusat Kota Yogyakarta menjadikan sebuah daya tarik bagi para wisatawan. Dalam pelayanannya kepada masyarakat, museum Benteng Vredeburg tidak lepas dari unsur-unsur pendidikan karena pada dasarnya museum memiliki dua fungsi yaitu sebagai rekreasi sekaligus tempat pendidikan. Informasi tentang keBudaya dan Sejarahan, kebudayaan dan nilai-nilai luhur kejuangan disampaikan kepada generasi muda dalam nuansa edutainment, yang berasal dari kata education dan entertainment. Demikianlah, Benteng Vredeburg yang sekarang menjadi Museum Benteng Vredeburg Yogyakarta telah melekat dengan Kota Yogyakarta. Latar belakang Budaya dan Sejarah Kota Yogyakarta baik sebagai ibukota Kasultanan Yogyakarta dan ibukota NKRI tidak dapat dipisahkan dengan Budaya dan Sejarah Benteng Vredeburg Yogyakarta. Pelestarian Benteng Vredeburg sebagai museum bukan berarti pengagungan simbol kejayaan kolonial. Akan tetapi tujuannya untuk mendapatkan fungsi baru yang dapat memberikan informasi dan aspirasi perjuangan nasional bagi generasi mendatang.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(12, 'Museum Benteng Vredeburg', 'budaya dan sejarah', 4.6, 15279, 3000, 3000, -7.799287456, 110.3661757, 'Benteng Vredeburg merupakan salah satu museum peninggalan Belanda yang sangat terkenal di Jogja karena di museum ini memiliki nilai cerita yang cukup panjang dan masih bertahan hingga saat ini. Museum Benteng Vredeburg mengoleksi berbagai macam karya seni, berbagai macam patung, dan berbagai macam senjata peninggalan Belanda.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(13, 'Sindu Kusuma Edupark (SKE)', 'buatan', 4.2, 14072, 20000, 20000, -7.7672973, 110.3542486, 'Sindu Kusuma Edupark merupakan wahana bermain berbasis edukasi dan hiburan untuk semua usia yang buka paling pagi dan tutup paling malam di Jogjakarta. Destinasi wisata ini menyuguhkan sebuah tempat bermain bagi keluarga yang lengkap dengan berbagai wahana permainan yang seru dan juga menantang. Wahana-wahana seperti Kora-Kora, Bianglala, Waterpark, dan Light Festival menjadi wahana terfavorit bagi para wisatawan. Selain itu tersedia juga restoran berkonsep Industrial Fun Cafe dengan harga yang murah dan terjangkau cocok untuk anda sekeluarga. Semua transaksi di Sindu Kusuma Edupark ini menggunakan kartu khusus yang bisa diperoleh di loket tiket, jadi tidak repot lagi mengeluarkan uang tunai. Selain wahana permainan, di SKE ini juga ada beberapa foto spot yang cukup bagus untuk dijadikan background foto.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(14, 'Tugu', 'budaya dan sejarah', 4.8, 13330, 10000, 10000, -7.7828822, 110.3670514, 'Tugu ini sekarang merupakan salah satu objek pariwisata Yogyakarta, dan sering dikenal dengan istilah “Tugu Pal Putih” (pal juga berarti tugu), karena warna cat yang digunakan sejak dulu adalah warna putih. Tugu pal ini berbentuk bulat panjang dengan bola kecil dan ujung yang runcing di bagian atasnya. Jika dilihat dari Keraton Yogyakarta ke arah utara, maka akan terlihat bahwa Jalan Malioboro, Jalan Margo Utomo, Tugu Yogyakarta, dan Jalan A.M. Sangadji membentuk garis lurus menuju puncak Gunung Merapi yang dikenal sebagai Garis Imajiner Yogyakarta.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(15, 'Heha Sky View', 'buatan', 4.4, 13048, 10000, 10000, -7.848530311, 110.4787102, 'Salah satu destinasi wisata favorit yang menawarkan pemandangan terbaik kota Yogyakarta dan sekitarnya “dari lantai 2”. Terletak di kawasan perbukitan Gunungkidul, HeHa Sky View hanya berjarak 40 menit dari pusat Kota Yogyakarta. Sky Ballon yang dibuat colorful menjadi salah satu wahana yang wajib dicoba. disini terdapat street food yang beraneka ragam dan dapat dinikmati sembari duduk dan mengobrol di bean bag ataupun outdoor area. banyak spot foto keren.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(16, 'Pantai Goa Cemara', 'pantai', 4.3, 12755, 4000, 4000, -7.999423, 110.248963, 'Adalah Kawasan Wisata Terpadu, satu pintu dengan pembagian area yang jelas. Public area memang seperti diutamakan di pantai ini. Jajaran pedagang lokal berpadu dengan ramainya pasar tradisional. Dengan area cakupan luas meliputi wilayah konservasi penyu hijau, wilayah lahan pertanian, daerah wisata, dan pelestarian hutan cemara. Pasar tradisional, wisata pantai, outbond, camping ground, ruang pertemuan, atv, jip wisata offroad gumukpasir, kuliner, dan cinderamata. Dengan dukungan fasilitas publik yang lengkap dan terus berkembang. Fasilitas publik seperti MCK, kantor sekretariat, kantor keamanan, posko SAR, rumah ibadah, pos kesehatan juga tersedia.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(17, 'XT Square', 'buatan', 4.3, 12396, 25000, 25000, -7.8165658, 110.3866908, 'XT-Square merupakan kawasan yang  dibangun dengan konsep terpadu yang ditawarkan kepada masyarakat dalam satu paket pusat wisata belanja, yakni what to see, what to eat, dan what  to buy. Didesain sebagai ruang publik dengan konsep citywalk,  didukung dengan area kuliner serta area pertunjukan seni semakin menunjang aktifitas wisata belanja yang nyaman dan menyenangkan, XT-Square dibangun untuk kepuasan pengunjung.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(18, 'Kaliadem', 'alam, budaya dan sejarah', 4.5, 12338, 3000, 3000, -7.582047728, 110.4476387, 'Bunker Kaliadaem merupakan tempat untuk berlindung dari ganasnya Gunung Merapi. tempat ini menyimpan banyak jejak ganasnya Gunung merapi. di bunker kaliadem terdapat pintu utama yang terbuat dari baja setebal 15 cm, ruangan bungker yang masih memiliki sisa-sisa material merapi, dan bagian atas yang dilapisi batu serta pasir vulkanis', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(19, 'Monumen Yogya Kembali', 'museum', 4.5, 11302, 15000, 15000, -7.7495904, 110.3696068, 'Museum Monumen Jogja Kembali adalah sebuah museum Budaya dan Sejarah perjuangan kemerdekaan Republik Indonesia yang ada di kota Yogyakarta dan dikelola oleh Departemen Kebudayaan dan Pariwisata. Museum yang berada di bagian utara kota ini banyak dikunjungi oleh para pelajar dalam acara darmawisata. Museum Monumen dengan bentuk kerucut ini terdiri dari 3 lantai dan dilengkapi dengan ruang perpustakaan serta ruang serbaguna. Pada rana pintu masuk dituliskan sejumlah 422 nama pahlawan yang gugur di daerah Wehrkreise III (RIS) antara tanggal 19 Desember 1948 sampai dengan 29 Juni 1949. Dalam 4 ruang museum di lantai 1 terdapat benda-benda koleksi: realia, replika, foto, dokumen, heraldika, berbagai jenis senjata, bentuk evokatif dapur umum dalam suasana perang kemerdekaan 1945-1949. Tandu dan dokar (kereta kuda) yang pernah dipergunakan oleh Panglima Besar Jenderal Soedirman juga disimpan di sini (di ruang museum nomor 2). Monumen Jogja kembali beralamat Di jalan raya Ring road Utara Sleman Yogyakarta', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(20, 'Ratu Boko', 'budaya dan sejarah', 4.6, 11176, 40000, 40000, -7.7705416, 110.4894158, 'Istana Ratu Boko adalah sebuah bangunan megah yang dibangun pada masa pemerintahan Rakai Panangkaran, salah satu keturunan Wangsa Syailendra. Istana yang awalnya bernama Abhayagiri Vihara (berarti biara di bukit yang penuh kedamaian) ini didirikan untuk tempat menyepi dan memfokuskan diri pada kehidupan spiritual. Berada di istana ini, anda bisa merasakan kedamaian sekaligus melihat pemandangan kota Yogyakarta dan Candi Prambanan dengan latar Gunung Merapi.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(21, 'Depok Beach', 'pantai', 4.3, 10820, 10000, 10000, -8.0137087, 110.2914777, 'Pantai Depok yang letaknya hanya 1,5 km dari Parangtritis ini memang terkenal di kalangan wisatawan lokal. Selain karena keindahan pantainya, wisata pantai Yogyakarta yang satu ini juga terkenal dengan aneka menu seafood yang rasanya mampu menggoyang lidah. Tidak heran, hampir seluruh warga yang tinggal di sekitar pantai ini berprofesi sebagai nelayan. Itulah kenapa hidangan laut yang diolah di tempat ini sangat istimewa. Sebab memang semua ikan dan seafood yang ada di sini memang masih segar ketika diolah.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(22, 'Central Museum of the Air Force Dirgantara Mandala', 'museum', 4.5, 9828, 3000, 3000, -7.7899338, 110.4156788, 'Museum Pusat TNI AU “Dirgantara Mandala” adalah museum yang digagas oleh TNI Angkatan Udara untuk mengabadikan peristiwa berBudaya dan Sejarah dalam lingkungan TNI AU, bermarkas di kompleks Pangkalan Udara Adi Sutjipto, Yogyakarta. Museum ini sebelumnya berada berada di Jalan Tanah Abang Bukit, Jakarta dan diresmikan pada 4 April 1969 oleh Panglima AU Laksamana Roesmin Noerjadin lalu dipindahkan ke Yogyakarta pada 29 Juli 1978. ', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(23, 'Masjid Gedhe Kauman', 'budaya dan sejarah', 4.8, 9784, 10000, 10000, -7.802697521, 110.3625956, 'Masjid Gedhe Kauman dibangun oleh Sri Sultan Hamengku Buwono I bersama Kyai Faqih Ibrahim Diponingrat (penghulu kraton pertama) dan Kyai Wiryokusumo sebagai arsiteknya. Masjid ini dibangun pada hari Ahad Wage, 29 Mei 1773 M atau 6 Rabi\'ulakhir 1187 H. Masjid Gedhe Kauman merupakan tempat untuk beribadah, namun masjid ini juga menjadi tempat wisata yang cukup terkenal. Meskipun demikian, fungsi utama masjid sebagai tempat ibadah masih terjaga dengan sangat baik lengkap dengan semua fasilitas yang diperlukan.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(24, 'Bukit Paralayang Watugupit', 'alam, petualangan, pantai', 4.7, 9614, 5000, 5000, -8.026589501, 110.3458478, 'Seperti namanya, bukit ini digunakan sebagai tempat untuk landasan pacu olahraga paralayang. Para profesional banyak yang berlatih di sini. Bahkan, orang awam pun dapat mencoba paralayang karena terdapat instruktur yang akan mendampingi.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(25, 'Pantai Drini', 'pantai', 4.5, 8969, 10000, 10000, -8.1384509, 110.577522, 'Pantai Drini merupakan salah satu pantai di deretan pantai selatan Gunungkidul yang banyak direkomendasikan. Pantai ini dijuluki sebagai ‘Pantai Perawan’ karena kondisi pantai ini masih bersih dengan suasana yang masih alami. Udara tempat wisata ini sejuk, aliran airnya tenang, dan pasir putihnya begitu mempesona.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(26, 'Pantai Parangtritis', 'pantai', 4.5, 8727, 6000, 6000, -8.024608, 110.3298045, 'Paintai Parangtritis merupakan salah satu ikon di Kabupaten Bantul. Pantai ini memiliki pasir hitam. Di pantai ini dapat bermain ATV, menaiki kuda. Di sisi utara timur pantai dapat menemukan bukit kecil yang sangat cocok untuk menikmati pemandangan sore hari ditemani angin. pantai ini memiliki cerita misteri di dalamnya.', 'parangtritis.jpeg', '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(27, 'Embung Tambakboyo', 'buatan', 4.4, 8564, 2000, 2000, -7.756227, 110.4150131, 'Waduk Tambakboyo Kabupaten Sleman Daerah Istimewa Yogyakarta ini dibangun pada tahun 2003 dan selesai tahun 2008. Pembangunan yang memakan waktu lima tahun ini memang sudah diperhitungkan dengan matang. Pada mulanya embung atau waduk ini dibangun sebagai tempat penampungan air untuk cadangan warga Sleman. Namun seiring dengan berjalannya waktu, Embung Tambakboyo menjadi salah satu wisata alam gratis yang banyak peminatnya.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(28, 'Lava Merapi and Alien Stone', 'alam', 4.5, 8111, 350000, 350000, -7.6023375, 110.4552585, 'Lava Tour Merapi bisa menjadi pilihan aktivitas wisata ketika berlibur di Yogyakarta. Lava Tour Merapi adalah istilah untuk tur wisata kawasan terdampak erupsi Gunung Merapi tahun 2010. Tur yang dimaksud saat ini merupakan tur menggunakan mobil jenis jeep. Kegiatan tur meliputi kunjungan ke sejumlah titik yang terkena dampak langsung erupsi. Lava tour Merapi ditawarkan sebagai aneka pilihan paket wisata. Paket-paket ini dibanderol dengan harga yang beragam. Setiap paket sudah termasuk tiket masuk untuk sejumlah titik pemberhentian. Paket wisata ini bisa menampung rombongan, sehingga cocok untuk dijajal sebagai liburan keluarga atau bersama teman.', 'merapi.jpeg', '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(29, 'Candi Plaosan', 'budaya dan sejarah', 4.6, 7855, 3000, 3000, -7.7407807, 110.5046772, 'Candi Plaosan terletak di Desa Bugisan, Kecamatan Prambanan, Kabupaten Klaten, kira-kira 1,5 km ke arah timur dari Candi Sewu. Candi ini merupakan sebuah kompleks bangunan kuno yang terbagi menjadi dua, yaitu kompleks Candi Plaosan Lor (lor dalam bahasa Jawa berarti utara) dan kompleks Candi Plaosan Kidul (kidul dalam bahasa Jawa berarti selatan). Pahatan yang terdapat di Candi Plaosan sangat halus dan rinci, mirip dengan yang terdapat di Candi Borobudur, Candi Sewu, dan Candi Sari. Candi Plaosan yang merupakan candi Buddha ini oleh para ahli diperkirakan dibangun pada masa pemerintahan Rakai Pikatan dari Kerajaan Mataram Hindu, yaitu pada awal abad ke-9 M. Salah satu pakar yang mendukung pendapat itu adalah De Casparis yang berpegang pada isi Prasasti Cri Kahulunan (842 M). Dalam prasasti tersebut dinyatakan bahwa Candi Plaosan Lor dibangun oleh Ratu Sri Kahulunan, dengan dukungan suaminya. Menurut De Casparis, Sri Kahulunan adalah gelar Pramodhawardani, putri Raja Samarattungga dari Wangsa Syailendra. Sang Putri, yang memeluk agama Buddha, menikah dengan Rakai Pikatan dari Wangsa Sanjaya, yang memeluk agama Hindu.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(30, 'Agro Tourism Bhumi Merapi', 'agrowisata', 4.5, 7697, 30000, 30000, -7.6400756, 110.4264098, 'Agrowisata Bhumi Merapi Yogyakarta. Tempat wisata yang terletak di daerah Kaliurang ini menawarkan wisata edukasi bagi para pengunjungnya. Dibangun pada tahun 2015 dengan luas 5,2 hektar. Tempat wisata ini menawarkan konsep pertanian, perkebunan, dan peternakan. Jadi, selain liburan para pengunjung pun bisa mendapatkan banyak ilmu. Suasananya yang sejuk dan nyaman juga membuat para pengunjung betah berlama-lama disana. Berbagai aktivitas wisata bisa dilakukan di tempat wisata ini. Utamanya kegiatan-kegiatan yang berhubungan dengan pertanian, peternakan dan perkebunan. Berikut beberapa diantaranya. Identik dengan wisata edukasi, taman rekreasi ini menyediakan tempat belajar budidaya hewan bagi para pengunjungnya. Diantaranya kambing dan kelinci. Kambing yang dipelajari adalah jenis kambing Ettawa. Kegiatan yang dilakukan diantaranya adalah memerah susu kambing, memberikan susu dot bagi anak kambing, mengolah susu untuk dijadikan yogurt dan ice cream,  pengolahan pakan ternak, dan pengolahan kotoran kambing menjadi pupuk organik dan biogas. Sedangkan kelinci yang ada disini adalah kelinci hias dan kelinci pedaging. Dan pengunjung juga bisa memberi makan kepada kelinci. Selain itu, ada juga binatang berjenis reptile yang dipelihara disini seperti ular, kura-kura, dan reptile lainnya yang dapat digunakan sebagai sarana edukasi.', 'merapi.jpeg', '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(31, 'Wisata Kalibiru', 'alam', 4.4, 6912, 10000, 10000, -7.8057305, 110.127969, 'Wisata Kalibiru terletak pada ketinggian 450 mdpl, yang kini telah menjadi hutan wisata nan subur. Dengan perbukitan yang ditumbuhi oleh berbagai pepohonan, seperti cemara, jati, dan kayu putih. Tempat wisata ini terletak di pedesaan, tak heran jika banyak dijumpai rumah berarsitektur Jawa kuno. Rumah – rumah ini difungsikan sebagai kantor pengelola serta loket tiket masuk. Setelah itu, pengunjung harus melakukan trekking di hutan untuk dapat menuju spot utama. Di sini, telah disediakan jalan setapak sehingga pengunjung tinggal mengikuti arah jalan tersebut. Di sepanjang perjalanan, pengunjung akan menemukan berbagai jenis vegetasi. Mulai dari semak – semak hingga pepohonan berbatang kayu yang bercabang – cabang. Selain itu, ada juga tanaman anggrek yang seolah bersembunyi di rimbunnya pepohonan.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(32, 'De Mata Trick Eye Museum', 'buatan, museum', 4.4, 6855, 40000, 40000, -7.8163156, 110.3871442, 'Berawal dari keinginan bahwa Indonesia tidak boleh kalah dengan negara lain dalam bidang pariwisata, Direktur Utama PT. Demata Maris Indonesia, yaitu Bapak Petrus FX Kusuma mendapatkan inspirasi untuk mengadaptasi konsep tempat wisata dari luar negeri agar dapat dibawa ke Indonesia. Bertujuan agar masyarakat di Indonesia dapat mengunjungi tempat serupa namun tidak sama yang tetap lekat dengan unsur edukatif, inovatif, dan entertaining. Ditawarkan dengan harga tiket masuk yang low cost-highly entertaining, sehingga memberikan kesempatan terhadap semua kalangan untuk dapat berwisata. Dengan adanya beberapa tempat wisata yang sudah ada dan yang akan dibangun oleh PT. Demata Maris Indonesia tidak hanya merupakan sebuah cita-cita dan mimpi yang terwujud namun juga sebuah bisnis yang potensial yang memberikan kesempatan kepada seluruh masyarakat Indonesia untuk berwisata dengan harga tiket yang murah', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(33, 'Candi Sambisari', 'budaya dan sejarah', 4.6, 6238, 5000, 5000, -7.762491, 110.4470374, 'Candi Sambisari adalah Candi Hindu yang berada di Purwomartani, Kalasan, Sleman, Daerah Istimewa Yogyakarta. Posisinya kira-kira berada 12 kilometer (km) di sebelah timur kota Yogyakarta ke arah kota Solo. Lokasi candinya pun cukup unik, yaitu terletak kira-kira 6,5 meter lebih rendah dari permukaan tanah di sekitarnya. Oleh karena itu, jika hendak masuk ke dalam kompleks candi kamu harus berjalanan kaki menuruni puluhan anak tangga yang cukup curam sehingga kamu harus berhati-hati. Jika kamu berada di kawasan sekitar candi, yang kamu lihat hanyalah atap candi yang sedikit menyembul di permukaan tanah.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(34, 'Pantai Wediombo', 'pantai', 4.5, 6072, 5000, 5000, -8.1902176, 110.7103772, 'Daya tarik pantai ini terletak di gugusan karangnya. Sepanjang bibir pantai, Wedi Ombo dihiasi hamparan karang. Bebatuan ini membuat Wedi Ombo bagaikan taman karang yang luas. Selain itu, lautnya yang tenang membuat lokasinya cocok untuk bersantai. Pantai Wedi Ombo berada di pinggiran teluk. Pantai ini menghadap ke barat dengan garis pantai nyaris lurus. Ini membuat angin laut yang menerpa tidak sekencang pantai lainnya. Sehingga, lautnya pun cenderung lebih tenang.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(35, 'Pantai Parangkusumo', 'pantai', 4.4, 5887, 3000, 3000, -8.022769, 110.324995, 'Pantai Parangkusumo merupakan salah satu pantai yang dianggap sakral oleh penduduk setempat. Masyarakat Jogja meyakini adanya hubungan spesial antara Keraton Jogja dengan Nyi Roro Kidul, penguasa pantai selatan. Dalam tradisi Jawa, Pantai Parangkusumo dianggap sebagai gerbang utama atau jalan menuju Keraton Gaib Laut Selatan, kerajaan Nyi Roro Kidul. Karena itu, tak heran jika Pantai Parangkusumo kerap menjadi tujuan peziarah saat bulan Sura dalam kalender penanggalan Jawa. Begitu pun pada hari-hari biasa, pengunjung akan meramaikan pantai saat malam Selasa Kliwon dan Jumat Kliwon. Meski kental dengan nuansa mistis dan legenda, Pantai Parangkusumo juga menawarkan pemandangan yang tak kalah indah dari pantai lain di Jogja. Di sini, kamu akan melihat tumbuhan sejenis kelapa sawit berjejer di bagian belakang pantai yang menciptakan kesan asri.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(36, 'Taman Sungai Mudal', 'alam', 4.6, 5499, 10000, 10000, -7.7628136, 110.1161626, 'Taman Sungai Mudal, sebuah objek wisata alam terbuka yang terletak di Kabupaten Kulon Progo, yang menawarkan pesona sebuah kolam pemandian yang bersumber dari mata air alami. Mata airnya bersumber dari sebuah goa, sehingga kehadiran Taman Sungai Mudal menjadi mengesampingkan kesan angker dari sebuah goa. Apalagi ditambah dengan dukungan fasilitas yang membuat para wisatawan merasa nyaman saat berada di sana.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(37, 'Taman Pelangi Jogja', 'buatan', 4.3, 5459, 15000, 20000, -7.7505259, 110.3687049, 'Kalau pelangi biasanya ada di siang hari pasca hujan, maka di Taman Pelangi Yogyakarta pengunjung justru bisa menikmatinya setiap malam hari. Ya, ini lantaran taman ini merupakan Taman Lampion beraneka warna dan rupa. Pengunjung bisa mengarahkan diri ke deretan lampion yang berbentuk flora dan fauna. Ada juga lampion berbentuk tokoh kartun disney dan kartun jepang, dinosaurus, naga, serta kehidupan bawah laut yang sangat menarik perhatian terutama anak-anak. Tak meninggalkan Budaya dan Sejarah, ada juga lampion yang berbentuk wajah para tokoh pemimpin bangsa. Buka sejak petang, Taman ini memang sangat cocok dijadikan pilihan destinasi rekreasi keluarga saat malam hari.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(38, 'Situs Warungboto', 'budaya dan sejarah', 4.4, 5392, 10000, 10000, -7.8102685, 110.3931513, 'Situs Warungboto merupakan petilasan yang dibangun pada masa pemerintahan Sultan Hamengkubuwono I. Kemudian, pembangunannya diteruskan pada masa pemerintahan Sultan Hamengkubuwono II. Dulunya, tempat ini khusus dijadikan sebagai tempat pemandian. Dikarenakan adanya sumber mata air di lokasi tersebut. Situs Warungboto berada di tengah Kota Jogja, tepatnya di Umbulharjo. Objek wisata ini merupakan peninggalan berBudaya dan Sejarah yang dulu dibangun oleh keluarga keraton. Saat ini, area situs telah dibersihkan dan direnovasi sehingga dapat dikunjungi wisatawan. Tentunya tempat ini begitu menarik karena bangunannya yang unik dan instagramable.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(39, 'Pantai Cemara Sewu Bantul Yogyakarta', 'pantai', 4.4, 5372, 10000, 10000, -8.019114, 110.3145616, 'Jika anda mencari suasana nyaman dan ketenangan, maka pantai ini lah juaranya. Seperti namanya yang berarti pantai seribu cemara, maka begitu anda tiba di area pantai anda akan langsung disambut dengan pohon cemara. Pohon cemara menjadi ikon penting bagi pantai ini. Berbeda dengan pantai-pantai lain yang akan semakin panas jika hari semakin siang. Di Pantai Cemoro Sewu suasana teduh akan bisa selalu anda rasakan walaupun matahari sangat menyengat sekalipun. Gazebo-gazebo yang berdiri rapi di antara pepohonan cemara yang rimbun membuat pengunjung semakin betah untuk bersantai di sana. Apalagi jika semakin sore angin pantai akan semakin semilir menambah sejuk suasana.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(40, 'Bukit Klangon', 'alam', 4.5, 5280, 5000, 5000, -7.5768966, 110.4548266, 'Di bukit Klangon kita akan disuguhkan pemandangan luar biasa dari Gunung Merapi. Kita bisa melihat gunung berapi aktif ini dengan jarak yang begitu dekat. Kita tak perlu mendaki hingga puncaknya karena di Bukit Klangon ini kita sudah bisa melihat puncak Gunung Merapi dengan cukup jelas. Di sini terdapat beberapa gardu pandang yang bisa kita gunakan untuk melihat eksotisme alam sekitar bukit. Gardu pandang ini juga biasa menjadi spot foto jadi jangan sampai anda melupakan kamera anda untuk berburu pemandangan yang instagenic.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(41, 'Taman Wisata Kaliurang', 'alam', 4.4, 5217, 8000, 8000, -7.598797, 110.42636, 'Taman Wisata Kaliurang dapat menjadi referensi wisata akhir pekan keluarga. Pemandangan sekitar sangatlah indah, masih banyak pepohonan yang tumbuh tinggi menjulang. Ditambah lagi pemandangan puncak Gunung Merapi yang gagah. Selain itu, udara di sekitar pun masih sangat sejuk. Aroma asap kendaraan bermotor pun tidak tercium di kawasan ini. Berada di sini membuat paru – paru menjadi lebih sehat. Banyak wisatawan yang datang bersama keluarga. Duduk santai beralaskan tikar di atas rerumputan sambil bercengkerama dengan keluarga. Ditambah lagi, suasana yang sangat mendukung untuk beramah – tamah. Selain menyuguhkan pemandangan yang indah, Taman Wisata Kaliurang pun memiliki wahana outbound. Seperti flying fox hingga rumah pohon Ridz High Rope.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(42, 'Jogja National Museum', 'museum, budaya dan sejarah', 4.6, 5041, 10000, 10000, -7.8001175, 110.3534164, 'Bagi para pecinta kesenian, tentu tidak akan pernah melewatkan yang namanya tempat atau gedung yang menyimpan berbagai hasil kesenian. Salah satu gedung kesenian di kawasan Yogyakarta yang cukup terkenal adalah Jogja National Museum. Letaknya berada di Jalan Amri Yahya Yogyakarta ini. Museum ini sendiri sudah berdiri cukup lama dan menyajikan berbagai karya seni menarik nanapik. Secara singkat museum ini mempertontonkan aneka karya seni kontemporer yang unik dan berkualitas tinggi. Bagi Anda yang sangat suka atau sedang menempuh studi seputar karya seni kontemporer, maka keputusan untuk berkunjung ke tempat ini sangatlah tepat. Anda akan disambut dengan karya-karya seni rupa dari berbagai seniman dan juga dengan kreativitas, serta keunikannya masing-masing.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(43, 'Taman Pintar Yogyakarta', 'buatan', 4.5, 4846, 20000, 20000, -7.799757357, 110.3678697, 'Taman Pintar Yogyakarta adalah wahana wisata yang terdapat di pusat Kota Yogyakarta, tepatnya di Jalan Panembahan Senopati No. 1-3, Yogyakarta, di kawasan Benteng Vredeburg. Taman ini memadukan tempat wisata rekreasi maupun edukasi dalam satu lokasi. tempat rekreasi ini sangat baik untuk anak-anak dalam masa perkembangan. taman ini, khususnya pada wahana pendidikan anak usia dini dilengkapi dengan teknologi interaktif digital serta pemetaan video yang akan memacu imajinasi anak serta ketertarikan mereka terhadap teknologi', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(44, 'Pantai Indrayanti', 'pantai', 4.4, 4793, 12000, 12000, -8.1508415, 110.6129852, 'Pantai kecil berpasir putih yang dikelilingi pepohonan dan bebatuan besar, serta beragam restoran & pertokoan', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(45, 'Mangrove Jembatan Api-Api (MJAA)', 'alam', 4.3, 4425, 8000, 8000, -7.89485, 110.0253631, 'Mangrove Jembatan Api-api di Kulon Progo ini memadukan konsep alam dan spot instagenik. Anda bisa bersantai sambil foto-foto di sini.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(46, 'Embung Nglanggeran', 'buatan', 4.5, 4366, 10000, 10000, -7.8471399, 110.5468589, 'Embung Nglanggeran merupakan waduk kecil tempat menampung air yang memiliki luas sekitar 0,34 hektar. Air embung ini digunakan untuk sarana pengairan di area perkebunan sekitar. Selain untuk pengairan, telaga ini juga dimanfaatkan sebagai obyek wisata. Itu karena keindahan panorama yang dapat disaksikan dari embung berketinggian sekitar 495 meter di atas permukaan laut ini. Selain embung (telaga tampungan air), pemandangan gunung api purba menjadi pesona yang ditawarkan oleh objek wisata tersebut.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(47, 'Bukit Wisata Pulepayung', 'alam, buatan', 4.5, 4287, 10000, 10000, -7.8001106, 110.1238954, 'Pule Payung Kulon Progo Yogyakarta merupakan wisata alam dengan spot foto instagramable. Letaknya tidak jauh dari Kalibiru yaitu terletak di Kulon Progo, Yogyakarta. Tempat wisata yang satu ini sangat direkomendasi untuk anak muda yang ingin mendapatkan foto-foto unik karena memiliki banyak spot foto menarik. Daya tarik yang pertama dari Pule Payung Yogyakarta adalah objek wisata yang menyajikan pesona alam pegunungan. Sehingga, orang-orang menyebutnya dengan Bukit Wisata. Pule Payung Yogyakarta adalah objek wisata yang bukan hanya sekedar menawarkan keindahan, serta kenyamanan dalam berwisatanya saja. Namun mampu memberikan rasa aman bagi setiap pengunjungnya. Daya tarik Pule Payung Yogyakarta yang paling populer adalah onjek wisata yang menyajikan beragam spot keren yang instagramable.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(48, 'Seribu Batu Songgo Langit', 'alam, buatan', 4.6, 4223, 2500, 2500, -7.931099, 110.429738, 'Disekitar hutan pinus ternyata masih banyak tempat wisata yang wajib dikunjungi, salah satunya adalah Seribu Batu Songgo Langit. Namanya terdengar asing, namun apabila disebut rumah Hobbit, tentunya sahabat akan segera tahu tempat wisata ini. Ya, Seribu Batu Songgo Langit adalah lokasi dimana terdapat rumah Hobbit yang ada di kawasan Mangunan. Rumah Hobbit yang dimaksud berbeda dengan yang ada di New Zealand pastinya. Rumah Hobbit disini merupakan tiruan dari yang terdapat di film Hobbit atau yang ada di New Zealand. Songgo langit berarti penyangga langit, hal ini dikarenakan di Seribu Baru Songgo Langit terdapat bukit yang seakan akan merupakan tiang dari langit .Seribu Batu Songgo Langit merupakan tempat wisata di kawasan Dlingo yang menawarkan berbagai macam atraksi wisata, namun kebanyakan adalah spot foto. Spot foto di Seribu Batu hampir semuanya anti mainstream.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(49, 'Jurang Tembelan Kanigoro', 'alam, buatan', 4.5, 3867, 0, 0, -7.9401065, 110.4300062, 'Objek wisata Bantul ini ialah wisata alam spot foto terbaru yang sekarang menjadi hits di kalangan remaja kekinian. Sebab jurang Tembelan Mangunan Jogja memiliki deck view atau gardu pandangan terlihat cukup unik mirip seperti kapal. Tak heran pada akhirnya banyak wisatawan menyebutnya sebagai kapal titanic diatas awan. Sebelum seperti sekarang, sebenarnya jurang Tembelan Kanigoro Bantul tergolong masih sepi pengunjung. Lantaran baru saja dikembangkan oleh pihak pengelola wisata. Namun spot foto corner berupa gardu pandangan unik dan keindahan dimilikinya membuat pengunjung mulai ramai menyemarakkan. Sehingga tak lagi wisatawan lokal saja berbondong-bondong kesana, wisatawan luar kota pun dibuat penasaran dan menyempatkan waktu berswafoto. Di wisata alam Jogja ini pengunjung diperbolehkan bebas melakukan sesi pemotretan atau pun hanya sekedar berselfie ria. Tak hanya itu saja, pengunjung pun juga dapat menyaksikan lanskap matahari terbenam ketika menjelang sore hari dan juga kala matahari terbit yang diiringi pula keindahan tebal nya kabut putih khas pegunungan Mangunan.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(50, 'Malioboro', 'buatan, budaya dan sejarah', 4.7, 3752, 3000, 3000, -7.7982487, 110.3652793, 'Malioboro adalah jantung Kota Jogja. Meskipun terkenal sebagai surga belanja cendera mata dan barang kerajinan, ternyata tak sedikit wisatawan dan orang lokal mendatangi Malioboro pagi-pagi sekali untuk berolahraga atau sekedar menikmati udara segar sambil mencari sarapan', 'malioboro.jpeg', '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(51, 'Blue Lagoon Jogja', 'alam, wisata air', 4.3, 3585, 3000, 3000, -7.7044358, 110.45026, 'Blue Lagoon Jogja merupakan salah satu obyek wisata yang di jadikan tempat pemandian sumber mata air ini yang muncul dari permukaan tanah di dalam kolam. Apabila Anda melihat ke dalam kolam akan terlihat gelembung-gelembung kecil yang muncul dari permukaan tanah. Hal itu menunjukkan bahwa terdapat air yang terus menerus muncul dari permukaan tanah tersebut. Meskipun Blue Lagoon di Jogja ini sudah lama namun tempat wisata ini mulai tenar dipertengahan tahun 2014. Pemandian Blue Lagoon ini terletak di Desa Dalem, Widodomartani, Ngemplak, Sleman, Yogyakarta', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(52, 'Bundaran UGM', 'buatan', 4.7, 3535, 0, 0, -7.7760052, 110.3760616, 'Bundaran UGM merupakan gerbang masuk utama Universitas Gadjah Mada.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(53, 'Pantai Pok Tunggal', 'pantai', 4.5, 3467, 10000, 10000, -8.1554468, 110.6217582, 'Pantai Pok Tunggal adalah salah satu pantai populer di Gunungkidul. Pantai ini terletak di Desa Tepus, Kecamatan Tepus. Posisinya sejajar dan tak jauh dari Pantai Indrayanti dan Pantai Watulawang yang tak kalah populer. Nama Pok Tunggal berasal dari keberadaan pohon duras di kawasan pantai tersebut. Pohon jenis ini dikenal sangat sulit tumbuh di daerah pesisir. Karena hanya satu-satunya, pohon ini kemudian menjadi semacam maskot bagi pantai ini. Yang menjadi ciri khas pantai ini adalah bentuknya yang sempit dan memanjang. Di samping itu, lokasinya yang dikelilingi bukit kapur dan karang menjadikan Pok Tunggal tampak lebih eksotis. Pantai ini cocok sebagai destinasi berbagai macam kegiatan rekreasi.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(54, 'Pantai Ngobaran', 'pantai, budaya dan sejarah', 4.5, 3288, 5000, 5000, -8.1191333, 110.5050409, 'Keunikan yang menjadi ciri khas Pantai Ngobaran adalah adanya Pura dan Arca. Keberadaannya membuat sekilas Pantai Ngobaran memiliki suasana khas yang mirip dengan Pulau Bali. Satu keunikan yang kemungkinan besar tersembunyi dari kebanyakan wisatawan adalah adanya sumber air tawar di tepi laut. Namun aliran air tawar hanya bisa ditemukan ketika air laut sedang surut. Satu sajian spesial yang bisa didapatkan di Pantai Ngobaran adalah landak laut atau bulu babi. Kuliner ini bisa dipesan di warung-warung yang ada di sekitar pantai. Bagian landak laut yang dimakan adalah dagingnya.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(55, 'Bukit Panguk Kediwung', 'alam', 4.5, 3245, 3000, 3000, -7.9583695, 110.4407622, 'Bukit Panguk Kediwung berlokasi di Kediwung, Mangunan, Dlingo, Bantul, Yogyakarta. Jangan khawatir untuk tersesat karena di sepanjang jalan menuju ke lokasi kita akan melihat beberapa papan petunjuk. Kurang lebih berjarak 20 km dari pusat Kota Yogyakarta. Dari pusat Kota Yogyakarta anda bisa bergerak menuju ke selatan tepatnya ke arah Jalan Imogiri Timur, ikuti jalan hingga menemukan Pasar Imogiri, lalu belok kiri dan lanjutkan perjalanan menuju ke arah Dlingo, dari sana anda akan mulai melihat petunjuk jalan menuju Bukit Panguk Kediwung. Akses jalan menuju Bukit Panguk Kediwung sudah diaspal halus hanya saja konturnya sedikit naik turun namun masih dalam kategori aman. Sangat disarankan untuk menggunakan kendaraan pribadi karena akses ke sini menggunakan kendaraan umum cukup sulit. Salah satu yang menjadi magnet bagi pengunjung untuk datang adalah keindahan pemandangan alamnya. Pengelola sudah menyediakan beberapa gardu pandang terbuat dari kayu dan bambu yang sengaja dibangun menjorok ke arah bibir tebing sehingga pengunjung bisa melihat dengan jelas pemandangan di bawah Bukit Panguk Kediwung yang eksotis. Dari atas kita bisa melihat aliran panjang Sungai Oya yang membelah bukita hijau yang menghampar hijau. Gardu pandang ini bukan gardu pandang biasa karena memiliki bentuk-bentuk yang unik karena sekaligus jadi spot foto. Ada yang berbentuk jembatan memanjang, bentuk sayap kupu-kupu, bentuk kereta kuda, dan masih banyak lagi. Gardu pandang dengan bentuk biasa juga tersedia. Gardu pandang di Puncak Bukit Penguk Kediwung ini terbagi dalam dua bagian, yaitu bagian timur dan selatan. Gardu pandang bagian timur sangat cocok untuk menikmati matahari terbit di pagi hari sedangkan gardu pandang sebelah selatan menghadap ke pegunungan yang berjajar. Kedua spot sama-sama menyuguhkan pemandangan yang luar biasa dan tidak boleh anda lewatkan ketika liburan di Yogyakarta.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(56, 'Kebun Teh Nglinggo', 'agrowisata', 4.5, 3199, 10000, 10000, -7.647054, 110.1414699, 'Wisata Kebun Teh Nglinggo adalah satu-satunya kebun teh yang berada di Yogyakarta. Sebenarnya kebun teh ini merupakan tempat mata pencaharian penduduk di sekitar Pagerhajo. Kemudian warga mempunyai ide untuk menjadikannya sebagai tempat wisata. Dengan pesona alamnya Kebun Teh Nglinggo menjadi objek wisata yang cukup terkenal di Kulon Progo. ', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(57, 'Pantai Nglambor', 'pantai', 4.4, 3192, 10000, 10000, -8.1827028, 110.6792399, 'Pantai Nglambor adalah sebuah pantai eksotis yang terletak di Kelurahan Purwodadi, Kecamatan Tepus, Gunung Kidul, Daerah Istimewa Yogyakarta. Lokasinya persis di sebelah barat dari Pantai Siung dan sebelah timur dari Pantai Jogan. Jaraknya kurang lebih 74 km dari pusat kota Jogja, pantai ini menawarkan panorama pantai yang indah.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(58, 'Air Terjun Kedung Pedut', 'alam, wisata air', 4.5, 3164, 3000, 3000, -7.7699875, 110.1210707, 'Air Terjun Kedung Pedut atau biasa disebut Curug Kedung Pedut berasal dari istilah bahasa Jawa. Curug yang berarti air terjun, kedung berarti kubangan atau kolam, dan pedut berarti kabut. Air Terjun Kedung Pedut merupakan salah satu wisata alam yang di Kulonprogo yang dikenal karena keindahan warna airnya.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(59, 'Pantai Ngandong', 'pantai', 4.5, 3151, 10000, 10000, -8.146423, 110.6061408, 'Pantai ini memiliki garis pantai yang panjang dengan pasir putih yang bersih dan lembut. Ada bebatuan di pinggir pantai yang bisa dimanfaatkan oleh pengunjung untuk bermain air. Permainan air disini selain berenang, juga tersedia fasilitas kano. Pemandangan unik yang dapat dilihat di pantai ini, adalah adanya pulau yang berada di tengah laut. Saat sedang surut, pulau itu bisa dicapai dengan jalan kaki.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(60, 'Pantai Sepanjang', 'pantai', 4.4, 3130, 10000, 10000, -8.1366656, 110.5659962, 'Siapa sangka, ternyata Yogyakarta pun punya “Kuta”-nya sendiri Ialah Pantai Sepanjang, salah satu pantai di Kabuaten Gunungkidul. Daerah yang satu ini memang memiliki koleksi pantai cantik yang tak terhitung jumlahnya. Bahkan pantai ini digadang-gadang sebagai ‘Kuta Tempo Doeloe‘. ', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(61, 'Candi Sewu', 'budaya dan sejarah', 4.6, 2968, 10000, 10000, -7.7439217, 110.4929095, 'Candi Sewu adalah candi Buddha yang dibangun pada abad ke-8 Masehi yang berjarak hanya delapan ratus meter di sebelah utara Candi Prambanan. Candi Sewu merupakan kompleks candi Buddha terbesar kedua setelah Candi Borobudur di Jawa Tengah. Candi Sewu berusia lebih tua daripada Candi Borobudur dan Prambanan. Meskipun aslinya memiliki 249 candi, oleh masyarakat setempat candi ini dinamakan \"Sewu\" yang berarti seribu dalam bahasa Jawa. Penamaan ini berdasarkan kisah legenda Loro Jonggrang.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(62, 'Gunung Api Purba Nglanggeran', 'alam', 4.6, 2807, 15000, 15000, -7.8427585, 110.5379165, 'Kawasan Ekosistem Gunung Purba Nglanggeran atau yang biasa disebut Gunung Nglanggeran ini merupakan kawasan yang litologinya disusun oleh material vulkanik tua, berbentuk gunung batu raksasa yang membentang sepanjang kurang lebih 800 meter dengan tinggi mencapai 300 meter. di Kawasan Gunung Api Purba Nglanggeran juga dijumpai fauna dan flora langka, seperti tanaman tremas (tanaman obat yang hanya hidup dikawasan ekowisata Gunung Api Purba), kera ekor panjang.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(63, 'Galaxy Waterpark', 'wisata air', 4.3, 2761, 25000, 35000, -7.8159633, 110.4136917, 'Galaxy Waterpark cocok sebagai opsi untuk berlibur bersama keluarga, apalagi untuk anak-anak. Disini disediakan bermacam wahana seperti kolam arus, flying fox, wahana water slide, kolam olimpic yang didesain dengan standar internasional untuk para atlet dewasa renang.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(64, 'Pemecah Ombak Pantai Glagah', 'buatan, alam', 4.4, 2683, 5000, 5000, -7.9190028, 110.0775951, 'Pemecah gelombang merupakan atraksi wisata utama yang ada di Pantai Glagah. Banyak pengunjung datang ke pantai ini untuk melihat secara langsung seperti apa pemecah gelombang itu. Ada dua pemecah gelombang di kawasan Pantai Glagah ini. Pemecah gelombang yang banyak dikunjungi wisatawan ada di sisi barat yang satu bagian dengan kawasan pantai pasir Glagah. Pemecah gelombang sisi timur bisa dijangkau melalui Dermaga Adikarta.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(65, 'Pantai Timang', 'pantai', 4.5, 2656, 5000, 5000, -8.1759266, 110.6624196, 'Begitu memasuki wilayah pantai, pengunjung akan disambut dengan indahnya perpaduan warna alam. Air di bibir pantai yang berwarna hijau toska, dan semakin berwarna biru ke tengah laut. Tidak perlu ditanya lagi, tentu airnya begitu jernih dan bersih. Selain itu, terdapat pula perbukitan yang ditumbuhi banyak pohon, begitu menyejukkan dipandang mata. Batu – batu karang yang besar membentang dengan gagahnya. Siap menghadang besarnya ombak yang menghantam pantai. Yang paling khas dari pantai ini adalah keberadaan gondola untuk menyeberang menuju Pulau Timang. Gondola ini membentang dari Pantai menuju ke Pulau Timang yang berupa batu karang. Gondola ini terbuat dari kayu sederhana, dengan tali tambang yang ditarik manual. Wahana lain yang juga memacu adrenalin adalah Jembatan Gantung. Jembatan ini juga menghubungkan area pinggir pantai dengan Pulau Timang. Dimana jembatan ini menjadi alternatif bagi pengunjung yang ingin menyeberang selain menggunakan gondola.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(66, 'Museum HM Soeharto', 'museum, budaya dan sejarah', 4.4, 2628, 10000, 10000, -7.7913177, 110.2805284, 'Museum Soeharto adalah adalah bangunan berBudaya dan Sejarah berbentuk museum yang menyimpan memoar dan peninggalan-peninggalan Jenderal Besar TNI Soeharto yang diresmikan pada tahun 2013. Museum ini berdiri di atas tanah milik Soeharto yang terletak di Dusun Kemusuk Lor, Desa Argomulyo, Kecamatan Sedayu, Kabupaten Bantul, Daerah Istimewa Yogyakarta. Di dalam memorial ini, terdapat sebuah bangunan joglo besar di pusat lokasi, rumah kakek buyut Pak Harto yaitu Notosudiro. Terdapat juga barang-barang peninggalan, diorama Budaya dan Sejarah kehidupan pak Harto,  dokumen arsip nasional, video, dan beberapa foto yang berkaitan dengan Budaya dan Sejarah Pak Harto. ', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(67, 'Bukit Lintang Sewu', 'alam', 4.5, 2600, 3000, 3000, -7.9157997, 110.4366436, 'Bukit Lintang Sewu merupakan salah satu tempat wisata alam yang berhawa sejuk di Yogyakarta. Keunggulan lainnya adalah lingkungannya menawarkan panorama yang indah. Dari bukit ini dapat melihat pemandangan lampu kota atau melihat bintang di malam hari. Bukit Lintang Sewu juga punya banyak fasilitas liburan, seperti area glamping, camping, outbound dan hutan kayu putih', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(68, 'Grand Puri Waterpark', 'wisata air', 4.2, 2440, 35000, 35000, -7.8777662, 110.352078, 'Grand Puri Waterpark Yogya berlokasi di daerah Bantul, salah satu waterpark terbesar di Kabupaten Bantul. Tempat rekreasi keluarga yang menyediakan atraksi dan wahana seru dan bisa dimainkan baik untuk anak-anak, maupun orang dewasa. Terdapat kolam seni olympic, kolam arus, kolam penerima, dan kolam batita. Disana juga terdapat berbagai fasilitas foodcourt, freewifi, gazebo, atm, dan masih banyak lagi.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(69, 'Balong Waterpark', 'wisata air', 4.2, 2376, 15000, 20000, -7.8434924, 110.4103899, '“Full of Splash and Fun”, itulah slogan yang diusung oleh Balong Waterpark. Di dalam waterpark ini akan kita temukan dua buah kolam utama yang diperuntukkan untuk balita dan orang dewasa. Selain itu, berbagai wahana permainan semacam ember tumbah, water coaster, hingga family slide juga tersedia untuk dinikmati. Suasana di dalam lokasi cukup sejuk dan bersih. Berbagai fasilitas umum juga sudah disiapkan untuk memberi kenyamanan bagi para pengunjung. Waterpark ini sangat recomended sebagai tujuan rekreasi akhir pekan bersama keluarga. Anak-anak bisa bermain sepuasnya, orang dewasa juga bisa bersantai dengan nyamannya. ', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(70, 'Kids Fun Park (Pusat)', 'buatan', 4.4, 2314, 65500, 10000, -7.827611573, 110.4413491, 'Kids Fun merupakan wahana atau tempat bermain untuk anak-anak', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42');
INSERT INTO `wisatas` (`id`, `nama`, `kategori`, `rating`, `total_review`, `harga_weekday`, `harga_weekend`, `latitude`, `longitude`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(71, 'Pantai Kesirat', 'pantai', 4.6, 2296, 5000, 5000, -8.0961535, 110.4350483, 'Pantai Kesirat dapat dijadikan area untuk perkemahan. Letaknya yang jauh dari keramaian bisa membuat pengunjung jadi lebih nyaman dan menikmati momen kebersamaan ketika berlibur dengan keluarga, teman, atau kerabat. Disana fasilitas warung makan dan kamar mandi tetap beroperasi selama 24 jam.Yang menjadi keunggulan dari Pantai Kesirat adalah letaknya yang dikelilingi tebing. Tebing ini merupakan tempat favorit untuk memancing ikan atau sekadar duduk-duduk menikmati hembusan angin di pantai.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(72, 'Stonehenge Merapi', 'buatan', 4.3, 2282, 5000, 5000, -7.6022481, 110.4479012, 'Wisata baru ini baru ngehits di Jogja tepatnya di Kepuharjo, Cangkringan, Sleman kamu bakal menemui replika Stonehenge, peninggalan jaman praBudaya dan Sejarah berupa susunan batu-batu besar yang tidak beraturan yang aslinya terletak di Inggris. Bentuk dan susunan batu di Stonehenge Cangkringan mirip dengan aslinya, lengkap dengan alas rumput hijaunya. Masuk dan duduk di bagian dalam lingkaran tersebut akan jadi pengalaman yang berbeda.', 'merapi.jpeg', '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(73, 'CitraGrand Mutiara Waterpark Yogyakarta', 'wisata air', 4.3, 2260, 50000, 80000, -7.8137343, 110.2831838, 'Waterpark ini menjadi salah satu objek wisata air favorit untuk keluarga. Mengusung tema Treasure Adventure, CitraGrand Mutiara Waterpark Yogya menghadirkan berbagai wahana permainan air yang akan membawa pengunjung seolah berpetualang bersama bajak laut.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(74, 'Wisata Telaga Potorono', 'buatan, wisata air', 4.4, 2248, 10000, 10000, -7.8300074, 110.4204773, 'Selain diperuntukkan sebagai telaga, telaga desa Potorono juga dimanfaatkan sebagai tempat wisata alternatif yang menarik. Telaga desa Potorono menawarkan pemandangan yang indah dengan udara yang sejuk. Di sekitar telaga terdapat enam (6) buah gazebo/gubuk yang dapat dimanfaatkan sebagai tempat berteduh.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(75, 'Desa Wisata Pulesari', 'desa wisata', 4.4, 2245, 50000, 50000, -7.6258806, 110.371698, 'Suasana khas pedesaan akan segera menyambut para wisatawan saat menjejakan kaki pertama kali di desa yang masuk dalam kabupaten Sleman ini. Sungai berair jernih, perkebunan salak yang tertata rapi, dan sapaan ramah dari warga menjadi pemandangan lumrah di desa ini.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(76, 'Wisata Alam Watu Amben', 'alam, buatan', 4.4, 2235, 10000, 10000, -7.8576729, 110.4727388, 'Watu Amben Jogja merupakan sebuah wisata alam dimana kamu bisa menikmati lampu kota Yogyakarta di malam hari. Salah satu wisata alam unik dari Jogja adalah Watu Amben Jogja. Objek wisata ini tidak hanya memiliki unsur alam namun juga unsur buatan. Objek wisata ini termasuk ke dalam komplek perbukitan Bukit Bintang Gunung Kidul. Dari atas bukit ini, kamu bisa melihat indahnya pemandangan alam dan pemandangan kota Jogja. Apalagi kalau dinikmati pada malam hari, kamu bisa melihat kelap-kelip lampu Kota Jogja. Tempat ini pun menjadi pilihan tempat nongkrong asyk bagi para masyarakat Jogja khususnya para anak muda. Ya, karena selain menikmati pemandangan, kamu juga bisa menikmati hidangan lezat khas Jogja.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(77, 'Candi Sojiwan', 'budaya dan sejarah', 4.5, 2159, 5000, 5000, -7.7603952, 110.4962014, 'Candi Sojiwan memiliki keunikan. Keunikan ini berasal dari beberapa panel relief yang bercerita tentang cerita-cerita binatang. Jika dipahami lebih dalam cerita-cerita ini menyampaikan pesan-pesan moral yang tidak lekang oleh waktu. Pesan-pesan moral ini juga sangat berguna untuk menjalani kehidupan sehari-hari. Setelah dilakukan penelitian, terdapat beberapa temuan menarik. Salah satunya adalah parit keliling. Parit keliling ini sebagian berada di pemukiman warga. Di dalam parit kelagian ditemukan arca, pondasi candi, struktur pagar, batu candi (lepas), struktur dan batu candi di sekitar permukiman warga yang berada di sebelah selatan candi Induk. Candi Sojiwan berada di kawasan Siwa Plateu yang banyak terdapat candi baik candi berlatar belakang agama hindu maupun budha. Hal ini menunjukkan bahwa sejak dulu nenek moyang kita telah hidup harmonis dan sangat toleran. Nilai-nilai toleransi ini sangat dibutuhkan masyarakat Indonesia sekarang ini mengingat kita berbeda-beda keyakinan.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(78, 'Goa Selarong', 'alam', 4.3, 2116, 6000, 6000, -7.860965268, 110.3145237, 'Gua Selarong atau bisa disebut Gua Diponegoro, adalah gua berBudaya dan Sejarah sekaligus tempat wisata alam dan religius. Goa Selarong merupakan sebuah goa kecil yang berada di Dusun Kembangputihan, Kecamatan Pajangan, Bantul. Lokasinya cukup mudah dijangkau karena tak jauh dari Kota Bantul, DIY. Di Goa Selarong, terdapat dua goa, yaitu Goa Kakung dan Goa P Sekilas, tak ada tampilan yang menarik secara visual dari kedua goa tersebut. Namun, goa itu menyimpan peristiwa besar yang menjadi bagian dari Budaya dan Sejarah bangsa Indonesia. Terutama kisah kepahlawanan Pangeran Diponegoro yang menjadi tokoh besar saat meletusnya Perang Jawa pada 1825-1830.utri.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(79, 'Waduk Sermo', 'buatan, wisata air', 4.5, 2057, 5000, 5000, -7.821219329, 110.1149803, 'Waduk Sermo merupakan sebuah waduk yang berada di Kabupaten Kulon Progo, Daerah Istimewa Yogyakarta, waduk seluas 157 hektar ini dibangun mulai pada tahun 1994 dan diresmikan oleh Presiden Indonesia ke-2 saat itu yaitu Presiden Soeharto pada 20 November 1996. Waduk ini dibangun dengan membendung Kali Ngrancah di Desa Hargowilis Kecamatan Kokap, adanya pembangunan waduk ini juga mengahruskan pemerintah melakukan program transmigrasi, sebanyak 100 kk di transmigrasikan ke Tak Toi Bengkulu. Ada banyak hal yang bisa sobat semua lakukan di tempat ini, yang pertama yaitu berfoto di spot foto menarik, terdapat berbagai macam spot foto menarik yang bisa dimanfaatkan pengunjung di tempat ini. Selanjutnya bagi sobat semua yang hobi memancing ikan tak ada salahnya mencoba memburu ikan “Setan Merah” yaitu ikan predator yang ada di waduk ini, Ikan Merah merupakan primadona dikalangan pemancing di Waduk Sermo ini.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(80, 'Pantai Glagah', 'pantai', 4.4, 2004, 6000, 6000, -7.9119427, 110.0647339, 'Pantai Glagah Indah adalah salah satu pantai yang menjadi objek wisata di provinsi Daerah Istimewa Yogyakarta. Pantai Glagah Indah merupakan salah satu pantai di Yogyakarta dengan hamparan pasir yang berwarna hitam dan banyak mengandung pasir besi. Pantai Glagah Indah memiliki akses yang baik. Pantai Glagah dikenal sebagai salah satu pantai di Jogja yang memiliki ombak cukup besar. Oleh sebab itu, di kawasan pantai pun dibangun tetrapod.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(81, 'Grojogan Watu Purbo Bangunrejo', 'alam', 4.5, 1927, 5000, 5000, -7.6340196, 110.3383881, 'Tempat ini menjanjikan spot foto selfi yang begitu menarik dan aliran sungai serta taman bunga yang indah. Pun, wisatawan dapat menikmati kuliner pedesaan yang menggugah selera dengan dilatarbelakangi birunya Gunung Merapi. Destinasi yang masih terhitung baru ini sebenarnya adalah aliran sungai Kali Krasak yang berhulu di Gunung Merapi. Aliranya terbentuk dari 6 buah sabo dam yang tersusun bertingkat dengan ketinggian 3 sampai 7 meter sehingga tercipta air terjun atau dalam bahasa Jawa disebut grojogan. ', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(82, 'Kebun Buah Mangunan', 'agrowisata', 4.5, 1887, 5000, 6000, -7.939896, 110.424336, 'Kebun Buah Mangunan adalah salah satu tempat wisata di kawasan Mangunan, Dlingo, Kabupaten Bantul, Yogyakarta. Kawasan wisata yang terkenal sebagai salah satu spot Negeri di Atas Awan ini terletak sekitar 25 kilometer (km) dari kota Yogyakarta. Dengan waktu tempuh kurang lebih satu jam perjalanan, Kebun Buah Mangunan bisa jadi alternatif tempat wisata bersama keluarga di akhir pekan.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(83, 'Pantai Ngrenehan', 'pantai', 4.4, 1876, 5000, 5000, -8.1211475, 110.5142337, 'Pantai Ngrenehan merupakan pantai nelayan. Terletak di desa Kanigoro Kecamatan Saptosari kurang lebih 30 km di sebelah selatan kota Wonosari. Suatu pantai berupa teluk yang dikelilingi hamparan perbukitan kapur dan memiliki panorama yang sangat memukau dengan deburan ombak menerpa pasir putih. Pantai ini diapit oleh dua bukit karang yang cukup besar dan menjorok ke laut. Di pantai ini, pengunjung dapat mengamati langsung kegiatan nelayan tradisional. Juga bisa menikmati ikan segar yang baru saja diangkat dari kedalaman laut selatan.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(84, 'Tirtonirmolo Water Park Galuh', 'wisata air', 4.2, 1857, 30000, 30000, -7.748672, 110.501128, 'Tirtonirmolo Water Park Galuh merupakan gabungan dari hotel galuh yang berada di sisi selatan Tirtonirmolo Water Park Galuh. Wisatawan dapat menikmati berbagai wahana di sekitar Tirtonirmolo Water Park. Bukan hanya air saja disini juga terdapat 12 kolam yaitu kolam renang dewasa, kolam renang seluncur, anak-anak, mandi bola, kolam keluarga, kolam arus, kolam ember tumpah, kolam renang songsong gora, kolam renang laba-laba, kuda laut, dan kolam air mancur. Wisata ini cocok didatangi bersama keluarga maupun teman.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(85, 'Affandi Museum', 'budaya dan sejarah, museum', 4.6, 1848, 30000, 30000, -7.782713, 110.396397, 'Museum Affandi merupakan salah satu museum seni di Daerah Istimewa Yogyakarta, Indonesia. Museum yang berada di tepi Sungai Gajah Wong ini menyimpan berbagai macam lukisan karya Affandi. Selain itu, museum ini juga menyimpan banyak benda peninggalan Affandi lainnya seperti mobil, sepeda onthel dan masih banyak lagi. Ada lebih dari 300 lukisan termasuk beberapa potret diri dan karya dari seniman terkenal lainnya seperti Sudjojono, Hendra Gunawan, dan Barli. Jangan lupa untuk mengambil foto rumah Affandi yang ikonis dengan atap yang berbentuk pelepah pisang.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(86, 'Museum Monumen Pangeran Diponegoro', 'budaya dan sejarah, museum', 4.4, 1778, 10000, 10000, -7.7865891, 110.3514473, 'Museum Monumen Pangeran Diponegoro adalah museum sekaligus monumen kediaman Pangeran ketika dikepung oleh pihak Belanda. Museum ini berisi berbagai peninggalan Pangeran Diponegoro. Di museum ini juga terdapat pendapa dan pringgitan yng didalamnya berisi benda-benda berBudaya dan Sejarah.  Benda berBudaya dan Sejarah tersebut berupa berbagai jenis senjata tradisional seperti keris, tombak, pedang, panah, dan masih banyak lagi senjata yang dikoleksi di dalam museum ini. i Museum Monument Pangeran Diponegoro ini juga terdapat dinding yang berlubang yang menjadi jalan keluar Pangeran Diponegoro untuk bisa lolos dari kepungan penjajah Belanda. Di museum ini juga terdapat barang peninggalan milik Sri Sultan Hamengku Buwono II yaitu ketipung dan wilahan bonang penembung yang terbuat dari kayu dan perunggu yang berwarna merah dan kuning, barang peninggalan Sri Sultan HB II yang ada mencapai lebih dari 100 buah. Disana juga terdapat dua senjata meriam yang terletak di depan dan disebelah timur pendopo, serta ada berbagai macam peralatan rumah tangga seperti tempat menaruh siri, canting, teko dan bokor.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(87, 'Puncak Kebun Buah Mangunan', 'agrowisata', 4.6, 1773, 8000, 8000, -7.9413718, 110.4247345, 'Objek wisata ini menawarkan keindahan berupa panorama alam dataran tinggi yang hijau dan masih sangat alami. Selain itu, dari sana kamu juga bisa menikmati landscape Kota Bantul dengan segala rutinitas penduduknya, landscape yang sangat cantik dan mempesona. Dari kawasan wisata ini kamu juga bisa menyaksikan gagahnya gunung Sewu yang berada di seberang. Beberapa tanaman yang bisa kamu amati dan pelajari yakni pohon rambutan, durian, manggis, jeruk, mangga, pohon pinus, king grass atau rumput raja, salak magium, duku, sawo, cempedak, jambu biji, dan masih banyak yang lainnya. Disana wisatawan dapat berburu aneka buah-buahan, camping, melihat watu tumpang yaitu batu besar yang menumpang di atas batu kecil, memancing, bersepeda, berenang, belajar pembibitan sapi, flying fox.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(88, 'Lava Tour Merapi', 'alam', 4.6, 1714, 350000, 350000, -7.5934503, 110.4316004, 'Lava Tour Merapi bisa menjadi pilihan aktivitas wisata ketika berlibur di Yogyakarta. Lava Tour Merapi adalah istilah untuk tur wisata kawasan terdampak erupsi Gunung Merapi tahun 2010. Tur yang dimaksud saat ini merupakan tur menggunakan mobil jenis jeep. Kegiatan tur meliputi kunjungan ke sejumlah titik yang terkena dampak langsung erupsi. Ada berbagai macam paket yang disediakan.', 'merapi.jpeg', '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(89, 'Museum Sonobudoyo Unit I', 'budaya dan sejarah, museum', 4.6, 1711, 3000, 3000, -7.8024499, 110.3639555, 'useum Sonobudoyo unit pertama yang ada di dekat Alun-Alun Keraton Yogyakarta yang memiliki bentuk seperti bangunan rumah joglo dengan gaya Masjid Keraton Kasepuhan Cirebon. di museum ini terdapat koleksi alat musik seperti replika andong, wayang Rama, Sinta dan juga Lesmana, Anoman hingga Rahwana. Kemudian koleksi keris, koleksi batik dan koleksi buku kebudayaan.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(90, 'Museum Factory Dan Kedai Chocolate Monggo', 'agrowisata', 4.6, 1704, 15000, 15000, -7.8408737, 110.298431, 'Disini wisatawan dapat belajar mengenai Budaya dan Sejarah cokelat, melihat langsung pembuatan cokelat di pabrik, dan langsung bisa mempraktekkan membuat cokelat. Cokelat Monggo ini dibuat dari warga negara Belgia, yang terinspirasi karena rasa rindunya akan rasa cokelat Belgia.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(91, 'Kawasan Pantai Baron', 'alam', 4.4, 1698, 10000, 10000, -8.1288246, 110.5487763, 'Objek wisata Pantai Baron merupakan pantai yang membentuk cekungan. Seperti pantai lainnya, di Pantai Baron tersedia aneka ikan laut beserta olahannya. Ikan yang biasanya dijual di Pantai Baron adalah udang windu, kakap, bawal putih dan tongkol. Pantai Baron memiliki fasilitas berupa tempat pelelangan ikan, wahana permainan anak-anak, perahu bermesin, dan toko cenderamata. Buah sirkaya, pisang tanduk, sirsak, dan berbagai macam cenderamata yang terbuat dari kerang laut.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(92, 'Kids Fun Galleria Mall', 'buatan', 4.4, 1693, 60000, 60000, -7.7823797, 110.3791605, 'Kids Fun cabang Galeria Mall menawarkan tema Wild Wild West yang membawa kita ke dunia barat dimana kaum koboi dan Indian bertemu. Tidak hanya sekedar nama, desain interiornya pun disesuai dengan tema yang diusung. Di beberapa bagian diletakkan patung koboi dan Indian untuk memperkuat suasana. Belum lagi area counter yang sekilas mirip bar di film-film bertema sejenis.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(93, 'Taman Bunga Amarilis', 'agrowisata', 4.2, 1641, 10000, 10000, -7.8563245, 110.4991167, 'Taman Bunga Amarlis dapat dikatakan wisata tahunan, karena bunga mekar setiap tahun. Namun, jangka mekarnya sangat pendek, sehingga pengunjung harus segera datang ketika mekar. Dan dari tahun ke tahun, kondisi taman bunga sudah semakin baik. Jalan setapak yang sudah rata dengan semen telah disediakan. Sehingga, pengunjung tidak perlu khawatir becek atau kotor karena tanah. Taman pun telah dibentuk dengan kotak-kotak yang membuatnya tampak tertata rapi. Taman bunga telah dilengkapi dengan jalan setapak yang membantu akses pengunjung lebih dekat dengan bunga. Jadi, angle ketika berfoto lebih terlihat indah. Taman bunga juga dibentuk sehingga tidak monoton hanya satu lahan seperti sawah.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(94, 'Tegaldowo Puspa Gading Park', 'buatan', 4.4, 1635, 10000, 10000, -7.8656715, 110.3228654, 'Satu lagi obyek wisata alternatif karya dari warga hadir di Kabupaten Bantul, destinasi baru tersebut telah menjadi viral di media sosial (medsos) namanya Taman Puspa Gading berlokasi di Dusun Tegaldowo, Dukuh Grojogan, Kecamatan Bantul, Bantul, DIY. Taman Puspa Gading berada di pinggiran sungai Bedog, selain berupa taman untuk berswafoto berlatar belakang hamparan sawah dengan berhiaskan patung kadal raksasa dan jembatan gantung yang membentang di atas sungai. Taman Puspa Gading juga memiliki beberapa wahana permainan anak, diantaranya kolam renang, mandi bola, terapi ikan, foto dengan badut kelinci, motor apv, menangkap ikan, dan wahana melukis.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(95, 'Bendungan Kamijoro', 'buatan', 4.3, 1563, 10000, 10000, -7.8787758, 110.2662888, 'Bendungan Kamijoro adalah bendungan yang menahan aliran sungai Progo dan mengalirkan sebagian airnya untuk pengairan areal persawahan. Tapi Bendungan Kamijoro bukan sembarang bendungan, di atas bendungan ini terbentang jembatan sepanjang 161 meter dengan lebar 3 meter. Jembatan Bendungan Kamijoro menghubungkan Bantul dan Kulon Progo tepatnya di Dusun Plambongan, Desa Triwidadi, Kecamatan Pajangan, Kabupaten Bantul dengan Dusun Kaliwiru, Desa Tuksono, Kecamatan Sentolo, Kulon Progo. Tanpa jembatan itu, orang harus memutar sangat jauh. Jembatan ini menjadi landscape baru untuk Bantul dan Kulon Progo. Bentuknya mirip jembatan Ampera di Palembang, lengkap dengan tiang yang menjulang tinggi dan hiasan tali-tali baja yang seolah menyangga beban jembatan. Bendungan ini jadi salah satu daya tarik wisata sekaligus mampu menggerakkan ekonomi mikro masyarakat di sekitarnya. Karena banyak yang berkunjung ke sana, masyarakat setempat memanfaatkan kesempatan itu untuk berjualan aneka jajanan dan makanan. Bendungan Kamijoro diresmikan langsung oleh Presiden Joko Widodo pada akhir 2019 lalu dan hingga kini jadi salah satu magnet wisata di Kulon Progo dan Bantul. Selain jembatan yang cantik, ada juga Taman Bendungan Kamijoro yang bisa jadi pilihan tempat untuk bersantai, duduk dan menikmati hembusan angin bendungan yang semilir. Taman ini berada di sisi barat atau masuk wilayah Kulon Progo terdapat taman. Dari sini kita bisa berfoto dengan background jembatan sekaligus bendungan yang megah. Sedang di sisi timur atau masuk wilayah Bantul terdapat sebuah sistem pengairan yang tertata canggih dan modern. Terdapat beberapa pintu-pintu air dengan kontrol elektrik. Di area taman, terdapat plaza yang besar untuk berfoto-foto, bersantai, ataupun berkumpul mengadakan kegiatan massal. Salah satu spot foto yang jadi favorit pengunjung adalah di bagian undakan tertinggi plaza dengan latar belakang tulisan “Bendungan Kamijoro.” Jika kamu ingin berkunjung ke sini membawa keluarga tak perlu khawatir, Bendungan Kamijoro sangat ramah keluarga. Tak jauh dari taman, terdapat aneka mainan anak-anak seperti ayunan, jungkat-jungkit, hingga papan luncur. Taman juga dikemas sebagai wisata edukasi bagi keluarga dengan ditanam banyak jenis buah-buahan seperti durian, kelengkeng, sawo, hingga jambu kristal. Area taman sudah dibangun untuk pedestrian sehingga sangat nyaman untuk berjalan kaki.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(96, 'Goa Kiskendo', 'alam, budaya dan sejarah', 4.3, 1446, 5000, 5000, -7.7471047, 110.1310147, 'Goa beserta kisah-kisah yang menyertainya menjadi daya tarik terbesar obyek wisata ini. Goa konon sudah ditemukan 2 abad silam. Para leluhur terdahulu memanfaatkan untuk mencari ketenangan batin dan pencerahan lewat bertapa. Goa itu sepanjang 1,5 kilometer goa di dalam bumi Bukit Menoreh. Ada dua percabangan besar di dalamnya dan mengarahkan pengunjung pada bekas tempat banyak orang di masa lalu dalam melakoni pertapaan.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(97, 'Pantai Ngrumput', 'pantai', 4.6, 1437, 10000, 10000, -8.1403829, 110.5831238, 'Pantai Ngrumput memang kalah pamor dengan Parangtritis. Namun, urusan eksotisme, pantai yang terletak di Gunung Kidul itu tak bisa disepelekan begitu saja. Karena belum begitu dikenal oleh masyarakat, pantai ini seolah belum terjamah. Sehingga keindahan alamnya masih alami dan juga bersih karena terhindar dari sampah. Selain itu wisatawan yang datang kemari bisa merasakan memiliki pantai pribadi karena masih sepi pengunjung. Eksotisme pertama dari Pantai Ngrumput di mata para wisatawan adalah tepi pantainya. Seperti halnya Pantai Gunung Kidul lainnya yang terkenal dengan pasir putihnya, demikian juga dengan pantai ini. Istimewanya, banyak wisatawan tak ingin beranjak dari pasir tersebut hingga memilih untuk bermalam. Biasanya kegiatan camping itu selalu identik dengan mendaki gunung. Kali ini, tanpa perlu mendaki wisatawan dapat merasakan sensasi bermalam di bawah sinar rembulan. Kegiatan ini yang membuat Pantai Ngrumput ini makin popular di mata wisatawan.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(98, 'Pantai Ngedan', 'pantai', 4.4, 1382, 5000, 5000, -8.1163418, 110.4963362, 'Pantai Ngeden atau Ngedan yang terletak di Desa Krambil Sawit. Tersembunyi di balik bukit karang, pantai cantik ini memberikan kesan eksklusif bagi pengunjungnya. Terletak agak terpencil, Pantai Ngeden menyimpan keindahan alam yang masih terjaga. Berkunjung kemari memang tidak terlalu mudah karena akses jalannya yang belum maksimal. Akan tetapi, hijaunya perbukitan serta birunya laut akan memanjakan wisatawan begitu tiba di lokasi.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(99, 'Pantai Slili', 'pantai', 4.5, 1343, 10000, 10000, -8.1449664, 110.6028766, 'Pantai Slili merupakan pantai kecil bagian selatan Kecamatan Tepus, Kabupaten Gunungkidul. Lokasinya tepat berada di antara Pantai Krakal dan Pantai Sadranan. Ketiganya hanya dipisahkan oleh bukit karang yang bisa dijelajahi. Salah satu yang populer dari Pantai Slili adalah posisinya. Slili diapit oleh dua bukit yang berbatasan langsung dengan pantai yang jauh lebih luas. Kedua bukit ini membuat area pantai menyerupai teluk berukuran mini. Pantai Slili dikenal memiliki spot-spot cantik untuk snorkeling. Begitu juga dengan Pantai Slili yang menjadi ‘tetangga’-nya. Lantai karangnya merupakan habitat yang baik untuk biota laut. Ada penyewaan alat snorkeling serta jasa instruktur snorkeling yang bisa dicoba jika berkunjung kemari.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(100, 'Camera House Borobudur', 'museum', 4.1, 1304, 15000, 15000, -7.6244995, 110.2027713, 'Camera House Borobudur ini rumah yang dibentuk menyerupai kamera DSLR berukuran raksasa. Rumah Kamera ini adalah museum yang menampilkan hasil lukisan Pak Tanggol dan terdapat studio foto yang unik serta menarik. Kamu dapat melihat lukisan-lukisan yang indah yang terdapat di Camera House Borobudur ini.', 'borobudur.jpeg', '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(101, 'Candi Kalasan', 'budaya dan sejarah', 4.5, 1291, 5000, 5000, -7.767284, 110.4723505, 'Candi Kalasan adalah candi yang dipersembahkan untuk Dewi Tara yang dinding luarnya dilapisi semen kuno. Candi Budha tertua di Yogyakarta ini dibangun oleh Rakai Panangkaran, raja dari dinasti Syailendra yang juga mengkonsep pendirian Borobudur.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(102, 'Watu Goyang', 'alam', 4.4, 1282, 7000, 7000, -7.9274086, 110.4120586, 'Lantaran lokasi wisata berada di dataran tinggi tak terhalang apa pun, membuat wisatawan mudah menikmati keindahan Kota Jogja, dari atas bukit pula terlihat makam-makam para raja loh. Pemandangan alam hijau serta kegagahan gunung Merapi terlihat mempesona. Lanskap seperti itulah sangat cocok mengobati rasa penat maupun bosan setelah sobat dibuat sibuk oleh rutinitas sehari-hari.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(103, 'Pintoe Langit Dahromo', 'buatan', 4.4, 1266, 5000, 5000, -7.913608, 110.437783, 'Pintu Langit Dahromo ini menyediakan berbagai spot selfie yang hitz dan instagramable dengan latar belakang panorama keindahan sebagian Kota Jogja yang istimewa. Adapun berbagai spot foto tersebut seperti spot foto rumah dengan bunga-bunga disekitarnya, pintu langit, gardu pandang yang berbentuk love, dan ada juga sayap capung.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(104, 'Wana Tirta Mangrove Forests', 'agrowisata', 4.1, 1212, 3000, 3000, -7.8933459, 110.0198257, 'Wana Tirta Mangrove merupakan salah satu tujuan baru terfavorit wisatawan di Yogyakarta atau lebih tepatnya di Pasirmendit, Kulon Progo. Awalnya, tempat wisata ini dibangun untuk melestarikan alam, namun kemudian banyak pengunjung yang menikmati hutan mangrove ini sebagai wisatawan. Untuk spot foto, ada jembatan Siapi-api atau jembatan bambu, ayunan, gazebo dan spot lainnya yang di hiasi dengan ornamen bunga. Selain menikmati pemandangan mangrove, pengunjung dapat menikmati tur dengan perahu disekitar area mangrove dan bermain canoe, seluruhnya tersedia dengan tambahan biaya dan dilengkapi dengan perlengkapan keamanan.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(105, 'Museum Sandi', 'budaya dan sejarah', 4.7, 1182, 10000, 10000, -7.7845549, 110.3711548, 'Museum Sandi adalah museum satu-satunya yang menyimpan alat-alat untuk mengirim pesan rahasia. Museum ini juga merekam segala jenis persandian di Indonesia bahkan dunia, jadi jika anda yang suka memecahkan sandi maka museum ini adalah tempat yang cocok untuk anda kunjungi. Setiba anda di loby museum sandi akan disambut hangat oleh pengelola museum sandi, orang-orangnya ramah, baik dan legowo banget. Pada masa itu museum sandi ini adalah museum yang mengoleksi segala jenis benda dan alat untuk memecahkan sandi mulai dari telegraf, buku kode sandi sampai mesin-mesin sandi yang terbuat di Indonesia maupun luar negeri.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(106, 'Bukit Teletubbies', 'alam', 4.1, 1173, 2000, 2000, -7.8181275, 110.511764, 'Wisata satu ini merupakan wisata yang lokasinya berada di pedesaan. Bukit satu ini tepatnya berada di Desa Sumberharjo, Prambanan, Kabupaten Sleman. Meski berada di pedesaan, Bukit Teletubbies Jogja ini juga sama dengan wisata lain yang memiliki ciri khas dan keunikan tersendiri. Pemandangan yang ditawarkan kawasan perbukitan ini cukup enak dipandang. Plus, kamu juga mendapatkan foto bagus dengan latar belakang perbukitan yang hijau. Bukit ini diberi nama Teletubbies karena adanya gardu panjang yang lokasinya berada di atas. Gardu ini kebetulan lokasinya berada di di timur rumah Domes. Rumah di dekat gardu ini bentuknya setengah bulat dan mirip rumah di serial Teletubbies. Sehingga, rumah itu disebut rumah Teletubbies', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(107, 'Pantai Watulawang', 'alam', 4.6, 1166, 5000, 5000, -8.1535837, 110.6177335, 'Seperti halnya pantai-pantai lain di Gunung Kidul pantai ini banyak terdapat karang dan ombak yang besar, namun yang menjadikannya unik, terdapat karang yang cukup besar dan bisa digunakan untuk memandang ke arah lautan, warga sekitar atau pengelola membuat jembatan yang terbuat dari bambu yang digunakan untuk menyeberang ke karang agar pengunjung dapat menuju ke atas karang dengan aman. Suasana pantai ini masih tergolong sepi, dan banyak terdapat karang-karang besar di bibir pantai, bisa anda gunakan untuk foto-foto dengan teman, pacar, atau keluarga. Pasir pantai termasuk luas dengan warna putih kecokelatan, khas pasir pantai selatan jogja. Bersebalahan langsung dengan goa watulawang.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(108, 'Ngobaran Beach', 'alam', 4.6, 1160, 5000, 5000, -8.1184844, 110.5028785, 'Nama Pantai Ngobaran yang unik ini tentu tak lepas dari cerita masalalu.Kisahnya berawal dari Kerajaan Majapahit dan Kerajaan Demak.Sekitar tahun 2003 lalu, bangunan berupa gapura dan patung-patung simbol agama Hindu dan Budha didirikan. Tujuannya untuk menghormati kedatangan keturunan Raja Brawijaya V di pantai tersebut. Tak hanya gapura, prasasti dan beberapa arca saja, tapi Anda juga akan menemukan bangunan Joglo dengan aliran Kejawen.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(109, 'Candi Banyunibo', 'budaya dan sejarah', 4.5, 1151, 5000, 5000, -7.7779014, 110.4940734, 'Candi Banyunibo adalah candi Buddha yang berada tidak jauh dari Candi Ratu Boko, yaitu di bagian sebelah timur dari Kota Yogyakarta ke arah Kota Wonosari. Candi ini terdiri atas satu candi induk yang menghadap ke barat dan enam candi perwara yang berbentuk stupa disusun berderet, tiga candi perwara di sisi selatan dan tiga candi perwara di sisi timur candi induk. Lokasinya yang dikelilingi oleh persawahan menjadikan candi Banyunibo sebagai salah satu alternatif tempat wisata yang wajib dikunjungi. Karena selain udara di sekitar candi yang masih alami, pengunjung juga bisa mempelajari tentang kekayaan keyakinan manusia Indonesia di masa lampau.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(110, 'Pantai Nglolang', 'pantai', 4.3, 1123, 10000, 10000, -8.1360048, 110.562855, 'Pantai ini sangat indah dengan pasir putih dan ombak yang bergulung-gulung dan menghempas karang ini masih terbilang sepi. Dan mengunjungi pantai yang masih sepi ini pastinya obat yang sangat manjur untuk menghilangkan kejenuhan. Setelah sehari-hari berkutat dengan kesibukan, deburan ombak yang menggulung-gulung dan menghempas karang, dan pemandangan cakrawala jauh di depan menjadi obat penetral suasana hati yang ampuh. Apalagi pemandangan di sekitar pantai ini dipercantik dengan dua tebing yang mengapit pantai.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(111, 'Pantai Kuwaru', 'pantai', 4.1, 1109, 10000, 10000, -7.989177883, 110.2265599, 'Pantai Kuwaru terkenal dengan wisata yang terkesan santai dan murah.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(112, 'Puncak Suroloyo', 'alam', 4.4, 1105, 5000, 5000, -7.646343961, 110.1810727, 'Selain cocok untuk menyaksikan keindahan matahari terbenam, Puncak Suroloyo juga terletak di ujung hamparan Pegunungan Menoreh yang membatasi Provinsi Jawa Tengah dan Daerah Istimewa Yogyakarta, tepatnya Kabupaten Kulon Progo dengan Magelang. Berada di Puncak Suroloyo seolah sedang berada di atap benteng raksasa yang berwarna hijau. Hal itu wajar karena Pegunungan Menoreh tampak memanjang bagai benteng yang membatasi Kabupaten Magelang dengan Kulon Progo. ', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(113, 'Ramadanu flower garden', 'agrowisata', 4.2, 1087, 5000, 5000, -7.6478607, 110.2879467, 'Nama Ramadanu tediri dari dua kata, yakni Rama dan Danu. Rama digunakan karena taman ini dibuka pada bulan Ramadan, sementara Danu dari nama dusun Danurojo.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(114, 'Goa Jomblang', 'alam', 4.6, 1064, 500000, 500000, -8.027954344, 110.6382663, 'Goa Jomblang merupakan gua vertikal yang bertipe collapse doline. Gua ini terbentuk akibat proses geologi amblasnya tanah beserta vegetasi yang ada di atasnya ke dasar bumi yang terjadi ribuan tahun lalu. Runtuhan ini membentuk sinkhole atau sumuran yang dalam bahasa Jawa dikenal dengan istilah luweng. Saat ini Gua Jomblang merupakan tempat konservasi tumbuhan purba dan dikembangkan menjadi tempat wisata minat khusus yang mana dikelola oleh penduduk atau warga setempat. Untuk menuruni gua vertikal ini pihak pengelola sudah menyediakan perlengkapan lengkap sesuai standar keselamatan caving di gua vertikal. Sinar matahari yang menerobos masuk dari Luweng Grubug setinggi 90 meter membentuk satu tiang cahaya, menyinari flowstone yang indah serta kedalaman gua yang gelap gulita. Air yang menetes dari ketinggian turut mempercantik pemandangan. Tidak salah jika banyak orang terkagum-kagum datang ke sini ketika menyaksikan lukisan alam yang dikenal dengan istilah \"cahaya surga\". ', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(115, 'Candi Abang', 'budaya dan sejarah', 4.2, 1029, 10000, 10000, -7.8103728, 110.468686, 'Candi Abang memiliki bentuk seperti piramida. Dinamakan “Candi Abang” karena bangunan itu terbuat dari batu bata berwarna merah. Dari jauh candi ini tampak seperti gundukan tanah atau bukit kecil karena bagian luarnya banyak ditumbuhi rerumputan. Secara sekilas, Candi Abang tampak hanya seperti gundukan tanah di atas bukit. Bukit ini bila musim hujan akan berwarna hijau sedangkan pada musim kemarau akan terlihat gersang. Bangunan candi ini akan terlihat berwarna merah jika kondisinya benar-benar kemarau dan kering. Seperti bangunan candi pada umumnya, Candi Abang dibangun di atas bukit. Selain itu, keunikan lainnya adalah candi ini dibangun dengan batu bata merah. Hal ini berbeda dengan kebanyakan candi pada umumnya yang dibangun dengan batu andesit.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(116, 'Gunung Ireng Srumbung', 'alam', 4.5, 1028, 3000, 3000, -7.8827926, 110.4896548, 'Di Gunung Ireng Srumbung Teman Brisik bisa menemukan spot fajar terbaik tanpa harus mendaki gunung berhari-hari. Dari sini, kita juga disuguhkan pemandangan bak negeri di atas awan. Barisan kabut yang menyelimuti area puncak bukit membuat kita serasa berdiri di atas awan. Tempat ini sangat fotogenik dan tempat yang nyaman buat refreshing. Mulai dari spot rumah kecil, gazebo sampai gardu pandang membuat Teman Brisik dengan leluasa memotret momen matahari terbit dari berbagai spot yang telah disediakan. ', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(117, 'Pesona Pengklik Pantai Samas', 'alam, pantai', 4, 987, 10000, 10000, -8.003873302, 110.2703756, 'Pantai Samas merupakan salah satu pantai yang berada di deretan pantai sebelah timur Pantai Parangtritis. Lokasi Pantai Samas kurang lebih 14 km arah selatan Kota Bantul atau sekitar 35 km dari pusat Kota Yogyakarta, tepatnya di Desa Srigading, Kecamatan Sanden, Kabupaten Bantul, Yogyakarta. Pantai Samas terkenal dengan deburan ombaknya yang menggulung, angin lautnya yang kencang dan sebagai tempat persinggahan penyu-penyu langka seperti penyu sisik dan penyu hijau untuk bertelur. Selain itu, kawasan Pantai Samas juga memiliki delta-delta sungai dan danau air tawar yang membentuk telaga. Akan tetapi Pantai Samas memiliki bibir pantai ang agak curam sehingga berbahaya dan tidak disarankan untuk mandi di pantai.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(118, 'Pantai Siung', 'alam, pantai', 4.6, 967, 10000, 10000, -8.1818233, 110.6832394, 'Pantai Siung berlokasi di Gunung Kidul, Yogyakarta. Pantai ini  spesial karena lanskapnya yang dikelilingi oleh tebing-tebing tinggi. Karena keunikan itulah, pemerintah Jogja meresmikan Pantai Siung sebagai lokasi panjat tebing. Selama di Pantai Siung, kamu akan melihat banyak batu karang raksasa tersebar di sebelah barat dan timur pantai. Selain menjadi ciri khas Pantai Siung, keberadaan batu karang ternyata membawa makna bagi asal-usul nama pantai ini. Sebagai rangkuman, di pantai ini kalian dapat melakukan aktivitas panjat tebing, hammocking, berkemah, dan jalan-jalan di bukit pengilon.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(119, 'Goa Seplawan', 'alam', 4.5, 947, 8000, 8000, -7.772978, 110.1102509, 'Goa yang berada di kawasan Pegunungan Menoreh ini merupakan goa basah, alias terdapat aliran air di dalamnya. Goa tersebut tepatnya berada di Desa Donorejo, Kecamatan Kaligesing, Kabupaten Purworejo, Jawa Tengah, berbatasan langsung dengan Kulonprogo di Yogyakarta. Goa ini memiliki panjang + 700 meter dengan cabang-cabang goa sekitar 150 – 300 meter dan berdiameter 15 meter. Sehingga untuk masuk ke dalam goa, pengunjung harus menyusuri anak tangga menurun yang cukup melalahkan. Yang mana rasa lelah itu akan segera hilang begitu mulai memasuki mulut goa. Sebab dari mulut goa itu saja keindahan ukiran batu di dalam goa sudah terlihat jelas.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(120, 'Candi Sari', 'budaya dan sejarah', 4.5, 938, 2000, 2000, -7.7615576, 110.4742751, 'Candi Sari juga disebut Candi Bendah adalah candi Buddha yang berada tidak jauh dari Candi Sambi Sari, Candi Kalasan dan Candi Prambanan, yaitu di bagian sebelah timur laut dari kota Yogyakarta, dan tidak begitu jauh dari Bandara Adisucipto. Candi ini dibangun pada sekitar abad ke-8 dan ke-9 pada saat zaman Kerajaan Mataram Kuno dengan bentuk yang sangat indah. Pada bagian atas candi ini terdapat 9 buah stupa seperti yang tampak pada stupa di Candi Borobudur, dan tersusun dalam 3 deretan sejajar. Bentuk bangunan candi serta ukiran relief yang ada pada dinding candi sangat mirip dengan relief di Candi Plaosan. Beberapa ruangan bertingkat dua berada persis di bawah masing-masing stupa, dan diperkirakan dipakai untuk tempat meditasi bagi para pendeta Buddha (biksu) pada zaman dahulunya. Candi Sari pada masa lampau merupakan suatu Vihara Buddha, dan dipakai sebagai tempat belajar dan berguru bagi para biksu. Selain untuk wisata Budaya dan Sejarah, pengunjung juga dapat bersepeda. Bersepeda di candi ini tidak akan memakan banyak waktu dikarenakan candi yang berukuran kecil. Selain di sekitar candi, para pengunjung juga dapat bersepeda menyusuri candi-candi lainnya yang lokasinya berdekatan. Para pengunjung dapat bercengkarama dengan penduduk sekitar candi untuk memperkaya cerita dan budaya dengan dalam dari Candi Sari ini sendiri.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(121, 'Desa Wisata Pentingsari', 'desa wisata', 4.4, 855, 20000, 20000, -7.6430482, 110.4296004, 'Desa Wisata Pentingsari terletak di lereng Gunung Merapi, sekitar 22,5 kilometer dari pusat Kota Yogyakarta. Desa ini dikenal di mancanegara sebagai salah satu desa wisata dengan segudang penghargaan. Dusun Pentingsari berbentuk seperti semenanjung dimana sebelah barat terdapat lembah yang sangat curam yaitu kali Kuning dan sebelah selatan terdapat lebah yang berupak Goa Ledok / Ponteng dan Gondoran sebelah timur terdapat lembah yang curam yaitu Kali Pawon dan sebelah utara merupakan dataran yang dapat berhubungan langsung dengan tanah di sekeliling kelurahan Umbulharjo sampai ke pelataran gunung Merapi. Dusun Pentingsari terdiri dari dua dusun yaitu Bonorejo dan Pentingsari. Ada beberapa program wisata desa, seperti live in, kemah, trekking, atau outbound yang bisa dinikmati. Untuk kegiatan wisata budaya, wisatawan bisa mengikuti kegiatan, seperti belajar gamelan, menari, membatik, membuat wayang rumput, dan membuat janur.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(122, 'Desa Wisata Gamplong', 'desa wisata', 4.4, 841, 5000, 5000, -7.8055232, 110.2374676, 'Berada di Kabupaten Sleman, tepatnya 16 kilometer dari titik nol Yogyakarta. Tempat wisata yang sering dijuluki mini Hollywood ini menawarkan berbagai desain bangunan unik. Sangat cocok bagi wisatawan yang menyukai fotografi.', NULL, '2026-05-09 22:41:42', '2026-05-09 22:41:42'),
(123, 'Museum Perjuangan', 'budaya dan sejarah, museum', 4.5, 836, 1000, 1000, -7.8164905, 110.3718611, 'Museum Perjuangan memiliki tempat utama yang berisi peninggalan Budaya dan Sejarah. Ruangan yang pertama di taat secara rapi di luar gedung. Disana menyajikan patung kepala pahlawan nasional, relief yang menjelaskan dan bercerita bagaimana lahirnya Boedi Utomo, masa penjajahan Jepang, dan partai Sarekat Islam. Selain itu juga membahas PD dua, Kongres Pemuda kesatu, masa pindahnya Ibukota negara ke Jogja, Peristiwa 1 Maret 1949, dan pertempuran puputan di Bali.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(124, 'Geoforest Watu Payung Turunan', 'alam', 4.5, 796, 5000, 5000, -7.972955236, 110.4362646, 'Nama Watu Payung merujuk kepada sebuah batu yang bentuknya mirip dengan bentuk payung. Kata Watu dalam bahasa jawa berarti Batu. Sedangkan kata Payung, yang bermakna Payung. Keberadaan batu yang menyerupai payung tersebut di kawasan hutan konsevasi, menjadikan sebuah kunjungan wisata alam yang sangat menyenangkan. Suasana yang teduh, nuansa alam, udara yang sejuk, bernilai edukatif, adalah daya tarik dari Watu Payung Turunan.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(125, 'Pasar Kembang', 'desa wisata', 4.2, 793, 10000, 10000, -7.7899242, 110.3651209, 'Jalan Pasar Kembang merupakan gang kecil yang merupakan perkampungan penduduk. Banyak penduduk yang tinggal di kawasan ini. Mereka hidup dengan damai, dan tak sedikit yang banyak meraup rezeki karena kedatangan wisatawan. Penginapan banyak berdiri di tengah suasana perkampungan, dengan keramahan para penduduknya.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(126, 'Omah Petroek', 'buatan', 4.6, 764, 10000, 10000, -7.6219947, 110.4153359, 'Objek wisata Omah Petruk merupakan objek wisata yang cukup menarik karena mengusung tema seperti sebuah museum. Disebut sebagai omah petruk dikarenakan aka nada banyak patung menarik dan lucu di sebuah bangunan rumah yang di desain sedemikian rupa. Omah Petruk ini menjadi tempat yang sangat menyenangkan untuk dikunjungi sendiri, dengan keluarga atau berombongan. ', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(127, 'Pantai Jogan', 'pantai', 4.3, 758, 10000, 10000, -8.180135, 110.6763715, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(128, 'Taman Lampion (Taman Pelangi)', 'desa wisata, buatan', 4.3, 757, 15000, 20000, -7.7503631, 110.3698154, 'Taman lampion atau juga sering disebut taman pelangi monjali adalah salah satu wisata saat malam hari yang bisa Anda kunjungi bersama keluarga atau teman. Selain berjalan-jalan menikmati gemerlap lampu, anda juga bisa melakukan kegiatan seru lainnya seperti dengan mengendarai becak mini, bermain bola air, bugee jumping, ATV, trampolin, perahu dayung, kereta mini dan lain-lain. Asiknya lagi, area wisata Taman Lampion, juga sering diadakan live konser musik.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(129, 'Monumen Perjuangan TNI AU', 'alam', 4.5, 748, 10000, 10000, -7.8407981, 110.3764617, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(130, 'Jogja Exotarium', 'buatan', 4.4, 746, 20000, 20000, -7.728816, 110.358356, 'Di Mini Zoo Jogja Exotarium pengunjung dapat menyaksikan aneka satwa seperti reptil, hewan nocturnal, kelinci. Pengunjung dapat pula melakukan aktivitas seperti memancing, belajar berkuda atau memanah. Selain itu terdapat pula berbagai spot selfie, playground anak atau outbound. .Kehadiran Mini Zoo Jogja Exotarium yang dikemas sebagai taman wisata edukasi diharapkan menjadi wahana pengetahuan tentang satwa atau binatang.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(131, 'Museum Kereta Karaton', 'budaya dan sejarah', 4.7, 735, 10000, 10000, -7.8054476, 110.3627375, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(132, 'Watu Payung', 'alam', 4.4, 730, 10000, 10000, -7.793477, 110.520934, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(133, 'Sumur Gumuling', 'budaya dan sejarah', 4.5, 718, 10000, 10000, -7.8087911, 110.3591825, 'Sumur Gumuling adalah salah satu tempat untuk ibadah atau kegiatan agama pada masa lalu. Sumur Gumuling merupakan masjid pada zaman pemerintahan Sri Sultan Hamengkubuwana I dan II', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(134, 'Kali Talang', 'alam, buatan', 4.5, 716, 10000, 10000, -7.5802065, 110.4606903, 'Kali Talang berada di ketinggian sekitara 1.160 meter di atas permukaan laut (MDPL). Dari Kali Kalang, puncak Merapi seakan begitu dekat dengan panorama vegetasi di kawasan Taman Nasional Gunung Merapi. Objek wisata yang berada di perbatasan Jawa Tengah (Jateng) dan DIY itu menjadi salah satu spot terbaik untuk mengabadikan puncak Merapi.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(135, 'Kawasan Ekowisata Gunung Api Purba Nglanggeran', 'alam, wisata air', 4.5, 709, 30000, 30000, -7.841986, 110.5415759, 'Kawasan Ekosistem Gunung Purba Nglanggeran atau yang biasa disebut Gunung Nglanggeran ini merupakan kawasan yang litologinya disusun oleh material vulkanik tua, berbentuk gunung batu raksasa yang membentang sepanjang kurang lebih 800 meter dengan tinggi mencapai 300 meter. Gunung Nglanggeran dinyatakan sebagai gunung api purba dari hasil penelitian dan refrensi yang ada. Sekitar 60-70 juta tahun yang lalu Gunung tersebut merupakan gunung berapi aktif.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(136, 'Pantai Ngetun', 'pantai', 4.5, 709, 15000, 15000, -8.1703641, 110.6526446, 'Pantai Ngetun adalah keindahan yang sempurna dari Yogyakarta khususnya Gunung Kidul. Keindahan biota lautnya memang tidak bisa dihindarkan', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(137, 'Desa Wisata Tinalah (Dewi Tinalah - Wisata Jogja)', 'alam', 4.3, 701, 10000, 10000, -7.6955738, 110.195883, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(138, 'Selopamioro Adventure Park', 'alam, wisata air', 4.5, 696, 30000, 30000, -7.945376682, 110.4266714, 'Kegiatan outbond di lokasi Selopamioro Adventure Park sangat memanjakan para konsumen untuk menikmati alam. Fasilitas outbond berupa permainan air dan darat dari level anak anak sampai dengan dewasa bisa menjadi rekomendasi anda dan rekan kerja selanjutnya untuk mencoba outbond di Selopamioro Adventure Park.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(139, 'Goa Kebon', 'alam', 4.3, 659, 10000, 10000, -7.8870828, 110.1866704, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(140, 'EMBUNG JETIS SURUH', 'alam', 4.2, 651, 10000, 10000, -7.6745388, 110.3845035, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(141, 'Sabo Bronggang Argomulyo Cangkringan Sleman', 'alam', 4.5, 648, 10000, 10000, -7.6639874, 110.4646727, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(142, 'Bale Banjar Sangkring', 'alam', 4.6, 633, 10000, 10000, -7.8122863, 110.343125, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(143, 'Desa Wisata Nglinggo', 'alam', 4.4, 616, 10000, 10000, -7.647668, 110.141878, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(144, 'Gereja Sayidan', 'alam', 4.2, 616, 10000, 10000, -7.8035488, 110.3698419, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(145, 'Pinus pengger Yogyakarta', 'alam', 4.6, 605, 10000, 10000, -7.8712723, 110.459653, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(146, 'D\'Walik', 'museum,', 4.5, 599, 40000, 50000, -7.8163681, 110.3866164, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(147, 'Wisata Watu Amben', 'alam', 4.5, 592, 10000, 10000, -7.8498077, 110.4770954, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(148, 'Gua Cerme', 'alam', 4.4, 587, 10000, 10000, -7.9794413, 110.3803114, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(149, 'Candi Barong', 'alam', 4.6, 565, 10000, 10000, -7.7756537, 110.4973011, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(150, 'Nol Kilometer Jl.Malioboro', 'alam', 4.7, 565, 10000, 10000, -7.8013803, 110.3647652, 'Tidak ada deskripsi', 'malioboro.jpeg', '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(151, 'Mojo Gumelem Hill', 'alam', 4.3, 551, 10000, 10000, -7.9559784, 110.4341083, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(152, 'Pantai Midodaren', 'alam', 4.5, 550, 10000, 10000, -8.1255992, 110.521558, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(153, 'Pantai Seruni', 'alam', 4.5, 527, 10000, 10000, -8.159907, 110.6315752, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(154, 'Candi Gebang', 'alam', 4.5, 518, 10000, 10000, -7.7514654, 110.4162887, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(155, 'Kekayon Museum', 'alam', 4.2, 504, 10000, 10000, -7.8145939, 110.4130604, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(156, 'Museum Wayang Kekayon', 'budaya dan sejarah', 4.2, 504, 20000, 20000, -7.81406244, 110.4131033, 'Museum Wayang Kekayon ini didirikan oleh almarhum Prof. DR. dr. KPH. Soejono Prawirohadikusumo (Guru besar UGM sekaligus dokter ahli saraf jiwa) dan diresmikan oleh KGPAA Paku Alam VIII pada tahun 1991. Museum ini mengoleksi berbagai jenis wayang yang ada di Indonesia. Selain sebagai tujuan wisata seni budaya, museum ini juga memiliki fungsi pendidikan, wahana penelitian, dan rekreasi. Wayang merupakan kekayaan luhur budaya bangsa Indonesia yan Museum ini juga nyaman dan asri dengan taman parkir luas serta pendapa megah untuk perayaan pernikahan, pameran, pertemuan, sarasehan, dan lain-lain.g patut kita banggakan. Terbukti atas pengakuan UNESCO atas wayang sebagai warisan pusaka dunia.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(157, 'Waterbyur Taman Air', 'alam', 4.2, 501, 10000, 10000, -7.8814715, 110.3394116, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(158, 'Batu Papal', 'alam', 4.2, 497, 10000, 10000, -7.789479, 110.5185664, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(159, 'Museum TNI AD Dharma Wiratama', 'alam', 4.7, 483, 10000, 10000, -7.7823778, 110.3754172, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(160, 'Museum of Indonesian Education', 'alam', 4.6, 480, 10000, 10000, -7.774829, 110.387176, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(161, 'Tebing Gunung Gajah', 'alam', 4.5, 457, 5000, 5000, -7.776247027, 110.1061368, 'Letaknya di dataran tinggi, dengan view pemandangan perbukitan dan menoreh yang hijau, dan terdapat Waduk Sermo di tengahnya. Selain spot fotonya kemudian juga terdapat spot foto love lock, sky bar, dan fancy termasuk wahana outbound selain dari beberapa spot fotografi dengan tema tertentu.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(162, 'Kalikuning Park', 'alam', 4.4, 443, 10000, 10000, -7.5923466, 110.4414633, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43');
INSERT INTO `wisatas` (`id`, `nama`, `kategori`, `rating`, `total_review`, `harga_weekday`, `harga_weekend`, `latitude`, `longitude`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(163, 'Bukit Pengilon', 'alam', 4.6, 439, 5000, 5000, -8.185458711, 110.6917217, 'Nama bukit Pengilon berasal dari bahasa Jawa yang berarti cermin, karena di bukit ini terdapat batu yang mirip sekali dengan cermin. Areanya menyejukkan serta sangat luas. Bahkan saking luasnya destinasi ini, banyak wisatawan yang melakukan tracking hingga camping dan mendirikan tenda di sana. Tak hanya itu, tempat satu ini juga akan memanjakan mata anda. Anda bisa mengabadikan foto dengan pemandangan indah yang berlatar belakang laut.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(164, 'Punthuk Mongkrong', 'alam', 4.4, 426, 10000, 10000, -7.6345, 110.174606, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(165, 'LEGAWONG', 'alam', 4.4, 423, 10000, 10000, -7.8235991, 110.3928814, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(166, 'Gunung Mungker', 'alam', 4.3, 416, 10000, 10000, -7.8758728, 110.4578762, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(167, 'Wisata Alam Watu Lawang', 'alam', 4.2, 413, 10000, 10000, -7.9378555, 110.4181981, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(168, 'Kedung Pengilon', 'alam', 4, 412, 10000, 10000, -7.8560863, 110.288863, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(169, 'Lembah Bendo Camping Ground and Outdoor Activity', 'alam', 4.3, 401, 10000, 10000, -7.6138414, 110.4312632, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(170, 'Congot Beach', 'alam', 4.3, 400, 10000, 10000, -7.9075425, 110.0535658, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(171, 'Taman Wana Winulang', 'alam', 4, 396, 10000, 10000, -7.856079, 110.166051, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(172, 'Museum of Biology UGM', 'alam', 4.4, 389, 10000, 10000, -7.8017655, 110.3744009, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(173, 'Tamansari Keraton', 'alam', 4.6, 386, 10000, 10000, -7.8102151, 110.358903, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(174, 'Trisik Beach', 'alam', 3.9, 383, 10000, 10000, -7.9673349, 110.182607, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(175, 'Gardu Pandang Merapi', 'alam', 4.3, 377, 10000, 10000, -7.5926693, 110.4250243, 'Tidak ada deskripsi', 'merapi.jpeg', '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(176, 'Tamansari Water Castle', 'alam', 4.6, 359, 10000, 10000, -7.8100369, 110.3591915, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(177, 'Gunung Gamping', 'alam', 4.3, 350, 10000, 10000, -7.8046696, 110.3196567, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(178, 'Puncak Kleco Desa Wisata Tinalah', 'alam', 4.5, 337, 10000, 10000, -7.7125459, 110.2045109, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(179, 'Pantai Butuh', 'alam', 4.4, 334, 10000, 10000, -8.1117719, 110.4855447, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(180, 'Stonehenge Yogyakarta', 'alam', 4.4, 332, 10000, 10000, -7.6024289, 110.4480035, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(181, 'Snack Wonderland', 'alam', 4.1, 327, 10000, 10000, -7.7721185, 110.4311704, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(182, 'Wisata Alam Jurug Gedhe', 'alam', 4, 305, 10000, 10000, -7.8240577, 110.5367479, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(183, 'History Of Java Museum (HOJM)', 'alam', 4.5, 304, 10000, 10000, -7.8439029, 110.362261, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(184, 'Village Tourism New Nglepen', 'alam', 4, 301, 10000, 10000, -7.8137377, 110.5034501, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(185, 'puncak bucu', 'alam', 4.1, 299, 10000, 10000, -7.8618548, 110.4430834, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(186, 'Museum Sri Sultan Hamengkubuwono IX', 'alam', 4.7, 298, 10000, 10000, -7.8083193, 110.3644395, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(187, 'Taman Kota Wates', 'alam', 4.5, 296, 10000, 10000, -7.8584717, 110.1600975, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(188, 'Sasana wiratama', 'alam', 4.3, 294, 10000, 10000, -7.7871244, 110.3514031, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(189, 'Taman Tempuran Cikal', 'alam, wisata air', 4.4, 294, 10000, 10000, -7.840562331, 110.4494549, 'Taman Tempuran Cikal terletak di kecamatan Piyungan. Di taman ini, para pengunjung bisa mencoba bermain dengan beberapa wahana yang ada sembari menikmati kesejukan alam. Taman Tempuran Cikal atau biasa disebut TTC terletak di Dusun Cikal, Desa Srimulyo, Kecamatan Piyungan, Kabupaten Bantul. Kata Tempuran ini diambil dari pertemuan antara dua sungai, yaitu sungai gawe dan sungai opak. Taman tempuran ini telah menjadi salah satu obyek wisata baru di daerah Piyungan dan telah dilengkapi dengan beberapa fasilitas seperti wahana speed boat, kapal, kano, ATV, mini trail, flying fox, outbound, taman bermain, gazebo, tempat parkir yang luas, dan toilet. Ditaman ini, pengunjung juga bisa menikmati macam-macam kuliner yang', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(190, 'Sukunan Tourism Village', 'alam', 4.4, 290, 10000, 10000, -7.7836412, 110.3364013, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(191, 'Bukit Tompak', 'alam', 4.5, 277, 10000, 10000, -7.844259, 110.4557031, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(192, 'Taman Glugut', 'alam', 4, 274, 10000, 10000, -7.8777976, 110.3939277, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(193, 'Taman Nggirli', 'alam', 4.3, 270, 10000, 10000, -7.8403441, 110.4537568, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(194, 'Candi Bubrah', 'alam', 4.3, 261, 10000, 10000, -7.7465277, 110.4929268, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(195, 'Plengkung Wijilan', 'alam', 4.6, 261, 10000, 10000, -7.8038148, 110.3666102, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(196, 'Candi Kedulan', 'alam', 4.5, 260, 10000, 10000, -7.742562, 110.4696979, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(197, 'Museum Satwa Gembira Loka Zoo', 'buatan', 4.4, 258, 10000, 10000, -7.8053239, 110.3980306, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(198, 'Canting Mas Puncak Dipowono', 'alam', 4.4, 248, 10000, 10000, -7.80032, 110.128122, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(199, 'Taman Air Menari', 'alam', 4.3, 245, 10000, 10000, -7.80094, 110.367805, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(200, 'Curug Banyunibo', 'alam', 4.1, 243, 10000, 10000, -7.8675423, 110.2867568, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(201, 'Tourism Village East Kaliurang', 'alam', 4.4, 238, 10000, 10000, -7.5965373, 110.4312039, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(202, 'Karangtengah Tourism Village', 'alam', 4.3, 236, 10000, 10000, -7.9376732, 110.3819417, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(203, 'Candi Kimpulan', 'alam', 4.7, 233, 10000, 10000, -7.6883712, 110.4153399, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(204, 'Dewi Kano Tourism Village Kaligono', 'alam', 4.4, 233, 10000, 10000, -7.7348214, 110.0803636, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(205, 'ARTJOG MMXIX', 'alam', 4.7, 223, 10000, 10000, -7.7996687, 110.3533668, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(206, 'Kedung Tolok', 'alam', 4.3, 223, 10000, 10000, -7.9632346, 110.3838152, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(207, 'Gua Jepang', 'alam', 4.1, 222, 10000, 10000, -7.5879932, 110.4305322, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(208, 'Desa Wisata Wanurejo', 'alam', 4.4, 221, 10000, 10000, -7.6117993, 110.2179225, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(209, 'Cane Gardens Gendhu', 'alam', 4.4, 219, 10000, 10000, -7.7435927, 110.1478405, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(210, 'Candi Donotirto', 'alam', 4.4, 213, 10000, 10000, -7.7955613, 110.3612095, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(211, 'Candi Lumbung', 'alam', 4.4, 213, 10000, 10000, -7.7481336, 110.492962, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(212, 'Pantai Somandeng', 'alam', 4.5, 213, 10000, 10000, -8.1490954, 110.6101161, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(213, 'Series Mahogany Village Nampurejo', 'alam', 4.4, 213, 10000, 10000, -7.86489, 109.9833922, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(214, 'Pantai Nampu', 'alam', 4.6, 211, 10000, 10000, -8.1837872, 110.7073455, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(215, 'Candi Indah', 'alam', 4.2, 205, 10000, 10000, -7.7447651, 110.4171248, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(216, 'Taman Tino Sidin', 'alam', 4.7, 204, 10000, 10000, -7.7995125, 110.3449674, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(217, 'Stasiun Kereta Api Bantul', 'alam', 4.4, 199, 10000, 10000, -7.887327, 110.329554, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(218, 'Gardu Pandang Mangol Kencana', 'alam', 4.2, 196, 10000, 10000, -7.8378573, 110.4890534, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(219, 'Wisata Candi Kembar', 'alam', 4.5, 189, 10000, 10000, -7.7401262, 110.50544, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(220, 'Pantai Pasir Puncu', 'alam', 4, 188, 10000, 10000, -7.8540573, 109.9130624, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(221, 'Randu Ijo', 'alam', 4.2, 187, 10000, 10000, -7.5657834, 110.3686916, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(222, 'Bahasa Kopi', 'alam', 4.6, 183, 10000, 10000, -7.7344993, 110.3897969, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(223, 'Cemeti - Institute for Art and Society', 'alam', 4.6, 182, 10000, 10000, -7.8177918, 110.3623492, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(224, 'Restoe Boemi Kreo', 'alam', 4.5, 176, 10000, 10000, -7.723671547, 110.231514, 'Restoe Boemi Kreo sebuah rumah makan hasil karya NextDestinXction untuk masyarakat kreo', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(225, 'Tourism Village Kinahrejo', 'alam', 4.4, 176, 10000, 10000, -7.5816346, 110.4434317, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(226, 'TWM ( Tebing Watu Mabur )', 'alam', 4.4, 172, 10000, 10000, -7.9456084, 110.4406992, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(227, 'Tempat Wisata Mangir', 'alam', 4.4, 171, 10000, 10000, -7.9001751, 110.2752732, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(228, 'Gabugan Tourism Village', 'alam', 4.4, 164, 10000, 10000, -7.6609669, 110.3797272, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(229, 'Pangurakan Gate', 'alam', 4.6, 163, 10000, 10000, -7.8015969, 110.3646114, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(230, 'Candi Ijo', 'budaya dan sejarah', 4.7, 159, 5000, 10000, -7.783381475, 110.5104366, 'Candi Ijo adalah sebuah kompleks percandian bercorak Hindu, berada 4 kilometer arah tenggara dari Candi Ratu Boko atau kira-kira 18 kilometer di sebelah timur kota Yogyakarta. Candi ini diperkirakan dibangun antara kurun abad ke-10 sampai dengan ke-11 Masehi pada saat zaman Kerajaan Medang periode Mataram.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(231, 'Wanagama 1000 Selfie (WG1000S)', 'alam', 4.5, 157, 10000, 10000, -7.8928168, 110.5472087, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(232, 'Hutan Cemara Sembung', 'alam', 4.2, 156, 10000, 10000, -7.8306883, 110.2897089, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(233, 'Pakem Sari Water Park', 'alam', 3.7, 154, 10000, 10000, -7.661928, 110.413932, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(234, 'Dodogan Cultural Tourism', 'alam', 4.2, 153, 10000, 10000, -7.926687, 110.4825668, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(235, 'Tourism Village Mina Padi Cibuk Kidul', 'alam', 4.2, 147, 10000, 10000, -7.7555134, 110.3099247, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(236, 'Ecotourism Jatisari Seropan 3', 'alam', 4.3, 145, 10000, 10000, -7.9436686, 110.4440412, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(237, 'Eco Park Sriharjo', 'alam', 4.5, 142, 10000, 10000, -7.9449846, 110.4175478, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(238, 'Goa Sentono', 'alam', 4.1, 140, 10000, 10000, -7.8129534, 110.4715037, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(239, 'Desa Wisata Sendari', 'alam', 4.3, 136, 10000, 10000, -7.7375229, 110.325111, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(240, 'Terasiring Sriharjo', 'alam', 4.6, 136, 10000, 10000, -7.9448403, 110.4180764, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(241, 'Candi Gana', 'alam', 4.1, 133, 10000, 10000, -7.7439064, 110.4961559, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(242, 'Kampoeng Cyber Yogyakarta', 'alam', 4.4, 133, 10000, 10000, -7.809384, 110.3585784, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(243, 'Desa Wisata Pengkok', 'alam', 4.3, 131, 10000, 10000, -7.8729739, 110.4957781, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(244, 'Bangsal Magangan', 'alam', 4.7, 129, 10000, 10000, -7.8087595, 110.3637221, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(245, 'Watu Tekek', 'alam', 4.1, 129, 10000, 10000, -7.6643486, 110.2081121, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(246, 'Jetis Monument', 'alam', 4.2, 128, 10000, 10000, -7.8273402, 110.3253528, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(247, 'Tourism Village Display', 'alam', 4.3, 128, 10000, 10000, -7.71528, 110.3655598, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(248, 'Jipangan Tourism Village', 'alam', 4.4, 127, 10000, 10000, -7.8548212, 110.3277628, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(249, 'Pantai Bukit Indah Nampu', 'alam', 4.4, 125, 10000, 10000, -8.1840158, 110.7081369, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(250, 'Candi Siwa', 'alam', 4.5, 121, 10000, 10000, -7.7520327, 110.4912079, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(251, 'Geger Menjangan', 'alam', 4.1, 121, 10000, 10000, -7.6993041, 110.0306903, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(252, 'Pantai Segoro Kidul', 'alam', 4.3, 120, 10000, 10000, -7.996434, 110.2414412, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(253, 'Museum dan Tanah Liat', 'alam', 4.6, 116, 10000, 10000, -7.8200451, 110.3394857, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(254, 'Tugu Jam', 'alam', 4.5, 116, 10000, 10000, -7.8064821, 110.3630733, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(255, 'Pantai Ngrawah', 'alam', 4.5, 114, 10000, 10000, -8.1250824, 110.5202032, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(256, 'Tourism Village Mlangi', 'alam', 4.7, 114, 10000, 10000, -7.7622125, 110.3313254, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(257, 'Between Two Gates', 'alam', 4.6, 108, 10000, 10000, -7.8309782, 110.3992208, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(258, 'Nanggulan Rice Terrace, Watumurah, Pendowoharjo', 'alam', 4.3, 108, 10000, 10000, -7.7479509, 110.1903153, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(259, 'Museum Sonobudoyo Unit II', 'alam', 4.7, 107, 10000, 10000, -7.8040124, 110.366348, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(260, 'Sonobudoyo State Museum Unit II', 'alam', 4.7, 107, 10000, 10000, -7.8040124, 110.366348, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(261, 'Brahma Temple', 'alam', 4.5, 103, 10000, 10000, -7.7523837, 110.4912216, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(262, 'Tradisional Park', 'alam', 4.3, 102, 10000, 10000, -7.6286063, 110.4252096, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(263, 'Air Terjun Banyu Nibo', 'alam', 4.3, 99, 10000, 10000, -7.9033828, 110.4572075, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(264, 'Obelix Hills Sunset View', 'alam', 4.6, 99, 10000, 10000, -7.8070316, 110.5215714, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(265, 'Goa Jepang Pengklik', 'alam', 4.4, 96, 10000, 10000, -7.8037677, 110.4779306, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(266, 'Pantai Ngluwen', 'alam', 4.5, 96, 10000, 10000, -8.1140054, 110.4898614, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(267, 'Desa Wisata Malangan', 'alam', 4.4, 95, 10000, 10000, -7.7586856, 110.2533026, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(268, 'pantai Trisik', 'alam', 3.9, 94, 10000, 10000, -7.9673349, 110.182607, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(269, 'Karangnongko Temple', 'alam', 4.1, 93, 10000, 10000, -7.6771502, 110.5569914, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(270, 'Watu Kendhil', 'alam', 4.3, 93, 10000, 10000, -7.6353212, 110.2147341, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(271, 'Gazebo Fakultas Pertanian UGM', 'alam', 4.5, 91, 10000, 10000, -7.7682109, 110.3813503, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(272, 'Dewi Rawe', 'alam', 4.5, 89, 10000, 10000, -7.7514803, 110.3352759, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(273, 'Embung KP', 'alam', 4.3, 87, 10000, 10000, -7.6588773, 110.235082, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(274, 'Geopark Gunung Sewu', 'alam', 4.4, 85, 10000, 10000, -7.8475299, 110.4795506, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(275, 'Goa Payaman', 'alam', 4.2, 84, 10000, 10000, -7.8346264, 110.258599, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(276, 'Pantai Watunene', 'alam', 4.6, 84, 10000, 10000, -8.1594636, 110.6292219, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(277, 'Desa Wisata Nawung', 'alam', 4.3, 81, 10000, 10000, -7.8202819, 110.5425329, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(278, 'Kadisoka Temple', 'alam', 3.8, 81, 10000, 10000, -7.7553303, 110.4459721, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(279, 'Kampung Wisata Tanen | KAWITAN', 'alam', 4.4, 80, 10000, 10000, -7.6270688, 110.4201728, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(280, 'MANGGALIA INDAH', 'alam', 3.9, 80, 10000, 10000, -7.5915194, 110.5074483, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(281, 'Desa Wisata Batur', 'alam', 4.4, 79, 10000, 10000, -7.8597347, 110.5498557, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(282, 'Museum Rs Mata Dr Yap', 'alam', 4.5, 79, 10000, 10000, -7.780141, 110.3741398, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(283, 'Government Tourist Information Center', 'alam', 4.6, 77, 10000, 10000, -7.7953215, 110.3657371, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(284, 'Museum Geoteknologi Mineral', 'alam', 4.5, 72, 10000, 10000, -7.7816997, 110.4146097, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(285, 'Unit Office Taman Wisata Candi Prambanan', 'alam', 4.6, 72, 10000, 10000, -7.7541053, 110.4928588, 'Tidak ada deskripsi', 'prambanan.jpeg', '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(286, 'Perwara Temple', 'alam', 4.4, 70, 10000, 10000, -7.7516703, 110.4921881, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(287, 'Tourism Village Srowolan', 'alam', 4.3, 70, 10000, 10000, -7.6663773, 110.3858213, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(288, 'Candi Morangan', 'alam', 4.3, 68, 10000, 10000, -7.6848173, 110.4694913, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(289, 'Tourism Village Bokesan', 'alam', 4.4, 68, 10000, 10000, -7.706782, 110.4742429, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(290, 'Lava Tour Merapi', 'alam', 4.8, 67, 10000, 10000, -7.7531441, 110.3473714, 'Tidak ada deskripsi', 'merapi.jpeg', '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(291, 'Tuk Si Bedug', 'alam', 4.5, 67, 10000, 10000, -7.7343858, 110.3004508, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(292, 'Pantai Baru', 'alam', 4.3, 66, 10000, 10000, -8.1338843, 110.5510278, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(293, 'WISATA DESA WATU LEDHEK', 'alam', 4.3, 61, 10000, 10000, -7.7162707, 110.3898193, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(294, 'Wisata Alam Pos Mati', 'alam', 4.3, 57, 10000, 10000, -7.6264157, 110.1789032, 'Wisata yang menyajikan pemandangan menarik dari atas bukit', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(295, 'Morangan Temple', 'alam', 4.1, 55, 10000, 10000, -7.6848728, 110.4695674, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(296, 'Sekretariat Sementara Museum Anak Kolong Tangga', 'alam', 4.4, 55, 10000, 10000, -7.8187216, 110.3646999, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(297, 'Taman wisata merapi garden Cangkringan', 'alam', 4.5, 53, 10000, 10000, -7.58728, 110.442803, 'Tidak ada deskripsi', 'merapi.jpeg', '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(298, 'Mesjid Ldii Kelompok Candi', 'alam', 4.6, 51, 10000, 10000, -7.6995786, 110.4132218, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(299, 'Kalinampu Natural Park', 'alam', 4.2, 49, 10000, 10000, -7.968594, 110.3473611, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(300, 'Brug Londho River Track', 'alam', 3.9, 48, 10000, 10000, -7.7064216, 110.4195737, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(301, 'Monument obelisk 1 Century of Muhammadiyah', 'alam', 4.4, 48, 10000, 10000, -7.8131132, 110.3221465, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(302, 'OMAH ELABU', 'alam', 4.3, 48, 10000, 10000, -7.8499751, 110.4795727, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(303, 'Watu Loncat', 'alam', 4.5, 46, 10000, 10000, -7.8763184, 110.4524533, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(304, 'Watu Loncat', 'alam', 4.5, 46, 10000, 10000, -7.8763184, 110.4524533, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(305, 'Pantai Imorenggo', 'alam', 4.4, 45, 10000, 10000, -7.9658312, 110.1824816, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(306, 'Sungai Oya', 'alam', 4.7, 45, 10000, 10000, -7.9539315, 110.4246111, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(307, 'Tourism Village Pandeyan', 'alam', 4.6, 44, 10000, 10000, -7.814481, 110.386165, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(308, 'Wisata Taman Kelinci Borobudur', 'alam', 4.8, 44, 10000, 10000, -7.6223711, 110.2216511, 'Tidak ada deskripsi', 'borobudur.jpeg', '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(309, 'JOGJA TREVELING', 'alam', 4.9, 43, 10000, 10000, -7.7654126, 110.3422458, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(310, 'Spot Pintoe Langit Dahromo', 'alam', 4.6, 43, 10000, 10000, -7.9121203, 110.4365253, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(311, 'TeknoPark Mega Andalan', 'alam', 4.5, 43, 10000, 10000, -7.803753, 110.4830177, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(312, 'Tourism Village Duchy', 'alam', 4.4, 43, 10000, 10000, -7.806093, 110.35831, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(313, 'Sukmojoyo Hill', 'alam', 4.6, 42, 10000, 10000, -7.6301034, 110.1752282, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(314, 'Patung Monyet Kaliurang', 'alam', 4.3, 41, 10000, 10000, -7.5999674, 110.4294736, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(315, 'KAWIDASRI', 'alam', 4.4, 40, 10000, 10000, -7.6372592, 110.3891213, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(316, 'Nglangkap Beach', 'alam', 4.3, 39, 10000, 10000, -8.1107366, 110.479256, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(317, 'Taman Wisata Candi Sojiwan', 'alam', 4.5, 38, 10000, 10000, -7.7604197, 110.4955436, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(318, 'Candi Wisnu', 'alam', 4.5, 37, 10000, 10000, -7.751692, 110.4912105, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(319, 'Kampung Wisata Sosromenduran', 'alam', 4, 36, 10000, 10000, -7.79219, 110.362151, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(320, 'Guide Francophone et Chauffeur de Voiture Privé de Voyage Yogyakarta Java Indonésie', 'alam', 5, 34, 10000, 10000, -7.8206473, 110.3773068, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(321, 'Pantai Botorubuh', 'alam', 4.6, 34, 10000, 10000, -8.2003473, 110.7082335, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(322, 'Candi Dawangsari', 'alam', 4.3, 33, 10000, 10000, -7.7743486, 110.4973873, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(323, 'Ijo Temple Wooden Mosque', 'alam', 4.4, 33, 0, 0, -7.7847528, 110.5128442, 'Pasoedjoedan Al Liwung atau yang dikenal dengan Masjid Candi Ijod merupakan masjid yang didirikan tidak jauh dari candi ijo. Dimana kita ketahui, Candi ijo merupakan candi tertinggi di Yogyakarta. Masjid ini berciri khas bangunan tradisional modern, dengan sentuhan ornamen kayu jati. Masjid ini didesain sedemikian rupa, sehingga pengunjung khusus nya yg ingin beribadah merasakan kenyaman alamiah. Dari masjid ini juga bisa dilihat pemandangan hamparan kota Yogyakarta dan khususnya bandara adi sucipto. Bangunan masjid yg didesain terbuka menjadikan seolah beribadah menyatu dgn alam.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(324, 'Gua Permoni', 'alam', 4.3, 32, 10000, 10000, -7.8796951, 110.3965111, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(325, 'Kampung Wisata Rejowinangun', 'alam', 4.3, 31, 10000, 10000, -7.8152776, 110.3988359, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(326, 'Tawangrejo Agro Tourism', 'alam', 4.4, 31, 10000, 10000, -7.6354887, 110.4032545, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(327, 'Bukit Gunung Kidul Pantai Indrayanti', 'alam', 4.7, 30, 10000, 10000, -8.1501214, 110.6121077, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(328, 'Pemancingan Sungkono', 'alam', 3.6, 30, 10000, 10000, -7.9436745, 110.2288385, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(329, 'Gantangan Lomba Burung New POSJAKAL', 'alam', 4.7, 27, 10000, 10000, -7.7459912, 110.3916566, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(330, 'Kids Fun - Blaster Boat', 'alam', 4.2, 27, 10000, 10000, -7.8285087, 110.4400289, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(331, 'Kids Fun - Arung Jeram', 'alam', 4.4, 26, 10000, 10000, -7.8285622, 110.4412651, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(332, 'THR Gabusan Square', 'alam', 3.8, 26, 10000, 10000, -7.8773087, 110.3520114, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(333, 'Gedung Jefferson', 'alam', 4.2, 25, 10000, 10000, -7.7832145, 110.3658164, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(334, 'Taman Lampion Candi Plaosan', 'alam', 4.4, 25, 10000, 10000, -7.7402939, 110.5053448, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(335, 'Grojogan Pucung', 'alam', 4.5, 23, 10000, 10000, -7.990371, 110.3421397, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(336, 'Gallery Amri Yahya', 'alam', 4.9, 21, 10000, 10000, -7.7992289, 110.3537936, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(337, 'Pantai Daud', 'alam', 4.4, 21, 10000, 10000, -8.157724, 110.6246487, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(338, 'Pantai Parangracuk', 'alam', 4.5, 21, 10000, 10000, -8.1316897, 110.5447417, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(339, 'Pantai Sundak Timur', 'alam', 4.4, 21, 10000, 10000, -8.147072, 110.6079043, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(340, 'Museum Batik Keraton Yogyakarta', 'budaya dan sejarah, museum', 4.9, 20, 20000, 20000, -7.8075139, 110.3645895, 'Di Museum Batik Keraton Yogyakarta, wisatawan akan disuguhi sekitar 2.000-an motif asli keluarga kerajaan. Tak seperti ruangan museum lain di komplek Keraton, khusus di museum Batik pengunjung dilarang memotret. Terdapat foto-foto raja dan ratu dari generasi ke generasi lengkap dengan penjelasan filosofinya', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(341, 'Turunan Stone Park', 'alam', 4.5, 20, 10000, 10000, -7.9730132, 110.4351912, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(342, 'Gerojogan Jurugan', 'alam', 4.6, 19, 10000, 10000, -7.7005813, 110.2359752, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(343, 'Grenjeng Water Park', 'alam', 4.3, 19, 10000, 10000, -7.6563532, 110.3857548, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(344, 'Museum Padepokan Sumber Karahajon', 'alam', 4.3, 19, 10000, 10000, -7.859559, 110.409273, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(345, 'Puncak Kuda Sembrani-Desa Wisata Banjarasri', 'alam', 4.4, 19, 10000, 10000, -7.6920487, 110.2131553, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(346, 'WATER PARK DESA SUDIMORO', 'alam', 3.7, 19, 10000, 10000, -7.6132549, 110.3519173, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(347, 'Kids Fun Mirota Pasaraya', 'alam', 4.4, 18, 10000, 10000, -7.7529211, 110.3846346, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(348, 'Museum Romo Mangun', 'alam', 4.1, 17, 10000, 10000, -7.7841172, 110.3709179, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(349, 'TemenNyantai TransWisata', 'alam', 4.6, 17, 10000, 10000, -7.7689452, 110.4261352, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(350, 'Goa Pego', 'alam', 4.2, 16, 10000, 10000, -7.9990794, 110.3705074, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(351, 'Museum Pergerakan Wanita Indonesia Mandala Bhakti Wanitatama', 'alam', 4.7, 15, 10000, 10000, -7.7839154, 110.3932776, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(352, 'GRINATA ADVENTURE 1', 'alam', 4.9, 13, 10000, 10000, -7.5902269, 110.4423564, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(353, 'Teras Merapi', 'alam', 4.9, 13, 10000, 10000, -7.5876903, 110.4558767, 'Tidak ada deskripsi', 'merapi.jpeg', '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(354, 'Kori Agung Masjid Gedhe Mataram Kotagede', 'alam', 4.7, 12, 10000, 10000, -7.8294965, 110.3985073, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(355, 'Museum Sidik Martowidjojo', 'alam', 4, 11, 10000, 10000, -7.8084446, 110.3629506, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(356, 'Yogyakarta Night Tours - Meeting Point Klasik : Historical Walking and Food Tour', 'alam', 5, 11, 10000, 10000, -7.797444, 110.3653174, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(357, 'Borobudur Prambanan Tour', 'alam', 5, 10, 10000, 10000, -7.8208261, 110.3769404, 'Tidak ada deskripsi', 'prambanan.jpeg', '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(358, 'Ekowisata Nologaten', 'alam', 5, 10, 10000, 10000, -7.7748937, 110.3988399, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(359, 'Kids Waterpark & Replika Taman Satwa', 'alam', 4.4, 10, 10000, 10000, -7.6210027, 110.4224484, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(360, 'Puncak watu wayang', 'alam', 4.8, 10, 10000, 10000, -7.8401664, 110.5496579, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(361, 'Wisata Pangol Hill', 'alam', 4.7, 10, 10000, 10000, -7.8353888, 110.4590277, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(362, 'Candi Kelir', 'alam', 4.7, 9, 10000, 10000, -7.7520476, 110.4918414, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(363, 'Desa Wisata \"Bedog Ilir\"', 'alam', 5, 9, 10000, 10000, -7.7795584, 110.3281743, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(364, 'Goa Branjang', 'alam', 4.1, 9, 10000, 10000, -8.0251346, 110.3483546, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(365, 'LAVA TOUR MERAPI PM ADVENTURE', 'alam', 5, 9, 10000, 10000, -7.6133163, 110.4264733, 'Tidak ada deskripsi', 'merapi.jpeg', '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(366, 'Museum Monumen Kowani', 'alam', 4.3, 9, 10000, 10000, -7.7823912, 110.4023938, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(367, 'Bangunan Jembatan Merah', 'alam', 4.6, 8, 10000, 10000, -7.7633465, 110.3942161, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(368, 'Candi Gebang', 'alam', 4.8, 8, 10000, 10000, -7.751691, 110.4163246, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(369, 'Desa Wisata Kembang Wonderful', 'alam', 5, 8, 10000, 10000, -7.6349344, 110.3837672, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(370, 'Mates Landscape', 'alam', 4.8, 8, 10000, 10000, -7.8354971, 110.278055, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(371, 'Pantai Ngondo', 'alam', 4.8, 8, 10000, 10000, -8.1802873, 110.6759738, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(372, 'Situs Candi Banjaran', 'alam', 4.5, 8, 10000, 10000, -7.7215546, 110.5259585, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(373, 'Tugu Ireng (Dusun Putat)', 'alam', 4.8, 8, 10000, 10000, -7.9581348, 110.5170714, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(374, 'Kauman Pakualaman Yogyakarta', 'alam', 5, 7, 10000, 10000, -7.8010347, 110.3751922, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(375, 'Merapi Park Wahana Air', 'alam', 4.1, 7, 10000, 10000, -7.6210688, 110.422686, 'Tidak ada deskripsi', 'merapi.jpeg', '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(376, 'Puncak Kobango Bike Park', 'alam', 4.9, 7, 10000, 10000, -7.8976603, 110.407079, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(377, 'TripJogja - Fotografer - Videografer - Edit Foto - Paket Wisata', 'alam', 5, 7, 10000, 10000, -7.776267, 110.3527029, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(378, 'Kori Barat Masjid Gedhe Mataram Kotagede', 'alam', 4.3, 6, 10000, 10000, -7.8290325, 110.3983065, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(379, 'Tugu Mintoragan', 'alam', 4.7, 6, 10000, 10000, -7.8374755, 110.4236451, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(380, 'Candi ASU Klaten', 'budaya dan sejarah', 4.2, 5, 3000, 3000, -7.7423022, 110.5155871, 'Letaknya di Dk. Bener Ds. Bugisan Kec. Prambanan Klaten, Candi Asu yang terletak di luar komplek Taman Wisata Prambanan kurang lebih berjarak 1 km dari komplek Taman Wisata Prambanan dan berada di dekat perumahan penduduk. Bentuk candi saat ini terkesan berserakan namun telah dilindungi oleh pagar.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(381, 'Candi Plaosan Lor', 'alam', 4.2, 5, 3000, 3000, -7.7403775, 110.5047736, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(382, 'Kali \"Bladeran\"', 'alam', 4, 5, 10000, 10000, -7.6942818, 110.2359799, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(383, 'MUSEUM GARUDA', 'alam', 4.8, 5, 10000, 10000, -7.8480274, 110.3526747, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(384, 'Museum Muhamadiyah', 'alam', 4, 5, 10000, 10000, -7.8342532, 110.3837813, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(385, 'Musium Waterpark Wonoboyo', 'alam', 4.6, 5, 10000, 10000, -7.730046, 110.536511, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(386, 'Padepokan suroloyo', 'alam', 5, 5, 10000, 10000, -7.9497203, 110.5415388, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(387, 'Pantai dluwok', 'alam', 3.8, 5, 10000, 10000, -8.1205585, 110.5076863, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(388, 'Pendopo Pilahan', 'alam', 4.6, 5, 10000, 10000, -7.8150311, 110.4005391, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(389, 'Borobudur Tour From Semarang Port', 'alam', 5, 4, 10000, 10000, -7.809607, 110.372001, 'Tidak ada deskripsi', 'borobudur.jpeg', '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(390, 'Bukit white stone', 'alam', 5, 4, 10000, 10000, -7.9061342, 110.4563002, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(391, 'Candi Card', 'alam', 5, 4, 10000, 10000, -7.702717, 110.4110383, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(392, 'Desa Wisata Trumpon', 'alam', 4.5, 4, 10000, 10000, -7.6246794, 110.3601189, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(393, 'Graceland 66', 'alam', 5, 4, 10000, 10000, -7.7763136, 110.4071704, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(394, 'Kids Fun Ferrari', 'alam', 3.8, 4, 10000, 10000, -7.8289621, 110.4403391, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(395, 'Kids Fun Jurrasic Park', 'alam', 3.5, 4, 10000, 10000, -7.8288707, 110.4408115, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(396, 'Lapangan Reklamasi Ngentak', 'alam', 5, 4, 10000, 10000, -7.7129217, 110.3384292, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(397, 'Mushola Kawasan Wisata Candi Prambanan', 'alam', 3.3, 4, 10000, 10000, -7.7498116, 110.4943356, 'Tidak ada deskripsi', 'prambanan.jpeg', '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(398, 'Sepeda Mabur Sindu Kusuma Edupark', 'alam', 4.3, 4, 10000, 10000, -7.7660586, 110.3554968, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(399, 'Stonehange', 'alam', 4.3, 4, 10000, 10000, -7.6021664, 110.4477547, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(400, 'Watu Masjid', 'alam', 4.3, 4, 10000, 10000, -7.9553099, 110.4275744, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(401, 'Bangsal Kencana', 'alam', 4.3, 3, 10000, 10000, -7.8077158, 110.3638489, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(402, 'Candi Sumberwatu', 'alam', 3.3, 3, 10000, 10000, -7.7684278, 110.4965595, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(403, 'Kotagede Heritage Trail', 'alam', 5, 3, 10000, 10000, -7.8263088, 110.398512, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(404, 'Museum Temporer Sonobudoyo', 'alam', 5, 3, 10000, 10000, -7.8019387, 110.3644618, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(405, 'Mushola Candi Banyunibo', 'alam', 4.7, 3, 10000, 10000, -7.778495, 110.4946377, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(406, 'New Destination Wisata Desa Terong', 'alam', 4, 3, 10000, 10000, -7.8761445, 110.4582338, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(407, 'Obyek Wisata BKK kendal sari', 'alam', 4.7, 3, 10000, 10000, -7.6290107, 110.4908773, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(408, 'Pantai Daerah Yogyakarta', 'alam', 3.3, 3, 10000, 10000, -7.8753849, 110.4262088, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(409, 'Patung Kuda GMJR', 'alam', 5, 3, 10000, 10000, -7.8552045, 110.3140355, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(410, 'Permandian Alami Dan Supernatural', 'alam', 4, 3, 10000, 10000, -7.7046102, 110.3526466, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(411, 'Raharjo Tour', 'alam', 5, 3, 10000, 10000, -7.8266281, 110.4077844, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(412, 'TAMAN GROUNDSILL BENDUNG TEGAL', 'alam', 5, 3, 10000, 10000, -7.9341898, 110.3653539, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(413, 'Vegetalika Faperta UGM', 'alam', 4.3, 3, 10000, 10000, -7.7678488, 110.3818991, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(414, 'Watu Dandang', 'alam', 3.7, 3, 10000, 10000, -7.8919557, 110.4068584, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(415, 'Wisata Batu Titanic', 'alam', 4.7, 3, 10000, 10000, -7.9459282, 110.4146063, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(416, 'WISATA CANDI SARI', 'alam', 4.7, 3, 10000, 10000, -7.7615828, 110.4740437, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(417, 'Wisata Jaga Bendung', 'alam', 5, 3, 10000, 10000, -7.9087427, 110.3797906, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(418, 'Aisha tour planner & transport service', 'alam', 5, 2, 10000, 10000, -7.7972273, 110.3905519, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(419, 'Candi Pembakaran', 'alam', 5, 2, 10000, 10000, -7.7690965, 110.4885363, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(420, 'Embung Bangeran', 'alam', 5, 2, 10000, 10000, -7.7923528, 110.3962255, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(421, 'Gazebo Bukit Watu Pengklik Sriharjo', 'alam', 4.5, 2, 10000, 10000, -7.9458817, 110.4274973, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(422, 'Graha Candi', 'alam', 5, 2, 10000, 10000, -7.8265832, 110.47927, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(423, 'Jati Meranggas', 'alam', 4.5, 2, 10000, 10000, -7.8588559, 110.4438313, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(424, 'Jatirejo Village Tour : Local Life Discovery', 'alam', 5, 2, 10000, 10000, -7.7343679, 110.3717056, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(425, 'JOLLY ROGER TATTOO', 'alam', 5, 2, 10000, 10000, -7.780561, 110.392352, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(426, 'Jurang Tembelan Kreen', 'alam', 4, 2, 10000, 10000, -7.940161, 110.4299338, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(427, 'Lawang Ijo', 'alam', 4, 2, 10000, 10000, -7.8279009, 110.3966895, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(428, 'Monumen Deles Indah', 'alam', 5, 2, 10000, 10000, -7.572719, 110.467008, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(429, 'Monumen Serang Umum 1 Maret', 'alam', 5, 2, 10000, 10000, -7.8096391, 110.3551478, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(430, 'Museum Pendidikan dan Mainan Kolong Tangga', 'alam', 5, 2, 10000, 10000, -7.8001114, 110.3679986, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(431, 'Nggunungan', 'alam', 2.5, 2, 10000, 10000, -7.8679853, 110.4514578, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(432, 'Pancuran \"Tirip Kulon\"', 'alam', 4.5, 2, 10000, 10000, -7.6920244, 110.2337952, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(433, 'Sasana Tirta Kembaran', 'alam', 5, 2, 10000, 10000, -7.830802, 110.3349744, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(434, 'Sokkel klok voor Eeuw Nederlandsch-Indische', 'alam', 5, 2, 10000, 10000, -7.7995673, 110.3649177, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(435, 'Sumber Kluthuk', 'alam', 5, 2, 10000, 10000, -7.6655711, 110.3521031, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(436, 'Taman Rekrasi Lembah Bedog', 'alam', 4, 2, 10000, 10000, -7.6800812, 110.3545714, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(437, 'Air Terjun Kedung Manglu', 'alam', 5, 1, 10000, 10000, -7.937667, 110.408222, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(438, 'Air Terjun Sindet', 'alam', 1, 1, 10000, 10000, -7.9011588, 110.3934474, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(439, 'Andi Bayou Museum', 'alam', 5, 1, 10000, 10000, -7.7759703, 110.3485938, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(440, 'BACKSPACE Art Lab and Museum', 'alam', 5, 1, 10000, 10000, -7.8503547, 110.351145, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(441, 'Bangsal Pengapit Pasewakan', 'alam', 1, 1, 10000, 10000, -7.8076645, 110.3651385, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(442, 'Beneran waterpark', 'alam', 5, 1, 10000, 10000, -7.6560857, 110.3858688, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(443, 'Bintang Pradana Jogja Tour', 'alam', 4, 1, 10000, 10000, -7.7593783, 110.3716453, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(444, 'bukit indah patuk', 'alam', 5, 1, 10000, 10000, -7.8505258, 110.4772342, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(445, 'Camping ground lor sambi', 'alam', 5, 1, 10000, 10000, -7.6429172, 110.4277772, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(446, 'Candi Ambyar', 'alam', 3, 1, 10000, 10000, -7.6773077, 110.5570963, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(447, 'Castelo de Água do Sultanato de Yogyakarta', 'alam', 5, 1, 10000, 10000, -7.8100995, 110.3596395, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(448, 'Desa Wisata Budaya Agro dan Edukasi Daratan Sendangarum', 'alam', 5, 1, 10000, 10000, -7.7439149, 110.2579678, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(449, 'Desa Wisata Fauna Ketingan', 'alam', 5, 1, 10000, 10000, -7.743062, 110.3292115, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(450, 'Dewi Suba', 'alam', 4, 1, 10000, 10000, -7.5907274, 110.3334618, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(451, 'Djumbidi keluarga', 'alam', 5, 1, 10000, 10000, -7.8624582, 110.4904404, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(452, 'Gapura Sawojajar Wijilan', 'alam', 5, 1, 10000, 10000, -7.8052478, 110.3666595, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(453, 'Jalur Lahar Point Kaliadem', 'alam', 5, 1, 10000, 10000, -7.5827709, 110.4486854, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(454, 'Jasa Citytour - Private Trip - Tour - Fotografi - Antar Bandara Jogja', 'alam', 5, 1, 10000, 10000, -7.7792349, 110.3499756, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43');
INSERT INTO `wisatas` (`id`, `nama`, `kategori`, `rating`, `total_review`, `harga_weekday`, `harga_weekend`, `latitude`, `longitude`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(455, 'Jembatan Diro', 'alam', 5, 1, 10000, 10000, -7.73769, 110.2342277, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(456, 'Kali Gede Banyumeneng', 'alam', 4, 1, 10000, 10000, -7.9909547, 110.4022933, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(457, 'Kampung wisata wonorejo', 'alam', 5, 1, 10000, 10000, -7.6237978, 110.4177307, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(458, 'Luweng Mendur', 'alam', 5, 1, 10000, 10000, -8.02129, 110.36932, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(459, 'Masjid Al-Huda Candi 3', 'alam', 5, 1, 10000, 10000, -7.7040906, 110.4096107, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(460, 'Museum Kristal dan Cinderamata Keraton Yogyakarta', 'alam', 5, 1, 10000, 10000, -7.807964, 110.364513, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(461, 'Museum of Struggle', 'alam', 5, 1, 10000, 10000, -7.8164905, 110.3718611, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(462, 'Museum Omah Jayeng', 'alam', 4, 1, 10000, 10000, -7.7995295, 110.3726029, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(463, 'Omah maggot ngaglik', 'alam', 5, 1, 10000, 10000, -7.7130748, 110.3945574, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(464, 'Pantai Bidara Tourism', 'alam', 4, 1, 10000, 10000, -7.932481, 110.1127314, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(465, 'Pantai Pasir Mendit', 'alam', 3, 1, 10000, 10000, -7.8943492, 110.0194606, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(466, 'Patung Kaligintung Lor', 'alam', 5, 1, 10000, 10000, -7.8795782, 110.0885, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(467, 'Patung Kuda Dringo', 'alam', 4, 1, 10000, 10000, -7.9999241, 110.3440947, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(468, 'PATUNG SULTAN AGUNG Imogiri', 'alam', 5, 1, 10000, 10000, -7.919995, 110.3815984, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(469, 'Pemancingan Adi Winata', 'alam', 5, 1, 10000, 10000, -7.7045773, 110.5120115, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(470, 'Ruang Perawatan Jenderal Soedirman', 'alam', 5, 1, 10000, 10000, -7.7764736, 110.3767439, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(471, 'Situs Gedong Pusoko', 'alam', 5, 1, 10000, 10000, -7.807846, 110.4037578, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(472, 'Taman Edukasi dan Outbound Sunan Kalijaga', 'alam', 5, 1, 10000, 10000, -7.8092066, 110.4132518, 'Tidak ada deskripsi', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43'),
(473, 'Wisata Air Wanatirta Kencana', 'wisata air', 5, 1, 10000, 15000, -7.8914433, 110.548354, 'Wahana bermain air di Taman Wisata Air Tirta Kencana cukup lengkap, mulai dari water sled yang khusus untuk anak-anak, dan juga disediakan water sled yang dikhususkan bagi orang dewasa. Kolam renang menjadi tempat favorit para wisatawan untuk menikmati segarnya air yang juga dibagi untuk anak-anak dan juga orang dewasa.', NULL, '2026-05-09 22:41:43', '2026-05-09 22:41:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kriterias`
--
ALTER TABLE `kriterias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_wisata_id_foreign` (`wisata_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wisatas`
--
ALTER TABLE `wisatas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kriterias`
--
ALTER TABLE `kriterias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wisatas`
--
ALTER TABLE `wisatas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=477;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_wisata_id_foreign` FOREIGN KEY (`wisata_id`) REFERENCES `wisatas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
