SELECT RegionDescription, FirstName, LastName, Birthday
FROM 
(
    SELECT FirstName,LastName,Birthdate,MAX(Employee.Birthdate) AS Birthday,EmployeeId,RegionId,RegionDescription
    FROM Employee
		INNER JOIN EmployeeTerritory AS ET ON Employee.Id = ET.EmployeeId
    INNER JOIN Territory AS T ON ET.TerritoryId = T.Id
		INNER JOIN Region AS R ON R.Id = T.RegionId
    GROUP BY RegionId
)
ORDER BY RegionId
