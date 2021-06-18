-- select payment_id from payment where customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23')

-- select payment_id from payment where customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '20050619')

-- select * from payment where amount in (1.98, 7.98, 9.98)

select distinct
	customer.last_name as 'نام',
    customer.first_name  as 'نام خانوادگي'
from payment join customer on customer.customer_id = payment.customer_id
where customer.last_name like '_A%W%'
