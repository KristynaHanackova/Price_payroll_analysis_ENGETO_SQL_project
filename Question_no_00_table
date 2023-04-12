CREATE TABLE t_kristyna_hanackova_project_SQL_primary_final AS (
WITH payroll_table AS (
SELECT 
	pay.id AS id_payroll, 
	AVG(pay.value) AS AVG_payroll, 
	pay.value_type_code, 
	pay.payroll_year, 
	ind.name AS industry,
	ind.code AS industry_code
FROM czechia_payroll pay
	LEFT JOIN czechia_payroll_industry_branch ind ON pay.industry_branch_code = ind.code
WHERE pay.industry_branch_code IS NOT NULL
	AND pay.value_type_code = 5958
GROUP BY pay.payroll_year, pay.industry_branch_code
), price_table AS (
SELECT 
	*,
	price.id AS price_id,
	AVG(price.value) AS AVG_price,
	cprc.name AS food_category,
	YEAR (price.date_from) AS price_year
FROM czechia_price price
	LEFT JOIN czechia_price_category cprc ON price.category_code = cprc.code
WHERE price.region_code IS NULL 
GROUP BY cprc.name, YEAR (price.date_from)
)
SELECT *
FROM payroll_table pay
	CROSS JOIN price_table price ON pay.payroll_year = YEAR(price.date_from) 
);	
