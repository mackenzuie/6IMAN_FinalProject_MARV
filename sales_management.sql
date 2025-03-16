-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2025 at 01:10 PM
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
-- Database: `sales_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `inventory_log`
--

CREATE TABLE `inventory_log` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `last_restock_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `reorder_level` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `last_restock_date`, `expiry_date`, `reorder_level`, `stock`, `quantity`) VALUES
(6, 'Chicken Shawarma Ricebowl and Shawarma Nachos w/ Drinks', NULL, 150.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(7, 'Beef Shawarma Ricebowl and Shawarma Nachos w/ Drinks', NULL, 160.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(8, 'Kebab Wrap and Shawarma Nachos w/ Drinks', NULL, 140.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(9, 'Tikka Wrap and Shawarma Nachos w/ Drinks', NULL, 145.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(10, 'Large Chicken Shawarma Wrap and Shawarma Nachos w/ Drinks', NULL, 180.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(11, 'Large Beef Shawarma Wrap and Shawarma Nachos w/ Drinks', NULL, 190.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(12, 'Chicken Shawarma Rice', NULL, 130.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(13, 'Chicken Shawarma Fries', NULL, 120.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(14, 'Beef Shawarma Fries', NULL, 130.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(15, 'Chicken Nachos', NULL, 110.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(16, 'Beef Nachos', NULL, 115.00, '2025-03-16', '2025-06-16', 5, 14, 0),
(17, 'Tikka Rice', NULL, 140.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(18, 'Large Chicken Shawarma Wrap', NULL, 160.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(19, 'Chicken Shawarma Rice bowl', NULL, 135.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(20, 'Beef Shawarma Rice', NULL, 140.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(21, 'Kebab Rice', NULL, 145.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(22, 'Tikka Wrap', NULL, 135.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(23, 'Kebab Wrap', NULL, 130.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(24, 'Beef Shawarma Rice bowl', NULL, 145.00, '2025-03-16', '2025-06-16', 5, 10, 0),
(25, 'Large Beef Shawarma Wrap', NULL, 170.00, '2025-03-16', '2025-06-16', 5, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL DEFAULT 0,
  `price_per_unit` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

CREATE TABLE `sales_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `first_name`, `last_name`, `role`, `username`, `password`, `contact_number`, `email`) VALUES
(1, 'Maclin Jane', 'Pascual', 'Admin', 'mackenzie', '$2y$10$sF2NW8rFOhxGqLIm5AMCBOG3cVELD09yFtVs9P/6p04AJVm8e1jey', '09673272375', 'woainithirak@gmail.com'),
(2, 'Arvin', 'Yulianto', 'Staff', 'seven', '$2y$10$CSsLT/CRvyLul2rRf0c3zOEEGC/zaU29MnRkZdckDbz/u6Eal1G1e', '09123456789', 'aeyulianto@gmail.com'),
(3, 'Ritz Stephen', 'Balajadia', 'Staff', 'ritz', '$2y$10$T.KDUbwzQkyLga3k5BVsJeaBda8EI/jCEHu0vb69wDPwjhS0/D99e', '09123456777', 'ritzbalajadia@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `stock_movements`
--

CREATE TABLE `stock_movements` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `change_in_stock` int(11) NOT NULL,
  `movement_type` enum('IN','OUT') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventory_log`
--
ALTER TABLE `inventory_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sales_product` (`product_id`);

--
-- Indexes for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventory_log`
--
ALTER TABLE `inventory_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory_log`
--
ALTER TABLE `inventory_log`
  ADD CONSTRAINT `inventory_log_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_sales_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD CONSTRAINT `sales_items_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD CONSTRAINT `stock_movements_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
