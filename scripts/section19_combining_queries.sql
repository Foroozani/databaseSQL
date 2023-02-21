-- Database: movies

/*
UNION operator to combine result sets of multiple queries into a single result sets.

SELECT select_list_1
FROM table_expresssion_1
UNION
SELECT select_list_2
FROM table_expression_2
*/

-- combine directors and actors table 
select 
	first_name, last_name, 'from directors' as "table name"
from directors
UNION
SELECT
	first_name, last_name,'from actors' as "table name"
from actors
order by 3;
-- duplicate records are removed


-- Q: combine all directors where nationality are all American, Chinese, and Japanese with all female actors

SELECT
	first_name, last_name,
	'actors' as "Table name"
from actors
where gender = 'F'
union
select 
	first_name, last_name, 
	'directors' as "Table name"
from directors
WHERE
	nationality IN ('American', 'Chinese', 'Japanese');

--
-- Q: select the first name and last name of all directors and actors which born afrer 1990 

select * from actors;
select * from directors;

select 
	first_name,
	last_name, 
	date_of_birth,
	'is actor' AS "Table name"
FROM actors
where
	date_of_birth > '1970-01-01'
UNION	
select 
	first_name, 
	last_name,
	date_of_birth,
	'is director' AS "Table name"
from directors
where
	date_of_birth > '1970-12-31';
	
-- UNIONING tables with different number of colomn 
-- #################################################

/*
we have 
-* table1 with colomns: col1, col2
-* table2 with colomns:            col3

*/

create table table1 (
	col1 int, 
	col2 int
);

create table table2 (
	col3 int
);
	
-- lets use union with NULL 
-- each UNION query must have the sane number of colomn 

select col1, col2 from table1
union
select col3 from table2

-- ERROR:  each UNION query must have the same number of columns


select col1, col2 from table1
union
select NULL as col1, col3 from table2



-- ##############################################################
-- INTERSECT 
-- ##############################################################

/*
The INTERSECT operator returns any rows that are available in both result sets.
To use the INTERSECT operator, the columns that appear in the SELECT statements must follow the folowing rules:

    The number of columns and their order in the SELECT clauses must be the same.
    The data types of the columns must be compatible.

*/
select 
	first_name,
	last_name
FROM 
	actors
INTERSECT
select 
	first_name,
	last_name
FROM
	directors;
	
	
-- ########################################################################
--     EXCEPT
-- ########################################################################
/*
The EXCEPT operator returns distinct rows from the first (left) query that are not in the output of the second (right) query.

SELECT select_list
FROM A
EXCEPT 
SELECT select_list
FROM B;

*/


















 

















