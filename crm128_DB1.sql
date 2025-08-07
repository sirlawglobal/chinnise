-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 07, 2025 at 06:09 AM
-- Server version: 10.6.22-MariaDB-cll-lve-log
-- PHP Version: 8.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm128_DB1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`crm128`@`localhost` PROCEDURE `InsertDummyEmployees` ()   BEGIN
  DECLARE i INT DEFAULT 0;

  WHILE i < 100 DO
    INSERT INTO `employees`(
      `picture`, `first_name`, `last_name`, `date_joined`, `position`, `status`, `department`, `location`, 
      `marital_status`, `date_of_birth`, `phone`, `email`, `gender`, `state_of_origin`, `nino`, `medical_condition`, 
      `bank_name`, `account_name`, `account_number`, `father_name`, `father_occupation`, `father_address`, 
      `father_phone`, `mother_name`, `mother_occupation`, `mother_address`, `mother_phone`, `siblings_number`, 
      `nok_surname`, `nok_other_names`, `nok_address`, `nok_phone`, `nok_email`, `nok_relationship`, 
      `ref1_surname`, `ref1_other_names`, `ref1_company`, `ref1_address`, `ref1_phone`, `ref1_position`, 
      `ref2_surname`, `ref2_other_names`, `ref2_company`, `ref2_address`, `ref2_phone`, `ref2_email`, `ref2_position`
    )
    VALUES (
      CONCAT('pic', i + 1, '.jpg'),
      CONCAT('First', i + 1),
      CONCAT('Last', i + 1),
      CURDATE(),
      'Developer',
      'Active',
      'IT',
      'Lagos',
      'Single',
      DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 10000) DAY),
      CONCAT('080', FLOOR(10000000 + RAND() * 89999999)),
      CONCAT('user', i + 1, '@example.com'),
      IF(i % 2 = 0, 'Male', 'Female'),
      'Lagos',
      CONCAT('NINO', LPAD(i + 1, 4, '0')),
      'None',
      'GTBank',
      CONCAT('Account Name ', i + 1),
      CONCAT('012345', LPAD(i + 1, 4, '0')),
      CONCAT('Father ', i + 1),
      'Trader',
      CONCAT('Father Address ', i + 1),
      CONCAT('080', FLOOR(10000000 + RAND() * 89999999)),
      CONCAT('Mother ', i + 1),
      'Teacher',
      CONCAT('Mother Address ', i + 1),
      CONCAT('080', FLOOR(10000000 + RAND() * 89999999)),
      FLOOR(1 + RAND() * 5),
      CONCAT('NOKSurname', i + 1),
      CONCAT('NOKName', i + 1),
      CONCAT('NOK Address ', i + 1),
      CONCAT('080', FLOOR(10000000 + RAND() * 89999999)),
      CONCAT('nok', i + 1, '@example.com'),
      'Brother',
      CONCAT('Ref1Surname', i + 1),
      CONCAT('Ref1Name', i + 1),
      CONCAT('Company', i + 1),
      CONCAT('Ref1 Address ', i + 1),
      CONCAT('080', FLOOR(10000000 + RAND() * 89999999)),
      'Manager',
      CONCAT('Ref2Surname', i + 1),
      CONCAT('Ref2Name', i + 1),
      CONCAT('Company', i + 1),
      CONCAT('Ref2 Address ', i + 1),
      CONCAT('080', FLOOR(10000000 + RAND() * 89999999)),
      CONCAT('ref', i + 1, '@example.com'),
      'Engineer'
    );

    SET i = i + 1;
  END WHILE;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `title`, `start`, `end`, `description`, `created_at`) VALUES
(5, 'Meeting with EHI', '2025-06-10 12:48:00', '2025-06-10 12:48:00', 'There is meeting', '2025-06-08 11:48:28'),
(6, 'Training With wemimo', '2025-07-31 14:49:00', '2025-07-31 20:49:00', 'CRM128 Training for testing( QA) ', '2025-07-31 13:51:16'),
(7, 'Training', '2025-07-31 15:06:00', '2025-07-31 19:06:00', 'CRM128testing', '2025-07-31 14:06:52'),
(8, 'fyy', '2025-08-14 14:16:00', '2025-08-03 15:17:00', 'yuyu', '2025-08-06 12:15:58');

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(11) NOT NULL,
  `award_name` varchar(100) DEFAULT NULL,
  `award_description` text DEFAULT NULL,
  `gift_item` varchar(255) DEFAULT NULL,
  `award_date` date DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `awarded_by` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `award_name`, `award_description`, `gift_item`, `award_date`, `first_name`, `last_name`, `awarded_by`, `created_at`) VALUES
(17, 'Time Management', 'DescriptionERE', '10000', '2025-08-21', 'DSDS', 'SDDS', 'MD', '2025-08-07 08:24:49'),
(18, 'Staff of the month', 'DescriptionERE', '10000', '2025-08-21', 'DSDS', 'SDDS', 'MD', '2025-08-07 08:24:59');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Fuel'),
(7, 'Funding'),
(8, 'IT Gadget'),
(4, 'Repairs'),
(6, 'Socials'),
(2, 'Telecoms'),
(3, 'Transport'),
(5, 'Water');

-- --------------------------------------------------------

--
-- Table structure for table `customer_returns`
--

