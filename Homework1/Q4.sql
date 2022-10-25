SELECT CategoryName, count(*) AS CategoryCount, round(avg(UnitPrice),2) AS AvgUnitPrice, min(UnitPrice) AS MinUnitPrice,
max(UnitPrice) AS MaxUnitPrice, sum(UnitsOnOrder) AS TotalUnitsOnOrder
FROM Product
INNER JOIN Category ON Product.CategoryId = Category.Id
GROUP BY CategoryId
HAVING CategoryCount > 10
ORDER BY CategoryId
