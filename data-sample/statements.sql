-------------------------------
-- Example Query ---
-------------------------------
-- SELECT DISTINCT (rental_rate, release_year) FROM film;
-- SELECT * FROM film; 
-- SELECT DISTINCT rating FROM film;
-- SELECT count(amount) FROM payment;
-- SELECT count(DISTINCT(amount)) FROM payment;
-- SELECT * FROM customer WHERE first_name = 'Maria';
SELECT * FROM film;

SELECT count(DISTINCT(rating)) from film;
SELECT * FROM film WHERE rental_rate > 4 AND replacement_cost >= 19
AND length > 150 AND rating = 'R'; 

-- now to select only the title where all this conditions happen to be true
SELECT count(title) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19
AND length > 150 AND rating = 'R';  

-- SELECT count(*) FROM film
SELECT * FROM film WHERE rating = 'NC-17' AND rental_rate != 0.99;

-- customer --- 
-- find an email of a person named Nancy thomas 
SELECT first_name, last_name, email FROM customer;
SELECT email FROM customer WHERE first_name = 'Nancy' AND last_name = 'Thomas'; 

-- give discription for a movie
SELECT * FROM film;

SELECT description FROM film WHERE title = 'Outlaw Hanky'

-- find a phone number base on given address 
-- SELECT * FROM address;
SELECT phone, city_id FROM address WHERE address = '259 Ipoh Drive';

-- ordering a colomn 
SELECT * FROM customer ORDER BY first_name ASC;
SELECT * FROM customer ORDER BY first_name DESC;

-- first order by store_id then order by first_name
SELECT store_id, first_name, last_name FROM customer 
ORDER BY store_id DESC, first_name ASC;

-- limit command, show top n line 
SELECT * FROM payment 
WHERE amount != 0
ORDER BY payment_date LIMIT 5;

SELECT * FROM payment
SELECT customer_id FROM payment 
ORDER BY payment_date ASC LIMIT 10;

-- short movie (in length of run time)
SELECT title, length FROM film 
ORDER BY length ASC LIMIT 5;

-- movies less than 50 min 
SELECT count(title) FROM film 
WHERE length <= 50;

-- long movie length
SELECT title, length FROM film 
ORDER BY length DESC LIMIT 5;

-- BETWEEN or NOT BETWEEN keywords --
SELECT * FROM payment LIMIT 2;

SELECT count(*) FROM payment WHERE amount BETWEEN 8 AND 9;

-- IN or NOT IN
SELECT * FROM payment 
WHERE amount IN (0.99, 1.98, 1.99);  -- distinct values

-- LIKE (case-sensetive) and ILIKE, using pattern matching
SELECT * FROM customer WHERE first_name LIKE 'J%'
AND last_name LIKE 'S%';

SELECT * FROM customer WHERE first_name ILIKE 'j%'
AND last_name ILIKE 's%';

SELECT * FROM customer WHERE first_name ILIKE '%he%';

----------------------------------------------------
-- Aggregate functions 
----------------------------------------------------
SELECT * FROM film;
SELECT MIN(replacement_cost), MAX(replacement_cost) FROM film;
SELECT ROUND(AVG(replacement_cost), 3) FROM film;
SELECT SUM(replacement_cost)FROM film;

-- GROUP BY
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id ORDER BY SUM(amount);

SELECT DATE(payment_date) FROM payment GROUP BY DATE(payment_date);
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id HAVING SUM(amount) > 100;

-- JOINs

SELECT * FROM payment
INNER JOIN customer ON payment.customer_id = customer.customer_id;

SELECT * FROM customer 
FULL OUTER JOIN payment 
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null 
OR payment.payment_id IS null;

SELECT film.film_id, title, inventory_id 
FROM film 
LEFT JOIN inventory ON inventory.film_id = film.film_id;



