-- use azdb
-- select * from favorite_food;

-- select fname, lname from person join favorite_food using(person_id)
-- where lname like '__R%A%'

-- use online_shop
-- select * from customers inner join payment using(cust_id) join products using(product_id)


-- insert into payment values(
-- 	null,
--     442587,
-- 	548845,
--     2000,
--     1,
--     "2020-12-10",
--     1
-- )

-- insert into products (product_id) values(145892)
-- insert into products (product_id) values(187587)
-- insert into products (product_id) values(548845)


-- insert into customers(cust_id, cust_username, cust_password, cust_first_name, cust_last_name) 
-- values(2255887, "AliHosin", "sdasbsdasbsdasbsdasb" , "علیرضا", 
-- "حسيني")
-- insert into customers(cust_id, cust_username, cust_password, cust_first_name, cust_last_name) 
-- values(2255851, "AliHosin2", "sdasbsdasbsdasbsdasb" , "بهار", 
-- "محمدي")


-- select * from payment where product_price_with_tax in (190000, 180000, 2000)



-- insert into customers(cust_id, cust_username, cust_password, cust_first_name, cust_last_name) 
-- values(448799, "AMBDR@F", "sdasbsdasbsdasbsdasb" , "AmirAli", "Bandi")

-- insert into customers(cust_id, cust_username, cust_password, cust_first_name, cust_last_name) 
-- values(448847, "BaharJon", "sdasdgjhhgjjhkjh" , "Bahar", "Shahin")

-- insert into customers(cust_id, cust_username, cust_password, cust_first_name, cust_last_name) 
-- values(558844, "Akef90", "sdasbsdasbsdasbsdasb" , "lifi", "Akef")

-- insert into customers(cust_id, cust_username, cust_password, cust_first_name, cust_last_name) 
-- values(441859, "sima67", "sdasbsdasbsdasbsdasb" , "Sima", "Ghorbani")

-- select cust_id 'شماره مشتري' , cust_first_name as "نام", cust_last_name as 'نام خانوادگي' from customers 
-- where cust_last_name = 'حسيني' or cust_last_name = 'محمدي'

-- use azdb;

-- select * from person where fname like 

-- insert into person (fname, lname) values("HAMID", "NARINI")

-- select 
-- customers.cust_id, 
-- products.product_id, 
-- customers.cust_first_name, 
-- customers.cust_last_name, 
-- payment.product_price_with_tax, 
-- payment.tnx_date, products.product_name
-- from customers inner join payment using(cust_id) join products using(product_id)