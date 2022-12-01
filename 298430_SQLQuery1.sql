SELECT fts.OrderDate, COUNT(fts.SalesOrderNumber) as Orders_cnt FROM dbo.FactInternetSales as fts
GROUP BY fts.OrderDate
HAVING COUNT(fts.SalesOrderNumber) < 100
ORDER BY Orders_cnt DESC


SELECT fts2.OrderDate, fts2.UnitPrice FROM 
	(SELECT
		fts.OrderDate,
		ROW_NUMBER() OVER(PARTITION BY OrderDate ORDER BY UnitPrice DESC) AS Rows,
		UnitPrice
	FROM dbo.FactInternetSales fts 
	) fts2 
WHERE Rows < 4
ORDER BY OrderDate;