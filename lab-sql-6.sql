-- Lab | SQL Queries 6


USE sakila;

SELECT *
FROM film;

-- creating new table to update new film catalog for 2020:

drop table if exists films_2020;    -- we drop to make sure it does not exist
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,    -- or char(50)
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;    -- how to increment


-- Add the new films to the database.
-- I have used "Table Data Import Wizard" to import csv file to films_2020 table.

SELECT *
FROM films_2020
LIMIT 10;


-- Update information on rental_duration, rental_rate, and replacement_cost.
--  rental duration -- 3 days, 
-- rental rate 2.99€ 
-- replacement cost of 8.99€


UPDATE films_2020
SET    rental_duration = 3, rental_rate = 2.99, replacement_cost = 8.99;

SELECT *
FROM films_2020
LIMIT 10;