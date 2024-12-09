-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 09, 2024 at 04:24 AM
-- Server version: 10.6.20-MariaDB-cll-lve
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freeiuse_accounting2`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_active` int(11) NOT NULL DEFAULT 0,
  `brand_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `brand_active`, `brand_status`) VALUES
(6, 'kagoshima', 0, 1),
(7, 'miyazaki', 0, 1),
(8, 'satsuma', 0, 1),
(9, 'kobe', 0, 1),
(10, 'sendai', 0, 1),
(11, '', 0, 0),
(12, 'test', 0, 1),
(13, 'apple', 0, 1),
(14, 'pearson', 0, 1),
(15, 'zara', 0, 1),
(16, 'la mirabella', 0, 1),
(17, 'lasani bedsheet', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `brokers`
--

CREATE TABLE `brokers` (
  `broker_id` int(255) NOT NULL,
  `broker_name` text NOT NULL,
  `broker_phone` text NOT NULL,
  `broker_email` text NOT NULL,
  `broker_address` text NOT NULL,
  `broker_status` int(11) NOT NULL,
  `adddatetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

CREATE TABLE `budget` (
  `budget_id` int(11) NOT NULL,
  `budget_name` text NOT NULL,
  `budget_amount` double NOT NULL,
  `budget_type` varchar(300) NOT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `voucher_type` int(11) DEFAULT NULL,
  `budget_date` date NOT NULL,
  `budget_add_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `budget`
--

INSERT INTO `budget` (`budget_id`, `budget_name`, `budget_amount`, `budget_type`, `voucher_id`, `voucher_type`, `budget_date`, `budget_add_date`) VALUES
(1, 'expense added to ', 100, 'expense', 5, 1, '2023-02-22', '2023-02-22 13:56:37');

-- --------------------------------------------------------

--
-- Table structure for table `budget_category`
--

CREATE TABLE `budget_category` (
  `budget_category_id` int(11) NOT NULL,
  `budget_category_name` text NOT NULL,
  `budget_category_type` varchar(400) NOT NULL,
  `budget_category_add_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(255) NOT NULL,
  `category_price` varchar(100) NOT NULL DEFAULT '1',
  `category_purchase` varchar(100) NOT NULL,
  `categories_active` int(11) NOT NULL DEFAULT 0,
  `categories_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `category_price`, `category_purchase`, `categories_active`, `categories_status`) VALUES
(5, 'a5 striploin', '70', '', 0, 1),
(7, 'electronics', '950', '950', 0, 0),
(8, 'sfb', '20', '17', 0, 1),
(9, 'srt1214ga', '48', '30', 0, 1),
(11, 'mens', '1500', '930', 0, 1),
(12, 'men shirt', '100', '50', 0, 1),
(13, 'men shirt', '0', '0', 0, 1),
(14, 'mens', '1300', '1000', 0, 1),
(15, 'konserven', '3,99', '2,99', 0, 1),
(16, 'bedsheet', '4200', '3600', 0, 1),
(17, 'rooma cotton', '1350', '1100', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `checks`
--

CREATE TABLE `checks` (
  `check_id` int(11) NOT NULL,
  `check_no` varchar(250) DEFAULT NULL,
  `check_bank_name` varchar(250) DEFAULT NULL,
  `check_expiry_date` varchar(100) DEFAULT NULL,
  `check_type` varchar(100) DEFAULT NULL,
  `check_amount` varchar(100) DEFAULT NULL,
  `voucher_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `check_status` int(11) NOT NULL DEFAULT 0,
  `check_location` text DEFAULT NULL,
  `check_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checks`
--

INSERT INTO `checks` (`check_id`, `check_no`, `check_bank_name`, `check_expiry_date`, `check_type`, `check_amount`, `voucher_id`, `customer_id`, `check_status`, `check_location`, `check_timestamp`) VALUES
(1, '1', '', '2022-12-13', '', '25', 0, 7, 0, '', '2022-11-30 07:35:46'),
(2, '123cvc12', 'meezan', '2024-07-10', '', NULL, 12, 0, 0, NULL, '2024-07-16 11:04:31');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `logo` text NOT NULL,
  `address` text DEFAULT NULL,
  `company_phone` varchar(100) NOT NULL,
  `personal_phone` varchar(100) NOT NULL,
  `email` text DEFAULT NULL,
  `stock_manage` int(11) NOT NULL,
  `sale_interface` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `logo`, `address`, `company_phone`, `personal_phone`, `email`, `stock_manage`, `sale_interface`) VALUES
(5, 'YOUR COMPANY', '4379038726566d1468cf97.jpg', 'Head Office : P#10 Central Mill Road , Ayub Colony Jhang road Faisalabad Pakistan  ', '123456897', '231546897', 'abcd.com', 1, 'barcode');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(2000) NOT NULL,
  `customer_email` varchar(200) NOT NULL,
  `customer_phone` varchar(13) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_status` int(255) NOT NULL,
  `customer_type` varchar(250) DEFAULT NULL,
  `customer_limit` varchar(10) NOT NULL DEFAULT '0',
  `customer_add_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `customer_status`, `customer_type`, `customer_limit`, `customer_add_date`) VALUES
(1, 'rob teting', 'rob@jetfuelmeals.com', '19548041146', '1221 ns 112th', 1, 'supplier', '0', '2022-03-04 08:07:07'),
(2, 'cash in hand ', '', '0', '', 1, 'bank', '0', '2022-03-04 08:11:08'),
(3, 'test customer', '', '123', '', 1, 'customer', '0', '2022-03-04 08:21:45'),
(4, 'hafiz abdul-rehman', '', '03000552331', 'faisalabad\r\n', 1, 'customer', '0', '2022-03-07 10:13:44'),
(5, 'umar & umair', '', '023777777', 'faisalabad motor maket', 1, 'supplier', '0', '2022-03-07 10:48:50'),
(6, 'test', 'test@gmail.cpo', '1234567', '', 1, 'customer', '0', '2022-03-13 18:30:30'),
(7, 'selfmade', '', '03026005556', '', 1, 'customer', '25', '2022-11-30 07:32:16'),
(8, 'ahsan', '', '03026386238', '', 1, 'customer', '0', '2022-12-08 11:40:12'),
(9, 'ahsan malik', '', '03028926767', '', 1, 'customer', '0', '2022-12-08 11:52:38'),
(10, 'joe\'s welding', 'joe@gmail.com', '5125555555', '12345 walk street\r\nhouston tx, 77049', 1, 'customer', '0', '2023-03-02 21:22:14'),
(11, 'superman steel', 'superman@gmail.com', '123456789', '235 steel lane\r\nkingston jamaica', 1, 'supplier', '0', '2023-03-03 13:42:30'),
(12, 'park place steel', '', '5125555555', '12345 park place lane\r\nhouston texas\r\n', 1, 'supplier', '0', '2023-03-15 15:35:27'),
(13, 'signorama', '', '5555555555', '', 1, 'customer', '0', '2023-03-15 15:44:20'),
(14, 'sharif center', 'hh@gmail.com', '03219496650', 'ravi road', 1, 'supplier', '0', '2023-03-28 08:26:03'),
(15, 'awais sahib', '', '03006691935', 'nayab arts', 1, 'supplier', '0', '2023-08-29 12:32:36'),
(16, 'gus mendez', 'finalcoat2@bigpond.com', '45745745', '8 sash rd', 1, 'customer', '0', '2023-09-14 08:28:18'),
(17, 'ggjh', 'etre@dtr', '1234567', 'kgk', 1, 'supplier', '0', '2024-12-03 06:55:37'),
(18, 'noman ahmed', 'email@gmail.com', '03001234567', 'kohenoor', 1, 'supplier', '0', '2024-12-07 08:16:00'),
(19, 'm-arham waheed', 'arham@gmail.com', '123456789', 'khsjdhf', 1, 'customer', '0', '2024-12-07 09:38:07'),
(20, 'shafiq velvet jecquard bedsheet', '', '03007212759', 'faisalabad', 1, 'supplier', '0', '2024-12-07 11:11:18');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL,
  `expense_name` varchar(100) DEFAULT NULL,
  `expense_status` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`expense_id`, `expense_name`, `expense_status`, `timestamp`) VALUES
(1, 'office expense', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `page` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `nav_edit` int(11) NOT NULL DEFAULT 0,
  `nav_delete` int(11) NOT NULL DEFAULT 0,
  `nav_add` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `title`, `page`, `parent_id`, `icon`, `sort_order`, `nav_edit`, `nav_delete`, `nav_add`, `timestamp`) VALUES
