select version(), user(), database();
-- Will return verson and root user and db name.

select lang_id, 'Common' as lang_usage, 
lang_id * 3.14 as 'Lang_id_pi',
upper(lang_name)
from ttp;

-- practive with me
select 
	concat(c.customer_id, ' - ', r.rental_id) as 'Customers and rental id',
	concat(c.first_name, ' , ' ,c.last_name) as "fullname",
	date(r.rental_date) as 'rental_date',
    time(r.rental_date) as 'rental time',
    c.email as 'E-mail'
from rental r join customer c on r.customer_id = c.customer_id
group by date(rental_date)
order by fullname asc
