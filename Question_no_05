WITH tabulka AS (
SELECT 
	tabs.country, 
	tabs.`year`, 
	round(tabs.GDP, 0) AS GDP,
	tabp.payroll_year, 
	ROUND(AVG(tabp.AVG_payroll), 2) AS payroll,
	ROUND(AVG (tabp.AVG_price), 2) AS price
FROM t_kristyna_hanackova_project_sql_secondary_final tabs 
	JOIN t_kristyna_hanackova_project_sql_primary_final tabp ON tabs.`year` = tabp.payroll_year 
WHERE tabs.country LIKE '%czech%'
GROUP BY tabp.payroll_year 
)
SELECT tab.country, tab.YEAR, tab. GDP, tab.payroll, tab.price,
	round((tab.GDP - tab2.GDP) / tab2.GDP * 100, 2) AS GDP_annual_change,
	round((tab.payroll - tab2.payroll) / tab2.payroll * 100, 2) AS payroll_annual_change,
	round((tab.price - tab2.price) / tab2.price * 100, 2) AS price_annual_change
FROM tabulka tab
	JOIN tabulka tab2 ON tab.YEAR = tab2.YEAR + 1
