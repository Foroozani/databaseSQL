-- Database: movies

--############################################
--           DATE , TIME, TIMESTAMPS
-- ###########################################

-- 
SHOW datestyle;

-- converting string to date format
-- TO_DATE(text,format)

SELECT TO_DATE('20170103','YYYYMMDD');


SELECT TO_DATE('10 Feb 2017', 'DD MON YYYY');


-- 
SELECT TO_TIMESTAMP(
    '2017-03-31 9:30:20',
    'YYYY-MM-DD HH:MI:SS'
);


-- TO_CHAR()
/*
It converts 
- timestamps
- an interval
- an integer
- a double precision 
- a numeric value 

TO A STRING 
TO_CHAR(EXPRESSION,FORMAT)
*/

SELECT to_char('2020-01-03 10:10:00'::timestamptz, 'YYYY Month DD');


-- using math operations with date

SELECT date '20201013' +10;

SELECT '20200316'::date +10;

SELECT '20200403'::date + '03:24:21'::time;

SELECT age('2020-10-12', '2020-09-12');



CREATE TABLE log (
    log_id SERIAL PRIMARY KEY,
    message VARCHAR(255) NOT NULL,
    created_at TIME DEFAULT CURRENT_TIME,
    created_on DATE DEFAULT CURRENT_DATE
);


select * from log;

INSERT INTO log( message )
VALUES('Testing SECOND function');

SELECT extract(epoch from now());


select * from actors;


select
	date_of_birth,
	extract(epoch from date_of_birth) 
from actors;


select 
	extract(epoch from timestamptz '2020-10-10') - extract(epoch from timestamptz '2020-09-09');


select * from pg_timezone_names();