(97, 'accounts', '#', 0, 'fa fa-edit', 4, 1, 1, 1, '2024-08-06 06:28:41'),
(98, 'customers', 'customers.php?type=customer', 97, 'fa fa-edit', 4, 1, 1, 1, '2021-04-13 20:03:33'),
(99, 'banks', 'customers.php?type=bank', 97, 'fa fa-edit', 2, 1, 1, 1, '2021-04-13 20:03:33'),
(100, 'users', 'users.php', 97, 'fa fa-edit', 3, 1, 1, 1, '2021-04-13 20:03:33'),
(101, 'vouchers', '#', 0, 'fa fa-clipboard-list', 3, 0, 0, 0, '2024-08-06 06:29:01'),
(103, 'view vouchers', 'voucher.php?act=list', 101, 'fas fa-clipboard-list', 7, 1, 1, 1, '2021-04-13 20:03:33'),
(104, 'order', '#', 0, 'fas fa-cart-plus', 2, 0, 0, 0, '2024-08-06 06:29:01'),
(105, 'Cash Sale', 'cash_sale.php', 104, 'fas fa-cart-plus', 9, 1, 0, 1, '2021-04-13 20:03:33'),
(107, 'others', '#', 0, 'fa fa-edit', 8, 0, 0, 0, '2021-09-19 13:04:12'),
(108, 'Add Products', 'product.php?act=add', 148, 'fa fa-edit', 12, 1, 1, 1, '2021-09-19 13:01:26'),
(109, 'view products', 'product.php?act=list', 148, 'fa fa-edit', 13, 1, 1, 1, '2021-09-19 13:03:25'),
(110, 'brands', 'brands.php#', 107, 'fa fa-edit', 14, 1, 1, 1, '2021-04-13 20:03:34'),
(111, 'Credit Sale', 'credit_sale.php?credit_type=15days', 104, 'fa fa-edit', 15, 1, 1, 1, '2022-03-07 09:52:12'),
(112, 'purchase', '#', 0, 'fa fa-edit', 1, 0, 0, 0, '2024-08-06 06:29:01'),
(113, 'Cash Purchase', 'cash_purchase.php', 112, 'fa fa-edit', NULL, 1, 1, 1, '2021-04-13 22:33:37'),
(114, 'credit purchase', 'credit_purchase.php', 112, 'fa fa-edit', NULL, 1, 1, 1, '2021-04-13 22:34:31'),
(115, 'Reports', '#', 0, 'fa fa-edit', 6, 0, 0, 0, '2024-08-06 06:28:41'),
(116, 'bank ledger', 'reports.php?type=bank', 115, 'fa fa-edit', NULL, 1, 1, 1, '2021-04-14 21:03:11'),
(117, 'supplier ledger', 'reports.php?type=supplier', 115, 'fa fa-edit', NULL, 1, 0, 0, '2021-04-14 21:03:52'),
(118, 'customer ledger', 'reports.php?type=customer ', 115, 'fa-edit', NULL, 0, 0, 0, '2021-04-14 21:04:27'),
(119, 'view purchases', 'view_purchases.php', 112, 'add_to_queue', NULL, 1, 1, 1, '2021-04-15 21:17:07'),
(120, 'categories', 'categories.php', 107, 'fa fa-edit', NULL, 1, 1, 1, '2021-08-30 09:59:57'),
(121, 'supplier', 'customers.php?type=supplier', 97, 'fa fa-edit', NULL, 1, 1, 1, '2021-04-17 20:36:01'),
(122, 'expense ', 'customers.php?type=expense', 97, 'fa fa-edit', NULL, 1, 1, 1, '2021-04-17 20:41:42'),
(123, 'product purchase report', 'product_purchase_report.php', 115, 'fa fa-edit', NULL, 0, 0, 0, '2021-04-20 18:07:34'),
(125, 'product sale report', 'product_sale_report.php', 115, 'fa fa-edit', NULL, 0, 0, 0, '2021-04-21 19:48:47'),
(127, 'expense report', 'expence_report.php', 115, 'fa fa-edit', NULL, 0, 0, 0, '2021-04-21 20:11:51'),
(128, 'income report', 'income_report.php', 115, 'fa fa-edit', NULL, 0, 0, 0, '2021-04-21 20:12:23'),
(129, 'profit and loss', 'profit_loss.php', 115, 'fa fa-edit', NULL, 0, 0, 0, '2021-04-21 20:12:38'),
(130, 'profit summary', 'profit_summary.php', 115, 'fa fa-edit', NULL, 0, 0, 0, '2021-04-21 20:12:58'),
(131, 'trail balance', 'trail_balance.php#', 115, 'fa fa-edit', 6, 0, 0, 0, '2021-06-02 23:19:37'),
(133, 'expense type', 'expense_type.php', 107, 'local_shipping', NULL, 0, 0, 0, '2021-06-10 19:04:02'),
(134, 'analytics', 'analytics.php', 0, 'local_shipping', 7, 0, 0, 0, '2024-08-06 06:28:41'),
(135, 'Cash orders', 'view_orders.php#', 104, 'local_shipping', NULL, 0, 0, 0, '2021-06-12 16:43:17'),
(136, 'credit orders', 'credit_orders.php', 104, 'local_shipping', NULL, 0, 0, 0, '2021-06-12 16:44:41'),
(137, 'analytics', 'analytics.php', 115, 'local_shipping', NULL, 0, 0, 0, '2021-08-29 17:56:15'),
(138, 'sale reports', 'sale_report.php', 107, 'local_shipping', NULL, 0, 0, 0, '2021-06-15 17:40:17'),
(139, 'purchase reports', 'purchase_report.php', 107, 'local_shipping', NULL, 0, 0, 0, '2021-06-15 17:41:00'),
(140, 'general voucher', 'voucher.php?act=general_voucher', 101, 'local_shipping', NULL, 1, 0, 1, '2021-06-21 19:42:27'),
(141, 'expense voucher', 'voucher.php?act=expense_voucher', 101, 'local_shipping', NULL, 1, 0, 1, '2021-06-21 19:43:15'),
(142, 'single voucher', 'voucher.php?act=single_voucher#', 101, 'local_shipping', NULL, 1, 0, 1, '2021-06-21 19:44:55'),
(143, 'backup & restore', 'backup.php', 107, 'local_shipping', NULL, 1, 0, 1, '2021-06-26 20:36:25'),
(144, 'pending cash bills ', 'pending_bills.php?search_it=all', 115, '', NULL, 0, 0, 0, '2021-08-20 19:43:20'),
(145, 'pending report', 'customerpendingreport.php', 107, '', NULL, 0, 0, 0, '2021-08-20 19:58:40'),
(147, 'check list ', 'check_list.php', 101, '', NULL, 1, 1, 1, '2021-09-19 12:53:19'),
(148, 'products', '#', 0, '', 5, 0, 0, 0, '2024-08-06 06:28:41'),
(149, 'inventory products', 'inventory.php?act=add', 148, '', NULL, 1, 1, 1, '2021-09-19 12:58:26'),
(150, 'inventory p list ', 'inventory.php?act=list', 148, '', NULL, 1, 1, 1, '2021-09-19 12:59:06'),
(151, 'customer due report', 'reports3.php?type=customer#', 107, '', NULL, 0, 0, 0, '2021-11-15 11:47:04'),
(152, 'pos sale', 'cash_salegui.php', 104, '', NULL, 0, 0, 0, '2023-01-15 09:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `transaction_paid_id` int(11) DEFAULT NULL,
  `order_date` date NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_contact` varchar(255) NOT NULL,
  `sub_total` varchar(255) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `cod` varchar(200) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `paid` varchar(255) NOT NULL,
  `due` varchar(255) NOT NULL,
  `payment_type` varchar(30) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `customer_account` int(11) DEFAULT NULL,
  `payment_account` int(11) DEFAULT NULL,
  `order_status` varchar(20) NOT NULL DEFAULT '0',
  `address` varchar(500) NOT NULL,
  `charges` varchar(200) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `pending_order` varchar(1000) NOT NULL,
  `tracking` varchar(200) NOT NULL,
  `customer_profit` varchar(255) NOT NULL,
  `transaction_id` int(11) NOT NULL DEFAULT 0,
  `broker_id` int(11) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `delaytime` text DEFAULT NULL,
  `freight` text DEFAULT NULL,
  `order_narration` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `credit_sale_type` varchar(20) NOT NULL DEFAULT 'none',
  `vehicle_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `transaction_paid_id`, `order_date`, `client_name`, `client_contact`, `sub_total`, `vat`, `total_amount`, `discount`, `cod`, `grand_total`, `paid`, `due`, `payment_type`, `payment_status`, `customer_account`, `payment_account`, `order_status`, `address`, `charges`, `note`, `pending_order`, `tracking`, `customer_profit`, `transaction_id`, `broker_id`, `type`, `delaytime`, `freight`, `order_narration`, `timestamp`, `credit_sale_type`, `vehicle_no`) VALUES
