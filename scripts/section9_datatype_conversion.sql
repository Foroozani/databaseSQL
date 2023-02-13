-- Database: movies

-- data type conversion
-- ##############################

-- 1. Implicit conversion, data conversion is done AUTOMATICALLY
-- 2. Explicit conversion, data conversion is done via 'conversion function' like CAST/ :: 

select integer '10';

select * from movies;


select * from movies 
where movie_id = 1;

-- under the hood SQL change this string to integer (implicit conversion)
select * from movies 
where movie_id = '1';

-- Explicit conversion 
select * from movies 
where movie_id =integer '1';



select * from movies 
where movie_id = 1;

-- using CAST for data conversions 
-- ################################

select 
	cast('10' as integer);

SELECT
	cast('2023-02-05' as date ),
	cast('2023-May-05' as date);
	
SELECT
	'10':: INTEGER;

-- STRING TO INTERVAL 

select 
	'10 minute':: interval,
	'1  week':: interval,
	'5months':: interval
	