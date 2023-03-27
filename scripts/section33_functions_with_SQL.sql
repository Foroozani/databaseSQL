-- Functions with SQL
SELECT 2 + 2;


-- FUNCTION RETURNING NO VALUE
-- returns void 

select * from employees;

create or replace function fn_employees_update_country() returns void
$$
select 
	country, 
	case
		when country = '' then country = 'N/A'
	end country2
from employees 
$$
LANGUAGE SQL 

-- ########################################

CREATE OR REPLACE FUNCTION fn_update_country() returns void as
$$
	update employees
	set country = 'N/A'
	where country = NULL
$$
LANGUAGE SQL	

SELECT fn_update_country();

-- FUNCTION RETURN SINGLE VALUE 
-- get the minimum price of product 

CREATE OR REPLACE FUNCTION fn_product_min_price() RETURNS real as 
$$ 
	select 
		min(unit_price)
	FROM products
$$ 
language sql 

select fn_product_min_price();

-- get total count of customers 
SELECT * from customers;

select 
	count(DISTINCT(customer_id))
FROM customers;
-- 
CREATE OR REPLACE FUNCTION fn_total_count_customer() RETURNS bigint AS 
$$
	select 
		count(DISTINCT(customer_id))
	FROM customers;
$$
LANGUAGE SQL 

SELECT fn_total_count_customer()

-- -----------------------------
-- get total count of product 
select * from products;

CREATE OR REPLACE FUNCTION fn_total_count_product() RETURNS bigint AS 
$$
	select 
		count(*)
	FROM products;
$$
LANGUAGE SQL 

SELECT fn_total_count_product();

-- -------------------------------
-- get total customers with empty fax number 
-- fn_api_total_customers_empty_fax 

CREATE OR REPLACE FUNCTION fn_api_total_customers_empty_fax() RETURNS BIGINT AS 
$$
	select 
		count(*) 
	from 
		customers
		where fax is NULL;
$$
LANGUAGE SQL

select fn_api_total_customers_empty_fax();

-- =========================================
-- Function using parameters
-- =========================================
-- 1.
create or replace FUNCTION fn_extract_substring(p_string varchar, p_starting_point int, p_endpoint int) RETURNS VARCHAR AS 
$$ 
	SELECT SUBSTRING(p_string, p_starting_point, p_endpoint);
$$
LANGUAGE SQL

select substring('hello world', 3,6);

select fn_extract_substring('Hello PSQL', 2,4);

-- 2.
-- get total customers by city 
-- input parameter: city name-varchar
-- output parameter: number -bigint

CREATE OR REPLACE FUNCTION fn_total_customer_by_city(p_city varchar) RETURNS BIGINT AS
$$
	(select
		count(customer_id)
	from customers
	where city = p_city
	group by city)
	;
$$
LANGUAGE SQL

select fn_total_customer_by_city('Paris');
select fn_total_customer_by_city('London');
select * from customers;

--3. 
-- get total order by a customer 
-- input: given customer name, varchar
-- output: total order 

select * from orders;

CREATE OR REPLACE FUNCTION fn_total_order_by_customer(p_customer_name varchar) RETURNS BIGINT AS
$$
(
	select count(*) from orders 
	where customer_id = p_customer_name
)
$$
LANGUAGE SQL

select fn_total_order_by_customer('VINET')
select fn_total_order_by_customer('BERGES')

-- 3. 
-- get the bigest order amount placed by a customer
-- fn_api_customer_largest_order
-- input: customer_id 
-- output: 

CREATE OR REPLACE FUNCTION fn_api_customer_larges_order(p_customer_id varchar) RETURNS smallint AS
$$
	(
	
	select 
	max(quantity)
	from orders
	natural join order_details
	where customer_id = p_customer_id
	
	)
$$
LANGUAGE sql

select fn_api_customer_larges_order('VINET')
select * from order_details;
select * from orders;

-- =============================================
-- Functions returning a composite
-- server returns a single row 

-- most recent records of order

CREATE OR REPLACE FUNCTION fn_api_order_latest() RETURNS orders AS
$$
	(
	SELECT 
		*
	FROM
		orders
	ORDER by order_date DESC
		limit 1
	
	)
$$
LANGUAGE SQL

select (fn_api_order_latest()).*;

-- most recent order between date range 
CREATE OR REPLACE FUNCTION fn_api_order_latest_by_date_range(p_from_date date, p_to_date date) RETURNS orders AS
$$
	(
	SELECT 
		*
	FROM
		orders
	where 
		order_date between p_from_date and p_to_date 
	ORDER by order_date DESC
		limit 1
	
	)
$$
LANGUAGE SQL

select (fn_api_order_latest_by_date_range('1997-01-01', '1997-03-06')).*;



-- most recent hire 
select * from employees;

CREATE OR REPLACE FUNCTION fn_api_recent_hire() RETURNS employees AS
$$
(
	SELECT 
		* 
	from 
		employees
	ORDER by hire_date DESC
	limit 1
)
 $$
LANGUAGE SQL;

SELECT (fn_api_recent_hire()).*;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++
-- function returning multiple rows 
-- +++++++++++++++++++++++++++++++++++++++++++++++++++
-- RETURNS SETOF tablename

-- list all employees hire in a particular year 
-- fn_api_employees_hire_date_by_year

select * from employees;

CREATE OR REPLACE FUNCTION fn_api_employees_hire_date_by_year(p_year integer) RETURNS SETOF employees AS 
$$
(
	SELECT 
		* 
	FROM
		employees 
	where 
		extract('YEAR' from hire_date) = p_year
)
$$
LANGUAGE SQL

select (fn_api_employees_hire_date_by_year('1992')).*;

-- ###################################
-- Functions as a table source 
/*
	SELECT 
		column name
	FROM
		function_name
*/
-- ###################################

select (fn_api_employees_hire_date_by_year('1992')).*;

select 
	employee_id,
	first_name,
	last_name
FROM
	fn_api_employees_hire_date_by_year('1992');

-- FUNCTION RETURNING A TABLE
-- top orders by a customer 
-- fn_api_customers_top_orders
-- INPUT: p_customer_id, p_limit 

CREATE OR REPLACE FUNCTION fn_api_customers_top_roder(p_customer_id character, p_limit int)
RETURNS TABLE 
(
	order_id smallint, 
	customer_id character, 
	product_name varchar,
	unit_price real,
	quantity smallint, 
	total_order double precision
)
AS
$$
	SELECT 
		orders.order_id,
		orders.customer_id, 
		
		products.product_name, 
		
		order_details.unit_price,
		order_details.quantity, 
		
		((order_details.unit_price*order_details.quantity) - order_details.discount) as total_order
		
	FROM
		order_details
	NATURAL join orders
	natural join products 
	where orders.customer_id = p_customer_id
	ORDER BY ((unit_price*quantity)-discount) DESC
	limit p_limit
	
$$
LANGUAGE SQL


select * from fn_api_customers_top_roder('VINET', 3);




