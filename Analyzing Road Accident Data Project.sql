

----------- Analyzing Road Accident Data Project -----------


----- Check the data
SELECT * FROM accidents


----- Total number of accidents
SELECT
	COUNT(ID) AS total_accidents
FROM 
	accidents;


----- What are the number of casualties in each day of the week? Sort them in descending order?
SELECT
  DATE_FORMAT(Accident_Date, '%W') AS Day_of_Week,
  SUM(Number_of_Casualties) AS Total_Casualties
FROM
  accidents 
GROUP BY
  Day_of_Week
ORDER BY
  Total_Casualties DESC;


----- What are the number of casualties in each month?
SELECT 
    DATE_FORMAT(Accident_Date, '%Y-%m') AS Month, 
    SUM(Number_of_Casualties) AS Total_Casualties
FROM 
    accidents
GROUP BY 
    Month
ORDER BY 
    Month ASC;


----- Which geographic areas have the highest occurrence of accidents?
SELECT 
    District_Area, 
    SUM(Number_of_Casualties) AS Total_Casualties
FROM 
    accidents
GROUP BY 
    District_Area
ORDER BY 
    Total_Casualties DESC
LIMIT 10;


----- What are the most frequent weather conditions associated with accidents?
SELECT 
    Weather_Conditions, 
    COUNT(*) AS Num_Accidents
FROM 
    accidents
GROUP BY 
    Weather_Conditions
ORDER BY 
    Num_Accidents DESC;


----- What are the most common types of vehicles involved in accidents?
SELECT 
    Vehicle_Type, 
    COUNT(*) AS Num_Accidents
FROM 
    accidents
GROUP BY 
    Vehicle_Type
ORDER BY 
    Num_Accidents DESC;


----- How do the number of casualties vary across different types of accidents?
SELECT 
    Accident_Severity, 
    Road_Type, 
    COUNT(*) AS Num_Accidents, 
    SUM(Number_of_Casualties) AS Num_Casualties
FROM 
    accidents
GROUP BY 
    Accident_Severity, Road_Type
ORDER BY 
    Accident_Severity ASC, Num_Casualties DESC;


----- Quantity and ratio of severity.
SELECT 
	accident_severity,
	COUNT(accident_severity) AS total_severity,
	ROUND(COUNT(*) * 100./ SUM(COUNT(*)) OVER (),2) as percentage_of_accidents
from
	accidents
GROUP BY accident_severity
ORDER BY 3 DESC;


----- Verify if most accidents happens during the night or day.
SELECT 
    Light_Conditions, 
    COUNT(*) AS Num_Accidents
FROM 
    accidents
WHERE 
    Light_Conditions IN ('Daylight', 'Darkness - lights lit', 'Darkness - no lighting', 'Darkness - lighting unknown', 'Darkness - lights unlit')
GROUP BY 
    Light_Conditions
ORDER BY 
    Num_Accidents DESC;