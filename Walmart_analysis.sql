SELECT * FROM walmart

SELECT COUNT(*) FROM walmart

SELECT DISTINCT branch FROM walmart

SELECT payment_method, COUNT(payment_method) FROM walmart
GROUP BY payment_method

SELECT COUNT(DISTINCT category) FROM walmart 

SELECT MAX(quantity) FROM walmart

SELECT MIN(quantity) FROM walmart





-- Q1 Find a Different payment method and number of transaction, number of quantity sold

SELECT 
       payment_method, 
       COUNT(payment_method) AS No_Transactions,
       SUM(quantity) AS No_Quantity
FROM walmart
GROUP BY 1


-- Q2 Identify the highest-rated category in each branch display branch , category, avg rating

SELECT *
FROM
	 (SELECT 
	        branch , 
	        category, 
		    avg(rating),
		    RANK() OVER(PARTITION BY branch  ORDER BY AVG(rating) DESC) AS rank
	 FROM walmart
	 GROUP BY 1, 2
     )
where rank =1


-- Q3 Identify the busiest day of each branch base on the number of transaction 

-- TO_CHAR(TO_DATE(date, 'YYYY/MM/DD'), 'DAY') AS DAYS        THIS CODE TO GET THE DAY OF EACH DATE FROM COLUMN
SELECT *
FROM
    (SELECT 
	       branch, 
	       TO_CHAR(TO_DATE(date, 'YYYY/MM/DD'), 'DAY') AS DAYS,
		   COUNT(*) AS no_transactions,
		   RANK () OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS  rank
	FROM walmart
	GROUP BY 1,2
	)
WHERE rank = 1


-- Q4 Calculate the total quantity of item sold per payment_method list payment methods and total_quantity

SELECT 
       payment_method, 
       SUM(quantity) AS total_quantity
FROM walmart
group by 1


-- Q5 Determine the Average, minimum and maximum rating of product for each city
--    List the city, average_rating, min_rating, max_rating


SELECT
      city,
	  category,
	  AVG(rating) AS average_rating,
	  MIN(rating) AS min_rating,
	  MAX(rating) AS max_rating
FROM walmart
GROUP BY 1,2

-- Q6 calculate the total profit for each category by considering total profit as 
-- (unit_price * quantity * profit_margin) list the category and total profit order from highest to lowest profit

SELECT 
      category,
      SUM(unit_price * quantity * profit_margin) AS total_profit
FROM walmart
GROUP BY 1
ORDER BY 2 DESC


-- Determine the most common payment method for each branch. Display branch and the preferd_payment_method

SELECT 
      *
FROM
	(SELECT branch,
	        payment_method,
		    COUNT(payment_method) AS total_transactions,
		    RANK () OVER(PARTITION BY branch ORDER BY COUNT(payment_method) DESC) AS rank
	FROM walmart
	GROUP BY 1,2)
WHERE rank =1





-- Categorize sales into 3 group Morning, afternoon, evening Find out which of shift and number of invoice 

SELECT 
      branch,
CASE 
	       WHEN EXTRACT (HOUR FROM (time::time)) <12 THEN 'Morning'
           WHEN EXTRACT (HOUR FROM (time::time)) BETWEEN 12 and 17 THEN 'Afternoon'
	       ELSE 'Evening'
      END Day_time,
	  COUNT(*) AS No_Transactions
FROM walmart 
GROUP BY 1,2
ORDER BY 1,3 DESC




-- #9 Identify 5 branch with highest decrese ratio in 
-- revevenue compare to last year(current year 2023 and last year 2022)

-- rdr == last_rev-cr_rev/ls_rev*100

SELECT *,
EXTRACT(YEAR FROM TO_DATE(date, 'YY-MM-DD')) as formated_date
FROM walmart

-- 2022 sales
WITH revenue_2022
AS
(
	SELECT 
		branch,
		SUM(total) as revenue
	FROM walmart
	WHERE EXTRACT(YEAR FROM TO_DATE(date, 'YY-MM-DD')) = 2022 -- psql
	-- WHERE YEAR(TO_DATE(date, 'DD/MM/YY')) = 2022 -- mysql
	GROUP BY 1
),

revenue_2023
AS
(

	SELECT 
		branch,
		SUM(total) as revenue
	FROM walmart
	WHERE EXTRACT(YEAR FROM TO_DATE(date, 'YY-MM-DD')) = 2023
	GROUP BY 1
)

SELECT 
	ls.branch,
	ls.revenue as last_year_revenue,
	cs.revenue as cr_year_revenue,
	ROUND(
		(ls.revenue - cs.revenue)::numeric/
		ls.revenue::numeric * 100, 
		2) as rev_dec_ratio
FROM revenue_2022 as ls
JOIN
revenue_2023 as cs
ON ls.branch = cs.branch
WHERE 
	ls.revenue > cs.revenue
ORDER BY 4 DESC
LIMIT 5




