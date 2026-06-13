-- create database ECBEA;

use ECBEA;

CREATE TABLE building_energy (
    Timestamp DATETIME,
    Building_ID VARCHAR(10),
    Energy_Usage_kWh DECIMAL(10,2),
    Temperature_C DECIMAL(10,2),
    Humidity_Percent DECIMAL(10,2),
    Building_Type VARCHAR(50),
    Occupancy_Level VARCHAR(20),
    Year INT,
    Month INT,
    Day INT,
    Hour INT,
    Weekday VARCHAR(20),
    Season VARCHAR(20),
    Temperature_Bin VARCHAR(20)
);


-- =====================================================
-- CREATE DATABASE
-- =====================================================

CREATE DATABASE ECBEA;

USE ECBEA;


-- =====================================================
-- CREATE TABLE
-- =====================================================

CREATE TABLE building_energy (
    Timestamp DATETIME,
    Building_ID VARCHAR(10),
    Energy_Usage_kWh DECIMAL(10,2),
    Temperature_C DECIMAL(10,2),
    Humidity_Percent DECIMAL(10,2),
    Building_Type VARCHAR(50),
    Occupancy_Level VARCHAR(20),
    Year INT,
    Month INT,
    Day INT,
    Hour INT,
    Weekday VARCHAR(20),
    Season VARCHAR(20),
    Temperature_Bin VARCHAR(20)
);


-- =====================================================
-- QUESTION 1
-- What is the total energy consumption?
-- =====================================================

SELECT SUM(Energy_Usage_kWh) AS Total_Energy_Usage FROM building_energy;



-- =====================================================
-- QUESTION 2
-- What is the average energy consumption?
-- =====================================================

SELECT AVG(Energy_Usage_kWh) AS Average_Energy_Usage FROM building_energy;



-- =====================================================
-- QUESTION 3
-- What is the daily energy consumption trend?
-- =====================================================

SELECT Day, SUM(Energy_Usage_kWh) AS Total_Energy_Usage FROM building_energy
GROUP BY Day
ORDER BY Day;



-- =====================================================
-- QUESTION 4
-- Which buildings consume the most energy?
-- =====================================================

SELECT Building_ID, Building_Type, SUM(Energy_Usage_kWh) AS Total_Energy_Usage
FROM building_energy
GROUP BY Building_ID, Building_Type
ORDER BY Total_Energy_Usage DESC;



-- =====================================================
-- QUESTION 5
-- Top 10 Energy Consuming Buildings
-- =====================================================

SELECT Building_ID, Building_Type, SUM(Energy_Usage_kWh) AS Total_Energy_Usage
FROM building_energy
GROUP BY Building_ID, Building_Type
ORDER BY Total_Energy_Usage DESC
LIMIT 10;



-- =====================================================
-- QUESTION 6
-- Which building type consumes the most energy?
-- =====================================================

SELECT Building_Type, SUM(Energy_Usage_kWh) AS Total_Energy_Usage
FROM building_energy
GROUP BY Building_Type
ORDER BY Total_Energy_Usage DESC;



-- =====================================================
-- QUESTION 7
-- How does occupancy impact energy consumption?
-- =====================================================

SELECT Occupancy_Level, AVG(Energy_Usage_kWh) AS Avg_Energy_Usage
FROM building_energy
GROUP BY Occupancy_Level
ORDER BY Avg_Energy_Usage DESC;



-- =====================================================
-- QUESTION 8
-- How does temperature impact energy consumption?
-- (Weather Bin Analysis)
-- =====================================================

SELECT Temperature_Bin, AVG(Energy_Usage_kWh) AS Avg_Energy_Usage
FROM building_energy
GROUP BY Temperature_Bin
ORDER BY Avg_Energy_Usage DESC;



-- =====================================================
-- QUESTION 9
-- Which season consumes the most energy?
-- =====================================================

SELECT Season, AVG(Energy_Usage_kWh) AS Avg_Energy_Usage
FROM building_energy
GROUP BY Season
ORDER BY Avg_Energy_Usage DESC;



