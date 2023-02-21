-- 
/*
PostgreSQL supports inner join, left join, right join, full outer join, 
cross join, natural join, and a special kind of join called self-join.

*/

-- lets combine movies and director table
select * from movies;
select * from directors;
select * from movies_revenues;

--
select 
	mv.movie_name,
	mv.movie_id, 
	mv.director_id, 
	
	d.first_name
from movies mv
INNER join directors d
	ON mv.director_id = d.director_id;



select 
	* 
FROM movies
inner join directors using (director_id)
inner join movies_revenues using (movie_id);


-- 

select 
 	mv.movie_name,
	mv.movie_lang,
	
	d.first_name,
	d.last_name,
	
	r.revenues_domestic
from movies mv
inner join directors d on mv.director_id = d.director_id
inner join movies_revenues r on mv.movie_id = r.movie_id
where
	movie_lang = 'English';

-- select movie name, director name, for all english Chinesee and Japanese movies where domestic revenues is 
-- greater than 100 


select 
	mv.movie_name,
	mv.movie_lang,
	
	d.first_name,
	
	r.revenues_domestic,
	r.revenues_international,
	
	(r.revenues_domestic + r.revenues_international) as "total revenues"
from movies mv
inner join directors d using (director_id)
inner join movies_revenues r using (movie_id)

where 
	movie_lang IN ('English','Chinese','Japanese')
	order by 6 DESC NULLs LAST
limit 5;
	
	












































