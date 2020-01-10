-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 10, 2020 lúc 11:44 AM
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

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addStuToClass_ma` (`maSV` INT(10), `maLop` INT(10))  BEGIN
	INSERT INTO diem(masv,malop) VALUES(maSV,maLop);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Banish` (IN `maSV` VARCHAR(30), IN `maLop` INT(10))  BEGIN
    UPDATE diem SET diemthi = 0 where masv = maSV and malop = maLop;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DelClass` (IN `maLop` INT(10))  BEGIN
	DELETE FROM lophoc where malop = maLop;
END$$

DELIMITER ;

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

--
-- Đang đổ dữ liệu cho bảng `baiviet`
--

INSERT INTO `baiviet` (`mabv`, `tieude`, `tomtat`, `noidung`, `maqt`, `ngaydang`) VALUES
(1, 'first', 'afdfdsfsdf', 'sfsdfsdfs', 1, '2020-01-08');

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

--
-- Đang đổ dữ liệu cho bảng `diem`
--

INSERT INTO `diem` (`masv`, `malop`, `diemqt`, `diemthi`, `diemhp`) VALUES
(1, 1, 9, 10, NULL);

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

--
-- Đang đổ dữ liệu cho bảng `giangvien`
--

INSERT INTO `giangvien` (`magv`, `tengv`, `quequan`, `ngaysinh`, `gioitinh`, `CMTND`, `maNg`, `id`) VALUES
(1, 'Quang Huy', 'Ha Noi', '1995-04-05', 'nam', 45465760, 1, 23);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--

CREATE TABLE `khoa` (
  `maK` int(10) NOT NULL,
  `tenK` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `khoa`
--

INSERT INTO `khoa` (`maK`, `tenK`) VALUES
(1, 'CNTT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lophoc`
--

CREATE TABLE `lophoc` (
  `malop` int(10) NOT NULL,
  `tenlop` varchar(30) NOT NULL,
  `trongso` float NOT NULL,
  `Namhoc` varchar(10) NOT NULL,
  `Kyhoc` varchar(10) NOT NULL,
  `Giaidoan` varchar(10) DEFAULT NULL,
  `mamon` int(10) NOT NULL,
  `magv` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `lophoc`
--

INSERT INTO `lophoc` (`malop`, `tenlop`, `trongso`, `Namhoc`, `Kyhoc`, `Giaidoan`, `mamon`, `magv`) VALUES
(1, 'ATBM.01', 0.4, '2019_2020', '2', '1', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monhoc`
--

CREATE TABLE `monhoc` (
  `mamon` int(10) NOT NULL,
  `tenmon` varchar(30) NOT NULL,
  `maNg` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `monhoc`
--

INSERT INTO `monhoc` (`mamon`, `tenmon`, `maNg`) VALUES
(1, 'An toan bao mat', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nganh`
--

CREATE TABLE `nganh` (
  `maNg` int(10) NOT NULL,
  `tenNg` varchar(30) NOT NULL,
  `maK` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `nganh`
--

INSERT INTO `nganh` (`maNg`, `tenNg`, `maK`) VALUES
(1, 'CNTT', 1);

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

--
-- Đang đổ dữ liệu cho bảng `quanly`
--

INSERT INTO `quanly` (`maql`, `tenql`, `quequan`, `ngaysinh`, `gioitinh`, `CMTND`, `id`) VALUES
(1, 'Thanh Lien', 'Ha Noi', '1995-04-05', 'nu', 45465764, 22);

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

--
-- Đang đổ dữ liệu cho bảng `quantri`
--

INSERT INTO `quantri` (`maqt`, `tenqt`, `quequan`, `ngaysinh`, `gioitinh`, `CMTND`, `id`) VALUES
(1, 'Duc Manh', 'Vinh', '1990-04-05', 'nam', 45465768, 19);

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

--
-- Đang đổ dữ liệu cho bảng `sinhvien`
--

INSERT INTO `sinhvien` (`masv`, `tensv`, `quequan`, `ngaysinh`, `gioitinh`, `CMTND`, `maNg`, `id`) VALUES
(1, 'Quoc Hung', 'Ha Noi', '1998-04-05', 'nam', 45465767, 1, 20),
(2, 'Hong Thuy', 'Hai Duong', '1997-12-31', 'nu', 45465762, 1, 24);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(10) NOT NULL,
  `tenTK` varchar(30) NOT NULL,
  `matkhau` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `chucvu` varchar(10) DEFAULT NULL,
  `thoigian` int(10) DEFAULT NULL,
  `trangthai` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `tenTK`, `matkhau`, `email`, `chucvu`, `thoigian`, `trangthai`) VALUES
(19, 'ducmanh', 'c3c18ef619baff128b11ef1f6c9d360c', 'manh@gmail.com', 'quantri', 1578625759, 1),
(20, 'quochung', 'd2210e19906ba471f0f8bb91b840bcc7', 'hung@gmail.com', 'sinhvien', 1578627263, 1),
(22, 'thanhlien', '369f86984c58946fd2a96f2ed5fcdac9', 'lien@gmail.com', 'quanly', 1578627379, 1),
(23, 'quanghuy', '183a04c130590ce80f32527a8b68f888', 'huy@gmail.com', 'giangvien', 1578627480, 1),
(24, 'hongthuy', '8f3a5b603d7771344ca0f4569043615c', 'thuy@gmail.com', 'sinhvien', 1578649128, 1);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
