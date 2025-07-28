-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 28 Jul 2025 pada 16.56
-- Versi server: 11.4.7-MariaDB-cll-lve
-- Versi PHP: 8.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apln4872_kegiatanpkl`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'dosen', 'dosen');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kegiatan_pkl`
--

CREATE TABLE `kegiatan_pkl` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nohp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL,
  `dosenpembimbing` varchar(100) DEFAULT NULL,
  `pembimbinglapangan` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `file_pdf` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kegiatan_pkl`
--

INSERT INTO `kegiatan_pkl` (`id`, `nama`, `nohp`, `email`, `tanggal`, `prodi`, `dosenpembimbing`, `pembimbinglapangan`, `keterangan`, `file_pdf`) VALUES
(7, 'kardo', '0811223311', 'kardo@gmail.com', '2025-07-01', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'kumpul', 'uploads/6863fa80ecbc8_Full Book Konsep E-Bisnis.pdf'),
(8, 'sanjaya sinaga', '08223824823727', 'sanjay@gmail.com', '2025-05-15', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Andre Purba, S.T', 'Emmbuat Dokumen Bulanan', 'uploads/6867dc72d0a7c_KARDO_SANJAYA_SINAGA.pdf'),
(9, 'gibrona', '0813658564785', 'gibrona@gmail.com', '2025-07-23', 'Teknik Informatika (S1)', 'Roberto Kaban, M.kom', 'Andre Purba, S.T', 'perkenalan lingkungan ', 'uploads/68777bdf4b93f_Struktur_Dasar_HTML_Jaya__1_.pdf'),
(10, 'Sanjaya ', '62356', 'kwkwke@gmail.com', '2025-07-15', 'Rekayasa Perangkat Lunak (S1)', 'Roberto Kaban, M.kom', 'Andre Purba, S.T', 'wkkw', 'uploads/6878e0c1c831c_simpanCETAK_KARTU_UJIAN_22100055.pdf'),
(11, 'ari', '154349', 'ari@gmail.com', '2025-07-14', 'Teknik Informatika (S1)', 'Roberto Kaban, M.kom', 'Andre Purba, S.T', 'wjwjwk', 'uploads/6878e16019ac2_simpanCETAK_KARTU_UJIAN_22100055.pdf'),
(12, 'samuel', '82356987946', 'samuel@gmail.com', '2025-07-17', 'Teknik Informatika (S1)', 'Polin, MM', 'Andre Purba, S.T', 'melakukan senam pagi', 'uploads/6878e2377bd11_laporan_kardo__13_Desember_.pdf'),
(13, 'kardo sanjaya sinaga', '3456789', 'sanjaya@gmail.com', '2025-07-22', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'membuat laporan bulanan', 'uploads/68862235e56ff_KARDO_SANJAYA_SINAGA.pdf'),
(14, 'sanjaya', '076234567890976', 'jaya@gmail.com', '2025-07-25', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'asdfghjk', 'uploads/6886230f33ed1_KARDO_SANJAYA_SINAGA.pdf'),
(15, 'sanjaya', '076234567890976', 'jaya@gmail.com', '2025-07-25', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'asdfghjk', 'uploads/6886231e3702a_KARDO_SANJAYA_SINAGA.pdf'),
(16, 'sanjaya', '076234567890976', 'jaya@gmail.com', '2025-07-25', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'asdfghjk', 'uploads/68862324abcdc_KARDO_SANJAYA_SINAGA.pdf'),
(17, 'sanjaya', '076234567890976', 'jaya@gmail.com', '2025-07-25', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'asdfghjk', 'uploads/688623285319c_KARDO_SANJAYA_SINAGA.pdf'),
(18, 'sanjaya', '076234567890976', 'jaya@gmail.com', '2025-07-25', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'asdfghjk', 'uploads/6886233188a42_KARDO_SANJAYA_SINAGA.pdf'),
(19, 'sanjaya', '076234567890976', 'jaya@gmail.com', '2025-07-25', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'asdfghjk', 'uploads/6886233597e9a_KARDO_SANJAYA_SINAGA.pdf'),
(20, 'sanjaya', '076234567890976', 'jaya@gmail.com', '2025-07-25', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'asdfghjk', 'uploads/6886233fcf42e_KARDO_SANJAYA_SINAGA.pdf'),
(21, 'sanjaya', '076234567890976', 'jaya@gmail.com', '2025-07-25', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'asdfghjk', 'uploads/6886234056a3b_KARDO_SANJAYA_SINAGA.pdf'),
(22, 'sanjaya', '076234567890976', 'jaya@gmail.com', '2025-07-25', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'asdfghjk', 'uploads/688623439cf92_KARDO_SANJAYA_SINAGA.pdf'),
(23, 'sanjaya', '076234567890976', 'jaya@gmail.com', '2025-07-25', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'asdfghjk', 'uploads/688623475c17b_KARDO_SANJAYA_SINAGA.pdf'),
(24, 'zul', '0764567890', 'sanjaya@gmail.com', '2025-07-22', 'Sistem Informasi (S1)', 'Polin, MM', 'Andre Purba, S.T', 'ghdjklsdv', 'uploads/688623bde1bd7_GABRIELLA.pdf'),
(25, 'aini', '3456789', 'ainj@gmail.com', '2025-07-14', 'Teknologi Informasi (S1)', 'Roberto Kaban, M.kom', 'Marlina Hutapea, S.E', 'dsjklas', 'uploads/6886249710206_PUTRI_YANTI.pdf'),
(26, 'kardo sinaga', '0822236061860', 'kardo@gmail.com', '2025-07-22', 'Sistem Informasi (S1)', 'Roberto Kaban, M.kom', 'Andre Purba, S.T', 'membuat laporan kahir pkl', 'uploads/6886262f234b8_KARDO_SANJAYA_SINAGA.pdf');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kegiatan_pkl`
--
ALTER TABLE `kegiatan_pkl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kegiatan_pkl`
--
ALTER TABLE `kegiatan_pkl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
