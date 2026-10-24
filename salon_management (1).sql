-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2026 at 06:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salon_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `name`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Darshan Admin', 'admin@salon.com', '$2y$10$N8KYqsxAzmhaZgFactPBPedrxn65/TdWEfM3.u.H8P0dbQeXydHsi', 'active', '2026-09-02 13:27:33', '2026-09-02 13:41:30'),
(2, 'Salon Manager', 'manager@salon.com', '$2y$10$oyrTuvYKSJzgmOArCzrVe.7Xau78iVLv6vHXbBw3n0oHW67Trfspe', 'active', '2026-09-02 13:27:33', '2026-09-09 03:51:03'),
(3, 'Reception Admin', 'reception@salon.com', 'reception123', 'active', '2026-09-02 13:27:33', '2026-09-02 13:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `status` enum('Pending','Confirmed','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `customer_id`, `appointment_date`, `appointment_time`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-09-05', '10:00:00', 'Confirmed', 'Regular haircut', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(2, 2, '2026-09-05', '11:00:00', 'Pending', 'Customer requested morning appointment', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(3, 3, '2026-09-05', '12:30:00', 'Completed', 'Hair coloring appointment', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(4, 4, '2026-09-06', '10:30:00', 'Confirmed', 'Facial appointment', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(5, 5, '2026-09-06', '13:00:00', 'Pending', 'Nail art requested', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(6, 6, '2026-09-07', '11:30:00', 'Confirmed', 'Haircut and hair spa', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(7, 7, '2026-09-07', '15:00:00', 'Completed', 'Party makeup', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(8, 8, '2026-09-08', '10:00:00', 'Cancelled', 'Customer cancelled appointment', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(9, 9, '2026-09-08', '14:00:00', 'Confirmed', 'Facial and manicure', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(10, 10, '2026-09-09', '16:00:00', 'Pending', 'Hair styling appointment', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(11, 1, '2026-09-10', '11:00:00', 'Confirmed', 'Hair color appointment', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(12, 2, '2026-09-10', '14:30:00', 'Completed', 'Head spa treatment', '2026-09-02 13:27:34', '2026-09-02 13:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_services`
--

CREATE TABLE `appointment_services` (
  `appointment_service_id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `service_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_services`
--

INSERT INTO `appointment_services` (`appointment_service_id`, `appointment_id`, `service_id`, `service_price`, `created_at`) VALUES
(1, 1, 1, 300.00, '2026-09-02 13:27:34'),
(2, 2, 4, 800.00, '2026-09-02 13:27:34'),
(3, 3, 3, 1200.00, '2026-09-02 13:27:34'),
(4, 4, 5, 1500.00, '2026-09-02 13:27:34'),
(5, 5, 10, 500.00, '2026-09-02 13:27:34'),
(6, 6, 1, 300.00, '2026-09-02 13:27:34'),
(7, 6, 6, 1000.00, '2026-09-02 13:27:34'),
(8, 7, 8, 2500.00, '2026-09-02 13:27:34'),
(9, 8, 2, 500.00, '2026-09-02 13:27:34'),
(10, 9, 4, 800.00, '2026-09-02 13:27:34'),
(11, 9, 11, 400.00, '2026-09-02 13:27:34'),
(12, 10, 2, 500.00, '2026-09-02 13:27:34'),
(13, 11, 3, 1200.00, '2026-09-02 13:27:34'),
(15, 12, 11, 400.00, '2026-10-12 16:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_staff`
--

CREATE TABLE `appointment_staff` (
  `appointment_staff_id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointment_staff`
--

INSERT INTO `appointment_staff` (`appointment_staff_id`, `appointment_id`, `staff_id`, `created_at`) VALUES
(1, 1, 1, '2026-09-02 13:27:34'),
(2, 2, 2, '2026-09-02 13:27:34'),
(3, 3, 3, '2026-09-02 13:27:34'),
(4, 4, 2, '2026-09-02 13:27:34'),
(5, 5, 5, '2026-09-02 13:27:34'),
(6, 6, 1, '2026-09-02 13:27:34'),
(7, 6, 6, '2026-09-02 13:27:34'),
(8, 7, 4, '2026-09-02 13:27:34'),
(9, 8, 1, '2026-09-02 13:27:34'),
(10, 9, 2, '2026-09-02 13:27:34'),
(11, 9, 5, '2026-09-02 13:27:34'),
(12, 10, 1, '2026-09-02 13:27:34'),
(13, 11, 3, '2026-09-02 13:27:34'),
(15, 12, 6, '2026-10-12 16:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone`, `password`, `gender`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rahul Patel', 'rahul@gmail.com', '9876543210', '$2y$10$dummyhash001', 'Male', 'Adajan, Surat', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(2, 'Priya Shah', 'priya@gmail.com', '9876543211', '$2y$10$dummyhash002', 'Female', 'Vesu, Surat', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(3, 'Aarav Mehta', 'aarav@gmail.com', '9876543212', '$2y$10$dummyhash003', 'Male', 'City Light, Surat', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(4, 'Neha Patel', 'neha@gmail.com', '9876543213', '$2y$10$dummyhash004', 'Female', 'Pal, Surat', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(5, 'Riya Desai', 'riya@gmail.com', '9876543214', '$2y$10$dummyhash005', 'Female', 'Athwa, Surat', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(6, 'Karan Shah', 'karan@gmail.com', '9876543215', '$2y$10$dummyhash006', 'Male', 'Varachha, Surat', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(7, 'Pooja Joshi', 'pooja@gmail.com', '9876543216', '$2y$10$dummyhash007', 'Female', 'Katargam, Surat', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(8, 'Dev Patel', 'dev@gmail.com', '9876543217', '$2y$10$dummyhash008', 'Male', 'Piplod, Surat', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(9, 'Kavya Shah', 'kavya@gmail.com', '9876543218', '$2y$10$dummyhash009', 'Female', 'Nanpura, Surat', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(10, 'Yash Desai', 'yash@gmail.com', '9876543219', '$2y$10$dummyhash010', 'Male', 'Dumas Road, Surat', 'inactive', '2026-09-02 13:27:34', '2026-09-02 13:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('Cash','Card','UPI') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` enum('Pending','Paid','Failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `appointment_id`, `amount`, `payment_method`, `payment_status`, `transaction_id`, `payment_date`) VALUES
(1, 1, 300.00, 'UPI', 'Paid', 'UPI2026090001', '2026-09-02 13:27:34'),
(2, 2, 800.00, 'Cash', 'Pending', NULL, '2026-09-02 13:27:34'),
(3, 3, 1200.00, 'Card', 'Paid', 'CARD2026090001', '2026-09-02 13:27:34'),
(4, 4, 1500.00, 'UPI', 'Paid', 'UPI2026090002', '2026-09-02 13:27:34'),
(5, 5, 500.00, 'Cash', 'Pending', NULL, '2026-09-02 13:27:34'),
(6, 6, 1300.00, 'UPI', 'Paid', 'UPI2026090003', '2026-09-02 13:27:34'),
(7, 7, 2500.00, 'Card', 'Paid', 'CARD2026090002', '2026-09-02 13:27:34'),
(8, 8, 500.00, 'UPI', 'Failed', 'UPI2026090004', '2026-09-02 13:27:34'),
(9, 9, 1200.00, 'Card', 'Paid', 'CARD2026090003', '2026-09-02 13:27:34'),
(10, 10, 500.00, 'Cash', 'Pending', NULL, '2026-09-02 13:27:34'),
(11, 11, 1200.00, 'UPI', 'Paid', 'UPI2026090005', '2026-09-02 13:27:34'),
(12, 12, 1000.00, 'Cash', 'Paid', NULL, '2026-09-02 13:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('visible','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'visible',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `customer_id`, `appointment_id`, `rating`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, 'Excellent haircut and very professional service.', 'visible', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(2, 3, 3, 5, 'Amazing hair color. I really liked the result.', 'visible', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(3, 4, 4, 4, 'Very good facial experience.', 'visible', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(4, 5, 5, 5, 'Beautiful nail art and friendly staff.', 'visible', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(5, 6, 6, 5, 'Haircut and spa were excellent.', 'visible', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(6, 7, 7, 5, 'The makeup was beautiful and professional.', 'visible', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(7, 9, 9, 4, 'Good facial and manicure service.', 'visible', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(8, 2, 12, 5, 'Very relaxing head spa.', 'visible', '2026-09-02 13:27:34', '2026-09-02 13:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `service_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL COMMENT 'Duration in minutes',
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `category_id`, `service_name`, `description`, `price`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Haircut', 'Professional haircut and styling', 300.00, 30, 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(2, 1, 'Hair Styling', 'Professional hair styling', 500.00, 45, 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(3, 1, 'Hair Color', 'Complete professional hair coloring', 1200.00, 90, 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(4, 2, 'Basic Facial', 'Basic facial cleansing and treatment', 800.00, 60, 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(5, 2, 'Gold Facial', 'Premium gold facial treatment', 1500.00, 75, 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(6, 3, 'Head Spa', 'Relaxing head spa treatment', 1000.00, 60, 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(7, 3, 'Body Spa', 'Full body relaxation spa', 1800.00, 90, 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(8, 4, 'Party Makeup', 'Professional party makeup', 2500.00, 120, 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(9, 4, 'Bridal Makeup', 'Complete bridal makeup package', 8000.00, 180, 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(10, 5, 'Nail Art', 'Creative nail art service', 500.00, 45, 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(11, 5, 'Manicure', 'Professional manicure service', 400.00, 40, 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(12, 6, 'Hair Spa Treatment', 'Deep conditioning hair spa', 900.00, 60, 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(13, 6, 'Keratin Treatment', 'Professional keratin hair treatment', 2500.00, 150, 'inactive', '2026-09-02 13:27:34', '2026-09-02 13:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`category_id`, `category_name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hair', 'Hair cutting, styling and treatment services', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(2, 'Facial', 'Facial and skin care services', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(3, 'Spa', 'Relaxation and spa treatment services', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(4, 'Makeup', 'Professional makeup services', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(5, 'Nails', 'Manicure, pedicure and nail art services', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(6, 'Hair Treatment', 'Specialized hair care and treatment services', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `name`, `email`, `phone`, `specialization`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Amit Sharma', 'amit@salon.com', '9000000001', 'Hair Styling', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(2, 'Sneha Patel', 'sneha@salon.com', '9000000002', 'Facial & Skin Care', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(3, 'Rohan Mehta', 'rohan@salon.com', '9000000003', 'Hair Coloring', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(4, 'Kajal Shah', 'kajal@salon.com', '9000000004', 'Makeup Artist', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(5, 'Nisha Desai', 'nisha@salon.com', '9000000005', 'Nail Art', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(6, 'Vivek Patel', 'vivek@salon.com', '9000000006', 'Spa & Massage', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(7, 'Anjali Joshi', 'anjali@salon.com', '9000000007', 'Hair Treatment', 'active', '2026-09-02 13:27:34', '2026-09-02 13:27:34'),
(8, 'Mehul Shah', 'mehul@salon.com', '9000000008', 'Hair Styling', 'inactive', '2026-09-02 13:27:34', '2026-09-02 13:27:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `idx_appointments_customer` (`customer_id`),
  ADD KEY `idx_appointments_date` (`appointment_date`),
  ADD KEY `idx_appointments_status` (`status`),
  ADD KEY `idx_appointments_schedule` (`appointment_date`,`appointment_time`);

--
-- Indexes for table `appointment_services`
--
ALTER TABLE `appointment_services`
  ADD PRIMARY KEY (`appointment_service_id`),
  ADD UNIQUE KEY `uq_appointment_service` (`appointment_id`,`service_id`),
  ADD KEY `idx_appointment_services_service` (`service_id`);

--
-- Indexes for table `appointment_staff`
--
ALTER TABLE `appointment_staff`
  ADD PRIMARY KEY (`appointment_staff_id`),
  ADD UNIQUE KEY `uq_appointment_staff` (`appointment_id`,`staff_id`),
  ADD KEY `idx_appointment_staff_staff` (`staff_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `uq_payment_transaction` (`transaction_id`),
  ADD KEY `idx_payments_appointment` (`appointment_id`),
  ADD KEY `idx_payments_status` (`payment_status`),
  ADD KEY `idx_payments_date` (`payment_date`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD UNIQUE KEY `uq_customer_appointment_review` (`customer_id`,`appointment_id`),
  ADD KEY `idx_reviews_customer` (`customer_id`),
  ADD KEY `idx_reviews_appointment` (`appointment_id`),
  ADD KEY `idx_reviews_status` (`status`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `idx_services_category` (`category_id`),
  ADD KEY `idx_services_status` (`status`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `appointment_services`
--
ALTER TABLE `appointment_services`
  MODIFY `appointment_service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `appointment_staff`
--
ALTER TABLE `appointment_staff`
  MODIFY `appointment_staff_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_appointments_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointment_services`
--
ALTER TABLE `appointment_services`
  ADD CONSTRAINT `fk_appointment_services_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_appointment_services_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON UPDATE CASCADE;

--
-- Constraints for table `appointment_staff`
--
ALTER TABLE `appointment_staff`
  ADD CONSTRAINT `fk_appointment_staff_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_appointment_staff_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reviews_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_services_category` FOREIGN KEY (`category_id`) REFERENCES `service_categories` (`category_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
