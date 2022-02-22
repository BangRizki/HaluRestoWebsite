-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2021 at 01:27 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `halu_resto`
--

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `tanggal_pembelian` date DEFAULT NULL,
  `jumlah_pembelian` int(11) NOT NULL,
  `pajak_pembelian` int(11) NOT NULL,
  `total_pembelian` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `tanggal_pembelian`, `jumlah_pembelian`, `pajak_pembelian`, `total_pembelian`, `id_user`) VALUES
(16, '2021-12-14', 60000, 3000, 63000, 28);

-- --------------------------------------------------------

--
-- Table structure for table `pesan_menu`
--

CREATE TABLE `pesan_menu` (
  `id_pesan_menu` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `id_pembelian` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesan_menu`
--

INSERT INTO `pesan_menu` (`id_pesan_menu`, `jumlah`, `id_pembelian`, `id_barang`) VALUES
(48, 1, 16, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(100) NOT NULL,
  `nama_admin` varchar(20) NOT NULL,
  `username_admin` varchar(100) NOT NULL,
  `password_admin` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_admin`, `username_admin`, `password_admin`, `created_at`, `deleted_at`) VALUES
(6, 'Mas Kasir', 'admin', '$2y$10$X314cLgT5vCLgbkHARDVfeQgM6hL5xd3jHe6nmqFZ7lpGTww2vgZu', '2021-11-25 23:46:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` varchar(10) NOT NULL,
  `gambar` text NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`, `deleted_at`, `created_at`, `update_at`) VALUES
(1, 'Burger gede', 'Rasakan nikmatnya burger spesial dari kami dengan ukuran yang lebih besar', 'Makanan', 35000, 'ada', 'burger.jpg', NULL, NULL, '2021-12-14 09:16:21'),
(2, 'Lunpia Semarang', 'Rasakan nikmatnya lunpia spesial dari kami dengan ukuran yang lebih besar', 'Makanan', 23000, 'ada', 'lunpia.jpg', NULL, NULL, '2021-12-14 09:16:50'),
(4, 'Corndog', 'Rasakan nikmatnya corndog yang spesial dari kami dengan keju mozarella yang super molor', 'Makanan', 25000, 'ada', 'corndog.jpg', NULL, NULL, '2021-12-14 09:17:19'),
(5, 'Pizza ', 'Rasakan nikmatnya pizza spesial dari kami dengan ukuran yang lebih besar dan isi yang banyak', 'Makanan', 60000, 'ada', 'pizza.jpg', NULL, NULL, '2021-12-14 09:17:48'),
(7, 'Boba', 'Rasakan segarnya minuman boba spesial dari kami dengan baluran krim dan topping yang super banyak', 'Minuman', 25000, 'ada', 'boba.jpg', NULL, NULL, '2021-12-14 09:18:19');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_user` int(255) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_user`, `nama`, `username`, `password`, `email`, `created_at`, `deleted_at`) VALUES
(28, 'Rizki Oktavianus', 'rizkikun', '3e089c076bf1ec3a8332280ee35c28d4', 'rizkoktav70@gmail.com', '2021-12-14 07:27:47', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_user` (`id_user`) USING BTREE;

--
-- Indexes for table `pesan_menu`
--
ALTER TABLE `pesan_menu`
  ADD PRIMARY KEY (`id_pesan_menu`),
  ADD KEY `id_pembelian` (`id_pembelian`) USING BTREE,
  ADD KEY `id_barang` (`id_barang`) USING BTREE;

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pesan_menu`
--
ALTER TABLE `pesan_menu`
  MODIFY `id_pesan_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id_user` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian` FOREIGN KEY (`id_user`) REFERENCES `tb_pelanggan` (`id_user`);

--
-- Constraints for table `pesan_menu`
--
ALTER TABLE `pesan_menu`
  ADD CONSTRAINT `pesan_menu1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`),
  ADD CONSTRAINT `pesan_menu2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
