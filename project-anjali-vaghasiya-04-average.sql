-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2023 at 09:42 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project-anjali-vaghasiya-04-average`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`, `status`, `create_at`, `update_at`) VALUES
(8, '', '', 1, '2023-04-11 07:03:41', NULL),
(9, 'ab@gmail.com', '', 1, '2023-04-11 10:21:51', '2023-04-11 10:23:34'),
(10, '', '', 1, '2023-04-12 09:12:42', '2023-04-12 09:12:47'),
(11, '', '', 1, '2023-04-12 11:17:24', NULL),
(12, '', '', 1, '2023-04-13 08:58:05', NULL),
(13, '', '', 1, '2023-04-13 08:58:09', NULL),
(14, '', '', 1, '2023-04-13 08:58:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `text_percent` int(11) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `shipping_id`, `text_percent`, `create_at`) VALUES
(1, 8, 7, '2023-03-14 12:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `cart_item_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cost` int(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `path` varchar(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `description` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `parent_id`, `name`, `path`, `status`, `description`, `create_at`, `update_at`) VALUES
(42, NULL, 'aaaaass', '', 1, 'aaa', '2023-03-25 11:18:23', '2023-03-25 07:53:15'),
(55, 42, 'abc', '', 1, '', '2023-03-25 12:23:35', NULL),
(56, 55, 'aASWSW', '', 1, '', '2023-03-25 12:23:47', NULL),
(57, 55, 'aaa', '', 1, '', '2023-03-28 11:31:48', '2023-03-28 10:32:08'),
(62, 70, 'livingRoom', '', 1, 'shnujsxikjsx', '2023-03-29 11:00:00', NULL),
(63, 62, 'hello', '', 1, '', '2023-03-29 11:00:31', '2023-03-29 11:00:50'),
(70, 70, 'anjali', '=70=70=70=7', 1, '', '2023-04-04 11:33:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  `fname` varchar(200) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` enum('Female','Male') NOT NULL,
  `mobile` bigint(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `billing_address_id`, `shipping_address_id`, `fname`, `lname`, `email`, `gender`, `mobile`, `status`, `create_at`, `update_at`) VALUES
(391, 0, 0, 'anjali', 'vaghasiya', '', 'Female', 0, 1, '2023-04-11 22:58:06', NULL),
(392, 0, 0, 'anjali', 'vaghasiya', '', 'Female', 0, 1, '2023-04-11 22:58:26', '0000-00-00 00:00:00'),
(393, 0, 0, 'dcjkc', '', '', 'Female', 0, 1, '2023-04-11 22:58:35', '0000-00-00 00:00:00'),
(394, 0, 0, 'anjali', 'vaghasiya', '', 'Female', 0, 1, '2023-04-11 23:02:42', NULL),
(395, 0, 0, 'anjali', 'vaghasiya', 'sdcas@gmail.com', 'Female', 0, 1, '2023-04-11 23:03:36', NULL),
(396, 0, 0, 'kd', '', '', 'Female', 0, 1, '2023-04-11 23:09:53', NULL),
(397, 0, 0, '', '', '', 'Female', 0, 1, '2023-04-11 23:12:24', NULL),
(398, 0, 0, 'kd', 'jkzaxnm', '', 'Female', 0, 1, '2023-04-11 23:18:05', '0000-00-00 00:00:00'),
(400, 0, 0, 'kd', 'jkzaxnm', '', 'Male', 0, 1, '2023-04-11 23:31:36', '2023-04-11 08:07:01'),
(401, 0, 0, 'kd', 'jkzaxnm', 'sdcas@gmail.com', 'Female', 0, 1, '2023-04-11 23:32:22', '2023-04-11 08:07:25'),
(402, 0, 0, 'anjali', 'vaghasiya', '', 'Female', 0, 1, '2023-04-11 23:38:04', '2023-04-11 08:08:20'),
(403, 0, 0, '', '', '', 'Female', 0, 1, '2023-04-12 15:19:17', NULL),
(404, 0, 0, 'kd', '', '', 'Female', 0, 1, '2023-04-12 18:56:08', '2023-04-12 03:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `address_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` text NOT NULL,
  `country` varchar(100) NOT NULL,
  `zip_code` int(100) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`address_id`, `address`, `city`, `state`, `country`, `zip_code`, `customer_id`) VALUES
(90, 'dyfsugtdy', '', '0', '', 0, 346),
(91, 'fccfgggggggggggggggg', 'gondal', '0', 'ygfy', 7878, 352),
(92, 'tcytcxdcdcccccc', 'gondal', '0', 'ffg', 0, 359),
(93, 'kmlkm', 'mlkmkm', 'nmnjnj', 'owkkxskwm', 1234, 350),
(94, 'tcytcxdcdcccccc', '', '', '', 0, 361),
(95, 'shivrajgadh', 'gondal', 'gujarat', '', 0, 368),
(96, 'tcytcxdcdcccccc', 'gondal', '', '', 0, 365),
(97, '', '', '', '', 0, 366),
(98, '', '', '', '', 0, 367),
(99, 'hello', 'yfyufyuf', '', '', 0, 372),
(100, '', '', '', '', 0, 373),
(101, '', '', '', '', 0, 374),
(102, '', '', '', '', 0, 375),
(103, '', '', '', '', 0, 376),
(104, '', '', '', '', 0, 377),
(105, '', '', '', '', 0, 378),
(106, '', '', '', '', 0, 379),
(107, '', '', '', '', 0, 380),
(108, '', '', '', '', 0, 0),
(113, 'tcytcxdcdcccccc', '', '', '', 0, 386),
(114, '', '', '', '', 0, 387),
(115, '', '', '', '', 0, 388),
(116, '', '', '', '', 0, 389),
(117, '', '', '', '', 0, 390),
(118, '', '', '', '', 0, 391),
(119, '', '', '', '', 0, 392),
(120, '', '', '', '', 0, 393),
(121, 'fccfgggggggggggggggg', 'gondal', 'gcgfcgf', 'ygfy', 99999, 395),
(122, 'tcytcxdcdcccccc', 'gondal', '', '', 0, 396),
(123, '', '', '', '', 0, 397),
(124, 'tcytcxdcdcccccc', 'gondal', 'gcgfcgf', 'ygfy', 0, 401),
(125, 'tcytcxdcdcccccc', 'gondal', 'gcgfcgf', '', 0, 400),
(126, 'tcytcxdcdcccccc', 'gondal', '', '', 0, 402),
(127, '', '', '', '', 0, 403),
(128, 'To: Shivrajgadh', 'Gondal', '', '', 360311, 404);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute`
--

CREATE TABLE `eav_attribute` (
  `attribute_id` int(11) NOT NULL,
  `entity_type_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `backend_type` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `backend_model` varchar(255) NOT NULL,
  `inputtype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eav_attribute`
--

INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `code`, `backend_type`, `name`, `status`, `backend_model`, `inputtype`) VALUES
(1, 1, 'color', 'int', 'Color', 1, '', 'select'),
(2, 1, 'style', 'int', 'Style', 1, '', 'select'),
(3, 1, 'short_desc', 'textarea', 'Short Description', 1, '', 'textarea');

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option`
--

CREATE TABLE `eav_attribute_option` (
  `option_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eav_attribute_option`
--

INSERT INTO `eav_attribute_option` (`option_id`, `name`, `attribute_id`, `position`) VALUES
(1, 'Red', 1, 1),
(3, 'brown', 1, 1),
(4, 'silver', 1, 1),
(5, 'black', 1, 1),
(6, 'Traditional', 2, 2),
(7, 'Traditional', 2, 2),
(8, 'electric', 2, 2),
(9, 'contemprary', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `entity_type`
--

CREATE TABLE `entity_type` (
  `entity_type_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `entity_model` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entity_type`
--

INSERT INTO `entity_type` (`entity_type_id`, `name`, `entity_model`) VALUES
(1, 'product', ''),
(2, 'product', ''),
(3, 'category', ''),
(4, 'customer', ''),
(5, 'vendor', '');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `thumb` tinyint(4) DEFAULT NULL,
  `base` tinyint(4) DEFAULT NULL,
  `small` tinyint(4) DEFAULT NULL,
  `gallery` tinyint(4) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `product_id`, `image`, `filename`, `thumb`, `base`, `small`, `gallery`, `create_at`) VALUES
(0, 220, '', '', 127, 127, 127, 0, '2023-04-03 13:54:55'),
(244, 0, '12.png', 'hello', 1, 1, 1, 1, '2023-04-03 13:43:02'),
(245, 22, '12.png', 'hello', 1, 1, 1, 1, '2023-04-03 13:43:19'),
(246, 0, '246.png', 'aaa', 0, 0, 0, 0, '2023-04-03 13:44:37'),
(247, 0, '247.png', 'hello', 0, 0, 0, 0, '2023-04-03 13:45:19'),
(248, 0, '', '', 127, 127, 127, 0, '2023-04-03 13:51:09'),
(249, 0, '', '', 127, 127, 127, 0, '2023-04-03 13:51:48'),
(250, 220, '', '', 127, 127, 127, 0, '2023-04-03 13:53:49'),
(252, 0, '', '', 127, 127, 127, 0, '2023-04-03 14:07:11'),
(253, 0, '', '', 0, 127, 127, 0, '2023-04-03 14:30:26'),
(254, 0, '', '', 0, 127, 127, 0, '2023-04-03 14:31:01'),
(255, 0, '', '', 0, 127, 127, 0, '2023-04-03 14:31:09'),
(256, 0, '', '', 0, NULL, NULL, NULL, '2023-04-03 14:31:35'),
(257, 0, '', '', NULL, NULL, NULL, NULL, '2023-04-03 14:35:22'),
(258, 0, '', '', NULL, NULL, NULL, NULL, '2023-04-03 14:35:59'),
(259, 0, '', '', NULL, NULL, NULL, NULL, '2023-04-03 14:36:50'),
(260, 0, '', '', NULL, NULL, NULL, NULL, '2023-04-03 14:36:51'),
(261, 0, '', '', 0, 0, 0, 0, '2023-04-03 14:42:10'),
(262, 0, '', '', 0, 0, 0, 0, '2023-04-03 14:43:09');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `name`, `status`, `create_at`, `update_at`) VALUES
(20, 'efrfiflsek', 0, '2023-04-09 02:06:29', NULL),
(23, '', 1, '2023-04-12 09:38:11', '2023-04-12 09:38:14');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `cost` int(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `color` varchar(20) NOT NULL,
  `material` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `sku`, `cost`, `price`, `quantity`, `description`, `status`, `color`, `material`, `create_at`, `update_at`) VALUES
(243, 'aaa', '', 0, 0, 0, '', 0, '', '', '2023-04-08 08:34:25', '2023-04-08 08:45:03'),
(246, '', '', 0, 0, 0, '', 0, '', '', '2023-04-10 07:45:33', '2023-04-11 10:21:38'),
(248, 'aaa', 'www', 0, 0, 0, '', 0, '', '', '2023-04-10 09:13:04', '2023-04-10 09:13:26'),
(249, '', '', 0, 0, 0, '', 0, '', '', '2023-04-10 11:17:06', NULL),
(250, 'kjdfede', '', 0, 0, 0, '', 0, '', '', '2023-04-10 08:26:39', '2023-04-10 08:26:52'),
(251, 'abc', '', 0, 0, 0, '', 0, '', '', '2023-04-10 08:50:48', '2023-04-10 08:50:56'),
(252, '', '', 0, 0, 0, '', 0, '', '', '2023-04-11 08:02:12', NULL),
(253, '', '', 0, 0, 0, '', 1, '', '', '2023-04-12 09:04:28', NULL),
(254, '', '', 0, 0, 0, '', 1, '', '', '2023-04-12 09:04:37', NULL),
(255, '', '', 0, 0, 0, '', 1, '', '', '2023-04-12 09:04:48', NULL),
(256, '', '', 0, 0, 0, '', 1, '', '', '2023-04-12 09:06:41', NULL),
(257, '', '', 0, 0, 0, '', 1, '', '', '2023-04-12 09:07:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_int`
--

CREATE TABLE `product_int` (
  `value_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `salesman_id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` enum('Female','Male') NOT NULL,
  `mobile` bigint(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `company` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`salesman_id`, `fname`, `lname`, `email`, `gender`, `mobile`, `status`, `company`, `create_at`, `update_at`) VALUES
(10, 'anjali', 'patel', 'ab12c@gmail.com', 'Female', 2147483647, 1, '', '0000-00-00 00:00:00', '2023-03-03 10:24:51'),
(11, 'anjali1122', 'vaghasiyasd', 'ab12c@gmail.com', 'Male', 2147483647, 1, '', '0000-00-00 00:00:00', '2023-02-17 11:13:24'),
(21, 'anjali', 'patel', '', 'Male', 876543245, 1, '', '2023-03-03 10:43:16', '2023-03-03 11:16:40'),
(28, 'gfyf', 'frcxrfcx', '', 'Female', 0, 0, '', '2023-04-03 10:25:45', NULL),
(29, 'gfyf', 'aaaaaaaaaaaaaa', '', 'Female', 0, 0, '', '2023-04-03 10:26:44', '2023-04-03 06:58:31'),
(30, '', 'aaaaaaaaaaaaaaaaa', '', 'Female', 0, 0, '', '2023-04-03 10:30:01', '2023-04-03 07:01:52'),
(31, '', '', '', 'Female', 0, 0, '', '2023-04-12 01:36:11', NULL),
(32, 'kjsdn', '', '', 'Female', 0, 0, '', '2023-04-12 01:36:56', '2023-04-11 10:07:14');

-- --------------------------------------------------------

--
-- Table structure for table `salesman_address`
--

CREATE TABLE `salesman_address` (
  `address_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `country` varchar(100) NOT NULL,
  `zipcode` int(100) NOT NULL,
  `salesman_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesman_address`
--

INSERT INTO `salesman_address` (`address_id`, `address`, `city`, `state`, `country`, `zipcode`, `salesman_id`) VALUES
(7, 'abc', 'ftf', 0, 'cfcfc', 7878, 10),
(8, 'abc', 'ftf', 0, 'cfcfc', 7878, 11),
(9, 'fctrfc', 'rrfcrf', 0, 'dct', 878, 26),
(10, 'drfd', '', 0, '', 0, 21),
(11, 'fcxfxfx', 'xfhxfrtrrd', 0, 'cxfxdxt', 7567586, 29),
(12, 'aaaaaaaaaaaaaaaaaaaaaaa', 'ssssssssssssssssssssssssssss', 0, '', 0, 30),
(13, '', '', 0, '', 0, 31),
(14, 'To: Shivrajgadh', 'Gondal', 0, '', 360311, 32);

-- --------------------------------------------------------

--
-- Table structure for table `salesman_price`
--

CREATE TABLE `salesman_price` (
  `entity_id` int(11) NOT NULL,
  `salesman_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `salesman_price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shipping_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` int(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`shipping_id`, `name`, `amount`, `status`, `create_at`, `update_at`) VALUES
(8, 'silver', 787, 0, '2023-02-17 11:14:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `gender` enum('Female','Male') NOT NULL,
  `mobile` bigint(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `company` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `fname`, `lname`, `email`, `gender`, `mobile`, `status`, `company`, `create_at`, `update_at`) VALUES
(59, '', '', '', 'Female', 0, 0, '', '2023-04-12 00:14:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_address`
--

CREATE TABLE `vendor_address` (
  `address_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `country` varchar(100) NOT NULL,
  `zipcode` int(100) NOT NULL,
  `vendor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_address`
--

INSERT INTO `vendor_address` (`address_id`, `address`, `city`, `state`, `country`, `zipcode`, `vendor_id`) VALUES
(1, 'abclkds', 'gondal', 0, 'india', 360311, 1),
(2, 'fhgf', 'gondal', 0, 'gfmg', 6767, 2),
(6, 'abcdfe', 'gondal', 0, 'india', 360311, 16),
(7, '', '', 0, '', 0, 17),
(8, 'abcdfe', 'gondal', 0, 'india', 360311, 18),
(9, '', '', 0, '', 0, 19),
(10, '', '', 0, '', 0, 20),
(11, 'oijkoi', 'gondal', 0, '', 0, 23),
(12, '', 'rajkot', 0, 'india', 0, 24),
(13, '', '', 0, '', 0, 29),
(14, '', '', 0, '', 0, 30),
(15, '', '', 0, '', 0, 31),
(16, '', '', 0, '', 0, 32),
(17, '', '', 0, '', 0, 33),
(18, '', '', 0, '', 0, 34),
(19, '', '', 0, '', 0, 44),
(20, '', '', 0, '', 0, 45),
(21, '', '', 0, '', 0, 46),
(22, '', '', 0, '', 0, 47),
(23, '', '', 0, '', 0, 48),
(24, '', '', 0, '', 0, 49),
(25, '', '', 0, '', 0, 54),
(26, '', '', 0, '', 2121, 55),
(27, '', '', 0, '', 0, 56),
(28, 'edwe', 'edwe', 0, '', 0, 57),
(29, '', '', 0, '', 0, 58),
(30, 'efe', '', 0, '', 0, 60);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `shipping_id` (`shipping_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_item_ibfk_1` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`address_id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- Indexes for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `entity_type_id` (`entity_type_id`);

--
-- Indexes for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `entity_type`
--
ALTER TABLE `entity_type`
  ADD PRIMARY KEY (`entity_type_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_int`
--
ALTER TABLE `product_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `entity_id_2` (`entity_id`,`attribute_id`),
  ADD KEY `entity_id` (`entity_id`,`attribute_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`salesman_id`);

--
-- Indexes for table `salesman_address`
--
ALTER TABLE `salesman_address`
  ADD PRIMARY KEY (`address_id`),
  ADD UNIQUE KEY `salesman_id` (`salesman_id`);

--
-- Indexes for table `salesman_price`
--
ALTER TABLE `salesman_price`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `salesman_id` (`salesman_id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`);

--
-- Indexes for table `vendor_address`
--
ALTER TABLE `vendor_address`
  ADD PRIMARY KEY (`address_id`),
  ADD UNIQUE KEY `vendor_id` (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `entity_type`
--
ALTER TABLE `entity_type`
  MODIFY `entity_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `product_int`
--
ALTER TABLE `product_int`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesman`
--
ALTER TABLE `salesman`
  MODIFY `salesman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `salesman_address`
--
ALTER TABLE `salesman_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `salesman_price`
--
ALTER TABLE `salesman_price`
  MODIFY `entity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `vendor_address`
--
ALTER TABLE `vendor_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`shipping_id`) REFERENCES `shipping` (`shipping_id`);

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD CONSTRAINT `eav_attribute_ibfk_1` FOREIGN KEY (`entity_type_id`) REFERENCES `entity_type` (`entity_type_id`);

--
-- Constraints for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD CONSTRAINT `eav_attribute_option_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_int`
--
ALTER TABLE `product_int`
  ADD CONSTRAINT `product_int_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_int_ibfk_2` FOREIGN KEY (`entity_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesman_price`
--
ALTER TABLE `salesman_price`
  ADD CONSTRAINT `salesman_price_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salesman_price_ibfk_2` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