CREATE TABLE `customer_returns` (
  `id` varchar(20) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `order_date` date NOT NULL,
  `client_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `return_reason` varchar(255) DEFAULT NULL,
  `return_status` varchar(50) DEFAULT NULL,
  `return_completed` enum('Pending','Completed','Rejected') NOT NULL DEFAULT 'Pending',
  `received_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `customer_returns`
--
DELIMITER $$
CREATE TRIGGER `before_insert_customer_returns` BEFORE INSERT ON `customer_returns` FOR EACH ROW BEGIN
  DECLARE last_id INT DEFAULT 0;
  DECLARE new_id VARCHAR(10);

  -- Get the numeric part of the last ID
  SELECT CAST(SUBSTRING(id, 6) AS UNSIGNED)
  INTO last_id
  FROM customer_returns
  WHERE id LIKE 'RETC%'
  ORDER BY id DESC
  LIMIT 1;

  -- Generate new ID
  SET last_id = IFNULL(last_id, 0) + 1;
  SET new_id = CONCAT('RETC', LPAD(last_id, 6, '0'));

  SET NEW.id = new_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_return_items`
--

CREATE TABLE `customer_return_items` (
  `id` int(11) NOT NULL,
  `order_item_id` int(10) UNSIGNED NOT NULL,
  `return_id` varchar(20) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) GENERATED ALWAYS AS (`quantity` * `unit_price`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `dept_no` varchar(50) DEFAULT NULL,
  `dept_name` varchar(255) NOT NULL,
  `dept_head` varchar(255) DEFAULT NULL,
  `staff_count` int(11) DEFAULT 0,
  `admin_dept` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `date_joined` date DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `state_of_origin` varchar(100) DEFAULT NULL,
  `nino` varchar(50) DEFAULT NULL,
  `medical_condition` varchar(255) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `father_address` varchar(255) DEFAULT NULL,
  `father_phone` varchar(20) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `mother_address` varchar(255) DEFAULT NULL,
  `mother_phone` varchar(20) DEFAULT NULL,
  `siblings_number` int(11) DEFAULT NULL,
  `nok_surname` varchar(100) DEFAULT NULL,
  `nok_other_names` varchar(100) DEFAULT NULL,
  `nok_address` varchar(255) DEFAULT NULL,
  `nok_phone` varchar(20) DEFAULT NULL,
  `nok_email` varchar(100) DEFAULT NULL,
  `nok_relationship` varchar(50) DEFAULT NULL,
  `ref1_surname` varchar(100) DEFAULT NULL,
  `ref1_other_names` varchar(100) DEFAULT NULL,
  `ref1_company` varchar(100) DEFAULT NULL,
  `ref1_address` varchar(255) DEFAULT NULL,
  `ref1_phone` varchar(20) DEFAULT NULL,
  `ref1_position` varchar(100) DEFAULT NULL,
  `ref2_surname` varchar(100) DEFAULT NULL,
  `ref2_other_names` varchar(100) DEFAULT NULL,
  `ref2_company` varchar(100) DEFAULT NULL,
  `ref2_address` varchar(255) DEFAULT NULL,
  `ref2_phone` varchar(20) DEFAULT NULL,
  `ref2_email` varchar(100) DEFAULT NULL,
  `ref2_position` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `picture`, `first_name`, `last_name`, `date_joined`, `position`, `status`, `department`, `location`, `marital_status`, `date_of_birth`, `phone`, `email`, `gender`, `state_of_origin`, `nino`, `medical_condition`, `bank_name`, `account_name`, `account_number`, `father_name`, `father_occupation`, `father_address`, `father_phone`, `mother_name`, `mother_occupation`, `mother_address`, `mother_phone`, `siblings_number`, `nok_surname`, `nok_other_names`, `nok_address`, `nok_phone`, `nok_email`, `nok_relationship`, `ref1_surname`, `ref1_other_names`, `ref1_company`, `ref1_address`, `ref1_phone`, `ref1_position`, `ref2_surname`, `ref2_other_names`, `ref2_company`, `ref2_address`, `ref2_phone`, `ref2_email`, `ref2_position`) VALUES
(273, NULL, 'DSDS', 'SDDS', '2025-08-14', 'Software Developer', 'Contract', '', 'ITA', '', '2025-08-08', '08023456789', 'admin@example.com', 'Male', 'lagos', '0249U84U3', 'mIld', 'DSDS SDDS', 'DSDS SDDS', '2324424', 'Mikl', 'farmenr', 'DAD', '08023456789', 'larry', 'mike', 'DAD', '08023456789', 45, 'ereer', 'errer', 'DAD', '08023456789', 'admin@example.com', 'eeer', 'rerer', 'erere', 'ADSD', 'DAD', '08023456789', '5455445', '445455', '45545', 'ADSD', 'DAD', '08023456789', 'admin@example.com', 'eere');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` varchar(255) NOT NULL,
  `transaction_type` enum('Credit','Debit') NOT NULL,
  `quantity` decimal(10,2) DEFAULT 1.00,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) GENERATED ALWAYS AS (`quantity` * `unit_price`) STORED,
  `balance` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `date`, `description`, `category_id`, `transaction_type`, `quantity`, `unit_price`, `balance`, `created_at`, `updated_at`) VALUES
(1, '2025-06-08', 'DESC', 'Socials', 'Debit', 1.00, 500.00, 0.00, '2025-06-08 18:42:31', '2025-08-07 10:05:30'),
(2, '2025-06-08', 'Data', 'Telecoms', 'Debit', 1.00, 500.00, 0.00, '2025-06-08 19:37:01', '2025-06-08 19:37:01'),
(3, '2025-06-08', 'Desription', 'Telecoms', 'Debit', 1.00, 200.00, 0.00, '2025-06-08 19:38:02', '2025-06-08 19:38:02'),
(4, '2025-06-08', 'Desription', 'Telecoms', 'Debit', 1.00, 200.00, 0.00, '2025-06-08 19:38:28', '2025-06-08 19:38:28'),
(5, '2025-06-08', 'Desription', 'Telecoms', 'Debit', 1.00, 200.00, 0.00, '2025-06-08 19:38:48', '2025-06-08 19:38:48'),
(7, '2023-03-15', 'DesriptionPOIUJLM,KJKLK', 'Telecoms', 'Debit', 3.00, 5.00, 0.00, '2025-08-01 10:02:46', '2025-08-01 10:07:44');

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `project_value` decimal(12,2) NOT NULL,
  `amount_received` decimal(12,2) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `incomes`
