-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jul 2021 pada 01.02
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
  `foto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `kategori_barang`, `ket_barang`, `harga_beli`, `harga_jual`, `stok`, `foto`) VALUES
('KUR000001', 'kursi', 'Kursi kayu sekolah pohon mahoni', 300000, 350000, 12, '1626161747823.jpg'),
('LEM000001', 'lemari', 'Lemari 2 pintu + kaca', 500000, 650000, 4, 'lemari.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_det_pembelian`
--

CREATE TABLE `tb_det_pembelian` (
  `id_det_pembelian` int(11) NOT NULL,
  `id_pembelian` varchar(20) DEFAULT NULL,
  `id_barang` varchar(20) DEFAULT NULL,
  `qty_beli` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_det_pembelian`
--

INSERT INTO `tb_det_pembelian` (`id_det_pembelian`, `id_pembelian`, `id_barang`, `qty_beli`) VALUES
(0, '130720210001', 'LEM000001', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_det_penjualan`
--

CREATE TABLE `tb_det_penjualan` (
  `id_det_penjualan` int(11) NOT NULL,
  `id_penjualan` varchar(20) DEFAULT NULL,
  `id_barang` varchar(20) DEFAULT NULL,
  `jumlah` float DEFAULT NULL,
  `status_barang` enum('masih proses','sudah jadi') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(2, 'Joko', '08977886778', 'Pati', 5);

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
('130720210001', '2021-05-19 09:42:56', 1, 'pengajuan', 1300000),
('130720210002', '2021-05-19 09:42:56', 1, 'selesai', 2300000);

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
  `status` enum('kirim','selesai') DEFAULT NULL,
  `ket_penjualan` text DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `jumlah` float DEFAULT NULL
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
(5, 'joko', '123456', 'pelanggan');

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
-- Indeks untuk tabel `tb_tmp_penjualan`
--
ALTER TABLE `tb_tmp_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_det_penjualan`
--
ALTER TABLE `tb_det_penjualan`
  MODIFY `id_det_penjualan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_keterangan_pembelian`
--
ALTER TABLE `tb_keterangan_pembelian`
  MODIFY `id_ket_pembelian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_tmp_penjualan`
--
ALTER TABLE `tb_tmp_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Ketidakleluasaan untuk tabel `tb_jurnal_keuangan`
--
ALTER TABLE `tb_jurnal_keuangan`
  ADD CONSTRAINT `FK_KEUANGAN_1` FOREIGN KEY (`id_relasi`) REFERENCES `tb_pemasukan` (`id_pemasukan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_KEUANGAN_2` FOREIGN KEY (`id_relasi`) REFERENCES `tb_pengeluaran` (`id_pengeluaran`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_jurnal_stok`
--
ALTER TABLE `tb_jurnal_stok`
  ADD CONSTRAINT `FK_STOCK_1` FOREIGN KEY (`id_relasi`) REFERENCES `tb_penjualan` (`id_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_STOCK_2` FOREIGN KEY (`id_relasi`) REFERENCES `tb_pembelian` (`id_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE;

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
