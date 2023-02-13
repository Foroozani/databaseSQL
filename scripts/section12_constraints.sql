-- Database: mydata
-- 
-- PSQL constraints 

/*
	basically there are two ways of doing this ONE: creata a table with constraint and second:
	update an existing table with constrait 
	
	UPDATE      INSERT
		
	1. constraints are like 'gate keeper' 
	2. controls kind of data goes into the database
	3. constraints are the rules enforced on data colomn or a table 
	4. they assure the accuracy and reliabality of the data 
	
	- TABLE
	- colomn 
	
	5. Types of constraints
	
	NOT NULL        field must have value
	UNIQUE          only uniqe values are allowed 
	DEFAULT         ability to set default values 
	PRIMARY KEY     uniquely identifies each row in a database table 
	FOREIGN KEY     constraints data based on colomns in other table 
	CHECK           check all values if meet specific criterias

*/

-- ##########################################
-- Null Null constrint
/*
	NULL represents unknown or information missing. 
	NULL is not the same as an empty string or the number zero
	
	Use the NOT NULL constraint for a column to enforce a column not accept NULL.
	By default, a column can hold NULL.
	To check if a value is NULL or not, you use the IS NULL operator. The IS NOT NULL 
	negates the result of the IS NULL.
	Never use equal operator = to compare a value with NULL because it always returns NULL.

*/
-- ##########################################


