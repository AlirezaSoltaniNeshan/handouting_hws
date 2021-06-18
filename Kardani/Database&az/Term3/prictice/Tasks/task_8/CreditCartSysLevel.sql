
-- create database banking_system;
-- use table banking_system;


-- create table users(
-- 	id int(11) unsigned primary key,
-- 	user_id varchar(70) null,
--     username varchar(70) null unique,
--     password varchar(30) null,
--     card_id varchar(45) null, 
--     reg_date Date null,
--     address1 varchar(50) null,
--     address2 varchar(50) null,
--     postalCode varchar(10) null,
--     town varchar(30) null,
--     state varchar(30) null,
--     lang varchar(2) null,
--     master_balance_id int(11) unique null,
--     card_card_id int(11) unique null
-- );

-- create table master_balance(
-- 	serial int unsigned primary key auto_increment,
--     id int(11) unsigned,
--     user_id varchar(30) null,
--     point_balance bigint(20) null,    
--     foreign key(id) references users(id)
-- );

-- create table voucher(
-- 	id varchar(50) primary key,
--     voucher_no varchar(15) null unique,
--     user_id varchar(30) null,
--     amount float(16, 3) null,
--     ts datetime,
--     status int(4),
--     expiry_date date,
--     consume_details text,
--     user_id1 int(11)
-- )

-- create table card(
-- 	card_id varchar(50) primary key,
--     status int(11) unique,
--     expiry_date Date,
--     hard_id varchar(50)
-- )

-- create table transaction(
-- 	id int(11) primary key,
--     card_id varchar(45),
--     ts datetime,
--     weight float(16, 3),
--     point int(11) null,
--     card_card_id varchar(50) null
-- )

