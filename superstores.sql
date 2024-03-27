CREATE DATABASE superstores;

CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(50) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer VARCHAR(20) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT(6,4) NOT NULL,
    total DECIMAL(12,4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    COGS DECIMAL(10,2) NOT NULL,
    gross_margin_percent FLOAT(11,9) NOT NULL,
    gross_income DECIMAL(12,4) NOT NULL,
    rating FLOAT(2,1) NOT NULL
);

-- ----------------------------------------------------------------------------------------
-- FEATURE ENGINEERING
-- time_of_day

SELECT 
	time,
  (CASE
   WHEN `time` BETWEEN "00:00:00" AND "11:59:00" THEN "Morning"
   WHEN `time` BETWEEN "12:00:00" AND "16:00:00" THEN "Afternoon"
   ELSE "Evening" END) AS time_of_day
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20); -- To add time_of_day to the table

UPDATE sales
SET time_of_day = (
CASE
   WHEN `time` BETWEEN "00:00:00" AND "11:59:00" THEN "Morning"
   WHEN `time` BETWEEN "12:00:00" AND "16:00:00" THEN "Afternoon"
   ELSE "Evening" 
END
);

-- Day Name
SELECT
	date,
    DAYNAME(date) AS day_name
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(15);

UPDATE sales
SET day_name = DAYNAME(date); 

-- Month Name

SELECT
	date,
    MONTHNAME(date) AS month_name
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);




-- ----------------------------------------------------------------------------------------------------------------------
-- ------------------------EXPLORATORY DATA ANALYSIS (EDA)---------------------------------------------------------------
-- How many unique cities does the Data have?
SELECT 
	DISTINCT city
FROM sales;

-- How many branches are in the city?
SELECT 
	DISTINCT branch
FROM sales;

-- In which city is each branch?
SELECT
	DISTINCT city,
    branch
FROM sales;

-- ------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------PRODUCTS------------------------------------------------------------------
-- --------------------- How many unique product lines does the data have?----------------------------------------

SELECT 
	DISTINCT product_line
FROM sales;

-- ---------- What is the most common payment method?----------------------------
SELECT
	payment_method,
    COUNT(payment_method) AS common_payment_method
FROM sales
GROUP BY payment_method
ORDER BY common_payment_method DESC;

-- ---------------- What is the most selling product line?-------------------------------
SELECT
	product_line,
    COUNT(product_line) AS most_selling_pl
FROM sales
GROUP BY product_line
ORDER BY most_selling_pl DESC;

-- ---------------- What is the total revenue by month?-------------------
SELECT 
	month_name AS Month,
    SUM(total) AS total_revenue
FROM sales
GROUP BY Month
ORDER BY total_revenue DESC;

-- ------------------- What month had the largest COGS?---------------------------
SELECT 
	month_name AS Month,
    SUM(COGS)
FROM sales
GROUP BY Month
ORDER BY MAX(COGS) DESC;

-- ---------- What product line had the largest revenue?--------------------------------------
SELECT 
	product_line,
    SUM(total) AS largest_revenue
FROM sales
GROUP BY product_line
ORDER BY largest_revenue DESC;

-- ------------What is the city and the branch with the largest revenue?----------
SELECT 
	branch,
    city,
    SUM(total) AS largest_revenue
FROM sales
GROUP BY branch, city
ORDER BY largest_revenue DESC;

-- --------------What product line had the largest VAT?-------------------------------
SELECT 
	product_line,
    SUM(VAT) AS largest_VAT
FROM sales
GROUP BY product_line
ORDER BY largest_VAT DESC;

-- ------Which branch sold more products than average product sold?
SELECT 
	branch,
    SUM(quantity) AS qty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales)
ORDER BY qty DESC;

-- -------------What is the most common product line by gender?
SELECT
	gender,
    product_line,
    COUNT(product_line) AS most_selected
FROM sales
GROUP BY gender, product_line
ORDER BY most_selected DESC;

-- ----------What is the average rating of each product line?
SELECT
	product_line,
    ROUND(AVG(rating), 2) AS average_rating
FROM sales
GROUP BY product_line
ORDER BY average_rating DESC;

-- ------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------- SALES--------------------------------------------------------------------
-- ----------------Number of sales made in each time of the day per weekday

SELECT 
	time_of_day,
    COUNT(*) AS no_of_sales
FROM sales
WHERE day_name = "wednesday"
GROUP BY time_of_day
ORDER BY no_of_sales DESC;

-- ------------ Which of the customer types brings the most revenue?

SELECT 
	customer,
    ROUND(SUM(total), 2) AS revenue
FROM sales
GROUP BY customer
ORDER BY revenue DESC;


-- ---------------- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT
	 city,
    MAX(VAT) AS largest_tax_percentage
FROM sales
GROUP BY city
ORDER BY largest_tax_percentage DESC;

-- ------------- Which customer type pays the most in VAT?

SELECT
	customer,
    AVG(VAT) AS pays_most
FROM sales
GROUP BY customer
ORDER BY pays_most DESC;


-- -------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------- CUSTOMER INFORMATION ----------------------------------------------------------

-- --------------How many unique customer types does the data have?

SELECT 
	COUNT(DISTINCT customer) total_customer
FROM sales;

-- ------------------------- How many unique payment methods does the data have?

SELECT
	COUNT(DISTINCT(payment_method)) AS unique_payment_method
FROM sales;

SELECT
	DISTINCT(payment_method) AS unique_payment_method
FROM sales;

-- ----------- What is the most common customer type?
SELECT
	customer,
    COUNT(*) AS most_common
FROM sales
GROUP BY customer
ORDER BY most_common DESC;

-- --------------------------Which customer type buys the most?

SELECT 
	customer,
    COUNT(*) AS most_buy
FROM sales
GROUP BY customer
ORDER BY most_buy DESC;
    
    
-- --------------------------What is the gender of most of the customers?

SELECT 
	gender,
    COUNT(*) AS most_customer
FROM sales
GROUP BY gender
ORDER BY most_customer DESC;

-- ---------------- What is the gender distribution per branch?

SELECT
	gender,
    branch,
    COUNT(*) AS distribution
FROM sales
GROUP BY gender, branch
ORDER BY distribution DESC;

SELECT
	gender,
    COUNT(*) AS distribution
FROM sales
WHERE branch = "B"
GROUP BY gender;


-- -------------------- Which time of the day do customers give most ratings?
SELECT
	time_of_day,
    ROUND(AVG(rating), 1) AS most_rating
FROM sales
GROUP BY time_of_day
ORDER BY most_rating DESC;


-- --------Which time of the day do customers give most ratings per branch?
SELECT
	time_of_day,
    ROUND(AVG(rating), 2) AS most_rating
FROM sales
WHERE branch = "A"  
GROUP BY time_of_day
ORDER BY most_rating DESC;


-- -------------------------------Which day of the week has the best avg ratings?
SELECT 
	day_name,
    AVG(rating) AS best_rating
FROM sales
GROUP BY day_name
ORDER BY best_rating DESC;


-- -----------Which day of the week has the best average ratings per branch?
SELECT 
	day_name,
    AVG(rating) AS best_rating
FROM sales
WHERE branch = "A"
GROUP BY day_name
ORDER BY best_rating DESC





























