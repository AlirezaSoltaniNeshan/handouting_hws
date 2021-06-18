-- create database sazman_bargh 
-- use sazman_bargh;

/* create table users(
	user_id int primary key not null,
    username varchar(50) null unique,
    password varchar(200) null,
    first_name varchar(15) null,
    last_name varchar(20) null,
    last_login datetime null,
    type varchar(10) null
);*/ 

-- insert into users values(
-- 	123,
--     "asn.codes",
--     "1323546749879849515131321",
--     "Alireza",
--     "Soltani Neshan",
--     "2020-05-15 12:18:43",
--     "user"
-- );
-- insert into users values(
-- 	124,
--     "DsnMonk",
--     "132354674987984951513132113235467498798495151313211323546749879849515131321",
--     "Kobra",
--     "Kibarie",
--     "2020-12-25 23:58:13",
--     "user"
-- );
-- insert into users values(
-- 	125,
--     "KeyIf",
--     "132354674987984951513132113235467498798495151313211323546749879849515131321",
--     "Keyvan",
--     "php",
--     "2020-12-25 23:58:13",
--     "user"
-- );
-- insert into users values(
-- 	126,
--     "Mehrdad",
--     "132354674987984951513132113235467498798495151313211323546749879849515131321",
--     "Jan",
--     "Json",
--     "2020-12-25 23:58:13",
--     "user"
-- );

-- insert into users values(
-- 	127,
--     "FarFarhadi",
--     "132354674987984951513132113235467498798495151313211323546749879849515131321",
--     "Babak",
--     "Farhaddi",
--     "2020-12-25 23:58:13",
--     "user"
-- );

/* create table user_stuff(
	file_serial int primary key auto_increment not null,
    user_id int null,
    postal_code int unsigned null,
    address text null,
    city varchar(20) null,
    house_plate int(4) unsigned  null,
    foreign key (user_id) references users(user_id)
); */
-- alter table user_stuff modify postal_code varchar(20);

-- insert into user_stuff values(
-- 	1234,
--     123,
--     "1234567890",
--     "تهران، میدان تجریش، تجریش، تجریش",
--     "تهران",
--     56
-- );
-- insert into user_stuff values(
-- 	1235,
--     123,
--     "45678923510",
--     "پردیس، بومهن، میدان عدالت، فروردین جنوبی، طلوع، مهتاب، ستاد مشترک",
--     "پردیس",
--     2
-- );

-- insert into user_stuff values(
-- 	1236,
--     124,
--     "1234567891",
--     "تهران، تجریش تجریش، میدان پوپک",
--     "تهران",
--     125
-- );

-- insert into user_stuff values(
-- 	1237,
--     126,
--     "1234567891",
--     "تهران، تجریش تجریش، میدان پوپک",
--     "تهران",
--     98
-- );

-- insert into user_stuff values(
-- 	1238,
--     125,
--     "6547898521",
--     "تتهران، خیابان هنگام، جبنب دانشگاه میدان عدالت",
--     "تهران",
--     85
-- );
-- insert into user_stuff values(
-- 	1239,
--     124,
--     "1258667410",
--     "تتهران، خیابان هنگام، جبنب دانشگاه میدان عدالت",
--     "تهران",
--     12
-- );

/* create table user_stuf_usage(
	row_id int primary key auto_increment not null,
	file_serial int null,
    user_id int null,
    consum_elec int(4),
    consum_usage_temporal datetime null,
    status varchar(2) null,
    foreign key (user_id) references users(user_id),
    foreign key (file_serial) references user_stuff(file_serial)
)auto_increment=1000; */

-- insert into user_stuf_usage values(
-- 	null,
-- 	1239,
--     124,
--     "45",
--     "2020-12-05 17:32:58",
--     "1"
-- );

-- insert into user_stuf_usage values(
-- 	null,
-- 	1238,
--     125,
--     "12",
--     "2020-08-25 22:32:58",
--     "1"
-- );


/* create table payments(
	pay_tnx int unsigned primary key auto_increment not null,
    user_id int null,
    file_serial int null,
    pay_status varchar(2) null,
    pay_price decimal(16, 3) null,
    pay_dt datetime null,
    pay_desc text null,
    foreign key (file_serial) references user_stuff(file_serial),
	foreign key (user_id) references users(user_id)
)auto_increment=10000;  */


-- insert into payments values(
-- 	null,
-- 	125,
--     1238,
--     "1",
--     13500,
--     "2020-05-05 12:12:08",
--     "قبض با موفیت پرداخت شده"
-- );

-- insert into payments values(
-- 	null,
-- 	123,
--     1234,
--     "1",
--     14000,
--     "2020-05-05 12:12:08",
--     "قبض با موفیت پرداخت شده"
-- );

-- insert into payments values(
-- 	null,
-- 	124,
--     1235,
--     "1",
--     165000,
--     "2020-05-05 12:12:08",
--     "قبض با موفیت پرداخت شده"
-- );