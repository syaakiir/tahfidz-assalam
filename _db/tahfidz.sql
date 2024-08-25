-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Agu 2023 pada 20.25
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tahfidz`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--
tahfidztahfidz
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_07_03_041142_create_user_table', 1),
(2, '2019_07_03_042750_create_class_table', 1),
(3, '2019_07_03_042949_create_surah_table', 1),
(4, '2019_07_03_043613_create_user_token_table', 1),
(5, '2019_07_03_044115_create_iqro_table', 1),
(6, '2019_07_03_044924_create_sytem_log_table', 1),
(7, '2019_07_03_045155_create_siswa_table', 1),
(8, '2019_07_03_050203_create_siswa_has_surah_table', 1),
(9, '2019_07_03_074151_create_siswa_has_iqro_table', 1),
(10, '2019_07_03_074506_create_report_print_log_table', 1),
(11, '2019_07_03_074842_create_global_setting_table', 1),
(12, '2019_08_12_083949_create_permission_tables', 1),
(13, '2019_08_19_003209_create_siswa_has_parent', 1),
(14, '2019_08_22_002116_create_assessment_log', 1),
(15, '2019_09_05_011908_create_action_log', 1),
(16, '2020_01_31_213915_create_notification', 1),
(17, '2020_02_02_005836_create_user_notification', 1),
(18, '2020_02_02_005837_create_password_resets_table', 1),
(19, '2020_02_13_130004_create_user_login_history', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Model\\User\\User', 2),
(2, 'App\\Model\\User\\User', 1),
(3, 'App\\Model\\User\\User', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@admin.com', '$2y$10$bl2JXmdOYPBb7ThGvt0Exez2QDm2uB00aJ8MBbWI5yjQJ2ZlHtfXy', '2023-08-11 17:19:47'),
('alimochtar78.id@gmail.com', '$2y$10$Eqhvo79IKxB4SxDwPdeHTe7pfo.oTeWJhRZYk.7RDeYrwhCuMwXsq', '2023-08-11 17:41:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'index home', 'web', '2023-08-11 16:24:03', '2023-08-11 16:24:03'),
(2, 'index surah', 'web', '2023-08-11 16:24:03', '2023-08-11 16:24:03'),
(3, 'view surah', 'web', '2023-08-11 16:24:04', '2023-08-11 16:24:04'),
(4, 'create surah', 'web', '2023-08-11 16:24:04', '2023-08-11 16:24:04'),
(5, 'update surah', 'web', '2023-08-11 16:24:04', '2023-08-11 16:24:04'),
(6, 'delete surah', 'web', '2023-08-11 16:24:04', '2023-08-11 16:24:04'),
(7, 'index user', 'web', '2023-08-11 16:24:04', '2023-08-11 16:24:04'),
(8, 'view user', 'web', '2023-08-11 16:24:04', '2023-08-11 16:24:04'),
(9, 'create user', 'web', '2023-08-11 16:24:05', '2023-08-11 16:24:05'),
(10, 'update user', 'web', '2023-08-11 16:24:05', '2023-08-11 16:24:05'),
(11, 'delete user', 'web', '2023-08-11 16:24:05', '2023-08-11 16:24:05'),
(12, 'index class', 'web', '2023-08-11 16:24:05', '2023-08-11 16:24:05'),
(13, 'view class', 'web', '2023-08-11 16:24:05', '2023-08-11 16:24:05'),
(14, 'create class', 'web', '2023-08-11 16:24:05', '2023-08-11 16:24:05'),
(15, 'update class', 'web', '2023-08-11 16:24:06', '2023-08-11 16:24:06'),
(16, 'delete class', 'web', '2023-08-11 16:24:06', '2023-08-11 16:24:06'),
(17, 'index iqro', 'web', '2023-08-11 16:24:06', '2023-08-11 16:24:06'),
(18, 'view iqro', 'web', '2023-08-11 16:24:06', '2023-08-11 16:24:06'),
(19, 'create iqro', 'web', '2023-08-11 16:24:06', '2023-08-11 16:24:06'),
(20, 'update iqro', 'web', '2023-08-11 16:24:06', '2023-08-11 16:24:06'),
(21, 'delete iqro', 'web', '2023-08-11 16:24:06', '2023-08-11 16:24:06'),
(22, 'index siswa', 'web', '2023-08-11 16:24:07', '2023-08-11 16:24:07'),
(23, 'view siswa', 'web', '2023-08-11 16:24:07', '2023-08-11 16:24:07'),
(24, 'create siswa', 'web', '2023-08-11 16:24:07', '2023-08-11 16:24:07'),
(25, 'update siswa', 'web', '2023-08-11 16:24:07', '2023-08-11 16:24:07'),
(26, 'delete siswa', 'web', '2023-08-11 16:24:07', '2023-08-11 16:24:07'),
(27, 'index parent', 'web', '2023-08-11 16:24:07', '2023-08-11 16:24:07'),
(28, 'change password', 'web', '2023-08-11 16:24:08', '2023-08-11 16:24:08'),
(29, 'create parent', 'web', '2023-08-11 16:24:08', '2023-08-11 16:24:08'),
(30, 'update parent', 'web', '2023-08-11 16:24:08', '2023-08-11 16:24:08'),
(31, 'delete parent', 'web', '2023-08-11 16:24:08', '2023-08-11 16:24:08'),
(32, 'index assessment', 'web', '2023-08-11 16:24:08', '2023-08-11 16:24:08'),
(33, 'create assessment', 'web', '2023-08-11 16:24:09', '2023-08-11 16:24:09'),
(34, 'index role', 'web', '2023-08-11 16:24:09', '2023-08-11 16:24:09'),
(35, 'update role', 'web', '2023-08-11 16:24:09', '2023-08-11 16:24:09'),
(36, 'all report', 'web', '2023-08-11 16:24:09', '2023-08-11 16:24:09'),
(37, 'index profile', 'web', '2023-08-11 16:24:09', '2023-08-11 16:24:09'),
(38, 'update profile', 'web', '2023-08-11 16:24:10', '2023-08-11 16:24:10'),
(39, 'index notification', 'web', '2023-08-11 16:24:10', '2023-08-11 16:24:10'),
(40, 'create notification', 'web', '2023-08-11 16:24:10', '2023-08-11 16:24:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2023-08-11 16:24:10', '2023-08-11 16:24:10'),
(2, 'Creator', 'web', '2023-08-11 16:24:11', '2023-08-11 16:24:11'),
(3, 'Guru', 'web', '2023-08-11 16:24:11', '2023-08-11 16:24:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(28, 3),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(32, 3),
(33, 1),
(33, 2),
(33, 3),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(36, 3),
(37, 1),
(37, 2),
(37, 3),
(38, 1),
(38, 2),
(38, 3),
(39, 1),
(39, 2),
(40, 1),
(40, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_action_log`
--

CREATE TABLE `tbl_action_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action_type` int(11) NOT NULL,
  `is_error` int(11) NOT NULL,
  `action_message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_action_log`
--