--

INSERT INTO `incomes` (`id`, `date`, `client_name`, `project_value`, `amount_received`, `description`, `created_at`, `updated_at`) VALUES
(1, '2024-08-08', 'Eddie', 6000.00, 3000.00, 'DesriptionPOIUJLM,KJKLK', '2025-06-08 16:47:04', '2025-08-01 09:57:23'),
(2, '2024-01-12', 'Eddie', 3500.00, 1500.00, 'CRM128', '2025-06-08 16:48:30', '2025-06-08 16:48:30'),
(3, '2025-06-08', 'Eddie', 5000.00, 3000.00, 'CRM128', '2025-06-08 16:49:59', '2025-06-08 16:49:59'),
(4, '2025-05-30', 'date', 2000.00, -2.00, '', '2025-07-31 13:34:09', '2025-07-31 13:34:09'),
(6, '2024-04-19', 'LAWRENCE', 34000.00, 5000.00, 'here', '2025-08-01 09:56:32', '2025-08-01 09:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_status` enum('Open','Closed','Critical') NOT NULL,
  `issue_title` varchar(255) NOT NULL,
  `issue_priority` enum('Low','Medium','High') NOT NULL,
  `issue_description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `edit_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `project_id`, `user_id`, `issue_status`, `issue_title`, `issue_priority`, `issue_description`, `created_at`, `updated_at`, `edit_user_id`) VALUES
