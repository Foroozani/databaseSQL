-- Table: public.movies

-- #####################################
--         string functions
-- #####################################
-- LOWER(), UPPER(), INITCAP()
-- LEFT(), RIGHT()
-- 

select * from movies;

select upper(movie_name) from movies;
select lower(movie_name) as movie_name_in_lower from movies;

select * from actors;

select 
	initcap(concat_ws(' ',first_name,last_name))
FROM actors;

-- Left(string,n) the first n string
-- left(string, -n) the whole string except the last n character

select LEFT('ABCDE', 3);

select LEFT('ABCDE', -3);

-- 
select 
	LEFT(first_name,1) as initial,
	count(1) as countOfInitial
from directors 
group by initial
order by 1;

-- find all directors where their last name ends with 'on'

select 
	last_name 
from directors
where 
	right(last_name,2)='on';
	
-- 	SPLIT_PART(string, delimeter, position)
--Split a string on a specified delimiter and return nth substring

select split_part('hello this- is- a test to- get substring', '-', 3);

select movie_name, release_date from movies;

select movie_name, release_date, split_part(cast(release_date as text), '-',1)
from movies;

/*
TRIM, LTRIM, RTRIM, BTRIM
TRIM([leading | trailing | both] [characters] FROM string)
spaces is default charachter
*/

-- TRIM (LEADING from string)

SELECT TRIM('   pqsl is amaizing    ');

"pqsl is amaizing"


select TRIM(leading from '  hello');   -- "hello"

select TRIM(trailing from '  hello   ');  -- "  hello"

select TRIM(leading from '  hello');   

select TRIM(leading from '    00000012235' );   -- "00000012235"

select TRIM(leading '0' from trim(leading from '    00000012235' ) );   -- "12235"

SELECT TRIM('0' from 000012300::TEXT);   -- "123"

-- LPAD(), RPAD()
-- pads a string on the left to a specified length with a sequnce of charachters

select LPAD('database', 15, '*');   "*******database"



-- POSITION()
-- this function returns the location of a substring in a string 
-- POSITION(substring IN string)

select POSITION('is' IN 'Najmeh is amazing');   --8 

-- STRPOS()
-- This function is used to find a position STRPOSE('string',substring)-->integer
select STRPOS('world bank', 'bank');   -- 7 

-- display specific substring "on" in a string 
select first_name, last_name, strpos(last_name, 'on') 
from directors order by 3 DESC;


select first_name, last_name from directors
where strpos(last_name, 'on') > 0;


-- SUBSTRING FUNCTION 
-- To extract a substing from a string 
-- SUBSTRING(string [FROM start_position] [FOR length])
-- SUBSTRING(string, start_position, length)

select SUBSTRING('ABCDEF',1,3);

--
/*

Sometimes, you want to search and replace a string in a column with a new one
such as replacing outdated phone numbers, broken URLs, and spelling mistakes
To search and replace all occurrences of a string with a new one, 
you use the REPLACE() function.

REPLACE(source, old_text, new_text );


*/


































