-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2021 at 10:35 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `1111`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Cat_ID` varchar(10) NOT NULL,
  `Cat_Name` varchar(30) NOT NULL,
  `Cat_Des` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Cat_ID`, `Cat_Name`, `Cat_Des`) VALUES
('1', 'Nike', 'Nike shoes'),
('3', 'Jordan', 'nike description'),
('4', 'NIKE 1', 'New product');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `CustName` varchar(30) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `Address` varchar(1000) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `CusDate` int(11) DEFAULT NULL,
  `CusMonth` int(11) DEFAULT NULL,
  `CusYear` int(11) DEFAULT NULL,
  `SSN` varchar(10) NOT NULL,
  `ActiveCode` varchar(100) NOT NULL,
  `state` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Username`, `Password`, `CustName`, `gender`, `Address`, `telephone`, `email`, `CusDate`, `CusMonth`, `CusYear`, `SSN`, `ActiveCode`, `state`) VALUES
('admin', 'a0e70be9e8f538282678aecf1ecc1f43', 'le kha van', 0, 'can tho', '05269852466', 'vanlkgcc@fpt.edu.vn', 26, 9, 2000, '', '', 1),
('lekhavan123', 'e10adc3949ba59abbe56e057f20f883e', 'LE KHA VAN', 0, 'Soc Trang- Viet Nam', '0123123986', 'khavanle@gmail.com', 17, 3, 1991, '', '', 0),
('lkhavan', 'a0e70be9e8f538282678aecf1ecc1f43', 'nguyenphuvinh', 0, 'can tho cai rang', '09564562133', 'vankl@gmail.com', 1, 1, 2000, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` varchar(6) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `DeliveryDate` datetime NOT NULL,
  `Delivery_loca` varchar(200) NOT NULL,
  `Payment` int(11) DEFAULT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` varchar(10) NOT NULL,
  `Product_Name` varchar(30) NOT NULL,
  `Price` bigint(20) DEFAULT NULL,
  `SmallDesc` varchar(1000) NOT NULL,
  `DetailDesc` text NOT NULL,
  `ProDate` datetime NOT NULL,
  `Pro_qty` int(11) DEFAULT NULL,
  `Pro_image` varchar(200) NOT NULL,
  `Cat_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Product_Name`, `Price`, `SmallDesc`, `DetailDesc`, `ProDate`, `Pro_qty`, `Pro_image`, `Cat_ID`) VALUES
('1', 'Nike af1 shadow white crimson ', 90, 'New product', 'New product', '2020-12-24 09:21:41', 4, 'Nike af1 shadow white crimson tint.jpg', '3'),
('2', 'nike air force 1', 185, 'New product', 'New product', '2020-12-26 04:41:24', 2, 'Nike Air Force 1.jpg', '4'),
('3', 'nike air force 1 shadow', 110, 'New product', 'New product', '2020-12-23 14:11:35', 5, 'air-force-1-shadow.jpeg', '1'),
('4', 'Jordan 1 low shatterd backboar', 108, 'New product', 'New product', '2020-12-24 08:14:06', 3, 'Jordan 1 low shatterd backboard.jpg', '3'),
('5', 'Jordan 1 low USA', 75, 'New product', 'New product', '2020-12-23 14:13:03', 5, 'Jordan 1 low USA.jpg', '1'),
('6', 'Jordan low laser blue', 230, 'New product', 'New product', '2020-12-26 04:17:09', 2, 'Jordan low laser blue.png', '4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Cat_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Cat_ID` (`Cat_ID`),
  ADD KEY `Cat_ID_2` (`Cat_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customer` (`Username`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Cat_ID`) REFERENCES `category` (`Cat_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