(1, 2, '2022-03-04', 'sami', '03457573667', '', '', '50000', '0', '', '50000', '50000', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', NULL, '2022-03-04 08:11:46', 'none', 'le'),
(2, 0, '2022-03-04', 'test customer', '123', '', '', '4700', '0', '', '4700', '4700', '0', 'credit_sale', 1, 3, 2, '1', '', '', '', '', '', '', 3, NULL, NULL, NULL, '', 'abcd', '2022-04-30 12:04:25', '15days', 'le-395'),
(3, 8, '2022-03-07', 'sami', '03457573667', '', '', '4500', '0', '', '4500', '4500', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', 'thus is text ', '2022-03-07 09:10:45', 'none', 'le-395'),
(4, 0, '2022-03-07', 'abc', '03000552331', '', '', '50000', '100', '', '0', '0', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', 'akarm sb', '2022-03-07 10:17:21', 'none', ''),
(5, 11, '2022-03-07', 'assd', '', '', '', '1000', '0', '', '1000', '1000', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2022-03-07 10:25:51', 'none', ''),
(6, 12, '2022-03-07', 'bahi g ', '0300000000', '', '', '500', '0', '', '500', '2000', '-1500', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', 'new product', '2022-03-07 10:27:52', 'none', '1293'),
(7, 13, '2022-03-07', 'sami', '03457573667', '', '', '501000', '0', '', '501000', '50000', '451000', 'cash_in_hand', 0, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', 'new product', '2022-03-07 10:29:58', 'none', 'le-395'),
(8, 0, '2022-03-13', 'hafiz abdul-rehman', '03000552331', '', '', '2350', '0', '', '2350', '2350', '0', 'credit_sale', 1, 4, 2, '1', '', '', '', '', '', '', 14, NULL, NULL, NULL, '', 'this is sale coment', '2022-04-30 12:04:49', '15days', '12345'),
(9, 27, '2022-04-30', 'abc', '', '', '', '450', '0', '', '450', '450', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2022-04-30 12:03:57', 'none', ''),
(10, 31, '2022-06-14', 'sami', '03457573667', '', '', '500', '0', '', '500', '500', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2022-06-14 18:18:38', 'none', 'le-395'),
(11, 0, '2022-07-30', 'test customer', '123', '', '', '2', '0', '', '2', '0', '2', 'credit_sale', 0, 3, 2, '1', '', '', '', '', '', '', 32, NULL, NULL, NULL, '', '', '2022-07-30 17:24:41', '15days', ''),
(12, 0, '2022-08-06', 'test', '1234567', '', '', '940', '0', '', '940', '0', '940', 'credit_sale', 0, 6, 2, '1', '', '', '', '', '', '', 33, NULL, NULL, NULL, '', '', '2022-08-05 19:50:36', '15days', ''),
(13, 0, '2022-08-06', 'test customer', '123', '', '', '47000', '0', '', '47000', '0', '47000', 'credit_sale', 0, 3, 2, '1', '', '', '', '', '', '', 34, NULL, NULL, NULL, '', '', '2022-08-05 19:52:19', '15days', ''),
(14, 40, '2023-01-24', 'sami', '03457573667', '', '', '505', '', '', '505', '1000', '-495', 'cash_in_hand', 1, NULL, 0, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-01-24 08:56:16', 'none', ''),
(15, 41, '2023-01-24', 'sami', '03457573667', '', '', '105', '0', '', '105', '105', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-01-24 08:56:32', 'none', ''),
(16, 43, '2023-02-06', '5 blue', '', '', '', '75', '0', '', '75', '75', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-02-06 18:37:21', 'none', ''),
(17, 44, '2023-02-18', '5 blue', '', '', '', '640', '0', '', '640', '640', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-02-18 09:08:32', 'none', ''),
(18, 47, '2023-02-26', 'test customer', '123', '', '', '100', '0', '', '100', '100', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-02-26 12:06:53', 'none', ''),
(19, 48, '2023-02-27', 'sami', '03457573667', '', '', '100', '0', '', '100', '100', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-02-27 14:12:07', 'none', ''),
(20, 49, '2023-02-27', 'sami', '03457573667', '', '', '1225', '5', '', '1163.75', '1225', '-61.25', 'cash_in_hand', 1, NULL, 0, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-02-27 17:02:14', 'none', ''),
(21, 50, '2023-02-27', 'sami', '', '', '', '160', '5', '', '152', '130', '22', 'cash_in_hand', 0, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-02-27 17:07:04', 'none', ''),
(22, 51, '2023-02-27', 'sami', '', '', '', '100', '0', '', '100', '100', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-02-27 17:07:58', 'none', ''),
(23, 56, '2023-03-03', 'test customer', '', '', '', '495', '0', '', '495', '495', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-03-03 13:45:21', 'none', ''),
(24, 57, '2023-03-15', 'test customer', '', '', '', '55', '0', '', '55', '55', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-03-15 16:36:14', 'none', ''),
(25, 58, '2023-03-27', 'hamza malik', '03207977889', '', '', '1000', '0', '', '1000', '1000', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-03-27 11:21:17', 'none', ''),
(26, 59, '2023-05-18', 'sami', '03457573667', '', '', '100', '0', '', '100', '20', '80', 'cash_in_hand', 0, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', 'ainak wil be ready on monday.', '2023-05-18 09:03:15', 'none', ''),
(27, 0, '2023-06-12', 'test customer', '123', '', '', '19.99', '0', '', '19.99', '0', '19.99', 'credit_sale', 0, 3, 2, '1', '', '', '', '', '', '', 60, NULL, NULL, NULL, '', '', '2023-06-12 04:23:10', '15days', ''),
(28, 0, '2023-06-18', 'abc', '03000552331', '', '', '0', '0', '', '0', '0', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-06-18 11:45:14', 'none', ''),
(29, 0, '2023-08-29', 'signorama', '5555555555', '', '', '50000', '0', '', '50000', '0', '50000', 'credit_sale', 0, 13, 2, '1', '', '', '', '', '', '', 68, NULL, NULL, NULL, '', '', '2023-08-29 07:19:35', '15days', ''),
(30, 73, '2023-08-29', 'sami', '03457573667', '', '', '13000', '0', '', '13000', '13000', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-08-29 14:38:31', 'none', ''),
(31, 0, '2023-11-04', 'test customer', '123', '', '', '500000', '0', '', '500000', '0', '500000', 'credit_sale', 0, 3, 2, '1', '', '', '', '', '', '', 77, NULL, NULL, NULL, '', '', '2023-11-04 10:31:47', '15days', ''),
(32, 78, '2023-12-05', 'ee', '1', '', '', '100', '0', '', '100', '100', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2023-12-05 14:14:16', 'none', ''),
(33, 81, '2024-01-15', 'sami', '', '', '', '75', '0', '', '75', '75', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '0', '', '2024-01-15 09:32:20', 'none', ''),
(34, 82, '2024-02-07', 'check', '1', '', '', '50', '0', '', '50', '50', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', 'na', '2024-02-07 14:40:47', 'none', '1'),
(35, 0, '2024-02-18', 'selfmade', '03026005556', '', '', '2300', '20', '', '1840', '0', '1840', 'credit_sale', 0, 7, 2, '1', '', '', '', '', '', '', 83, NULL, NULL, NULL, '', '', '2024-02-18 14:42:12', '15days', ''),
(36, 84, '2024-02-26', 'dar', '', '', '', '8.3', '0', '', '8.3', '8', '0.3', 'cash_in_hand', 0, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2024-02-26 07:38:55', 'none', ''),
(37, 85, '2024-04-18', 'sami', '03457573667', '', '', '1000', '0', '', '1000', '1000', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2024-04-18 13:20:46', 'none', 'le'),
(38, 86, '2024-04-18', 'sami', '', '', '', '100', '0', '', '100', '100', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2024-04-18 13:21:50', 'none', ''),
(39, 0, '2024-08-10', 'signorama', '5555555555', '', '', '500', '0', '', '500', '0', '500', 'credit_sale', 0, 13, 2, '1', '', '', '', '', '', '', 92, NULL, NULL, NULL, '', '', '2024-08-10 11:01:48', '15days', ''),
(40, 93, '2024-08-17', 'hafiz abdul-rehman', '', '', '', '235', '0', '', '235', '50', '185', 'cash_in_hand', 0, NULL, 0, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2024-08-17 10:26:37', 'none', ''),
(41, 98, '2024-12-07', 'test customer', '03124584', '', '', '500', '0', '', '500', '500', '0', 'cash_in_hand', 1, NULL, 2, '1', '', '', '', '', '', '', 0, NULL, NULL, NULL, '', '', '2024-12-07 07:58:00', 'none', ''),
(42, 0, '2024-12-07', 'm-arham waheed', '123456789', '', '', '5000', '0', '', '5000', '0', '5000', 'credit_sale', 0, 19, 2, '1', '', '', '', '', '', '', 107, NULL, NULL, NULL, '', 'first sale', '2024-12-07 09:40:53', '15days', '1293');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `product_detail` text DEFAULT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `order_item_status` int(11) NOT NULL DEFAULT 0,
  `discount` varchar(255) DEFAULT NULL,
  `gauge` text DEFAULT NULL,
  `width` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `order_id`, `product_id`, `product_detail`, `quantity`, `rate`, `total`, `order_item_status`, `discount`, `gauge`, `width`) VALUES
(1, 1, 1, 'this is aurdino ', 100, 450, 45000, 1, NULL, NULL, NULL),
(2, 1, 2, 'this is aurdino two', 10, 500, 5000, 1, NULL, NULL, NULL),
(3, 2, 1, 'this is aurdino two 2', 10, 470, 4700, 1, NULL, NULL, NULL),
(4, 3, 1, '10', 10, 450, 4500, 1, NULL, NULL, NULL),
(5, 4, 3, 'mrj2 400w', 2, 25000, 50000, 1, NULL, NULL, NULL),
(6, 5, 2, '', 2, 500, 1000, 1, NULL, NULL, NULL),
(7, 6, 2, '', 1, 500, 500, 1, NULL, NULL, NULL),
(8, 7, 3, 'mrj2 400w', 2, 250000, 500000, 1, NULL, NULL, NULL),
(9, 7, 2, 'hfkjhasdfk hhdskjfsa;dh kjkhfk;dshf  b;hsfhsdkjauik;jkhf;jkjhdsf kudshfs', 2, 500, 1000, 1, NULL, NULL, NULL),
(10, 8, 1, 'this is aurdino two', 5, 470, 2350, 1, NULL, NULL, NULL),
(11, 9, 1, '', 1, 450, 450, 1, NULL, NULL, NULL),
(12, 10, 2, 'shorcode 2020', 1, 500, 500, 1, NULL, NULL, NULL),
(13, 11, 3, '', 1, 2, 2, 1, NULL, NULL, NULL),
(14, 12, 1, '', 2, 470, 940, 1, NULL, NULL, NULL),
(15, 13, 1, '', 100, 470, 47000, 1, NULL, NULL, NULL),
(16, 14, 9, '', 1, 500, 500, 1, NULL, NULL, NULL),
(17, 14, 18, '', 1, 5, 5, 1, NULL, NULL, NULL),
(18, 15, 5, '', 1, 100, 100, 1, NULL, NULL, NULL),
(19, 15, 18, '', 1, 5, 5, 1, NULL, NULL, NULL),
(20, 16, 8, 'extra crisp', 1, 50, 50, 1, NULL, NULL, NULL),
(21, 16, 9, 'p1 qty 2', 1, 25, 25, 1, NULL, NULL, NULL),
(22, 17, 9, '', 1, 500, 500, 1, NULL, NULL, NULL),
(23, 17, 10, '', 1, 120, 120, 1, NULL, NULL, NULL),
(24, 17, 11, '', 1, 5, 5, 1, NULL, NULL, NULL),
(25, 17, 12, '', 1, 15, 15, 1, NULL, NULL, NULL),
(26, 18, 5, '', 1, 100, 100, 1, NULL, NULL, NULL),
(27, 19, 5, '', 1, 100, 100, 1, NULL, NULL, NULL),
(28, 20, 5, '', 1, 100, 100, 1, NULL, NULL, NULL),
(29, 20, 9, '', 2, 500, 1000, 1, NULL, NULL, NULL),
(30, 20, 10, '', 1, 120, 120, 1, NULL, NULL, NULL),
(31, 20, 11, '', 1, 5, 5, 1, NULL, NULL, NULL),
(32, 21, 19, '', 5, 0, 0, 1, NULL, NULL, NULL),
(33, 21, 17, '', 8, 20, 160, 1, NULL, NULL, NULL),
(34, 21, 14, '', 1, 0, 0, 1, NULL, NULL, NULL),
(35, 21, 15, '', 2, 0, 0, 1, NULL, NULL, NULL),
(36, 22, 5, '', 1, 100, 100, 1, NULL, NULL, NULL),
(37, 23, 20, '', 1, 495, 495, 1, NULL, NULL, NULL),
(38, 24, 7, '', 1, 55, 55, 1, NULL, NULL, NULL),
(39, 25, 9, '', 2, 500, 1000, 1, NULL, NULL, NULL),
(40, 26, 5, 'p1 2+', 1, 100, 100, 1, NULL, NULL, NULL),
(41, 27, 5, '', 1, 19.99, 19.99, 1, NULL, NULL, NULL),
(42, 28, 7, 'bhjg', 1, 0, 0, 1, NULL, NULL, NULL),
(43, 29, 25, '', 10, 5000, 50000, 1, NULL, NULL, NULL),
(44, 30, 28, '', 10, 1300, 13000, 1, NULL, NULL, NULL),
(45, 31, 8, '41*28*38 cm', 100, 5000, 500000, 1, NULL, NULL, NULL),
(46, 32, 5, '', 1, 100, 100, 1, NULL, NULL, NULL),
(47, 33, 29, '', 1, 75, 75, 1, NULL, NULL, NULL),
(48, 34, 8, '01', 1, 50, 50, 1, NULL, NULL, NULL),
(49, 35, 24, '', 1, 1300, 1300, 1, NULL, NULL, NULL),
(50, 35, 27, '', 1, 1000, 1000, 1, NULL, NULL, NULL),
(51, 36, 30, '', 1, 8.3, 8.3, 1, NULL, NULL, NULL),
(52, 37, 29, '', 1, 1000, 1000, 1, NULL, NULL, NULL),
(53, 38, 5, '', 1, 100, 100, 1, NULL, NULL, NULL),
(54, 38, 7, '', 1, 0, 0, 1, NULL, NULL, NULL),
(55, 38, 29, '', 1, 0, 0, 1, NULL, NULL, NULL),
(56, 39, 29, '', 1, 500, 500, 1, NULL, NULL, NULL),
(57, 40, 5, '', 1, 100, 100, 1, NULL, NULL, NULL),
(58, 40, 10, '', 1, 120, 120, 1, NULL, NULL, NULL),
(59, 40, 12, '', 1, 15, 15, 1, NULL, NULL, NULL),
(60, 40, 29, '', 1, 0, 0, 1, NULL, NULL, NULL),
(61, 41, 7, '', 50, 10, 500, 1, NULL, NULL, NULL),
(62, 42, 7, '', 10, 500, 5000, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `privileges_id` int(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nav_id` int(11) NOT NULL,
  `nav_url` text NOT NULL,
  `addby` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nav_add` int(11) NOT NULL DEFAULT 0,
  `nav_edit` int(11) NOT NULL DEFAULT 0,
  `nav_delete` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`privileges_id`, `user_id`, `nav_id`, `nav_url`, `addby`, `date_time`, `nav_add`, `nav_edit`, `nav_delete`) VALUES
(332, 1, 98, 'customers.php?type=customer', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 1),
(333, 1, 99, 'customers.php?type=bank', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 1),
(334, 1, 100, 'users.php', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 1),
(335, 1, 102, 'voucher.php?act=add', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 0),
(336, 1, 103, 'voucher.php?act=list', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 1),
(337, 1, 105, 'cash_sale.php', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 0),
(338, 1, 106, 'view_orders.php', 'Added By: admin', '2021-04-15 21:26:49', 0, 0, 0),
(339, 1, 108, 'product.php?act=add#', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 0),
(340, 1, 109, 'product.php?act=list', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 1),
(341, 1, 110, 'brands.php#', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 1),
(342, 1, 111, 'credit_sale.php', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 0),
(343, 1, 113, 'cash_purchase.php', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 1),
(344, 1, 114, 'credit_purchase.php', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 1),
(345, 1, 116, 'reports.php?type=bank', 'Added By: admin', '2021-04-15 21:26:49', 1, 0, 1),
(346, 1, 117, 'reports.php?type=supplier', 'Added By: admin', '2021-04-15 21:26:49', 0, 0, 0),
(347, 1, 118, 'reports.php?type=customer ', 'Added By: admin', '2021-04-15 21:26:49', 0, 0, 0),
(348, 1, 119, 'view_purchases.php', 'Added By: admin', '2021-04-15 21:26:49', 0, 0, 0),
(349, 1, 0, '', 'Added By: admin', '2021-04-15 21:26:49', 0, 0, 0),
(386, 2, 98, 'customers.php?type=customer', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 1),
(387, 2, 99, 'customers.php?type=bank', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 1),
(388, 2, 100, 'users.php', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 1),
(389, 2, 102, 'voucher.php?act=add', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 0),
(390, 2, 103, 'voucher.php?act=list', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 1),
(391, 2, 105, 'cash_sale.php', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 0),
(392, 2, 106, 'view_orders.php', 'Added By: admin', '2021-06-04 21:43:16', 0, 0, 0),
(393, 2, 108, 'product.php?act=add#', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 0),
(394, 2, 109, 'product.php?act=list', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 1),
(395, 2, 110, 'brands.php#', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 1),
(396, 2, 111, 'credit_sale.php?credit_type=30days', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 1),
(397, 2, 113, 'cash_purchase.php', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 1),
(398, 2, 114, 'credit_purchase.php', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 0),
(399, 2, 116, 'reports.php?type=bank', 'Added By: admin', '2021-06-04 21:43:16', 0, 0, 0),
(400, 2, 117, 'reports.php?type=supplier', 'Added By: admin', '2021-06-04 21:43:16', 0, 0, 1),
(401, 2, 118, 'reports.php?type=customer ', 'Added By: admin', '2021-06-04 21:43:16', 1, 0, 0),
(402, 2, 119, 'view_purchases.php', 'Added By: admin', '2021-06-04 21:43:16', 0, 0, 0),
(403, 5, 0, 'voucher.php?act=general_voucher', 'Added By: admin', '2022-01-24 06:43:14', 1, 0, 0),
(1323, 5, 98, 'customers.php?type=customer', 'Added By: admin', '2022-01-23 13:40:10', 1, 1, 1),
(1324, 5, 99, 'customers.php?type=bank', 'Added By: admin', '2022-01-23 13:40:10', 1, 1, 1),
(1325, 5, 103, 'users.php', 'Added By: admin', '2022-01-23 13:40:10', 1, 1, 0),
(1326, 5, 105, 'voucher.php?act=list', 'Added By: admin', '2022-01-23 13:40:10', 1, 1, 0),
(1327, 5, 108, 'cash_sale.php', 'Added By: admin', '2022-01-23 13:40:10', 1, 1, 0),
(1328, 5, 109, 'product.php?act=add', 'Added By: admin', '2022-01-23 13:40:10', 1, 1, 0),
(1329, 5, 110, 'product.php?act=list', 'Added By: admin', '2022-01-23 13:40:10', 1, 1, 0),
(1330, 5, 111, 'brands.php#', 'Added By: admin', '2022-01-23 13:40:10', 1, 1, 0),
(1331, 5, 117, 'credit_sale.php?credit_type=15days', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1332, 5, 118, 'cash_purchase.php', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1333, 5, 119, 'credit_purchase.php', 'Added By: admin', '2022-01-23 13:40:10', 1, 0, 0),
(1334, 5, 120, 'reports.php?type=bank', 'Added By: admin', '2022-01-23 13:40:10', 1, 0, 0),
(1335, 5, 121, 'reports.php?type=supplier', 'Added By: admin', '2022-01-23 13:40:10', 1, 0, 0),
(1336, 5, 122, 'reports.php?type=customer ', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1337, 5, 123, 'view_purchases.php', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1338, 5, 125, 'categories.php', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1339, 5, 127, 'customers.php?type=supplier', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1340, 5, 132, 'customers.php?type=expense', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1341, 5, 133, 'product_purchase_report.php', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1342, 5, 135, 'product_sale_report.php', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1343, 5, 136, 'expence_report.php', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1344, 5, 138, 'income_report.php', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1345, 5, 139, 'profit_loss.php', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1346, 5, 140, 'profit_summary.php', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1347, 5, 141, 'trail_balance.php#', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1348, 5, 143, 'credit_sale.php?credit_type=30days', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1349, 5, 144, 'expense_type.php', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1350, 5, 146, 'analytics.php', 'Added By: admin', '2022-01-23 13:40:10', 1, 0, 0),
(1351, 5, 147, 'view_orders.php#', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1352, 5, 149, 'credit_orders.php', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0),
(1353, 5, 150, 'analytics.php', 'Added By: admin', '2022-01-23 13:40:10', 1, 0, 0),
(1354, 5, 151, 'sale_report.php', 'Added By: admin', '2022-01-23 13:40:10', 1, 0, 0),
(1355, 5, 0, 'purchase_report.php', 'Added By: admin', '2022-01-23 13:40:10', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(200) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(250) DEFAULT NULL,
  `product_image` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `quantity_instock` double NOT NULL,
  `purchased` double NOT NULL,
  `current_rate` double NOT NULL,
  `f_days` text DEFAULT NULL,
  `t_days` text DEFAULT NULL,
  `purchase_rate` double NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `availability` int(11) DEFAULT 0,
  `alert_at` double DEFAULT 5,
  `weight` varchar(200) NOT NULL,
  `actual_rate` varchar(250) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `product_mm` varchar(100) NOT NULL DEFAULT '0',
  `product_inch` varchar(100) DEFAULT '0',
  `product_meter` varchar(100) NOT NULL DEFAULT '0',
  `adddatetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `inventory` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_code`, `product_image`, `brand_id`, `category_id`, `quantity_instock`, `purchased`, `current_rate`, `f_days`, `t_days`, `purchase_rate`, `status`, `availability`, `alert_at`, `weight`, `actual_rate`, `product_description`, `product_mm`, `product_inch`, `product_meter`, `adddatetime`, `inventory`) VALUES
(1, 'aurdino', '001', '', 3, 1, 784, 0, 450, '470', '470', 0, 0, 1, 5, '', NULL, '', '', '', '', '2022-08-09 13:44:55', 0),
(2, 'aurdino uno', '002', '', 3, 1, 985, 0, 500, '550', '550', 0, 0, 1, 5, '', NULL, '', '', '', '', '2022-08-09 13:44:57', 0),
(3, 'others', '1122', '', 3, 3, 1000000000006, 0, 0, '0', '0', 0, 0, 1, 5, '', NULL, '', '', '', '', '2022-08-09 13:45:00', 0),
(4, 'mitsobishi mr-j3-40a', 'sm400', '16217372866226235fb019b.jpg', 4, 1, 0, 0, 25000, '26000', '27000', 0, 0, 1, 10, '', NULL, '', '', '', '', '2022-08-09 13:44:52', 0),
(5, '25.7 lbs', '10001', '', 6, 5, 4, 0, 100, '0', '0', 0, 1, 1, 10, '', NULL, 'box 10', '0', '', '', '2024-11-28 11:40:33', 0),
(6, '25.7 lbs', '1615664660', '', 0, 0, 0, 0, 100, NULL, NULL, 100, 0, 1, 5, '', NULL, NULL, '0', '0', '0', '2022-08-09 14:07:53', 1),
(7, 'pizaa', '55', '', 9, 5, 3, 0, 0, '0', '0', 0, 1, 1, 5, '', NULL, '', '', '', '', '2024-12-07 09:40:53', 0),
(8, 'pizaa', '767739754', '', 0, 0, 109, 0, 50, NULL, NULL, 50, 1, 1, 5, '', NULL, NULL, '0', '0', '0', '2024-12-07 08:37:49', 1),
(9, 'tissue paper', '6923568302925', '', 6, 5, -3, 0, 500, '0', '0', 0, 1, 1, 5, '', NULL, '', '', '', '', '2023-03-27 11:21:17', 0),
(10, 'ferror room freshner', '5247889714573', '', 6, 5, -2, 0, 120, '120', '120', 0, 1, 1, 5, '', NULL, '', '', '', '', '2024-08-17 10:26:37', 0),
(11, 'maches', '817077998020', '', 6, 5, -2, 0, 5, '5', '5', 0, 1, 1, 5, '', NULL, '', '', '', '', '2023-02-27 17:02:14', 0),
(12, 'joher joshanda', '855434009675', '', 6, 5, -2, 0, 15, '15', '15', 0, 1, 1, 5, '', NULL, '', '', '', '', '2024-08-17 10:26:37', 0),
(13, 'coffee', '7545739575379', '', 6, 5, 3, 0, 1500, '1500', '1500', 0, 1, 1, 5, '', NULL, 'good', '0302', '7', '3', '2024-11-28 19:15:27', 0),
(14, 'lays', '286436347', '', 7, 5, -1, 0, 0, '0', '0', 0, 1, 1, 5, '', NULL, '', '', '', '', '2023-02-27 17:07:04', 0),
(15, 'Ú©ÙˆÚ©', '67678787876', '', 6, 5, -2, 0, 0, '0', '0', 0, 1, 1, 5, '', NULL, '', '', '', '', '2023-02-27 17:07:04', 0),
(16, 'supreme', '8961014024036', '', 6, 5, 3, 0, 130, '130', '130', 0, 1, 1, 5, '', NULL, '', '', '', '', '2023-03-02 21:36:38', 0),
(17, 'lipton', '8961014030204', '', 7, 5, -8, 0, 20, '20', '20', 0, 1, 1, 12, '', NULL, '', '', '', '', '2023-02-27 17:07:04', 0),
(18, 'sooper', '8964002528011', '', 6, 5, -2, 0, 5, '', '', 0, 1, 1, 50, '', NULL, '', '', '', '', '2023-01-24 08:56:32', 0),
(19, 'macbook pro ', '01', '', 13, 5, -4, 0, 0, '0', '0', 0, 1, 1, 5, '', NULL, 'macbook pro 15\"', '', '', '', '2023-03-02 21:33:32', 0),
(20, 'coffee', '735764359', '', 0, 0, 0, 0, 495, NULL, NULL, 495, 1, 1, 5, '', NULL, NULL, '0', '0', '0', '2023-03-03 13:45:21', 1),
(21, 'electronic devices and circuit', '9789332542600', '199422434963f51dff0abb0.jpg', 14, 7, 0, 0, 950, 'Boylestad', 'Nashelsky', 0, 1, 1, 1, '', NULL, 'the eleventh edition of electronic devices and circuit theory offers students a complete, comprehensive coverage of the subject, focusing on all the essentials they will need to succeed on the job. setting the standard for nearly 30 years, this highly accurate text is supported by strong pedagogy and content that is ideal for new students of this rapidly changing field. this text is an excellent reference work for anyone involved with electronic devices and other circuitry applications, such as electrical and technical engineers.', '', '', '', '2023-02-21 19:41:32', 0),
(22, 'sfb', '821982730', '', 0, 0, 1, 0, 10, NULL, NULL, 10, 1, 1, 5, '', NULL, NULL, '0', '0', '0', '2023-03-03 13:43:33', 1),
(23, 'abc', '1204633536', '', 7, 5, 0, 0, 0, '0', '0', 0, 0, 1, 5, '', NULL, '', '0', '0', '0', '2023-06-20 09:12:51', 1),
(24, 'jeans', '112', '53408111564eca6d88fc77.jpg', 14, 11, -1, 0, 1500, '1500', '1500', 6200, 1, 1, 12, '', NULL, 'jeans for mens ', '15', '24', '1', '2024-02-18 14:42:12', 0),
(25, 'jeans', '113', '', 14, 11, 90, 0, 3000, '5000', '5000', 3100, 1, 1, 5, '', NULL, '', '3', '5', '12', '2023-08-29 07:19:35', 0),
(26, 't-shirt', '123', '139221554364ed891434570.png', 15, 12, 0, 0, 100, '1500', '3000', 28, 1, 1, 100, '', NULL, 'this is best for mens', '2', '3', '5', '2023-08-29 06:28:55', 0),
(27, 't-shirt', '122', '', 15, 13, 9, 0, 1000, '1000', '1000', 0, 1, 1, 5, '', NULL, '', '', '', '', '2024-02-18 14:42:12', 0),
(28, 'mens suiting', '1', '', 15, 14, 50, 0, 1300, '1300', '1300', 0, 1, 1, 5, '', NULL, 'this is for mens', '4', '0', '0', '2023-08-29 14:38:31', 0),
(29, 'fuente de poder msi', 'id001', '', 6, 5, -1, 0, 0, '0', '0', 0, 1, 1, 5, '', NULL, 'fuente de poder para pc ', '', '', '', '2024-08-17 10:26:37', 0),
(30, 'super', '111', '', 12, 8, -1, 0, 8.3, '8.4', '8.5', 0, 1, 1, 5, '', NULL, '', '', '', '', '2024-02-26 07:38:55', 0),
(31, 'geschälte tomaten ', 'gt2650', '171744302465fb5d966b743.png', 16, 15, 0, 0, 3, '', '', 0, 1, 1, 5, '', NULL, 'geschälte tomaten 2650ml dose', '', '', '', '2024-03-20 22:05:10', 0),
(32, 'sheh', 'shshd', '', 7, 12, 0, 0, 4789583, '4791978', '4794373', 2394792, 1, 1, 5, '', NULL, 'do xxx', '55', '55', '855', '2024-03-29 10:10:50', 0),
(33, 'velvet jecquard ', '786', '153093537167542bc14796d.jpg', 17, 16, 50, 0, 4200, '', '', 0, 1, 1, 5, '', NULL, 'smooth fabric pure velvet bedshet', '', '', '', '2024-12-07 11:16:04', 0),
(34, 'rooma cotton', '787', '181700022767542c7862492.jpg', 17, 17, 0, 0, 1350, '0', '0', 0, 1, 1, 5, '', NULL, 'xtra king size bedshet', '', '', '', '2024-12-07 11:07:36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_contact` varchar(255) NOT NULL,
  `sub_total` varchar(255) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `paid` varchar(255) NOT NULL,
  `due` varchar(255) NOT NULL,
  `payment_type` varchar(30) DEFAULT NULL,
  `payment_account` int(11) DEFAULT NULL,
  `customer_account` int(11) DEFAULT NULL,
  `payment_status` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `transaction_paid_id` int(11) NOT NULL,
  `purchase_narration` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `purchase_date`, `client_name`, `client_contact`, `sub_total`, `vat`, `total_amount`, `discount`, `grand_total`, `paid`, `due`, `payment_type`, `payment_account`, `customer_account`, `payment_status`, `transaction_id`, `transaction_paid_id`, `purchase_narration`, `timestamp`) VALUES
(1, '2022-03-04', 'test supplier', '1234567', '', '', '800000', '0', '800000', '800000', '0', 'cash_purchase', 0, 1, 1, 0, 1, '', '2022-03-04 08:07:51'),
(2, '2022-03-07', 'test supplier', '1234567', '', '', '4000', '0', '4000', '4000', '0', 'cash_purchase', 2, 1, 1, 0, 5, 'qwert', '2022-03-07 08:50:41'),
(3, '2022-03-07', 'test supplier', '1234567', '', '', '4400', '0', '4400', '0', '4400', 'credit_purchase', 2, 1, 1, 10, 0, 'abcdef', '2022-03-07 08:57:48'),
(4, '2022-03-21', 'umar & umair', '023777777', '', '', '30000', '0', '30000', '15000', '15000', 'credit_purchase', 2, 5, 1, 21, 22, '', '2022-03-21 06:05:50'),
(5, '2022-03-21', 'umar & umair', '023777777', '', '', '30000', '0', '30000', '20000', '10000', 'credit_purchase', 2, 5, 1, 19, 20, '', '2022-03-21 07:48:09'),
(6, '2022-03-22', 'umar & umair', '023777777', '', '', '60000', '0', '60000', '20000', '40000', 'credit_purchase', 2, 5, 1, 25, 26, '', '2022-03-22 07:22:50'),
(7, '2022-08-09', 'rob teting', '19548041146', '', '', '50', '0', '50', '0', '50', 'credit_purchase', 0, 1, 1, 35, 0, '', '2022-08-09 14:09:00'),
(9, '2023-01-19', 'rob teting', '19548041146', '', '', '7500', '0', '7500', '2500', '5000', 'cash_purchase', 2, 1, 1, 0, 39, '', '2023-01-19 18:07:03'),
(10, '2023-02-01', 'rob teting', '19548041146', '', '', '10000', '0', '10000', '10000', '0', 'cash_purchase', 2, 1, 1, 0, 42, '', '2023-01-31 20:07:58'),
(11, '2023-03-02', 'rob teting', '19548041146', '', '', '2510', '0', '2510', '2510', '0', 'cash_purchase', 2, 1, 1, 0, 52, '', '2023-03-02 14:38:33'),
(12, '2023-03-03', 'umar & umair', '023777777', '', '', '0', '0', '0', '10', '-10', 'cash_purchase', 2, 5, 1, 0, 53, 'ship to customer asap', '2023-03-02 21:33:32'),
(13, '2023-03-03', 'rob teting', '19548041146', '', '', '25', '0', '25', '25', '0', 'cash_purchase', 2, 1, 1, 0, 54, '', '2023-03-02 21:36:38'),
(14, '2023-03-03', 'superman steel', '123456789', '', '', '505', '0', '505', '505', '0', 'cash_purchase', 2, 11, 1, 0, 55, '', '2023-03-03 13:43:33'),
(15, '2023-08-29', 'sharif center', '03219496650', '', '', '310000', '0', '310000', '0', '310000', 'credit_purchase', 0, 14, 1, 65, 0, '', '2023-08-29 07:16:52'),
(16, '2023-08-29', 'umar & umair', '023777777', '', '', '10000', '0', '10000', '10000', '0', 'cash_purchase', 2, 5, 1, 0, 69, '', '2023-08-29 07:28:07'),
(17, '2023-08-29', 'awais sahib', '03006691935', '', '', '60000', '0', '60000', '0', '60000', 'credit_purchase', 0, 15, 1, 72, 0, '', '2023-08-29 12:43:59'),
(18, '2023-09-14', 'umar & umair', '023777777', '', '', '1', '0', '1', '1', '0', 'cash_purchase', 2, 5, 1, 0, 74, '', '2023-09-14 12:51:12'),
(19, '2024-01-15', 'umar & umair', '023777777', '', '', '25', '0', '25', '25', '0', 'cash_purchase', 2, 5, 1, 0, 79, '', '2024-01-15 09:28:27'),
(20, '2024-01-15', 'rob teting', '19548041146', '', '', '141', '0', '141', '141', '0', 'cash_purchase', 2, 1, 1, 0, 80, '', '2024-01-15 09:29:22'),
(21, '2024-11-28', 'superman steel', '123456789', '', '', '5', '12', '4.4', '5', '-0.6', 'cash_purchase', 2, 11, 1, 0, 94, '', '2024-11-28 11:36:31'),
(22, '2024-11-28', 'superman steel', '123456789', '', '', '5', '0', '5', '0', '5', 'credit_purchase', 0, 11, 1, 95, 0, '', '2024-11-28 11:40:33'),
(23, '2024-11-29', 'rob teting', '19548041146', '', '', '50', '0', '50', '500', '-450', 'cash_purchase', 2, 1, 1, 0, 96, '', '2024-11-28 19:15:27'),
(24, '2024-12-03', 'umar & umair', '023777777', '', '', '25000', '0', '25000', '', '25000', 'credit_purchase', 2, 5, 1, 97, 0, '', '2024-12-03 07:47:11'),
(25, '2024-12-07', 'noman ahmed', '03001234567', '', '', '5000', '0', '5000', '5000', '0', 'cash_purchase', 2, 18, 1, 0, 104, 'cash sale', '2024-12-07 08:34:55'),
(26, '2024-12-07', 'noman ahmed', '03001234567', '', '', '5000', '0', '5000', '5000', '0', 'cash_purchase', 2, 18, 1, 0, 105, 'cash purchase', '2024-12-07 08:37:49'),
(27, '2024-12-07', 'noman ahmed', '03001234567', '', '', '5000', '0', '5000', '0', '5000', 'credit_purchase', 2, 18, 1, 106, 0, '', '2024-12-07 09:33:38'),
(28, '2024-12-07', 'shafiq velvet jecquard bedsheet', '03007212759', '', '', '180000', '0', '180000', '0', '180000', 'credit_purchase', 2, 20, 1, 108, 0, 'velvet bedsheet', '2024-12-07 11:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE `purchase_item` (
  `purchase_item_id` int(255) NOT NULL,
  `purchase_id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `product_detail` text DEFAULT NULL,
  `quantity` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `purchase_item_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `purchase_item`
--

INSERT INTO `purchase_item` (`purchase_item_id`, `purchase_id`, `product_id`, `product_detail`, `quantity`, `rate`, `total`, `purchase_item_status`) VALUES
(1, 1, 1, NULL, '1000', '400', '400000', 1),
(2, 1, 2, NULL, '1000', '400', '400000', 1),
(4, 2, 1, 'imp 1460 final', '10', '400', '4000', 1),
(11, 3, 2, 'this is aurdino two 2', '1', '400', '400', 1),
(12, 3, 3, 'this is aurdino two 2345678', '10', '400', '4000', 1),
(14, 5, 1, 'abcd', '1', '30000', '30000', 1),
(15, 4, 1, 'sdfsdf', '1', '30000', '30000', 1),
(17, 6, 3, 'asdas', '1', '60000', '60000', 1),
(18, 7, 5, '', '10', '5', '50', 1),
(19, 8, 12, '', '100', '12', '1200', 1),
(20, 9, 9, '', '3', '2500', '7500', 1),
(21, 10, 8, 'macbook pro', '200', '50', '10000', 1),
(22, 11, 9, '', '1', '2500', '2500', 1),
(23, 11, 7, '', '5', '2', '10', 1),
(24, 12, 5, '', '2', '0', '0', 1),
(25, 12, 19, '', '1', '0', '0', 1),
(26, 13, 16, '', '3', '5', '15', 1),
(27, 13, 10, '', '1', '10', '10', 1),
(28, 14, 20, '', '1', '495', '495', 1),
(29, 14, 22, '', '1', '10', '10', 1),
(30, 15, 25, '', '100', '3100', '310000', 1),
(31, 16, 27, '', '10', '1000', '10000', 1),
(32, 17, 28, 'wash n wear', '60', '1000', '60000', 1),
(33, 18, 7, 'sdf', '1', '1', '1', 1),
(34, 19, 29, 'dasdasd', '1', '25', '25', 1),
(35, 20, 29, '', '3', '47', '141', 1),
(36, 21, 5, 'steel', '1', '5', '5', 1),
(37, 22, 5, '', '1', '5', '5', 1),
(38, 23, 8, '', '1', '50', '50', 1),
(39, 23, 13, '', '3', '0', '0', 1),
(40, 24, 7, '', '50', '500', '25000', 1),
(41, 25, 8, 'large pizza', '5', '1000', '5000', 1),
(42, 26, 8, '', '5', '1000', '5000', 1),
(43, 27, 7, '', '10', '500', '5000', 1),
(44, 28, 33, '', '50', '3600', '180000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `debit` varchar(100) NOT NULL,
  `credit` varchar(100) NOT NULL,
  `balance` varchar(100) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `transaction_remarks` text NOT NULL,
  `transaction_add_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `transaction_date` text DEFAULT NULL,
  `transaction_type` text DEFAULT NULL,
  `transaction_from` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `debit`, `credit`, `balance`, `customer_id`, `transaction_remarks`, `transaction_add_date`, `transaction_date`, `transaction_type`, `transaction_from`) VALUES
(1, '800000', '0', '', 0, 'purchased by purchased id#1', '2022-03-04 08:07:51', '2022-03-04', 'cash_purchase', 'purchase'),
(2, '0', '50000', '', 2, 'cash_sale by order id#1', '2022-03-04 08:11:46', '2022-03-04', 'cash_in_hand', 'invoice'),
(3, '0', '4700', '', 3, 'credit_sale by order id#2', '2022-03-04 08:30:12', '2022-03-04', 'credit_sale', 'invoice'),
(5, '4000', '0', '', 2, 'purchased by purchased id#2', '2022-03-07 08:53:53', '2022-03-07', 'cash_purchase', 'purchase'),
(8, '0', '4500', '', 2, 'cash_sale by order id#3', '2022-03-07 09:10:45', '2022-03-07', 'cash_in_hand', 'invoice'),
(10, '4400', '0', '', 1, 'purchased on  purchased id#3', '2022-03-07 09:17:50', '2022-03-07', 'credit_purchase', 'purchase'),
(11, '0', '1000', '', 2, 'cash_sale by order id#5', '2022-03-07 10:25:51', '2022-03-07', 'cash_in_hand', 'invoice'),
(12, '0', '2000', '', 2, 'cash_sale by order id#6', '2022-03-07 10:27:52', '2022-03-07', 'cash_in_hand', 'invoice'),
(13, '0', '50000', '', 2, 'cash_sale by order id#7', '2022-03-07 10:29:58', '2022-03-07', 'cash_in_hand', 'invoice'),
(14, '0', '2350', '', 4, 'credit_sale by order id#8', '2022-03-13 18:32:50', '2022-03-13', 'credit_sale', 'invoice'),
(19, '10000', '0', '', 5, 'purchased on  purchased id#5', '2022-03-21 07:48:09', '2022-03-21', 'credit_purchase', 'purchase'),
(20, '20000', '0', '', 2, 'purchased by purchased id#5', '2022-03-21 07:48:09', '2022-03-21', 'credit_purchase', 'purchase'),
(21, '15000', '0', '', 5, 'purchased on  purchased id#4', '2022-03-21 07:53:48', '2022-03-21', 'credit_purchase', 'purchase'),
(22, '15000', '0', '', 2, 'purchased by purchased id#4', '2022-03-21 07:53:48', '2022-03-21', 'credit_purchase', 'purchase'),
(25, '40000', '0', '', 5, 'purchased on  purchased id#6', '2022-03-22 07:23:39', '2022-03-22', 'credit_purchase', 'purchase'),
(26, '20000', '0', '', 2, 'purchased by purchased id#6', '2022-03-22 07:23:39', '2022-03-22', 'credit_purchase', 'purchase'),
(27, '0', '450', '', 2, 'cash_sale by order id#9', '2022-04-30 12:03:57', '2022-04-30', 'cash_in_hand', 'invoice'),
(31, '0', '500', '', 2, 'cash_sale by order id#10', '2022-06-14 18:18:38', '2022-06-14', 'cash_in_hand', 'invoice'),
(32, '0', '2', '', 3, 'credit_sale by order id#11', '2022-07-30 17:24:41', '2022-07-30', 'credit_sale', 'invoice'),
(33, '0', '940', '', 6, 'credit_sale by order id#12', '2022-08-05 19:50:36', '2022-08-06', 'credit_sale', 'invoice'),
(34, '0', '47000', '', 3, 'credit_sale by order id#13', '2022-08-05 19:52:19', '2022-08-06', 'credit_sale', 'invoice'),
(35, '50', '0', '', 1, 'purchased on  purchased id#7', '2022-08-09 14:09:00', '2022-08-09', 'credit_purchase', 'purchase'),
(39, '2500', '0', '', 2, 'purchased by purchased id#9', '2023-01-19 18:07:03', '2023-01-19', 'cash_purchase', 'purchase'),
(40, '0', '1000', '', 0, 'cash_sale by order id#14', '2023-01-24 08:56:16', '2023-01-24', 'cash_in_hand', 'invoice'),
(41, '0', '105', '', 2, 'cash_sale by order id#15', '2023-01-24 08:56:32', '2023-01-24', 'cash_in_hand', 'invoice'),
(42, '10000', '0', '', 2, 'purchased by purchased id#10', '2023-01-31 20:07:58', '2023-02-01', 'cash_purchase', 'purchase'),
(43, '0', '75', '', 2, 'cash_sale by order id#16', '2023-02-06 18:37:21', '2023-02-06', 'cash_in_hand', 'invoice'),
(44, '0', '640', '', 2, 'cash_sale by order id#17', '2023-02-18 09:08:32', '2023-02-18', 'cash_in_hand', 'invoice'),
(47, '0', '100', '', 2, 'cash_sale by order id#18', '2023-02-26 12:06:53', '2023-02-26', 'cash_in_hand', 'invoice'),
(48, '0', '100', '', 2, 'cash_sale by order id#19', '2023-02-27 14:12:07', '2023-02-27', 'cash_in_hand', 'invoice'),
(49, '0', '1225', '', 0, 'cash_sale by order id#20', '2023-02-27 17:02:14', '2023-02-27', 'cash_in_hand', 'invoice'),
(50, '0', '130', '', 2, 'cash_sale by order id#21', '2023-02-27 17:07:04', '2023-02-27', 'cash_in_hand', 'invoice'),
(51, '0', '100', '', 2, 'cash_sale by order id#22', '2023-02-27 17:07:58', '2023-02-27', 'cash_in_hand', 'invoice'),
(52, '2510', '0', '', 2, 'purchased by purchased id#11', '2023-03-02 14:38:33', '2023-03-02', 'cash_purchase', 'purchase'),
(53, '10', '0', '', 2, 'purchased by purchased id#12', '2023-03-02 21:33:32', '2023-03-03', 'cash_purchase', 'purchase'),
(54, '25', '0', '', 2, 'purchased by purchased id#13', '2023-03-02 21:36:38', '2023-03-03', 'cash_purchase', 'purchase'),
(55, '505', '0', '', 2, 'purchased by purchased id#14', '2023-03-03 13:43:33', '2023-03-03', 'cash_purchase', 'purchase'),
(56, '0', '495', '', 2, 'cash_sale by order id#23', '2023-03-03 13:45:21', '2023-03-03', 'cash_in_hand', 'invoice'),
(57, '0', '55', '', 2, 'cash_sale by order id#24', '2023-03-15 16:36:14', '2023-03-15', 'cash_in_hand', 'invoice'),
(58, '0', '1000', '', 2, 'cash_sale by order id#25', '2023-03-27 11:21:17', '2023-03-27', 'cash_in_hand', 'invoice'),
(59, '0', '20', '', 2, 'cash_sale by order id#26', '2023-05-18 09:03:15', '2023-05-18', 'cash_in_hand', 'invoice'),
(60, '0', '19.99', '', 3, 'credit_sale by order id#27', '2023-06-12 04:23:10', '2023-06-12', 'credit_sale', 'invoice'),
(65, '310000', '0', '', 14, 'purchased on  purchased id#15', '2023-08-29 07:16:52', '2023-08-29', 'credit_purchase', 'purchase'),
(68, '0', '50000', '', 13, 'credit_sale by order id#29', '2023-08-29 07:19:35', '2023-08-29', 'credit_sale', 'invoice'),
(69, '10000', '0', '', 2, 'purchased by purchased id#16', '2023-08-29 07:28:07', '2023-08-29', 'cash_purchase', 'purchase'),
(72, '60000', '0', '', 15, 'purchased on  purchased id#17', '2023-08-29 12:43:59', '2023-08-29', 'credit_purchase', 'purchase'),
(73, '0', '13000', '', 2, 'cash_sale by order id#30', '2023-08-29 14:38:31', '2023-08-29', 'cash_in_hand', 'invoice'),
(74, '1', '0', '', 2, 'purchased by purchased id#18', '2023-09-14 12:51:12', '2023-09-14', 'cash_purchase', 'purchase'),
(77, '500000', '0', '', 3, 'credit_sale by order id#31', '2023-11-04 10:31:47', '2023-11-04', 'credit_sale', 'invoice'),
(78, '0', '100', '', 2, 'cash_sale by order id#32', '2023-12-05 14:14:16', '2023-12-05', 'cash_in_hand', 'invoice'),
(79, '25', '0', '', 2, 'purchased by purchased id#19', '2024-01-15 09:28:27', '2024-01-15', 'cash_purchase', 'purchase'),
(80, '141', '0', '', 2, 'purchased by purchased id#20', '2024-01-15 09:29:22', '2024-01-15', 'cash_purchase', 'purchase'),
(81, '0', '75', '', 2, 'cash_sale by order id#33', '2024-01-15 09:32:20', '2024-01-15', 'cash_in_hand', 'invoice'),
(82, '0', '50', '', 2, 'cash_sale by order id#34', '2024-02-07 14:40:47', '2024-02-07', 'cash_in_hand', 'invoice'),
(83, '0', '1840', '', 7, 'credit_sale by order id#35', '2024-02-18 14:42:12', '2024-02-18', 'credit_sale', 'invoice'),
(84, '0', '8', '', 2, 'cash_sale by order id#36', '2024-02-26 07:38:55', '2024-02-26', 'cash_in_hand', 'invoice'),
(85, '0', '1000', '', 2, 'cash_sale by order id#37', '2024-04-18 13:20:46', '2024-04-18', 'cash_in_hand', 'invoice'),
(86, '0', '100', '', 2, 'cash_sale by order id#38', '2024-04-18 13:21:50', '2024-04-18', 'cash_in_hand', 'invoice'),
(92, '0', '500', '', 13, 'credit_sale by order id#39', '2024-08-10 11:01:48', '2024-08-10', 'credit_sale', 'invoice'),
(93, '0', '50', '', 0, 'cash_sale by order id#40', '2024-08-17 10:26:37', '2024-08-17', 'cash_in_hand', 'invoice'),
(94, '5', '0', '', 2, 'purchased by purchased id#21', '2024-11-28 11:36:31', '2024-11-28', 'cash_purchase', 'purchase'),
(95, '5', '0', '', 11, 'purchased on  purchased id#22', '2024-11-28 11:40:33', '2024-11-28', 'credit_purchase', 'purchase'),
(96, '500', '0', '', 2, 'purchased by purchased id#23', '2024-11-28 19:15:27', '2024-11-29', 'cash_purchase', 'purchase'),
(97, '25000', '0', '', 5, 'purchased on  purchased id#24', '2024-12-03 07:47:11', '2024-12-03', 'credit_purchase', 'purchase'),
(98, '0', '500', '', 2, 'cash_sale by order id#41', '2024-12-07 07:58:00', '2024-12-07', 'cash_in_hand', 'invoice'),
(101, '5000', '0', '', 18, 'debited to his account', '2024-12-07 08:19:21', '2024-12-07', 'single_voucher', 'voucher'),
(102, '10000', '0', '', 2, '', '2024-12-07 08:24:56', '2024-12-07', 'general_voucher', 'voucher'),
(103, '0', '10000', '', 18, '', '2024-12-07 08:24:56', '2024-12-07', 'general_voucher', 'voucher'),
(104, '5000', '0', '', 2, 'purchased by purchased id#25', '2024-12-07 08:34:56', '2024-12-07', 'cash_purchase', 'purchase'),
(105, '5000', '0', '', 2, 'purchased by purchased id#26', '2024-12-07 08:37:49', '2024-12-07', 'cash_purchase', 'purchase'),
(106, '5000', '0', '', 18, 'purchased on  purchased id#27', '2024-12-07 09:33:38', '2024-12-07', 'credit_purchase', 'purchase'),
(107, '0', '5000', '', 19, 'credit_sale by order id#42', '2024-12-07 09:40:53', '2024-12-07', 'credit_sale', 'invoice'),
(108, '180000', '0', '', 20, 'purchased on  purchased id#28', '2024-12-07 11:16:04', '2024-12-07', 'credit_purchase', 'purchase'),
(109, '5000', '0', '', 2, '', '2024-12-07 11:28:47', '2024-12-07', 'general_voucher', 'voucher'),
(110, '0', '5000', '', 20, '', '2024-12-07 11:28:47', '2024-12-07', 'general_voucher', 'voucher');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` text NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `address` text NOT NULL,
  `phone` text NOT NULL,
  `user_role` text NOT NULL,
  `status` text NOT NULL,
  `adddatetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `fullname`, `email`, `password`, `address`, `phone`, `user_role`, `status`, `adddatetime`) VALUES
(1, 'admin', 'Ahsan Malik ', 'a.ttraders909@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'fsd', '1234567', 'admin', '1', '2022-12-08 13:38:04'),
(5, 'test', '', 'ali@polybags.com', '81dc9bdb52d04dc20036dbd8313ed055', 'fsd', '03057442934', 'manager', '1', '2022-06-27 19:21:18');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `voucher_id` int(11) NOT NULL,
  `customer_id1` varchar(250) DEFAULT NULL,
  `customer_id2` varchar(250) DEFAULT NULL,
  `addby_user_id` int(11) DEFAULT NULL,
  `editby_user_id` int(11) DEFAULT NULL,
  `voucher_amount` varchar(250) NOT NULL,
  `transaction_id1` varchar(250) DEFAULT NULL,
  `transaction_id2` varchar(250) DEFAULT NULL,
  `voucher_hint` text DEFAULT NULL,
  `voucher_date` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `voucher_type` varchar(100) DEFAULT NULL,
  `voucher_group` varchar(100) DEFAULT NULL,
  `td_check_no` text DEFAULT NULL,
  `voucher_bank_name` varchar(255) DEFAULT NULL,
  `td_check_date` varchar(100) DEFAULT NULL,
  `check_type` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`voucher_id`, `customer_id1`, `customer_id2`, `addby_user_id`, `editby_user_id`, `voucher_amount`, `transaction_id1`, `transaction_id2`, `voucher_hint`, `voucher_date`, `timestamp`, `voucher_type`, `voucher_group`, `td_check_no`, `voucher_bank_name`, `td_check_date`, `check_type`) VALUES
(15, '18', NULL, 1, NULL, '5000', '101', NULL, 'debited to his account', '2024-12-07', '2024-12-07 08:19:21', NULL, 'single_voucher', NULL, NULL, NULL, NULL),
(16, '2', '18', 1, NULL, '10000', '102', '103', '', '2024-12-07', '2024-12-07 08:24:56', 'general_voucher', 'general_voucher', '', '', '', ''),
(17, '2', '20', 1, NULL, '5000', '109', '110', '', '2024-12-07', '2024-12-07 11:28:47', 'general_voucher', 'general_voucher', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `brokers`
--
ALTER TABLE `brokers`
  ADD PRIMARY KEY (`broker_id`);

--
-- Indexes for table `budget`
--
ALTER TABLE `budget`
  ADD PRIMARY KEY (`budget_id`);

--
-- Indexes for table `budget_category`
--
ALTER TABLE `budget_category`
  ADD PRIMARY KEY (`budget_category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `checks`
--
ALTER TABLE `checks`
  ADD PRIMARY KEY (`check_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`privileges_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD PRIMARY KEY (`purchase_item_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`voucher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `brokers`
--
ALTER TABLE `brokers`
  MODIFY `broker_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `budget`
--
ALTER TABLE `budget`
  MODIFY `budget_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `budget_category`
--
ALTER TABLE `budget_category`
  MODIFY `budget_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `checks`
--
ALTER TABLE `checks`
  MODIFY `check_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `privileges_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1356;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `purchase_item`
--
ALTER TABLE `purchase_item`
  MODIFY `purchase_item_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
