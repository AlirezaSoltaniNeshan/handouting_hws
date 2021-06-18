-- My fullname is: Alireza Soltani Neshan
-- Student Code is: 98111033302016
-- Couse Code is: 23033 8-11 

-- Q4
-- select substr(address, 8, 12) from users_addre

-- Q5
-- select 
-- 	id, 
--     first_name,
--     last_name
-- from users
-- order by 2
-- Because we use Fa and En together

-- Q6
-- select * from users id
-- select * from users_addre -- user_id
-- select u.first_name, u.last_name, u.natural_code
-- city, ua.address from users u 
-- join users_addre ua on ua.user_id = u.id

-- Q7
-- select * from payment where main_price in(40000000, 30000000, 20000000)

-- Q8 THIS IS SELFJOIN QUERY!!
-- select ua1.address, ua1.city from users_addre as ua1 
-- join users_addre as ua2
-- where ua1.city = ua2.city

-- Q9
-- select id, first_name, last_name 
-- from users where last_name in("محمدي", "حسيني")

-- Q10 
-- select name from payment join users 
-- on users.id = payment.user_id
-- join cars on cars.serial_id = payment.car_serial_id
-- where last_name = "محمدي";

-- Q11
-- select * from users where last_name like "___R%A%"






