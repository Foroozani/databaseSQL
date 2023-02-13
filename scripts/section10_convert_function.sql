-- Database: movies

select release_date from movies;

-- to_char(expression, format)

select
	release_date,
	to_char(release_date, 'DD-MM-YYYY'),
	to_char(release_date, 'Dy, MM, YYYY')
FROM movies;


