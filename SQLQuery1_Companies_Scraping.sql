SELECT  *
FROM Companies_Formatted

--1. Industry Insights
--a) Which industries have the highest total revenue?
SELECT Industry, SUM(Revenue_USD_millions) AS Total_Revenue
FROM Companies_Formatted
GROUP BY Industry
ORDER BY Total_Revenue DESC;

--b) Which industries have the highest revenue growth?
SELECT Industry, AVG(CAST(REPLACE(Revenue_growth, '%', '') AS DECIMAL)) AS Avg_Revenue_Growth
FROM Companies_Formatted
GROUP BY Industry
ORDER BY Avg_Revenue_Growth DESC;

--c) What is the distribution of employees across industries?
SELECT Industry, SUM(CAST(REPLACE(Employees, ',', '') AS INT)) AS Total_Employees
FROM Companies_Formatted
GROUP BY Industry
ORDER BY Total_Employees DESC;


-- 2. Company Performance
-- a) Which companies have the highest/lowest revenue?
SELECT Name, (Revenue_USD_millions)
FROM Companies_Formatted
ORDER BY (Revenue_USD_millions) DESC;

-- b) What is the relationship between company rank and revenue growth?
SELECT Rank, Name, CAST(REPLACE(Revenue_growth, '%', '') AS DECIMAL) AS Revenue_Growth
FROM Companies_Formatted
ORDER BY Rank;

-- c) Are there companies with high revenue but low employee count (or vice versa)?
SELECT Name, (Revenue_USD_millions), CAST(REPLACE(Employees, ',', '') AS INT) AS Employee_Count
FROM Companies_Formatted
ORDER BY Revenue_USD_millions DESC, Employee_Count ASC;


-- 3. Geographical Analysis
-- a) Which states/cities have the most headquarters of top-ranked companies?
SELECT Headquarters, COUNT(Name) AS Company_Count
FROM Companies_Formatted
GROUP BY Headquarters
ORDER BY Company_Count DESC;

-- b) What is the total revenue and employee count for companies headquartered in a specific state/city?
SELECT Headquarters, SUM(Revenue_USD_millions) AS Total_Revenue, 
       SUM(CAST(REPLACE(Employees, ',', '') AS INT)) AS Total_Employees
FROM Companies_Formatted
GROUP BY Headquarters
ORDER BY Total_Employees DESC;

-- c) Is there a correlation between company location and revenue growth?
SELECT Headquarters, AVG(CAST(REPLACE(Revenue_growth, '%', '') AS DECIMAL)) AS Avg_Revenue_Growth
FROM Companies_Formatted
GROUP BY Headquarters
ORDER BY Avg_Revenue_Growth DESC;


-- 4. Revenue vs Employees
-- a) What is the average revenue per employee across industries?
SELECT Industry, AVG(Revenue_USD_millions / CAST(REPLACE(Employees, ',', '') AS INT)) AS Revenue_Per_Employee
FROM Companies_Formatted
GROUP BY Industry
ORDER BY Revenue_Per_Employee DESC;

-- b) How do revenue growth and employee size vary among the top 10 companies?
SELECT Name, [Revenue_USD_millions], 
       CAST(REPLACE([Revenue_growth], '%', '') AS DECIMAL) AS Revenue_Growth, 
       CAST(REPLACE(Employees, ',', '') AS INT) AS Employee_Count
FROM Companies_Formatted
ORDER BY Revenue_USD_millions DESC


