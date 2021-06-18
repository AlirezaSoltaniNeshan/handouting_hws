-- This is a permenently table in SQL
-- -- That save permenently in storage
create table log_login(
	log_id int unsigned primary key not null,
    log_date datetime null
)

-- This is a Derived table, nested Query to other Query
-- -- All Actor, whose act in same film like actor is act in with id 1
select 
	concat(atr.actor_id, ' -- ', fa.film_id) as "Actor and Film ID",
    concat(first_name, '-- ', last_name) as "Fullname",
    title as 'File title',
    description,
    release_year,
    rating    
from 
	film_actor as fa join actor as atr on atr.actor_id = fa.actor_id
	join film as f on f.film_id = fa.film_id
where 
	fa.film_id in (select film_id from film_actor where actor_id = 7)


-- Temporary Table 
-- -- This tables is like permannetly tables,
-- -- but any data inserted into a temporary table will disappear at some point.
-- -- (usually when your database session is closed or end of transaction)

create temporary table langs (
	language_id int primary key not null,
    name varchar(10) null,
    last_update datetime
);

insert into langs (select * from sakila.language);
select * from langs;

-- Next type of table in mysql
-- -- Create View define a new table as a virtual table from your query, 
-- -- eventually your View table has not any data or schema, in fact 
-- -- it has only a query that call some row and you create a shortcut to arive that
create view acter_in_a_film
as
select 
	concat(atr.actor_id, ' -- ', fa.film_id) as "Actor and Film ID",
    concat(first_name, '-- ', last_name) as "Fullname",
    title as 'File title',
    description,
    release_year,
    rating    
from 
	film_actor as fa join actor as atr on atr.actor_id = fa.actor_id
	join film as f on f.film_id = fa.film_id
where 
	fa.film_id in (select film_id from film_actor where actor_id = 7)

