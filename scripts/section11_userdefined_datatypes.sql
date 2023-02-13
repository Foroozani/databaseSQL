-- Database: mydata

-- ############################################################################
-- in this tutorial, you will learn how to create PostgreSQL 
-- user-defined data type using CREATE DOMAIN and CREATE TYPE statements.
-- In PostgreSQL, a domain is a data type with optional constraints e.g., NOT NULL and CHECK.
-- A domain has a unique name within the schema scope

-- CREATE DOMAIN name AS data_type constraint
-- ############################################################################
-- 1. 
-- 'addr domain with varchar(100)'

CREATE DOMAIN addr varchar(100) NOT NULL; 

create table locations (
	address addr
);

insert into locations (address) values ('123 london');

select * FROM locations;

-- 2.
-- another example 
-- domain with positive numeric value 

CREATE DOMAIN positive_numeric AS INT NOT NULL CHECK (value >= 0 );

create table sample(
	sample_id serial primary key,
	value_num positive_numeric
);

insert into sample (value_num) values (-2);

select * from sample;

-- 3. 
-- # 'proper_email' domain to check for a valid email address 

create domain proper_email as varchar (150) not null check (value !~ '\s' );

-- 4. 
-- create an enumeration type domain 

CREATE DOMAIN valid_color AS varchar(10) not null CHECK (VALUE IN ('green', 'blue', 'red'));

-- #########################
-- To get all domains in a specific schema, you use the following query:

SELECT typname 
FROM pg_catalog.pg_type 
  JOIN pg_catalog.pg_namespace 
  	ON pg_namespace.oid = pg_type.typnamespace 
WHERE 
	typtype = 'd' and nspname = 'public';

-- ===============================
--      DROP a domain datatype 
-- ===============================
-- DROP DOMAIN name 

-- #########################################
--              CREATE TYPE
-- #########################################

-- The CREATE TYPE statement allows you to create a composite type, 
-- which can be used as the return type of a function.

-- CREATE TYPE name AS (fields	fields_properties)

create type address AS (
	town varchar(50),
	city varchar(50),
	country varchar(5));
	
CREATE table companies (
	comp_id serial primary key, 
	its_addres address
);
	
-- when we have composite data type we can use very handy function 
-- to add values which is ROW

insert into companies (its_addres) values (ROW ('LOndon', 'Leeds', 'Uk') );

select * from companies;
	
insert into companies (its_addres) values (ROW ('Fars', 'Shiraz', 'IRN') );
insert into companies (its_addres) values (ROW ('Isfahan', 'Isfahan', 'irn') );
insert into companies (its_addres) values (ROW ('new york', 'America', 'USA') );

SELECT its_addres from companies;

SELECT (its_addres).country from companies;





