(12, 17, 1, 'Open', 'RTR', 'Medium', 'Description', '2025-08-07 09:01:37', '2025-08-07 09:01:37', NULL),
(13, 17, 1, 'Open', 'RTR', 'Low', 'Issue Description', '2025-08-07 09:01:54', '2025-08-07 09:01:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `contact_title` varchar(50) DEFAULT NULL,
  `contact_surname` varchar(100) DEFAULT NULL,
  `contact_firstname` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company_category` varchar(100) DEFAULT NULL,
  `client_type` varchar(255) NOT NULL DEFAULT 'leads',
  `position` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `company_name`, `contact_title`, `contact_surname`, `contact_firstname`, `email`, `company_category`, `client_type`, `position`, `address`, `source`, `modified_date`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(4, 'GEN128', 'Mr.', 'Gabriel', 'Simran', 'col@gmail.com', 'Finance', 'client', 'CEO', 'Ikorodu, Lagos', 'SOURCE ', '2025-06-07', '09153234626848484848', NULL, '2025-06-07 14:04:07', '2025-06-25 15:26:37'),
(5, 'BrightMind Solutions BrightMind Solutions', 'Mrs.', 'Mehra', 'Simran', 'admin@admin.com', 'Finance', 'client', 'CON-10003', 'Ikorodu, Lagos', 'Imported', '2025-06-07', '09153234626', 'Inactive', '2025-06-07 14:05:09', '2025-06-25 14:59:38'),
(6, ' Hans TechnologiesHans TechnologiesHans TechnologiesHans Technologies', 'Mr.', 'Osunsedo-Vaugn', 'Frank lhhhhllk', 'frank@hanstechnologies.com', 'Technology', 'client', 'Web Master ', '123 Road London', 'Google', '0000-00-00', '', 'Inactive', '2025-06-13 14:59:15', '2025-07-31 14:31:39'),
(9, 'Global Distributions', 'Mr.', 'Thomas Mann', 'Thomas Mann', 'thomas@globaldgmail.com', 'Technology', 'client', 'Logistics', '77 Collins St, Melbourne, VIC 3000', 'Google Advert', '2025-04-04', '', 'Active', '2025-06-23 14:08:11', '2025-07-31 14:33:41'),
(10, 'FinVerse Systems', 'Mrs.', 'Mrs. Tory', 'Tory', 'finverserse@blockfin.net', 'Technology', 'client', 'Finanical Technology', '123 Tech Ave, San Francisco, CA 94105', 'Google Cloud.', '2025-04-05', '3737377', 'Active', '2025-06-23 14:10:50', '2025-07-31 14:33:24'),
(11, 'IT Vista Group', 'Mr.', 'Mr. Jonathan', 'Jonathan', 'itvita@smartgridhub.com', 'Healthcare', 'leads', 'Information Technology', '12 Banjara Hills, Hyderabad, TS 500034', 'Stripe', '2025-04-05', '02071902345', NULL, '2025-06-23 14:14:11', '2025-08-05 11:08:21'),
(12, 'SensoraTech', 'Mrs.', 'Mrs. Elizabeth', ' Elizabeth', 'sensoratech@autohome.tech', 'Finance', 'client', 'Internet of Things(IoT)mmmmmmmmmmmmmmmmmmmm', '456 Innovation St, Austin, TX 73301', 'SmartThings.', '2025-06-07', '', NULL, '2025-06-23 14:16:30', '2025-07-31 14:32:23'),
(13, 'SkySync Solutions', 'Mr.', 'Mr. Benjamin', ' Benjamin', 'skysync@cloudifytech.com', 'Technology', 'leads', 'Cloud Computing', '789 AI Blvd, New York, NY 10001', 'Microsoft Azure', '2025-04-12', '0167 331 2122', 'Inactive', '2025-06-23 14:20:04', '2025-06-25 14:59:38'),
(15, 'ShopSphere', 'Mrs.', 'Mrs. Margaret', ' Margaret', 'shopsphere@shophub.net', 'Finance', 'leads', 'E-Commerce', '77 Sheikh Zayed Rd, Dubai, UAE', 'Shopify.', '2025-05-08', '559575775424252661', 'Active', '2025-06-23 14:23:10', '2025-06-25 14:59:38'),
(17, 'Aether Intelligences', 'Mr.', 'Alexander', 'Alexander', 'aetherintelligence@visionverse.io', 'Technology', 'leads', 'AI and Machine Learning', '10 High Street, London EC1A 1BB', 'DeepMind', '2025-06-14', '', 'Active', '2025-06-23 14:26:30', '2025-06-25 14:59:38'),
(18, 'CyberFort Defense', 'Mr.', 'Mr. Nathaniel', ' Nathaniel', 'cyberfort@fortressdefense.tech', 'Finance', 'client', 'CyberSecurity', '77 Sheikh Zayed Rd, Dubai, UAE', 'CrowdStrike.', '2025-05-23', '0204 767 9990', 'Active', '2025-06-23 14:28:30', '2025-07-31 14:32:00'),
(19, 'BlockFlow Finance', 'Mrs.', 'Cassandra', 'Cassandra', 'blockflow@cryptowave.tech', 'Finance', 'leads', 'Cryptocurrency', '25 Kings Road, Manchester M1 2AB', 'Ethereum', '2025-06-23', '', 'Inactive', '2025-06-23 14:30:22', '2025-06-25 14:59:38'),
(20, 'LedgerX Solutions', 'Dr.', 'Mr. Victor', 'Victor', 'ledgerx@cryptowave.tech', 'Technology', 'leads', 'CI/CD', '21 Park Street, Kolkata, WB 700016', 'GitLab', '2025-03-12', '1673312122', 'Active', '2025-06-23 14:32:27', '2025-06-25 14:59:38'),
(22, 'NanoPrint Systems', 'Mr.', 'Mr. Xavier', 'Xavier', 'nanoprint@makerstudio.tech', 'Healthcare', 'leads', '3D Printing', '55 Cyber City, Gurgaon, HR 122001', 'MakerBot', '2025-05-23', '0165 555  4544', 'Active', '2025-06-23 14:38:07', '2025-06-25 14:59:38'),
(23, 'Cognitech AI', 'Dr.', 'Raymond', 'Raymond', 'cognitech@robohorizon.tech', 'Technology', 'leads', 'Robotics', '33 Victoria Lane, Liverpool L1 5XD', 'iRobot', '2025-05-26', '0205 778 9990', 'Active', '2025-06-23 14:40:02', '2025-06-25 14:59:38'),
(24, 'PipelineX', 'Mrs.', 'Olivia', 'Olivia', 'pipelinex@webstudio.tech', 'Technology', 'leads', 'Web Development & Design', '102 Marine Drive, Mumbai, MH 400020', 'Wix', '2025-05-31', '0208 889 8590', 'Active', '2025-06-23 14:41:45', '2025-06-25 14:59:38'),
(25, 'GTB', 'Mr.', 'G1280', 'Priya', 'priya.r.patel22@gmail.com', 'Finance', 'client', 'Head of department', '196 High Road', 'Referral', '2025-07-24', '09825133445', 'active', '2025-07-31 13:37:10', '2025-07-31 13:43:17'),
(27, 'Dan', 'Mr.', 'Suber', 'done', 'admin@example.com', 'Technology', 'leads', 'IT support', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:11:51', '2025-07-31 14:11:51'),
(28, 'Piss', 'Dr.', 'BELU', 'done', 'admin@example.com', 'Technology', 'client', 'web developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:13:00', '2025-07-31 14:34:31'),
(29, 'Peleb', 'Mrs.', 'Stone', 'done', 'admin@example.com', 'Technology', 'leads', 'web developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:15:32', '2025-07-31 14:15:32'),
(30, 'Ngozi', 'Mrs.', 'Pen', 'done', 'admin@example.com', 'Technology', 'client', 'web developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:16:19', '2025-07-31 14:34:38'),
(31, 'Rose', 'Mrs.', 'Biro', 'done', 'admin@example.com', 'Technology', 'leads', 'Software Developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:17:21', '2025-07-31 14:17:21'),
(32, 'Tutu', 'Mr.', 'Biro', 'done', 'admin@example.com', 'Technology', 'client', 'Software Developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:17:45', '2025-07-31 14:34:49'),
(33, 'Kent', 'Mrs.', 'Biro', 'done', 'admin@example.com', 'Technology', 'leads', 'Software Developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:18:10', '2025-07-31 14:18:10'),
(34, 'Klip', 'Mrs.', 'Well', 'done', 'admin@example.com', 'Technology', 'client', 'Software Developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:18:57', '2025-07-31 14:34:58'),
(35, 'Lope', 'Mrs.', 'Derr', 'done', 'admin@example.com', 'Technology', 'leads', 'Software Developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:19:34', '2025-07-31 14:19:34'),
(37, 'Rest', 'Mrs.', 'Bed', 'done', 'admin@example.com', 'Technology', 'client', 'Software Developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:20:37', '2025-07-31 14:32:35'),
(38, 'Last', 'Mrs.', 'Reda', 'done', 'admin@example.com', 'Technology', 'leads', 'Software Developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:21:30', '2025-07-31 14:21:30'),
(41, 'Cuy', 'Mrs.', 'Feat', 'done', 'admin@example.com', 'Technology', 'client', 'Software Developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:24:39', '2025-08-05 11:42:47'),
(42, 'Book', 'Mrs.', 'bag', 'done', 'admin@example.com', 'Technology', 'client', 'Software Developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:25:03', '2025-08-05 11:42:17'),
(43, 'Tory', 'Mrs.', 'Burch', 'done', 'admin@example.com', 'Technology', 'client', 'Software Developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:25:38', '2025-07-31 14:35:07'),
(44, 'loius', 'Mrs.', 'Briton', 'done', 'admin@example.com', 'Technology', 'client', 'Software Developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:26:40', '2025-07-31 14:35:18'),
(45, 'shaw', 'Mrs.', 'sdf', 'done', 'admin@example.com', 'Technology', 'client', 'Software Developer', 'No 23,lagos', 'Facebook', '2025-07-11', '12345678', 'active', '2025-07-31 14:27:12', '2025-08-05 11:21:07'),
(46, 'werchanged', 'Mrs.', 'sdewwchanged', 'donechanged', 'admin@example.com', 'Technology', 'client', 'Software Developer', 'No 23,lagos', 'Facebookchanged', '2025-07-11', '12345678', 'active', '2025-07-31 14:27:29', '2025-08-05 11:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `staff_id` varchar(50) NOT NULL,
  `leave_type` varchar(50) NOT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `approved_by` varchar(100) DEFAULT NULL,
  `gender` enum('male','female') NOT NULL,
  `request_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `onboarding`
--

CREATE TABLE `onboarding` (
  `id` int(11) NOT NULL,
  `staff_id` varchar(50) DEFAULT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  `dept_name` varchar(100) DEFAULT NULL,
  `hr_name` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `offer_letter` enum('yes','no') DEFAULT NULL,
  `contract` enum('yes','no') DEFAULT NULL,
  `employee_data_sheet` enum('yes','no') DEFAULT NULL,
  `references_check` enum('yes','no') DEFAULT NULL,
  `nda` enum('yes','no') DEFAULT NULL,
  `laptop` enum('yes','no') DEFAULT NULL,
  `headset` enum('yes','no') DEFAULT NULL,
  `mouse` enum('yes','no') DEFAULT NULL,
  `domain_login` enum('yes','no') DEFAULT NULL,
  `skype_logins` enum('yes','no') DEFAULT NULL,
  `other_logins` text DEFAULT NULL,
  `company_overview` enum('yes','no') DEFAULT NULL,
  `company_culture` enum('yes','no') DEFAULT NULL,
  `tour_premises` enum('yes','no') DEFAULT NULL,
  `staff_intro` enum('yes','no') DEFAULT NULL,
  `peer_mentor` enum('yes','no') DEFAULT NULL,
  `responsibilities_discussed` enum('yes','no') DEFAULT NULL,
  `feedback_comment` text DEFAULT NULL,
  `time_keeping` text DEFAULT NULL,
  `behaviour_integration` text DEFAULT NULL,
  `initial_skills` text DEFAULT NULL,
  `skills_14_learning` text DEFAULT NULL,
  `skills_14_instructions` text DEFAULT NULL,
  `skills_14_review` text DEFAULT NULL,
  `skills_30_learning` text DEFAULT NULL,
  `skills_30_instructions` text DEFAULT NULL,
  `skills_30_review` text DEFAULT NULL,
  `skills_60_learning` text DEFAULT NULL,
  `skills_60_instructions` text DEFAULT NULL,
  `skills_60_review` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `onboarding`
--

INSERT INTO `onboarding` (`id`, `staff_id`, `staff_name`, `dept_name`, `hr_name`, `start_date`, `offer_letter`, `contract`, `employee_data_sheet`, `references_check`, `nda`, `laptop`, `headset`, `mouse`, `domain_login`, `skype_logins`, `other_logins`, `company_overview`, `company_culture`, `tour_premises`, `staff_intro`, `peer_mentor`, `responsibilities_discussed`, `feedback_comment`, `time_keeping`, `behaviour_integration`, `initial_skills`, `skills_14_learning`, `skills_14_instructions`, `skills_14_review`, `skills_30_learning`, `skills_30_instructions`, `skills_30_review`, `skills_60_learning`, `skills_60_instructions`, `skills_60_review`, `created_at`) VALUES
(12, '273', 'DSDS SDDS', 'Childcarechnaged', 'wdwdwd', '2025-08-18', 'yes', 'no', 'yes', 'yes', 'yes', 'yes', '', '', 'yes', 'yes', 'Other Logins', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'Other Logins', 'Other Logins', 'Other Logins', 'Other Logins', 'Other Logins', 'Other Logins', 'Other Logins', 'Other Logins', 'Other Logins', 'Other Logins', 'Other Logins', 'Other Logins', 'Other Logins', '2025-08-07 08:41:11');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(10) NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_completed` enum('Pending','Completed','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `order_date`, `delivery_date`, `total_amount`, `order_completed`, `created_at`, `updated_at`) VALUES
('INV000002', 5, '2025-06-12', '2025-06-12', 6000.00, 'Completed', '2025-06-10 15:02:13', '2025-06-12 09:28:52'),
('INV000003', 5, '2025-06-12', '2025-06-14', 3000.00, 'Rejected', '2025-06-11 12:35:56', '2025-06-12 09:29:00');

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `before_insert_orders` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
  DECLARE last_id INT DEFAULT 0;
  DECLARE new_id VARCHAR(10);

  -- Get the numeric part of the last ID
  SELECT CAST(SUBSTRING(id, 6) AS UNSIGNED)
  INTO last_id
  FROM orders
  WHERE id LIKE 'INV%'
  ORDER BY id DESC
  LIMIT 1;

  -- Generate new ID
  SET last_id = IFNULL(last_id, 0) + 1;
  SET new_id = CONCAT('INV', LPAD(last_id, 6, '0'));

  SET NEW.id = new_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` varchar(10) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) GENERATED ALWAYS AS (`quantity` * `unit_price`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_name`, `stock_id`, `quantity`, `unit_price`) VALUES
(13, 'INV000002', 'Bannana', 1, 2, 1000.00),
(14, 'INV000002', 'biscuit', 2, 2, 2000.00),
(15, 'INV000003', 'Bannana', 1, 1, 1000.00),
(16, 'INV000003', 'biscuit', 2, 1, 2000.00);

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(11) NOT NULL,
  `staff_id` varchar(50) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `basic_salary` decimal(10,2) DEFAULT NULL,
  `attendance_bonus` decimal(10,2) DEFAULT NULL,
  `monthly_bonus` decimal(10,2) DEFAULT NULL,
  `deductions` decimal(10,2) DEFAULT NULL,
  `paye` decimal(10,2) DEFAULT NULL,
  `pension` decimal(10,2) DEFAULT NULL,
  `net_salary` decimal(10,2) DEFAULT NULL,
  `status` enum('paid','unpaid') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `staff_id`, `surname`, `first_name`, `basic_salary`, `attendance_bonus`, `monthly_bonus`, `deductions`, `paye`, `pension`, `net_salary`, `status`, `created_at`) VALUES
(1, '2', 'Moronfolu', 'Gabriel', 50000.00, 10000.00, 20000.00, 500.00, 250.00, 250.00, 78000.00, 'paid', '2025-06-11 08:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `pay_grades`
--

CREATE TABLE `pay_grades` (
  `id` int(11) NOT NULL,
  `level` varchar(100) NOT NULL,
  `pay_grade_name` varchar(255) NOT NULL,
  `gross_salary` decimal(10,2) NOT NULL,
  `paye` decimal(10,2) DEFAULT 0.00,
  `pension` decimal(10,2) NOT NULL,
  `overtime_rate` decimal(10,2) DEFAULT 0.00,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pay_grades`
--

INSERT INTO `pay_grades` (`id`, `level`, `pay_grade_name`, `gross_salary`, `paye`, `pension`, `overtime_rate`, `created_at`) VALUES
(2, '1', 'Junior dev', 150000.00, 10000.00, 10000.00, 10000.00, '2025-06-11 11:18:31'),
(3, '2', 'Mobile Developer', 200000.00, 10000.00, 5000.00, 2500.00, '2025-06-11 11:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `performance_appraisals`
--

CREATE TABLE `performance_appraisals` (
  `id` int(11) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `review_period` varchar(100) NOT NULL,
  `supervisor_name` varchar(255) DEFAULT NULL,
  `staff_id` varchar(100) DEFAULT NULL,
  `performance_date` date NOT NULL,
  `supervisor_position` varchar(255) DEFAULT NULL,
  `demonstrated_knowledge` varchar(10) DEFAULT NULL,
  `demonstrated_knowledge_score` int(11) DEFAULT NULL,
  `demonstrated_knowledge_comment` text DEFAULT NULL,
  `timeliness_of_delivery` varchar(10) DEFAULT NULL,
  `timeliness_of_delivery_score` int(11) DEFAULT NULL,
  `timeliness_of_delivery_comment` text DEFAULT NULL,
  `impact_of_investment` varchar(10) DEFAULT NULL,
  `impact_of_investment_score` int(11) DEFAULT NULL,
  `impact_of_investment_comment` text DEFAULT NULL,
  `achievement_of_goals` varchar(10) DEFAULT NULL,
  `achievement_of_goals_score` int(11) DEFAULT NULL,
  `achievement_of_goals_comment` text DEFAULT NULL,
  `bonus_point_score` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `performance_appraisals`
--

INSERT INTO `performance_appraisals` (`id`, `employee_name`, `review_period`, `supervisor_name`, `staff_id`, `performance_date`, `supervisor_position`, `demonstrated_knowledge`, `demonstrated_knowledge_score`, `demonstrated_knowledge_comment`, `timeliness_of_delivery`, `timeliness_of_delivery_score`, `timeliness_of_delivery_comment`, `impact_of_investment`, `impact_of_investment_score`, `impact_of_investment_comment`, `achievement_of_goals`, `achievement_of_goals_score`, `achievement_of_goals_comment`, `bonus_point_score`, `created_at`) VALUES
(1, 'Staff', '3 months', 'Hod', '12345', '2025-06-11', 'Pos', 'P(0)', 1, 'hi', 'P(0)', 1, '', 'NI(3)', 2, '', 'VG(9)', 4, '', 0, '2025-06-11 12:12:54');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `supervisor_id` int(11) NOT NULL,
  `status` enum('Pending','Ongoing','Completed') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `start_date`, `due_date`, `supervisor_id`, `status`, `created_at`, `updated_at`) VALUES
(17, 'get_clients2.php', '2025-08-12', '2025-08-13', 273, 'Pending', '2025-08-07 08:59:41', '2025-08-07 08:59:41');

-- --------------------------------------------------------

--
-- Table structure for table `project_assignees`
--

CREATE TABLE `project_assignees` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_assignees`
--

INSERT INTO `project_assignees` (`project_id`, `user_id`) VALUES
(17, 273);

-- --------------------------------------------------------

--
-- Table structure for table `project_budgets`
--

CREATE TABLE `project_budgets` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `cost_type` enum('Direct','Indirect') NOT NULL,
  `cost_item` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `assignee` int(11) DEFAULT NULL,
  `edit_assignee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_budgets`
--

INSERT INTO `project_budgets` (`id`, `project_id`, `cost_type`, `cost_item`, `amount`, `description`, `created_at`, `updated_at`, `assignee`, `edit_assignee`) VALUES
(15, 17, 'Direct', 'Cost Item', 444.00, 'Note', '2025-08-07 09:02:59', '2025-08-07 09:02:59', 1, NULL),
(16, 17, 'Direct', 'Cost Item', 444.00, 'NoteNote', '2025-08-07 09:03:13', '2025-08-07 09:03:13', 1, NULL),
(17, 17, 'Indirect', 'Cost Item', 44.00, 'Note', '2025-08-07 09:03:41', '2025-08-07 09:03:41', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `access` enum('admin','user','guest') DEFAULT 'user',
  `password` varchar(255) NOT NULL,
  `staff_id` varchar(50) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `profile_picture` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `firstname`, `lastname`, `email`, `role`, `phonenumber`, `access`, `password`, `staff_id`, `position`, `profile_picture`, `created_at`) VALUES
(1, 'Admin', 'User', 'admin@example.com', 'System Administrator', '1234567890', 'admin', '$2y$10$bFthWA83/bGMuEw8N1DS2.d6dZf6BWoGCHv2HYIK9yphc6EQYHIKy', 'STAFF001', 'Administrator', NULL, '2025-06-06 20:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `stock_id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `size` varchar(100) DEFAULT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total_price` decimal(14,2) NOT NULL,
  `description` text DEFAULT NULL,
  `reorder_trigger` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `colour` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`stock_id`, `item`, `size`, `unit_price`, `qty`, `total_price`, `description`, `reorder_trigger`, `created_at`, `updated_at`, `colour`) VALUES
(1, 'Bannana', 'medium', 1000.00, 1, 5000.00, 'ananas', '30', '2025-06-09 13:15:19', '2025-08-07 09:16:44', 'Red'),
(2, 'biscuit', 'large', 2000.00, 5, 20000.00, 'note', '30', '2025-06-09 14:14:07', '2025-08-07 08:58:40', 'White'),
(4, 'bread', 'medium', 1000.00, 39, 50000.00, 'here', '30', '2025-06-09 14:53:03', '2025-08-07 09:17:34', 'Yellow'),
(7, 'Bread', 'large', 109.00, 56, 2616.00, 'Fresh like tomato jos', '46', '2025-08-01 09:02:51', '2025-08-01 09:20:44', 'Blue');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` varchar(10) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `last_name`, `first_name`, `email`, `phone_number`, `created_at`, `updated_at`, `name`, `address`) VALUES
('SUP0002', 'TEST2', 'TEST2', 'TEST2', 'TEST2', '2025-08-07 09:13:14', '2025-08-07 09:13:14', 'TEST2', 'TEST2');

--
-- Triggers `suppliers`
--
DELIMITER $$
CREATE TRIGGER `before_insert_supplier` BEFORE INSERT ON `suppliers` FOR EACH ROW BEGIN
  DECLARE last_id INT DEFAULT 0;
  DECLARE new_id VARCHAR(10);

  -- Get the numeric part of the last ID
  SELECT CAST(SUBSTRING(id, 4) AS UNSIGNED)
  INTO last_id
  FROM suppliers
  WHERE id LIKE 'SUP%'
  ORDER BY id DESC
  LIMIT 1;

  -- Generate new ID
  SET last_id = IFNULL(last_id, 0) + 1;
  SET new_id = CONCAT('SUP', LPAD(last_id, 4, '0'));

  SET NEW.id = new_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_orders`
--

CREATE TABLE `supplier_orders` (
  `id` varchar(10) NOT NULL,
  `supplier_id` varchar(10) NOT NULL,
  `order_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_completed` enum('Pending','Completed','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_orders`
--

INSERT INTO `supplier_orders` (`id`, `supplier_id`, `order_date`, `delivery_date`, `total_amount`, `order_completed`, `created_at`, `updated_at`) VALUES
('SUPV000001', 'SUP0002', '2025-08-22', '2025-08-15', 2000.00, 'Completed', '2025-08-07 09:17:34', '2025-08-07 09:17:34');

--
-- Triggers `supplier_orders`
--
DELIMITER $$
CREATE TRIGGER `before_insert_supplier_orders` BEFORE INSERT ON `supplier_orders` FOR EACH ROW BEGIN
  DECLARE last_id INT DEFAULT 0;
  DECLARE new_id VARCHAR(10);

  -- Get the numeric part of the last ID
  SELECT CAST(SUBSTRING(id, 6) AS UNSIGNED)
  INTO last_id
  FROM supplier_orders
  WHERE id LIKE 'SUPV%'
  ORDER BY id DESC
  LIMIT 1;

  -- Generate new ID
  SET last_id = IFNULL(last_id, 0) + 1;
  SET new_id = CONCAT('SUPV', LPAD(last_id, 6, '0'));

  SET NEW.id = new_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_order_items`
--

CREATE TABLE `supplier_order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` varchar(10) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) GENERATED ALWAYS AS (`quantity` * `unit_price`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_order_items`
--

INSERT INTO `supplier_order_items` (`id`, `order_id`, `item_name`, `stock_id`, `quantity`, `unit_price`) VALUES
(36, 'SUPV000001', 'bread', 4, 2, 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_returns`
--

CREATE TABLE `supplier_returns` (
  `id` varchar(20) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `order_date` date NOT NULL,
  `supplier_id` varchar(10) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `return_reason` varchar(255) DEFAULT NULL,
  `return_status` varchar(50) DEFAULT NULL,
  `return_completed` enum('Pending','Completed','Rejected') DEFAULT 'Pending',
  `received_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `supplier_returns`
--
DELIMITER $$
CREATE TRIGGER `before_insert_supplier_returns` BEFORE INSERT ON `supplier_returns` FOR EACH ROW BEGIN
  DECLARE last_id INT DEFAULT 0;
  DECLARE new_id VARCHAR(10);

  -- Get the numeric part of the last ID
  SELECT CAST(SUBSTRING(id, 6) AS UNSIGNED)
  INTO last_id
  FROM supplier_returns
  WHERE id LIKE 'RETS%'
  ORDER BY id DESC
  LIMIT 1;

  -- Generate new ID
  SET last_id = IFNULL(last_id, 0) + 1;
  SET new_id = CONCAT('RETS', LPAD(last_id, 6, '0'));

  SET NEW.id = new_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_return_items`
--

CREATE TABLE `supplier_return_items` (
  `id` int(11) NOT NULL,
  `order_item_id` int(10) UNSIGNED NOT NULL,
  `return_id` varchar(20) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) GENERATED ALWAYS AS (`quantity` * `unit_price`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `due_date` date NOT NULL,
  `priority` enum('Low','Medium','High') NOT NULL DEFAULT 'Medium',
  `status` enum('Pending','Ongoing','Completed') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_assignees`
--

CREATE TABLE `task_assignees` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timesheet`
--

CREATE TABLE `timesheet` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` text DEFAULT 'N/A',
  `type` enum('NT','OT') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timesheet`
--

INSERT INTO `timesheet` (`id`, `staff_id`, `time_in`, `time_out`, `date`, `note`, `type`) VALUES
(1, 1, '16:36:00', '16:43:00', '2025-06-08', 'hi', 'NT'),
(2, 1, '16:44:00', '16:47:00', '2025-06-08', 'YO', 'OT'),
(3, 1, '13:25:00', '13:25:00', '2025-06-19', 'Review ', 'NT'),
(4, 1, '14:53:00', '15:41:00', '2025-07-31', 'Sample data for wemimo', 'NT');

-- --------------------------------------------------------

--
-- Table structure for table `trainings`
--

CREATE TABLE `trainings` (
  `id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `training_type` enum('general','technical','specific') NOT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `training_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `customer_returns`
--
ALTER TABLE `customer_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_returns_lead` (`client_id`),
  ADD KEY `fk_customer_returns_order` (`order_id`);

--
-- Indexes for table `customer_return_items`
--
ALTER TABLE `customer_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `fk_customer_return_item_stock_id` (`stock_id`),
  ADD KEY `fk_customer_returns_order_items_id` (`order_item_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_issues_project` (`project_id`),
  ADD KEY `fk_issues_user` (`user_id`),
  ADD KEY `fk_issues_edit_user` (`edit_user_id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `onboarding`
--
ALTER TABLE `onboarding`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_client_id` (`client_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_grades`
--
ALTER TABLE `pay_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `performance_appraisals`
--
ALTER TABLE `performance_appraisals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Indexes for table `project_assignees`
--
ALTER TABLE `project_assignees`
  ADD PRIMARY KEY (`project_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `project_budgets`
--
ALTER TABLE `project_budgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `fk_budgets_assignee` (`assignee`),
  ADD KEY `edit_assignee` (`edit_assignee`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `idx_item` (`item`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `supplier_orders`
--
ALTER TABLE `supplier_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_supplier_id` (`supplier_id`);

--
-- Indexes for table `supplier_order_items`
--
ALTER TABLE `supplier_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`);

--
-- Indexes for table `supplier_returns`
--
ALTER TABLE `supplier_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_supplier_returns_lead` (`supplier_id`),
  ADD KEY `fk_supplier_returns_order` (`order_id`);

--
-- Indexes for table `supplier_return_items`
--
ALTER TABLE `supplier_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `fk_suppliers_return_item_stock_id` (`stock_id`),
  ADD KEY `fk_suppliers_returns_order_items_id` (`order_item_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `task_assignees`
--
ALTER TABLE `task_assignees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `timesheet`
--
ALTER TABLE `timesheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer_return_items`
--
ALTER TABLE `customer_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `onboarding`
--
ALTER TABLE `onboarding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pay_grades`
--
ALTER TABLE `pay_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `performance_appraisals`
--
ALTER TABLE `performance_appraisals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `project_budgets`
--
ALTER TABLE `project_budgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `supplier_order_items`
--
ALTER TABLE `supplier_order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `supplier_return_items`
--
ALTER TABLE `supplier_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `task_assignees`
--
ALTER TABLE `task_assignees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `timesheet`
--
ALTER TABLE `timesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trainings`
--
ALTER TABLE `trainings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_returns`
--
ALTER TABLE `customer_returns`
  ADD CONSTRAINT `fk_customer_returns_lead` FOREIGN KEY (`client_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_customer_returns_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_return_items`
--
ALTER TABLE `customer_return_items`
  ADD CONSTRAINT `customer_return_items_ibfk_1` FOREIGN KEY (`return_id`) REFERENCES `customer_returns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_return_items_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `customer_returns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_customer_return_item_stock` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_customer_return_item_stock_id` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`),
  ADD CONSTRAINT `fk_customer_returns_order_items` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_customer_returns_order_items_id` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`);

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `fk_issues_edit_user` FOREIGN KEY (`edit_user_id`) REFERENCES `staffs` (`id`),
  ADD CONSTRAINT `fk_issues_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_issues_user` FOREIGN KEY (`user_id`) REFERENCES `staffs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_client` FOREIGN KEY (`client_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_assignees`
--
ALTER TABLE `project_assignees`
  ADD CONSTRAINT `project_assignees_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_assignees_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_budgets`
--
ALTER TABLE `project_budgets`
  ADD CONSTRAINT `fk_budgets_assignee` FOREIGN KEY (`assignee`) REFERENCES `staffs` (`id`),
  ADD CONSTRAINT `project_budgets_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_budgets_ibfk_2` FOREIGN KEY (`edit_assignee`) REFERENCES `staffs` (`id`);

--
-- Constraints for table `supplier_orders`
--
ALTER TABLE `supplier_orders`
  ADD CONSTRAINT `fk_supplier_orders_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supplier_order_items`
--
ALTER TABLE `supplier_order_items`
  ADD CONSTRAINT `fk_supplier_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `supplier_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supplier_returns`
--
ALTER TABLE `supplier_returns`
  ADD CONSTRAINT `fk_supplier_returns_order` FOREIGN KEY (`order_id`) REFERENCES `supplier_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_supplier_returns_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supplier_return_items`
--
ALTER TABLE `supplier_return_items`
  ADD CONSTRAINT `fk_suppliers_return_item_stock_id` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`),
  ADD CONSTRAINT `fk_suppliers_returns_order_items_id` FOREIGN KEY (`order_item_id`) REFERENCES `supplier_order_items` (`id`),
  ADD CONSTRAINT `supplier_return_items_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `supplier_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_assignees`
--
ALTER TABLE `task_assignees`
  ADD CONSTRAINT `task_assignees_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_assignees_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `timesheet`
--
ALTER TABLE `timesheet`
  ADD CONSTRAINT `timesheet_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
