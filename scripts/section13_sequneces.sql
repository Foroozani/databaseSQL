-- sequences 
/*
By definition, a sequence is an ordered list of integers. 
The orders of numbers in the sequence are important

*/


CREATE SEQUENCE three
INCREMENT -1
MINVALUE 1 
MAXVALUE 3
START 3
CYCLE;

select nextval('three');