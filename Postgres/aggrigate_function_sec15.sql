-- ***********************************************
-- COUNT(*)
-- select count(colomnname) from tablename

-- count all records of movies 
SELECT 
COUNT (*)
FROM movies;

-- using count with distinct 
SELECT * from public.movies;

SELECT 
  movie_lang,
  COUNT(*)
from public.movies
GROUP BY 1;

SELECT COUNT (DISTINCT movie_lang) FROM public.movies;

SELECT 
  COUNT(*)
from public.movies
  WHERE movie_lang IN ('English', 'Japanese');   -- 38+4

-- ########################################################
--                       SUM() function
-- ########################################################
-- SELECT (colomnname) from tablename

-- lets look at all the movie revenue 
SELECT * FROM public.movies_revenues;

SELECT 
  SUM(revenues_domestic + revenues_international ) 
FROM public.movies_revenues;


-- #######################################################
--             GREATEST and LEAST function 
-- #######################################################

-- this function select the largest and smallest value from the list of any number of expression 
/*

GREATEST (list) GREATEST(col1, col2, col3)
LEAST(list)

*/

SELECT GREATEST(10,200,30,878,8748953);
SELECT LEAST (-10,20,66,0);

-- #######################################################
--              AVG AVERAGE FUNCTION 
-- #######################################################
-- calculate average value on a given set. It will return one single value 

/*
-- #####################################################
--   COMBINING COLUMNS using mathemathical operator
-- #####################################################

Addition          + 
subtraction       -
division          /
multiplication    *
*/

SELECT 3+6;

SELECT 
  revenues_domestic,
  revenues_international,
  revenues_international + revenues_domestic AS total_revenue
from public.movies_revenues
ORDER by total_revenue DESC nulls LAST ;




