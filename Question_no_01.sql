WITH payroll_table AS (
SELECT 
	industry, 
	AVG_payroll, 
	payroll_year 
FROM t_kristyna_hanackova_project_sql_primary_final
GROUP BY 
	industry, 
	payroll_year
)
SELECT 
	pay.industry,
	pay.AVG_payroll,
	pay.payroll_year,
	round((pay.AVG_payroll - pay2.AVG_payroll) / pay2.AVG_payroll * 100, 2) AS annual_change 
FROM payroll_table pay
	JOIN payroll_table pay2 ON pay.industry = pay2.industry
	AND pay.payroll_year = pay2.payroll_year + 1
ORDER BY annual_change;
