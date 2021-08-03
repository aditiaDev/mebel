-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jul 2021 pada 01.02
-- Versi server: 10.4.10-MariaDB
-- Versi PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mebel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` varchar(20) NOT NULL,
  `kategori_barang` enum('lemari','kursi','meja') DEFAULT NULL,
  `ket_barang` text DEFAULT NULL,
  `harga_beli` float DEFAULT NULL,
  `harga_jual` float DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `nm_barang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `kategori_barang`, `ket_barang`, `harga_beli`, `harga_jual`, `stok`, `foto`, `nm_barang`) VALUES
('KUR000001', 'kursi', 'Kursi kayu sekolah pohon mahoni', 300000, 350000, 26, '1626161747823.jpg', 'Kursi kayu sekolah pohon mahoni'),
('KUR000002', 'kursi', 'Deskripsi\r\nLebar 30\r\nTinggi 75\r\n\r\nJamin harga termurah kualitas ga murahan !!!\r\n\r\nReady stok !\r\nKursi kayu jati belanda, kursi cafe,\r\nProduksi sendiri\r\nSudah finishing vernish natural', 150000, 180000, 28, '1626392832798.jpeg', 'Kursi kayu jati belanda'),
('KUR000003', 'kursi', 'BANGKU SINGLE BUATAN JATI ASLI\r\nKUAT MULUS NYAMAN DAN MEWAH', 350000, 400000, 28, '1626392912071.jpg', 'Kursi kayu jati ukiran'),
('KUR000004', 'kursi', 'Fitur Kursi Taman\r\nCocok di ruang Anda, sesuai dengan anggaran Anda\r\nKapasitas Tempat Duduk: 3\r\nTempat duduk yang dalam dan punggung yang tinggi dengan lengan untuk kenyamanan dan dukungan maksimal\r\nTahan Cuaca', 370000, 430000, 30, '1626392989819.jpg', 'Kursi kayu taman, kayu jati solid'),
('LEM000001', 'lemari', 'Lemari kayu jati original full sampai belakang dan atas\r\n\r\nBahan: kayu jati muda\r\nUkuran (P x L x T) :  160 x 55 x 200 cm\r\nFinishing: pelitur', 500000, 650000, 28, 'lemari.jpg', 'Lemari 2 pintu + kaca'),
('LEM000002', 'lemari', 'Kondisi Barang\r\nBARU\r\nSpesifikasi\r\nKategori	:	Lemari\r\nBerat	:	60 kilogram\r\nAsal Barang	:	Lokal\r\nDeskripsi\r\n*Info Kepada Kami Terlebih Dahulu Terkait Preoder &amp; Sistem Pengiriman bukalapak.\r\n\r\nKode: Raf-Lp-001\r\nUkuran : 110x60x220 cm\r\nBahan : Kayu Jati\r\nFinishing : Natural Melamik (Termasuk Finishing)\r\nHarga : Rp. 4.300.000 (Nego Hubungi Kami)\r\nOngkos Kirim: Belum termasuk Ongkos Kirim\r\nproses : 30 Hari (Tergantung Banyak Pemesanan)\r\n', 700000, 800000, 30, '1626393059183.jpg', 'Almari Lemari Pakaian Baju Pintu 2 Minimalis Gantung Kayu'),
('LEM000003', 'lemari', 'Lemari Pakaian Kayu Murah | Lemari Pakaian Minimalis Kayu', 500000, 580000, 30, '1626393135792.jpg', 'Lemari Pakaian Kayu Murah | Lemari Pakaian Minimalis Kayu'),
('LEM000004', 'lemari', 'Lemari Pakaian Rahwana 4 Pintu Ukiran Kayu Jati\r\nLemari pakaian rahwana merupakan produk furniture jepara yang terbuat dari kayu jati berkualitas serta mempunyai kontruksi kuat dan kokoh.\r\n\r\nLemari baju rahwana di desain apik dengan 4 pintu serta ukiran cantik dan mempunyai sentuhan warna natural melamine, sehingga terlihat mewah dan elegan. Sangat bagus untuk pengisian perabot mebel di ruang tidur rumah anda.', 900000, 1200000, 30, '1626393952642.jpg', 'Lemari Pakaian Rahwana 4 Pintu Ukiran Kayu Jati'),
('MEJ000001', 'meja', 'Meja serbaguna yang dapat digunakan untuk belajar, laptop maupun komputer\r\nDilengkapi dengan knock down system\r\nMemiliki ukuran yang luas dan lebar yang menjadikan meja ini sangat nyaman digunakan selama bekerja dengan tampilan model yang modern untuk menjadikan ruangan selalu stylish dan trendy\r\nTerbuat dari bahan particle board yang tebal dan berkualitas tinggi, sehingga bebas dari rayap dan jamur', 300000, 350000, 30, '1626392242100.jpg', 'Meja Komputer'),
('MEJ000002', 'meja', 'Meja kayu jati\r\nMaterial : Solid Wood\r\nCocok untuk diletakkan dalam segala suasana ruang\r\nDiameter : 90 cm\r\ntinggi : 75 cm\r\nUnit Utama', 200000, 230000, 30, '1626392321009.jpg', 'Meja Bundar'),
('MEJ000003', 'meja', 'Spesifikasi :\r\nMaterial dari kayu jati asli grade A\r\nFinishing melamin warna natural sesuai gambar\r\nhasil finishing halus\r\nFormasi dudukan 4 kursi + meja\r\nPacking kardus tebal, rapi dan aman', 400000, 500000, 30, '1626392708738.jpg', 'Meja makan kayu set');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_det_pembelian`
--

CREATE TABLE `tb_det_pembelian` (
  `id_det_pembelian` int(11) NOT NULL,
  `id_pembelian` varchar(20) DEFAULT NULL,
  `id_barang` varchar(20) DEFAULT NULL,
  `qty_beli` float DEFAULT NULL,
  `harga` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_det_pembelian`
