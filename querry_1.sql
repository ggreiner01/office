SELECT  COUNT(c.supplierid), 
SUM(c.cost)
FROM costs c JOIN suppliers s
ON c.supplierid = s.supplierid
GROUP BY c.supplierid
HAVING COUNT(c.supplierid) > 1
