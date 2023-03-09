-- Database: movies

-- subqueries
--###########################################
-- 1. filtering data with where clause
-- let us look at a senario
-- Find the movies movie average length and then 
-- use the results from the first query and then use select to find movies which are more than average movie length 


select * from movies;

select 
	avg(movie_length)
from movies -- single row returned

--
select 
	movie_id, 
	movie_name,
	movie_length, movie_lang
FROM movies 
where 
	movie_length >
	(
		select 
			avg(movie_length)
		from movies
		where movie_lang = 'English'
	)
order by movie_length DESC;

-- get first name and last name of all actors who younger than "Douglas Silva"

select * from actors;
-- 
select 
	*
FROM
	actors
WHERE
	last_name = 'Silva';
-- "1988-09-27"

select * from actors 
where date_of_birth < '1988-09-27'
-- subqueries 

select 
	* 
FROM
	actors
where 
	date_of_birth > 
	(
		select 
			date_of_birth 
		FROM
			actors
		where
			first_name = 'Douglas'
			and last_name = 'Silva'

	);

-- 
-- Subqueries with IN operator
-- find all movies name where domestic revenues are greater than 200 
select * from movies_revenues;
select * from movies;
--
select 
	movie_name, 
	movie_lang
from 
	movies 
where 
	movie_id IN
	(
	select 
		movie_id
	from 
		movies_revenues
	where 
		revenues_domestic > 200
	)	
	
;

-- find all movies where domestic revenues are heigher than the international revenues 

SELECT
	movie_name,
	movie_id 
from 
	movies
where movie_id IN
	(
	select 
		movie_id
	FROM
		movies_revenues
	WHERE
		revenues_domestic > revenues_international
	)

order by movie_id;
-- 
-- ================================================
-- Subqueries with JOIN 
-- list all the directors where their movies made more than the average total revenues of all english movies 
-- outer query: list all the directors
-- inner query: movies made more than the average total revenues of all english movies 

select * from movies_revenues;


select 
	d.director_id,
	(r.revenues_domestic + r.revenues_international) as "total_revenues"
from directors d 
inner join movies mv on d.director_id = mv.director_id
inner join movies_revenues r on r.movie_id = mv.movie_id
where 
	(r.revenues_domestic + r.revenues_international) > 
	(
	select 
		AVG(revenues_domestic + revenues_international) as "avg_total_revenues"
	FROM
		movies_revenues  --332.0135135135135135
	);
	
-- outer query without from

select 
	(
	select Min(revenues_domestic) from movies_revenues
	),
	(
	select Max(revenues_international) from movies_revenues
	)


-- corelated subqueries

-- list all movie name, movie language, and movie age certification of all movies with an above minimum length of 
-- for each age certification 

SELECT * from movies;


select 
	m1.movie_name,
	m1.movie_lang,
	m1.age_certificate, 
	m1.movie_length
from movies m1
where 
	m1.movie_length > 
	(
	select 
		min(movie_length) 
	FROM movies m2 
	where m1.age_certificate = m2.age_certificate
	)
order by movie_length