INSERT INTO `tbl_action_log` (`id`, `user_id`, `action_type`, `is_error`, `action_message`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-11 23:24:33', '2023-08-11 16:24:33', '2023-08-11 16:24:33'),
(2, 1, 10, 0, 'Mengakses halaman manajemen user', '2023-08-11 23:25:00', '2023-08-11 16:25:00', '2023-08-11 16:25:00'),
(3, 1, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-11 23:25:05', '2023-08-11 16:25:05', '2023-08-11 16:25:05'),
(4, 1, 10, 0, 'Mengakses Halaman Assessment', '2023-08-11 23:25:09', '2023-08-11 16:25:09', '2023-08-11 16:25:09'),
(5, 1, 10, 0, 'Mengakses halaman manajemen user', '2023-08-11 23:25:29', '2023-08-11 16:25:29', '2023-08-11 16:25:29'),
(6, 1, 10, 0, 'Mengakses halaman create manajemen user', '2023-08-11 23:25:31', '2023-08-11 16:25:31', '2023-08-11 16:25:31'),
(7, 1, 10, 0, 'Mengakses halaman Profile', '2023-08-11 23:25:39', '2023-08-11 16:25:39', '2023-08-11 16:25:39'),
(8, 1, 10, 0, 'Mengakses halaman manajemen user', '2023-08-11 23:26:08', '2023-08-11 16:26:08', '2023-08-11 16:26:08'),
(9, 1, 10, 0, 'Mengakses halaman create manajemen user', '2023-08-11 23:26:10', '2023-08-11 16:26:10', '2023-08-11 16:26:10'),
(10, 1, 10, 0, 'Mengakses halaman Profile', '2023-08-11 23:26:41', '2023-08-11 16:26:41', '2023-08-11 16:26:41'),
(11, 1, 10, 0, 'Berhasil mengupdate Profile', '2023-08-11 23:27:00', '2023-08-11 16:27:00', '2023-08-11 16:27:00'),
(12, 1, 10, 0, 'Mengakses halaman Profile', '2023-08-11 23:27:01', '2023-08-11 16:27:01', '2023-08-11 16:27:01'),
(13, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-11 23:28:06', '2023-08-11 16:28:06', '2023-08-11 16:28:06'),
(14, 1, 10, 0, 'Mengakses halaman role', '2023-08-11 23:28:14', '2023-08-11 16:28:14', '2023-08-11 16:28:14'),
(15, 1, 10, 0, 'Mengakses halaman action log', '2023-08-11 23:28:21', '2023-08-11 16:28:21', '2023-08-11 16:28:21'),
(16, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-11 23:28:27', '2023-08-11 16:28:27', '2023-08-11 16:28:27'),
(17, 1, 10, 0, 'Mengakses halaman manajemen user', '2023-08-11 23:28:36', '2023-08-11 16:28:36', '2023-08-11 16:28:36'),
(18, 1, 10, 0, 'Mengakses halaman Profile', '2023-08-11 23:28:43', '2023-08-11 16:28:43', '2023-08-11 16:28:43'),
(19, 1, 10, 0, 'Berhasil mengupdate Password', '2023-08-11 23:30:07', '2023-08-11 16:30:07', '2023-08-11 16:30:07'),
(20, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-11 23:31:06', '2023-08-11 16:31:06', '2023-08-11 16:31:06'),
(21, 1, 10, 0, 'Mengakses halaman manajemen user', '2023-08-11 23:31:13', '2023-08-11 16:31:13', '2023-08-11 16:31:13'),
(22, 1, 10, 0, 'Mengakses halaman create manajemen user', '2023-08-11 23:31:15', '2023-08-11 16:31:15', '2023-08-11 16:31:15'),
(23, 1, 10, 0, 'Mengakses halaman create manajemen user', '2023-08-11 23:31:45', '2023-08-11 16:31:45', '2023-08-11 16:31:45'),
(24, 1, 10, 0, 'Mengakses halaman create manajemen user', '2023-08-11 23:32:00', '2023-08-11 16:32:00', '2023-08-11 16:32:00'),
(25, 1, 10, 0, 'Mengakses Halaman Assessment', '2023-08-11 23:32:08', '2023-08-11 16:32:08', '2023-08-11 16:32:08'),
(26, 1, 10, 0, 'Mengakses halaman manajemen user', '2023-08-11 23:32:09', '2023-08-11 16:32:09', '2023-08-11 16:32:09'),
(27, 1, 10, 0, 'Mengakses halaman create manajemen user', '2023-08-11 23:32:19', '2023-08-11 16:32:19', '2023-08-11 16:32:19'),
(28, 1, 10, 0, 'Berhasil menyimpan user', '2023-08-11 23:32:38', '2023-08-11 16:32:38', '2023-08-11 16:32:38'),
(29, 1, 10, 0, 'Mengakses halaman manajemen user', '2023-08-11 23:32:38', '2023-08-11 16:32:38', '2023-08-11 16:32:38'),
(30, 1, 10, 0, 'Mengakses halaman create manajemen user', '2023-08-11 23:32:48', '2023-08-11 16:32:48', '2023-08-11 16:32:48'),
(31, 1, 10, 0, 'Berhasil menyimpan user', '2023-08-11 23:33:18', '2023-08-11 16:33:18', '2023-08-11 16:33:18'),
(32, 1, 10, 0, 'Mengakses halaman manajemen user', '2023-08-11 23:33:18', '2023-08-11 16:33:18', '2023-08-11 16:33:18'),
(33, 1, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-11 23:33:28', '2023-08-11 16:33:28', '2023-08-11 16:33:28'),
(34, 1, 10, 0, 'Mengakses Halaman Penambahan Orangtua', '2023-08-11 23:33:38', '2023-08-11 16:33:38', '2023-08-11 16:33:38'),
(35, 1, 10, 0, 'Mengakses halaman manajemen user', '2023-08-11 23:35:21', '2023-08-11 16:35:21', '2023-08-11 16:35:21'),
(36, 1, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-11 23:41:26', '2023-08-11 16:41:26', '2023-08-11 16:41:26'),
(37, 1, 10, 0, 'Mengakses Halaman Penambahan Orangtua', '2023-08-11 23:41:29', '2023-08-11 16:41:29', '2023-08-11 16:41:29'),
(38, 1, 10, 0, 'Berhasil Store Orangtua', '2023-08-11 23:42:17', '2023-08-11 16:42:17', '2023-08-11 16:42:17'),
(39, 1, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-11 23:42:17', '2023-08-11 16:42:17', '2023-08-11 16:42:17'),
(40, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-11 23:43:00', '2023-08-11 16:43:00', '2023-08-11 16:43:00'),
(41, 1, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-11 23:43:02', '2023-08-11 16:43:02', '2023-08-11 16:43:02'),
(42, 2, 10, 0, 'Mengakses Halaman Home', '2023-08-11 23:44:17', '2023-08-11 16:44:17', '2023-08-11 16:44:17'),
(43, 2, 10, 0, 'Mengakses halaman manajemen user', '2023-08-11 23:44:22', '2023-08-11 16:44:22', '2023-08-11 16:44:22'),
(44, 2, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-11 23:44:23', '2023-08-11 16:44:23', '2023-08-11 16:44:23'),
(45, 2, 10, 0, 'Mengakses halaman manajemen user', '2023-08-11 23:44:27', '2023-08-11 16:44:27', '2023-08-11 16:44:27'),
(46, 2, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-11 23:44:34', '2023-08-11 16:44:34', '2023-08-11 16:44:34'),
(47, 3, 10, 0, 'Mengakses Halaman Home', '2023-08-11 23:44:53', '2023-08-11 16:44:53', '2023-08-11 16:44:53'),
(48, 3, 10, 0, 'Mengakses Halaman Assessment', '2023-08-11 23:44:55', '2023-08-11 16:44:55', '2023-08-11 16:44:55'),
(49, 3, 10, 0, 'Mengakses Halaman Laporan Harian', '2023-08-11 23:45:07', '2023-08-11 16:45:07', '2023-08-11 16:45:07'),
(50, 3, 10, 0, 'Mengakses Halaman Home', '2023-08-11 23:45:20', '2023-08-11 16:45:20', '2023-08-11 16:45:20'),
(51, 3, 10, 0, 'Mengakses Halaman Assessment', '2023-08-11 23:45:32', '2023-08-11 16:45:32', '2023-08-11 16:45:32'),
(52, 3, 10, 0, 'Mengakses Halaman Assessment', '2023-08-11 23:45:36', '2023-08-11 16:45:36', '2023-08-11 16:45:36'),
(53, 3, 10, 0, 'Mengakses Halaman Assessment', '2023-08-11 23:45:52', '2023-08-11 16:45:52', '2023-08-11 16:45:52'),
(54, 3, 10, 0, 'Mengakses Halaman Assessment', '2023-08-11 23:45:53', '2023-08-11 16:45:53', '2023-08-11 16:45:53'),
(55, 3, 10, 0, 'Mengakses Halaman Assessment', '2023-08-11 23:45:59', '2023-08-11 16:45:59', '2023-08-11 16:45:59'),
(56, 3, 10, 0, 'Mengakses Halaman Assessment', '2023-08-11 23:46:03', '2023-08-11 16:46:03', '2023-08-11 16:46:03'),
(57, 3, 10, 0, 'Menarik data Surah', '2023-08-11 23:46:06', '2023-08-11 16:46:06', '2023-08-11 16:46:06'),
(58, 3, 10, 0, 'Menarik data Surah', '2023-08-11 23:46:12', '2023-08-11 16:46:12', '2023-08-11 16:46:12'),
(59, 3, 10, 0, 'Menarik data Surah', '2023-08-11 23:46:13', '2023-08-11 16:46:13', '2023-08-11 16:46:13'),
(60, 3, 10, 0, 'Menarik data Surah', '2023-08-11 23:46:14', '2023-08-11 16:46:14', '2023-08-11 16:46:14'),
(61, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-11 23:46:50', '2023-08-11 16:46:50', '2023-08-11 16:46:50'),
(62, 1, 10, 0, 'Mengakses halaman role', '2023-08-11 23:46:57', '2023-08-11 16:46:57', '2023-08-11 16:46:57'),
(63, 1, 10, 0, 'Mengakses Halaman Master Iqro', '2023-08-11 23:47:01', '2023-08-11 16:47:01', '2023-08-11 16:47:01'),
(64, 1, 10, 0, 'Mengakses Halaman Create Iqro', '2023-08-11 23:47:10', '2023-08-11 16:47:10', '2023-08-11 16:47:10'),
(65, 1, 10, 0, 'Berhasil menyimpan data Iqro JILID : 1 ', '2023-08-11 23:52:25', '2023-08-11 16:52:25', '2023-08-11 16:52:25'),
(66, 1, 10, 0, 'Mengakses Halaman Master Iqro', '2023-08-11 23:52:25', '2023-08-11 16:52:25', '2023-08-11 16:52:25'),
(67, 1, 10, 0, 'Mengakses Halaman Create Iqro', '2023-08-11 23:52:30', '2023-08-11 16:52:30', '2023-08-11 16:52:30'),
(68, 1, 10, 0, 'Mengakses Halaman Master Iqro', '2023-08-11 23:53:38', '2023-08-11 16:53:38', '2023-08-11 16:53:38'),
(69, 1, 10, 0, 'Mengakses Halaman Create Iqro', '2023-08-11 23:56:51', '2023-08-11 16:56:51', '2023-08-11 16:56:51'),
(70, 1, 10, 0, 'Berhasil menyimpan data Iqro JILID : 2 ', '2023-08-11 23:56:56', '2023-08-11 16:56:56', '2023-08-11 16:56:56'),
(71, 1, 10, 0, 'Mengakses Halaman Master Iqro', '2023-08-11 23:56:56', '2023-08-11 16:56:56', '2023-08-11 16:56:56'),
(72, 1, 10, 0, 'Mengakses Halaman Create Iqro', '2023-08-11 23:56:59', '2023-08-11 16:56:59', '2023-08-11 16:56:59'),
(73, 1, 10, 0, 'Berhasil menyimpan data Iqro JILID : 3 ', '2023-08-11 23:57:16', '2023-08-11 16:57:16', '2023-08-11 16:57:16'),
(74, 1, 10, 0, 'Mengakses Halaman Master Iqro', '2023-08-11 23:57:16', '2023-08-11 16:57:16', '2023-08-11 16:57:16'),
(75, 1, 10, 0, 'Mengakses Halaman Create Iqro', '2023-08-11 23:57:18', '2023-08-11 16:57:18', '2023-08-11 16:57:18'),
(76, 1, 10, 0, 'Berhasil menyimpan data Iqro JILID : 4 ', '2023-08-11 23:57:31', '2023-08-11 16:57:31', '2023-08-11 16:57:31'),
(77, 1, 10, 0, 'Mengakses Halaman Master Iqro', '2023-08-11 23:57:32', '2023-08-11 16:57:32', '2023-08-11 16:57:32'),
(78, 1, 10, 0, 'Mengakses Halaman Create Iqro', '2023-08-11 23:57:34', '2023-08-11 16:57:34', '2023-08-11 16:57:34'),
(79, 1, 10, 0, 'Berhasil menyimpan data Iqro JILID : 5 ', '2023-08-11 23:57:51', '2023-08-11 16:57:51', '2023-08-11 16:57:51'),
(80, 1, 10, 0, 'Mengakses Halaman Master Iqro', '2023-08-11 23:57:52', '2023-08-11 16:57:52', '2023-08-11 16:57:52'),
(81, 1, 10, 0, 'Mengakses Halaman Create Iqro', '2023-08-11 23:57:53', '2023-08-11 16:57:53', '2023-08-11 16:57:53'),
(82, 1, 10, 0, 'Berhasil menyimpan data Iqro JILID : 6 ', '2023-08-11 23:58:12', '2023-08-11 16:58:12', '2023-08-11 16:58:12'),
(83, 1, 10, 0, 'Mengakses Halaman Master Iqro', '2023-08-11 23:58:12', '2023-08-11 16:58:12', '2023-08-11 16:58:12'),
(84, 1, 10, 0, 'Mengakses Halaman Master Quran', '2023-08-11 23:58:18', '2023-08-11 16:58:18', '2023-08-11 16:58:18'),
(85, 1, 10, 0, 'Mengakses Halaman Input Surah (Quran)', '2023-08-11 23:58:20', '2023-08-11 16:58:20', '2023-08-11 16:58:20'),
(86, 1, 10, 0, 'Berhasil Menyimpan Input Surah (Quran)', '2023-08-12 00:00:53', '2023-08-11 17:00:53', '2023-08-11 17:00:53'),
(87, 1, 10, 0, 'Mengakses Halaman Master Quran', '2023-08-12 00:00:54', '2023-08-11 17:00:54', '2023-08-11 17:00:54'),
(88, 1, 10, 0, 'Mengakses Halaman Master Quran', '2023-08-12 00:06:20', '2023-08-11 17:06:20', '2023-08-11 17:06:20'),
(89, 1, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-12 00:06:34', '2023-08-11 17:06:34', '2023-08-11 17:06:34'),
(90, 1, 10, 0, 'Mengakses halaman manajemen user', '2023-08-12 00:06:46', '2023-08-11 17:06:46', '2023-08-11 17:06:46'),
(91, 1, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-12 00:06:51', '2023-08-11 17:06:51', '2023-08-11 17:06:51'),
(92, 1, 10, 0, 'Mengakses Halaman Assessment', '2023-08-12 00:14:26', '2023-08-11 17:14:26', '2023-08-11 17:14:26'),
(93, 1, 10, 0, 'Mengakses Halaman Assessment', '2023-08-12 00:14:29', '2023-08-11 17:14:29', '2023-08-11 17:14:29'),
(94, 1, 10, 0, 'Menarik data Surah', '2023-08-12 00:14:31', '2023-08-11 17:14:31', '2023-08-11 17:14:31'),
(95, 1, 10, 0, 'Menarik data Surah', '2023-08-12 00:14:41', '2023-08-11 17:14:41', '2023-08-11 17:14:41'),
(96, 1, 10, 0, 'Mengakses Halaman Assessment', '2023-08-12 00:14:46', '2023-08-11 17:14:46', '2023-08-11 17:14:46'),
(97, 1, 10, 0, 'Mengakses Halaman Assessment', '2023-08-12 00:14:55', '2023-08-11 17:14:55', '2023-08-11 17:14:55'),
(98, 1, 10, 0, 'Menarik data Iqro', '2023-08-12 00:14:59', '2023-08-11 17:14:59', '2023-08-11 17:14:59'),
(99, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-12 00:15:05', '2023-08-11 17:15:05', '2023-08-11 17:15:05'),
(100, 1, 10, 0, 'Mengakses halaman action log', '2023-08-12 00:15:14', '2023-08-11 17:15:14', '2023-08-11 17:15:14'),
(101, 1, 10, 0, 'Mengakses halaman role', '2023-08-12 00:15:18', '2023-08-11 17:15:18', '2023-08-11 17:15:18'),
(102, 1, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-12 00:15:22', '2023-08-11 17:15:22', '2023-08-11 17:15:22'),
(103, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-12 00:25:52', '2023-08-11 17:25:52', '2023-08-11 17:25:52'),
(104, 1, 10, 0, 'Mengakses halaman manajemen user', '2023-08-12 00:25:56', '2023-08-11 17:25:56', '2023-08-11 17:25:56'),
(105, 1, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-12 00:30:23', '2023-08-11 17:30:23', '2023-08-11 17:30:23'),
(106, 4, 10, 1, 'Gagal Mengakses Halaman Home', '2023-08-12 00:30:43', '2023-08-11 17:30:43', '2023-08-11 17:30:43'),
(107, 4, 10, 1, 'Gagal Mengakses halaman Profile', '2023-08-12 00:31:00', '2023-08-11 17:31:00', '2023-08-11 17:31:00'),
(108, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-12 00:31:20', '2023-08-11 17:31:20', '2023-08-11 17:31:20'),
(109, 1, 10, 0, 'Mengakses halaman role', '2023-08-12 00:31:24', '2023-08-11 17:31:24', '2023-08-11 17:31:24'),
(110, 1, 10, 0, 'Mengakses halaman action log', '2023-08-12 00:31:34', '2023-08-11 17:31:34', '2023-08-11 17:31:34'),
(111, 1, 10, 0, 'Mengakses Halaman Notifikasi', '2023-08-12 00:31:58', '2023-08-11 17:31:58', '2023-08-11 17:31:58'),
(112, 1, 10, 0, 'Berhasil Menyimpan Input Notification', '2023-08-12 00:32:59', '2023-08-11 17:32:59', '2023-08-11 17:32:59'),
(113, 1, 10, 0, 'Mengakses Halaman Notifikasi', '2023-08-12 00:32:59', '2023-08-11 17:32:59', '2023-08-11 17:32:59'),
(114, 1, 10, 0, 'Mengakses Halaman Notifikasi', '2023-08-12 00:33:07', '2023-08-11 17:33:07', '2023-08-11 17:33:07'),
(115, 2, 10, 0, 'Mengakses Halaman Home', '2023-08-12 00:33:19', '2023-08-11 17:33:19', '2023-08-11 17:33:19'),
(116, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-12 00:35:09', '2023-08-11 17:35:09', '2023-08-11 17:35:09'),
(117, 1, 10, 0, 'Mengakses halaman role', '2023-08-12 00:35:14', '2023-08-11 17:35:14', '2023-08-11 17:35:14'),
(118, 1, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-12 00:35:48', '2023-08-11 17:35:48', '2023-08-11 17:35:48'),
(119, 4, 10, 1, 'Gagal Mengakses Halaman Home', '2023-08-12 00:36:15', '2023-08-11 17:36:15', '2023-08-11 17:36:15'),
(120, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-12 00:46:27', '2023-08-11 17:46:27', '2023-08-11 17:46:27'),
(121, 1, 10, 0, 'Mengakses Halaman Notifikasi', '2023-08-12 00:48:07', '2023-08-11 17:48:07', '2023-08-11 17:48:07'),
(122, 1, 10, 0, 'Mengakses halaman role', '2023-08-12 00:53:28', '2023-08-11 17:53:28', '2023-08-11 17:53:28'),
(123, 1, 10, 0, 'Mengakses halaman update role', '2023-08-12 00:53:30', '2023-08-11 17:53:30', '2023-08-11 17:53:30'),
(124, 1, 10, 0, 'Berhasil melakukan update data', '2023-08-12 00:54:11', '2023-08-11 17:54:11', '2023-08-11 17:54:11'),
(125, 1, 10, 0, 'Mengakses halaman role', '2023-08-12 00:54:11', '2023-08-11 17:54:11', '2023-08-11 17:54:11'),
(126, 1, 10, 0, 'Mengakses halaman update role', '2023-08-12 00:54:14', '2023-08-11 17:54:14', '2023-08-11 17:54:14'),
(127, 1, 10, 0, 'Mengakses halaman role', '2023-08-12 00:54:40', '2023-08-11 17:54:40', '2023-08-11 17:54:40'),
(128, 1, 10, 0, 'Mengakses halaman update role', '2023-08-12 00:54:44', '2023-08-11 17:54:44', '2023-08-11 17:54:44'),
(129, 1, 10, 0, 'Berhasil melakukan update data', '2023-08-12 00:55:02', '2023-08-11 17:55:02', '2023-08-11 17:55:02'),
(130, 1, 10, 0, 'Mengakses halaman role', '2023-08-12 00:55:02', '2023-08-11 17:55:02', '2023-08-11 17:55:02'),
(131, 1, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-12 00:55:14', '2023-08-11 17:55:14', '2023-08-11 17:55:14'),
(132, 1, 10, 0, 'Mengakses Halaman Assessment', '2023-08-12 00:56:09', '2023-08-11 17:56:09', '2023-08-11 17:56:09'),
(133, 1, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-12 00:56:14', '2023-08-11 17:56:14', '2023-08-11 17:56:14'),
(134, 1, 10, 0, 'Mengakses Halaman Assessment', '2023-08-12 00:56:20', '2023-08-11 17:56:20', '2023-08-11 17:56:20'),
(135, 1, 10, 0, 'Mengakses Halaman Assessment', '2023-08-12 00:56:24', '2023-08-11 17:56:24', '2023-08-11 17:56:24'),
(136, 1, 10, 0, 'Menarik data Iqro', '2023-08-12 00:56:29', '2023-08-11 17:56:29', '2023-08-11 17:56:29'),
(137, 1, 10, 0, 'Melakukan Assessment Kepada : 1', '2023-08-12 00:56:53', '2023-08-11 17:56:53', '2023-08-11 17:56:53'),
(138, 1, 10, 0, 'Mengakses Halaman Assessment', '2023-08-12 00:56:53', '2023-08-11 17:56:53', '2023-08-11 17:56:53'),
(139, 1, 10, 0, 'Mengakses Halaman Assessment', '2023-08-12 00:56:58', '2023-08-11 17:56:58', '2023-08-11 17:56:58'),
(140, 4, 10, 1, 'Gagal Mengakses Halaman Home', '2023-08-12 00:57:13', '2023-08-11 17:57:13', '2023-08-11 17:57:13'),
(141, 4, 10, 1, 'Gagal Mengakses halaman Profile', '2023-08-12 00:57:16', '2023-08-11 17:57:16', '2023-08-11 17:57:16'),
(142, 4, 10, 1, 'Gagal Mengakses halaman Profile', '2023-08-12 00:57:17', '2023-08-11 17:57:17', '2023-08-11 17:57:17'),
(143, 2, 10, 0, 'Mengakses Halaman Home', '2023-08-12 00:57:44', '2023-08-11 17:57:44', '2023-08-11 17:57:44'),
(144, 2, 10, 0, 'Mengakses Halaman Home', '2023-08-12 00:58:08', '2023-08-11 17:58:08', '2023-08-11 17:58:08'),
(145, 2, 10, 0, 'Mengakses Halaman Notifikasi', '2023-08-12 00:58:12', '2023-08-11 17:58:12', '2023-08-11 17:58:12'),
(146, 2, 10, 0, 'Mengakses Halaman Orangtua', '2023-08-12 00:58:24', '2023-08-11 17:58:24', '2023-08-11 17:58:24'),
(147, 2, 10, 0, 'Mengupdate Orangtua', '2023-08-12 00:58:36', '2023-08-11 17:58:36', '2023-08-11 17:58:36'),
(148, 3, 10, 0, 'Mengakses Halaman Home', '2023-08-12 00:59:02', '2023-08-11 17:59:02', '2023-08-11 17:59:02'),
(149, 3, 10, 0, 'Mengakses Halaman Assessment', '2023-08-12 00:59:08', '2023-08-11 17:59:08', '2023-08-11 17:59:08'),
(150, 2, 10, 0, 'Mengakses Halaman Home', '2023-08-12 00:59:56', '2023-08-11 17:59:56', '2023-08-11 17:59:56'),
(151, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-12 01:00:10', '2023-08-11 18:00:10', '2023-08-11 18:00:10'),
(152, 1, 10, 0, 'Mengakses halaman role', '2023-08-12 01:00:14', '2023-08-11 18:00:14', '2023-08-11 18:00:14'),
(153, 1, 10, 0, 'Mengakses halaman update role', '2023-08-12 01:00:16', '2023-08-11 18:00:16', '2023-08-11 18:00:16'),
(154, 1, 10, 0, 'Berhasil melakukan update data', '2023-08-12 01:00:47', '2023-08-11 18:00:47', '2023-08-11 18:00:47'),
(155, 1, 10, 0, 'Mengakses halaman role', '2023-08-12 01:00:48', '2023-08-11 18:00:48', '2023-08-11 18:00:48'),
(156, 2, 10, 0, 'Mengakses Halaman Home', '2023-08-12 01:00:56', '2023-08-11 18:00:56', '2023-08-11 18:00:56'),
(157, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-12 01:01:27', '2023-08-11 18:01:27', '2023-08-11 18:01:27'),
(158, 1, 10, 0, 'Mengakses halaman role', '2023-08-12 01:01:33', '2023-08-11 18:01:33', '2023-08-11 18:01:33'),
(159, 1, 10, 0, 'Mengakses halaman update role', '2023-08-12 01:01:41', '2023-08-11 18:01:41', '2023-08-11 18:01:41'),
(160, 1, 10, 0, 'Berhasil melakukan update data', '2023-08-12 01:01:50', '2023-08-11 18:01:50', '2023-08-11 18:01:50'),
(161, 1, 10, 0, 'Mengakses halaman role', '2023-08-12 01:01:50', '2023-08-11 18:01:50', '2023-08-11 18:01:50'),
(162, 1, 10, 0, 'Mengakses Halaman Home', '2023-08-12 01:09:19', '2023-08-11 18:09:19', '2023-08-11 18:09:19'),
(163, 1, 10, 0, 'Mengakses halaman Profile', '2023-08-12 01:09:22', '2023-08-11 18:09:22', '2023-08-11 18:09:22'),
(164, 1, 10, 0, 'Mengakses halaman role', '2023-08-12 01:09:26', '2023-08-11 18:09:26', '2023-08-11 18:09:26'),
(165, 4, 10, 1, 'Gagal Mengakses Halaman Home', '2023-08-12 01:10:17', '2023-08-11 18:10:17', '2023-08-11 18:10:17'),
(166, 4, 10, 1, 'Gagal Mengakses Halaman Home', '2023-08-12 01:15:38', '2023-08-11 18:15:38', '2023-08-11 18:15:38'),
(167, 2, 10, 0, 'Mengakses Halaman Home', '2023-08-12 01:15:54', '2023-08-11 18:15:54', '2023-08-11 18:15:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_assessment_log`
--

CREATE TABLE `tbl_assessment_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assessment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `range` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_assessment_log`
--

INSERT INTO `tbl_assessment_log` (`id`, `siswa_id`, `assessment`, `range`, `note`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 'Iqro Jilid 1', '1-2', 'hafal baik', '2023-08-12 00:56:53', '2023-08-11 17:56:53', '2023-08-11 17:56:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_class`
--

CREATE TABLE `tbl_class` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `angkatan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_class`
--

INSERT INTO `tbl_class` (`id`, `angkatan`, `class_name`, `note`, `teacher_id`, `created_at`, `updated_at`) VALUES
(1, '2023', 'VII-A', 'Kelas Tahfidz', 3, '2023-08-11 16:37:03', '2023-08-11 16:37:03'),
(2, '2023', 'VII-B', 'kelas tahfidz', 3, '2023-08-11 17:08:28', '2023-08-11 17:08:28'),
(3, '2023', 'VII-C', 'Kelas Tahfidz', 3, '2023-08-11 17:12:10', '2023-08-11 17:12:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_global_setting`
--

CREATE TABLE `tbl_global_setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `use_log_setting` tinyint(4) NOT NULL DEFAULT 10,
  `use_log_print` tinyint(4) NOT NULL DEFAULT 10,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_iqro`
--

CREATE TABLE `tbl_iqro` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jilid_number` int(11) NOT NULL,
  `total_page` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_iqro`
--

INSERT INTO `tbl_iqro` (`id`, `jilid_number`, `total_page`, `created_at`, `updated_at`) VALUES
(1, 1, 31, '2023-08-11 16:52:25', '2023-08-11 16:52:25'),
(2, 2, 27, '2023-08-11 16:56:56', '2023-08-11 16:56:56'),
(3, 3, 30, '2023-08-11 16:57:16', '2023-08-11 16:57:16'),
(4, 4, 27, '2023-08-11 16:57:31', '2023-08-11 16:57:31'),
(5, 5, 32, '2023-08-11 16:57:51', '2023-08-11 16:57:51'),
(6, 6, 27, '2023-08-11 16:58:12', '2023-08-11 16:58:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notification_type` int(11) NOT NULL,
  `notification_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_notification`
--

INSERT INTO `tbl_notification` (`id`, `notification_type`, `notification_title`, `notification_message`, `date`, `created_at`, `updated_at`) VALUES
(2, 20, 'tes kirim admin/guru', 'tes kirim admin/guru', '2023-08-12 00:32:59', '2023-08-11 17:32:59', '2023-08-11 17:32:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_report_print_log`
--

CREATE TABLE `tbl_report_print_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `print_by` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memorization_type` int(11) NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`id`, `siswa_name`, `memorization_type`, `class_id`, `created_at`, `updated_at`) VALUES
(1, 'ADITYA PRATAMA', 10, 1, '2023-08-11 16:39:10', '2023-08-11 16:39:10'),
(2, 'AINUR FADHILAH', 10, 1, '2023-08-11 16:39:25', '2023-08-11 16:39:25'),
(3, 'AISYAH AL ADAWIYAH', 10, 1, '2023-08-11 16:39:37', '2023-08-11 16:39:37'),
(4, 'ANGGUN ANGGRAINI', 10, 1, '2023-08-11 16:39:55', '2023-08-11 16:39:55'),
(5, 'ANISA NURAULIA', 20, 1, '2023-08-11 16:40:11', '2023-08-11 16:40:11'),
(6, 'AVIV TEGUH PRASETYA', 20, 1, '2023-08-11 16:40:38', '2023-08-11 16:40:38'),
(7, 'DAFFA ABID RIFKI', 20, 1, '2023-08-11 16:41:20', '2023-08-11 16:41:20'),
(8, 'EMELDA JULIANA K', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'FEBRI DHANIANSYAH', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'ISZUKI SEKHA', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'MUHAMAD AL HANIF', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'MUHAMAD RAVA AGUSTIAN A', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'MUHAMMAD ABIL PUTRA', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'MUHAMMAD REZA M', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'NIKITA RAMADANI', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'QORI SAFIRA', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'RAFAEL FERNANDA USMAN', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'RANGGA ADITYA', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'RIFKI SEPTYANA R', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'RIILITA PUTRI FERIANSYAH', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'RINA RAHMA ARYATI', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'SUAINI HUMAIROH', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'SURYANI AYU N', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'ZULKARNAINI', 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'ADITYA MAULANA', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'AFYA YUSHITA KIRANA', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'AHMAD SAMSURI', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'ANANDA FARHAN F', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'ANDRIAN SYAHPUTRA', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'ATHIKA ZHIAN', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'CHIKO BAKHRIANSYAH', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'DISYA RENATA', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'FEBRI ADITYA', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'FURQON NUGRAHA RASYIDIN', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'INDRIANI ROHENDI', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'M.RIDHA PRANACITRA', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'MUHAMAD FAQIH D', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'MUHAMMAD RAMADHANI', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'NAZWAR HARDIANSYAH', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'PIERE ARDAN', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'PRISA ARISTYA', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'RANI TRI PUTRI', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'RESTU ALGRANA T', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'SAFIRA ZZAHRA', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'SATRIA ROUDEN RAMADANI', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'SELVIANAH RAMADHANI', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'TIARA VALESKA', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'ZAHRA ELDA S', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'ZALMA QIESYA AZZAHRA', 20, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'ADITYA PRATAMA', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'AINUR FADHILAH', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'AISYAH AL ADAWIYAH', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'ANGGUN ANGGRAINI', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'ANISA NURAULIA', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'AVIV TEGUH PRASETYA', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'DAFFA ABID RIFKI', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'EMELDA JULIANA K', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'FEBRI DHANIANSYAH', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'ISZUKI SEKHA', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'MUHAMAD AL HANIF', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'MUHAMAD RAVA AGUSTIAN A', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'MUHAMMAD ABIL PUTRA', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'MUHAMMAD REZA M', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'NIKITA RAMADANI', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'QORI SAFIRA', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'RAFAEL FERNANDA USMAN', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'RANGGA ADITYA', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'RIFKI SEPTYANA R', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'RIILITA PUTRI FERIANSYAH', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'RINA RAHMA ARYATI', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'SUAINI HUMAIROH', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'SURYANI AYU N', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'ZULKARNAINI', 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa_has_iqro`
--

CREATE TABLE `tbl_siswa_has_iqro` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `iqro_id` bigint(20) UNSIGNED DEFAULT NULL,
  `siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `page` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_siswa_has_iqro`
--

INSERT INTO `tbl_siswa_has_iqro` (`id`, `iqro_id`, `siswa_id`, `page`, `date`, `note`, `group_page`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2023-08-12 00:56:53', 'hafal baik', '1-2', '2023-08-11 17:56:53', '2023-08-11 17:56:53'),
(2, 1, 1, 2, '2023-08-12 00:56:53', 'hafal baik', '1-2', '2023-08-11 17:56:53', '2023-08-11 17:56:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa_has_parent`
--

CREATE TABLE `tbl_siswa_has_parent` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_siswa_has_parent`
--

INSERT INTO `tbl_siswa_has_parent` (`id`, `parent_id`, `siswa_id`, `created_at`, `updated_at`) VALUES
(2, 4, 1, '2023-08-11 17:58:36', '2023-08-11 17:58:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa_has_surah`
--

CREATE TABLE `tbl_siswa_has_surah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `surah_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ayat` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_ayat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_surah`
--

CREATE TABLE `tbl_surah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `surah_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_ayat` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_surah`
--

INSERT INTO `tbl_surah` (`id`, `surah_name`, `total_ayat`, `created_at`, `updated_at`) VALUES
(1, 'Al-Fatihah', 7, '2023-08-11 17:00:53', '2023-08-11 17:00:53'),
(2, 'Al-Baqaraa', 286, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Aali Imraan', 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'An-Nisaa', 176, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Al-Maaida', 120, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Al-An\'aam', 165, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Al-A\'raaf', 206, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Al-Anfaal', 75, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'At-Tawba', 129, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Yunus', 109, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Hud', 123, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Yusuf', 111, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Ar-Ra\'d', 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Ibrahim', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Al-Hijr', 99, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'An-Nahl', 128, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Al-Israa', 111, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Al-Kahf', 110, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Maryam', 98, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Taa-Haa', 135, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Al-Anbiyaa', 112, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Al-Hajj', 78, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Al-Muminoon', 118, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'An-Noor', 64, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Al-Furqaan', 77, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Ash-Shu\'araa', 227, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'An-Naml', 93, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Al-Qasas', 88, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Al-Ankaboot', 69, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Ar-Room', 60, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Luqman', 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'As-Sajda', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'Al-Ahzaab', 73, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Saba', 54, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Faatir', 45, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Yaseen', 83, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'As-Saaffaat', 182, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Saad', 88, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'Az-Zumar', 75, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'Ghaafir', 85, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'Fussilat', 54, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Ash-Shura', 53, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'Az-Zukhruf', 89, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'Ad-Dukhaan', 59, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'Al-Jaathiya', 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'Al-Ahqaf', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'Muhammad', 38, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'Al-Fath', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'Al-Hujuraat', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'Qaaf', 45, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'Adh-Dhaariyat', 60, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'At-Tur', 49, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'An-Najm', 62, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'Al-Qamar', 55, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'Ar-Rahmaan', 78, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'Al-Waaqia', 96, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'Al-Hadid', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'Al-Mujaadila', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'Al-Hashr', 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'Al-Mumtahana', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'As-Saff', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'Al-Jumu\'a', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'Al-Munaafiqoon', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'At-Taghaabun', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'At-Talaaq', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'At-Tahrim', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'Al-Mulk', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'Al-Qalam', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'Al-Haaqqa', 52, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'Al-Ma\'aarij', 44, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'Nooh', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'Al-Jinn', 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'Al-Muzzammil', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Al-Muddaththir', 56, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'Al-Qiyaama', 40, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'Al-Insaan', 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'Al-Mursalaat', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'An-Naba', 40, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'An-Naazi\'aat', 46, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'Abasa', 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'At-Takwir', 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'Al-Infitaar', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'Al-Mutaffifin', 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'Al-Inshiqaaq', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'Al-Burooj', 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'At-Taariq', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'Al-A\'laa', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'Al-Ghaashiya', 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'Al-Fajr', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'Al-Balad', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'Ash-Shams', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'Al-Lail', 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Ad-Dhuhaa', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Ash-Sharh', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'At-Tin', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Al-Alaq', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'Al-Qadr', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'Al-Bayyina', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'Az-Zalzala', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'Al-Aadiyaat', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'Al-Qaari\'a', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'At-Takaathur', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'Al-Asr', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'Al-Humaza', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'Al-Fil', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'Quraish', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'Al-Maa\'un', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'Al-Kawthar', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'Al-Kaafiroon', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'An-Nasr', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'Al-Masad', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'Al-Ikhlaas', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'Al-Falaq', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'An-Naas', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_system_log`
--

CREATE TABLE `tbl_system_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_type` tinyint(4) NOT NULL DEFAULT 10,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `address`, `full_name`, `profile_picture`, `account_type`, `password`, `status`, `email`, `email_verified_at`, `remember_token`, `last_login_at`, `last_login_ip`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', NULL, 'Super Admin', '1691771219.jpg', 10, '$2y$10$i5uzbY6sO.lLFKLPk3uon.PM7pjeJWTC8IPqFANNO1hi3gse8i.B6', 10, 'admin@gmail.com', NULL, NULL, NULL, NULL, '2023-08-11 16:15:48', '2023-08-11 16:30:07'),
(2, 'admin', NULL, 'Admin', NULL, 20, '$2y$10$Rhma2R71VjRboSSo6psZYORAi.zLuSFujJZURxEuNde1zLYXYPGJO', 10, 'alimochtar78.id@gmail.com', NULL, NULL, NULL, NULL, '2023-08-11 16:32:37', '2023-08-11 17:26:18'),
(3, 'guru', NULL, 'Abdul Muin LC', NULL, 40, '$2y$10$5WdiPR3BbEXbVBX5qzG44eyn6w.1oQ2OJGEAttq1URuVXeolOR97a', 10, 'guru@guru.com', NULL, NULL, NULL, NULL, '2023-08-11 16:33:18', '2023-08-11 16:35:42'),
(4, 'hafa', 'Cilegon', 'Hafa Tarmizi', NULL, 30, '$2y$10$xC21cXMWW3sG7mx9.2JH0O.ExGtDFTCHPP4MKyPG64I5UuqMj1LuW', 10, 'hafa@gmail.com', NULL, NULL, NULL, NULL, '2023-08-11 16:42:17', '2023-08-11 16:43:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_login_history`
--

CREATE TABLE `tbl_user_login_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_user_login_history`
--

INSERT INTO `tbl_user_login_history` (`id`, `user_id`, `last_login_ip`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', '2023-08-11 23:28:05', '2023-08-11 16:28:05', '2023-08-11 16:28:05'),
(2, 1, '127.0.0.1', '2023-08-11 23:31:05', '2023-08-11 16:31:05', '2023-08-11 16:31:05'),
(3, 1, '127.0.0.1', '2023-08-11 23:42:59', '2023-08-11 16:42:59', '2023-08-11 16:42:59'),
(4, 2, '127.0.0.1', '2023-08-11 23:44:17', '2023-08-11 16:44:17', '2023-08-11 16:44:17'),
(5, 3, '127.0.0.1', '2023-08-11 23:44:52', '2023-08-11 16:44:52', '2023-08-11 16:44:52'),
(6, 1, '127.0.0.1', '2023-08-11 23:46:49', '2023-08-11 16:46:49', '2023-08-11 16:46:49'),
(7, 1, '127.0.0.1', '2023-08-12 00:25:52', '2023-08-11 17:25:52', '2023-08-11 17:25:52'),
(8, 4, '127.0.0.1', '2023-08-12 00:30:43', '2023-08-11 17:30:43', '2023-08-11 17:30:43'),
(9, 1, '127.0.0.1', '2023-08-12 00:31:19', '2023-08-11 17:31:19', '2023-08-11 17:31:19'),
(10, 2, '127.0.0.1', '2023-08-12 00:33:18', '2023-08-11 17:33:18', '2023-08-11 17:33:18'),
(11, 1, '127.0.0.1', '2023-08-12 00:35:09', '2023-08-11 17:35:09', '2023-08-11 17:35:09'),
(12, 4, '127.0.0.1', '2023-08-12 00:36:15', '2023-08-11 17:36:15', '2023-08-11 17:36:15'),
(13, 1, '127.0.0.1', '2023-08-12 00:46:27', '2023-08-11 17:46:27', '2023-08-11 17:46:27'),
(14, 4, '127.0.0.1', '2023-08-12 00:57:12', '2023-08-11 17:57:12', '2023-08-11 17:57:12'),
(15, 2, '127.0.0.1', '2023-08-12 00:57:44', '2023-08-11 17:57:44', '2023-08-11 17:57:44'),
(16, 3, '127.0.0.1', '2023-08-12 00:59:01', '2023-08-11 17:59:01', '2023-08-11 17:59:01'),
(17, 2, '127.0.0.1', '2023-08-12 00:59:56', '2023-08-11 17:59:56', '2023-08-11 17:59:56'),
(18, 1, '127.0.0.1', '2023-08-12 01:00:10', '2023-08-11 18:00:10', '2023-08-11 18:00:10'),
(19, 2, '127.0.0.1', '2023-08-12 01:00:56', '2023-08-11 18:00:56', '2023-08-11 18:00:56'),
(20, 1, '127.0.0.1', '2023-08-12 01:01:27', '2023-08-11 18:01:27', '2023-08-11 18:01:27'),
(21, 1, '127.0.0.1', '2023-08-12 01:09:19', '2023-08-11 18:09:19', '2023-08-11 18:09:19'),
(22, 4, '127.0.0.1', '2023-08-12 01:10:17', '2023-08-11 18:10:17', '2023-08-11 18:10:17'),
(23, 2, '127.0.0.1', '2023-08-12 01:15:54', '2023-08-11 18:15:54', '2023-08-11 18:15:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_notification`
--

CREATE TABLE `tbl_user_notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notification_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_user_notification`
--

INSERT INTO `tbl_user_notification` (`id`, `user_id`, `notification_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 20, '2023-08-11 17:32:59', '2023-08-11 17:57:55'),
(2, 3, 2, 20, '2023-08-11 17:32:59', '2023-08-11 17:59:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_token`
--

CREATE TABLE `tbl_user_token` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_expired` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `tbl_action_log`
--
ALTER TABLE `tbl_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_action_log_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `tbl_assessment_log`
--
ALTER TABLE `tbl_assessment_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_assessment_log_siswa_id_foreign` (`siswa_id`);

--
-- Indeks untuk tabel `tbl_class`
--
ALTER TABLE `tbl_class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_class_teacher_id_foreign` (`teacher_id`);

--
-- Indeks untuk tabel `tbl_global_setting`
--
ALTER TABLE `tbl_global_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_iqro`
--
ALTER TABLE `tbl_iqro`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_report_print_log`
--
ALTER TABLE `tbl_report_print_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_report_print_log_print_by_foreign` (`print_by`);

--
-- Indeks untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_siswa_class_id_foreign` (`class_id`);

--
-- Indeks untuk tabel `tbl_siswa_has_iqro`
--
ALTER TABLE `tbl_siswa_has_iqro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_siswa_has_iqro_siswa_id_foreign` (`siswa_id`),
  ADD KEY `tbl_siswa_has_iqro_iqro_id_foreign` (`iqro_id`);

--
-- Indeks untuk tabel `tbl_siswa_has_parent`
--
ALTER TABLE `tbl_siswa_has_parent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_siswa_has_parent_parent_id_foreign` (`parent_id`),
  ADD KEY `tbl_siswa_has_parent_siswa_id_foreign` (`siswa_id`);

--
-- Indeks untuk tabel `tbl_siswa_has_surah`
--
ALTER TABLE `tbl_siswa_has_surah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_siswa_has_surah_siswa_id_foreign` (`siswa_id`),
  ADD KEY `tbl_siswa_has_surah_surah_id_foreign` (`surah_id`);

--
-- Indeks untuk tabel `tbl_surah`
--
ALTER TABLE `tbl_surah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_system_log`
--
ALTER TABLE `tbl_system_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_system_log_user_id_unique` (`user_id`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_user_email_unique` (`email`);

--
-- Indeks untuk tabel `tbl_user_login_history`
--
ALTER TABLE `tbl_user_login_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_user_login_history_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `tbl_user_notification`
--
ALTER TABLE `tbl_user_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_user_notification_user_id_foreign` (`user_id`),
  ADD KEY `tbl_user_notification_notification_id_foreign` (`notification_id`);

--
-- Indeks untuk tabel `tbl_user_token`
--
ALTER TABLE `tbl_user_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_user_token_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_action_log`
--
ALTER TABLE `tbl_action_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT untuk tabel `tbl_assessment_log`
--
ALTER TABLE `tbl_assessment_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_class`
--
ALTER TABLE `tbl_class`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_global_setting`
--
ALTER TABLE `tbl_global_setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_iqro`
--
ALTER TABLE `tbl_iqro`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_report_print_log`
--
ALTER TABLE `tbl_report_print_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT untuk tabel `tbl_siswa_has_iqro`
--
ALTER TABLE `tbl_siswa_has_iqro`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_siswa_has_parent`
--
ALTER TABLE `tbl_siswa_has_parent`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_siswa_has_surah`
--
ALTER TABLE `tbl_siswa_has_surah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_surah`
--
ALTER TABLE `tbl_surah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT untuk tabel `tbl_system_log`
--
ALTER TABLE `tbl_system_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_user_login_history`
--
ALTER TABLE `tbl_user_login_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tbl_user_notification`
--
ALTER TABLE `tbl_user_notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_user_token`
--
ALTER TABLE `tbl_user_token`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_action_log`
--
ALTER TABLE `tbl_action_log`
  ADD CONSTRAINT `tbl_action_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `tbl_assessment_log`
--
ALTER TABLE `tbl_assessment_log`
  ADD CONSTRAINT `tbl_assessment_log_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `tbl_siswa` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `tbl_class`
--
ALTER TABLE `tbl_class`
  ADD CONSTRAINT `tbl_class_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_report_print_log`
--
ALTER TABLE `tbl_report_print_log`
  ADD CONSTRAINT `tbl_report_print_log_print_by_foreign` FOREIGN KEY (`print_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD CONSTRAINT `tbl_siswa_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `tbl_class` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_siswa_has_iqro`
--
ALTER TABLE `tbl_siswa_has_iqro`
  ADD CONSTRAINT `tbl_siswa_has_iqro_iqro_id_foreign` FOREIGN KEY (`iqro_id`) REFERENCES `tbl_iqro` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tbl_siswa_has_iqro_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `tbl_siswa` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `tbl_siswa_has_parent`
--
ALTER TABLE `tbl_siswa_has_parent`
  ADD CONSTRAINT `tbl_siswa_has_parent_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_siswa_has_parent_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `tbl_siswa` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_siswa_has_surah`
--
ALTER TABLE `tbl_siswa_has_surah`
  ADD CONSTRAINT `tbl_siswa_has_surah_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `tbl_siswa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tbl_siswa_has_surah_surah_id_foreign` FOREIGN KEY (`surah_id`) REFERENCES `tbl_surah` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `tbl_system_log`
--
ALTER TABLE `tbl_system_log`
  ADD CONSTRAINT `tbl_system_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_user_login_history`
--
ALTER TABLE `tbl_user_login_history`
  ADD CONSTRAINT `tbl_user_login_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_user_notification`
--
ALTER TABLE `tbl_user_notification`
  ADD CONSTRAINT `tbl_user_notification_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `tbl_notification` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tbl_user_notification_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `tbl_user_token`
--
ALTER TABLE `tbl_user_token`
  ADD CONSTRAINT `tbl_user_token_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
