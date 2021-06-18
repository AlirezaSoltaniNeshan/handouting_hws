use sakila;


-- select * from actor;
-- Exercise 3-1
/*select actor_id, last_name, first_name
from actor order by last_name, first_name;*/

-- Exercise 3-2
/*select actor_id, first_name, last_name
from actor where last_name = 'WILLIAMS' or last_name = 'DAVIS';*/

-- Exercise 3-3
/* select distinct customer.customer_id 
from customer join rental on customer.customer_id = rental.customer_id
where date(rental.rental_date) = '2005-07-05' */

-- Exercise 3-4
/* select c.email, r.return_date
from customer c inner join rental r on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14'
order by 1, 2 */










