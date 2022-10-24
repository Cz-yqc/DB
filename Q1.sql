SELECT DISTINCT ShipName, substr(ShipName,0,instr(ShipName,'-')) AS answer
FROM 'Order'
WHERE shipname LIKE '%-%' 
ORDER BY ShipName
