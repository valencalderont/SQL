SELECT *
FROM fortune_companies
;

--Assign all the companies in the Retail industry as "good work environment", "acceptable work environment", or "bad work environment" based on paid time off days offered. 

SELECT company_name,
CASE WHEN paid_time_off_days>= 20 THEN "Good work environment"
WHEN paid_time_off_days>= 15 THEN "Acceptable work environment"
ELSE "Bad work environment"
END AS "work environment"
FROM fortune_companies
WHERE industry='Retail';

--Which industries have an average revenue of at least $200 Billion, and what are their avg revenues?

SELECT industry, ROUND(AVG(revenue),1) as avg_revenue_billions
FROM fortune_companies
GROUP BY industry
HAVING avg_revenue_billions>=200
;

--Which companies have healthcare benefits *and* at least 20 paid time off days?

SELECT company_name
FROM fortune_companies
WHERE paid_time_off_days>20
AND healthcare_benefits=1
;

--Which company in the Retail industry has the least revenue, and whats their revenue? 

SELECT company_name, min(revenue)
FROM fortune_companies
WHERE industry = 'Retail'
;
