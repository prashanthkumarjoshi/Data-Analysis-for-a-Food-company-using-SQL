# Zomato SQL Project: Data Analysis for a Food Delivery Company
Welcome to the GitHub repository for the Zomato SQL Project. This project demonstrates my SQL problem-solving capabilities through an in-depth analysis of Zomato, a leading food delivery service in India. Within this repository, you will find a comprehensive breakdown of the project structure, meticulously crafted SQL queries, and the key insights derived from the data analysis.
## Project Overview

This project showcases my proficiency in addressing intricate SQL challenges within a business context. The primary objective was to analyze Zomato's customer and order data to uncover valuable insights, resolve business issues, and provide actionable recommendations. The database encompasses detailed information about customers, restaurants, orders, and deliveries.

## Entity-Relationship Diagram (ERD)
The dataset comprises five tables: `Customers`, `Resturants`, `riders`, `Orders`, and `Delivery`. Below is the structure of the ERD that represents the relationships among these tables.

<img width="646" alt="image" src="https://github.com/prashanthkumarjoshi/SQL_PROJECT_3/blob/main/images/ERD.png">


## Database Schema
### Tables and Columns
**customers**
- `customer_id`: Unique identifier for each customer
- `customer_name`: Name of the customer
- `reg_date`: registration date of the customer

**resturants**
- `resturant_id`: Unique identifier for each resturant
- `resturant_name`: Name of the resturant
- `city`: Name of the city where resturant is located
- `opening_hours`: Opening hours of the resturant

**riders**
- `rider_id`: Unique identifier for rider
- `product_name`: Name of the rider
- `sign_up`: sign up date

**sales**
- `order_id`: Unique identifier for each order
- `customer_id`: refrences from customer table
- `resturant_id`: refrences from resturants table
- `order_item`: Name of the Food order placed
- `order_date`: order date
- `order_time`: order time
- `order_status`: order status
- `total_amount`:The total amount for each order_id placed.

**deliveries**
- `delivery_id`: Unique identifier for each deliveries
- `order_id`: References the orders table
- `delivery_status`: Status of the delivery
- `delivery_time`: delivery time of the order
- `rider_id`: Refrences the riders table
## Objectives
Solve day-to-day complex business problems of online food delivery business using POSTGRESS SQL.
Develop complex queries to analyze and retrieve specific data:

#### Business problems and Queries for solution
### Q1.Write a Query to find the top 5 most frequently ordered dishes by customer called  "Akhil Reddy" in the last 1 year
- **Description**: Return the records of last 1 year with customer_id, customer_name,dishes and total count of dishes.
- **Expected Output**: A list of top 5 most frequently orderd dishes by Customer Name called "Akhil Reddy".
<details> <summary><strong>Click here to view the SQL code</strong></summary>

  ```sql
  SELECT
    customer_name,
    dishes,
    total_dishes
  FROM
    (SELECT
        c.customer_id,
        c.customer_name,
        o.order_item AS dishes,
        COUNT(order_id) AS total_dishes,
        DENSE_RANK() OVER (ORDER BY COUNT(order_id) DESC) AS RANK
      FROM
        orders o
        JOIN customers c ON o.customer_id = c.customer_id
      WHERE
        o.order_date >= CURRENT_DATE - INTERVAL '1 Year'
        AND c.customer_name = 'Akhil Reddy'
      GROUP BY
        1,
        2,
        3
      ORDER BY
        1,
        4 DESC
    ) AS t1
  WHERE
    RANK <= 5;
    ###Solution
    + <details>
        <sumary>Click heary to view Output image</summary>
        ![OUTPUT](https://github.com/prashanthkumarjoshi/SQL_PROJECT_3/blob/main/images/Q_2_output.png)
      </details>
    </details>
    



### Q2. Popular time slots
- **Description**: --Identify the time slots during which more orders are placed.Based on 2 hour interval.
- **Expected Output**: Creating time slot for 2 hours using 'Order time' and total number of orders during the slot.
- **FIRST APPROACH**
```Sql
SELECT 
	CASE
		when EXTRACT (HOUR FROM order_time) between 0 and 1 then '00:00:00 - 02:00:00'
		when EXTRACT (HOUR FROM order_time) between 2 and 3 then '02:00:00 - 04:00:00'
		when EXTRACT (HOUR FROM order_time) between 4 and 5 then '04:00:00 - 06:00:00'
		when EXTRACT (HOUR FROM order_time) between 6 and 7 then '06:00:00 - 08:00:00'
		when EXTRACT (HOUR FROM order_time) between 8 and 9 then '08:00:00 - 10:00:00'
		when EXTRACT (HOUR FROM order_time) between 10 and 11 then '10:00:00 - 12:00:00'
		when EXTRACT (HOUR FROM order_time) between 12 and 13 then '12:00:00 - 14:00:00'
		when EXTRACT (HOUR FROM order_time) between 14 and 15 then '14:00:00 - 16:00:00'
		when EXTRACT (HOUR FROM order_time) between 16 and 17 then '16:00:00 - 18:00:00'
		when EXTRACT (HOUR FROM order_time) between 18 and 19 then '18:00:00 - 20:00:00'
		when EXTRACT (HOUR FROM order_time) between 20 and 21 then '20:00:00 - 22:00:00'
		when EXTRACT (HOUR FROM order_time) between 22 and 23 then '22:00:00 - 00:00:00'
	END AS time_slot,
	count(order_id) as order_count
FROM
	orders
GROUP BY
	1
ORDER BY
	2 DESC;
```
![OUTPUT](https://github.com/prashanthkumarjoshi/SQL_PROJECT_3/blob/main/images/Q_2_output.png)


### Medium to Hard (5 Questions)
1. Identify the least selling product in each country for each year.
2. Calculate how many warranty claims were filed within 180 days of a product sale.
3. Determine how many warranty claims were filed for products launched in the last two years.
4. List the months in the last three years where sales exceeded 5,000 units in the USA.
5. Identify the product category with the most warranty claims filed in the last two years.

### Complex (5 Questions)
1. Determine the percentage chance of receiving warranty claims after each purchase for each country.
2. Analyze the year-by-year growth ratio for each store.
3. Calculate the correlation between product price and warranty claims for products sold in the last five years, segmented by price range.
4. Identify the store with the highest percentage of "Paid Repaired" claims relative to total claims filed.
5. Write a query to calculate the monthly running total of sales for each store over the past four years and compare trends.

## Project Focus
This project emphasizes:
- **Complex Joins and Aggregations**: Advanced SQL joins and aggregations.
- **Window Functions**: Utilizing functions for running totals, growth analysis, and time-based queries.
- **Data Segmentation**: Time-based analysis for product performance.
- **Correlation Analysis**: Identifying relationships between variables like product price and warranty claims.
- **Real-World Problem Solving**: Addressing business challenges with SQL.
