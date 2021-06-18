-- create database train_ticket
-- use train_ticket

-- create table users(
-- 	user_id int unsigned primary key,
--     username varchar(50) null unique,
--     password varchar(100) null,
--     natural_code varchar(12) null unique
-- );

-- create table tickets(
-- 	ticket_id int unsigned primary key not null,
--     ticket_name varchar(50) null,
--     usage_start_date datetime null,
--     usage_end_date datetime null,
--     vagen_number int(2) unsigned null,
--     full_vagen_capacity int unsigned null default 4,
--     ticket_price decimal(16.3) null
-- );


-- create table payment_details(
-- 	tnx_id int unsigned auto_increment primary key not null,
--     user_id int unsigned null,
--     ticket_id int unsigned null,
--     tnx_date datetime null,
--     payment_status enum('accepted', 'ignore', 'waiting'),
--     foreign key (user_id) references users(user_id),
-- 	foreign key (ticket_id) references tickets(ticket_id)
-- );


-- use sakila

-- select abs(-25.76823), sign(-25.76823), round(-25.76823, 2)


-- select substr('Please find the substring in this string', 17, 9)


select customer_id, count(*) from rental group by 1 having count(*) >= 40;


