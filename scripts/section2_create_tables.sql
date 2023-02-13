-- create a table 

CREATE table actors (
	actor_id SERIAL primary key,
	first_name varchar(150),
	last_name varchar(150) not null,
	gender char (1),
	date_of_birth DATE, 
	add_date date, 
	update_date date
	
);

-- create table 

CREATE table directors (
	director_id serial primary key,
	first_name varchar (150), 
	last_name varchar (150), 
	date_of_birth date, 
	nationality varchar (20),
	add_date date, 
	update_date date
);


SELECT * FROM directors;
SELECT * from actors;


CREATE TABLE movies (
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(100) NOT NULL,
	movie_length INT,
	movie_lang VARCHAR(20),
	age_certificate VARCHAR(10),
	release_date DATE,
	director_id INT REFERENCES directors (director_id)
);