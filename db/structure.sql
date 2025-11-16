/*M!999999\- enable the sandbox mode */ 

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;
DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `developers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `developers` (
  `developer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`developer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `follower_id` int NOT NULL,
  `followed_id` int NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`follower_id`,`followed_id`),
  KEY `fk_rails_5ef72a3867` (`followed_id`),
  CONSTRAINT `fk_rails_5ef72a3867` FOREIGN KEY (`followed_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_rails_622d34a301` FOREIGN KEY (`follower_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `game_developers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_developers` (
  `game_id` int NOT NULL,
  `developer_id` int NOT NULL,
  PRIMARY KEY (`game_id`,`developer_id`),
  KEY `index_game_developers_on_game_id` (`game_id`),
  KEY `index_game_developers_on_developer_id` (`developer_id`),
  CONSTRAINT `fk_rails_287ef661d2` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `fk_rails_ec198059e2` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`developer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `game_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_genres` (
  `game_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`game_id`,`genre_id`),
  KEY `index_game_genres_on_game_id` (`game_id`),
  KEY `index_game_genres_on_genre_id` (`genre_id`),
  CONSTRAINT `fk_rails_c26a013c96` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `fk_rails_e760a0ff73` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `game_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_platforms` (
  `game_id` int NOT NULL,
  `platform_id` int NOT NULL,
  PRIMARY KEY (`game_id`,`platform_id`),
  KEY `index_game_platforms_on_game_id` (`game_id`),
  KEY `index_game_platforms_on_platform_id` (`platform_id`),
  CONSTRAINT `fk_rails_148d8deb91` FOREIGN KEY (`platform_id`) REFERENCES `platforms` (`platform_id`),
  CONSTRAINT `fk_rails_b0825e253b` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `game_publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_publishers` (
  `game_id` int NOT NULL,
  `publisher_id` int NOT NULL,
  PRIMARY KEY (`game_id`,`publisher_id`),
  KEY `index_game_publishers_on_game_id` (`game_id`),
  KEY `index_game_publishers_on_publisher_id` (`publisher_id`),
  CONSTRAINT `fk_rails_0841328a3b` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`publisher_id`),
  CONSTRAINT `fk_rails_3144a1efd9` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `game_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_users` (
  `game_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`game_id`,`user_id`),
  KEY `index_game_users_on_game_id` (`game_id`),
  KEY `index_game_users_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_2a73dba9dd` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_rails_e6cf04db31` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `game_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `summary` text,
  `cover_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `list_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_entries` (
  `list_id` int NOT NULL,
  `game_id` int NOT NULL,
  `sort_order` int DEFAULT NULL,
  `added_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`game_id`,`list_id`),
  KEY `index_list_entries_on_list_id` (`list_id`),
  KEY `index_list_entries_on_game_id` (`game_id`),
  CONSTRAINT `fk_rails_5884a42775` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `fk_rails_e53a9ce9ae` FOREIGN KEY (`list_id`) REFERENCES `lists` (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lists` (
  `list_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_backlog` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`list_id`),
  KEY `index_lists_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_d6cf4279f7` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `game_id` int NOT NULL,
  `play_date` date DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT NULL,
  `platform_played_id` int DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `index_logs_on_user_id` (`user_id`),
  KEY `index_logs_on_game_id` (`game_id`),
  KEY `fk_rails_cba56d33fc` (`platform_played_id`),
  CONSTRAINT `fk_rails_8fc980bf44` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_rails_c51b02f487` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `fk_rails_cba56d33fc` FOREIGN KEY (`platform_played_id`) REFERENCES `platforms` (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `platforms` (
  `platform_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `game_id` int NOT NULL,
  `rating` decimal(10,0) DEFAULT NULL,
  `review_text` text,
  `review_date` date DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `unique_review` (`user_id`,`game_id`),
  KEY `index_reviews_on_user_id` (`user_id`),
  KEY `index_reviews_on_game_id` (`game_id`),
  CONSTRAINT `fk_rails_74a66bd6c5` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_rails_dfb9dc48b4` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `join_date` datetime(6) DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `index_users_on_username` (`username`),
  UNIQUE KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

INSERT INTO `schema_migrations` (version) VALUES
('20251106034516');

