SELECT TOP 10 *
FROM insurance;


----Summary Statistics (Age, BMI, Charges)
SELECT 
    MIN(age) AS Min_Age,
    MAX(age) AS Max_Age,
    AVG(age) AS Avg_Age,
    MIN(bmi) AS Min_BMI,
    MAX(bmi) AS Max_BMI,
    AVG(bmi) AS Avg_BMI,
    MIN(charges) AS Min_Charges,
    MAX(charges) AS Max_Charges,
    AVG(charges) AS Avg_Charges
FROM insurance;


----Gender 
SELECT sex, COUNT(*) AS Count
FROM insurance
GROUP BY sex;



---Smokers vs. Non-Smokers Count

SELECT smoker, COUNT(*) AS Count
FROM insurance
GROUP BY smoker;


---Average Charges by Smoker Status
SELECT smoker, AVG(charges) AS Avg_Charges
FROM insurance
GROUP BY smoker;



--- Average Charges by Age Group
SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Above 50'
    END AS Age_Group,
    AVG(charges) AS Avg_Charges
FROM insurance
GROUP BY 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Above 50'
    END;


----- Average Charges by BMI Category
SELECT 
    CASE 
        WHEN bmi < 25 THEN 'Normal'
        WHEN bmi BETWEEN 25 AND 30 THEN 'Overweight'
        ELSE 'Obese'
    END AS BMI_Category,
    AVG(charges) AS Avg_Charges
FROM insurance
GROUP BY 
    CASE 
        WHEN bmi < 25 THEN 'Normal'
        WHEN bmi BETWEEN 25 AND 30 THEN 'Overweight'
        ELSE 'Obese'
    END;



---- Average Charges by Region

SELECT region, AVG(charges) AS Avg_Charges
FROM insurance
GROUP BY region
ORDER BY Avg_Charges DESC;



----Impact of Children on Charges
SELECT children, AVG(charges) AS Avg_Charges, COUNT(*) AS Families
FROM insurance
GROUP BY children
ORDER BY children;



----Correlation Exploration (Age vs Charges)
SELECT age, AVG(charges) AS Avg_Charges
FROM insurance
GROUP BY age
ORDER BY age;



--- Top 10 Highest Charges (Outliers)
SELECT TOP 10 *
FROM insurance
ORDER BY charges DESC;

---- Customers with Charges Above 50,000
SELECT *
FROM insurance
WHERE charges > 50000
ORDER BY charges DESC;


---Average Charges for High vs. Normal Range
SELECT 
    CASE 
        WHEN charges > 50000 THEN 'High Outlier'
        ELSE 'Normal'
    END AS Charge_Category,
    COUNT(*) AS Count,
    AVG(charges) AS Avg_Charges
FROM insurance
GROUP BY 
    CASE 
        WHEN charges > 50000 THEN 'High Outlier'
        ELSE 'Normal'
    END;

----


