-- SECTION 1
-- create database check_cars
-- use check_cars

-- create table experts(
-- 	exp_id int unsigned primary key not null,
--     exp_fullname varchar(100) null,
--     exp_phone varchar(12) null,
--     exp_email varchar(100) null,
--     exp_sign_in datetime,
--     exp_sign_out datetime,
--     exp_degree varchar(15) null,
--     exp_shiftf enum('day', 'night') null
-- );

-- insert into experts 
-- values(
-- 	1101,
--     "AMIRABAS AMOLI",
--     "77212233",
--     "exp1@test.com",
--     "2000-05-06 12:54:32",
--     "2019-05-12 15:34:52", 
--     "",
--     "day"
-- )

-- insert into experts 
-- values(
-- 	1102,
--     "BABK SAMAIE",
--     "77225588",
--     "exp2@test.com",
--     "2001-05-06 12:54:32",
--     "2020-05-12 15:34:52", 
--     "",
--     "night"
-- )

-- create table cars_users(
-- 	user_id int unsigned primary key auto_increment not null,
--     user_fname varchar(15) null,
--     user_lname varchar(20) null,
--     user_car_name varchar(15) null,
--     user_car_model int(2) unsigned check(user_car_model between 80 and 99),
--     user_date_timing  datetime
-- )auto_increment=10000;

-- alter table cars_users
-- add user_plak varchar(9) unique

-- create table exprets_check (
-- 	check_priority int unsigned primary key auto_increment not null,
-- 	exp_id int unsigned,
--     user_id int unsigned,
--     check_in_date_time datetime,
--     check_out_date_time datetime,
--     foreign key(exp_id) references experts(exp_id),
-- 	foreign key(user_id) references cars_users(user_id)
-- );
-- alter table exprets_check
-- add pay_price decimal(12, 2) unsigned null

-- #########################################################################
-- SECTION 2

-- insert into cars_users 
-- values(
-- 	null,
--     "Alireza",
--     "Soltani Neshan",
--     "Pejeout",
--     84,
--     "20050609"
-- )

-- insert into cars_users 
-- values(
-- 	null,
--     "Ata",
--     "Soltani Neshan",
--     "Mercedes-Benz",
--     98,
--     "20190810"
-- )

-- insert into cars_users 
-- values(
-- 	null,
--     "Babak",
--     "Farhadi",
--     "Saipa-Tiba",
--     95,
--     "20151008"
-- )
-- insert into cars_users 
-- values(
-- 	null,
--     "بابک",
--     "فرهادي",
--     "Saipa-Tiba",
--     95,
--     "20151008",
--     "233ط88"
-- )

-- insert into cars_users 
-- values(
-- 	null,
--     "بابک",
--     "فرهادي",
--     "Pykan",
--     82,
--     "20020522",
--     "259س47"
-- )


-- select * from cars_users

-- insert into cars_users 
-- values(
-- 	null,
--     "محمد",
--     "حسيني",
--     "BMW",
--     95,
--     "20151118"
-- )

-- insert into cars_users 
-- values(
-- 	null,
--     "علي",
--     "محمدي",
--     "Pride",
--     90,
--     "20101201"
-- )
-- ##############################################
-- SECTION 3
-- select 
-- 	user_id as "کد مراجعه کننده",
--     concat(user_fname, " -- ", user_lname) as "نام و نام خانوادگي مراجعه کننده"
-- from cars_users
-- where user_lname = "حسيني" or user_lname = "محمدي"


-- ##############################################
-- SECTION 4
-- 10000
-- select * from exprets_check 

-- insert into exprets_check values(
-- 	null,
--     1101,
--     10008,
--     "2020-11-29 12:59:32",
--     "2020-11-29 13:35:40",
--     450000 
-- );

-- select * from exprets_check where pay_price in(25000, 30000, 35000)

-- ##############################################
-- SECTION 5

-- insert into cars_users 
-- values(
-- 	null,
--     "SASAN",
--     "SAHLABI",
--     "Pride",
--     90,
--     "20101201"
-- )

-- select * from cars_users 
-- where user_lname like '__H%A%';




-- ##############################################
-- SECTION 6

-- select * from cars_users 
-- where user_lname = "فرهادي"


select user_plak from cars_users 
join exprets_check using(user_id)
where user_lname = "فرهادي"




