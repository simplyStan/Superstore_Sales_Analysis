ABOUT THIS PROJECT

This project analyses Superstore sales data to identify the top-performing branches and products, sales trends, and customer behaviours. The goal is to enhance and optimize sales strategies. The dataset was sourced from the Kaggle Walmart Sales Forecasting Competition.
"In this recruitment challenge, participants receive historical sales data for 45 Superstores across various regions. Each store comprises multiple departments, and participants are tasked with predicting sales for each department within each store. Additionally, the dataset includes selected holiday markdown events, which are known to influence sales. However, accurately predicting the impact of these markdowns on specific departments poses a challenge." - Source

Purposes Of the Project

The major aim of this project is to gain insight into the sales data of the Superstore to understand the different factors that affect sales of the different branches.

About Data

The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. This dataset contains sales transactions from three different branches of the Superstore, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:


Analysis List

Product Analysis
Analyze the data to understand the different product lines, the product lines performing best and the product lines that need improvement.

Sales Analysis
This analysis aims to answer the question of the sales trends of products. The result of this can help us measure the effectiveness of each sales strategy the business applies and what modifications are needed to gain more sales.

Customer Analysis
This analysis aims to uncover the different customer segments, purchase trends and the profitability of each customer segment.

Approach Used
Data Wrangling or Cleaning: This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace missing or NULL values.

Build a database

Create a table and insert the data.
Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.
Feature Engineering: This will help us generate new columns from existing ones.
Add a new column named time_of_day to give an insight into sales in the Morning, Afternoon and Evening. 
This will help answer the question of which part of the day most sales are made.
Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). 
This will help answer the question of which week of the day each branch is busiest.
Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
Exploratory Data Analysis (EDA): Exploratory data analysis is done to answer the listed questions and aims of this project.

Conclusion:

Business Questions To Answer

Generic Question
1. How many unique cities does the data have?
2. In which city is each branch?
Product
3. How many unique product lines does the data have?
4. What is the most common payment method?
5. What is the most selling product line?
6. What is the total revenue by month?
7. What month had the largest COGS?
8. What product line had the largest revenue?
9. What is the city with the largest revenue?
10. What product line had the largest VAT?
11. Fetch each product line and add a column to those product lines showing "Good", "Bad". Good if it's greater than average sales
12. Which branch sold more products than the average product sold?
13. What is the most common product line by gender?
14. What is the average rating of each product line?
    
Sales

1. Number of sales made at each time of the day per weekday
2. Which of the customer types brings the most revenue?
3. Which city has the largest tax per cent/ VAT (Value Added Tax)?
4. Which customer type pays the most in VAT?
   
Customer

1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. What is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per branch?
7. Which time of the day do customers give the most ratings?
8. Which time of the day do customers give the most ratings per branch?
9. Which day of the week has the best average ratings?
10. Which day of the week has the best average ratings per branch?








