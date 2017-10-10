-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 10 Okt 2017 pada 08.19
-- Versi Server: 5.5.57-cll
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `k8099276_e`
--
CREATE DATABASE IF NOT EXISTS `k8099276_e` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `k8099276_e`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_addresses`
--

DROP TABLE IF EXISTS `sma_addresses`;
CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_adjustments`
--

DROP TABLE IF EXISTS `sma_adjustments`;
CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_adjustments`
--

INSERT INTO `sma_adjustments` (`id`, `date`, `reference_no`, `warehouse_id`, `note`, `attachment`, `created_by`, `updated_by`, `updated_at`, `count_id`) VALUES
(1, '2017-07-26 02:01:00', 'PR/2017/07/0001', 1, '', NULL, 2, NULL, NULL, NULL),
(2, '2017-07-26 05:27:00', 'PR/2017/07/0002', 1, '&lt;p&gt;test adjustment&lt;&sol;p&gt;', NULL, 2, NULL, NULL, NULL),
(3, '2017-10-06 20:08:00', 'PR/2017/10/0003', 1, '', NULL, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_adjustment_items`
--

DROP TABLE IF EXISTS `sma_adjustment_items`;
CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_adjustment_items`
--

INSERT INTO `sma_adjustment_items` (`id`, `adjustment_id`, `product_id`, `option_id`, `quantity`, `warehouse_id`, `serial_no`, `type`) VALUES
(2, 1, 1, NULL, '1.0000', 1, '123', 'addition'),
(3, 2, 3, NULL, '2.0000', 1, '', 'addition'),
(4, 2, 1, NULL, '1.0000', 1, '', 'subtraction'),
(5, 2, 3, NULL, '2.0000', 1, '', 'addition'),
(6, 3, 4, NULL, '100.0000', 1, '', 'subtraction');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_banner`
--

