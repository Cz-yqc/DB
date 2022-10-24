SELECT IFNULL(CompanyName,'MISSING_NAME') AS CompanyName, CustomerId, TC AS TotalCost
FROM (
			SELECT IFNULL(CompanyName,'MISSING_NAME') AS CompanyName, CustomerId, NTILE(4) OVER(ORDER BY TC) AS O, TC
			FROM (
						SELECT IFNULL(CompanyName,'MISSING_NAME') AS CompanyName, CustomerId, UnitPrice, Quantity, ROUND(SUM(UnitPrice * Quantity),2) AS TC
						FROM Customer 
							INNER JOIN "Order" AS T1 ON Customer.Id = T1.CustomerId
							INNER JOIN OrderDetail AS T2 ON T1.Id = T2.OrderId
						GROUP BY Customer.Id
						ORDER BY TC)
			)
WHERE O = 1
