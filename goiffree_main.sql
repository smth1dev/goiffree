-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: localhost
-- Χρόνος δημιουργίας: 26 Οκτ 2018 στις 12:42:41
-- Έκδοση διακομιστή: 10.1.36-MariaDB
-- Έκδοση PHP: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `goiffree_main`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(100) NOT NULL,
  `store_address` varchar(100) NOT NULL,
  `store_phone_number` varchar(80) NOT NULL,
  `store_city` int(11) NOT NULL,
  `store_country` int(11) NOT NULL,
  `store_website` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `tables`
--

CREATE TABLE `tables` (
  `table_id` int(11) NOT NULL,
  `table_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `tables_category`
--

CREATE TABLE `tables_category` (
  `tables_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `tables_category_qnty` int(11) NOT NULL,
  `tables_category_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_username` varchar(100) NOT NULL,
  `user_password` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `user_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Ευρετήρια για πίνακα `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`table_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `table_category_id` (`table_category_id`);

--
-- Ευρετήρια για πίνακα `tables_category`
--
ALTER TABLE `tables_category`
  ADD PRIMARY KEY (`tables_category_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Ευρετήρια για πίνακα `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `store_id` (`store_id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `tables`
--
ALTER TABLE `tables`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `tables_category`
--
ALTER TABLE `tables_category`
  MODIFY `tables_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `tables_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  ADD CONSTRAINT `tables_ibfk_2` FOREIGN KEY (`table_category_id`) REFERENCES `tables_category` (`tables_category_id`);

--
-- Περιορισμοί για πίνακα `tables_category`
--
ALTER TABLE `tables_category`
  ADD CONSTRAINT `tables_category_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

--
-- Περιορισμοί για πίνακα `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
