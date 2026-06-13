# Energy Consumption & Building Efficiency Analytics (ECBEA)

## Project Overview

Energy Consumption & Building Efficiency Analytics (ECBEA) is an end-to-end Data Analytics project built using Python, MySQL, and Power BI.

The project analyzes building energy consumption data to identify consumption patterns, occupancy impact, weather influence, operational efficiency, energy costs, and abnormal energy usage behavior.

The solution follows a complete analytics workflow including data validation, data cleaning, feature engineering, anomaly detection, SQL analytics, and dashboard development.

---

## Business Problem

Organizations often struggle to understand:

* Which buildings consume the most energy
* How occupancy affects energy consumption
* How weather conditions impact energy demand
* Which buildings are energy efficient
* What drives energy costs
* Whether abnormal consumption patterns exist

This project provides actionable insights through data analytics and interactive dashboards.

---

## Project Objectives

* Validate and improve data quality
* Analyze building energy consumption
* Evaluate occupancy impact on energy demand
* Analyze weather influence on energy usage
* Detect energy consumption anomalies
* Estimate energy costs
* Identify efficient and inefficient buildings
* Build executive-level dashboards for decision making

---

## Dataset

The dataset contains hourly building energy consumption records.

### Fields

* Timestamp
* Building_ID
* Energy_Usage_kWh
* Temperature_C
* Humidity_Percent
* Building_Type
* Occupancy_Level

### Engineered Features

* Year
* Month
* Day
* Hour
* Weekday
* Season
* Temperature_Bin

---

## Project Workflow

### Phase 1 – Data Validation

Validation checks performed:

* Missing values
* Duplicate records
* Negative energy consumption
* Invalid humidity values
* Building type validation
* Occupancy level validation

Output:

* validation_report.csv

---

### Phase 2 – Data Cleaning

Cleaning activities:

* Duplicate removal
* Missing value treatment
* Timestamp standardization
* Data type correction
* Categorical value standardization

Output:

* building_energy_cleaned.csv

---

### Phase 3 – Feature Engineering

Features created:

* Year
* Month
* Day
* Hour
* Weekday
* Season
* Temperature_Bin

Output:

* building_energy_featured.csv

---

### Phase 4 – Anomaly Detection

Method Used:

Z-Score Analysis

Purpose:

* Detect unusual energy spikes
* Identify abnormal building behavior

Output:

* anomalies.csv

---

### Phase 5 – SQL Analytics

Business Questions Answered:

* Total energy consumption
* Average energy consumption
* Daily energy trend
* Hourly energy trend
* Top energy-consuming buildings
* Building type analysis
* Occupancy impact analysis
* Temperature impact analysis
* Energy efficiency ranking
* Energy cost analysis

Views Created:

* vw_building_energy
* vw_building_occupancy_energy
* vw_energy_cost

---

### Phase 6 – Dashboard Development

#### Dashboard 1 – Executive Energy Overview

KPIs:

* Total Energy Usage
* Average Energy Usage
* Total Buildings
* Total Energy Cost

Visuals:

* Daily Energy Trend
* Hourly Energy Trend
* Building Type Consumption
* Top 10 Energy Consuming Buildings

#### Dashboard 2 – Building Performance Analytics

KPIs:

* Highest Consuming Building
* Lowest Consuming Building
* Average Building Consumption

Visuals:

* Top Buildings
* Bottom Buildings
* Building Type Comparison
* Efficiency Ranking

#### Dashboard 3 – Weather & Occupancy Analysis

KPIs:

* Average Temperature
* Average Humidity
* Average Energy Usage

Visuals:

* Temperature Bin Analysis
* Occupancy Analysis
* Weekday Energy Analysis
* Temperature vs Energy Relationship

#### Dashboard 4 – Energy Cost Analysis

KPIs:

* Total Energy Cost
* Average Cost Per Building
* Highest Cost Building

Visuals:

* Cost Trend Analysis
* Top Cost Buildings
* Cost by Building Type

---

## Technologies Used

### Programming

* Python

### Libraries

* Pandas
* NumPy

### Database

* MySQL

### Visualization

* Power BI

### Other Tools

* Excel
* GitHub

---

## Repository Structure

Energy-Consumption-Building-Efficiency-Analytics/

├── Dataset/

├── Output/

├── Python/

├── SQL/

├── Dashboard/

├── Documentation/

└── README.md

---

## Key Skills Demonstrated

* Data Validation
* Data Cleaning
* Feature Engineering
* Data Quality Assessment
* Anomaly Detection
* SQL Analytics
* Energy Analytics
* Building Performance Analysis
* Occupancy Analytics
* Weather Analytics
* Cost Analysis
* Power BI Dashboarding
* Business Intelligence Reporting

---

## Final Outcome

This project demonstrates a complete Data Analyst workflow from raw data validation and cleaning to SQL analytics, anomaly detection, dashboard development, and business intelligence reporting.
