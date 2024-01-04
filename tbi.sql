-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 02 Jan 2024 pada 19.34
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tbi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data`
--

CREATE TABLE `data` (
  `index` int(10) NOT NULL,
  `soal` varchar(600) NOT NULL,
  `jawaban` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data`
--

INSERT INTO `data` (`index`, `soal`, `jawaban`) VALUES
(1, 'Apa yang dimaksud dengan Symmetric clustering ?\na) Semua N host menjalankan aplikasi\nb) Semua N host dalam keadaan standby\nc) Satu server menjalankan aplikasi sementara server lain standby \nd) server menjalankan semua aplikasi', '(a) Semua N host menjalankan aplikasi. Jawaban ini benar karena dalam symmetric clustering, semua host dalam cluster memiliki peran yang sama, yaitu dapat menjalankan aplikasi.'),
(2, 'Berikut adalah contoh sistem operasi yang bersifat monolitik, kecuali:\r\nA. MS-DOS\r\nB. Linux\r\nC. Unix\r\nD. Windows', 'a. MS-DOS'),
(3, 'Model sistem operasi yang memisahkan antara fungsi inti sistem operasi dengan fungsi-fungsi lainnya disebut sebagai:\r\nA. Model monolitik\r\nB. Model berlapis\r\nC. Model modular\r\nD. Model terdistribusi', 'c. Model Modular'),
(4, 'Apa yang dimaksud dengan sistem operasi?\n\na. Perangkat keras komputer\nb. Perangkat lunak aplikasi\nc. Antarmuka pengguna\nd. Perangkat lunak sistem', 'd. Perangkat lunak sistem'),
(5, 'Apa fungsi utama dari manajer memori dalam sistem operasi?\n\na. Mengelola file sistem\nb. Mengelola perangkat keras\nc. Mengelola memori\nd. Mengelola jaringan', 'c. Mengelola memori'),
(6, 'Apa itu deadlock dalam sistem operasi?\r\n\r\na. Keadaan di mana dua atau lebih proses tidak dapat melanjutkan eksekusinya karena menunggu sumber daya yang dipegang oleh proses lain.\r\nb. Keadaan di mana sebuah proses terus-menerus mendapatkan sumber daya tanpa membebaskannya.\r\nc. Keadaan di mana semua proses selesai dengan sukses.\r\nd. Tidak ada konsep deadlock dalam sistem operasi.', 'a. Keadaan di mana dua atau lebih proses tidak dapat melanjutkan eksekusinya karena menunggu sumber daya yang dipegang oleh proses lain.'),
(7, 'Apa yang dimaksud dengan sistem file dalam sistem operasi?\r\n\r\na. Kumpulan perangkat keras komputer\r\nb. Struktur data yang digunakan untuk menyimpan informasi tentang file dan direktori\r\nc. Program aplikasi untuk mengelola file\r\nd. Jaringan komputer yang digunakan untuk berbagi file', 'b. Struktur data yang digunakan untuk menyimpan informasi tentang file dan direktori');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`index`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data`
--
ALTER TABLE `data`
  MODIFY `index` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
