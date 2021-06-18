-- select * from payment

-- There are some note about joins 
-- in inner join that only write "join" we want retrieve only share between two table with
-- some primary key and foreign key that references between them, we must use ON statement in 
-- our "join" 
-- select * from payment as pay join customer as cust on cust.customer_id = pay.customer_id

-- But instead of using from on statement we can use from "USING" function,
-- using function has 1 arg
-- your primary key and foreign key  that refereneces between two table like some unique id
-- select * from payment as pay join customer as cust using(customer_id)