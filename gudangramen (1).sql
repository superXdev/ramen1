-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Nov 2020 pada 07.28
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gudangramen`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fakturs`
--

CREATE TABLE `fakturs` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `namaPengirim` varchar(255) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `outlet_id` varchar(255) NOT NULL,
  `diskon` int(11) DEFAULT NULL,
  `retur` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fakturs`
--

INSERT INTO `fakturs` (`id`, `slug`, `namaPengirim`, `invoice`, `outlet_id`, `diskon`, `retur`, `total`, `created_at`, `updated_at`) VALUES
(28, '31-rcAAPunv1i', '', '001/ADS/XI/2020', '31', NULL, NULL, NULL, '2020-11-25 23:00:26', '2020-11-25 23:00:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `faktur_barangs`
--

CREATE TABLE `faktur_barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faktur_id` varchar(244) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `jumlah_harga` int(11) NOT NULL,
  `HPP` int(11) NOT NULL,
  `laba` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `faktur_barangs`
--

INSERT INTO `faktur_barangs` (`id`, `faktur_id`, `barang_id`, `qty`, `jumlah_harga`, `HPP`, `laba`, `created_at`, `updated_at`) VALUES
(13, '001/ADS/XI/2020', 1, 2, 47000, 0, 0, '2020-11-25 23:00:26', '2020-11-25 23:00:26'),
(14, '001/ADS/XI/2020', 4, 0, 100000, 0, 0, '2020-11-25 23:00:26', '2020-11-25 23:00:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `goods`
--

CREATE TABLE `goods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kodeBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hargaModal` int(11) NOT NULL,
  `stok` int(11) DEFAULT 0,
  `minStok` int(11) NOT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `goods`
--

INSERT INTO `goods` (`id`, `slug`, `kodeBarang`, `namaBarang`, `hargaModal`, `stok`, `minStok`, `satuan`, `created_at`, `updated_at`) VALUES
(1, 'telur-ayam-hjBekIy5Vn', 'TA-111', 'Telur Ayam', 20800, 0, 10, 'KG', '2020-11-12 00:56:58', '2020-11-12 00:56:58'),
(2, 'minyak-goreng-dus-5eOYof2vYc', 'MG-0001', 'Minyak Goreng Dus', 146000, 0, 10, 'DUS', '2020-11-12 00:58:36', '2020-11-12 01:02:03'),
(3, 'beras-6qxSJMMrvA', 'B-0001', 'Beras', 260000, 0, 10, 'KARUNG', '2020-11-12 00:59:23', '2020-11-12 00:59:23'),
(4, 'minyak-goreng-liter-Gq2YL4A01J', 'MG-0002', 'Minyak Goreng Liter', 23500, 0, 10, 'LITER', '2020-11-12 01:04:26', '2020-11-12 01:04:26'),
(5, 'naget-BBoUUUGAuz', 'no0', 'naget', 10000, 200, 15, 'pack', '2020-11-12 02:07:26', '2020-11-12 02:07:26'),
(6, 'kopi-luwah=-VABKqZ82MJ', 'mk-01', 'kopi luwah=', 20000, 200, 3, 'Kg', '2020-11-14 22:37:00', '2020-11-14 22:37:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `goods_first_stocks`
--

CREATE TABLE `goods_first_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stokAwal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `goods_first_stocks`
--

