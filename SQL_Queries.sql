-- ========================================
-- HR Attrition Analysis - SQL Queries
-- By Somnath Pichewar
-- ========================================

-- 1. Total Employees and Attrition Count
SELECT COUNT(*) AS TotalEmployees FROM HR_data;

SELECT COUNT(*) AS AttritionCount
FROM HR_data
WHERE Attrition = 'Yes';

-- 2. Attrition Rate Overall
SELECT 
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM HR_data;

-- 3. Attrition by Job Role
SELECT JobRole,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Exits,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)/COUNT(*), 2) AS AttritionRate
FROM HR_data
GROUP BY JobRole
ORDER BY AttritionRate DESC;

-- 4. Attrition by Department
SELECT Department,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Exits,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)/COUNT(*), 2) AS AttritionRate
FROM HR_data
GROUP BY Department
ORDER BY AttritionRate DESC;

-- 5. Attrition by Income Group
SELECT 
  CASE 
    WHEN MonthlyIncome < 3000 THEN 'Low'
    WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN 'Medium'
    ELSE 'High'
  END AS IncomeGroup,
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Exits,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM HR_data
GROUP BY IncomeGroup
ORDER BY AttritionRate DESC;

-- 6. Attrition by Age Group
SELECT 
  CASE 
    WHEN Age < 30 THEN '<30'
    WHEN Age BETWEEN 30 AND 39 THEN '30-39'
    WHEN Age BETWEEN 40 AND 49 THEN '40-49'
    ELSE '50+'
  END AS AgeGroup,
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Exits,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM HR_data
GROUP BY AgeGroup
ORDER BY AttritionRate DESC;

-- 7. Attrition by Total Working Years
SELECT TotalWorkingYears, 
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Exits
FROM HR_data
GROUP BY TotalWorkingYears
ORDER BY TotalWorkingYears;
