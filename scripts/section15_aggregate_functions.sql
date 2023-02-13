-- Database: movies

-- COUNT() function
-- select count(column) from tablename

select * from movies;
select count(*) from movies;

-- using count with distinct 
-- count all movie distinct languages

select
	count(movie_lang)
FROM 
	movies;

-- ++++++++++++++++++++++++++++++++++++++++++
select 
	DISTINCT(movie_lang) 
FROM 
	movies;
-- both give same results	
SELECT
	movie_lang 
FROM
	movies
GROUP BY movie_lang;

/*
"Portuguese"
"German"
"Chinese"
"English"
"Swedish"
"Spanish"
"Korean"
"Japanese"
*/
-- ++++++++++++++++++++++++++++++++++++++++++++
select 
	count(DISTINCT(movie_lang) )
FROM 
	movies;
	-- 8
-- but here is not the same 	
SELECT
	movie_lang,
	count(movie_lang) 
FROM
	movies
GROUP BY movie_lang;

/*
"Portuguese"2
"German"	1
"Chinese"	5
"English"	38
"Swedish"	1
"Spanish"	1
"Korean"	1
"Japanese"	4
*/

-- ##################################################

-- count all distinct movie director
select 
	count(DISTINCT(director_id))
FROM
	movies;
	
-- count all english movies 
select 
	count(movie_lang)
FROM
	movies
WHERE 
	movie_lang = 'English';

select 
	count(*) 
from 
	movies_revenues
WHERE revenues_international IS NULL;

-- ###################################################
--                  SUM() function
-- ###################################################
/*
SUM() is an aggregate function that returns the sum of values or distinct values.

SUM(DISTINCT expression)
The SUM() function ignores NULL. It means that SUM() doesn’t 
consider the NULL in calculation.
*/

select 
	Sum(revenues_domestic)
from 
	movies_revenues
where 
	revenues_domestic > 200;
	
	
-- Find the total movie length of all movies with english languages 
select * from movies;
--
select 
	sum(movie_length)
FROM
	movies
WHERE
movie_lang = 'English';
--
select 
	movie_lang,
	sum(movie_length)
from 
	movies
group by movie_lang
;
--
select 
	movie_lang,
	count(movie_lang)
from 
	movies
group by movie_lang
;
--
select 
	(age_certificate) 
FROM
	movies
GROUP by age_certificate;

-- ########## MIN(),MAX() function ##############

select 
	max(release_date)
FROM
	movies;
	
-- ##############################################
--   GREATEST(list) 	LEAST(list)
/* 
these functions select the largest and smallest value 
from the list
*/

-- ##############################################
select greatest(10,30,60);











































