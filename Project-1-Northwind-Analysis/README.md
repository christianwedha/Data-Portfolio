# Project 1: Northwind Business Analysis

## Overview
Analysis of the Northwind Traders database to uncover insights about sales performance, customer behavior, and product trends.

## Tools Used
- **SQL (SQLite)** - Data extraction and analysis
- **DBeaver** - Database management and query development
- **Power BI** - Data visualization and dashboarding

## Business Questions Analyzed
1. [Question 1 - you'll fill this in]
2. [Question 2]
3. [Question 3]
...

## Data Quality Findings

During analysis, I identified the following data quality issues:

### Missing Geographic Data
- **Issue:** 2 customer records (out of 91 total) have NULL country values
- **Impact:** These customers cannot be included in geographic analysis
- **Resolution:** Excluded from geographic visualizations; documented for stakeholder awareness
- **Recommendation:** Implement data validation rules to prevent future NULL country entries

## Files in this Project
- `SQL/` - Contains all SQL queries used for analysis
- `Data/` - Northwind database file
- `PowerBI/` - Power BI dashboard file
- `Screenshots/` - Dashboard screenshots and visualizations

## Data Source
Northwind database - a sample database representing a trading company's operations including customers, orders, products, and employees.
```