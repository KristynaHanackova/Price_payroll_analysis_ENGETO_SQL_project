WITH tabulka AS (
SELECT 
	name, 
	AVG_price, 
	price_year 
FROM t_kristyna_hanackova_project_sql_primary_final tkhpspf 
GROUP BY price_year, name 
ORDER BY name, price_year 
)
SELECT 
	tab.name, 
	tab.AVG_price, 
	SUM(ROUND((tab.AVG_price - tab2.AVG_price) / tab2.AVG_price * 100, 2)) AS total_annual_change
FROM tabulka tab
	JOIN tabulka tab2 ON tab.name = tab2.name
	AND tab.price_year = tab2.price_year + 1 
GROUP BY tab.name
ORDER BY total_annual_change
