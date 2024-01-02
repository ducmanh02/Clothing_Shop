-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: clothing_shop
-- ------------------------------------------------------
-- Server version	8.0.32

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

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `brand_id` varchar(50) NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `brand_name` (`brand_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES ('BR01','360Clothes'),('BR03','Routine'),('BR02','Uniqlo');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT 'Active',
  PRIMARY KEY (`cart_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('CRT01','USR01','2024-01-01 15:34:44','Active'),('CRT02','USR02','2024-01-02 02:31:00','Active'),('CRT03','USR03','2024-01-02 02:33:07','Active'),('CRT04','USR05','2024-01-02 02:55:45','Active'),('CRT05','USR06','2024-01-02 02:55:55','Active'),('CRT06','USR04','2024-01-02 03:35:37','Active');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `cart_item_id` varchar(50) NOT NULL,
  `cart_id` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `cart_id` (`cart_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` varchar(50) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('CA05','Áo Khoác'),('CA01','hoodie'),('CA02','Quần Jean'),('CA04','Sơ Mi'),('CA03','T-Shirt');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`feedback_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES ('FDB01','USR02','PR01',5,'áo đẹp','2024-01-02 02:58:12'),('FDB02','USR05','PR02',4,'áo rất ok','2024-01-02 03:06:50'),('FDB03','USR05','PR05',5,'Áo ấm lắm','2024-01-02 03:07:41'),('FDB04','USR05','PR09',5,'ok','2024-01-02 03:21:57');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` varchar(50) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_items_ibfk_1` (`order_id`),
  KEY `order_items_ibfk_2` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES ('ORD_ITEM01','ORD01','PR11',4,120.00),('ORD_ITEM02','ORD02','PR01',6,180.00),('ORD_ITEM03','ORD03','PR11',3,90.00),('ORD_ITEM04','ORD03','PR18',3,60.00),('ORD_ITEM05','ORD04','PR22',2,40.00),('ORD_ITEM06','ORD05','PR15',2,60.00),('ORD_ITEM07','ORD06','PR02',1,30.00),('ORD_ITEM08','ORD06','PR06',2,60.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`order_id`),
  KEY `orders_ibfk_1` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('ORD01','USR02',120.00,'2024-01-02 02:57:21','Delivered'),('ORD02','USR05',180.00,'2024-01-02 03:06:20','Shipped'),('ORD03','USR05',150.00,'2024-01-02 03:21:50','Pending'),('ORD04','USR06',40.00,'2024-01-02 03:24:14','Pending'),('ORD05','USR05',60.00,'2024-01-02 03:41:09','Pending'),('ORD06','USR02',90.00,'2024-01-02 05:55:58','Pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  `brand_id` varchar(50) NOT NULL,
  `category_id` varchar(50) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `products_ibfk_1` (`brand_id`),
  KEY `products_ibfk_2` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('PR01','Áo Hoodie 01','Kết cấu mịn với lớp lót chống vón cục. Mũ trùm đầu có kiểu dáng đường viền đầy phong cách.',30.00,44,'BR02','CA01','asset\\img_product\\hoodie-uniqlo-1.avif','M'),('PR02','Áo Hoodie 02','Kết cấu mịn với lớp lót chống vón cục. Mũ trùm đầu có kiểu dáng đường viền đầy phong cách.',30.00,50,'BR02','CA01','asset\\img_product\\hoodie-uniqlo-2.avif','S'),('PR03','Áo Hoodie 03','Kết cấu mịn với lớp lót chống vón cục. Mũ trùm đầu có kiểu dáng đường viền đầy phong cách.',30.00,50,'BR02','CA01','asset\\img_product\\hoodie-uniqlo-3.avif','S'),('PR04','Áo Hoodie 04','Kết cấu mịn với lớp lót chống vón cục. Mũ trùm đầu có kiểu dáng đường viền đầy phong cách.',30.00,50,'BR02','CA01','asset\\img_product\\hoodie-uniqlo-4.avif','S'),('PR05','Áo Khoác 1',' Đặc tính : “Kiểu áo: Gile phao thiết kế nhồi bông ngang bản 12cm. Khóa kéo trước , bản khóa to khỏe khoắn Sản phẩm siêu nhẹ mỏng nhưng mặc siêu ấm và cực kì thoải mái Sản phẩm được may bởi lớp vải trơn, nhồi lớp bông nhân tạo cao cấp giúp giữ ấm lưng , ngực mà vẫn gọn gàng. Thân trước có 2 túi cơi, bên trong có 1 túi cơi lót. Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',30.00,50,'BR01','CA05','asset\\img_product\\aokhoac1.jpg','S'),('PR06','Áo Khoác 2',' Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',30.00,50,'BR01','CA05','asset\\img_product\\aokhoac2.jpg','S'),('PR07','Áo Khoác 3',' Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',30.00,50,'BR01','CA05','asset\\img_product\\aokhoac3.jpg','S'),('PR08','Áo Khoác 4',' Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',30.00,50,'BR03','CA05','asset\\img_product\\aokhoac4.jpg','S'),('PR09','Áo Khoác 5',' Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',30.00,50,'BR01','CA05','asset\\img_product\\aokhoac5.jpg','S'),('PR10','Áo Khoác 6',' Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',30.00,50,'BR01','CA05','asset\\img_product\\aokhoac6.jpg','S'),('PR11','Áo Khoác 7',' Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',35.00,46,'BR01','CA05','asset\\img_product\\aokhoac7.jpg','S'),('PR12','Áo Khoác 8',' Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',30.00,50,'BR01','CA05','asset\\img_product\\aokhoac8.jpg','S'),('PR13','Áo Khoác 9',' Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',30.00,50,'BR01','CA05','asset\\img_product\\aokhoac9.jpg','S'),('PR14','Áo Khoác 10',' Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',30.00,50,'BR02','CA05','asset\\img_product\\aokhoac-uniqlo-1.avif','S'),('PR15','Áo Khoác 11',' Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',30.00,50,'BR02','CA05','asset\\img_product\\aokhoac-uniqlo-2.avif','S'),('PR16','Áo Khoác 12',' Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',30.00,50,'BR01','CA05','asset\\img_product\\aokhoac-uniqlo-3.avif','S'),('PR17','Áo Khoác 13',' Chất liệu: Lớp ngoài là vải gió với tính năng chống thấm nước, chống bụi bẩn, chống bám mốc, cản gió, giữ ấm cơ thể. Gấu áo có dây luồn chốt chặn giúp áo linh động hơn trong quá trình sử dụng ”',30.00,50,'BR01','CA05','asset\\img_product\\aokhoac-uniqlo-4.avif','S'),('PR18','T-Shirt 1','Chất liệu vải có trọng lượng tương đối sẽ khiến bạn yêu thích và sử dụng nhiều hơn. Kiểu dáng rộng rãi.',20.00,50,'BR02','CA03','asset\\img_product\\t-shirt-uniqlo1.avif','S'),('PR19','T-Shirt 2','Chất liệu vải có trọng lượng tương đối sẽ khiến bạn yêu thích và sử dụng nhiều hơn. Kiểu dáng rộng rãi.',20.00,50,'BR02','CA03','asset\\img_product\\t-shirt-uniqlo2.avif','S'),('PR20','T-Shirt 3','Chất liệu vải có trọng lượng tương đối sẽ khiến bạn yêu thích và sử dụng nhiều hơn. Kiểu dáng rộng rãi.',20.00,50,'BR02','CA03','asset\\img_product\\t-shirt-uniqlo3.avif','L'),('PR21','T-Shirt 4','Chất liệu vải có trọng lượng tương đối sẽ khiến bạn yêu thích và sử dụng nhiều hơn. Kiểu dáng rộng rãi.',20.00,50,'BR01','CA05','asset\\img_product\\t-shirt-uniqlo4.avif','S'),('PR22','T-Shirt 5','Chất liệu vải có trọng lượng tương đối sẽ khiến bạn yêu thích và sử dụng nhiều hơn. Kiểu dáng rộng rãi.',20.00,50,'BR02','CA03','asset\\img_product\\t-shirt-uniqlo5.avif','S'),('PR23','T-Shirt 6','Chất liệu vải có trọng lượng tương đối sẽ khiến bạn yêu thích và sử dụng nhiều hơn. Kiểu dáng rộng rãi.',20.00,50,'BR01','CA03','asset\\img_product\\t-shirt-uniqlo6.avif','S'),('PR24','Quần 1','Chiếc quần jeans với kiểu dáng cổ điển ôm gọn nhưng vẫn giữ được sự thoải mái. Co giãn tuyệt vời cho phù hợp thoải mái.',20.00,50,'BR03','CA02','asset\\img_product\\quan1.jpg','L'),('PR25','Quần 2','Chiếc quần jeans với kiểu dáng cổ điển ôm gọn nhưng vẫn giữ được sự thoải mái. Co giãn tuyệt vời cho phù hợp thoải mái.',20.00,50,'BR03','CA02','asset\\img_product\\quan2.jpg','S');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('USR01','admin','$2a$10$FbzsharSr4fO.GveV4lo5ejcSJ7WMy1QYV73Q/dQwCaVqDzubNtz2','ducmanhhhboy@gmail.com','Tran Duc Manh','Dong Lo','+84386330978',1),('USR02','manh','$2a$10$TSRBT8ltdNGsHPbb8WjHbu1RSyXzMAvvhRsR4r7dTQXsX9dhsTJhu','ducmanh@gmail.com','Duc Manh Tran','HIEP HOA','123456789',0),('USR03','user1','$2a$10$noH.LTsWK2zfvdhWvcXRBOfN1BGsztUCxm/G4E.p2NehSAIqW.TkW','','','','',0),('USR04','ducmanh','$2a$10$MyvF6vMmq8txMvmWiMyiI.8bt2pmnU30qY5uWpRERL9xb0Okcxgyy','ducmanhhhboy@gmail.com','Tran Duc Manh','Dong Lo','+84386330978',0),('USR05','user2','$2a$10$kxSPuHkV5sqAhzjjUjGfQeBg79r25Z9lnJMJsgOoEGmCMFnL03nGO','123@gmail.com','Duc Manh Tran','Bac Giang','123456789',0),('USR06','user3','$2a$10$vAXTdrs0pzA0xUYbBffuPenvMASpg73oCGlNe5vSFszAHJyjGpyvy','123@gmail.com','Henry T','Ha Noi','123456789',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-02 19:15:07
