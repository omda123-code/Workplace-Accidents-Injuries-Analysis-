use [Osha  Incidents]
select * from Incidents

-- Question: What is the total number of reported incidents?
-- Purpose: To get an overall view of the dataset size and accident frequency.

SELECT COUNT(*) AS Total_Incidents
FROM Incidents;

-- Question: How many incidents resulted in fatal vs. nonfatal injuries?
-- Purpose: To understand the severity distribution of workplace accidents.

SELECT Degree_of_Injury, COUNT(*) AS Count
FROM Incidents
GROUP BY Degree_of_Injury;

-- Question: What are the most common types of injuries (Nature of Injury)?
-- Purpose: To identify the most frequent injury types.

SELECT Nature_of_Injury, COUNT(*) AS InjuryCount
FROM Incidents
GROUP BY Nature_of_Injury
ORDER BY InjuryCount DESC;

-- Question: Which body parts are most frequently injured?
-- Purpose: To determine vulnerable body parts in workplace accidents.

SELECT Part_of_Body1, COUNT(*) AS Count
FROM Incidents
GROUP BY Part_of_Body1
ORDER BY Count DESC;

-- Question: What are the most common event types leading to injuries?
-- Purpose: To analyze which accident scenarios are most frequent.

SELECT Event_type1, COUNT(*) AS Count
FROM Incidents
GROUP BY Event_type1
ORDER BY Count DESC;

-- Question: Which environmental factors are most associated with incidents?
-- Purpose: To highlight risky environmental conditions.

SELECT Environmental_Factor, COUNT(*) AS Count
FROM Incidents
GROUP BY Environmental_Factor
ORDER BY Count DESC;

-- Question: Which human factors are most frequently reported?
-- Purpose: To identify human-related causes contributing to accidents.

SELECT [Human_Factor], COUNT(*) AS Count
FROM Incidents
GROUP BY [Human_Factor]
ORDER BY Count DESC;

-- Question: How many accidents occurred during regularly assigned tasks vs. not regularly assigned?
-- Purpose: To assess the risk difference between routine vs. non-routine tasks.

SELECT [Task_Assigned], COUNT(*) AS Count
FROM Incidents
GROUP BY [Task_Assigned];

-- Question: What are the most common keywords associated with incidents?
-- Purpose: To detect recurring hazards from event descriptions.

SELECT [Event_Keywords], COUNT(*) AS Count
FROM Incidents
GROUP BY [Event_Keywords]
ORDER BY Count DESC;

-- Question: Which construction project types report the highest incidents?
-- Purpose: To evaluate risks associated with specific construction activities.

SELECT [Project_Type], COUNT(*) AS Count
FROM Incidents
GROUP BY [Project_Type]
ORDER BY Count DESC;

-- Question: Are incidents more frequent in projects with higher building stories?
-- Purpose: To analyze relationship between project size and accidents.

SELECT [Building_Stories], COUNT(*) AS Count
FROM Incidents
GROUP BY [Building_Stories]
ORDER BY [Building_Stories];

-- Question: How many incidents were related to hazardous substances?
-- Purpose: To understand the role of hazardous substances in accidents.

SELECT hazsub, COUNT(*) AS Count
FROM Incidents
GROUP BY hazsub;

-- Question: What is the monthly distribution of incidents?
-- Purpose: To detect seasonal trends or high-risk months.

SELECT MONTH([Event_Date]) AS Month, COUNT(*) AS Count
FROM Incidents
GROUP BY MONTH([Event_Date])
ORDER BY Month;

-- Question: How many incidents were caused by equipment malfunction?
-- Purpose: To assess risks due to faulty equipment.

SELECT Human_Factor, COUNT(*) AS Count
FROM Incidents
WHERE Human_Factor LIKE '%Malfunction%'
GROUP BY Human_Factor;

-- Question: What percentage of incidents involve amputations?
-- Purpose: To measure the severity and proportion of amputation-related accidents.

SELECT 
    (CAST(SUM(CASE WHEN [Nature_of_Injury] LIKE '%Amputation%' THEN 1 ELSE 0 END) AS FLOAT) 
    / COUNT(*)) * 100 AS Amputation_Percentage
FROM Incidents;

-- Question: What are the top 5 detailed event descriptions?
-- Purpose: To review common recurring detailed accident scenarios.

SELECT TOP 5 [Event_Description], COUNT(*) AS Count
FROM Incidents
GROUP BY [Event_Description]
ORDER BY Count DESC;





