-- use sakila;

-- SELF JOIN

-- select f.title, f_prnt.title prequel
-- from film f 
--     inner join film f_prnt
--     on f_prnt.fil_id = f.prequel_film_id
-- where f.prequel_film_id is not null


-- select f.title
-- from film f join film_actor using(film_id) join actor a using(actor_id) 
-- where (a.first_name = "CATE" and a.last_name = "MCQUEEN") or (a.first_name = 'CUBA' and a.last_name = "BIRCH")





