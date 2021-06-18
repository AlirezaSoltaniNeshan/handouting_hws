-- exp 5.1
-- select c.first_name, c.last_name, a.address
-- from customer c join address a using(address_id) 
-- join city using(city_id) where a.district = "California"

-- exp 5.2
-- select title from film
-- join film_actor using(film_id) 
-- join actor using(actor_id) 
-- where act.first_name = "JOHN"

-- exp 5.3
select addr1.address
	from address addr1
    join address addr2 on addr1.address_id = addr2.address_id
where addr1.city_id = addr2.city_id









