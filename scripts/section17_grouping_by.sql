-- Grouping data 
-- 
select * from movies;

select movie_lang, sum(director_id)
FROM movies
group by movie_lang;

-- 
-- GET the Sum total movie length per age certificate 

select 
	age_certificate, 
	sum(movie_length)
FROM 
	movies
group by age_certificate;

-- list minimum and maximum movie length group by movie language

select 
	movie_lang, 
	count(movie_lang),
	min(movie_length), 
	max(movie_length)
FROM
	movies
GROUP by movie_lang;


select 
	age_certificate, 
	count(age_certificate),
	min(age_certificate), 
	max(age_certificate)
FROM
	movies
GROUP by age_certificate;
-- 
-- get average movie_length group by movie_language and age certification  

select 
	movie_lang,
	age_certificate,
	count(movie_lang) as count_movie_lang,
	count(age_certificate) as count_age_certificate,
	avg(movie_length)
FROM
	movies
GROUP By movie_lang, age_certificate;

-- let us filter some records too 
-- get average movie length group by movie language and age certification where movie
--lenght greater than 100 


select * from movies;

-- GROUPING base on two colomns
select 
	movie_lang,
	age_certificate, 
	count(movie_lang) as "count_movie_lang",
	count(age_certificate) as "count_age_certificate"
FROM
	movies
WHERE
	movie_length > 100
GROUP BY age_certificate, movie_lang
order by movie_lang;

-- #############################################################
--                           HAVING
-- #############################################################

-- list movies languages where sum total length of the movies is greater than 200 

select * from movies;

SELECT
	movie_lang, 
	sum(movie_length) AS "total length"
FROM 
	movies
GROUP by 1
having sum(movie_length) > 200
;









































