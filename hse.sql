-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 10, 2021 at 05:54 PM
-- Server version: 8.0.17
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hse`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_absen`
--

CREATE TABLE `tb_absen` (
  `absen_id` int(11) NOT NULL,
  `absen_user` int(11) DEFAULT NULL,
  `absen_jenis` int(11) DEFAULT NULL,
  `absen_keterangan` text,
  `absen_waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_absen`
--

INSERT INTO `tb_absen` (`absen_id`, `absen_user`, `absen_jenis`, `absen_keterangan`, `absen_waktu`) VALUES
(1, 2, 1, NULL, '2021-05-03 22:41:31'),
(2, 3, 1, NULL, '2021-05-03 22:52:33'),
(3, 2, 1, NULL, '2021-05-04 16:48:15'),
(4, 3, 1, NULL, '2021-05-04 16:53:29'),
(5, 4, 1, NULL, '2021-05-04 16:54:41'),
(6, 2, 1, NULL, '2021-05-10 17:35:47');

-- --------------------------------------------------------

--
-- Table structure for table `tb_guru`
--

CREATE TABLE `tb_guru` (
  `guru_id` int(11) NOT NULL,
  `guru_nip` varchar(255) DEFAULT NULL,
  `guru_nama` varchar(255) DEFAULT NULL,
  `guru_tmp_lahir` varchar(255) DEFAULT NULL,
  `guru_tgl_lahir` date DEFAULT NULL,
  `guru_jenis_kelamin` int(11) DEFAULT NULL,
  `guru_agama` varchar(255) DEFAULT NULL,
  `guru_alamat` text,
  `guru_nohp` varchar(255) DEFAULT NULL,
  `guru_foto` varchar(255) DEFAULT NULL,
  `guru_jenjang` int(11) DEFAULT NULL,
  `guru_jenjang_pendidikan` varchar(128) DEFAULT NULL,
  `guru_uid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_guru`
--

INSERT INTO `tb_guru` (`guru_id`, `guru_nip`, `guru_nama`, `guru_tmp_lahir`, `guru_tgl_lahir`, `guru_jenis_kelamin`, `guru_agama`, `guru_alamat`, `guru_nohp`, `guru_foto`, `guru_jenjang`, `guru_jenjang_pendidikan`, `guru_uid`) VALUES
(1, '19124212', 'Jane Doe', 'Jakarta', '1985-04-16', 2, 'Katolik', 'Jakarta', '0', 'team-4.jpg', 1, 'S1', 2),
(2, '19124901', 'Alan', 'Jakarta', '1988-04-02', 1, 'Islam', '.', '0', 'user-default.png', 2, 'S1', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `jadwal_id` int(11) NOT NULL,
  `jadwal_hari` int(11) DEFAULT NULL,
  `jadwal_mulai` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `jadwal_akhir` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `jadwal_kelas` int(11) DEFAULT NULL,
  `jadwal_mapel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`jadwal_id`, `jadwal_hari`, `jadwal_mulai`, `jadwal_akhir`, `jadwal_kelas`, `jadwal_mapel`) VALUES
(1, 1, '07:20', '08:50', 1, 1),
(2, 2, '10:00', '11:20', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jawaban`
--

CREATE TABLE `tb_jawaban` (
  `jawaban_id` int(11) NOT NULL,
  `jawaban_soal` int(11) DEFAULT NULL,
  `jawaban_detail` text,
  `jawaban_benar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_jawaban`
--

INSERT INTO `tb_jawaban` (`jawaban_id`, `jawaban_soal`, `jawaban_detail`, `jawaban_benar`) VALUES
(1, 1, '100', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenjang`
--

CREATE TABLE `tb_jenjang` (
  `jenjang_id` int(11) NOT NULL,
  `jenjang_nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_jenjang`
--

INSERT INTO `tb_jenjang` (`jenjang_id`, `jenjang_nama`) VALUES
(1, 'SD'),
(3, 'SMA'),
(4, 'SMK'),
(2, 'SMP');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `jurusan_id` int(11) NOT NULL,
  `jurusan_nama` varchar(255) DEFAULT NULL,
  `jurusan_jenjang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`jurusan_id`, `jurusan_nama`, `jurusan_jenjang`) VALUES
(1, 'IPA', 3),
(2, 'IPS', 3),
(3, 'TKJ', 4),
(4, 'RPL', 4),
(5, 'TKR', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `kelas_id` int(11) NOT NULL,
  `kelas_jenjang` int(11) DEFAULT NULL,
  `kelas_tingkat` int(11) DEFAULT NULL,
  `kelas_jurusan` int(11) DEFAULT NULL,
  `kelas_nama` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_kelas`
--

INSERT INTO `tb_kelas` (`kelas_id`, `kelas_jenjang`, `kelas_tingkat`, `kelas_jurusan`, `kelas_nama`) VALUES
(1, 1, 1, NULL, '1A'),
(2, 2, 7, NULL, '7A'),
(3, 3, 10, 1, 'X IPA A'),
(4, 4, 10, 3, 'X TKJ A'),
(5, 1, 2, NULL, '2B');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mapel`
--

CREATE TABLE `tb_mapel` (
  `mapel_id` int(11) NOT NULL,
  `mapel_kode` varchar(255) DEFAULT NULL,
  `mapel_nama` varchar(255) DEFAULT NULL,
  `mapel_guru` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_mapel`
--

INSERT INTO `tb_mapel` (`mapel_id`, `mapel_kode`, `mapel_nama`, `mapel_guru`) VALUES
(1, 'K0001', 'Biologi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `pembayaran_id` int(11) NOT NULL,
  `pembayaran_jenis` int(11) DEFAULT NULL,
  `pembayaran_keterangan` varchar(255) DEFAULT NULL,
  `pembayaran_bukti` varchar(255) DEFAULT NULL,
  `pembayaran_status` int(11) DEFAULT NULL,
  `pembayaran_siswa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pembayaran`
--

INSERT INTO `tb_pembayaran` (`pembayaran_id`, `pembayaran_jenis`, `pembayaran_keterangan`, `pembayaran_bukti`, `pembayaran_status`, `pembayaran_siswa`) VALUES
(1, 1, 'Biaya untuk pendaftaran.', 'wabot.png', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengumuman`
--

CREATE TABLE `tb_pengumuman` (
  `pengumuman_id` int(11) NOT NULL,
  `pengumuman_jenjang` int(11) NOT NULL,
  `pengumuman_isi` text,
  `pengumuman_waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pengumuman`
--

INSERT INTO `tb_pengumuman` (`pengumuman_id`, `pengumuman_jenjang`, `pengumuman_isi`, `pengumuman_waktu`) VALUES
(1, 1, 'Untuk siswa SD kelas 1A harap mengerjakan tugas hariannya, trims!', '2021-05-04 18:11:05'),
(2, 2, 'Untuk siswa SMP diharapkan besok mengikuti kelas online..', '2021-05-04 00:00:00'),
(3, 3, 'Semua siswa SMA besok diliburkan', '2021-05-04 18:23:41'),
(4, 1, 'Hari senin jangan lupa mengerjakan latihan soal MTK', '2021-05-04 21:42:26');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rapor`
--

CREATE TABLE `tb_rapor` (
  `rapor_id` int(11) NOT NULL,
  `rapor_semester` int(11) DEFAULT NULL,
  `rapor_file` varchar(255) DEFAULT NULL,
  `rapor_siswa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_rapor`
--

INSERT INTO `tb_rapor` (`rapor_id`, `rapor_semester`, `rapor_file`, `rapor_siswa`) VALUES
(1, 1, 'rapor.pdf', 1),
(2, 1, 'user-default.png', 3),
(3, 1, 'wabot.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `siswa_id` int(11) NOT NULL,
  `siswa_nis` varchar(255) DEFAULT NULL,
  `siswa_nama` varchar(255) DEFAULT NULL,
  `siswa_tmp_lahir` varchar(255) DEFAULT NULL,
  `siswa_tgl_lahir` date DEFAULT NULL,
  `siswa_jenis_kelamin` int(11) DEFAULT NULL,
  `siswa_agama` varchar(255) DEFAULT NULL,
  `siswa_anak_ke` int(11) DEFAULT NULL,
  `siswa_alamat` text,
  `siswa_nama_ayah` varchar(255) DEFAULT NULL,
  `siswa_nama_ibu` varchar(255) DEFAULT NULL,
  `siswa_alamat_ortu` text,
  `siswa_nohp_ortu` varchar(255) DEFAULT NULL,
  `siswa_pekerjaan_ayah` varchar(255) DEFAULT NULL,
  `siswa_pekerjaan_ibu` varchar(255) DEFAULT NULL,
  `siswa_nama_wali` varchar(255) DEFAULT NULL,
  `siswa_nohp_wali` varchar(255) DEFAULT NULL,
  `siswa_alamat_wali` text,
  `siswa_pekerjaan_wali` varchar(255) DEFAULT NULL,
  `siswa_jenjang` int(11) DEFAULT NULL,
  `siswa_kelas` int(11) DEFAULT NULL,
  `siswa_semester` varchar(255) DEFAULT NULL,
  `siswa_foto` varchar(255) DEFAULT NULL,
  `siswa_uid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`siswa_id`, `siswa_nis`, `siswa_nama`, `siswa_tmp_lahir`, `siswa_tgl_lahir`, `siswa_jenis_kelamin`, `siswa_agama`, `siswa_anak_ke`, `siswa_alamat`, `siswa_nama_ayah`, `siswa_nama_ibu`, `siswa_alamat_ortu`, `siswa_nohp_ortu`, `siswa_pekerjaan_ayah`, `siswa_pekerjaan_ibu`, `siswa_nama_wali`, `siswa_nohp_wali`, `siswa_alamat_wali`, `siswa_pekerjaan_wali`, `siswa_jenjang`, `siswa_kelas`, `siswa_semester`, `siswa_foto`, `siswa_uid`) VALUES
(1, '0', 'Yana', 'Jakarta', '2014-04-14', 1, 'Islam', 3, '.', '-', '-', '.', '0', '-', '-', '-', '0', '.', '-', 1, 1, '1', 'avatar.png', 3),
(2, '14002391', 'John Doe', 'Jakarta', '2019-03-05', 1, 'Islam', 3, '.', '-', '-', '.', '0', '-', '-', '-', '0', '.', '-', 1, 1, '1', 'wabot.png', 5),
(3, '0', 'Mariana', 'Jakarta', '2005-03-05', 2, 'Islam', 3, '.', '-', '-', '.', '0', '-', '-', '-', '0', '.', '-', 3, 3, '1', 'user-default.png', 6),
(4, '0', 'Aldo', 'Jakarta', '2002-03-05', 1, 'Islam', 3, '.', '-', '-', '.', '0', '-', '-', '-', '0', '.', '-', 1, 1, '1', 'user-default.png', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal`
--

CREATE TABLE `tb_soal` (
  `soal_id` int(11) NOT NULL,
  `soal_topik` int(11) DEFAULT NULL,
  `soal_detail` text,
  `soal_tipe` int(11) DEFAULT NULL,
  `soal_pembuat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_soal`
--

INSERT INTO `tb_soal` (`soal_id`, `soal_topik`, `soal_detail`, `soal_tipe`, `soal_pembuat`) VALUES
(1, 1, '1 + 120 = ?', 1, 1),
(2, 2, '1 + 1 = ?', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_tingkat`
--

CREATE TABLE `tb_tingkat` (
  `tingkat_id` int(11) NOT NULL,
  `tingkat_nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_tingkat`
--

INSERT INTO `tb_tingkat` (`tingkat_id`, `tingkat_nama`) VALUES
(1, '1'),
(10, '10'),
(11, '11'),
(12, '12'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, '7'),
(8, '8'),
(9, '9');

-- --------------------------------------------------------

--
-- Table structure for table `tb_topik`
--

CREATE TABLE `tb_topik` (
  `topik_id` int(11) NOT NULL,
  `topik_judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `topik_deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `topik_status` int(11) DEFAULT NULL,
  `topik_pembuat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_topik`
--

INSERT INTO `tb_topik` (`topik_id`, `topik_judul`, `topik_deskripsi`, `topik_status`, `topik_pembuat`) VALUES
(1, 'Ujian Harian.', 'Ujian Harian.', 1, 1),
(2, 'Ujian Harian SD', 'Ujian Harian SD', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_ujian`
--

CREATE TABLE `tb_ujian` (
  `ujian_id` int(11) NOT NULL,
  `ujian_judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ujian_deskripsi` text,
  `ujian_waktu_mulai` datetime DEFAULT NULL,
  `ujian_waktu_akhir` datetime DEFAULT NULL,
  `ujian_hasil_siswa` int(11) DEFAULT NULL,
  `ujian_detail_siswa` int(11) DEFAULT NULL,
  `ujian_nilai_benar` decimal(10,0) DEFAULT NULL,
  `ujian_nilai_salah` decimal(10,0) DEFAULT NULL,
  `ujian_nilai_kosong` decimal(10,0) DEFAULT NULL,
  `ujian_nilai_maks` decimal(10,0) DEFAULT NULL,
  `ujian_status` int(11) DEFAULT NULL,
  `ujian_pembuat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ujian_group`
--

CREATE TABLE `tb_ujian_group` (
  `group_ujian` int(11) DEFAULT NULL,
  `group_kelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ujian_jawaban`
--

CREATE TABLE `tb_ujian_jawaban` (
  `uj_soal` int(11) DEFAULT NULL,
  `uj_jawaban` int(11) DEFAULT NULL,
  `uj_selected` int(11) DEFAULT NULL,
  `uj_order` int(11) DEFAULT NULL,
  `uj_posisi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ujian_soal`
--

CREATE TABLE `tb_ujian_soal` (
  `us_id` int(11) NOT NULL,
  `us_users` int(11) DEFAULT NULL,
  `us_soal` int(11) DEFAULT NULL,
  `us_jawaban_teks` text,
  `us_nilai` decimal(10,0) DEFAULT NULL,
  `us_order` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ujian_topik`
--

CREATE TABLE `tb_ujian_topik` (
  `ut_id` int(11) NOT NULL,
  `ut_ujian` int(11) DEFAULT NULL,
  `ut_topik` int(11) DEFAULT NULL,
  `ut_tipe` int(11) DEFAULT NULL,
  `ut_total` int(11) DEFAULT NULL,
  `ut_jawaban` int(11) DEFAULT NULL,
  `ut_jawaban_acak` int(11) DEFAULT NULL,
  `ut_soal_acak` int(11) DEFAULT NULL,
  `ut_ujian_tampil` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ujian_users`
--

CREATE TABLE `tb_ujian_users` (
  `users_id` int(11) NOT NULL,
  `users_ujian` int(11) DEFAULT NULL,
  `users_siswa` int(11) DEFAULT NULL,
  `users_status` int(11) DEFAULT NULL,
  `users_tgl_pengerjaan` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT '0' COMMENT '1 = admin, 2 = guru, 3 = siswa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$7sqSt.26.IwKlQd47nd3cehwS8DhIH5STS/TVl/8b2wUzxAsrWZYq', 1),
(2, 'gurusd', 'gurusd@gmail.com', '$2y$10$xpV0.l.a3BxDFjd8FUQvo.DMieTm9qtoJe8qlNQg9IoKKfFRDQwAa', 2),
(3, 'siswasd', 'siswasd@gmail.com', '$2y$10$XJmwXBaO3uRuOYClnFwy1OjiSHOA9BurEPp89p1oU0oQP.k3ABnIO', 3),
(4, 'gurusmp', 'gurusmp@gmail.com', '$2y$10$h.6VEgIwaACeucm6x/toE.Uknxxn6Bei4QD/VkQc4nnGQSBhP9boO', 2),
(5, 'siswasd2', 'siswasd2@gmail.com', '$2y$10$BDOy9F59PZ7gIDx/jBodgOxrfrnNpF.SV7nUyhHvv8SWs8QUXBJLy', 3),
(6, 'siswasma', 'siswasma@gmail.com', '$2y$10$S42BkHkklSRCbZ1bHOl0K.96obZx1XknbkkZXkwKT4zi.Sz2qRcVa', 3),
(7, 'aldo', 'aldo@gmail.com', '$2y$10$mZh0Cl.mcNs3SiJAfUMTMe9xj33pay4iFWWpYXfj3n9u6fx6oKEDK', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_absen`
--
ALTER TABLE `tb_absen`
  ADD PRIMARY KEY (`absen_id`),
  ADD KEY `absen_user` (`absen_user`);

--
-- Indexes for table `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`guru_id`),
  ADD KEY `guru_uid` (`guru_uid`),
  ADD KEY `guru_jenjang` (`guru_jenjang`);

--
-- Indexes for table `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD PRIMARY KEY (`jadwal_id`),
  ADD KEY `jadwal_kelas` (`jadwal_kelas`),
  ADD KEY `jadwal_mapel` (`jadwal_mapel`);

--
-- Indexes for table `tb_jawaban`
--
ALTER TABLE `tb_jawaban`
  ADD PRIMARY KEY (`jawaban_id`),
  ADD KEY `jawaban_soal` (`jawaban_soal`);

--
-- Indexes for table `tb_jenjang`
--
ALTER TABLE `tb_jenjang`
  ADD PRIMARY KEY (`jenjang_id`),
  ADD UNIQUE KEY `jenjang_nama` (`jenjang_nama`);

--
-- Indexes for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`jurusan_id`),
  ADD UNIQUE KEY `jurusan_nama` (`jurusan_nama`);

--
-- Indexes for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`kelas_id`),
  ADD KEY `kelas_jenjang` (`kelas_jenjang`),
  ADD KEY `kelas_tingkat` (`kelas_tingkat`),
  ADD KEY `kelas_jurusan` (`kelas_jurusan`);

--
-- Indexes for table `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD PRIMARY KEY (`mapel_id`),
  ADD UNIQUE KEY `mapel_kode` (`mapel_kode`),
  ADD KEY `mapel_guru` (`mapel_guru`);

--
-- Indexes for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`pembayaran_id`),
  ADD KEY `pembayaran_siswa` (`pembayaran_siswa`);

--
-- Indexes for table `tb_pengumuman`
--
ALTER TABLE `tb_pengumuman`
  ADD PRIMARY KEY (`pengumuman_id`),
  ADD KEY `pengumuman_jenjang` (`pengumuman_jenjang`);

--
-- Indexes for table `tb_rapor`
--
ALTER TABLE `tb_rapor`
  ADD PRIMARY KEY (`rapor_id`),
  ADD KEY `rapor_siswa` (`rapor_siswa`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`siswa_id`),
  ADD KEY `siswa_jenjang_pendidikan` (`siswa_jenjang`),
  ADD KEY `siswa_kelas` (`siswa_kelas`),
  ADD KEY `siswa_uid` (`siswa_uid`);

--
-- Indexes for table `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`soal_id`),
  ADD KEY `soal_topik` (`soal_topik`),
  ADD KEY `soal_pembuat` (`soal_pembuat`);

--
-- Indexes for table `tb_tingkat`
--
ALTER TABLE `tb_tingkat`
  ADD PRIMARY KEY (`tingkat_id`),
  ADD UNIQUE KEY `tingkat_nama` (`tingkat_nama`);

--
-- Indexes for table `tb_topik`
--
ALTER TABLE `tb_topik`
  ADD PRIMARY KEY (`topik_id`),
  ADD KEY `topik_pembuat` (`topik_pembuat`);

--
-- Indexes for table `tb_ujian`
--
ALTER TABLE `tb_ujian`
  ADD PRIMARY KEY (`ujian_id`),
  ADD KEY `ujian_pembuat` (`ujian_pembuat`);

--
-- Indexes for table `tb_ujian_group`
--
ALTER TABLE `tb_ujian_group`
  ADD KEY `group_ujian` (`group_ujian`),
  ADD KEY `group_kelas` (`group_kelas`);

--
-- Indexes for table `tb_ujian_jawaban`
--
ALTER TABLE `tb_ujian_jawaban`
  ADD KEY `uj_soal` (`uj_soal`),
  ADD KEY `uj_jawaban` (`uj_jawaban`);

--
-- Indexes for table `tb_ujian_soal`
--
ALTER TABLE `tb_ujian_soal`
  ADD PRIMARY KEY (`us_id`),
  ADD KEY `us_users` (`us_users`),
  ADD KEY `us_soal` (`us_soal`);

--
-- Indexes for table `tb_ujian_topik`
--
ALTER TABLE `tb_ujian_topik`
  ADD PRIMARY KEY (`ut_id`),
  ADD KEY `ut_ujian` (`ut_ujian`),
  ADD KEY `ut_topik` (`ut_topik`);

--
-- Indexes for table `tb_ujian_users`
--
ALTER TABLE `tb_ujian_users`
  ADD PRIMARY KEY (`users_id`),
  ADD KEY `users_ujian` (`users_ujian`),
  ADD KEY `users_siswa` (`users_siswa`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_absen`
--
ALTER TABLE `tb_absen`
  MODIFY `absen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `guru_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  MODIFY `jadwal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_jawaban`
--
ALTER TABLE `tb_jawaban`
  MODIFY `jawaban_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_jenjang`
--
ALTER TABLE `tb_jenjang`
  MODIFY `jenjang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  MODIFY `jurusan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `kelas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_mapel`
--
ALTER TABLE `tb_mapel`
  MODIFY `mapel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  MODIFY `pembayaran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_pengumuman`
--
ALTER TABLE `tb_pengumuman`
  MODIFY `pengumuman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_rapor`
--
ALTER TABLE `tb_rapor`
  MODIFY `rapor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `siswa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `soal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_tingkat`
--
ALTER TABLE `tb_tingkat`
  MODIFY `tingkat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_topik`
--
ALTER TABLE `tb_topik`
  MODIFY `topik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_ujian`
--
ALTER TABLE `tb_ujian`
  MODIFY `ujian_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_ujian_soal`
--
ALTER TABLE `tb_ujian_soal`
  MODIFY `us_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_ujian_topik`
--
ALTER TABLE `tb_ujian_topik`
  MODIFY `ut_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_ujian_users`
--
ALTER TABLE `tb_ujian_users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_absen`
--
ALTER TABLE `tb_absen`
  ADD CONSTRAINT `tb_absen_ibfk_1` FOREIGN KEY (`absen_user`) REFERENCES `tb_user` (`id`);

--
-- Constraints for table `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD CONSTRAINT `tb_guru_ibfk_2` FOREIGN KEY (`guru_uid`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `tb_guru_ibfk_3` FOREIGN KEY (`guru_jenjang`) REFERENCES `tb_jenjang` (`jenjang_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD CONSTRAINT `tb_jadwal_ibfk_1` FOREIGN KEY (`jadwal_kelas`) REFERENCES `tb_kelas` (`kelas_id`),
  ADD CONSTRAINT `tb_jadwal_ibfk_2` FOREIGN KEY (`jadwal_mapel`) REFERENCES `tb_mapel` (`mapel_id`);

--
-- Constraints for table `tb_jawaban`
--
ALTER TABLE `tb_jawaban`
  ADD CONSTRAINT `tb_jawaban_ibfk_1` FOREIGN KEY (`jawaban_soal`) REFERENCES `tb_soal` (`soal_id`);

--
-- Constraints for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD CONSTRAINT `tb_kelas_ibfk_1` FOREIGN KEY (`kelas_jenjang`) REFERENCES `tb_jenjang` (`jenjang_id`),
  ADD CONSTRAINT `tb_kelas_ibfk_2` FOREIGN KEY (`kelas_tingkat`) REFERENCES `tb_tingkat` (`tingkat_id`),
  ADD CONSTRAINT `tb_kelas_ibfk_3` FOREIGN KEY (`kelas_jurusan`) REFERENCES `tb_jurusan` (`jurusan_id`);

--
-- Constraints for table `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD CONSTRAINT `tb_mapel_ibfk_1` FOREIGN KEY (`mapel_guru`) REFERENCES `tb_guru` (`guru_id`);

--
-- Constraints for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD CONSTRAINT `tb_pembayaran_ibfk_1` FOREIGN KEY (`pembayaran_siswa`) REFERENCES `tb_siswa` (`siswa_id`);

--
-- Constraints for table `tb_pengumuman`
--
ALTER TABLE `tb_pengumuman`
  ADD CONSTRAINT `tb_pengumuman_ibfk_2` FOREIGN KEY (`pengumuman_jenjang`) REFERENCES `tb_jenjang` (`jenjang_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_rapor`
--
ALTER TABLE `tb_rapor`
  ADD CONSTRAINT `tb_rapor_ibfk_1` FOREIGN KEY (`rapor_siswa`) REFERENCES `tb_siswa` (`siswa_id`);

--
-- Constraints for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`siswa_jenjang`) REFERENCES `tb_jenjang` (`jenjang_id`),
  ADD CONSTRAINT `tb_siswa_ibfk_2` FOREIGN KEY (`siswa_kelas`) REFERENCES `tb_kelas` (`kelas_id`),
  ADD CONSTRAINT `tb_siswa_ibfk_3` FOREIGN KEY (`siswa_uid`) REFERENCES `tb_user` (`id`);

--
-- Constraints for table `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD CONSTRAINT `tb_soal_ibfk_1` FOREIGN KEY (`soal_topik`) REFERENCES `tb_topik` (`topik_id`);

--
-- Constraints for table `tb_topik`
--
ALTER TABLE `tb_topik`
  ADD CONSTRAINT `tb_topik_ibfk_1` FOREIGN KEY (`topik_pembuat`) REFERENCES `tb_user` (`id`);

--
-- Constraints for table `tb_ujian`
--
ALTER TABLE `tb_ujian`
  ADD CONSTRAINT `tb_ujian_ibfk_1` FOREIGN KEY (`ujian_pembuat`) REFERENCES `tb_user` (`id`);

--
-- Constraints for table `tb_ujian_group`
--
ALTER TABLE `tb_ujian_group`
  ADD CONSTRAINT `tb_ujian_group_ibfk_1` FOREIGN KEY (`group_ujian`) REFERENCES `tb_ujian` (`ujian_id`),
  ADD CONSTRAINT `tb_ujian_group_ibfk_2` FOREIGN KEY (`group_kelas`) REFERENCES `tb_kelas` (`kelas_id`);

--
-- Constraints for table `tb_ujian_jawaban`
--
ALTER TABLE `tb_ujian_jawaban`
  ADD CONSTRAINT `tb_ujian_jawaban_ibfk_1` FOREIGN KEY (`uj_soal`) REFERENCES `tb_ujian_soal` (`us_id`),
  ADD CONSTRAINT `tb_ujian_jawaban_ibfk_2` FOREIGN KEY (`uj_jawaban`) REFERENCES `tb_jawaban` (`jawaban_id`);

--
-- Constraints for table `tb_ujian_soal`
--
ALTER TABLE `tb_ujian_soal`
  ADD CONSTRAINT `tb_ujian_soal_ibfk_1` FOREIGN KEY (`us_users`) REFERENCES `tb_ujian_users` (`users_id`),
  ADD CONSTRAINT `tb_ujian_soal_ibfk_2` FOREIGN KEY (`us_soal`) REFERENCES `tb_soal` (`soal_id`);

--
-- Constraints for table `tb_ujian_topik`
--
ALTER TABLE `tb_ujian_topik`
  ADD CONSTRAINT `tb_ujian_topik_ibfk_1` FOREIGN KEY (`ut_ujian`) REFERENCES `tb_ujian` (`ujian_id`),
  ADD CONSTRAINT `tb_ujian_topik_ibfk_2` FOREIGN KEY (`ut_topik`) REFERENCES `tb_topik` (`topik_id`);

--
-- Constraints for table `tb_ujian_users`
--
ALTER TABLE `tb_ujian_users`
  ADD CONSTRAINT `tb_ujian_users_ibfk_1` FOREIGN KEY (`users_ujian`) REFERENCES `tb_ujian` (`ujian_id`),
  ADD CONSTRAINT `tb_ujian_users_ibfk_2` FOREIGN KEY (`users_siswa`) REFERENCES `tb_siswa` (`siswa_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
