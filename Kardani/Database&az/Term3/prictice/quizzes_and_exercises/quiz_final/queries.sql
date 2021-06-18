-- use sazman_bargh
-- select * from user_stuff;
-- select * from users;
-- Q4
-- select username, concat(first_name, " ", last_name) as "FullName", city, postal_code, address, house_plate
-- from users join user_stuff using (user_id);


-- Q5 
-- select substr(last_name, 2, 4) from users 

-- Q6
-- select postal_code from user_stuff where city = "تهران";

-- Q7
-- select user_id, postal_code, first_name, last_name
-- from users join user_stuff using (user_id)
-- order by 2;

-- Q8
-- select * from users join user_stuff using(user_id) where postal_code like "__5%6%"

-- Q9
-- select file_serial as "شماره پرونده"  from user_stuf_usage

-- Q10
-- select * from payments where pay_price in(14500, 13500, 165000);

-- Q11
-- select file_serial, user_id, last_name from users join user_stuff using(user_id) where postal_code = "1234567890" or postal_code = "1234567891";

