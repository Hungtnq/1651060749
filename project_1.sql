-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 30, 2019 lúc 05:31 PM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `project_1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baiviet`
--

CREATE TABLE `baiviet` (
  `mabv` int(10) NOT NULL,
  `tieude` text NOT NULL,
  `tomtat` text NOT NULL,
  `noidung` longtext NOT NULL,
  `maqt` int(10) DEFAULT NULL,
  `ngaydang` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diem`
--

CREATE TABLE `diem` (
  `masv` int(10) NOT NULL,
  `malop` int(10) NOT NULL,
  `diemqt` float DEFAULT NULL,
  `diemthi` float DEFAULT NULL,
  `diemhp` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giangvien`
--

CREATE TABLE `giangvien` (
  `magv` int(10) NOT NULL,
  `tengv` varchar(30) NOT NULL,
  `quequan` longtext NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` char(5) NOT NULL,
  `CMTND` int(12) NOT NULL,
  `maNg` int(10) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--

CREATE TABLE `khoa` (
  `maK` int(10) NOT NULL,
  `tenK` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lophoc`
--

CREATE TABLE `lophoc` (
  `malop` int(10) NOT NULL,
  `tenlop` varchar(30) NOT NULL,
  `sldiem` int(10) DEFAULT NULL,
  `trongso` char(3) NOT NULL,
  `Namhoc` varchar(10) NOT NULL,
  `Kyhoc` varchar(10) NOT NULL,
  `Giaidoan` varchar(10) NOT NULL,
  `mamon` int(10) NOT NULL,
  `magv` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monhoc`
--

CREATE TABLE `monhoc` (
  `mamon` int(10) NOT NULL,
  `tenmon` varchar(30) NOT NULL,
  `maNg` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nganh`
--

CREATE TABLE `nganh` (
  `maNg` int(10) NOT NULL,
  `tenNg` varchar(30) NOT NULL,
  `maK` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quanly`
--

CREATE TABLE `quanly` (
  `maql` int(10) NOT NULL,
  `tenql` varchar(30) NOT NULL,
  `quequan` longtext NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` char(5) NOT NULL,
  `CMTND` int(12) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quantri`
--

CREATE TABLE `quantri` (
  `maqt` int(10) NOT NULL,
  `tenqt` varchar(30) NOT NULL,
  `quequan` longtext NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` char(5) NOT NULL,
  `CMTND` int(12) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `masv` int(10) NOT NULL,
  `tensv` varchar(30) NOT NULL,
  `quequan` longtext NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` char(5) NOT NULL,
  `CMTND` int(12) NOT NULL,
  `maNg` int(10) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(10) NOT NULL,
  `tenTK` varchar(30) NOT NULL,
  `matkhau` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `chucvu` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `tenTK`, `matkhau`, `email`, `chucvu`) VALUES
(1, 'quochung', 'abcabc', 'hung@gmail.com', 'sinhvien'),
(2, 'quanghuy', '123456', 'huy@gmail.com', 'giangvien'),
(3, 'thanhlien', '123456', 'lien@gmail.com', 'quanly'),
(4, 'ducmanh', '123456', 'manh@gmail.com', 'quantri');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`mabv`),
  ADD KEY `maqt` (`maqt`);

--
-- Chỉ mục cho bảng `diem`
--
ALTER TABLE `diem`
  ADD PRIMARY KEY (`masv`,`malop`),
  ADD KEY `malop` (`malop`);

--
-- Chỉ mục cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD PRIMARY KEY (`magv`),
  ADD KEY `id` (`id`),
  ADD KEY `maNg` (`maNg`);

--
-- Chỉ mục cho bảng `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`maK`);

--
-- Chỉ mục cho bảng `lophoc`
--
ALTER TABLE `lophoc`
  ADD PRIMARY KEY (`malop`),
  ADD KEY `magv` (`magv`),
  ADD KEY `mamon` (`mamon`);

--
-- Chỉ mục cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD PRIMARY KEY (`mamon`),
  ADD KEY `maNg` (`maNg`);

--
-- Chỉ mục cho bảng `nganh`
--
ALTER TABLE `nganh`
  ADD PRIMARY KEY (`maNg`),
  ADD KEY `maK` (`maK`);

--
-- Chỉ mục cho bảng `quanly`
--
ALTER TABLE `quanly`
  ADD PRIMARY KEY (`maql`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `quantri`
--
ALTER TABLE `quantri`
  ADD PRIMARY KEY (`maqt`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`masv`),
  ADD KEY `id` (`id`),
  ADD KEY `maNg` (`maNg`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD CONSTRAINT `baiviet_ibfk_1` FOREIGN KEY (`maqt`) REFERENCES `quantri` (`maqt`);

--
-- Các ràng buộc cho bảng `diem`
--
ALTER TABLE `diem`
  ADD CONSTRAINT `diem_ibfk_1` FOREIGN KEY (`masv`) REFERENCES `sinhvien` (`masv`),
  ADD CONSTRAINT `diem_ibfk_2` FOREIGN KEY (`malop`) REFERENCES `lophoc` (`malop`);

--
-- Các ràng buộc cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD CONSTRAINT `giangvien_ibfk_1` FOREIGN KEY (`id`) REFERENCES `taikhoan` (`id`),
  ADD CONSTRAINT `giangvien_ibfk_2` FOREIGN KEY (`maNg`) REFERENCES `nganh` (`maNg`);

--
-- Các ràng buộc cho bảng `lophoc`
--
ALTER TABLE `lophoc`
  ADD CONSTRAINT `lophoc_ibfk_1` FOREIGN KEY (`magv`) REFERENCES `giangvien` (`magv`),
  ADD CONSTRAINT `lophoc_ibfk_2` FOREIGN KEY (`mamon`) REFERENCES `monhoc` (`mamon`);

--
-- Các ràng buộc cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD CONSTRAINT `monhoc_ibfk_1` FOREIGN KEY (`maNg`) REFERENCES `nganh` (`maNg`);

--
-- Các ràng buộc cho bảng `nganh`
--
ALTER TABLE `nganh`
  ADD CONSTRAINT `nganh_ibfk_1` FOREIGN KEY (`maK`) REFERENCES `khoa` (`maK`);

--
-- Các ràng buộc cho bảng `quanly`
--
ALTER TABLE `quanly`
  ADD CONSTRAINT `quanly_ibfk_1` FOREIGN KEY (`id`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `quantri`
--
ALTER TABLE `quantri`
  ADD CONSTRAINT `quantri_ibfk_1` FOREIGN KEY (`id`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`id`) REFERENCES `taikhoan` (`id`),
  ADD CONSTRAINT `sinhvien_ibfk_2` FOREIGN KEY (`maNg`) REFERENCES `nganh` (`maNg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
