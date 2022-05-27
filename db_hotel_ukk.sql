-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2022 at 04:10 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hotel_ukk`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fasilitas`
--

CREATE TABLE `tbl_fasilitas` (
  `idfasilitas` int(20) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_fasilitas`
--

INSERT INTO `tbl_fasilitas` (`idfasilitas`, `jenis`, `deskripsi`, `gambar`) VALUES
(1, 'Kolam Renang', 'Kolam renang luar ruangan ini dirancang untuk tamu dewasa dengan dikelilingi taman tropis yang indah. Anda dapat berenang lama dengan santai di kolam renang kami.', 'Kolam Renang.JPG'),
(2, 'Restoran', 'Restoran yang ada di Dewi Hotel ini melayani tamu dengan makanan dan minuman berkualitas nomor satu. Teknik pelayanan yang digunakan adalah pelayanan secara Rusia dan Perancis, penataan meja makanan secara lengkap.', 'Restoran.JPG'),
(3, 'Gym', 'Gym Dewi Hotel memiliki peralatan kardio-vaskular dan peralatan pendukung lainnya untul latihan yang menyegarkan.', 'Gym.JPG'),
(4, 'Ruang Pertemuan', 'Bila anda merencanakan untuk menyiapkan pertemuan bisnis anda sembari mendapatkan fasilitas akomodasi untuk menginap, Dewi Hotel adalah pilihan hotel yang sangat tepat. Ruang pertemuan ini sudah termasuk dengan fasilitas yang ada didalam nya yaitu air mineral, alat tulis, permen, LCD Projector, dan jaringan internet.', 'Ruang Pertemuan.JPG'),
(5, 'Perawatan Spa', 'Dewi Hotel menawarkan perawatan relaksasi dengan gaya Bali. Kamu bisa menikmati facial hingga pijat refleksi yang bakal bikin badan kamu fresh lagi. Pengi? pesam kamarnya di Dewi Hotel ya!', 'Perawatan Spa.JPG'),
(9, 'Area Parkir', 'Dewi Hotel dilengkapi dengan tempat parkir 24 jam yang memiliki kapasitas untuk menyimpan hingga 80 kendaraan (mobil)sekaligus. Dengan keamanan maksimum, kami percaya bahwa area parkir kami adalah tempat yang aman untuk memarkir kendaraan tamu Dewi Hotel.', 'areaparkir.jpg'),
(10, 'Halaman', 'Hotel ini menghadirkan taman untuk menyediakan ruang terbuka sekaligus ruang yang menyenangkan untuk pengunjung hotel. Pengunjung hotek bisa beristirahat dan menkmati suasana tropis yang rimbun.', 'halaman.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fasilitas_kamar`
--

CREATE TABLE `tbl_fasilitas_kamar` (
  `id_fasilitas` int(10) NOT NULL,
  `tipe_kamar` varchar(20) NOT NULL,
  `fasilitas` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_fasilitas_kamar`
--

INSERT INTO `tbl_fasilitas_kamar` (`id_fasilitas`, `tipe_kamar`, `fasilitas`) VALUES
(1, 'Single Room', 'Fasilitas yang ada pada jenis kamar ini terdiri dari satu sofa, dan kamar mandi. ukuran kamarnya juga tidak terlalu besar. Bagi kalian para solo traveler kami menyarankan untuk menginap di Dewi Hotel ini karena telah dilengkapi dengan fasilitas yang memang untuk satu orang dan harga yang murah.'),
(2, 'Double Room', 'Ingin menginap dengan lebih nyaman dan fasilitas yang lebih baik? Kamu bisa memesan tipe kamar hotel double room, tipe kamar ini memiliki ukuran kasur yang besar. Double room ini cocok banget untuk pasangan suami istri yang ingin berbulan madu.'),
(3, 'Family Room', 'Pergi traveling bersama keluarga besar atau teman-teman? Kamu bisa pilih tipe kamar hotel family room. Dari segi ukuran kamar, tentu jauh lebih luas dari pada ipe kamar hotel lainnya. Tipe kamar hotel family room di Dewi Hotel ini tersedia satu tempat dengan ukuran king size dan satu tempat tidur dengan ukuran yang lebih kecil.'),
(4, 'Conneecting Room', 'Tipe kamar hotel denan Commecting Room ini cocok untuk kamu yang pergi bersama keluarga besar atau rombongan tetapi ingin memiliki kamar tiduk masing-masing. Kamar kamu dan anggota keluarga lainnya akan bersebelahan dan terdapat pintu yang menghubungkan kamar kalian. Sehingga, jika kamu atau anggota keluarga lainnya ingin ke kamar satu sama lain, bisa melalui connecting door dan tidak perlu repot melalui pintu depan.'),
(5, 'Cabana Room', 'Kamu ingin langsung berenang saat buka pintu kamar? Pilih tipe kamar hotel Cabana Room! Tpe kamar di Dewi Hotel ini memang didesain dengan kolam renang private untuk pemesan kamar tersebut., luas kamar Cabana Room in sekitar 30 - 40 m.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kamar`
--

CREATE TABLE `tbl_kamar` (
  `id_kamar` int(10) NOT NULL,
  `id_fasilitas` int(10) NOT NULL,
  `no_kamar` char(11) NOT NULL,
  `tarif` double NOT NULL,
  `foto` varchar(50) NOT NULL,
  `jumlah_kamar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kamar`
--

INSERT INTO `tbl_kamar` (`id_kamar`, `id_fasilitas`, `no_kamar`, `tarif`, `foto`, `jumlah_kamar`) VALUES
(8, 1, '001', 1500000, 'Single Room.JPG', 5),
(9, 2, '002', 2000000, 'Double Room.JPG', 1),
(10, 3, '003', 2500000, 'Family Room.JPG', 7),
(11, 4, '004', 3000000, 'Connecting Room.JPG', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pemesan`
--

CREATE TABLE `tbl_pemesan` (
  `nik` char(20) NOT NULL,
  `nama_pemesan` varchar(30) NOT NULL,
  `email_pemesan` varchar(32) NOT NULL,
  `nama_tamu` varchar(30) NOT NULL,
  `alamat_pemesan` text NOT NULL,
  `no_telp_pemesan` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_petugas`
--

CREATE TABLE `tbl_petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `level` enum('admin','resepsionis') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_petugas`
--

INSERT INTO `tbl_petugas` (`id_petugas`, `username`, `password`, `nama_petugas`, `level`) VALUES
(1, 'admin', '436db71e03605b5aea1e08078f29f7f2', 'Dewi', 'admin'),
(2, 'petugas', '436db71e03605b5aea1e08078f29f7f2', 'Yani', 'resepsionis');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reservasi`
--

CREATE TABLE `tbl_reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `nama_pemesan` varchar(30) NOT NULL,
  `email_pemesan` varchar(32) NOT NULL,
  `nama_tamu` varchar(30) NOT NULL,
  `no_telp` char(13) NOT NULL,
  `tgl_cek_in` date NOT NULL,
  `tgl_cek_out` date NOT NULL,
  `jumlah_kamar_dipensan` int(11) NOT NULL,
  `status` enum('cek in','cek out','pesan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_reservasi`
--

INSERT INTO `tbl_reservasi` (`id_reservasi`, `id_kamar`, `nama_pemesan`, `email_pemesan`, `nama_tamu`, `no_telp`, `tgl_cek_in`, `tgl_cek_out`, `jumlah_kamar_dipensan`, `status`) VALUES
(27, 8, 'Dewi', 'dewi@gmail.com', 'Dewi Yulyani', '1234567890', '2022-05-24', '2022-05-25', 3, 'cek out'),
(28, 9, 'Siti Nur', 'siti@gmail.com', 'Siti Nur', '085343216789', '2022-06-01', '2022-06-03', 4, 'cek out'),
(29, 8, 'Rahma ', 'Rahma@gmail.com', 'Rahma', '087633679087', '2022-05-25', '2022-05-26', 3, 'cek out'),
(30, 9, 'Nazla', 'nazla@gmail.com', 'Nazla', '0237499183764', '2022-06-01', '2022-06-02', 4, 'cek in');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_fasilitas`
--
ALTER TABLE `tbl_fasilitas`
  ADD PRIMARY KEY (`idfasilitas`);

--
-- Indexes for table `tbl_fasilitas_kamar`
--
ALTER TABLE `tbl_fasilitas_kamar`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indexes for table `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  ADD PRIMARY KEY (`id_reservasi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_fasilitas`
--
ALTER TABLE `tbl_fasilitas`
  MODIFY `idfasilitas` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_fasilitas_kamar`
--
ALTER TABLE `tbl_fasilitas_kamar`
  MODIFY `id_fasilitas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  MODIFY `id_kamar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
