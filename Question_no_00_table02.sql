CREATE TABLE t_kristyna_hanackova_project_sql_secondary_final AS (
SELECT 
	e.country,
	e.`year`,
	e.GDP,
	e.gini,
	e.population,
	c.continent  
FROM economies e 
	LEFT JOIN countries c ON e.country = c.country 
WHERE c.continent = 'Europe'
	AND e.`year` >= 2006 AND e.`year` <= 2018
ORDER BY country, `year` 
);
