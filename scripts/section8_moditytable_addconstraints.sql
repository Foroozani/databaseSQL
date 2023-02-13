-- modify table structure, add constraints
-- in MYDATA databese

create table person ( 
	person_is serial primary key, 
	first_name varchar(20) not null, 
	last_name varchar(20) not null
);

alter table person
	rename column person_is to person_id;
	
	
alter table person
add column age INT;

select * from person;

-- rename a table 
alter table person rename to users;
 
alter table users rename to persons;


-- drop a column 
alter table persons 
drop column email;

alter table persons
add column person_age int;

alter table persons
add column nationality varchar(20) not NULL;

alter table persons 
add column email varchar (20) unique;

-- change data type of a column 

select * from persons;
 
alter table persons 
alter column person_age type varchar(10);

-- but from varchar to int there is error 

alter table persons 
alter column person_age type int
USING person_age::integer;

-- 
alter table persons
add column is_enable varchar(1);

alter table persons 
alter column is_enable set default 'Y';

insert into persons
(
	first_name, 
	last_name, 
	nationality, 
	person_age
)
values 
(
	'John',
	'pit',
	'US', 
	'40'
)


select * from persons;

-- Add a unique constraint to a column ----
-- ###########################################


create table web_links(
	web_id serial primary key, 
	link_url varchar(255) not null, 
	link_target varchar (20)
);

-- insert value into table 
INSERT INTO web_links 
	(link_url, link_target)
	values
	('http://google.com', '_blank');
	
select * from web_links;
-- Now we want a column to has a unique values, therefore 
-- we need to add constraint into that

ALTER table web_links
add Constraint unique_web_url_rule UNIQUE (link_url);

INSERT INTO web_links 
	(link_url, link_target)
	values
	('http://amazon.com', '_blank');
	
-- we only allow column to accept certain values only

alter table web_links 
add column is_enable VARCHAR(2);

-- we want is_enable column to be Y or N

INSERT INTO web_links 
	(link_url, link_target, is_enable)
	values
	('http://netflix.com', '_blank', 'Y');

ALTER TABLE web_links
ADD CHECK (is_enable IN ('Y', 'N'));

-- now lets try to add another value like YN

INSERT INTO web_links 
	(link_url, link_target, is_enable)
	values
	('http://aws.com', '_blank', 'N');
	
select * from web_links;


INSERT INTO web_links 
	(link_url, link_target, is_enable)
	values
	('http://aws3.com', '_blank', 'N');
	
-- now lete fill the null valu 

UPDATE web_links 
set is_enable = 'Y'
where web_id = 1;

select * from web_links;	

UPDATE web_links 
set is_enable = 'N'
where web_id = 1;








