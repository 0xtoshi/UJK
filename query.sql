/*

        MEMBUAT TABEL BUKU KASIR dan penjualan
        varchar = tipe data karakter/string yg serig dugunakan 
        varchatr(5) misalnya untuk membatasi panjang data adalah 5
        int(3) panjang integer 3
        decimal [(p [,s])] 
        p = presisi 
        s = skala 

        misal 

        decimal (5,2)
        berarti maks panjang 5 dan koma 2 digit setelah koma


*/

CREATE TABLE `buku` (
  `id_buku` varchar(5) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `noisbn` varchar(50) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `tahun` int(4) NOT NULL,
  `stok` int(3) NOT NULL,
  `harga_pokok` int(8) NOT NULL,
  `harga_jual` int(8) NOT NULL,
  `ppn` decimal(5,2) NOT NULL,
  `diskon` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `kasir` (
  `id_kasir` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `status` int(1) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `akses` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `penjualan` (
  `id_penjualan` varchar(20) NOT NULL,
  `id_buku` varchar(5) NOT NULL,
  `id_kasir` varchar(5) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

ALTER TABLE `penjualan`
ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`);
