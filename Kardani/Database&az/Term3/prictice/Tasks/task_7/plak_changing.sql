-- create database change_plak;
-- use change_plak

-- create table users(
-- 	user_id int unsigned not null primary Key,
--     username varchar(50) not null unique,
--     password varchar(150) not null,
--     user_fname varchar(15) null,
--     user_lname varchar(20) null,
--     user_gender bool null,
--     user_age int unsigned null    
-- );
-- alter table users
-- add user_city varchar(15) null;

-- create table users_cars(
-- 	user_car_id int unsigned primary key not null,
--     user_id int unsigned null,
--     user_car_name varchar(10) null,
--     user_car_background int(2) unsigned null,
--     user_old_plak varchar(9) unique null,
--     user_address text,
--     foreign key(user_id) references users(user_id)
-- );

-- create table new_plak_car(
-- 	user_priority_id int unsigned primary key not null,
--     user_id int unsigned null,
--     user_car_id int unsigned,
-- 	user_new_plak varchar(9) unique null,
--     user_new_plak_city varchar(15) null,
--     user_new_plak_address text null,
--     foreign key(user_id) references users(user_id),
--     foreign key(user_car_id) references users_cars(user_car_id)
-- );



