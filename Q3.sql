SELECT Shipper.CompanyName, 
ROUND((((SELECT COUNT("Order".ShipVia) 
			FROM "Order"
			WHERE "Order".ShippedDate > "Order".RequiredDate GROUP BY "Order".ShipVia) + 0.00) / 
			((SELECT COUNT("Order".ShipVia)
			FROM "Order" GROUP BY "Order".ShipVia) + 0.00) * 100)
			,2) as Relaypercent
FROM Shipper,"Order"
WHERE Shipper.Id = "Order".ShipVia
GROUP BY "Order".ShipVia
