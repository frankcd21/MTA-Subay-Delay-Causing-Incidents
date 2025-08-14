# MTA Subway Delay Analysis Readme

This project analyzes delay-causing incidents on the NYC Subway using MTA data, providing insights through SQL analysis, dashboards, and ERD diagrams. The goal is to uncover patterns, support decision-making, and present findings in an executive report.

---

## Table of Contents
- [Overview](#overview)
- [Data](#data)
- [Analysis](#analysis)
- [Reports](#reports)
- [Usage](#usage)


---

## Overview
This project provides data-driven insights into subway delays by analyzing incidents across divisions, lines, and day types. Visualizations and ERDs support executive reporting and help identify areas for operational improvement.

---

## Data
The dataset is sourced from the "[MTA Subway Delay-Causing Incidents dataset (beginning 2025)](https://data.ny.gov/Transportation/MTA-Subway-Delay-Causing-Incidents-Beginning-2025/g937-7k7c/about_data)", and includes the following fields:
- `Month`
- `Division`
- `Line`
- `Day_Type`
- `Reporting_Category`
- `Subcategory`
- `Incidents`

Data has been cleaned and preprocessed using SQL to prepare it for analysis and visualization.

---

## Analysis
- SQL scripts to clean, summarize, and analyze incidents  
- Tableau dashboards displaying trends and patterns of delay incidents  
- ERD diagrams visualizing the database structure

---

## Reports
- **[Executive Report](https://github.com/frankcd21/MTA-Subay-Delay-Causing-Incidents/blob/main/reports/executive%20report.md)**  
- **Dashboards & Images:**  
  ![MTA Trains Incidents Dashboard](https://raw.githubusercontent.com/frankcd21/MTA-Subay-Delay-Causing-Incidents/main/images/MTA_Trains_Incidents_Dashboard.png)  
  ![MTA Subway ERD](https://raw.githubusercontent.com/frankcd21/MTA-Subay-Delay-Causing-Incidents/main/images/MTA%20Subway%20ERD.png)  

---

## Usage
1. Clone the repository:  
   ```bash
   git clone https://github.com/frankcd21/MTA-Subay-Delay-Causing-Incidents.git
2.  Set up the MySQL database
- Create a database in MySQL Workbench, e.g., MTA_Delays.
- Import the CSV files from /dataset or /reports
- Adjust the SQL scripts in code/ to reference your database name if needed.

3. Explore Dashboards
- Open Tableau and load visualizations from /dashboard
- Dashboards reflect data summarized in the SQL script

4. Run SQL scripts (Optional)
- Open the .sql files in code/ in MySQL Workbench.
- Execute scripts to create tables, summarize data, and generate metrics.
- Update any file paths in the scripts if your directory structure differ

5. View Supporting Data
- CSV files in /executive_report.md can be opened in Excel, Google Sheets, or Python/R for further analysis.


