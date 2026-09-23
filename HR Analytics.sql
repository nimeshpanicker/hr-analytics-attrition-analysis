CREATE TABLE HR_Analytics (
    EmpID VARCHAR(20) PRIMARY KEY,
    Age INT,
    AgeGroup VARCHAR(20),
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(30),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EmployeeCount INT,
    EmployeeNumber INT,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(100),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    SalarySlab VARCHAR(20),
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(5),
    OverTime VARCHAR(10),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager DECIMAL(10,2)
);

ALTER TABLE hr_analytics
DROP CONSTRAINT hr_analytics_pkey;

DELETE FROM hr_analytics
WHERE ctid IN (
    SELECT ctid
    FROM (
        SELECT 
            ctid,
            ROW_NUMBER() OVER (
                PARTITION BY EmpID 
                ORDER BY ctid
            ) AS rn
        FROM hr_analytics
    ) AS duplicate_rows
    WHERE rn > 1
);

SELECT 
    EmpID,
    COUNT(*) AS Duplicate_Count
FROM hr_analytics
GROUP BY EmpID
HAVING COUNT(*) > 1;

-- Q1. How many total employees are in the HR dataset?

SELECT COUNT(*) AS Total_Employees
FROM HR_Analytics;

-- Q2. How many employees have left the company?

SELECT COUNT(*) AS Employees_Left
FROM HR_Analytics
WHERE Attrition = 'Yes';

--Q3. What is the overall attrition rate?

SELECT
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS
Attrition_Rate_Percentage
FROM HR_Analytics;

--Q4. What is the attrition count by department?

SELECT Department, COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY Attrition_Count DESC;

--Q5. What is the attrition rate by department?

SELECT
Department,
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS
Attrition_Rate
FROM HR_Analytics
GROUP BY Department
ORDER BY Attrition_Rate DESC;

--Q6. How many employees are there in each job role?

SELECT JobRole, COUNT(*) AS Employee_Count
FROM HR_Analytics
GROUP BY JobRole
ORDER BY Employee_Count DESC;

--Q7. Which job roles have the highest attrition count?

SELECT JobRole, COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY Attrition_Count DESC;

--Q8. What is the attrition count by gender?

SELECT Gender, COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition = 'Yes'
GROUP BY Gender
ORDER BY Attrition_Count DESC;

--Q9. What is the attrition rate by age group?

SELECT
AgeGroup,
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS
Attrition_Rate
FROM HR_Analytics
GROUP BY AgeGroup
ORDER BY Attrition_Rate DESC;

--Q10. What is the average monthly income by department?

SELECT Department, ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income
FROM HR_Analytics
GROUP BY Department
ORDER BY Avg_Monthly_Income DESC;

--Q11. What is the average monthly income by job role?

SELECT JobRole, ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income
FROM HR_Analytics
GROUP BY JobRole
ORDER BY Avg_Monthly_Income DESC;

--Q12. Which employees have the highest monthly income?

SELECT EmpID, JobRole, Department, MonthlyIncome
FROM HR_Analytics
ORDER BY MonthlyIncome DESC
LIMIT 10;

--Q13. What is the average age of employees by department?

SELECT Department, ROUND(AVG(Age), 2) AS Avg_Age
FROM HR_Analytics
GROUP BY Department
ORDER BY Avg_Age DESC;

--Q14. How many employees work overtime?

SELECT COUNT(*) AS Overtime_Employees
FROM HR_Analytics
WHERE OverTime = 'Yes';

--Q15. What is the attrition rate among employees who work overtime?

SELECT
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM HR_Analytics
WHERE OverTime = 'Yes';

--Q16. What is the attrition rate by marital status?

SELECT
MaritalStatus,
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM HR_Analytics
GROUP BY MaritalStatus
ORDER BY Attrition_Rate DESC;

--Q17. What is the average distance from home for employees who left the company?

SELECT ROUND(AVG(DistanceFromHome), 2) AS Avg_Distance_From_Home
FROM HR_Analytics
WHERE Attrition = 'Yes';

--Q18. Which employees have worked in the highest number of companies?

SELECT EmpID, NumCompaniesWorked
FROM HR_Analytics
ORDER BY NumCompaniesWorked DESC
LIMIT 10;

--Q19. What is the average total working years by job role?

SELECT JobRole, ROUND(AVG(TotalWorkingYears), 2) AS Avg_Total_Working_Years
FROM HR_Analytics
GROUP BY JobRole
ORDER BY Avg_Total_Working_Years DESC;

--Q20. What is the attrition count by education field?

SELECT EducationField, COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition = 'Yes'
GROUP BY EducationField
ORDER BY Attrition_Count DESC;

--Q21. What is the attrition rate by job level?

SELECT
JobLevel,
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM HR_Analytics
GROUP BY JobLevel
ORDER BY Attrition_Rate DESC;

--Q22. What is the average job satisfaction score by department?

SELECT Department, ROUND(AVG(JobSatisfaction), 2) AS Avg_Job_Satisfaction
FROM HR_Analytics
GROUP BY Department
ORDER BY Avg_Job_Satisfaction DESC;

--Q23. How many employees have each work-life balance level?

SELECT WorkLifeBalance, COUNT(*) AS Employee_Count
FROM HR_Analytics
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

--Q24. What is the attrition count by salary slab?

SELECT SalarySlab, COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition = 'Yes'
GROUP BY SalarySlab
ORDER BY Attrition_Count DESC;

--Q25. What is the average years at company by department?

SELECT Department, ROUND(AVG(YearsAtCompany), 2) AS Avg_Years_At_Company
FROM HR_Analytics
GROUP BY Department
ORDER BY Avg_Years_At_Company DESC;

--Q26. Which employees have not received a promotion for more than 5 years?

SELECT EmpID, JobRole, YearsSinceLastPromotion
FROM HR_Analytics
WHERE YearsSinceLastPromotion > 5
ORDER BY YearsSinceLastPromotion ASC;

--Q27. What is the average training times last year by job role?

SELECT JobRole, ROUND(AVG(TrainingTimesLastYear), 2) AS Avg_Training_Times
FROM HR_Analytics
GROUP BY JobRole
ORDER BY Avg_Training_Times DESC;

--Q28. Which departments have the highest average environment satisfaction?

SELECT Department, ROUND(AVG(EnvironmentSatisfaction), 2) AS Avg_Environment_Satisfaction
FROM HR_Analytics
GROUP BY Department
ORDER BY Avg_Environment_Satisfaction DESC;

--Q29. How many employees have a performance rating of 4?

SELECT COUNT(*) AS High_Performance_Employees
FROM HR_Analytics
WHERE PerformanceRating = 4;

--Q30. Find the top 5 job roles with the highest attrition rate.

SELECT
JobRole,
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM HR_Analytics
GROUP BY JobRole
ORDER BY Attrition_Rate DESC
LIMIT 5;