-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2024 at 05:20 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rancak_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis`
--

CREATE TABLE `tb_jenis` (
  `kd_jenis` int(11) NOT NULL,
  `jenis_laundry` varchar(100) NOT NULL,
  `lama_proses` int(11) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_jenis`
--

INSERT INTO `tb_jenis` (`kd_jenis`, `jenis_laundry`, `lama_proses`, `tarif`) VALUES
(1, 'Laundry + Seterika', 3, 7000),
(2, 'Fast Laundry', 1, 10000),
(12, 'Regular', 2, 6000),
(13, 'Cuci Karpet', 3, 10000),
(14, 'selimut besar', 6, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_laporan`
--

CREATE TABLE `tb_laporan` (
  `id_laporan` int(11) NOT NULL,
  `tgl_laporan` date NOT NULL,
  `ket_laporan` int(1) NOT NULL,
  `catatan` text NOT NULL,
  `id_laundry` char(10) DEFAULT NULL,
  `pemasukan` int(11) NOT NULL,
  `id_pengeluaran` char(10) DEFAULT NULL,
  `pengeluaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_laporan`
--

INSERT INTO `tb_laporan` (`id_laporan`, `tgl_laporan`, `ket_laporan`, `catatan`, `id_laundry`, `pemasukan`, `id_pengeluaran`, `pengeluaran`) VALUES
(18, '2022-01-09', 2, 'Beli deterjen', NULL, 0, 'PG-0001', 100000),
(27, '2022-01-11', 2, 'service mesin cuci', NULL, 0, 'PG-0003', 200000),
(28, '2022-01-09', 1, '5 baju, 5 celana levis', 'LD-0001', 70000, NULL, 0),
(29, '2022-01-09', 1, '10 kemeja, 2 celana training', 'LD-0002', 100000, NULL, 0),
(30, '2022-01-09', 1, 'Karpet 20kg', 'LD-0003', 200000, NULL, 0),
(31, '2022-01-09', 1, '2 celana, 3 baju, 2 kaus', 'LD-0005', 35000, NULL, 0),
(32, '2022-01-10', 2, 'Membeli pemutih pakaian', NULL, 0, 'PG-0004', 50000),
(33, '2024-09-04', 1, 'dasing kw', 'LD-0006', 70000, NULL, 0),
(34, '2024-09-04', 1, 'mlo', 'LD-0008', 36000, NULL, 0),
(35, '2024-09-04', 1, 'karpet', 'LD-0007', 50000, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_laundry`
--

CREATE TABLE `tb_laundry` (
  `id_laundry` char(10) NOT NULL,
  `pelangganid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `kd_jenis` char(6) NOT NULL,
  `tgl_terima` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `jml_kilo` int(11) NOT NULL,
  `catatan` text NOT NULL,
  `totalbayar` int(11) NOT NULL,
  `status_pembayaran` int(1) NOT NULL,
  `status_pengambilan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_laundry`
--

INSERT INTO `tb_laundry` (`id_laundry`, `pelangganid`, `userid`, `kd_jenis`, `tgl_terima`, `tgl_selesai`, `jml_kilo`, `catatan`, `totalbayar`, `status_pembayaran`, `status_pengambilan`) VALUES
('LD-0001', 5, 27, '1', '2022-01-09', '2022-01-12', 10, '5 baju, 5 celana levis', 70000, 1, 1),
('LD-0002', 3, 27, '2', '2022-01-09', '2022-01-10', 10, '10 kemeja, 2 celana training', 100000, 1, 0),
('LD-0003', 5, 27, '13', '2022-01-09', '2022-01-12', 20, 'Karpet 20kg', 200000, 1, 1),
('LD-0004', 9, 27, '12', '2022-01-09', '2022-01-11', 9, '14 kaus', 54000, 0, 0),
('LD-0005', 9, 27, '1', '2022-01-09', '2022-01-12', 5, '2 celana, 3 baju, 2 kaus', 35000, 1, 0),
('LD-0006', 11, 33, '1', '2024-09-04', '2024-09-07', 10, 'dasing kw', 70000, 1, 1),
('LD-0007', 11, 32, '13', '2024-09-04', '2024-09-07', 5, 'karpet', 50000, 1, 1),
('LD-0008', 11, 32, '12', '2024-09-04', '2024-09-06', 6, 'mlo', 36000, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `pelangganid` int(11) NOT NULL,
  `pelanggannama` varchar(150) NOT NULL,
  `pelangganjk` varchar(15) NOT NULL,
  `pelangganalamat` text NOT NULL,
  `pelanggantelp` varchar(20) NOT NULL,
  `pelangganfoto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`pelangganid`, `pelanggannama`, `pelangganjk`, `pelangganalamat`, `pelanggantelp`, `pelangganfoto`) VALUES
(3, 'Mang mamang', 'Laki - laki', 'Olimpuck', '085233444541', '61da618d4343f.png'),
(5, 'Fandi Aziz Pratama', 'Laki - laki', 'bandar', '0895392518654', '61d9335273e98.png'),
(9, 'Rendi', 'Laki - laki', 'Solo', '086532187609', '61da61ef62df1.jpg'),
(10, 'Toni', 'Laki - laki', 'Jogja', '0987654332', '61dac09d9118d.jpg'),
(11, 'dasing', 'Laki - laki', 'san fransisco', '134134134', '66d74153d6131.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengeluaran`
--

CREATE TABLE `tb_pengeluaran` (
  `id_pengeluaran` char(10) NOT NULL,
  `tgl_pengeluaran` date NOT NULL,
  `catatan` text NOT NULL,
  `pengeluaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pengeluaran`
--

INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tgl_pengeluaran`, `catatan`, `pengeluaran`) VALUES
('PG-0001', '2022-01-09', 'Beli deterjen', 100000),
('PG-0003', '2022-01-11', 'service mesin cuci', 200000),
('PG-0004', '2022-01-10', 'Membeli pemutih pakaian', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `userid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `userpass` varchar(100) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `jk` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `usertelp` varchar(20) NOT NULL,
  `userfoto` varchar(50) DEFAULT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`userid`, `username`, `userpass`, `nama`, `jk`, `alamat`, `usertelp`, `userfoto`, `level`) VALUES
(27, 'Yeni', '$2y$10$3vW7VqHTaSpKnhlKL2Dd4OFzfV1oqGLw.vcqLIcDM7o7R.WADO00K', 'Yeni Yaradana Ahmed zuliadin', 'Laki - laki', 'New Giniea', '08953925199', '61da60dc3ce8b.jpg', 'admin'),
(28, 'fandiaz', '$2y$10$4sr89AaocI6DvBEF0jBfdeF3Q8/EY1/gwmLrodrSz1XUth.uJs3La', 'Fandi Aziz', 'Laki - laki', 'Bandardawung', '0895392518509', '61d844f1efc33.jpg', 'kasir'),
(31, 'Yuli', '$2y$10$R.KSk67SfxEwOm4B.nH9uegiyVyZmROF7/MSHYiuQ.9AmuZ3NU.aq', 'Yulianto', 'Laki - laki', 'Solo', '089654321', '61dad24785895.jpg', 'kasir'),
(32, 'nefertiti12', '$2y$10$J8tc4tKvqZ8iBmD3nfE0aezIxLDZz0xEl5rJGwWh75qIbIKTIqRby', 'nefertiti', 'Perempuan', 'ancient egypt', '234342', '66d74687469df.png', 'admin'),
(33, 'horus', '$2y$10$xnW35wsxcSclB4bjtF9NRuYu7lo0EK3g2i7Lgt/g8I6RglRUrT.cu', 'horus12', 'Laki - laki', 'ancient thebes', '234324', '66d7465d0d1b1.png', 'kasir'),
(34, 'admin', '$2y$10$DtbcMb9KQXVpT9PpyK0uq.2kLxP.fWE9y5TbzOfZbiiRG1kA.sWYe', 'admin', 'Laki - laki', 'kosterwest, Relweston, Reltronland', '1', '66d74a163aa72.jpg', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_jenis`
--
ALTER TABLE `tb_jenis`
  ADD PRIMARY KEY (`kd_jenis`);

--
-- Indexes for table `tb_laporan`
--
ALTER TABLE `tb_laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `tb_laundry`
--
ALTER TABLE `tb_laundry`
  ADD PRIMARY KEY (`id_laundry`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`pelangganid`);

--
-- Indexes for table `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_jenis`
--
ALTER TABLE `tb_jenis`
  MODIFY `kd_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_laporan`
--
ALTER TABLE `tb_laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `pelangganid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
