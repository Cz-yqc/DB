SELECT ProductName,CompanyName,ContactName FROM
	(
	SELECT ProductName,CompanyName,ContactName,min(OrderDate) FROM
		(SELECT Id,ProductName 
		FROM  Product 
		WHERE Discontinued = 1
		) AS P
		INNER JOIN OrderDetail AS OD ON OD.ProductId = P.Id 
		INNER JOIN "Order" AS O ON O.Id = OD.OrderId
		INNER JOIN Customer AS CS ON O.CustomerId = CS.Id
		GROUP BY ProductName
	)
ORDER BY ProductName
