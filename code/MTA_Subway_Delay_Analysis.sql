-- =============================================================================
-- Script:    clean_mta_subway_delays.sql
-- Author:    Frank Daniel
-- Created:   2025-08-12
-- Purpose:   Load, clean, and standardize MTA subway delay incidents data from CSV
-- Prereqs:   LOCAL_INFILE enabled; adjust file path as needed
-- =============================================================================

-- ---------------------------------------------------------------------
-- SECTION 1: RAW STAGING TABLE DEFINITION
-- ---------------------------------------------------------------------

CREATE TABLE `subway_delays_staging` (
    `Month` DATE DEFAULT NULL,
    `Division` VARCHAR(50) DEFAULT NULL,
    `Line` VARCHAR(20) DEFAULT NULL,
    `Day_Type` VARCHAR(20) DEFAULT NULL,
    `Reporting_Category` VARCHAR(100) DEFAULT NULL,
    `Subcategory` VARCHAR(100) DEFAULT NULL,
    `Incidents` INT DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

-- ---------------------------------------------------------------------
-- SECTION 2: RAW DATA LOAD
-- ---------------------------------------------------------------------

LOAD DATA LOCAL INFILE '/Users/franky/Documents/MTA_Subway_Delay-Causing_Incidents__Beginning_2025_20250807.csv'
INTO TABLE subway_delays_staging
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- ---------------------------------------------------------------------
-- SECTION 3: INITIAL DATA QUALITY CHECKS
-- ---------------------------------------------------------------------

-- Find rows with missing or empty Reporting_Category (265 rows deleted)
SELECT *
FROM subway_delays_staging
WHERE Reporting_Category = '' OR Reporting_Category IS NULL;

-- Find rows with missing or empty Subcategory
SELECT *
FROM subway_delays_staging
WHERE Subcategory = '' OR Subcategory IS NULL;

-- Find rows with zero or NULL incidents
SELECT *
FROM subway_delays_staging
WHERE Incidents = 0 OR Incidents IS NULL;

-- ---------------------------------------------------------------------
-- SECTION 4: CLEANING MISSING / INVALID VALUES
-- ---------------------------------------------------------------------

-- Delete rows where Reporting_Category and Subcategory are missing or empty AND Incidents is 0 or NULL
DELETE FROM subway_delays_staging
WHERE
    (Reporting_Category = '' OR Reporting_Category IS NULL)
    AND (Subcategory = '' OR Subcategory IS NULL)
    AND (Incidents = 0 OR Incidents IS NULL);

-- ---------------------------------------------------------------------
-- SECTION 5: STANDARDIZE / CLEAN COLUMNS
-- ---------------------------------------------------------------------

-- Standardize Division to only first character (A or B)
UPDATE subway_delays_staging
SET Division = LEFT(Division, 1)
WHERE Division IS NOT NULL;

-- ---------------------------------------------------------------------
-- SECTION 6: SUMMARY QUERIES (For Reference / Reporting)
-- ---------------------------------------------------------------------

-- Total incidents: 34,779
SELECT SUM(Incidents) AS total_incidents
FROM subway_delays_staging
WHERE Incidents != 0;

-- Top Reporting Categories by total incidents: Police and Medical are the most (11.5K)
SELECT Reporting_Category, SUM(Incidents) AS total_incidents
FROM subway_delays_staging
GROUP BY Reporting_Category
ORDER BY total_incidents DESC;

-- Top Subcategories by total incidents: Police Conduct & Crime are the highest (9.7k)
SELECT Reporting_Category, Subcategory, SUM(Incidents) AS total_incidents
FROM subway_delays_staging
GROUP BY Reporting_Category, Subcategory
ORDER BY total_incidents DESC;

-- Monthly incidents sorted descending: Jan was the highest (6.1k)
SELECT DATE_FORMAT(Month, '%Y-%m') AS Month_Formatted, SUM(Incidents) AS total_incidents
FROM subway_delays_staging
GROUP BY Month_Formatted
ORDER BY total_incidents DESC;

-- Total incidents by Division: Divison B (21K)
SELECT Division, SUM(Incidents) AS total_incidents
FROM subway_delays_staging
GROUP BY Division
ORDER BY total_incidents DESC;

-- Total incidents by Line: Line F has the most, Lines with most incidents ranging from 2 - 2.6k
SELECT Line, SUM(Incidents) AS total_incidents
FROM subway_delays_staging
GROUP BY Line
ORDER BY total_incidents DESC;

-- Total incidents by Day Type: Weekdays have more incidents (even on a day to day basis)
SELECT Day_Type, SUM(Incidents) AS total_incidents
FROM subway_delays_staging
GROUP BY Day_Type
ORDER BY total_incidents DESC;

-- High-interest areas: Incidents by Line and Reporting Category 
SELECT Line, Reporting_Category, SUM(Incidents) AS total_incidents
FROM subway_delays_staging
GROUP BY Line, Reporting_Category
ORDER BY total_incidents DESC;
