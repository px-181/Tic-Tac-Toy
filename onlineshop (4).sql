-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2024 at 01:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshop`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b'),
(0, 'admin123', 'admin123@gmail.com', 'e6e061838856bf47e1de730719fb2609');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `user_id`, `qty`) VALUES
(48, 8, 42, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Aeroplan\r\n'),
(2, 'Truck'),
(3, 'Teddy bear'),
(4, 'Car');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 45, 'om patel', 'om121@gmail.com', 'om palace', 'surat', 'Gujarat', 394210, 'prince', '123456789456', '09/09', 2, 1450, 165);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(1, 1, 2, 1, 900),
(2, 1, 10, 1, 965),
(3, 1, 11, 1, 955),
(4, 2, 2, 1, 900),
(5, 2, 2, 1, 850),
(6, 3, 4, 1, 600),
(7, 3, 5, 1, 850),
(8, 4, 10, 1, 965),
(9, 4, 2, 1, 900),
(10, 5, 1, 1, 750),
(11, 6, 4, 1, 600),
(12, 6, 5, 1, 850),
(13, 6, 6, 1, 900),
(14, 7, 1, 1, 750),
(15, 7, 2, 1, 850),
(16, 8, 2, 1, 900),
(17, 9, 10, 1, 965),
(18, 9, 2, 1, 850),
(19, 10, 2, 1, 850),
(20, 11, 2, 1, 850),
(21, 12, 8, 1, 695),
(22, 13, 2, 1, 900),
(23, 14, 4, 1, 600),
(24, 15, 9, 1, 855),
(25, 16, 8, 1, 695),
(26, 17, 8, 1, 695),
(27, 18, 4, 1, 600),
(28, 1, 4, 1, 600),
(29, 2, 2, 1, 850),
(30, 1, 1, 1, 750),
(31, 2, 2, 1, 900),
(32, 1, 4, 1, 600),
(33, 1, 5, 1, 850);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_title`, `product_price`, `product_image`) VALUES
(1, 1, 'Aeroplan A1', 750, '1724911122_images (1).jpeg'),
(2, 1, 'Aeroplan A2', 850, '1724911021_images.jpeg'),
(3, 1, 'Aeroplan A2', 900, '1724911037_950df2999d5d5a9865484d0d7faaf2cf.jpg'),
(4, 2, 'Truck T1', 600, '1724911187_61mJsdonstL._AC_UF1000,1000_QL80_.jpg'),
(5, 2, 'Truck T2', 850, '1724911220_71D76SP+69L._AC_UF1000,1000_QL80_.jpg'),
(6, 2, 'Truck T3', 900, '1724911262_images (2).jpeg'),
(7, 3, 'Teddy Bear TB1', 685, '1724911361_images (4).jpeg'),
(8, 3, 'Teddy Bear TB2', 695, '1724911388_images (5).jpeg'),
(9, 3, 'Teddy Bear TB3', 855, '1724911412_images (3).jpeg'),
(10, 4, 'Car C1', 965, '1724911434_images (8).jpeg'),
(11, 4, 'Car C2', 955, '1724911465_images (7).jpeg'),
(12, 4, 'Car C3', 865, '1724911493_81LefKqbXNL.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `review` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `product_id`, `name`, `email`, `review`, `datetime`, `rating`) VALUES
(1, 2, 'Prince Patel', 'prince5423patel@gmail.com', 'good', '2024-10-19 14:51:07', 5),
(2, 2, 'Nishta', 'nish123@gmail.com', 'outstanding', '2024-10-21 08:58:23', 5),
(3, 2, 'om', 'om123@gmail.com', 'good', '2024-10-21 09:20:01', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'support', '1234446576', 'New York', 'Kumbalagodu'),
(26, 'prince', 'Patel', 'prince5423patel@gmail.com', 'px@181...', '8980988363', 'B-51', 'Swastik res'),
(27, 'kishan', 'error', 'kishan@gmail.com', 'ks@189...', '1234567890', 'A-1', 'surat'),
(35, 'dhruv', 'modi', 'dhruv@gmail.com', 'dhruv@123...', '9988998899', 'katargam', 'surat'),
(37, 'gu', 'thum', 'guni123@gmail.com', '$2y$10$L9wzrHm7D4CzED.UTuU.U.ReJr7nDKjtjPde9e87O1g3hnqwY.tNC', '9966996699', 'gu-1', 'bardoli'),
(38, 'khushi', 'patel', 'khushi@gmail.com', 'khushi@123...', '8963889977', 'shubh resi.', 'chikhli'),
(39, 'aneri ', 'shah', 'aneri@gmail.com', 'aneri@123...', '9863578569', 'royal palace', 'surat'),
(40, 'om', 'patel', 'om@gmail.com', 'om@123...', '8877996655', 'maliba', 'bardoli'),
(41, 'riya', 'patel', 'riya55@gmail.com', 'riya#55...', '7896354523', 'A-1 silver ', 'up'),
(42, 'Prince Patel', 'Patel', 'prince54patel@gmail.com', 'prince#11', '8980988363', 'B-52', 'Swastik res'),
(43, 'Nishta', 'Hindustani', 'nish123@gmail.com', 'nish123@...', '1234567890', 'xyz', 'bardoli'),
(44, 'Om', 'patel', 'om1234@gmail.com', '$2y$10$3vO2lHELNVIHgxiRp8jTAO5y2lSjeM/FtEff5DBM4scmfMQd2vKn.', '7898745632', 'A-1 complex', 'surat'),
(45, 'om', 'patel', 'om121@gmail.com', 'om@123...', '7799663322', 'om palace', 'surat');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(35, 'dhruv', 'modi', 'dhruv@gmail.com', 'dhruv@123...', '9988998899', 'katargam', 'surat'),
(36, 'het', 'patel', 'het@gmail.com', 'het@123...', '8899775566', '102', 'Surat'),
(37, 'guni', 'thummar', 'guni@gmail.com', 'guni@123...', '9639639631', 'b-1', 'surat'),
(38, 'khushi', 'patel', 'khushi@gmail.com', 'khushi@123...', '8963889977', 'shubh resi.', 'chikhli'),
(39, 'aneri ', 'shah', 'aneri@gmail.com', 'aneri@123...', '9863578569', 'royal palace', 'surat'),
(40, 'om', 'patel', 'om@gmail.com', 'om@123...', '8877996655', 'maliba', 'bardoli'),
(41, 'riya', 'patel', 'riya55@gmail.com', 'riya#55...', '7896354523', 'A-1 silver ', 'surat'),
(42, 'Prince Patel', 'Patel', 'prince54patel@gmail.com', 'prince#11', '8980988363', 'B-51', 'Swastik res'),
(43, 'Nishta', 'Hindustani', 'nish123@gmail.com', 'nish123@...', '1234567890', 'xyz', 'bardoli'),
(44, 'om', 'patel', 'om123@gmail.com', 'om@123...', '7898745632', 'A-1 complex', 'surat'),
(45, 'om', 'patel', 'om121@gmail.com', 'om@123...', '7799663322', 'om palace', 'bardoli');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `p_id`, `user_id`) VALUES
(5, 0, 26),
(10, 0, 26),
(13, 0, 35),
(20, 0, 26),
(26, 0, 43),
(28, 0, 45),
(30, 0, 45);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
