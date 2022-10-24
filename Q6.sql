SELECT Id, OrderDate, PreOrderDate, round(julianday(OrderDate) - julianday(PreOrderDate),2) AS Result
FROM (
			SELECT Id, OrderDate, LAG(OrderDate,1,OrderDate) OVER (ORDER BY OrderDate) AS PreOrderDate
			FROM 'Order'
			WHERE CustomerId = 'BLONP'
			ORDER BY OrderDate
			LIMIT 10
)