INSERT INTO `goods_first_stocks` (`id`, `goods_id`, `keterangan`, `stokAwal`, `created_at`, `updated_at`) VALUES
(1, 5, 'ok', 100, '2020-11-12 02:07:46', '2020-11-12 02:07:46'),
(2, 6, 'k', 200, '2020-11-14 22:37:11', '2020-11-14 22:37:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `goods_prices`
--

CREATE TABLE `goods_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  `jenisOutlet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hargaJual` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `goods_prices`
--

INSERT INTO `goods_prices` (`id`, `goods_id`, `jenisOutlet`, `hargaJual`, `created_at`, `updated_at`) VALUES
(1, 1, 'ramen', 23500, '2020-11-12 01:00:02', '2020-11-12 01:00:02'),
(2, 1, 'nasiGoreng', 24800, '2020-11-12 01:00:14', '2020-11-12 01:00:14'),
(3, 1, 'martabak', 23500, '2020-11-12 01:00:38', '2020-11-12 01:00:38'),
(4, 2, 'martabak', 160000, '2020-11-12 01:03:49', '2020-11-12 01:03:49'),
(5, 4, 'ramen', 25000, '2020-11-12 01:04:41', '2020-11-12 01:04:41'),
(6, 3, 'ramen', 270000, '2020-11-12 02:08:47', '2020-11-12 02:08:47'),
(7, 3, 'nasiGoreng', 280000, '2020-11-12 02:09:09', '2020-11-12 02:09:09'),
(8, 6, 'kopi', 2000, '2020-11-14 22:37:22', '2020-11-14 22:37:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `goods_stocks`
--

CREATE TABLE `goods_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  `namaPengirim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaPenerima` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stokMasuk` int(11) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `goods_stocks`
--

INSERT INTO `goods_stocks` (`id`, `goods_id`, `namaPengirim`, `namaPenerima`, `stokMasuk`, `keterangan`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 5, 'pabrik telor', 'sodik', 100, 'tambahin ok', 1, '2020-11-12 02:11:08', '2020-11-12 02:11:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_09_26_202453_create_sessions_table', 1),
(7, '2020_11_04_225439_create_outlets_table', 2),
(8, '2020_11_05_234757_create_goods_table', 3),
(9, '2020_11_07_024954_create_goods_prices_table', 4),
(10, '2020_11_07_224934_create_goods_stocks_table', 5),
(11, '2020_11_07_230259_create_goods_first_stocks_table', 5),
(12, '2020_11_14_150419_create_faktur_barangs_table', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlets`
--

CREATE TABLE `outlets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kodeOutlet` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaOutlet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` bigint(20) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'aktif',
  `jenisOutlet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `outlets`
--

INSERT INTO `outlets` (`id`, `slug`, `kodeOutlet`, `namaOutlet`, `alamat`, `telepon`, `status`, `jenisOutlet`, `created_at`, `updated_at`) VALUES
(1, 'sensei-ramen-ciwastra-R0gW9', 'MM-1111', 'Sensei Ramen ciwastra', 'Jl.Margacinta No.120\n', 87546211113, 'nonaktif', 'ramen', '2020-11-12 00:40:17', '2020-11-12 02:05:17'),
(2, 'sensei-ramen-ujung-berung-ulerZ', 'MM-1112', 'Sensei Ramen ujung berung', 'Jl.Rumah sakit No.57\n', 8921231312, 'aktif', 'ramen', '2020-11-12 00:40:38', '2020-11-12 00:40:38'),
(3, 'sensei-ramen-gunung-batu-vrybc', 'MM-1113', 'Sensei Ramen gunung batu', 'Jl. Gunung batu No.14\n', 8646322333, 'aktif', 'ramen', '2020-11-12 00:41:01', '2020-11-12 00:41:01'),
(4, 'sensei-ramen-moch-toha-D2aw9', 'MM-1114', 'Sensei Ramen Moch toha', 'Jl.Moch toha No.105\n', 891231312, 'aktif', 'ramen', '2020-11-12 00:41:25', '2020-11-12 00:41:25'),
(5, 'shinju-ramen-kopo-vEcVu', 'MM-1115', 'Shinju Ramen Kopo', 'Jl.Sukamenak No.55 B\n', 908901, 'aktif', 'ramen', '2020-11-12 00:42:03', '2020-11-12 00:42:03'),
(6, 'shinju-ramen-bojongsoang-ji3H0', 'MM-1116', 'Shinju Ramen bojongsoang', 'Jl.Bojongsoang No.245\n', 8091311, 'aktif', 'ramen', '2020-11-12 00:42:41', '2020-11-12 00:42:41'),
(7, 'shinju-ramen-cimareme-K7liH', 'MM-1117', 'Shinju Ramen Cimareme', 'Jl. Raya Cimareme\n', 7131239129, 'aktif', 'ramen', '2020-11-12 00:43:01', '2020-11-12 00:43:01'),
(8, 'shinju-ramen-padalarang-eANhw', 'MM-1118', 'Shinju Ramen Padalarang', 'Jl.Raya padalarang kertamulya\n', 81912313, 'aktif', 'ramen', '2020-11-12 00:43:22', '2020-11-12 00:43:22'),
(9, 'shinju-ramen-cicalengka-ecAmN', 'MM-1119', 'Shinju ramen cicalengka', 'Jl.Raya barat cicalengka No.167\n', 9801389018, 'aktif', 'ramen', '2020-11-12 00:43:43', '2020-11-12 00:43:43'),
(10, 'shinju-ramen-tki-vJrW8', 'MM-11110', 'Shinju Ramen Tki', 'Jl. Taman Kopo Indah 2 No.64\n', 809123131, 'aktif', 'ramen', '2020-11-12 00:44:08', '2020-11-12 00:44:08'),
(11, 'shifu-ramen-cimahi-51RM8', 'MM-11111', 'Shifu Ramen cimahi', 'Jl.Encepkartawiria NO.214\n', 90213131, 'aktif', 'ramen', '2020-11-12 00:44:30', '2020-11-12 00:44:30'),
(12, 'shifu-ramen-antapani-Xr8Go', 'MM-11112', 'Shifu Ramen antapani', 'Jl.Purwakarta NO.33\n', 12321317, 'aktif', 'ramen', '2020-11-12 00:44:49', '2020-11-12 00:44:49'),
(13, 'shifu-ramen-suci-lU3X3', 'MM-11113', 'Shifu Ramen suci', 'Jl.P.H.H Mustofa No.96\n', 1913131, 'aktif', 'ramen', '2020-11-12 00:45:20', '2020-11-12 00:45:20'),
(14, 'shifu-ramen-gatsu-zGxxE', 'MM-11114', 'Shifu Ramen gatsu', 'Jl.Gatot subroto No.216\n', 91231318, 'aktif', 'ramen', '2020-11-12 00:45:39', '2020-11-12 00:45:39'),
(15, 'shifu-ramen-cibiru-76w3H', 'MM-11115', 'Shifu Ramen cibiru', 'Jl.A.H Nasution N0.252\n', 9128309819, 'aktif', 'ramen', '2020-11-12 00:45:58', '2020-11-12 00:45:58'),
(16, 'shifu-ramen-katamso-FO3nW', 'MM-11116', 'Shifu Ramen Katamso', 'Jl.Brigjen katamso No.43\n', 131883910, 'aktif', 'ramen', '2020-11-12 00:46:33', '2020-11-12 00:46:33'),
(17, 'mie-jebred-ahmad-yani-cbtJy', 'MM-11117', 'Mie Jebred Ahmad yani', 'Jl.Jendral Ahmad yani No.700\n', 183213771, 'aktif', 'ramen', '2020-11-12 00:46:57', '2020-11-12 00:46:57'),
(18, 'mie-jebred-lembang-JU7sz', 'MM-11118', 'Mie Jebred Lembang', 'JL.cijeruk No.1\n', 891231311, 'aktif', 'ramen', '2020-11-12 00:47:17', '2020-11-12 00:47:17'),
(19, 'shoji-ramen-cijerah-tyXxw', 'MM-11119', 'Shoji Ramen cijerah', 'Jl. Melong,Kec.Cimahi Selatan\n', 123712838, 'aktif', 'ramen', '2020-11-12 00:47:40', '2020-11-12 00:47:40'),
(20, 'giant-ramen-bogor-zLiyx', 'MM-11120', 'Giant Ramen Bogor', 'JL.Raya ciawi – cianjur No.372\n', 8138913891, 'aktif', 'ramen', '2020-11-12 00:48:04', '2020-11-12 00:48:04'),
(21, 'ramen-bajuri-lengkong-n9haw', 'MM-11121', 'Ramen Bajuri Lengkong', 'Jl.Sasak gantung No.90\n', 9803101809, 'aktif', 'ramen', '2020-11-12 00:48:29', '2020-11-12 00:48:29'),
(22, 'ramen-bajuri-andir-8Wq0v', 'MM-11121', 'Ramen Bajuri Andir', 'Jl.Kebonjati N0.254b\n', 791893810, 'aktif', 'ramen', '2020-11-12 00:48:55', '2020-11-12 00:48:55'),
(23, 'ramen-bajuri-burangrang-Ib10Z', 'MM-11123', 'Ramen Bajuri Burangrang', 'Jl.Emong No.58\n', 801928103, 'aktif', 'ramen', '2020-11-12 00:49:13', '2020-11-12 00:49:13'),
(24, 'ramen-bajuri-soreang-wpHNX', 'MM-11124', 'Ramen Bajuri Soreang', 'Jl.Sukaramai\n', 918023810, 'aktif', 'ramen', '2020-11-12 00:49:50', '2020-11-12 00:49:50'),
(25, 'ramen-bajuri-derwati-p7Jgi', 'MM-11125', 'Ramen Bajuri Derwati', 'Jl.Derwati No.46\n', 912839018, 'aktif', 'ramen', '2020-11-12 00:50:14', '2020-11-12 00:50:14'),
(26, 'ramen-bajuri-rencong-ePMLE', 'MM-11126', 'Ramen Bajuri rencong', 'Jl.Raya banjaran N0.226\n', 801923091, 'aktif', 'ramen', '2020-11-12 00:50:54', '2020-11-12 00:50:54'),
(27, 'ramen-bajuri-jatinangor-QUQ1y', 'MM-11127', 'Ramen Bajuri Jatinangor', 'Jl.Raya Cirebon No.243\n', 981092831098, 'aktif', 'ramen', '2020-11-12 00:51:12', '2020-11-12 00:51:12'),
(28, 'ramen-bajuri-lembang-ASu41', 'MM-11128', 'Ramen Bajuri Lembang', 'Jl.Mama adiwarta lembang\n', 9089081, 'aktif', 'ramen', '2020-11-12 00:51:28', '2020-11-12 00:51:28'),
(29, 'ramen-bajuri-buah-batu-ZXLmp', 'MM-11129', 'Ramen Bajuri Buah Batu', 'Jl.Buah batu No.184\n', 9128013808, 'aktif', 'ramen', '2020-11-12 00:51:43', '2020-11-12 00:51:43'),
(30, 'kedai-mamah-legend-gerlong-ggtTV', 'MM-11130', 'Kedai Mamah Legend gerlong', 'Jl.Gegerkalong girang No.83\n', 9812788098, 'aktif', 'ramen', '2020-11-12 00:51:59', '2020-11-12 00:51:59'),
(31, 'enkopp-fika-lembang-Jd13Y', 'MM-11131', 'Enkopp Fika Lembang', 'Jl.Grand hotel No.36\n', 918039810983, 'aktif', 'ramen', '2020-11-12 00:52:41', '2020-11-12 00:52:41'),
(32, 'kopipanji-SyTVF', 'MM-001223', 'kopipanji', 'ksjfklsj', 90809890, 'aktif', 'kopi', '2020-11-14 22:36:18', '2020-11-14 22:36:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rBHxCOQmG4RL8y0QvaBKEDh04IZnEZR0pjzpQoHH', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiNnZNUldkTXpnRDRNZHRVTndoTzRSRUhUSWFJdDhUQUxGT3pzNG1xQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZmFrdHVyIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJEFFVjBLNTZKREdTQzhUZHEwRi5vUi5QZGxvZGcyVS5VUTFMeXNCNkFFQUEzV1JTbmVZQlZhIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRBRVYwSzU2SkRHU0M4VGRxMEYub1IuUGRsb2RnMlUuVVExTHlzQjZBRUFBM1dSU25lWUJWYSI7fQ==', 1606315652);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `jumlahMaterial` int(11) DEFAULT NULL,
  `satuanHarga` int(11) DEFAULT NULL,
  `jumlahHarga` int(11) DEFAULT NULL,
  `satuan` varchar(244) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tests`
--

INSERT INTO `tests` (`id`, `jumlahMaterial`, `satuanHarga`, `jumlahHarga`, `satuan`, `updated_at`, `created_at`) VALUES
(1, 9, 9, 81, 'oko', '2020-11-25 22:25:09', '2020-11-25 22:25:09'),
(2, 8, 8, 64, 'ofdsok', '2020-11-25 22:25:09', '2020-11-25 22:25:09'),
(3, 9, 7, 63, 'kdsj', '2020-11-25 22:25:09', '2020-11-25 22:25:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Diaz', 'admin@mail.com', NULL, '$2y$10$AEV0K56JDGSC8Tdq0F.oR.Pdlodg2U.UQ1LysB6AEAA3WRSneYBVa', NULL, NULL, 'WYO6MTuc0aPSTOWrYIv3Ce48CQEQ1sPf8TbOVI2wpEsqrL87wB1HPCfn6hgu', NULL, NULL, '2020-11-03 15:30:01', '2020-11-03 15:30:01');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `fakturs`
--
ALTER TABLE `fakturs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `faktur_barangs`
--
ALTER TABLE `faktur_barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `goods_first_stocks`
--
ALTER TABLE `goods_first_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `goods_prices`
--
ALTER TABLE `goods_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `goods_stocks`
--
ALTER TABLE `goods_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `outlets`
--
ALTER TABLE `outlets`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fakturs`
--
ALTER TABLE `fakturs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `faktur_barangs`
--
ALTER TABLE `faktur_barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `goods`
--
ALTER TABLE `goods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `goods_first_stocks`
--
ALTER TABLE `goods_first_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `goods_prices`
--
ALTER TABLE `goods_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `goods_stocks`
--
ALTER TABLE `goods_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `outlets`
--
ALTER TABLE `outlets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
