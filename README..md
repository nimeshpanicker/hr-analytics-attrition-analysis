# HR Analytics – Attrition Analysis

**SQL Query Library + Power BI Dashboard | HR Workforce Analytics**

An end-to-end **HR Analytics and Employee Attrition Analysis** project using **PostgreSQL, SQL, Power BI, Excel/CSV, and Business Intelligence techniques** to analyze employee attrition across demographics, departments, job roles, compensation, overtime, tenure, career growth, satisfaction, and work-life factors.

This project demonstrates a complete **Data Analyst / Business Intelligence workflow** — from data loading and SQL analysis to KPI development, dashboard visualization, dashboard auditing, and business insights.

---

## 📌 Table of Contents

- [Project Overview](#-project-overview)
- [Business Problem](#-business-problem)
- [Project Objectives](#-project-objectives)
- [Dataset Overview](#-dataset-overview)
- [Dataset Categories](#-dataset-categories)
- [Technology Stack](#-technology-stack)
- [Project Workflow](#-project-workflow)
- [Data Preparation & Cleaning](#-data-preparation--cleaning)
- [SQL Analysis](#-sql-analysis)
- [Key SQL Questions](#-key-sql-questions)
- [Key Performance Indicators](#-key-performance-indicators)
- [Key Findings](#-key-findings)
- [Power BI Dashboard](#-power-bi-dashboard)
- [Dashboard Page 1](#-dashboard-page-1--attrition-overview)
- [Dashboard Page 2](#-dashboard-page-2--attrition-drivers-and-insights)
- [Business Insights](#-business-insights)
- [Business Recommendations](#-business-recommendations)
- [Data Quality & Dashboard Validation](#-data-quality--dashboard-validation)
- [Skills Demonstrated](#-skills-demonstrated)
- [Project Structure](#-project-structure)
- [Project Deliverables](#-project-deliverables)
- [Limitations](#-limitations)
- [Future Improvements](#-future-improvements)
- [How to Use This Project](#-how-to-use-this-project)
- [Author](#-author)

---

# 📊 Project Overview

Employee attrition is an important workforce analytics problem. Understanding how many employees are leaving, where attrition is concentrated, and which employee characteristics are associated with different attrition rates can support more informed HR analysis.

This project analyzes **1,480 employee records** stored in a single `HR_Analytics` table containing **37 columns** covering employee demographics, job information, compensation, work conditions, career history, satisfaction, and attrition status.

The project combines:

- 30 SQL analytical queries
- PostgreSQL data preparation and analysis
- Employee-level HR dataset in CSV format
- KPI calculations
- Power BI dashboard
- Interactive Department and Job Role filters
- Dashboard validation and auditing
- Business insights and recommendations

---

# 🎯 Business Problem

Employee attrition can affect:

- Workforce stability
- Recruitment requirements
- Training costs
- Team productivity
- Employee experience
- Career development
- Department performance

The purpose of this project is to analyze employee-level HR data and identify patterns and differences in attrition rates across important workforce dimensions.

The analysis focuses on questions such as:

- How many employees have left the organization?
- What is the overall attrition rate?
- Which departments have higher attrition rates?
- Which age groups experience higher attrition?
- How does attrition vary by marital status and gender?
- How are overtime and work conditions associated with attrition?
- What does tenure reveal about employee attrition?
- How do promotion gaps relate to attrition?
- Which job roles show higher reported attrition rates?

---

# 🎯 Project Objectives

The project was designed around the following objectives:

1. Analyze total employee headcount.
2. Calculate overall employee attrition.
3. Calculate attrition rates across departments.
4. Analyze attrition by job role.
5. Analyze demographic patterns.
6. Examine gender and marital-status differences.
7. Analyze age-group attrition.
8. Examine compensation and salary characteristics.
9. Analyze overtime and work-condition factors.
10. Investigate employee tenure.
11. Analyze years since last promotion.
12. Examine job satisfaction and work-life balance.
13. Analyze education fields and job levels.
14. Build an interactive Power BI dashboard.
15. Audit dashboard outputs against SQL results.

---

# 📁 Dataset Overview

| Attribute | Details |
|---|---|
| Dataset | `HR_Analytics` |
| Records | 1,480 employees |
| Columns | 37 |
| Grain | Employee-level |
| Primary Identifier | `EmpID` |
| Domain | Human Resources / Workforce Analytics |
| SQL Database | PostgreSQL |
| Visualization | Power BI |
| Source Format | CSV |

The dataset is structured as a single employee-level table with 37 fields covering demographics, compensation, job information, role history, satisfaction, and attrition.

---

# 🧩 Dataset Categories

## 👤 Employee Demographics

- Age
- Age Group
- Gender
- Marital Status
- Education
- Education Field

## 💼 Job & Department Information

- Department
- Job Role
- Job Level
- Employee ID

## 💰 Compensation

- Monthly Income
- Salary Slab
- Daily Rate
- Hourly Rate
- Monthly Rate
- Percent Salary Hike
- Stock Option Level

## ⏰ Work Conditions

- OverTime
- Business Travel
- Distance From Home
- Work-Life Balance
- Environment Satisfaction

## 📈 Tenure & Career Growth

- Total Working Years
- Years at Company
- Years in Current Role
- Years Since Last Promotion
- Years With Current Manager
- Number of Companies Worked
- Training Times Last Year

## ⭐ Satisfaction & Performance

- Job Satisfaction
- Environment Satisfaction
- Relationship Satisfaction
- Work-Life Balance
- Performance Rating
- Job Involvement

## 🚪 Attrition

- Attrition Status
- Attrition Count
- Attrition Rate

---

# 🛠 Technology Stack

## SQL / PostgreSQL

SQL was used for:

- Data preparation
- Duplicate detection
- Duplicate removal
- Headcount analysis
- Attrition calculations
- Department analysis
- Job-role analysis
- Demographic analysis
- Compensation analysis
- Tenure analysis
- Promotion-gap analysis
- Satisfaction analysis
- Ranking
- Top-N analysis
- KPI calculations

The SQL library contains **30 analytical queries** covering the HR analysis workflow.

---

## 📊 Power BI

Power BI was used to build a two-page interactive dashboard containing:

- KPI cards
- Bar charts
- Donut charts
- Department slicer
- Job Role slicer
- Cross-filtering
- Dashboard navigation
- Business insights
- Attrition analysis

The dashboard contains two main pages:

1. **Attrition Overview**
2. **Attrition Drivers and Insights**

---

## 📗 Excel / CSV

The employee dataset is provided in CSV format for:

- Data exploration
- Database loading
- SQL analysis
- Data validation
- Analytical processing

---

# 🔄 Project Workflow

```text
Raw Employee Dataset
        ↓
Data Understanding
        ↓
Database Table Creation
        ↓
Data Cleaning & Deduplication
        ↓
PostgreSQL SQL Analysis
        ↓
KPI Calculation
        ↓
Demographic Analysis
        ↓
Compensation Analysis
        ↓
Work Condition Analysis
        ↓
Tenure & Career Growth Analysis
        ↓
Power BI Dashboard
        ↓
Dashboard Audit
        ↓
Business Insights
        ↓
Recommendations
