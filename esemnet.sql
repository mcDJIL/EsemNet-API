-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 08, 2024 at 09:23 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esemnet`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `ID` int NOT NULL,
  `Jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`ID`, `Jenis`) VALUES
(1, 'Biasa'),
(2, 'Bagus'),
(3, 'Premium');

-- --------------------------------------------------------

--
-- Table structure for table `kodepotonganharga`
--

CREATE TABLE `kodepotonganharga` (
  `id` int NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Kode` varchar(20) NOT NULL,
  `Presentase` int NOT NULL,
  `Maksimal` float DEFAULT NULL,
  `BerlakuSampai` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kodepotonganharga`
--

INSERT INTO `kodepotonganharga` (`id`, `Nama`, `Kode`, `Presentase`, `Maksimal`, `BerlakuSampai`) VALUES
(1, 'Diskon Awal Tahun', 'DISKON2023', 10, 50000, '2023-01-31'),
(2, 'Promo Nataru', 'NATARU2024', 30, 100000, '2024-12-25'),
(3, 'Promo Ramadhan', 'RAMADHAN2023', 20, 100000, '2023-05-31'),
(4, 'Cashback Lebaran', 'LEBARAN2023', 5, 30000, '2023-06-30'),
(5, 'Diskon Spesial', 'SPESIAL2023', 25, 120000, '2023-08-31'),
(6, 'Diskon Ramadhan', 'RAMADHAN2024', 20, 50000, '2021-01-01'),
(9, 'Diskon Ramadhan', 'RAMADHAN2025', 20, 50000, '2021-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `komputer`
--

CREATE TABLE `komputer` (
  `id` int NOT NULL,
  `Nomor` int NOT NULL,
  `Merek` varchar(100) NOT NULL,
  `IDJenis` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `komputer`
--

INSERT INTO `komputer` (`id`, `Nomor`, `Merek`, `IDJenis`) VALUES
(1, 1, 'HP Pavilion xyz', 1),
(2, 2, 'Dell Inspiron abc', 2),
(3, 3, 'Asus VivoBook def', 1),
(4, 4, 'Estima', 3),
(5, 5, 'Lenovo ThinkPad jkl', 2),
(6, 6, 'HP Envy mno', 1),
(7, 7, 'Dell XPS pqr', 2),
(8, 8, 'Asus ROG stu', 1),
(9, 9, 'Acer Aspire vwx', 3),
(10, 10, 'Lenovo Legion yz', 2),
(11, 11, 'HP Spectre 123', 1),
(12, 12, 'Dell Latitude 456', 2),
(13, 13, 'Asus ZenBook 789', 1),
(14, 14, 'Acer Swift 101', 3),
(15, 15, 'Lenovo Yoga 112', 2);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Telepon` varchar(16) NOT NULL,
  `Alamat` text,
  `MasihAktif` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `Nama`, `Telepon`, `Alamat`, `MasihAktif`) VALUES
(1, 'mcDJIL', '082261984331', 'Jalan Locat Indah', b'1'),
(2, 'Budi', '08765432100', 'Jalan Kenanga No. 456', b'1'),
(3, 'Citra', '08111223344', 'Jalan Anggrek No. 789', b'1'),
(4, 'Dharma', '08123456789', 'Jalan Melati No. 101', b'1'),
(5, 'Eva', '08123456789', 'Jalan Dahlia No. 202', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id` int NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `IDJenis` int DEFAULT NULL,
  `HargaPerJam` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id`, `Nama`, `IDJenis`, `HargaPerJam`) VALUES
(1, 'Paket Basic', 1, 20000),
(2, 'Paket Premium', 2, 1000000),
(3, 'Paket VIP', 3, 150000),
(4, 'Paket Hemat', 1, 4000),
(5, 'Paket Anak Owner', NULL, 500),
(6, 'Paket Eksekutif', 3, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int NOT NULL,
  `NamaPengguna` varchar(100) NOT NULL,
  `KataSandi` varchar(50) NOT NULL,
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `NamaPengguna`, `KataSandi`, `token`) VALUES
(1, 'Budi', 'Sandi123', '5894c82cc2aeb6560140a81694f99051'),
(2, 'Citra', 'Rahasia456', '49f9633e85794ad365335ad1cb0a9486'),
(3, 'Dewi', 'Tersembunyi789', NULL),
(4, 'Eko', 'KataKunciAman', NULL),
(5, 'Fitri', 'Rahasia321', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int NOT NULL,
  `IDKomputer` int NOT NULL,
  `IDMember` int DEFAULT NULL,
  `IDPaket` int NOT NULL,
  `IDPotonganHarga` int DEFAULT NULL,
  `Tanggal` date NOT NULL,
  `Waktu` time NOT NULL,
  `DibuatOleh` int NOT NULL,
  `Durasi` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `kodepotonganharga`
--
ALTER TABLE `kodepotonganharga`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Kode` (`Kode`);

--
-- Indexes for table `komputer`
--
ALTER TABLE `komputer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDJenis` (`IDJenis`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDJenis` (`IDJenis`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDKomputer` (`IDKomputer`),
  ADD KEY `IDMember` (`IDMember`),
  ADD KEY `IDPaket` (`IDPaket`),
  ADD KEY `IDPotonganHarga` (`IDPotonganHarga`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kodepotonganharga`
--
ALTER TABLE `kodepotonganharga`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `komputer`
--
ALTER TABLE `komputer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komputer`
--
ALTER TABLE `komputer`
  ADD CONSTRAINT `komputer_ibfk_1` FOREIGN KEY (`IDJenis`) REFERENCES `jenis` (`ID`);

--
-- Constraints for table `paket`
--
ALTER TABLE `paket`
  ADD CONSTRAINT `paket_ibfk_1` FOREIGN KEY (`IDJenis`) REFERENCES `jenis` (`ID`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`IDKomputer`) REFERENCES `komputer` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`IDMember`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`IDPaket`) REFERENCES `paket` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`IDPotonganHarga`) REFERENCES `kodepotonganharga` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