-- =====================================================
-- QUESTION 10
-- Which hour has the highest energy demand?
-- =====================================================

SELECT Hour, SUM(Energy_Usage_kWh) AS Total_Energy_Usage
FROM building_energy
GROUP BY Hour
ORDER BY Total_Energy_Usage DESC;



-- =====================================================
-- QUESTION 11
-- Which weekday consumes the most energy?
-- =====================================================

SELECT Weekday, SUM(Energy_Usage_kWh) AS Total_Energy_Usage
FROM building_energy
GROUP BY Weekday
ORDER BY Total_Energy_Usage DESC;



-- =====================================================
-- Building Energy Analysis (VIEW)
-- =====================================================

CREATE OR REPLACE VIEW vw_building_energy AS
SELECT Building_ID, Building_Type, SUM(Energy_Usage_kWh) AS Total_Energy_Usage
FROM building_energy
GROUP BY Building_ID, Building_Type;



-- =====================================================
-- QUESTION 12
-- Top 10 Energy Consuming Buildings
-- =====================================================

SELECT* FROM vw_building_energy
ORDER BY Total_Energy_Usage DESC
LIMIT 10;



-- =====================================================
-- QUESTION 13
-- Top 10 Energy Efficient Buildings
-- =====================================================

SELECT* FROM vw_building_energy
ORDER BY Total_Energy_Usage ASC
LIMIT 10;



-- =====================================================
-- Building Occupancy Energy Analysis (VIEW)
-- =====================================================

CREATE OR REPLACE VIEW vw_building_occupancy_energy AS
SELECT Building_ID, Occupancy_Level, SUM(Energy_Usage_kWh) AS Total_Energy_Usage
FROM building_energy
GROUP BY Building_ID, Occupancy_Level;



-- =====================================================
-- QUESTION 14
-- Which buildings consume more energy under different
-- occupancy levels?
-- =====================================================

SELECT* FROM vw_building_occupancy_energy
ORDER BY Total_Energy_Usage DESC;



-- =====================================================
-- Energy Cost Analysis (VIEW)
-- Assumption: ₹8 per kWh
-- =====================================================

CREATE OR REPLACE VIEW vw_energy_cost AS
SELECT Building_ID, SUM(Energy_Usage_kWh) AS Total_Energy_Usage,
SUM(Energy_Usage_kWh) * 8 AS Energy_Cost
FROM building_energy
GROUP BY Building_ID;



-- =====================================================
-- QUESTION 15
-- Which buildings generate the highest energy cost?
-- =====================================================

SELECT* FROM vw_energy_cost
ORDER BY Energy_Cost DESC;



-- =====================================================
-- QUESTION 16
-- Top 10 Highest Cost Buildings
-- =====================================================

SELECT* FROM vw_energy_cost
ORDER BY Energy_Cost DESC
LIMIT 10;



-- =====================================================
-- QUESTION 17
-- What is the total energy cost?
-- =====================================================

SELECT SUM(Energy_Usage_kWh) * 8 AS Total_Energy_Cost FROM building_energy;


	
-- =====================================================
-- QUESTION 18
-- What is the daily energy cost trend?
-- =====================================================

SELECT Day, SUM(Energy_Usage_kWh) * 8 AS Daily_Energy_Cos FROM building_energy
GROUP BY Day
ORDER BY Day;

-- =====================================================
-- QUESTION 19
-- What is the hourly energy consumption trend?
-- =====================================================

SELECT Hour, SUM(Energy_Usage_kWh) AS Total_Energy_Usage FROM building_energy
GROUP BY Hour
ORDER BY Hour;



-- =====================================================
-- QUESTION 20
-- What is the hourly energy cost trend?
-- =====================================================

SELECT Hour, SUM(Energy_Usage_kWh) * 8 AS Hourly_Energy_Cost FROM building_energy
GROUP BY Hour
ORDER BY Hour;