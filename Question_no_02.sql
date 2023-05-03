WITH tabulka AS (
SELECT 
	name,
	payroll_year AS year, 
	ROUND(AVG(AVG_payroll),0) as AVG_payroll, 
	ROUND(AVG(AVG_price),2) as AVG_price 
FROM t_kristyna_hanackova_project_sql_primary_final tkhpspf
WHERE payroll_year = 2006 OR payroll_year = 2018 
GROUP BY payroll_year, name 
ORDER BY name
)
SELECT *,
	round(AVG_payroll/AVG_price,0) AS quantity 
FROM tabulka
WHERE name LIKE '%chléb%' OR name LIKE '%mléko%';
