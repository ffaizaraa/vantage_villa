-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2023 at 08:41 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vantage_villa`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `idAdmin` char(5) NOT NULL,
  `userName` varchar(10) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`idAdmin`, `userName`, `password`) VALUES
('1', 'admin', '12345'),
('2', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cottage`
--

CREATE TABLE `tbl_cottage` (
  `idCottage` char(5) NOT NULL,
  `namaCottage` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `jumlahKamar` int(10) DEFAULT NULL,
  `deskripsi` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `harga` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cottage`
--

INSERT INTO `tbl_cottage` (`idCottage`, `namaCottage`, `jumlahKamar`, `deskripsi`, `harga`) VALUES
('CTG01', 'Wood Suite Room', 9, 'Fasilitas Wood Suite Room\r\n1. WiFi\r\n2. Coffee & Tea\r\n3. Water Heater, Shower, Shampoo & Soap\r\n4. Terrace\r\n5. Non Smoking Room\r\n6. TV, Full-Length Mirror, Bed-side Table, Bathroom', 650000),
('CTG02', 'Cluster Room Unit 1', 10, 'Fasilitas Cluster Room\r\n1. WiFi\r\n2. Coffee & Tea\r\n3. Water Heater, Shower, Shampoo & Soap\r\n4. Terrace\r\n5. Non Smoking Room\r\n6. TV, Full-Length Mirror, Bed-side Table, Bathroom', 550000),
('CTG03', 'Culture Suite Room', 10, 'Fasilitas Culture Suite Room\r\n1. WiFi\r\n2. Coffee & Tea\r\n3. Water Heater, Shower, Shampoo & Soap\r\n4. Terrace\r\n5. Non Smoking Room\r\n6. TV, Full-Length Mirror, Bed-side Table, Bathroom', 450000),
('CTG04', 'Matrix Room', 10, 'Fasilitas Matrix Room\r\n1. WiFi\r\n2. Coffee & Tea\r\n3. Water Heater, Shower, Shampoo & Soap\r\n4. Terrace\r\n5. Non Smoking Room\r\n6. TV, Full-Length Mirror, Bed-side Table, Bathroom', 350000),
('CTG05', 'Cluster Room Unit 2', 10, 'Fasilitas Cluster Room Unit 2\r\n1. WiFi\r\n2. Coffee & Tea\r\n3. Water Heater, Shower, Shampoo & Soap\r\n4. Terrace\r\n5. Non Smoking Room\r\n6. TV, Full-Length Mirror, Bed-side Table, Bathroom', 550000),
('CTG06', 'Country Suite Room', 9, 'Fasilitas Country Suite Room\r\n1. WiFi\r\n2. Coffee & Tea\r\n3. Water Heater, Shower, Shampoo & Soap\r\n4. Terrace\r\n5. Non Smoking Room\r\n6. TV, Full-Length Mirror, Bed-side Table, Bathroom', 650000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gambar`
--

CREATE TABLE `tbl_gambar` (
  `idGambar` char(5) NOT NULL,
  `gambar1` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `gambar2` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `gambar3` varchar(20) CHARACTER SET latin1 NOT NULL,
  `gambar4` varchar(20) CHARACTER SET latin1 NOT NULL,
  `idCottage` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_gambar`
--

INSERT INTO `tbl_gambar` (`idGambar`, `gambar1`, `gambar2`, `gambar3`, `gambar4`, `idCottage`) VALUES
('GB01', 'wood11.jpg', 'wood21.jpg', 'wood31.jpg', '', 'CTG01'),
('GB02', 'clust1.jpg', 'clust2.jpg', 'clust3.jpg', '', 'CTG02'),
('GB03', 'culture1.jpg', 'culture2.jpg', 'culture3.jpg', '', 'CTG03'),
('GB04', 'matrix1.jpg', 'matrix2.jpg', 'matrix3.jpg', '', 'CTG04'),
('GB05', 'cluster1.jpg', 'cluster2.jpg', 'cluster3.jpg', '', 'CTG05'),
('GB06', 'country1.jpg', 'country2.jpg', 'country3.jpg', '', 'CTG06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `metode` varchar(255) NOT NULL,
  `pay_1` varchar(11) NOT NULL,
  `pay_2` varchar(11) NOT NULL,
  `pay_3` varchar(11) NOT NULL,
  `atas_nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`id_pembayaran`, `metode`, `pay_1`, `pay_2`, `pay_3`, `atas_nama`) VALUES
(3, 'Transfer Bank', 'BNI', 'BCA', 'BRI', 'Vantage Villa'),
(4, 'Pembayaran Digital', 'Dana', 'OVO', 'ShopeePay', 'Vantage Villa');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penyewa`
--

CREATE TABLE `tbl_penyewa` (
  `id_penyewa` int(11) NOT NULL,
  `NIK` char(16) NOT NULL,
  `namaPenyewa` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `alamat` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `no_telp` bigint(15) DEFAULT NULL,
  `tglCheckin` date DEFAULT NULL,
  `tglCheckout` date DEFAULT NULL,
  `idCottage` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_penyewa`
--

INSERT INTO `tbl_penyewa` (`id_penyewa`, `NIK`, `namaPenyewa`, `alamat`, `gender`, `email`, `no_telp`, `tglCheckin`, `tglCheckout`, `idCottage`) VALUES
(55, '3303015802030001', 'Danielle', 'Jakarta Pusat', 'P', 'faizaaksara18@gmail.com', 834456896443, '2023-12-25', '2023-12-27', 'CTG01'),
(56, '9203015802030001', 'Faiza Risky Aksara', 'Sragen', 'P', 'faizaaksara18@gmail.com', 89673603383, '2023-12-31', '2024-01-01', 'CTG06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `metode` varchar(255) DEFAULT NULL,
  `bukti_pembayaran` varchar(255) DEFAULT NULL,
  `id_penyewa` int(11) DEFAULT NULL,
  `id_pembayaran` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `namaPenyewa` varchar(255) DEFAULT NULL,
  `tglCheckin` date DEFAULT NULL,
  `tglCheckout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `metode`, `bukti_pembayaran`, `id_penyewa`, `id_pembayaran`, `status`, `email`, `namaPenyewa`, `tglCheckin`, `tglCheckout`) VALUES
(65, NULL, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'Transfer Bank', 'contohbuktitransfer.jpg', 55, 3, 2, 'faizaaksara18@gmail.com', 'Danielle', '2023-12-25', '2023-12-27'),
(67, 'Pembayaran Digital', 'contohbuktitransfer1.jpg', 56, 4, 2, 'faizaaksara18@gmail.com', 'Faiza Risky Aksara', '2023-12-31', '2024-01-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `tbl_cottage`
--
ALTER TABLE `tbl_cottage`
  ADD PRIMARY KEY (`idCottage`);

--
-- Indexes for table `tbl_gambar`
--
ALTER TABLE `tbl_gambar`
  ADD PRIMARY KEY (`idGambar`),
  ADD KEY `idCottage` (`idCottage`);

--
-- Indexes for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `tbl_penyewa`
--
ALTER TABLE `tbl_penyewa`
  ADD PRIMARY KEY (`id_penyewa`),
  ADD KEY `id_cottage` (`idCottage`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_penyewa` (`id_penyewa`),
  ADD KEY `id_pembayaran` (`id_pembayaran`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_penyewa`
--
ALTER TABLE `tbl_penyewa`
  MODIFY `id_penyewa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_gambar`
--
ALTER TABLE `tbl_gambar`
  ADD CONSTRAINT `tbl_gambar_ibfk_1` FOREIGN KEY (`idCottage`) REFERENCES `tbl_cottage` (`idCottage`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_penyewa`
--
ALTER TABLE `tbl_penyewa`
  ADD CONSTRAINT `tbl_penyewa_ibfk_1` FOREIGN KEY (`idCottage`) REFERENCES `tbl_cottage` (`idCottage`);

--
-- Constraints for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `tbl_transaksi_ibfk_1` FOREIGN KEY (`id_penyewa`) REFERENCES `tbl_penyewa` (`id_penyewa`),
  ADD CONSTRAINT `tbl_transaksi_ibfk_2` FOREIGN KEY (`id_pembayaran`) REFERENCES `tbl_pembayaran` (`id_pembayaran`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
