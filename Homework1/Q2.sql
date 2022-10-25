SELECT Id, ShipCountry, 
       iif(ShipCountry IN ('USA','Canada','Mexico'),'North America','Other place') as answer
FROM 'Order'
WHERE Id >= 15445
ORDER BY Id
LIMIT 20
