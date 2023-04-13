WITH tabulka AS (
SELECT 
	payroll_year,
	ROUND(AVG(AVG_payroll), 2) AS payroll,
	ROUND(AVG (AVG_price), 2) AS price
FROM t_kristyna_hanackova_project_sql_primary_final tkhpspf 
GROUP BY payroll_year 
)
SELECT 
	tab1.payroll_year AS year,
	tab1.payroll AS AVG_payroll_total,
	tab1.price AS AVG_price_total,
	ROUND((tab1.payroll - tab2.payroll) / tab2.payroll * 100, 2) AS annual_change_payroll,
	ROUND((tab1.price - tab2.price) / tab2.price * 100, 2) AS annual_change_price,
	(((tab1.price - tab2.price) / tab2.price * 100) - ((tab1.payroll - tab2.payroll) / tab2.payroll * 100 )) AS comparison
FROM tabulka tab1
	JOIN tabulka tab2 ON tab1.payroll_year = tab2.payroll_year + 1
ORDER BY comparison DESC 
