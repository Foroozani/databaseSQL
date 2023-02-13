-- filtering data -- 

/*
select 
	* 
from table name 
where 
	condition 
*/

SELECT 
 	* 
FROM movies;
-- 

select 
	movie_lang 
from movies 
where movie_lang = 'English';

-- 
SELECT distinct movie_lang, movie_length 
from movies
where movie_length > 90;

-- 
select 
	count(movie_id) 
from movies 
where movie_lang = 'Japanese';

-- 

SELECT
	* 
FROM
	movies
where 
	movie_lang = 'English' 
	and age_certificate = '18';
	
-- all english or chinese movies 

select * from movies 
where 
	movie_lang = 'English' 
	OR movie_lang = 'Chinese'
order by movie_lang asc;


-- get all english or chinese and movies with age certificate 12 
-- with and withouth prantheses

SELECT * from movies
where 
	(movie_lang = 'English' 
	OR movie_lang = 'Chinese')
	AND age_certificate = '12';


-- FROM | WHERE | SELECT | ORDER BY

-- ######################################################
--                date 
-- ######################################################   

-- get all movies where release date is greater than 200 
select 
	* 
from 
	movies 
where release_date  >  '1999-12-31';

-- get all movies which is not english language 

select * from movies 
where movie_lang != 'English';

-- from actor table, get 10 younger 
select * from actors;

select
	* 
from actors
where 
	gender = 'F'
order by date_of_birth DESC
LIMIT 10;

-- ##############################################
--               IN & NOT IN
-- ##############################################

-- check a value matches or not matches in a list

-- get all movies for chinese, Japanese and English
select * from movies;

SELECT * from movies
where movie_lang = 'English'
	or movie_lang = 'Chinese'
	or movie_lang = 'Japanese';
	
-- using IN operator 
select * from movies 
where movie_lang IN ('English', 'Chinese', 'Japanese' );

-- get all records where actor_id not 1, 2, 3, 4 

select * from actors
where actor_id NOT IN (1, 2, 3, 4);

-- ###############################################
--       BETWEEN & NOT BETWEEN
-- ###############################################

select * from actors 
where date_of_birth between '1991-01-01' and '2000-01-01'
order by date_of_birth;


-- ###############################################
--          LIKE & ILIKE 
-- ###############################################

SELECT 'heLlo' like '%llo%'; 

SELECT 'Hello' like '_ello';

-- get all record names where first name contains 'l' on the second place 
SELECT
	* 
FROM actors
where
	first_name like '_l%'
;

-- ###############################################
--               NULL & NOT NULL 
-- ###############################################

-- 1. find list of actors with missing birth date

select * from actors 
where date_of_birth IS NULL; 


-- 2. find list of actors with missing birth date or first name 
select * from actors
where 
	date_of_birth IS NULL OR first_name IS NULL;
	
-- get list of movies with domestic revenue NULL 

select
	* 
from 
	movies_revenues
order by revenues_domestic NULLS first;

select 
	* 
from movies_revenues 
where 
	revenues_domestic is NULL;
	
-- get list of movies where either domestic or international revenues is NULL 

select 
	* 
from movies_revenues 
where 
	revenues_domestic is NULL
	or revenues_international is NULL;
	
	
-- ########################################
--     CONCATINATE 
-- ########################################





























