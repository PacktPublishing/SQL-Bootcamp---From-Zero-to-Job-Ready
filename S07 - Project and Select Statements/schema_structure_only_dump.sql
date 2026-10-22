CREATE DATABASE  IF NOT EXISTS `pizzashop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pizzashop`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
-- Host: 127.0.0.1    Database: pizzashop
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Table structure for table `Assets`

DROP TABLE IF EXISTS `Assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assets` (
  `asset_id` int NOT NULL,
  `asset_name` varchar(100) DEFAULT NULL,
  `asset_type` varchar(50) DEFAULT NULL,
  `asset_status` enum('Active','Inactive','Under Maintenance') DEFAULT NULL,
  `deployed_branch_id` int DEFAULT NULL,
  `asset_cost` decimal(10,2) DEFAULT NULL,
  `depreciation_percent` decimal(5,2) DEFAULT NULL,
  `deployment_date` date DEFAULT NULL,
  PRIMARY KEY (`asset_id`),
  KEY `deployed_branch_id` (`deployed_branch_id`),
  CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`deployed_branch_id`) REFERENCES `Branch_Data` (`Branch_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `Branch_Data`

DROP TABLE IF EXISTS `Branch_Data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branch_Data` (
  `Branch_ID` int NOT NULL,
  `Branch_manager_id` int DEFAULT NULL,
  `Branch_name` varchar(100) DEFAULT NULL,
  `Branch_city` varchar(100) DEFAULT NULL,
  `Branch_Open_Date` timestamp NULL DEFAULT NULL,
  `Branch_status` enum('Active','Inactive') DEFAULT NULL,
  `Branch_address` varchar(255) DEFAULT NULL,
  `Branch_Investment_cost` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`Branch_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `customer_support`

DROP TABLE IF EXISTS `customer_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_support` (
  `ticket_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `contact_channel` varchar(50) DEFAULT NULL,
  `date_timeofcontact` timestamp NULL DEFAULT NULL,
  `VOC` varchar(255) DEFAULT NULL,
  `contact_type` varchar(15) DEFAULT NULL,
  `time_taken_in_sec` int DEFAULT NULL,
  `ticket_status` varchar(15) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `support_ratings` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `customer_support_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers_info` (`Customer_ID`),
  CONSTRAINT `customer_support_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Employee_Data` (`Emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `Customers_info`

DROP TABLE IF EXISTS `Customers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers_info` (
  `Customer_ID` int NOT NULL,
  `Customer_name` varchar(100) DEFAULT NULL,
  `Year_of_birth` int DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Mobile_number` varchar(15) DEFAULT NULL,
  `Email_address` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `SignUp_timestamp` timestamp NULL DEFAULT NULL,
  `Last_login_timestamp` timestamp NULL DEFAULT NULL,
  `App_user_Y_N` char(1) DEFAULT NULL,
  `Customer_type_P_Non_P` varchar(10) DEFAULT NULL,
  `Acquisition_campaign` varchar(50) DEFAULT NULL,
  `Signup_Month` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `Deliveries`

DROP TABLE IF EXISTS `Deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Deliveries` (
  `Delivery_ID` int NOT NULL,
  `Order_ID` int DEFAULT NULL,
  `Delivery_by` varchar(50) DEFAULT NULL,
  `Delivery_start_timestamp` timestamp NULL DEFAULT NULL,
  `Delivery_end_timestamp` timestamp NULL DEFAULT NULL,
  `Delivery_status` varchar(50) DEFAULT NULL,
  `Delivery_ratings` int DEFAULT NULL,
  PRIMARY KEY (`Delivery_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `Employee_Data`

DROP TABLE IF EXISTS `Employee_Data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee_Data` (
  `Emp_ID` int NOT NULL,
  `Employee_name` varchar(100) DEFAULT NULL,
  `Employee_Gender` enum('Male','Female') DEFAULT NULL,
  `Employee_DOB` date DEFAULT NULL,
  `Employee_address` varchar(255) DEFAULT NULL,
  `Employee_DOJ` date DEFAULT NULL,
  `Emp_Mobile_Number` varchar(15) DEFAULT NULL,
  `Employee_Email_ID` varchar(100) DEFAULT NULL,
  `Employment_Type` varchar(50) DEFAULT NULL,
  `Employee_Employment_status` enum('Active','Inactive') DEFAULT NULL,
  `Current_Annual_Cost` decimal(15,2) DEFAULT NULL,
  `Employment_level` varchar(50) DEFAULT NULL,
  `Reporting_manager_ID` int DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Branch_ID` int DEFAULT NULL,
  `Job_Title` varchar(50) DEFAULT NULL,
  `Manager_Non_Manager_tag` enum('Manager','Non-Manager') DEFAULT NULL,
  PRIMARY KEY (`Emp_ID`),
  KEY `Branch_ID` (`Branch_ID`),
  CONSTRAINT `employee_data_ibfk_1` FOREIGN KEY (`Branch_ID`) REFERENCES `Branch_Data` (`Branch_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `finance_transactions`

DROP TABLE IF EXISTS `finance_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_transactions` (
  `Orders_ID` int NOT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Order_timestamp` timestamp NULL DEFAULT NULL,
  `Product_ID` int DEFAULT NULL,
  `Bundle_Y_N` char(1) DEFAULT NULL,
  `Bundle_ID` int DEFAULT NULL,
  `Payment_method` varchar(50) DEFAULT NULL,
  `Payment_status` varchar(50) DEFAULT NULL,
  `Amount_in_USD` decimal(10,2) DEFAULT NULL,
  `VAT` decimal(10,4) DEFAULT NULL,
  `Bill_Amount` decimal(10,4) DEFAULT NULL,
  `tax_rate` decimal(4,2) DEFAULT NULL,
  `campaign_ID` int DEFAULT NULL,
  PRIMARY KEY (`Orders_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Product_ID` (`Product_ID`),
  KEY `Bundle_ID` (`Bundle_ID`),
  CONSTRAINT `finance_transactions_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `Customers_info` (`Customer_ID`),
  CONSTRAINT `finance_transactions_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `products` (`Product_ID`),
  CONSTRAINT `finance_transactions_ibfk_3` FOREIGN KEY (`Bundle_ID`) REFERENCES `product_bundles` (`Bundle_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `Inventory`

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inventory` (
  `Item_id` int NOT NULL,
  `Item_Name` varchar(100) DEFAULT NULL,
  `Item_type_v_nv` enum('Vegetarian','Non-Vegetarian') DEFAULT NULL,
  `no_of_items_in_stock` int DEFAULT NULL,
  `purchase_date` timestamp NULL DEFAULT NULL,
  `expiry_date` timestamp NULL DEFAULT NULL,
  `purchase_cost` decimal(10,2) DEFAULT NULL,
  `usage_type` varchar(50) DEFAULT NULL,
  `usage_product_id` int DEFAULT NULL,
  `supplier_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Item_id`),
  KEY `usage_product_id` (`usage_product_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`usage_product_id`) REFERENCES `products` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `Marketing_Campaigns`

DROP TABLE IF EXISTS `Marketing_Campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Marketing_Campaigns` (
  `Campaign_ID` int NOT NULL,
  `Campaign_start_Timestamp` timestamp NULL DEFAULT NULL,
  `Campaign_end_Timestamp` timestamp NULL DEFAULT NULL,
  `Campaign_name` varchar(100) DEFAULT NULL,
  `Channel` varchar(50) DEFAULT NULL,
  `Impressions` int DEFAULT NULL,
  `No_of_clicks` int DEFAULT NULL,
  `Campaign_type` varchar(50) DEFAULT NULL,
  `Campaign_format` varchar(50) DEFAULT NULL,
  `Campaign_target_location` varchar(100) DEFAULT NULL,
  `Campaign_target_age_group` varchar(20) DEFAULT NULL,
  `campaign_budget` decimal(10,2) DEFAULT NULL,
  `campaign_spend` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Campaign_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `Orders_info`

DROP TABLE IF EXISTS `Orders_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders_info` (
  `Orders_ID` int NOT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Order_timestamp` timestamp NULL DEFAULT NULL,
  `consumption_type` varchar(50) DEFAULT NULL,
  `order_channel` varchar(50) DEFAULT NULL,
  `Product_ID` int DEFAULT NULL,
  `Bundle_Y_N` char(1) DEFAULT NULL,
  `Bundle_ID` int DEFAULT NULL,
  `Emp_ID` int DEFAULT NULL,
  `Branch_ID` int DEFAULT NULL,
  `Delivery_Y_N` char(1) DEFAULT NULL,
  `Delivery_ID` int DEFAULT NULL,
  `Customer_Rating` int DEFAULT NULL,
  `Payment_method` varchar(50) DEFAULT NULL,
  `Payment_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Orders_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Product_ID` (`Product_ID`),
  KEY `Bundle_ID` (`Bundle_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Branch_ID` (`Branch_ID`),
  KEY `Delivery_ID` (`Delivery_ID`),
  CONSTRAINT `orders_info_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `Customers_info` (`Customer_ID`),
  CONSTRAINT `orders_info_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `products` (`Product_ID`),
  CONSTRAINT `orders_info_ibfk_3` FOREIGN KEY (`Bundle_ID`) REFERENCES `product_bundles` (`Bundle_ID`),
  CONSTRAINT `orders_info_ibfk_4` FOREIGN KEY (`Emp_ID`) REFERENCES `Employee_Data` (`Emp_ID`),
  CONSTRAINT `orders_info_ibfk_5` FOREIGN KEY (`Branch_ID`) REFERENCES `Branch_Data` (`Branch_ID`),
  CONSTRAINT `orders_info_ibfk_6` FOREIGN KEY (`Delivery_ID`) REFERENCES `Deliveries` (`Delivery_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `product_bundles`

DROP TABLE IF EXISTS `product_bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundles` (
  `Bundle_ID` int NOT NULL,
  `Bundle_name` varchar(100) DEFAULT NULL,
  `Product_IDs` varchar(100) DEFAULT NULL,
  `Bundle_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Bundle_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `products`

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `Product_ID` int NOT NULL,
  `Product_name` varchar(100) DEFAULT NULL,
  `Product_type` varchar(50) DEFAULT NULL,
  `Product_size` varchar(50) DEFAULT NULL,
  `Ingridiants_ID` int DEFAULT NULL,
  `ingridiants_name` varchar(100) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Cogs` decimal(10,2) DEFAULT NULL,
  `Launch_year` int DEFAULT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-04 14:11:32
