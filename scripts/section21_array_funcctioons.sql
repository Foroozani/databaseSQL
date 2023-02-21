-- Database: movies

-- ########################################
--    AARAY
-- ########################################
-- array concatination 

SELECT
	ARRAY[1,2,3] || ARRAY[4,5,6] AS "combined array"
	
SELECT
	array_cat(array[1,2,3], array[4,5,6])


-- ########################################
-- array metadata functions 	
-- array_ndim(anyarray) --> dimension in array 

SELECT array_ndims(array[[1,3,4], [5,7,8]])

-- 
CREATE TABLE contacts (
	id serial PRIMARY KEY,
	name VARCHAR (100),
	phones TEXT []
);

-- Insert PostgreSQL array values

INSERT INTO contacts (name, phones)
VALUES('John Doe',ARRAY [ '(408)-589-1111','(408)-589-2222' ]);

-- We used the ARRAY constructor to construct an array and insert it into the contacts table. 
-- You can also use curly braces with ""

INSERT INTO contacts (name, phones)
VALUES('Lily Bush','{"(408)-589-3333"}'),
      ('William Gate','{"(408)-589-4444","(408)-589-5555"}');


select * from contacts;

SELECT
	name,
	phones [ 2 ]
FROM
	contacts;
-- 

SELECT
	*
FROM
	contacts
WHERE
	phones [ 2 ] = '(408)-589-58423';

-- search for any array in all rows 

select 
	* 
FROM
	contacts
WHERE
	'(408)-589-3333' = ANY (phones);
	
-- MOdify array content
-- ########################################

UPDATE contacts
SET phones [2] = '(408)-589-6666'
WHERE ID = 2;

SELECT * from contacts;
-- 

SELECT
	name,
	unnest(phones)
FROM
	contacts;











