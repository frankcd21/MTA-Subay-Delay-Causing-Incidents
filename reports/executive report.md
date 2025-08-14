
## Project Background
The MTA Subway Delay Analysis project was initiated to give executive leadership and operational teams a clear, data-driven understanding of factors contributing to service disruptions in the New York City subway system.  
By combining incident-level operational data with interactive visual dashboards, the project aims to:

- Identify top delay-causing categories and subcategories across the system  
- Detect patterns in incident frequency by month, division, line, and day type  
- Provide actionable insights to optimize staffing, security, and maintenance strategies  
- Support long-term operational improvements to reduce passenger impact  

An interactive Tableau dashboard can be found [here](https://public.tableau.com/views/MTA_Train_Delays_Dashboard/Dashboard2?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).
The SQL queries used for data extraction, cleaning, and staging are documented [here](https://github.com/frankcd21/MTA-Subay-Delay-Causing-Incidents/blob/main/code/MTA_Subway_Delay_Analysis.sql).

---

## Data Structure Overview
![MTA Subway ERD](https://raw.githubusercontent.com/frankcd21/MTA-Subay-Delay-Causing-Incidents/main/images/MTA%20Subway%20ERD.png)
- **Source:** [MTA Subway Delay-Causing Incidents dataset (beginning 2025)](https://data.ny.gov/Transportation/MTA-Subway-Delay-Causing-Incidents-Beginning-2025/g937-7k7c/about_data) 
- ** Original Total Row Count:** 7155 Rows, 7 Columns 
- ** Final Table Row Count:** 6892 Rows, 7 Columns 

**Columns of Interest:**  
- **Month:** Represented as YYYY-MM-DD,
- **Division:** Subway division (A or B)  
- **Line:** Subway line (e.g., F, 7, N)  
- **Day_Type:** Weekday (1) or weekend (2)
- **Reporting_Category:** Broad cause of delay (e.g., Police, Infrastructure)  
- **Subcategory:** More specific cause (e.g., Public Conduct, Sick/Injuried Person)  
- **Incidents:** Count of incidents for that category/date  

---

## Executive Summary
![image](https://raw.githubusercontent.com/frankcd21/MTA-Subay-Delay-Causing-Incidents/main/images/MTA_Trains_Incidents_Dashboard.png)
[**Link to Dashboard**](https://public.tableau.com/views/MTA_Train_Delays_Dashboard/Dashboard2?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

### Key Insights:
- **Total Reported Incidents:** ~34.8K after cleaning, with 26.5K valid operational incidents.  
- **Top Reporting Category:** Police & Medical (~11.5K incidents), followed by Infrastructure (~8.5K) and Planned ROW Work (~6.7K).  
- **Top Subcategory:** Public Conduct, Crime (~9.7K incidents) — significantly higher than other subcategories.  
- **Monthly Trends:** January has the highest incidents (~6.1K), while June has the lowest (~5.5K).  
- **Division Trends:** Division B has higher total incidents than Division A.  
- **Line Trends:** Line F leads in total incidents, but the top lines cluster closely between 2K–2.6K incidents each.  
- **Day Type:** Weekdays consistently have more incidents than weekends, even when normalized by days in each category.  

---

## Recommendations

### Targeted Security Deployment
- **Finding:** Police & Medical incidents make up one-third of all reported delays, with “Public Conduct, Crime” dominating subcategories.  
- **Implication:** Consider targeted police presence or rapid-response security teams on high-incident lines (e.g., F, 2, A) during peak weekday hours.

### Infrastructure Maintenance Scheduling
- **Finding:** Infrastructure issues contribute ~25% of all delays, disproportionately affecting certain months.  
- **Implication:** Schedule preventive maintenance during historically low-incident months (e.g., June) to minimize commuter disruption.

### Planned ROW Work Optimization
- **Finding:** Planned ROW Work accounts for ~6.7K incidents and can be strategically shifted to weekends where overall incident rates are lower.

### Seasonal Resource Planning
- **Finding:** January’s surge in delays suggests seasonal operational challenges (possible weather impact, post-holiday staffing).  
- **Implication:** Increase readiness and resources in winter months.

