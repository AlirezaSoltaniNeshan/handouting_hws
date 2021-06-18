select
c.first_name, 
c.last_name, 
addr.address,
addr.city
from customer c
inner join (
    select a.address_id,
    ct.city
    from address a
    inner join city ct 
    on a.city_id = ct.city_id
    where a.district = 'California'
) addr
on c.address_id = addr.address_id


-- actor with fimls and langs will be
-- do with me later

select * 
from film f
inner join film_actor fa using(film_id)
inner join actor a using(actor_id)
where (a.first_name = 'CATE' and a. last_name = 'MCQUEEN')
or (a.first_name = 'CUBA' and a.last_name = 'BIRCH')


select * from person inner join self_service(using person_id)


-- SEL JOIN

select f.title, f_prnt.title prequel
from film f 
    inner join film f_prnt
    on f_prnt.fil_id = f.prequel_film_id
where f.prequel_film_id is not null