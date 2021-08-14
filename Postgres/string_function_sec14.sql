-- *****************************************
-- LEFT(string, n)
-- it return the FIRST n charachter from the string 
-- *****************************************
SELECT LEFT('Hello Najmeh',7);

SELECT
  LEFT (first_name, 1) as initial,
  COUNT(*) as "total initial"
from directors
GROUP BY 1
ORDER BY 1;
-- RIGHT() return the LAST n charachters in the string
SELECT
  first_name,
  last_name
FROM public.directors
where RIGHT (last_name, 2) = 'on'
AND RIGHT (first_name, 1) = 's';

-- REVERSE(string) function 
-- it used to arrange a string in reverse order 

-- *********************************************************** 
--                 SPLIT_PART() function 
-- ***********************************************************
-- this function splits a string on a specified delimiter and return the "nth" substring
-- SPLIT_PART(string, delimiter, position)

SELECT SPLIT_PART('123:4567:979745:734', ':', 3);
SELECT SPLIT_PART('dhfjs|jfhdfhgj|dfhgjdhsfgh', '|', 2);
SELECT SPLIT_PART(CAST (123456.7979745734 as TEXT), '.', 1);

-- get only the release year from the movie YYYY-MM-DD

SELECT * FROM public.movies;

SELECT 
  movie_name,
  release_date,
  SPLIT_PART(release_date::text,'-', 1) as "year released"  --  NOTE the input should be string thats why I cast it to text first
from public.movies;

-- *****************************************
-- TRIM, BTRIM, LTRIM and RTRIM function 
-- *****************************************
/* 

TRIM      removes the longest string that contains a specific charachter from a string 
LTRIM     removes all charachters, spaces by default, from the begining of the string 
RTRIM     removes all charachters, spaces by default from the end of the string 
BRIM      is the combination of BOTH, LTRIM() and RTRIM() functions.

TRIM(LEADING | TRAILING | BOTH [charachter] FROM string)
LTRIM(string, [charachter]);
RTRIM(string, [charachter])
*/

SELECT 
  TRIM (LEADING FROM '     HELLO SQL'),
  TRIM (TRAILING FROM 'HELLO SQL.   ');

-- removing say leading zero from a number 00003588 NOTE, THE INPUT IS STRING 
SELECT 
  TRIM (LEADING '0' FROM CAST (000023548 AS TEXT));  
  
SELECT  
   LTRIM('yummy', 'y');

SELECT 
  RTRIM('yummmmm', 'm');
-- this function pads a string on left/right to a specified length with a sequence of charachter 
SELECT LPAD ('database', 15, '*');
SELECT RPAD ('hello', 20, '%');

-- LENGTH(string)
SELECT LENGTH ('HELLo');
SELECT LENGTH (CAST (1234567 as TEXT));
-- *****************************************
-- POSITION()
-- *****************************************
-- return the location of SUBSTRING in a string 
-- POSITION (substring IN string)

-- *****************************************
-- STRPOS() FUNCTION 
-- *****************************************
-- is used to find the position from where the substring is being matched within the string 
-- STRPOS(<string>, <substring>)
SELECT STRPOS('Hello bank of balabla', 'bank');

-- *****************************************
-- SUBSTRING() function 
-- *****************************************
-- a function allows you to extract a substring from a string 
-- substring (string [from start_position]  [for length])
-- SUBSTRING (string, start_position, length)
SELECT SUBSTRING ('what a wonderful DAY' from 2 for 6); -- hat a

-- *****************************************
-- REPLACE () function 
-- *****************************************
-- replace function replaces all ocurances of a specified string 
EXPLAIN SELECT REPLACE ('I love cats', 'cats', 'dogs');

UPDATE 
set col1 = REPLACE (col1, '1', '2')