DROP TABLE IF EXISTS `sma_banner`;
CREATE TABLE `sma_banner` (
  `banner_id` int(11) NOT NULL,
  `banner_src` text NOT NULL,
  `banner_type` varchar(10) NOT NULL,
  `banner_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sma_banner`
--

INSERT INTO `sma_banner` (`banner_id`, `banner_src`, `banner_type`, `banner_date`) VALUES
(8, '79396635cc62479be1d80c17a408f215.png', 'image/png', '2017-08-30 05:58:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_brands`
--

DROP TABLE IF EXISTS `sma_brands`;
CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_calendar`
--

DROP TABLE IF EXISTS `sma_calendar`;
CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_captcha`
--

DROP TABLE IF EXISTS `sma_captcha`;
CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_categories`
--

DROP TABLE IF EXISTS `sma_categories`;
CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`) VALUES
(1, 'C1', 'Category 1', NULL, NULL, NULL),
(2, 'NR', 'Nature REpublic', NULL, 0, 'nature-republic'),
(3, 'NRI', 'Nature republic Indonesia', NULL, 0, 'nature-republic-indonesia'),
(4, 'NGM', 'NRI Global Mandiri', NULL, 0, 'nri-global-mandiri');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_code`
--

DROP TABLE IF EXISTS `sma_code`;
CREATE TABLE `sma_code` (
  `id_code` int(11) NOT NULL,
  `generate_code` varchar(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sma_code`
--

INSERT INTO `sma_code` (`id_code`, `generate_code`) VALUES
(1, 'aaaaa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_combo_items`
--

DROP TABLE IF EXISTS `sma_combo_items`;
CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_companies`
--

DROP TABLE IF EXISTS `sma_companies`;
CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@tecdiary.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(2, 4, 'supplier', NULL, NULL, 'Supplier', 'marq', '', 'jl. Nusa Indah blok HA 10 no 60', 'Jakarta', 'DKI Jakarta', '15132', 'Indonesia', '758375837', 'supplier@yahoo.com', '-', '-', '-', '085959829092', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'Biller', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'biller@erp.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo5.png', 0, NULL, NULL, NULL),
(4, 4, 'supplier', NULL, NULL, 'supp', 'abc', '', 'lorem ipsum', 'lorem', '', '', '', '65778878', 'supp@pos.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(5, 3, 'customer', 1, 'General', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_costing`
--

DROP TABLE IF EXISTS `sma_costing`;
CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(2, '2017-07-26', 3, 2, 2, 2, '1.0000', '0.0000', '0.0000', '136363.6364', '150000.0000', '3.0000', 1, 0, NULL),
(3, '2017-07-26', 1, 3, 2, 1, '1.0000', '1000000.0000', '1000000.0000', '2000000.0000', '2000000.0000', '999989.0000', 1, 0, NULL),
(4, '2017-07-26', 3, 4, 2, 2, '1.0000', '0.0000', '0.0000', '136363.6364', '150000.0000', '3.0000', 1, 0, NULL),
(5, '2017-10-02', 3, 5, 3, 2, '1.0000', '0.0000', '0.0000', '136363.6364', '150000.0000', '1.0000', 1, 0, NULL),
(6, '2017-10-04', 3, 6, 4, 2, '1.0000', '0.0000', '0.0000', '136363.6364', '150000.0000', '0.0000', 1, 0, NULL),
(7, '2017-10-06', 3, 7, 5, 9, '1.0000', '45454.5455', '50000.0000', '136363.6364', '150000.0000', '99999.0000', 1, 0, NULL),
(8, '2017-10-06', 4, 8, 5, 10, '1.0000', '45454.5455', '50000.0000', '136363.6364', '150000.0000', '99999.0000', 1, 0, NULL),
(9, '2017-10-06', 6, 9, 5, 7, '1.0000', '45454.5455', '50000.0000', '136363.6364', '150000.0000', '9999.0000', 1, 0, NULL),
(10, '2017-10-10', 3, 10, 6, 9, '1.0000', '45454.5455', '50000.0000', '136363.6364', '150000.0000', '99998.0000', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_currencies`
--

DROP TABLE IF EXISTS `sma_currencies`;
CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', '1.0000', 0, NULL),
(2, 'ERU', 'EURO', '0.7340', 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_customer_groups`
--

DROP TABLE IF EXISTS `sma_customer_groups`;
CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_date_format`
--

DROP TABLE IF EXISTS `sma_date_format`;
CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_deliveries`
--

DROP TABLE IF EXISTS `sma_deliveries`;
CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_deposits`
--

DROP TABLE IF EXISTS `sma_deposits`;
CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_expenses`
--

DROP TABLE IF EXISTS `sma_expenses`;
CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_expense_categories`
--

DROP TABLE IF EXISTS `sma_expense_categories`;
CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_gift_cards`
--

DROP TABLE IF EXISTS `sma_gift_cards`;
CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_gift_card_topups`
--

DROP TABLE IF EXISTS `sma_gift_card_topups`;
CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_groups`
--

DROP TABLE IF EXISTS `sma_groups`;
CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_login_attempts`
--

DROP TABLE IF EXISTS `sma_login_attempts`;
CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_logs`
--

DROP TABLE IF EXISTS `sma_logs`;
CREATE TABLE `sma_logs` (
  `log_id` int(11) NOT NULL,
  `log_act` text NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_table` text NOT NULL,
  `log_ip` text NOT NULL,
  `log_user` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sma_logs`
--

INSERT INTO `sma_logs` (`log_id`, `log_act`, `log_date`, `log_table`, `log_ip`, `log_user`) VALUES
(12, 'Menghapus purchase dengan nomor referensi PO/2017/08/0001', '2017-08-29 14:28:49', 'sma_purchases', '127.0.0.1', 2),
(13, 'Memperbarui produk dengan kode 0035532', '2017-08-30 04:53:25', 'sma_products', '36.71.50.125', 2),
(14, 'Menghapus produk dengan kode 59755794', '2017-09-01 07:02:37', 'sma_products', '114.124.171.36', 2),
(15, 'Menghapus produk dengan kode 123', '2017-09-01 07:06:01', 'sma_products', '114.124.171.36', 2),
(16, 'Menghapus discount dengan id 2', '2017-09-29 00:47:28', 'sma_product_discounts', '182.253.163.14', 2),
(17, 'Menghapus discount dengan id 2', '2017-09-29 01:18:51', 'sma_product_discounts', '182.253.163.14', 2),
(18, 'Menghapus discount dengan id 2', '2017-09-29 01:22:07', 'sma_product_discounts', '182.253.163.14', 2),
(19, 'Menghapus discount dengan id 2', '2017-09-29 01:22:14', 'sma_product_discounts', '182.253.163.14', 2),
(20, 'Menambah produk dengan kode 00355327897', '2017-09-29 01:49:18', 'sma_products', '36.78.94.147', 2),
(21, 'Memperbarui produk dengan kode 0035532', '2017-10-02 08:39:17', 'sma_products', '103.217.172.166', 2),
(22, 'Memperbarui produk dengan kode 00355327897', '2017-10-02 08:40:03', 'sma_products', '103.217.172.166', 2),
(23, 'Menambah produk dengan kode 0035531', '2017-10-06 09:16:03', 'sma_products', '110.137.166.240', 2),
(24, 'Menambah produk dengan kode 00355321', '2017-10-06 09:18:32', 'sma_products', '110.137.166.240', 2),
(25, 'Menambah purchase dengan nomor referensi PO/2017/10/0002', '2017-10-06 09:26:25', 'sma_purchases', '110.137.166.240', 2),
(26, 'Memperbarui sales dengan nomor referensi SALE/2017/07/0001', '2017-10-10 07:27:27', 'sma_sales', '202.51.126.138', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_migrations`
--

DROP TABLE IF EXISTS `sma_migrations`;
CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_notifications`
--

DROP TABLE IF EXISTS `sma_notifications`;
CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_order_ref`
--

DROP TABLE IF EXISTS `sma_order_ref`;
CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 2, 1, 2, 1, 6, 1, 6, 1, 1, 1, 1, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_payments`
--

DROP TABLE IF EXISTS `sma_payments`;
CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(1, '2017-07-26 05:30:24', 2, NULL, NULL, 'IPAY/2017/07/0001', NULL, 'cash', '', '', '', '', '', '', '2300000.0000', NULL, 2, NULL, 'received', '', '2300000.0000', '0.0000', NULL),
(2, '2017-10-02 19:40:43', 3, NULL, NULL, 'IPAY/2017/10/0002', NULL, 'cash', '', '', '', '', '', '', '150000.0000', NULL, 2, NULL, 'received', '', '150000.0000', '0.0000', NULL),
(3, '2017-10-04 19:40:52', 4, NULL, NULL, 'IPAY/2017/10/0003', NULL, 'cash', '', '', '', '', '', '', '154000.0000', NULL, 2, NULL, 'received', '', '154000.0000', '0.0000', NULL),
(4, '2017-10-06 20:28:20', 5, NULL, NULL, 'IPAY/2017/10/0004', NULL, 'cash', '', '', '', '', '', '', '450000.0000', NULL, 2, NULL, 'received', '', '450000.0000', '0.0000', NULL),
(5, '2017-10-10 18:01:54', 6, NULL, NULL, 'IPAY/2017/10/0005', NULL, 'cash', '', '', '', '', '', '', '150000.0000', NULL, 2, NULL, 'received', '', '155220.0000', '5220.0000', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_paypal`
--

DROP TABLE IF EXISTS `sma_paypal`;
CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_permissions`
--

DROP TABLE IF EXISTS `sma_permissions`;
CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`) VALUES
(1, 5, 1, 1, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_pos_register`
--

DROP TABLE IF EXISTS `sma_pos_register`;
CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2017-07-17 05:19:25', 1, '123.0000', 'close', '145.0000', 0, 0, '5000000.0000', 0, 0, '', '2017-07-27 04:23:51', NULL, 2),
(2, '2017-07-17 16:29:04', 2, '145.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_pos_settings`
--

DROP TABLE IF EXISTS `sma_pos_settings`;
CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.2.2',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.2.2', 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_price_groups`
--

DROP TABLE IF EXISTS `sma_price_groups`;
CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_printers`
--

DROP TABLE IF EXISTS `sma_printers`;
CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_products`
--

DROP TABLE IF EXISTS `sma_products`;
CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`) VALUES
(3, '0035532', 'Acne Care AA', 1, '50000.0000', '150000.0000', '100.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '99998.0000', 2, 1, '', NULL, 'code39', '', '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'acne-care-aa', NULL, '1.0000'),
(4, '00355327897', 'Acne Care BB', 1, '50000.0000', '150000.0000', '100.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '99901.0000', 2, 1, '', NULL, 'code39', '', '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, 'acne-care-bb', NULL, '0.0000'),
(5, '0035531', 'Acne Care CC', 1, '50000.0000', '150000.0000', '100.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '10000000.0000', 2, 1, '', NULL, 'code39', '', '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, 'acne-care-cc', NULL, '0.0000'),
(6, '00355321', 'Acne Care C1', 1, '50000.0000', '150000.0000', '100.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '9999.0000', 2, 1, '', NULL, 'code39', '', '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, 'acne-care-c1', NULL, '0.0000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_product_discounts`
--

DROP TABLE IF EXISTS `sma_product_discounts`;
CREATE TABLE `sma_product_discounts` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `free_item_id` int(11) DEFAULT NULL,
  `min_trx` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sma_product_discounts`
--

INSERT INTO `sma_product_discounts` (`id`, `product_id`, `discount`, `start_date`, `end_date`, `free_item_id`, `min_trx`, `status`) VALUES
(6, 3, 10, '2017-09-01 08:45:36', '2017-12-31 08:45:37', 0, 0, 1),
(5, 3, 11, '2017-09-29 08:19:54', '2017-09-29 08:19:56', 0, 100000, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_product_photos`
--

DROP TABLE IF EXISTS `sma_product_photos`;
CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_product_prices`
--

DROP TABLE IF EXISTS `sma_product_prices`;
CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_product_variants`
--

DROP TABLE IF EXISTS `sma_product_variants`;
CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_purchases`
--

DROP TABLE IF EXISTS `sma_purchases`;
CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`) VALUES
(1, 'PO/2017/10/0001', '2017-10-06 20:24:00', 4, 'abc', 1, '', '9090909.1000', '0.0000', NULL, '0.0000', '0.0000', '909090.9000', 1, '0.0000', '909090.9000', '0.0000', '10000000.0000', '0.0000', 'received', 'pending', 2, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_purchase_items`
--

DROP TABLE IF EXISTS `sma_purchase_items`;
CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`) VALUES
(1, NULL, NULL, 1, '123', 'test produk', NULL, '1000000.0000', '1000000.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '1000000000000.0000', '999989.0000', '2017-07-17', 'received', '1000000.0000', '1000000.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(2, NULL, NULL, 3, '00355545', 'Acne Care AA', NULL, '0.0000', '0.0000', 1, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '2017-07-26', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(3, NULL, NULL, 4, '00355327897', 'Acne Care BB', NULL, '45454.5455', '2.0000', 1, '9090.9091', 2, '10.0000%', NULL, NULL, NULL, '100000.0000', '-98.0000', '2017-09-29', 'received', '50000.0000', '50000.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(4, NULL, NULL, 4, '00355327897', 'Acne Care BB', NULL, '45454.5455', '0.0000', 2, '0.0000', 2, '10.0000%', NULL, NULL, NULL, '0.0000', '0.0000', '2017-09-29', 'received', '50000.0000', '50000.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(5, NULL, NULL, 5, '0035531', 'Acne Care CC', NULL, '45454.5455', '10000000.0000', 1, '45454545454.5000', 2, '10.0000%', NULL, NULL, NULL, '500000000000.0000', '10000000.0000', '2017-10-06', 'received', '50000.0000', '50000.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(6, NULL, NULL, 5, '0035531', 'Acne Care CC', NULL, '45454.5455', '0.0000', 2, '0.0000', 2, '10.0000%', NULL, NULL, NULL, '0.0000', '0.0000', '2017-10-06', 'received', '50000.0000', '50000.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(7, NULL, NULL, 6, '00355321', 'Acne Care C1', NULL, '45454.5455', '10000.0000', 1, '45454545.4545', 2, '10.0000%', NULL, NULL, NULL, '500000000.0000', '9999.0000', '2017-10-06', 'received', '50000.0000', '50000.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(8, NULL, NULL, 6, '00355321', 'Acne Care C1', NULL, '45454.5455', '0.0000', 2, '0.0000', 2, '10.0000%', NULL, NULL, NULL, '0.0000', '0.0000', '2017-10-06', 'received', '50000.0000', '50000.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(9, 1, NULL, 3, '0035532', 'Acne Care AA', NULL, '45454.5455', '100000.0000', 1, '454545.4500', 2, '10.0000%', '0', '0.0000', NULL, '5000000.0000', '99998.0000', '2017-10-06', 'received', '50000.0000', '50000.0000', '100000.0000', NULL, NULL, 1, 'U1', '100.0000'),
(10, 1, NULL, 4, '00355327897', 'Acne Care BB', NULL, '45454.5455', '100000.0000', 1, '454545.4500', 2, '10.0000%', '0', '0.0000', NULL, '5000000.0000', '99999.0000', '2017-10-06', 'received', '50000.0000', '50000.0000', '100000.0000', NULL, NULL, 1, 'U1', '100.0000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_quotes`
--

DROP TABLE IF EXISTS `sma_quotes`;
CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_quote_items`
--

DROP TABLE IF EXISTS `sma_quote_items`;
CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_sales`
--

DROP TABLE IF EXISTS `sma_sales`;
CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`, `suspend_note`, `api`, `shop`, `address_id`, `reserve_id`, `hash`) VALUES
(1, '2017-07-17 04:44:00', 'SALE/2017/07/0001', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '20000000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '20000000.0000', 'completed', 'due', 0, NULL, 1, 2, '2017-10-10 18:27:27', 10, 0, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', NULL, NULL, 0, 0, NULL, NULL, '6df80f9dbc8dde08dfc8a5109be4fd5f9af0b606bbd933f91c9dd3ebeddaa553'),
(2, '2017-07-26 05:30:24', 'SALE/POS/2017/07/0001', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '2272727.2728', '0.0000', NULL, '0.0000', '0.0000', '27272.7272', 1, '0.0000', '27272.7272', '0.0000', '2300000.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 3, 1, '2300000.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, 'bd9b183c83726fd8121ac4bbe5f8caf1275c8c945a6cc8208be16d8fab3a895c'),
(3, '2017-10-02 19:40:43', 'SALE/POS/2017/10/0002', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '136363.6364', '0.0000', NULL, '0.0000', '0.0000', '13636.3636', 1, '0.0000', '13636.3636', '0.0000', '150000.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '150000.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, 'ecd4e00cfb2f0deab42b30e0a1c55c6b4088c89ac6e83fc12ec8f63cd93b2e61'),
(4, '2017-10-04 19:40:52', 'SALE/POS/2017/10/0003', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '136363.6364', '0.0000', '10000', '10000.0000', '10000.0000', '13636.3636', 2, '14000.0000', '27636.3636', '0.0000', '154000.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '154000.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '424f77b27921236b7f1f84a7b19e8b946a33c3c2d65a92a7f6b7dc0181357ba1'),
(5, '2017-10-06 20:28:20', 'SALE/POS/2017/10/0004', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '409090.9092', '0.0000', NULL, '0.0000', '0.0000', '40909.0908', 1, '0.0000', '40909.0908', '0.0000', '450000.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 3, 1, '450000.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, 'ff45bb91ff786d7c3d235742d01b9bb408fc01ad5751ad26d12f5d7670ab12ed'),
(6, '2017-10-10 18:01:54', 'SALE/POS/2017/10/0005', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '136363.6364', '0.0000', NULL, '0.0000', '0.0000', '13636.3636', 1, '0.0000', '13636.3636', '0.0000', '150000.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '150000.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '4c667a1edec8ac5f0a89c2f6c0726f40116a8f99638f06e8019f76359e7eecf0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_sale_items`
--

DROP TABLE IF EXISTS `sma_sale_items`;
CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`) VALUES
(11, 1, 1, '123', 'test produk', 'standard', NULL, '2000000.0000', '2000000.0000', '10.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '20000000.0000', '', '2000000.0000', NULL, 1, 'U1', '10.0000', NULL),
(2, 2, 3, '00355545', 'Acne Care AA', 'standard', NULL, '136363.6364', '150000.0000', '1.0000', 1, '13636.3636', 2, '10.0000%', '0', '0.0000', '150000.0000', '', '150000.0000', NULL, 1, 'U1', '1.0000', ''),
(3, 2, 1, '123', 'test produk', 'standard', NULL, '2000000.0000', '2000000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2000000.0000', '', '2000000.0000', NULL, 1, 'U1', '1.0000', ''),
(4, 2, 3, '00355545', 'Acne Care AA', 'standard', NULL, '136363.6364', '150000.0000', '1.0000', 1, '13636.3636', 2, '10.0000%', '0', '0.0000', '150000.0000', '', '150000.0000', NULL, 1, 'U1', '1.0000', ''),
(5, 3, 3, '0035532', 'Acne Care AA', 'standard', NULL, '136363.6364', '150000.0000', '1.0000', 1, '13636.3636', 2, '10.0000%', '0', '0.0000', '150000.0000', '', '150000.0000', NULL, 1, 'U1', '1.0000', ''),
(6, 4, 3, '0035532', 'Acne Care AA', 'standard', NULL, '136363.6364', '150000.0000', '1.0000', 1, '13636.3636', 2, '10.0000%', '0', '0.0000', '150000.0000', '', '150000.0000', NULL, 1, 'U1', '1.0000', ''),
(7, 5, 3, '0035532', 'Acne Care AA', 'standard', NULL, '136363.6364', '150000.0000', '1.0000', 1, '13636.3636', 2, '10.0000%', '0', '0.0000', '150000.0000', '', '150000.0000', NULL, 1, 'U1', '1.0000', ''),
(8, 5, 4, '00355327897', 'Acne Care BB', 'standard', NULL, '136363.6364', '150000.0000', '1.0000', 1, '13636.3636', 2, '10.0000%', '0', '0.0000', '150000.0000', '', '150000.0000', NULL, 1, 'U1', '1.0000', ''),
(9, 5, 6, '00355321', 'Acne Care C1', 'standard', NULL, '136363.6364', '150000.0000', '1.0000', 1, '13636.3636', 2, '10.0000%', '0', '0.0000', '150000.0000', '', '150000.0000', NULL, 1, 'U1', '1.0000', ''),
(10, 6, 3, '0035532', 'Acne Care AA', 'standard', NULL, '136363.6364', '150000.0000', '1.0000', 1, '13636.3636', 2, '10.0000%', '0', '0.0000', '150000.0000', '', '150000.0000', NULL, 1, 'U1', '1.0000', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_sessions`
--

DROP TABLE IF EXISTS `sma_sessions`;
CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('010ghdubl92llaok56ls9r8st9dahaqf', '180.243.48.252', 1500311181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303331303839323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036313734223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303331303839323b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('02egqsuu2at6poqki8ri02qhgnb6pf3b', '125.160.199.27', 1500450233, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303435303034323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303435303037343b),
('0ahumv7uqdrsrk08gh4rd3kc8oatmsvu', '180.243.48.252', 1500306829, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303330363737353b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036313734223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('0dqavjq3dm630u57rmfrfarhkttcpssh', '182.30.68.60', 1501007584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313030373533373b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030393934363933223b6c6173745f69707c733a31333a223132352e3136312e3130322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313030373537373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('0tsp3t8tf7d2vvjal2c9kl12u356ch8t', '45.64.1.80', 1500436960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433363936303b),
('2o517tgkdjv2bhjklu4geb8d2ng854he', '180.243.48.252', 1500308352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303330383335323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036313734223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2opkhvd3vjjl74bp3pe8kj33ifc21hni', '125.160.199.27', 1500436164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433353836393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303433343335323b6d6573736167657c733a32393a22537570706c696572207375636365737366756c6c792075706461746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('2pprf8mcdn545p13ngpp2tquv08k5hvr', '36.78.91.176', 1501162617, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136323436313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313333323537223b6c6173745f69707c733a31343a223130332e3233312e3230322e3833223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313136323631353b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('34vn05ue15mo1v0d4pi5nkhfhpdf7qhq', '103.47.135.148', 1503910553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333931303530353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033353838313534223b6c6173745f69707c733a31343a223132352e3136302e3231332e3837223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530333931303535333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('39t38361tolspu3eaebg7lvgndv3ga3g', '180.243.48.252', 1500307566, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303330373238333b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036313734223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3eg68fhea0483j8avfp70qdjrus495ab', '110.137.171.142', 1501087093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313038373033313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303634383731223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3igh23p03g7mkie08kmi5d3v30eb13s9', '182.30.113.83', 1500474943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437343730333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343733313332223b6c6173745f69707c733a31323a2233362e37382e38342e313632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303437343538333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('3rpfg85bg078tvv79vfd891c5d8g6pbl', '114.124.197.241', 1500460249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303436303231363b7265717565737465645f706167657c733a353a2261646d696e223b),
('3ujmbn9rjtvn5la4v2e36qa8tui0pd51', '110.137.171.142', 1501094338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313039343134393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303634383731223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313038393835333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('42kc0ldolr2nrm2jofeoakncgbki54bq', '202.43.165.22', 1501058330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313035383332363b7265717565737465645f706167657c733a353a2261646d696e223b),
('45rne0ilb52f6ubqan8rhpcegl7i7ra4', '114.124.183.113', 1501049852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313034393834333b),
('473rukpp0uicum5hkd1dvvq2scf75ejt', '36.71.88.181', 1502167023, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530323136373030333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353032303236323936223b6c6173745f69707c733a31353a223132352e3136362e3139322e323239223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('48fl0g2rsugddg9c61f21uij51iaqr7h', '125.160.199.27', 1500437016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433363734323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303433343335323b),
('48mtto30vn95qocgf876c7btoj009jl5', '116.206.29.98', 1501054570, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313035313539383b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303439383437223b6c6173745f69707c733a31353a223131342e3132342e3138332e313133223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313035343537303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('4j3b6r4vaulruop27ntm3mb0m3vqg5fa', '180.243.48.252', 1500268774, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303236383734323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030323638373331223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4oncanpsrn97nsa753ommta8qkk5or05', '64.233.173.28', 1501168047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136383032373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313635353131223b6c6173745f69707c733a31323a2233362e37382e39312e313736223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313136383034373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('4tkkqg0o7fg5lb5h4fhe0f7j2ia7fag2', '125.160.199.27', 1500433792, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433333439373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5jba82hab4icv0tibbsmq5bf9sj2h3qt', '125.161.114.101', 1500056589, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303035363537333b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030303438343935223b6c6173745f69707c733a31353a223132352e3136312e3131342e313031223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5o99pb1u0uo06mvdircfjvc7q5hda1lm', '114.124.183.113', 1501054951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313035343934303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303334333437223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313035323334373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('60bdsfrij8rque0lb5fvjs08er3uhrcv', '36.71.88.181', 1502165609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530323136353533383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353032303236323936223b6c6173745f69707c733a31353a223132352e3136362e3139322e323239223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('69erk078fbbgruidmd673beimqsbq2v0', '116.206.29.98', 1501054708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313035343630343b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303439383437223b6c6173745f69707c733a31353a223131342e3132342e3138332e313133223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313035343537303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('6a55i8fm3br3b4gva6glvu8t6nkjl349', '110.137.171.142', 1501086385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313038363233303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303634383731223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6ca4fbfe3uv7dnls1f42s9drm4l7248m', '114.124.183.113', 1501052347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313035323332333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303334333437223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313035323334373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('6h3n2hp8jv3sncc6tqlhpnu6ic4t5kht', '36.78.91.176', 1501163047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136323837333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313333323537223b6c6173745f69707c733a31343a223130332e3233312e3230322e3833223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313136333034353b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('6k94fkek7oa36ucuu4eg8m1f38gum3j6', '116.206.29.120', 1501165937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136353737313b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313634333138223b6c6173745f69707c733a31323a2233362e37382e39312e313736223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313136353933373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('6u38rbehgslv3k5h5c7rqjr4mrvv05dn', '182.30.113.83', 1500477088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437373038363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343733313332223b6c6173745f69707c733a31323a2233362e37382e38342e313632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303437343538333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('74m8u1cjljun1rupu54vqgqogpt33cfc', '125.160.199.27', 1500435332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433353036323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303433343335323b),
('75erlft2d76ba6b9k536buo1p30psmtj', '202.43.165.22', 1504063024, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343036333032343b),
('7h92qll85209c6s857485ndbk8c3mqh3', '125.161.114.101', 1500045278, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303034353237383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343236363138343932223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7i7l8ncggc27i0hittdm90u76oqolap9', '103.231.202.83', 1501141914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313134313839393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303836333030223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22676377324f526657555143493958746979306554223b),
('7j3hou3hcfu786t9ufun6fnnv18hnhdc', '125.160.199.27', 1500434412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433343335303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303433343335323b),
('7q19vld75eiapng0qtuqj52rvqdjrihu', '125.160.199.27', 1500436183, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433363137303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303433343335323b),
('8bjhftass1jil3ecq4bo2nb79gpi0ijl', '64.233.173.60', 1501682678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313638323637363b6572726f727c733a3134383a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f646176656c796e73747564696f2e636f6d2f6170702f7468656d65732f64656661756c742f61646d696e2f6173736574732f696d616765732f69636f6e2e706e67223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8cikb5v24vun987j1vbkaqv3v26n73g4', '180.243.48.252', 1500310752, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303331303536353b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036313734223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8dpkq90ipvln2hd43q1p5r5qdjnum80s', '182.30.68.60', 1501006803, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313030363535333b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030393934363933223b6c6173745f69707c733a31333a223132352e3136312e3130322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8ic61hq28d9ukn78qmll89rqlb328o6k', '116.206.29.98', 1501055008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313035343933393b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303439383437223b6c6173745f69707c733a31353a223131342e3132342e3138332e313133223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313035343537303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('93glejenm3rq5j36ivo23q51eusfvnsl', '36.78.91.176', 1501134427, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313133343237383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303836333030223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22676377324f526657555143493958746979306554223b),
('93qtdu3hke45rv4d3gv0kcscnhdfejp0', '114.124.135.225', 1503309762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333330393632303b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353032323831303138223b6c6173745f69707c733a31343a223131302e3133362e31382e313739223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530333330393736313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('94a3rd72cl6tvt2iaa4eg17mfuo7ecdc', '36.78.91.176', 1501165403, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136353137373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313634363530223b6c6173745f69707c733a31323a2233362e37382e39312e313736223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313136353430333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b6d6573736167657c733a32373a22437573746f6d6572207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('959g91uabdbm6s4n268lvg4d77tlg2s9', '125.166.125.146', 1501422116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313432323131363b7265717565737465645f706167657c733a32313a2261646d696e2f73797374656d5f73657474696e6773223b),
('99uqikavu2369f7mh4ovivq2nqp8vv59', '110.137.171.142', 1501087025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313038363733303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303634383731223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9f4ulhbpvhehu0bcb80157daaidev4ib', '103.231.202.83', 1501133546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313133333233373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303836333030223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22703031426c693652637647513346416e4373534c223b),
('9f8q12dmrn00ed1p78qqpuia8pihie9m', '125.161.114.101', 1500048498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303034383436313b7265717565737465645f706167657c733a31393a2261646d696e2f7472616e73666572732f616464223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030303434373736223b6c6173745f69707c733a31353a223132352e3136312e3131342e313031223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9fsd144gta6ald1nqate4vsrcumovhao', '125.160.199.27', 1500451168, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303435313134323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343333313536223b6c6173745f69707c733a31343a223132352e3136302e3139392e3237223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303435313136363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('9n95g8dlt8c9972asg2uk3n353pf9v7i', '36.71.88.181', 1502165288, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530323136353131393b7265717565737465645f706167657c733a353a2261646d696e223b),
('9ok6qg8brfom28hvv78vpmkljv91q0u9', '182.30.68.60', 1501003580, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313030333238323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030393934363933223b6c6173745f69707c733a31333a223132352e3136312e3130322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('an1vhfpri12u7q7mj55hu6sdfno0pdfd', '182.30.68.60', 1501003605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313030333539313b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030393934363933223b6c6173745f69707c733a31333a223132352e3136312e3130322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('au8beko4a93lgnmhago1ndif6s6v03fn', '36.78.91.176', 1501164607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136343131303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313333323537223b6c6173745f69707c733a31343a223130332e3233312e3230322e3833223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313136343630363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('b2961fe2d7pc8g6gjiehuppi8amhg69h', '36.78.91.176', 1501133874, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313133333539303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303836333030223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22676377324f526657555143493958746979306554223b),
('bat75p6nj60ikkvq442t6picp9fb5dfn', '36.78.91.176', 1501164617, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136343631323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313333323537223b6c6173745f69707c733a31343a223130332e3233312e3230322e3833223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313136343631363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('bkvf7gqjump1sfk4fld82lh5rs6jk6f6', '125.166.192.229', 1502026310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530323032363239353b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031343137353434223b6c6173745f69707c733a31353a223132352e3136362e3132352e313436223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530323032363239363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('bms4ptteb2l62snirnml3pr7fhs15rc7', '114.124.183.113', 1501049856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313034393834343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303334333437223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('bp3lvbo66nj5u3qa7aj769c48gf8c7uf', '125.161.102.1', 1500994960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303939343637343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343733393731223b6c6173745f69707c733a31333a223138322e33302e3131332e3833223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('buj6m24rcg22erl4mob6dlc3eqs1hrv1', '180.243.48.252', 1500309663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303330393636333b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036313734223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c53iskc9qd9j9afl8r5eip5gemb3d3os', '125.160.213.87', 1503588160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333538383135333b7265717565737465645f706167657c733a31313a2261646d696e2f73616c6573223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033353730343731223b6c6173745f69707c733a31343a223132352e3136302e3231332e3837223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('cp8v6lfub8pqrp78lui1oueb7saa9g1i', '182.30.68.60', 1501007516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313030373232353b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030393934363933223b6c6173745f69707c733a31333a223132352e3136312e3130322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313030373531333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('d4f2d1vtp1b2j6tdd1f3ir4m9j2oqmdg', '125.160.199.27', 1500450961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303435303830303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343333313536223b6c6173745f69707c733a31343a223132352e3136302e3139392e3237223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303435303935393b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('dgce0pr7i1rjcibepvj6le844uvk8f58', '125.166.125.146', 1501417563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313431373534333b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313635353330223b6c6173745f69707c733a31323a2233362e37382e39312e313736223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313431373534343b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('do1jc1ou3nvsicc2hjbu2hus6hvcuh72', '103.231.202.83', 1500227182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303232373030343b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030303536353735223b6c6173745f69707c733a31353a223132352e3136312e3131342e313031223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('doie14k44t3ocokmvtjqsak8k15kn4en', '180.243.48.252', 1500306468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303330363436383b),
('dvoajtuaafmkgbkm94l06oagf11gjo4p', '116.206.29.98', 1501050452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313035303235323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303439383437223b6c6173745f69707c733a31353a223131342e3132342e3138332e313133223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313035303433383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('e4hicuc23k004h8avicmdrfbmadr924e', '110.136.18.179', 1502281037, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530323238313030363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353032313635353338223b6c6173745f69707c733a31323a2233362e37312e38382e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f93p90f8bjc1qkfhl7q0g93h5aeodf5v', '125.160.199.27', 1500448966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303434383936323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303434383936343b),
('fi9lh8qq5cjnfqn0ff0eo8t499quqoba', '180.243.48.252', 1500306175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303330353838313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030323638373538223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('fsc23ut8fmk39l853evj7vehm4fha8k1', '182.30.113.83', 1500474007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437333935383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343733313332223b6c6173745f69707c733a31323a2233362e37382e38342e313632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('gdidop6cuurubpimjh7ojnrkal1hnkaa', '180.244.57.12', 1503497059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333439373030383b7265717565737465645f706167657c733a353a2261646d696e223b),
('gfv7d0q8th9kg3lslr9srgnlbp56eldp', '64.233.173.60', 1501476970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313437363936363b7265717565737465645f706167657c733a353a2261646d696e223b),
('ggfvh24250sfaqsusu3ncfbrjv1g3ipe', '64.233.173.27', 1501165671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136353532363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313635353131223b6c6173745f69707c733a31323a2233362e37382e39312e313736223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313136353636383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('gsn945a2g8rb42msoqbpddt6cphqcu8v', '125.161.114.101', 1500044776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303034343735333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343236363138343932223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('h597tpqjc6sn3mm9ono1uo1vs06j5uaf', '125.160.199.27', 1500435054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433343735343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303433343335323b),
('h7umjr9oissulvk7949sngv1ph0kdrkq', '125.160.199.27', 1500434275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433343031363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303433343235343b),
('hh4dtkga2m4bksekig73ktd9sidtcn7a', '110.137.171.142', 1501034470, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313033343332353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303033323832223b6c6173745f69707c733a31323a223138322e33302e36382e3630223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ib1e24ec2c6lsququu2hici7sffq46sr', '125.160.213.87', 1503571615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333537313539393b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033333038383732223b6c6173745f69707c733a31353a223131342e3132342e3133352e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530333537313539393b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('idas7c2fibm2knfu4j1jto82l5llamti', '125.161.102.1', 1500995225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303939353031313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343733393731223b6c6173745f69707c733a31333a223138322e33302e3131332e3833223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('idpege870elupg8srm8tsn6cq02ol096', '36.78.91.176', 1501165613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136353630373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313333323537223b6c6173745f69707c733a31343a223130332e3233312e3230322e3833223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313136353630373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('ihkjf18olf47igabv3piudugpbg5jnau', '116.206.29.98', 1501051298, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313035313239373b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303439383437223b6c6173745f69707c733a31353a223131342e3132342e3138332e313133223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313035303433383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('itc7e3e2pk49o9731n0vqq6plnchmsvm', '180.243.48.252', 1500308118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303330373938343b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036313734223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('j9rb3v01l6vrnskq7mfchbin32qj8l2l', '182.30.113.83', 1500475502, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437353530323b7265717565737465645f706167657c733a353a2261646d696e223b),
('jtgtct241b0o9o0t2c7vmo31pq7tijt9', '180.243.48.252', 1500310148, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303331303134383b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036313734223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('k098i99eb2gda3dlktbc9utaotrln4sc', '180.244.62.140', 1503913814, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333931333634313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033393130353134223b6c6173745f69707c733a31343a223130332e34372e3133352e313438223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('kq833u288nt7i82hbic0jp2hn1l8bf6k', '103.231.202.83', 1500226968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303232363639373b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030303536353735223b6c6173745f69707c733a31353a223132352e3136312e3131342e313031223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('kqprraur09l6h8np5b0956rn9jn6tncu', '202.43.165.22', 1501062055, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313036323035323b7265717565737465645f706167657c733a353a2261646d696e223b),
('l12jin4vkftvb4g6qtc2q8g08gtuqlup', '36.78.84.162', 1500476756, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437363639323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343733303831223b6c6173745f69707c733a31323a2233362e37382e38342e313632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('l89rfthkpd9bstfe5kgtk68v4vqjo7hp', '36.78.84.162', 1500472427, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437323138333b7265717565737465645f706167657c733a353a2261646d696e223b),
('lno10oskpf44lpi8cqgh1ck8josjmtcd', '64.233.173.29', 1501214966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313231343936303b7265717565737465645f706167657c733a353a2261646d696e223b),
('mad5m9c0igqrsbu7bm9o2qusbrem9oho', '182.30.113.83', 1500475304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437353330343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343733313332223b6c6173745f69707c733a31323a2233362e37382e38342e313632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303437343538333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('mjofri013pobr7rkg1gnnrm997h7kg27', '64.233.173.29', 1501174770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313137343630353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313635353131223b6c6173745f69707c733a31323a2233362e37382e39312e313736223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313137343736353b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('mnkcngnjllr217dg2akgobq70urjtnpr', '114.124.135.225', 1503309592, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333330383837323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353032323831303138223b6c6173745f69707c733a31343a223131302e3133362e31382e313739223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530333330393539323b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('mo2civkfvbauvb50h084a4nmepq852hm', '36.78.84.162', 1500473136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437333132353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343733303831223b6c6173745f69707c733a31323a2233362e37382e38342e313632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('moimodt633lqec85qnk423i2oedpj06a', '64.233.173.28', 1501206845, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313230363833393b7265717565737465645f706167657c733a353a2261646d696e223b),
('mtos6i4hn366iav45k1ngf93qseegreb', '36.78.91.176', 1501133985, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313133333933323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303836333030223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22676377324f526657555143493958746979306554223b),
('n9qgeg50bt6dqgp48q80rmqp83j5btqu', '36.78.84.162', 1500473480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437333437363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343733303831223b6c6173745f69707c733a31323a2233362e37382e38342e313632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('nssqc4jk8go454ah2p7t9qc4f3g8qllr', '103.231.202.83', 1500228876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303232383637313b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030303536353735223b6c6173745f69707c733a31353a223132352e3136312e3131342e313031223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a32393a2253657474696e6773207375636365737366756c6c792075706461746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('nuahsmjs863dnjorj7cstk9bh7c9d6ol', '180.243.48.252', 1500309571, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303330393237393b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036313734223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('o1aicpr4rjrk7d4rm919v50iro2i3je7', '103.231.202.83', 1500229253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303232393133333b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030303536353735223b6c6173745f69707c733a31353a223132352e3136312e3131342e313031223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303232393232383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223132332e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372030313a31393a3235223b),
('o6ptrsgd7g8j0j930r6pr4vb16434k31', '182.30.113.83', 1500475503, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437353530333b),
('oe7qv49kc136e5mvr0una2s4i3t1brl8', '180.244.57.12', 1503498300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333439383239303b7265717565737465645f706167657c733a353a2261646d696e223b),
('oh1amf2d3apupo86fdh1lccspmcaekq2', '180.243.48.252', 1500309169, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303330383933343b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036313734223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('olfcoual8u7ibgprqms75qmepq28o3f3', '182.30.113.83', 1500474640, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437343335313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343733313332223b6c6173745f69707c733a31323a2233362e37382e38342e313632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303437343538333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('or5vomtherau0js0ec900j75cses2m6t', '180.244.62.140', 1503914004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333931333936343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033393130353134223b6c6173745f69707c733a31343a223130332e34372e3133352e313438223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('pam5ocmbqkdjog9p76rffa43a8k7efb8', '125.160.199.27', 1500435668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433353337333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303433343335323b),
('pu7mo1souivhq1llth80jme777kl702r', '125.160.199.27', 1500436170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433363137303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303433343335323b),
('q7r5bn7cul3jburk3gunfr2pcrt5aol6', '180.243.48.252', 1500307815, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303330373636363b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036313734223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('q9higffl8u73qtlrmjreg46va2t1ltrj', '180.243.48.252', 1500311520, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303331313334383b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036313734223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303331303839323b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('qi6tiolbvcf48q0fm0snf1qbnb8jtmqo', '182.30.68.60', 1501007200, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313030363930323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030393934363933223b6c6173745f69707c733a31333a223132352e3136312e3130322e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313030373036303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('qucpvteaa1p3ob41s4dk7cs0kk6c1l0d', '125.166.125.146', 1501422116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313432323131363b7265717565737465645f706167657c733a31393a2261646d696e2f7075726368617365732f616464223b),
('rasbmvko9v62rm6ifcp7qoobqsd8trqq', '110.137.171.142', 1501090039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313039303032303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303634383731223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313038393835333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('rbsnj07fgf5a9ovbb82v3e3vs9e00thb', '36.78.91.176', 1501164940, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136343634373b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313634333138223b6c6173745f69707c733a31323a2233362e37382e39312e313736223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313136343933383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('rffjqnraopnijapfoei62nfg78v287di', '125.160.199.27', 1500433431, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433333133393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('rjueagmds2stj9hhege45pla40krnqf3', '182.30.113.83', 1500475437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437353330343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343733313332223b6c6173745f69707c733a31323a2233362e37382e38342e313632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303437343538333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('rmk78crqamkbd0im3otcemttfg25tgvn', '110.137.171.142', 1501064884, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313036343837303b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303439393231223b6c6173745f69707c733a31333a223131362e3230362e32392e3938223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313036343837313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('s0912atki3hcejiltunsh8p39cusp6tn', '45.64.1.80', 1500436955, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433363935353b6572726f727c733a3138323a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f646176656c796e73747564696f2e636f6d2f6170702f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f7064662f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('s351dmccddcbaauktujj8u760mf3mtfs', '45.64.1.80', 1500436955, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433363935353b),
('sf6jtfb09uki7t5ni89mau6qc7qdaepa', '125.166.125.146', 1501422138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313432323132303b7265717565737465645f706167657c733a353a2261646d696e223b),
('sj3eir02pg0tef9ujgml59ej1it84fkq', '116.206.29.98', 1501051598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313035313239363b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303439383437223b6c6173745f69707c733a31353a223131342e3132342e3138332e313133223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313035313330343b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('t1bdlnalcq017v2gebdt9bjvf2arshdj', '180.243.48.252', 1500269371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303236393037303b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030323638373331223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303236393334343b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('t3m5ut606ee3ktf9d2ikr8oekdd56s27', '36.78.91.176', 1501165143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136343935303b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313634333138223b6c6173745f69707c733a31323a2233362e37382e39312e313736223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313136353134323b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('t3qlpgb3flt6vtl8rn88ruouh5lgq48v', '36.78.91.176', 1501164493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136343330303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313632343936223b6c6173745f69707c733a31323a2233362e37382e39312e313736223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22425572506f4132674d524a6e3349747745447571223b6c6173745f61637469766974797c693a313530313136343439313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('t62d1iib3p7m5qmmqk3md0a5c7dn04ea', '36.78.91.176', 1501169357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313136393334373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031313333323537223b6c6173745f69707c733a31343a223130332e3233312e3230322e3833223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313136393335353b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('t9n02nidqambh82vdlh1s8ehmligspk7', '125.160.199.27', 1500444054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303434333937333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303433343335323b),
('teo8stb3eijvikdur982efnj9hh215t8', '180.243.48.252', 1500269739, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303236393536363b),
('tusiu3tlq2elfprtd55mr1tejkk1qpi6', '116.206.29.98', 1501050912, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313035303738323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303439383437223b6c6173745f69707c733a31353a223131342e3132342e3138332e313133223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313035303433383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('u42dj5vfq9912d6nmoko22aa4odo9tqb', '64.233.173.27', 1500475827, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437353831393b7265717565737465645f706167657c733a353a2261646d696e223b),
('u5be160au9j6e0qurlmt3vvs0msq3hfs', '103.231.202.83', 1501140682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313134303636333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303836333030223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22676377324f526657555143493958746979306554223b),
('u6n181uprueuah9ovv3kl9c9a4urnube', '110.137.171.142', 1501089875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313038393537363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303634383731223b6c6173745f69707c733a31353a223131302e3133372e3137312e313432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530313038393835333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('u8hi8ofsfaqm2k8utr85nsb7ndfuaol7', '125.160.213.87', 1503570493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333537303437303b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033333038383732223b6c6173745f69707c733a31353a223131342e3132342e3133352e323235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530333537303437313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b6572726f727c733a3134383a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f646176656c796e73747564696f2e636f6d2f6170702f7468656d65732f64656661756c742f61646d696e2f6173736574732f696d616765732f69636f6e2e706e67223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ug1iqfr5iu8l3o0157der3u6fn3kll40', '182.30.113.83', 1500475502, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303437353530323b),
('uvgi0feat7i2pk9365iql3d9jaqljib7', '125.161.102.1', 1500996785, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303939363635393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030343733393731223b6c6173745f69707c733a31333a223138322e33302e3131332e3833223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('vbn6mti1dl301gs6np1rh3eqiopino73', '125.160.199.27', 1500444828, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303434343734303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353030333036383238223b6c6173745f69707c733a31343a223138302e3234332e34382e323532223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530303433343335323b),
('vbu19g67tc7bvjpsgcpghth8pm10idhi', '116.206.29.98', 1501050242, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530313034393932313b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353031303439383437223b6c6173745f69707c733a31353a223131342e3132342e3138332e313133223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('vl3c5mbprmpikgeon1gf8v1n7sf29lt8', '45.64.1.80', 1500436956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303433363935363b7265717565737465645f706167657c733a353a2261646d696e223b),
('bdsu0mc02d8jmhud8bvdu55bbpt4q1fq', '36.71.50.125', 1504067397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343036373234343b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033393133373835223b6c6173745f69707c733a31343a223138302e3234342e36322e313430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('qq50rhc7um642o8fv9rrq1r1chjjc017', '36.71.50.125', 1504067714, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343036373730323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033393133373835223b6c6173745f69707c733a31343a223138302e3234342e36322e313430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('rvftpel3oq7unaitlcg1296dtqa3hjam', '36.71.50.125', 1504068898, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343036383637303b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033393133373835223b6c6173745f69707c733a31343a223138302e3234342e36322e313430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343036383738343b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('8g41lcj1dh8kq44v3art0b0ronq6hig5', '36.71.50.125', 1504069493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343036393234363b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033393133373835223b6c6173745f69707c733a31343a223138302e3234342e36322e313430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343036383738343b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('2jvlksrlvimkhduk448dc4nip9mm3g56', '117.102.71.162', 1504069616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343036393431313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034303637323434223b6c6173745f69707c733a31323a2233362e37312e35302e313235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('dk0telnv7nlqt04g82sapjhf5e802grs', '36.71.50.125', 1504069831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343036393534393b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033393133373835223b6c6173745f69707c733a31343a223138302e3234342e36322e313430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343036393832383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('idua5t63ctp85fvmpvbgdioqrkbl85dn', '117.102.71.162', 1504069874, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343036393739323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034303637323434223b6c6173745f69707c733a31323a2233362e37312e35302e313235223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343036393837333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('2f2e1lfgacq8bhobaocqvq52i6697541', '36.71.50.125', 1504070212, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343036393931363b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033393133373835223b6c6173745f69707c733a31343a223138302e3234342e36322e313430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343036393832383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('eb9o9op3ifk7e8njj1tri7qe96h7chvh', '36.71.50.125', 1504071686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343037313635353b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033393133373835223b6c6173745f69707c733a31343a223138302e3234342e36322e313430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343037313636313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('3c8656048houlmjjfb2bo52cb757r5tg', '36.71.50.125', 1504072096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343037323034363b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033393133373835223b6c6173745f69707c733a31343a223138302e3234342e36322e313430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343037313636313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('9b9ipdm4086t0hk2pu8o986o78vkun40', '36.71.50.125', 1504072723, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343037323539303b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033393133373835223b6c6173745f69707c733a31343a223138302e3234342e36322e313430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343037323539303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('d62sikfsj9igcjuo9q4haoodi6naa2is', '36.71.50.125', 1504073099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343037333039323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353033393133373835223b6c6173745f69707c733a31343a223138302e3234342e36322e313430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343037333039323b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('dhoip87aj5g74hn67dk1n6nidfot75od', '52.71.155.178', 1504075614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343037353631343b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('tho9efku17ntk33r9fp95kn0lc7abe0g', '52.71.155.178', 1504075614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343037353631343b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('4laic26bli7pklqa2p2vdbgrtu6c94bl', '52.71.155.178', 1504075614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343037353631343b7265717565737465645f706167657c733a31353a2261646d696e2f707572636861736573223b),
('bb4rja1sbf6tcihcue7q1saqe6pvlnjk', '52.71.155.178', 1504075614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343037353631343b),
('nnjn2qimsbp9e9vh29qec8ebvsvbcls0', '52.71.155.178', 1504075615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343037353631353b),
('ktrji7pvalt8or6kpm4hp4pb5seejt8l', '52.71.155.178', 1504075616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343037353631363b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b),
('ugsvd1f4ee1154o2i1fa516pq52b96on', '52.71.155.178', 1504075616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343037353631363b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b),
('ef05df1pf1auunu9sd19md47mb7lbcut', '112.215.171.28', 1504111135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343131313133353b7265717565737465645f706167657c733a353a2261646d696e223b),
('3lqd26d6u20de77k8flt3g8b69brmvre', '112.215.171.28', 1504111384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343131313133353b7265717565737465645f706167657c733a353a2261646d696e223b),
('r9pguicpfki9tkhpdc8l1l2at9nboc9u', '112.215.171.28', 1504111981, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343131313937393b7265717565737465645f706167657c733a353a2261646d696e223b),
('fao3rit06s4enf7qbei4elrqib4v1go5', '61.94.145.253', 1504176796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343137363539353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034303639353530223b6c6173745f69707c733a31343a223131372e3130322e37312e313632223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('tkos4uk8gealg10mbrfpsdpc8vlrrmqo', '117.102.71.162', 1504177532, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343137373531373b7265717565737465645f706167657c733a353a2261646d696e223b),
('sl9aemfb8kdbn7a7nat4k87ijvmieaiq', '117.102.71.162', 1504179294, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343137393239313b7265717565737465645f706167657c733a353a2261646d696e223b),
('prmlopnoi4qehckd0rr2j4mtnpgm90jh', '117.102.71.162', 1504179654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343137393635343b),
('4kggab4in1ggbf5vs8djdud2ugmjjc8f', '61.94.145.253', 1504179696, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343137393635343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313736373932223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('56lk8qpt69mflabgo82ave78tbpdj45e', '61.94.145.253', 1504180262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343137393936323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313736373932223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('kcaeqmjhb7k4f0ddmpvkdigc8jdbenfc', '61.94.145.253', 1504180263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343138303236333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313736373932223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('tsnaujfdh32hg0cs5vn96af9rbu5dc1k', '117.102.71.162', 1504180263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343138303236333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313736373932223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c733a3133383a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f646176656c796e73747564696f2e636f6d2f6170702f61646d696e2f6a732f6a71756572792e63616c63756c61746f722e6d696e2e6a73223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ckl298l7m54jrfli8tl9ukimk9egh2jt', '61.94.145.253', 1504180264, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343138303236333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313736373932223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('qphkocj6sfdhtbslu1lm6k5c4radn4uc', '117.102.71.162', 1504180264, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343138303236333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313736373932223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c733a3133383a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f646176656c796e73747564696f2e636f6d2f6170702f61646d696e2f6a732f706572666563742d7363726f6c6c6261722e6d696e2e6a73223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7k4unp0vpk1dh2d0eio62mlsdtbp77u9', '117.102.71.162', 1504180263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343138303236333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313736373932223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('h73pshp3v5i3hi0g39a4jb56t21djg19', '117.102.71.162', 1504180449, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343138303236333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313736373932223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fv4sod1tr9s1o5m84kfp5mnc4so1i7f6', '52.71.155.178', 1504186572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343138363537303b),
('lhat2jpbs48ot378nt42t04696eganld', '52.71.155.178', 1504186570, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343138363537303b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('qbrvgi9aijbuder775g3nnkd2j8apot3', '52.71.155.178', 1504186571, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343138363537303b7265717565737465645f706167657c733a353a2261646d696e223b),
('o5p4ebree783ucjm82ul99a58sfvpeit', '52.71.155.178', 1504186575, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343138363537353b7265717565737465645f706167657c733a31303a2261646d696e2f636f6465223b),
('o9vqbma31ngja0v1r8ku4pk2i8c7a35p', '52.71.155.178', 1504186576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343138363537353b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('5mb6b2mvakf794ql6k8talvnu7qihfs6', '112.215.236.181', 1504233562, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233333438363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7q3keis74rf3l93n9eavqbavfo3jece5', '112.215.236.181', 1504234277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233333937373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9faif3qsbdo4pkrts7032s83hdce68km', '112.215.236.181', 1504234279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233343237393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('vhfl7pj09iiutcdthe6q9mu9dkukopb9', '112.215.236.181', 1504234320, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233343237393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6cgkvlu0fcicsuijpc22val9aj1pkcqs', '112.215.236.181', 1504234834, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233343738343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9lndb8gucmdl8vlfsl47icjpieqnfc4e', '112.215.236.181', 1504235551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233353237323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4jhk27475hn0t1vbbrl87djemgrae3g1', '112.215.236.181', 1504235941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233353730353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('eftije8pq0cgro74iemtum9l4b9p5i3i', '112.215.171.38', 1504236340, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233363035373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('c2nsl1i93o9l1c9f49if47ip3be4g5bs', '112.215.171.38', 1504236685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233363431363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('hlsof4pk1kkiqf710893mjjb9ku9jdf8', '112.215.171.38', 1504237115, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233363835323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2c5f0phn00mpho9846g0jjjitim0m58u', '52.71.155.178', 1504237319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233373331393b7265717565737465645f706167657c733a353a2261646d696e223b),
('tor3iae7pvq6i3va7cc0ha4jt71silpn', '52.71.155.178', 1504237319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233373331393b),
('bvon2up6vdigu1jnp4154luuj8ag7mki', '52.71.155.178', 1504237319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233373331393b7265717565737465645f706167657c733a31303a2261646d696e2f636f6465223b),
('u62a710tqi2k9hslphopf4f1sc4v9mp1', '52.71.155.178', 1504237319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233373331393b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('l0uighqkmk7f37ccqp94vjc4mu9vcuko', '52.71.155.178', 1504237319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233373331393b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('mj5luvd3oteb1di4eou1msa8ep43574m', '52.71.155.178', 1504237320, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233373332303b),
('g7o7pm4f1ujsgkknfo9dg6tsu8c53mr0', '52.71.155.178', 1504237320, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233373332303b),
('rcn0cep7kaaq5rqhhfs2sehis4nnrji8', '112.215.171.38', 1504237706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233373431383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3nmgoglseuv7omjd0qbvglfqsaoh1k2t', '112.215.171.38', 1504237767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233373736373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('uqvpthk1na96rmh10catigkt68bhkvnm', '112.215.171.38', 1504238087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233373834343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7p3k7vlihe7lel26bba63j6dof3sqvhn', '114.124.148.164', 1504238502, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233383230323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8lr4qmeb8m85omsamhjn2k89463kt113', '114.124.139.133', 1504238808, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233383533353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ntlpjcmb6kq5qjkh1vq2hlb772ds46m0', '114.124.164.21', 1504239156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233383837323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1tir6rotank66ispsbpfm89k5oihgv42', '114.124.144.21', 1504239384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233393234333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034313739363830223b6c6173745f69707c733a31333a2236312e39342e3134352e323533223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('h720pgrr6o9mqi44nr354kqv3jbdc8g4', '52.71.155.178', 1504239936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233393933363b7265717565737465645f706167657c733a353a2261646d696e223b),
('saprro2l34mjffnaae93b9mt0vsqcm0p', '52.71.155.178', 1504239937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233393933373b),
('571uko5hqp3i8lark63p25d73kb3nt27', '52.71.155.178', 1504239937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343233393933373b7265717565737465645f706167657c733a31383a2261646d696e2f636f64652f676574636f6465223b),
('qcgp88p72v5kbrg3df0vjpvil31sppp0', '114.124.139.4', 1504247559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343234373535363b7265717565737465645f706167657c733a353a2261646d696e223b),
('qp8r011nbj1b029j53efm9s1s22qksb3', '114.124.176.20', 1504248694, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343234383437383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('cftcdvdvssp6fq7hhd81k3b3qq60d29u', '114.124.133.52', 1504249137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343234383838353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('pao5n5d3omgnu5c0sohgqqmfs01jj7pk', '114.124.171.36', 1504249578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343234393239323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c30e69nb4jq5qpq2hv15gd5283il5l4m', '114.124.176.20', 1504250304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235303030363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('hma26r2um61thdu29pdrlh0dl2jc84ri', '114.124.173.157', 1504250311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235303330373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('30vjq1ov3fu6v6m30ra7kvguatp9ohs8', '114.124.139.133', 1504250862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235303633353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('t1ej4kl4stmkb8na7ejvbvbqdi3o60ue', '114.124.176.20', 1504251262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235313030373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('pp8fk06o1pfugepulpgujeo7sq9qe4sg', '114.124.176.20', 1504251453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235313435333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4gc0n1p5g20c8nf8s7cisoorms4teijg', '114.124.149.132', 1504251454, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235313435333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8d2me1ftra3njd2j5i0svh57cnkejp5s', '114.124.167.29', 1504251712, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235313435353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b9nvejggjl8ceqq782it9l9614alckrt', '114.124.149.132', 1504252072, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235313830303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('aff8ugtk001mgm06lsdbi749hfre6dk4', '114.124.176.20', 1504252847, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235323537343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('abgop6j4vr54k2t4ognf626pb6u98lcs', '114.124.176.20', 1504253263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235323936373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('tt3csdakrrh4pmck4u8f1rbrmnmpa8id', '114.124.176.20', 1504253273, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235333236383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c733a3134383a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f646176656c796e73747564696f2e636f6d2f6170702f7468656d65732f64656661756c742f61646d696e2f6173736574732f696d616765732f69636f6e2e706e67223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('ejb1v5tvts8f3crnr66u29977vr3pb5t', '114.124.149.132', 1504253506, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235333237323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('g9a1naffggj020tjrokv25dvq6j313kg', '114.124.173.157', 1504253921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235333632323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('gdeaadq5pdbcph2sf8gigf2d8gtnc5bg', '114.124.170.63', 1504254177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235333932363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a3knbatsji8bpvpb2eb1v13uv4ut7t91', '114.124.149.132', 1504254690, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235343433363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('eh0ugqk6n5g0eca5fedomfiru91egbio', '114.124.149.132', 1504255051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235343737323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('hpmmjcmoheft8as0rdjjaf431n8c8vcd', '114.124.165.132', 1504255263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235353233363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343235353235373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('rjtej3fuo1stfgds0geoe02e2s58qse9', '114.124.176.20', 1504255979, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235353732343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343235353235373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('skvc0fn5buu3pt0lkjq6n0lundjocunt', '114.124.132.165', 1504256304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235363035393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343235363239393b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('m8vdcvt68se0on4rkkgemadtj5jros3b', '114.124.170.37', 1504257101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235363833323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343235373039363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('1ra25635d22omjec8203508l32a6j472', '114.124.173.157', 1504257447, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235373137353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343235373434323b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('blr66li1ufbr86q7ojgrr6hehag2nhqf', '114.124.149.132', 1504257576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235373537323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343235373537323b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('7o00k1pl3u4gi4268gehtc9rs9lr200u', '114.124.170.63', 1504258794, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235383530343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343235383739323b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('c3u65j4roblk73jt39pcitfpav8hes37', '114.124.176.20', 1504259132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235383835393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323333353231223b6c6173745f69707c733a31353a223131322e3231352e3233362e313831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343235393132373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('4255tnabduluqvv6sv209qeslt9gt9s0', '52.71.155.178', 1504258901, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235383930313b7265717565737465645f706167657c733a353a2261646d696e223b),
('qh2b7gj7uasb1a4fp1tb0757u1m0acrs', '52.71.155.178', 1504258902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235383930323b),
('f5a2raijfoh9oopmrg6vbhil5r6q1h17', '52.71.155.178', 1504258952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235383935323b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b),
('flqr1lu2cr7l1s1lqo1spvsi9dnla2o2', '52.71.155.178', 1504259109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235393130393b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b),
('fh9v946nph6u33968nrcei1pbg3dt9uj', '52.71.155.178', 1504259133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235393133333b),
('vrq6d1q3vva1qifm349d01t7kcnggcd2', '61.5.77.207', 1504276364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343237363231333b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323438353135223b6c6173745f69707c733a31353a223131342e3132342e3134392e313332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343237363335393b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('u12k6bpe8v64qer9p1ro717aq79d5ni9', '52.71.155.178', 1504259132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343235393133323b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('okqckcqbignfs7j3ui05m843dt25nlps', '61.5.77.207', 1504283921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343238333739383b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323736323134223b6c6173745f69707c733a31313a2236312e352e37372e323037223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343238333932313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('samtn1no7o3mirglbflo4lq2io8attde', '114.124.138.5', 1504306697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343330363433363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323833373938223b6c6173745f69707c733a31313a2236312e352e37372e323037223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343330363636313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('jm8ca0hjgc0imvubnd1mn9h39ap26ent', '114.124.181.148', 1504307258, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343330373035333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323833373938223b6c6173745f69707c733a31313a2236312e352e37372e323037223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343330373235353b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('vp34nruupbgv0chv7sk91pu9cle0ib8t', '114.124.181.148', 1504307856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343330373539343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323833373938223b6c6173745f69707c733a31313a2236312e352e37372e323037223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343330373835333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('m4pdlo7kq9hajm5l6qtd11vp1rd34est', '114.124.175.180', 1504308216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343330373934393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323833373938223b6c6173745f69707c733a31313a2236312e352e37372e323037223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343330383231343b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('a8cl5bhar0msk1tu3k6c5h2p9uimejtl', '114.124.175.180', 1504308550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343330383330373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323833373938223b6c6173745f69707c733a31313a2236312e352e37372e323037223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343330383534373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('dnha1ohv9an456de9l6q7b6id9duvm06', '114.124.144.158', 1504308908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343330383736383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034323833373938223b6c6173745f69707c733a31313a2236312e352e37372e323037223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343330383930363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('sq4mn557qpbc3qr9p18dj7kn0j8tgqjj', '52.71.155.178', 1504312772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343331323737323b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('u53bnc3smqecq5f9jragacc7c5q3h3is', '52.71.155.178', 1504312773, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343331323737333b),
('0s8fgb0uovjbpn1m876clgrrpshvmrsn', '125.160.192.234', 1504318784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343331383438343b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034333036353030223b6c6173745f69707c733a31353a223131342e3132342e3134342e313538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343331383737363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('2tg39jqq6ogqg0inuq0lqc28p3kets0f', '125.160.192.234', 1504318859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343331383833353b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034333036353030223b6c6173745f69707c733a31353a223131342e3132342e3134342e313538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343331383737363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('6qr3nasorchpq12cj5dd3lekvtuk3p44', '125.160.192.234', 1504319350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343331393139323b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034333036353030223b6c6173745f69707c733a31353a223131342e3132342e3134342e313538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343331383737363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('e3q3lcr6aucmrh05550ebg9gc7ebqf7j', '125.160.192.234', 1504319865, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343331393833383b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034333036353030223b6c6173745f69707c733a31353a223131342e3132342e3134342e313538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343331383737363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('l4r2pdmv03v9qdefd2987vfv8cfqtvnp', '125.160.192.234', 1504320346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343332303332303b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034333036353030223b6c6173745f69707c733a31353a223131342e3132342e3134342e313538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530343332303334323b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('jkt3mf5s4dmbbcpnl0d2ni7r9bpvucng', '125.160.192.234', 1504352394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343335323236383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034333138343834223b6c6173745f69707c733a31353a223132352e3136302e3139322e323334223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('rjrgt2e5j4db7l91521t7519ovph3bds', '125.160.192.234', 1504352497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343335323439373b),
('c4gucml84a1kkoc1kefflcrs5ifukotk', '125.160.192.234', 1504352497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343335323439373b7265717565737465645f706167657c733a353a2261646d696e223b),
('a1avkbkb28h379v245t04b1velslg4br', '125.160.192.234', 1504352497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343335323439373b),
('7p65vbafk0i00qa901d9dj14nen01klb', '182.253.163.6', 1504359220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343335393230393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034333532333839223b6c6173745f69707c733a31353a223132352e3136302e3139322e323334223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('u6emrfkptkvuh42ce2n9t2t3ulscjm2k', '180.245.193.119', 1504364517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343336343332363b7265717565737465645f706167657c733a353a2261646d696e223b),
('bt69rd2rn9pj7h5k2in3ilqa84u1vfth', '61.5.45.249', 1505239635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353233393632373b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353034333539323230223b6c6173745f69707c733a31333a223138322e3235332e3136332e36223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('rk5b7acgfv19oeui760k6on5qbj5c1sn', '182.253.163.5', 1505278271, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353237383236313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('se2bdf1mudkudn313fo8hugmblvnjpq9', '182.253.163.5', 1505279331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353237393235313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('lbpdlbaqgaa5ifpcgsge7agcb75uqgu9', '182.253.163.5', 1505279735, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353237393630383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('evsubg0jvtdpb0r679j1cfab910lss2o', '182.253.163.5', 1505280178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353237393933303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('if5dvf8s76ko52l22efujpta05kll75n', '182.253.163.5', 1505280665, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353238303432343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6gult82r1jj5rpkakoagce9rsah7tcol', '182.253.163.5', 1505281123, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353238303832353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b7hke9mop7ni5pvenstkmih9l2ccvs9m', '182.253.163.5', 1505281457, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353238313435353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4nhufu7o32jeog80n0kpth4ebnois7he', '182.253.163.5', 1505281461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353238313435373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('jonlfj5cg22ein08h15c3odgak3lhm4n', '182.253.163.5', 1505281461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353238313436313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('0on7uo4fvmum1i0bjojlrmgfb9eac836', '182.253.163.5', 1505281747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353238313436323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7q7rhe7f94e0a1e7no5cn1idqs1npp1p', '182.253.163.5', 1505281901, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353238313930313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('72jbvmtpvj6g1qctsgu1spiu9443ls4f', '182.253.163.3', 1505282243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353238323233303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('jc9jltajua4mopkvlki9lc6btglqluhd', '182.253.163.3', 1505282970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353238323731323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5e6chu7b91ev2d85ovf720kq4kmk4uo5', '182.253.163.3', 1505283311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353238333130303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('lqnbo3duurvfbjnn3c0qdem3qs0v5ovt', '182.253.163.3', 1505283479, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353238333431333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323339363237223b6c6173745f69707c733a31313a2236312e352e34352e323439223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('vts589pcqgpvr3tcdh7cjihsgr92tgbh', '36.78.71.1', 1505412484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353431323330333b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035323738323731223b6c6173745f69707c733a31333a223138322e3235332e3136332e35223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2roi15624c47ublqj969rgunnj3fpgll', '125.161.103.247', 1505448989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353434383933313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035343132333033223b6c6173745f69707c733a31303a2233362e37382e37312e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('pvrplf48fq9utdra568jd88363oqhev6', '125.161.103.247', 1505448930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353434383933303b),
('3k8hejid9b8aj8ss91krmcl3nrcfiecu', '125.161.115.81', 1505702593, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353730323539333b),
('h5v3m1gtnu7deejag5bhjhsbdvpna013', '125.161.115.81', 1505702619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353730323539333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035343438393331223b6c6173745f69707c733a31353a223132352e3136312e3130332e323437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('70ptu6mk5ta85knhmr95qt3vrt8a9o4c', '125.161.115.81', 1505705886, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353730353739383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373032353934223b6c6173745f69707c733a31343a223132352e3136312e3131352e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('o9qe5b78niejgj01vnt7u16p7t4su3f2', '125.161.115.81', 1505706193, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353730363137363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373032353934223b6c6173745f69707c733a31343a223132352e3136312e3131352e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3dhhba8h55iq4fcv6030oukda1qh5dtg', '125.161.115.81', 1505707185, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353730373135383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373035383639223b6c6173745f69707c733a31343a223132352e3136312e3131352e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('igoocsjai0mqn6kql8u86pmmknu9135t', '125.161.115.81', 1505709804, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353730393737343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373035383639223b6c6173745f69707c733a31343a223132352e3136312e3131352e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f2vhunap3ofdaqlb4t6gt3t7b0vs5b2h', '125.161.115.81', 1505710991, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353731303935363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373035383639223b6c6173745f69707c733a31343a223132352e3136312e3131352e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('lbc03c23rdk52p595jp0p39plrqagdmq', '103.217.173.2', 1505719171, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353731393135333b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373037313733223b6c6173745f69707c733a31343a223132352e3136312e3131352e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('vdpa3tn85081qef7e414pknerflh76bs', '103.217.173.2', 1505720240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353732303234303b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373037313733223b6c6173745f69707c733a31343a223132352e3136312e3131352e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('h6sk4d02jeuhq0l8gbmsiq0qcqnr0q7s', '103.217.173.2', 1505720372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353732303234313b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373037313733223b6c6173745f69707c733a31343a223132352e3136312e3131352e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530353732303334343b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('aet0it3i5h65crnpb1kk68b3072ocpbj', '103.217.173.2', 1505720754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353732303630303b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373037313733223b6c6173745f69707c733a31343a223132352e3136312e3131352e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530353732303630313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('hupffd8ac26it783rek24ddrk4grslbi', '103.217.173.2', 1505721276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353732313139303b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373037313733223b6c6173745f69707c733a31343a223132352e3136312e3131352e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530353732303630313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('rnsa158o62alnb4ktic2qdmiji28bfeu', '103.217.173.2', 1505724654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353732343539303b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373037313733223b6c6173745f69707c733a31343a223132352e3136312e3131352e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530353732303630313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('1o58r166mqb3fku8n3p5nr8hou31k8qj', '180.244.51.31', 1505759053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353735393032333b7265717565737465645f706167657c733a31353a2261646d696e2f73616c65732f616464223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373139313533223b6c6173745f69707c733a31333a223130332e3231372e3137332e32223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('qhq3rian5s46i435hpp3uh8k3m82ume4', '139.194.198.69', 1505798584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353739383530393b7265717565737465645f706167657c733a353a2261646d696e223b),
('26ku68c7b6cdt4ds0ms3633sso4p85hs', '180.244.74.201', 1506349865, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363334393834373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373539303234223b6c6173745f69707c733a31333a223138302e3234342e35312e3331223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('std2mktmrncu8vojhsj8hm35u8si1bbq', '180.244.74.201', 1506350540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363335303533353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373539303234223b6c6173745f69707c733a31333a223138302e3234342e35312e3331223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('81nmd54r367turk9a5o57l4tul8eoimk', '180.244.74.201', 1506354273, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363335343236353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035373539303234223b6c6173745f69707c733a31333a223138302e3234342e35312e3331223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('r3dbb4unireafce3v9o27f0bi7v12egq', '180.244.62.246', 1506432293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363433323239333b),
('t1130kodtrokfdgg2psptmdr2fknu4tb', '180.244.62.246', 1506432433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363433323239333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036333439383437223b6c6173745f69707c733a31343a223138302e3234342e37342e323031223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('v7kjtqq3clfj13nsjrji0k232k6vt30t', '61.5.27.155', 1506475899, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363437353832363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343332333238223b6c6173745f69707c733a31343a223138302e3234342e36322e323436223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363437353839313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('af8jak8vduqljetjaf99uesl9nnvcbk3', '61.5.27.155', 1506478045, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363437383033353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343332333238223b6c6173745f69707c733a31343a223138302e3234342e36322e323436223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363437353839313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('us1skppmg9q6cher63cklp5mh0cje6cf', '202.150.130.194', 1506479001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363437383738353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343735383237223b6c6173745f69707c733a31313a2236312e352e32372e313535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fk42084bpv3cpt9oil46s92fe2mdci5d', '202.150.130.194', 1506479091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363437393039313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343735383237223b6c6173745f69707c733a31313a2236312e352e32372e313535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c733a3131393a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f7369636865722e636f2e69642f6170702f61646d696e2f646973636f756e74732f616464223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('481qfce2ksisd2isv8e8m4s6m1kavsjl', '202.150.130.194', 1506479249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363437393039373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343735383237223b6c6173745f69707c733a31313a2236312e352e32372e313535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363437393233343b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('jbl6hggfegtpqpjkfonp5bks9l4v8q1r', '61.5.27.155', 1506482949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363437393130323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343332333238223b6c6173745f69707c733a31343a223138302e3234342e36322e323436223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363437353839313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('euikc5thm62713fjijllme3gbregtte1', '125.161.82.54', 1506480683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363438303637363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343735383237223b6c6173745f69707c733a31313a2236312e352e32372e313535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363438303637373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('77t894e7dalse3ffs7dij3c56cs9cbrv', '125.161.82.54', 1506481846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363438313534363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343735383237223b6c6173745f69707c733a31313a2236312e352e32372e313535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363438303637373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('30gethijk94i2kcqluq9udjbqk5v8qat', '125.161.82.54', 1506483117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363438323833383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343735383237223b6c6173745f69707c733a31313a2236312e352e32372e313535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363438303637373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('iom5sa82r19h75gn1uqvt4l02o03h5r4', '125.161.82.54', 1506483151, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363438333134303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343735383237223b6c6173745f69707c733a31313a2236312e352e32372e313535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363438303637373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('sq3d2m03e7rdtemiod2p98ckvpa4a2be', '125.161.82.54', 1506484087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363438333834333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343735383237223b6c6173745f69707c733a31313a2236312e352e32372e313535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363438303637373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('90i2csrf3068gn6oeucfg5nrvn0qsvg3', '125.161.82.54', 1506484484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363438343237303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343735383237223b6c6173745f69707c733a31313a2236312e352e32372e313535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363438303637373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('q5105l57qutfirjqhl4k5heauc6gsrqc', '45.118.112.222', 1506584413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363538343338303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036343738383439223b6c6173745f69707c733a31353a223230322e3135302e3133302e313934223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2v03vprcc15aumta15grr07e9u4g7gb3', '182.253.163.14', 1506644477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634343335393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036353834343038223b6c6173745f69707c733a31343a2234352e3131382e3131322e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8v4cqemsufbm0m1g42r00l8rnua0fetg', '182.253.163.14', 1506645082, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634343739323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036353834343038223b6c6173745f69707c733a31343a2234352e3131382e3131322e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('bdjhlqbkfvdm2acom5i9dmn7e26rerk8', '182.253.163.14', 1506645328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634353131313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036353834343038223b6c6173745f69707c733a31343a2234352e3131382e3131322e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('q1r7q3e1u9kq1ib1aa48ttsmckeshd5l', '182.253.163.14', 1506646106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634353934323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036353834343038223b6c6173745f69707c733a31343a2234352e3131382e3131322e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ev79or2g90de40oje1u1misotq1u95si', '182.253.163.14', 1506646613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634363335323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036353834343038223b6c6173745f69707c733a31343a2234352e3131382e3131322e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('hahbiqv0jbj3afem8qi7ushacl3petqq', '182.253.163.14', 1506646995, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634363730333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036353834343038223b6c6173745f69707c733a31343a2234352e3131382e3131322e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('qeehmcnhu29gohokbid078abvhi4n4r8', '182.253.163.14', 1506647360, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634373037303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036353834343038223b6c6173745f69707c733a31343a2234352e3131382e3131322e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('kasjjm2ltab9s0gprp2ovj23iuaf92a4', '182.253.163.14', 1506647526, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634373337333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036353834343038223b6c6173745f69707c733a31343a2234352e3131382e3131322e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22437156384c497a4d4a5541675168756972655977223b),
('brh6grtfe0rgh2evkapjad6ggo118djs', '182.253.163.14', 1506648035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634373735353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036353834343038223b6c6173745f69707c733a31343a2234352e3131382e3131322e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22437156384c497a4d4a5541675168756972655977223b),
('dg9paapb7rljjhnqqtvltk9e9ibe8jee', '182.253.163.14', 1506648134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634383036383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036353834343038223b6c6173745f69707c733a31343a2234352e3131382e3131322e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22437156384c497a4d4a5541675168756972655977223b6d6573736167657c733a31363a22446973636f756e742044656c65746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('d5lg23oj7jbmlg97hpl372pijm93dbuj', '182.253.163.14', 1506648748, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634383435313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036353834343038223b6c6173745f69707c733a31343a2234352e3131382e3131322e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22437156384c497a4d4a5541675168756972655977223b),
('qgarqj3hghlv7ov6hvgu54ds2qkim2bp', '182.253.163.14', 1506649017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634383739313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036353834343038223b6c6173745f69707c733a31343a2234352e3131382e3131322e323232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22437156384c497a4d4a5541675168756972655977223b6d6573736167657c733a31363a22446973636f756e742055706461746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('jkjquk3rj998vh65ijkuoa199igcs7ic', '36.78.94.147', 1506649687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634393430363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363434343235223b6c6173745f69707c733a31343a223138322e3235332e3136332e3134223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('n0encn5r63u1bom55fkuaaercc3v59fh', '36.78.94.147', 1506649667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634393636373b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b),
('vk32nhvkrdbgkbscrqvnmop4aigqj2u0', '36.78.94.147', 1506649779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363634393730373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363434343235223b6c6173745f69707c733a31343a223138322e3235332e3136332e3134223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('0g640donn5c4jt4pntcm0rbaif2r9s4a', '112.215.236.71', 1506656481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363635363237363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363439343037223b6c6173745f69707c733a31323a2233362e37382e39342e313437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ekn85qspoat31agpo88lvapklmpuvef5', '36.78.94.147', 1506656891, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363635363638313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363434343235223b6c6173745f69707c733a31343a223138322e3235332e3136332e3134223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('63p1crdc2usid0ljchh5jh17pu57jsn4', '112.215.236.71', 1506656839, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363635363739303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363439343037223b6c6173745f69707c733a31323a2233362e37382e39342e313437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('00jftucptbqgj48j9ob5th5g36uea2bl', '36.78.94.147', 1506688177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363638373838303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363536333232223b6c6173745f69707c733a31343a223131322e3231352e3233362e3731223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('er18dbgermbglr4qfrqi5iptbeqlu7n2', '36.78.94.147', 1506688358, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363638383232383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363536333232223b6c6173745f69707c733a31343a223131322e3231352e3233362e3731223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('jcn4e89u1vn9agluufigiscl2m9a6g8o', '112.215.238.198', 1506688649, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363638383435373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363837383830223b6c6173745f69707c733a31323a2233362e37382e39342e313437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('uk4cjsptjvp5podoq6i8dte8dltofl8o', '36.78.94.147', 1506688806, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363638383536303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363536333232223b6c6173745f69707c733a31343a223131322e3231352e3233362e3731223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363638383536323b),
('3qqu3p5f1aank9nqllkb254pdegfhhm7', '45.64.1.69', 1506688592, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363638383539323b6572726f727c733a3137333a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f7369636865722e636f2e69642f6170702f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('qb08vhnvvjai6j3jvv9dam6gel2is8cj', '112.215.238.198', 1506689133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363638393036333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363837383830223b6c6173745f69707c733a31323a2233362e37382e39342e313437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('hdes9jjh7diphhcjd2bm0n9mv6c9dq91', '36.78.94.147', 1506690934, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363639303931333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363536333232223b6c6173745f69707c733a31343a223131322e3231352e3233362e3731223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363638383536323b),
('g2pubcjrvqtaa5e2gj18phg64otcgr7e', '103.217.172.166', 1506933643, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363933333436333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363838353035223b6c6173745f69707c733a31353a223131322e3231352e3233382e313938223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363933333634333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a32373a22504f532053616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('opj16liihbq3pqcrio8jmnlt276su5rb', '103.217.172.166', 1506936923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363933363932333b),
('t4c6qs90i6lg3s2i6h3blvhtvr66vu56', '103.217.172.166', 1506937061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363933363932333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363838353035223b6c6173745f69707c733a31353a223131322e3231352e3233382e313938223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363933333634333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b72656d6f76655f706f736c737c693a313b),
('3ib1luquc11c7v8rqf87cm57htde949i', '103.217.172.166', 1506938212, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363933383230303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363838353035223b6c6173745f69707c733a31353a223131322e3231352e3233382e313938223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363933333634333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b72656d6f76655f706f736c737c693a313b),
('vg58gm7ravk439dtd5uoh37h1rvre9as', '103.217.172.166', 1506939403, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363933393339303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353036363838353035223b6c6173745f69707c733a31353a223131322e3231352e3233382e313938223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530363933333634333b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b72656d6f76655f706f736c737c693a313b),
('4smjo4fp922o1jhrnt4vtq811buampcn', '180.254.33.148', 1507040692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373034303637313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037303430343031223b6c6173745f69707c733a31343a223138302e3235342e33332e313438223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('tcttcptj7nkeb5b0ui20gafa70lhlt3t', '120.188.34.48', 1507041366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373034313037383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037303430363834223b6c6173745f69707c733a31343a223138302e3235342e33332e313438223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373034313333353b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('u2h0dt319kjh7e9foas0o5flglqrl55f', '120.188.34.48', 1507041697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373034313338383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037303430363834223b6c6173745f69707c733a31343a223138302e3235342e33332e313438223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373034313639373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('2qclvq1u5uke7emqe9u31vh37nv7ccqg', '180.254.36.236', 1507104785, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373130343738353b),
('35csbb9h459avr39o5ltbk975lau1j1h', '180.254.36.236', 1507104786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373130343738363b7265717565737465645f706167657c733a353a2261646d696e223b),
('d7msb6pabsu4444irg2v5n1aloqs2teo', '180.254.36.236', 1507104786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373130343738363b),
('tmco3a3tkjlfcg541hin83al6kvtnqrq', '116.206.42.92', 1507105990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373130353939303b),
('27bb15lhqbn0u5fbbd5lnl9kcppbqa02', '116.206.42.92', 1507106323, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373130353939313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037303431313132223b6c6173745f69707c733a31333a223132302e3138382e33342e3438223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373130363233383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('4nvbr2odgd7rtjla04iaigiofijortqa', '116.206.42.92', 1507106635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373130363333353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037303431313132223b6c6173745f69707c733a31333a223132302e3138382e33342e3438223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373130363633343b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('g6ur3q3sge7nuevtk607aj4v7q6322et', '116.206.42.92', 1507106758, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373130363633373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037303431313132223b6c6173745f69707c733a31333a223132302e3138382e33342e3438223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373130363730353b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('fmr57c3he0uc8gbjf6iqdgoevb041sh8', '54.85.182.120', 1507115245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353234343b),
('i1vmk1iip5r1fko3lb27t9fa9pjlvuus', '54.85.182.120', 1507115280, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353238303b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('fjihhk71ks6blb6pklrvi72itagafb6v', '54.85.182.120', 1507115354, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353335343b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('uqa99s5es9r2qsscd049slp807tulub2', '54.85.182.120', 1507115363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353336333b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b),
('1vhjhtbl7hcbe4dbd6983pq3bm8pfjlq', '54.85.182.120', 1507115369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353336393b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b),
('1431ad5jjku4jo8lmh95hd36gbtikn1l', '54.85.182.120', 1507115417, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353431373b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b),
('a4vdjrsh98sir82bq6k8h392sh32htkp', '54.85.182.120', 1507115485, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353438353b7265717565737465645f706167657c733a31393a2261646d696e2f706f732f766965775f62696c6c223b),
('td9ghkfs6t6pl47geqmb8rei8023uvlo', '54.85.182.120', 1507115594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353539343b7265717565737465645f706167657c733a31383a2261646d696e2f706f732f73657474696e6773223b),
('d4u35ke9ubbskiv4sso1pi77f2l8j4ck', '54.85.182.120', 1507115603, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353630333b7265717565737465645f706167657c733a32313a2261646d696e2f73797374656d5f73657474696e6773223b),
('i51v70rns25g7se5dbf7bj628o8lcs4d', '54.85.182.120', 1507115679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353637393b7265717565737465645f706167657c733a32393a2261646d696e2f73797374656d5f73657474696e67732f6261636b757073223b),
('2aqkk3al132rf38ou03o2mnuvpt099eh', '54.85.182.120', 1507115697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353639373b7265717565737465645f706167657c733a32393a2261646d696e2f7265706f7274732f7175616e746974795f616c65727473223b),
('1lq0jg3vl98alrnhrd01f0mb4o6ce2u3', '54.85.182.120', 1507115787, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353738373b7265717565737465645f706167657c733a32333a2261646d696e2f70726f64756374732f646973636f756e74223b),
('ebqo2gm1ukml0asvvtcpguvdsr8jsj86', '54.85.182.120', 1507115793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373131353739333b7265717565737465645f706167657c733a353a2261646d696e223b),
('rt33c1nopasjcrnc4q0ap6rm4co5hrgi', '180.254.36.236', 1507136096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373133363037343b7265717565737465645f706167657c733a31353a2261646d696e2f73616c65732f616464223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037313036303237223b6c6173745f69707c733a31333a223131362e3230362e34322e3932223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('jjh6l63fh8a7dktti15k7v50ljjimss3', '182.253.163.3', 1507161261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373136313236313b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037313630333230223b6c6173745f69707c733a31333a223138322e3235332e3136332e33223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373136313236313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('67hsjg8pq341lpkdvk9t3cij09v11n86', '182.253.163.3', 1507160645, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373136303334343b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037313630333230223b6c6173745f69707c733a31333a223138322e3235332e3136332e33223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373136303634353b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('l6f7q8a94u9e2v99v9e87qc10b3dlfca', '64.233.172.170', 1507203106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373230333130363b),
('ctui4qsv53bik3eqruvn3niounvm0dfm', '64.233.172.174', 1507203109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373230333130383b6572726f727c733a3134333a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f7369636865722e636f2e69642f6170702f7468656d65732f64656661756c742f61646d696e2f6173736574732f696d616765732f69636f6e2e706e67223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('l4b8rmc4ul77jdum795tmcmpb1uqtct4', '64.233.172.170', 1507203111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373230333131303b),
('b9d1haqjjgu2o3ur7ufbvr17t6o33top', '64.233.172.174', 1507203114, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373230333131343b7265717565737465645f706167657c733a353a2261646d696e223b),
('gerd7l6rg7lb8bmm1gmljeqp5uc9o1el', '64.233.172.170', 1507203117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373230333131363b),
('vlbj1r2t408olujj5e96pnj4odn9bso5', '110.137.166.240', 1507273852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373237333630313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037313630333438223b6c6173745f69707c733a31333a223138322e3235332e3136332e33223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3mbpevbvodjfr13ocko21tnuip73kgj8', '45.64.1.69', 1507273710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373237333731303b6572726f727c733a3137333a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f7369636865722e636f2e69642f6170702f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('nufvnmkgntjl4j45845eia66sevfjn0l', '45.64.1.69', 1507273845, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373237333834353b6572726f727c733a3137333a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f7369636865722e636f2e69642f6170702f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2005ul387ed30k9l0f024mb5o5vbj567', '45.64.1.69', 1507273849, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373237333834393b6572726f727c733a3137333a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f7369636865722e636f2e69642f6170702f7468656d65732f64656661756c742f61646d696e2f6173736574732f7374796c65732f666f6e74732f676c79706869636f6e732d68616c666c696e67732d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bso88efviaudhb5k0rec6jmeborjp5hk', '110.137.166.240', 1507274690, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373237343638303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037313630333438223b6c6173745f69707c733a31333a223138322e3235332e3136332e33223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9ci1ji0u3651rttlocnrfmr1kqrff0lh', '110.137.166.240', 1507280983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373238303731333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037313630333438223b6c6173745f69707c733a31333a223138322e3235332e3136332e33223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373238303936383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('lgm3a7ncl4dqu6tebe52fa1l852i6cd0', '110.137.166.240', 1507281441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373238313039393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037313630333438223b6c6173745f69707c733a31333a223138322e3235332e3136332e33223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373238313430363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('sm5gbih4q0ueci46686vake7vhe84hei', '110.137.166.240', 1507281537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373238313436353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037313630333438223b6c6173745f69707c733a31333a223138322e3235332e3136332e33223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373238313531383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('5i8tdordebr57muq314370c5ihct7puq', '110.137.166.240', 1507282102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373238313832353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037313630333438223b6c6173745f69707c733a31333a223138322e3235332e3136332e33223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373238323130313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b757365725f637372667c733a32303a226a6656454f5873525a75336b553177704d515934223b72656d6f76655f706f736c737c693a313b6572726f727c733a3134333a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f7369636865722e636f2e69642f6170702f7468656d65732f64656661756c742f61646d696e2f6173736574732f696d616765732f69636f6e2e706e67223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('j5kg3skp4e6qhet323jqt3tqmu9b32p8', '110.137.166.240', 1507282576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373238323536393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037313630333438223b6c6173745f69707c733a31333a223138322e3235332e3136332e33223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373238323130313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b757365725f637372667c733a32303a226a6656454f5873525a75336b553177704d515934223b72656d6f76655f706f736c737c693a313b),
('h5mvrpicdmn4dk2b3fq4or3fuosjr8db', '54.165.90.203', 1507343129, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373334333039363b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('3t1bqq74lt1186l5os0sk9qaac40gii9', '54.165.90.203', 1507428038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373432383033363b7265717565737465645f706167657c733a32393a2261646d696e2f7265706f7274732f7175616e746974795f616c65727473223b),
('34q7cj8shck0obgctui7n7lpmd294qbg', '54.165.90.203', 1507430410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373433303333333b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b),
('0hkmh8km3hrhhtonl7n69cpeoclfa6fn', '54.165.90.203', 1507430813, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373433303831333b7265717565737465645f706167657c733a353a2261646d696e223b),
('12ok4jika9hfilic69dlh418snclu75m', '54.165.90.203', 1507430839, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373433303833393b7265717565737465645f706167657c733a31393a2261646d696e2f706f732f766965775f62696c6c223b),
('2o973vo1h2hvvn72onj3budtkomfv557', '54.165.90.203', 1507431143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373433313133383b7265717565737465645f706167657c733a32313a2261646d696e2f73797374656d5f73657474696e6773223b),
('hd0tegettf06dl7igpudsk8miiti6ngg', '54.165.90.203', 1507431262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373433313236323b7265717565737465645f706167657c733a31383a2261646d696e2f70726f64756374732f616464223b),
('n4kcj4g6h4to6na4p9rcnvfebl3r1hm0', '54.165.90.203', 1507431327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373433313332373b7265717565737465645f706167657c733a32333a2261646d696e2f70726f64756374732f646973636f756e74223b),
('5trbb0eqpnktl5t530d52fcahhqv7pg8', '202.51.126.138', 1507618581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373631383531383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037323733363633223b6c6173745f69707c733a31353a223131302e3133372e3136362e323430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373631383536313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('1e06b0h9fv9ehua4fnl8m3m50l72sf1s', '202.51.126.138', 1507619404, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373631383931343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037323733363633223b6c6173745f69707c733a31353a223131302e3133372e3136362e323430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373631393430343b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('b5pm10j1livncipgjqaq2f2hejr6g8l9', '202.51.126.138', 1507619423, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373631393430363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037323733363633223b6c6173745f69707c733a31353a223131302e3133372e3136362e323430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373631393430363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('fbeu0uvs9gld7dqr7qdmm1l0d2c124nd', '202.51.126.138', 1507620136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373632303037313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037323733363633223b6c6173745f69707c733a31353a223131302e3133372e3136362e323430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373632303132363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('v0uo07n649us8jk8g2g9ttkived8idch', '180.252.251.234', 1507620328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373632303139393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037363138353338223b6c6173745f69707c733a31343a223230322e35312e3132362e313338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373632303331353b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('siv26o9hi8apho7o1dpd1nkleh2jle1h', '202.51.126.138', 1507620450, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373632303433333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037323733363633223b6c6173745f69707c733a31353a223131302e3133372e3136362e323430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373632303132363b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b72656d6f76655f736c6c737c693a313b),
('8i859c2lh3lc6qcpahq2fm8j8na2g1t2', '202.51.126.138', 1507622699, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373632323436353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037323733363633223b6c6173745f69707c733a31353a223131302e3133372e3136362e323430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373632323639383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b72656d6f76655f736c6c737c693a313b),
('5e63kgsu3bdgkjg9pmfvv3tadmhn93ub', '180.252.251.234', 1507622856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373632323834373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037363138353338223b6c6173745f69707c733a31343a223230322e35312e3132362e313338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373632303331353b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b),
('024s129e8bmfkdrk8h4uou80dsmspm3d', '202.51.126.138', 1507624800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373632343439383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037323733363633223b6c6173745f69707c733a31353a223131302e3133372e3136362e323430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373632343635303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b72656d6f76655f736c6c737c693a313b),
('n8knr9e613n8dkq6joeh0cuiuv6ahpf8', '202.51.126.138', 1507624887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373632343830393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037323733363633223b6c6173745f69707c733a31353a223131302e3133372e3136362e323430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373632343635303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b72656d6f76655f736c6c737c693a313b),
('sia3r7rd0k7aao7pc222r6d91v77vrd1', '202.51.126.138', 1507625504, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373632353237323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31333a226f776e6572406572702e636f6d223b757365726e616d657c733a383a226f776e6572313233223b656d61696c7c733a31333a226f776e6572406572702e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353037323733363633223b6c6173745f69707c733a31353a223131302e3133372e3136362e323430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313530373632343635303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223134352e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30372d31372031323a32393a3034223b72656d6f76655f736c6c737c693a313b),
('og8goumgtkgtavjmom3nf1cmdsb0smvv', '114.124.201.157', 1507625460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373632353436303b7265717565737465645f706167657c733a31343a2261646d696e2f70726f6475637473223b),
('cuku60ep0i76rlio2dsi98r57iirkjo0', '202.51.126.138', 1507632890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373633323838303b7265717565737465645f706167657c733a353a2261646d696e223b),
('4nk6rrotk31nli1gesm4j2g1ai0ptnfm', '202.51.126.138', 1507633188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373633333138363b7265717565737465645f706167657c733a353a2261646d696e223b),
('66rj8lrstv6nr399j42usav71r9att6t', '202.51.126.138', 1507634045, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530373633343034303b7265717565737465645f706167657c733a353a2261646d696e223b);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_settings`
--

DROP TABLE IF EXISTS `sma_settings`;
CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '_',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`) VALUES
(1, 'logo2.png', 'logo3.png', 'Inventory POS', 'english', 1, 0, 'USD', 1, 10, '3.2.2', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 0, 'Asia/Jakarta', 800, 800, 150, 150, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'contact@tecdiary.com', 0, 4, 1, 0, 2, 1, 1, 1, 2, 2, '.', ',', 0, 3, 'elyinfoe', '8c3c47a1-09a1-4ce7-8f44-039cb07170ad', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '', 0, '_', 0, 1, 1, 'POP', 90, '', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_skrill`
--

DROP TABLE IF EXISTS `sma_skrill`;
CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_stock_counts`
--

DROP TABLE IF EXISTS `sma_stock_counts`;
CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_stock_counts`
--

INSERT INTO `sma_stock_counts` (`id`, `date`, `reference_no`, `warehouse_id`, `type`, `initial_file`, `final_file`, `brands`, `brand_names`, `categories`, `category_names`, `note`, `products`, `rows`, `differences`, `matches`, `missing`, `created_by`, `updated_by`, `updated_at`, `finalized`) VALUES
(1, '2017-07-20 01:41:00', '', 1, 'full', 'b43f9d783e53c41ae8214b6073f7eb45.csv', NULL, '', '', '', '', NULL, 1, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(2, '2017-07-26 01:59:00', '', 1, 'full', 'c7ff01930516fbd3f090b0691437ce71.csv', NULL, '', '', '', '', NULL, 1, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_stock_count_items`
--

DROP TABLE IF EXISTS `sma_stock_count_items`;
CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_suspended_bills`
--

DROP TABLE IF EXISTS `sma_suspended_bills`;
CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_suspended_items`
--

DROP TABLE IF EXISTS `sma_suspended_items`;
CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_tax_rates`
--

DROP TABLE IF EXISTS `sma_tax_rates`;
CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_transfers`
--

DROP TABLE IF EXISTS `sma_transfers`;
CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_transfer_items`
--

DROP TABLE IF EXISTS `sma_transfer_items`;
CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_units`
--

DROP TABLE IF EXISTS `sma_units`;
CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, 'U1', 'Unit 1', NULL, NULL, NULL, NULL),
(2, 'pcs', 'pieces', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_users`
--

DROP TABLE IF EXISTS `sma_users`;
CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(2, 0x3138302e3235322e3235312e323334, 0x3138302e3234332e34382e323532, 'owner123', '80fc57f539e81b74afa8bbee603eb3411edcb515', NULL, 'owner@erp.com', NULL, NULL, NULL, 'ccee0460d0a17fa8447f3c55db4fc8a9ffdcfb72', 1500268731, 1507620221, 1, 'owner', 'owner', 'erp', '123378889', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_user_logins`
--

DROP TABLE IF EXISTS `sma_user_logins`;
CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3132352e3136312e3131342e313031, 'owner@tecdiary.com', '2017-07-14 15:06:16'),
(2, 1, NULL, 0x3132352e3136312e3131342e313031, 'owner@tecdiary.com', '2017-07-14 16:08:17'),
(3, 2, NULL, 0x3138302e3234332e34382e323532, 'owner@erp.com', '2017-07-17 05:19:18'),
(4, 2, NULL, 0x3138302e3234332e34382e323532, 'owner@erp.com', '2017-07-17 15:42:55'),
(5, 2, NULL, 0x3138302e3234332e34382e323532, 'owner@erp.com', '2017-07-17 15:53:48'),
(6, 2, NULL, 0x3132352e3136302e3139392e3237, 'owner@erp.com', '2017-07-19 02:59:16'),
(7, 2, NULL, 0x3132352e3136302e3139392e3237, 'owner@erp.com', '2017-07-19 07:53:31'),
(8, 2, NULL, 0x33362e37382e38342e313632, 'owner@erp.com', '2017-07-19 14:04:41'),
(9, 2, NULL, 0x33362e37382e38342e313632, 'owner@erp.com', '2017-07-19 14:05:32'),
(10, 2, NULL, 0x3138322e33302e3131332e3833, 'owner@erp.com', '2017-07-19 14:19:32'),
(11, 2, NULL, 0x3132352e3136312e3130322e31, 'owner@erp.com', '2017-07-25 14:58:13'),
(12, 2, NULL, 0x3131302e3133372e3137312e313432, 'owner@erp.com', '2017-07-26 01:59:08'),
(13, 2, NULL, 0x3131302e3133372e3137312e313432, 'owner@erp.com', '2017-07-26 16:25:01'),
(14, 2, NULL, 0x3130332e3233312e3230322e3833, 'owner@erp.com', '2017-07-27 05:27:37'),
(15, 2, NULL, 0x33362e37382e39312e313736, 'owner@erp.com', '2017-07-27 13:34:56'),
(16, 2, NULL, 0x33362e37382e39312e313736, 'owner@erp.com', '2017-07-27 14:05:19'),
(17, 2, NULL, 0x33362e37382e39312e313736, 'owner@erp.com', '2017-07-27 14:20:06'),
(18, 2, NULL, 0x33362e37382e39312e313736, 'owner@erp.com', '2017-07-27 14:25:11'),
(19, 2, NULL, 0x33362e37382e39312e313736, 'owner@erp.com', '2017-07-27 14:25:30'),
(20, 2, NULL, 0x33362e37312e38382e313831, 'owner@erp.com', '2017-08-08 04:12:18'),
(21, 2, NULL, 0x3131302e3133362e31382e313739, 'owner@erp.com', '2017-08-09 12:16:58'),
(22, 2, NULL, 0x3130332e34372e3133352e313438, 'owner@erp.com', '2017-08-28 08:55:14'),
(23, 2, NULL, 0x3138302e3234342e36322e313430, 'owner@erp.com', '2017-08-28 09:49:45'),
(24, 2, NULL, 0x3131372e3130322e37312e313632, 'owner@erp.com', '2017-08-30 05:05:50'),
(25, 2, NULL, 0x36312e39342e3134352e323533, 'owner@erp.com', '2017-08-31 10:53:12'),
(26, 2, NULL, 0x36312e39342e3134352e323533, 'owner@erp.com', '2017-08-31 11:41:20'),
(27, 2, NULL, 0x3131322e3231352e3233362e313831, 'owner@erp.com', '2017-09-01 02:38:41'),
(28, 2, NULL, 0x3131342e3132342e3134392e313332, 'owner@erp.com', '2017-09-01 06:48:35'),
(29, 2, NULL, 0x3131342e3132342e3134342e313538, 'owner@erp.com', '2017-09-01 22:55:00'),
(30, 2, NULL, 0x3132352e3136302e3139322e323334, 'owner@erp.com', '2017-09-02 11:39:49'),
(31, 2, NULL, 0x3138322e3235332e3136332e36, 'owner@erp.com', '2017-09-02 13:33:40'),
(32, 2, NULL, 0x3138322e3235332e3136332e35, 'owner@erp.com', '2017-09-13 04:51:11'),
(33, 2, NULL, 0x3132352e3136312e3131352e3831, 'owner@erp.com', '2017-09-18 03:37:49'),
(34, 2, NULL, 0x3132352e3136312e3131352e3831, 'owner@erp.com', '2017-09-18 03:59:33'),
(35, 2, NULL, 0x3138302e3234342e36322e323436, 'owner@erp.com', '2017-09-26 13:25:28'),
(36, 2, NULL, 0x3230322e3135302e3133302e313934, 'owner@erp.com', '2017-09-27 02:20:49'),
(37, 2, NULL, 0x34352e3131382e3131322e323232, 'owner@erp.com', '2017-09-28 07:40:08'),
(38, 2, NULL, 0x3138322e3235332e3136332e3134, 'owner@erp.com', '2017-09-29 00:20:25'),
(39, 2, NULL, 0x3131322e3231352e3233362e3731, 'owner@erp.com', '2017-09-29 03:38:42'),
(40, 2, NULL, 0x3131322e3231352e3233382e313938, 'owner@erp.com', '2017-09-29 12:35:05'),
(41, 2, NULL, 0x3138302e3235342e33332e313438, 'owner@erp.com', '2017-10-03 14:24:44'),
(42, 2, NULL, 0x3132302e3138382e33342e3438, 'owner@erp.com', '2017-10-03 14:31:52'),
(43, 2, NULL, 0x3131362e3230362e34322e3932, 'owner@erp.com', '2017-10-04 08:33:47'),
(44, 2, NULL, 0x3138322e3235332e3136332e33, 'owner@erp.com', '2017-10-04 23:38:40'),
(45, 2, NULL, 0x3138322e3235332e3136332e33, 'owner@erp.com', '2017-10-04 23:39:08'),
(46, 2, NULL, 0x3131302e3133372e3136362e323430, 'owner@erp.com', '2017-10-06 07:07:43'),
(47, 2, NULL, 0x3230322e35312e3132362e313338, 'owner@erp.com', '2017-10-10 06:55:38'),
(48, 2, NULL, 0x3138302e3235322e3235312e323334, 'owner@erp.com', '2017-10-10 07:23:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_variants`
--

DROP TABLE IF EXISTS `sma_variants`;
CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_warehouses`
--

DROP TABLE IF EXISTS `sma_warehouses`;
CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'WHI', 'Warehouse 1', '<p>Address, City</p>', NULL, '012345678', 'whi@pos.com', 0),
(2, 'WHII', 'Warehouse 2', '<p>Warehouse 2, Jalan Sultan Ismail, 54000, Indonesia</p>', NULL, '0105292122', 'whii@pos.com', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_warehouses_products`
--

DROP TABLE IF EXISTS `sma_warehouses_products`;
CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(2, 3, 1, '99998.0000', NULL, '50000.0000'),
(3, 3, 2, '0.0000', NULL, '50000.0000'),
(4, 4, 1, '99901.0000', NULL, '50000.0000'),
(5, 4, 2, '0.0000', NULL, '50000.0000'),
(6, 5, 1, '10000000.0000', NULL, '50000.0000'),
(7, 5, 2, '0.0000', NULL, '50000.0000'),
(8, 6, 1, '9999.0000', NULL, '50000.0000'),
(9, 6, 2, '0.0000', NULL, '50000.0000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sma_warehouses_products_variants`
--

DROP TABLE IF EXISTS `sma_warehouses_products_variants`;
CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_banner`
--
ALTER TABLE `sma_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_code`
--
ALTER TABLE `sma_code`
  ADD PRIMARY KEY (`id_code`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_logs`
--
ALTER TABLE `sma_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_user` (`log_user`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_discounts`
--
ALTER TABLE `sma_product_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_banner`
--
ALTER TABLE `sma_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_code`
--
ALTER TABLE `sma_code`
  MODIFY `id_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `sma_logs`
--
ALTER TABLE `sma_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_product_discounts`
--
ALTER TABLE `sma_product_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
