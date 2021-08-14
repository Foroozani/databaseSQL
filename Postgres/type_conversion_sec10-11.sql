/* 
A data is converted from its original data type to ANOTHER data type 

TWO type of conversion 
  - explicit  data conversion is done via conversion function e.g. CAST 
  - implicit data conversion is done automatically 
*/


SELECT * FROM public.movies
where movie_id = 1;


SELECT * FROM public.movies
where movie_id = '1'; -- postgress automatically do the conversion here i.e Implicit conversion 

-- USING CAST for data type conversion 
-- CAST (expresion AS target_data_type)
SELECT  CAST ('20' as INTEGER );

SELECT CAST ('01-May-2020' as DATE);

-- you can also use the following syntax for conversion directly 

SELECT 
  '10':: INTEGER, 
  '01-02-2020':: DATE,
  10 :: DOUBLE PRECISION;

SELECT 
  substr(CAST ('1235485147567 ' as TEXT), 4)  as "result";

-- ====================================================
-- SECTION 10 
-- ====================================================
  /*
TO_CHAR() function: it converts timestamp, interval, integer, ... to STRING
TO_CHAR(expresion, format)
*/
SELECT 
  TO_CHAR(1007896, '9,9999000');

SELECT 
  release_date, --integer
  TO_CHAR(release_date,'DD-MM-YYYY') as "another format", -- is string format 
  TO_CHAR(release_date, 'Dy-MM-YY') AS "ANOTHER STRING FORMAT"
FROM public.movies;

SELECT 
  TO_CHAR(TIMESTAMP '02-08-2021 10:25:35', 'HH24:MI:SS');


SELECT 
  TO_CHAR(TIMESTAMP '02-08-2021 10:25:35', 'DD-YY-YY');

-- *****************************
--       TO_NUMBER()
-- *****************************
-- TO_NUMBER() function converts a character string to a numeric value 
-- TO_NUMBER(string, format). --> numeric


-- ******************************
--     TO_DATE()
-- ******************************
-- function that conversts string to a date
-- TO_DATE(text, format) --> date

-- *****************************
--      TO_TIMESTAMP()
-- *****************************

-- this function convert a string to TIMESTAMP based on specified format 
-- TO_TIMESTAMP(text, format) --> timestamp with time zone 