--

INSERT INTO `tb_det_pembelian` (`id_det_pembelian`, `id_pembelian`, `id_barang`, `qty_beli`, `harga`) VALUES
(4, '140720210001', 'KUR000001', 4, 300000),
(5, '140720210001', 'LEM000001', 5, 500000),
(6, '140720210002', 'KUR000001', 2, 300000),
(7, '140720210002', 'LEM000001', 2, 500000),
(8, '140720210003', 'KUR000001', 2, 300000),
(9, '140720210003', 'LEM000001', 2, 500000),
(10, '150720210001', 'KUR000001', 10, 300000),
(11, '150720210001', 'LEM000001', 5, 500000),
(12, '150720210002', 'KUR000001', 2, 300000),
(13, '150720210003', 'KUR000001', 1, 300000),
(14, '150720210004', 'KUR000001', 1, 300000),
(15, '150720210004', 'LEM000001', 3, 500000),
(18, 'B210720210001', 'KUR000001', 2, 400000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_det_penjualan`
--

CREATE TABLE `tb_det_penjualan` (
  `id_det_penjualan` int(11) NOT NULL,
  `id_penjualan` varchar(20) DEFAULT NULL,
  `id_barang` varchar(20) DEFAULT NULL,
  `jumlah` float DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `status_barang` enum('masih proses','sudah jadi','dibatalkan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_det_penjualan`
--

INSERT INTO `tb_det_penjualan` (`id_det_penjualan`, `id_penjualan`, `id_barang`, `jumlah`, `harga`, `status_barang`) VALUES
(9, 'J180720210001', 'KUR000002', 2, 300000, 'sudah jadi'),
(10, 'J180720210001', 'KUR000001', 3, 400000, 'sudah jadi'),
(11, 'J200720210001', 'LEM000004', 2, 400000, 'masih proses'),
(12, 'J200720210002', 'KUR000003', 1, 400000, 'masih proses'),
(13, 'J200720210002', 'KUR000001', 1, 400000, 'masih proses'),
(14, 'J200720210003', 'KUR000001', 1, 400000, 'masih proses'),
(15, 'J200720210004', 'KUR000003', 1, 400000, 'masih proses'),
(16, 'J200720210004', 'KUR000002', 1, 180000, 'masih proses'),
(17, 'J210720210001', 'KUR000003', 2, 400000, 'sudah jadi'),
(18, 'J210720210002', 'KUR000001', 3, 350000, 'masih proses');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurnal_keuangan`
--

CREATE TABLE `tb_jurnal_keuangan` (
  `id_jurnal_uang` varchar(25) NOT NULL,
  `tgl_input` datetime DEFAULT NULL,
  `id_relasi` varchar(20) DEFAULT NULL,
  `masuk` float DEFAULT NULL,
  `keluar` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jurnal_keuangan`
--

INSERT INTO `tb_jurnal_keuangan` (`id_jurnal_uang`, `tgl_input`, `id_relasi`, `masuk`, `keluar`) VALUES
('U200720210001', '2021-07-20 13:29:27', 'K200720210001', NULL, 1800000),
('U200720210002', '2021-07-20 13:34:56', 'M200720210001', 1410000, NULL),
('U210720210001', '2021-07-21 05:29:15', 'K210720210001', NULL, 800000),
('U210720210002', '2021-07-21 05:30:58', 'M210720210001', 800000, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurnal_stok`
--

CREATE TABLE `tb_jurnal_stok` (
  `id_jurnal_stok` varchar(25) NOT NULL,
  `tgl_input` datetime DEFAULT NULL,
  `id_relasi` varchar(20) DEFAULT NULL,
  `masuk` float DEFAULT NULL,
  `keluar` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jurnal_stok`
--

INSERT INTO `tb_jurnal_stok` (`id_jurnal_stok`, `tgl_input`, `id_relasi`, `masuk`, `keluar`) VALUES
('S200720210001', '2021-07-20 13:29:27', 'K200720210001', 4, NULL),
('S200720210002', '2021-07-20 13:34:56', 'M200720210001', NULL, 5),
('S210720210001', '2021-07-21 05:29:15', 'K210720210001', 2, NULL),
('S210720210002', '2021-07-21 05:30:58', 'M210720210001', NULL, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_keterangan_pembelian`
--

CREATE TABLE `tb_keterangan_pembelian` (
  `id_ket_pembelian` int(11) NOT NULL,
  `id_pembelian` varchar(20) DEFAULT NULL,
  `tgl_input` datetime DEFAULT NULL,
  `penjelasan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_keterangan_pembelian`
--

INSERT INTO `tb_keterangan_pembelian` (`id_ket_pembelian`, `id_pembelian`, `tgl_input`, `penjelasan`) VALUES
(1, '140720210003', '2021-07-14 00:00:00', 'test 1'),
(2, '140720210003', '2021-07-14 00:00:00', 'test 2'),
(3, '150720210002', '2021-07-15 00:00:00', 'test'),
(4, '150720210004', '2021-07-15 00:00:00', 'trset');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nm_pelanggan` varchar(50) DEFAULT NULL,
  `no_tlp` varchar(13) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nm_pelanggan`, `no_tlp`, `alamat`, `id_user`) VALUES
(1, 'Aditia', '08978798123', 'Kudus', 4),
(2, 'Joko', '08977886778', 'Pati', 5),
(4, 'test 1', '08578912342', 'test alamat', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemasukan`
--

CREATE TABLE `tb_pemasukan` (
  `id_pemasukan` varchar(25) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_relasi` varchar(20) DEFAULT NULL,
  `tgl_input` datetime DEFAULT NULL,
  `tipe_pemasukan` enum('penjualan','non penjualan') DEFAULT NULL,
  `nominal_masuk` float DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pemasukan`
--

INSERT INTO `tb_pemasukan` (`id_pemasukan`, `id_pelanggan`, `id_relasi`, `tgl_input`, `tipe_pemasukan`, `nominal_masuk`, `keterangan`) VALUES
('M200720210001', 1, 'J180720210001', '2021-07-20 13:34:56', 'penjualan', 1410000, NULL),
('M210720210001', 1, 'J210720210001', '2021-07-21 05:30:58', 'penjualan', 800000, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembelian`
--

CREATE TABLE `tb_pembelian` (
  `id_pembelian` varchar(20) NOT NULL,
  `tgl_pembelian` datetime DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `status_pembelian` enum('pengajuan','terima','tolak','selesai') DEFAULT NULL,
  `tot_pembelian` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pembelian`
--

INSERT INTO `tb_pembelian` (`id_pembelian`, `tgl_pembelian`, `id_supplier`, `status_pembelian`, `tot_pembelian`) VALUES
('140720210001', '2021-07-14 00:00:00', 1, 'selesai', 3700000),
('140720210002', '2021-07-14 00:00:00', 1, 'pengajuan', 1600000),
('140720210003', '2021-07-14 00:00:00', 1, 'pengajuan', 1600000),
('150720210001', '2021-07-15 04:12:25', 1, 'pengajuan', 5500000),
('150720210002', '2021-07-15 04:13:59', 1, 'pengajuan', 600000),
('150720210003', '2021-07-15 04:46:32', 1, 'terima', 300000),
('150720210004', '2021-07-15 04:51:01', 1, 'selesai', 1800000),
('B210720210001', '2021-07-21 05:27:39', 1, 'selesai', 800000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengeluaran`
--

CREATE TABLE `tb_pengeluaran` (
  `id_pengeluaran` varchar(25) NOT NULL,
  `tgl_input` datetime DEFAULT NULL,
  `tipe_pengeluaran` enum('pembelian','non pembelian') DEFAULT NULL,
  `id_relasi` varchar(25) DEFAULT NULL,
  `nominal_keluar` float DEFAULT NULL,
  `keperluan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pengeluaran`
--

INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tgl_input`, `tipe_pengeluaran`, `id_relasi`, `nominal_keluar`, `keperluan`) VALUES
('K200720210001', '2021-07-20 13:29:27', 'pembelian', '150720210004', 1800000, NULL),
('K210720210001', '2021-07-21 05:29:15', 'pembelian', 'B210720210001', 800000, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `id_penjualan` varchar(20) NOT NULL,
  `tgl_jual` datetime DEFAULT NULL,
  `tgl_nota` date DEFAULT NULL,
  `no_nota` varchar(30) DEFAULT NULL,
  `tot_penjualan` float DEFAULT NULL,
  `status` enum('proses','kirim','selesai') DEFAULT NULL,
  `ket_penjualan` text DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `alamat_pengiriman` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`id_penjualan`, `tgl_jual`, `tgl_nota`, `no_nota`, `tot_penjualan`, `status`, `ket_penjualan`, `id_pelanggan`, `alamat_pengiriman`) VALUES
('J180720210001', '2021-07-18 07:54:17', '2021-07-20', '200720210002', 1410000, 'selesai', 'keterangan', 2, 'Kudus'),
('J200720210001', '2021-07-20 20:25:44', NULL, NULL, 2400000, 'proses', 'jati', 1, 'Pati'),
('J200720210002', '2021-07-20 20:26:32', NULL, NULL, 750000, 'proses', 'kayu jati', 1, 'Kudus'),
('J200720210003', '2021-07-20 20:46:02', NULL, NULL, 350000, 'proses', '', 1, 'asdasdd'),
('J200720210004', '2021-07-20 20:47:32', NULL, NULL, 580000, 'proses', '', 1, 'sadsadsad'),
('J210720210001', '2021-07-21 05:25:27', '2021-07-22', '200720210003', 800000, 'selesai', '', 1, 'Purwosari rt1 rw 5, Kudus'),
('J210720210002', '2021-07-21 05:25:45', NULL, NULL, 1050000, 'proses', '', 1, 'Purwosari rt1 rw 5, Kudus');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id_supplier` int(11) NOT NULL,
  `nm_supplier` varchar(50) DEFAULT NULL,
  `no_tlp` varchar(13) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_supplier`
--

INSERT INTO `tb_supplier` (`id_supplier`, `nm_supplier`, `no_tlp`, `alamat`) VALUES
(1, 'Warna Warni', '081789955462', 'Kalimantan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tmp_pembelian`
--

CREATE TABLE `tb_tmp_pembelian` (
  `id` int(11) NOT NULL,
  `id_barang` varchar(20) DEFAULT NULL,
  `qty` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tmp_penjualan`
--

CREATE TABLE `tb_tmp_penjualan` (
  `id` int(11) NOT NULL,
  `id_barang` varchar(20) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `level` enum('admin','pemilik','pelanggan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'pemilik', 'pemilik', 'pemilik'),
(4, 'pelanggan', 'pelanggan', 'pelanggan'),
(5, 'joko', '123456', 'pelanggan'),
(7, 'test', '123456', 'pelanggan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `tb_det_pembelian`
--
ALTER TABLE `tb_det_pembelian`
  ADD PRIMARY KEY (`id_det_pembelian`),
  ADD KEY `FK_det_pembelian_1` (`id_pembelian`),
  ADD KEY `FK_det_pembelian_2` (`id_barang`);

--
-- Indeks untuk tabel `tb_det_penjualan`
--
ALTER TABLE `tb_det_penjualan`
  ADD PRIMARY KEY (`id_det_penjualan`),
  ADD KEY `FK_DET_PENJUALAN_1` (`id_penjualan`);

--
-- Indeks untuk tabel `tb_jurnal_keuangan`
--
ALTER TABLE `tb_jurnal_keuangan`
  ADD PRIMARY KEY (`id_jurnal_uang`),
  ADD KEY `FK_KEUANGAN_2` (`id_relasi`);

--
-- Indeks untuk tabel `tb_jurnal_stok`
--
ALTER TABLE `tb_jurnal_stok`
  ADD PRIMARY KEY (`id_jurnal_stok`),
  ADD KEY `FK_STOCK_2` (`id_relasi`);

--
-- Indeks untuk tabel `tb_keterangan_pembelian`
--
ALTER TABLE `tb_keterangan_pembelian`
  ADD PRIMARY KEY (`id_ket_pembelian`),
  ADD KEY `FK_KET_PEMBELIAN_1` (`id_pembelian`);

--
-- Indeks untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `FK_PELANGGAN_1` (`id_user`);

--
-- Indeks untuk tabel `tb_pemasukan`
--
ALTER TABLE `tb_pemasukan`
  ADD PRIMARY KEY (`id_pemasukan`),
  ADD KEY `FK_PEMASUKAN_1` (`id_relasi`),
  ADD KEY `FK_PEMASUKAN_2` (`id_pelanggan`);

--
-- Indeks untuk tabel `tb_pembelian`
--
ALTER TABLE `tb_pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `FK_PEMBELIAN_1` (`id_supplier`);

--
-- Indeks untuk tabel `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`),
  ADD KEY `FK_PENGELUARAN` (`id_relasi`);

--
-- Indeks untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `FK_PENJUALAN_1` (`id_pelanggan`);

--
-- Indeks untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_det_pembelian`
--
ALTER TABLE `tb_det_pembelian`
  MODIFY `id_det_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_det_penjualan`
--
ALTER TABLE `tb_det_penjualan`
  MODIFY `id_det_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_keterangan_pembelian`
--
ALTER TABLE `tb_keterangan_pembelian`
  MODIFY `id_ket_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_det_pembelian`
--
ALTER TABLE `tb_det_pembelian`
  ADD CONSTRAINT `FK_det_pembelian_1` FOREIGN KEY (`id_pembelian`) REFERENCES `tb_pembelian` (`id_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_det_pembelian_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_det_penjualan`
--
ALTER TABLE `tb_det_penjualan`
  ADD CONSTRAINT `FK_DET_PENJUALAN_1` FOREIGN KEY (`id_penjualan`) REFERENCES `tb_penjualan` (`id_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_keterangan_pembelian`
--
ALTER TABLE `tb_keterangan_pembelian`
  ADD CONSTRAINT `FK_KET_PEMBELIAN_1` FOREIGN KEY (`id_pembelian`) REFERENCES `tb_pembelian` (`id_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `FK_PELANGGAN_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pemasukan`
--
ALTER TABLE `tb_pemasukan`
  ADD CONSTRAINT `FK_PEMASUKAN_1` FOREIGN KEY (`id_relasi`) REFERENCES `tb_penjualan` (`id_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PEMASUKAN_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pembelian`
--
ALTER TABLE `tb_pembelian`
  ADD CONSTRAINT `FK_PEMBELIAN_1` FOREIGN KEY (`id_supplier`) REFERENCES `tb_supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  ADD CONSTRAINT `FK_PENGELUARAN` FOREIGN KEY (`id_relasi`) REFERENCES `tb_pembelian` (`id_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `FK_PENJUALAN_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
