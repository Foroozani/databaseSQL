-- section 7
-- DATA TYPE
-- #################################

-- Boolean --> True, 'true', 'yes', '1', 'y', 't'
           --> False, 'false', 'no', '0', 'n', 'f'
		   
-- #################################

SELECT CURRENT_TIME;

CREATE TABLE table_boolian (
    product_id SERIAL NOT NULL,
    is_available BOOLEAN NOT NULL
);
INSERT INTO table_boolian (is_available) VALUES (TRUE);
SELECT * FROM table_boolian;

INSERT INTO table_boolian (is_available) VALUES ('true'), ('false'), ('1'), ('0'), ('n'), ('yes');
INSERT INTO table_boolian (is_available) VALUES (FALSE);

SELECT * FROM table_boolian
where is_available = TRUE;

SELECT * FROM table_boolian
where is_available = 'true';

SELECT * FROM table_boolian
where is_available = '0';


SELECT now();