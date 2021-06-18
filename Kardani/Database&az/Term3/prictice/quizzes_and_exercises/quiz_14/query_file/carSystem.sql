-- create database car_sys;

-- use car_sys

-- Database Designing:

/* create table users(
	id int unsigned primary key,
    first_name varchar(15) null,
    last_name varchar(15) null,
    username varchar(50) null,
    password varchar(200) null, -- for hash code!
    entry_date datetime null,
    natural_code varchar(12) null,
    birthdate date null,
    age int(2) unsigned null check (age >= 18)
); */ 
-- DATA IN USERS
/*  insert into users values(
	445588,
    "مرجان",
    "محمدي",
    "mjMohamm@dyNaz",
    "dsadakljd39024236478sdfhsbbkj@kHJ!^%^98sbasdh^*&*hjadhsdjhksakdhajsd",
    "2020-05-10 23:11:05",
    "0025877611",
    "1995-10-03",
    25
);*/


/* insert into users values(
	112255,
    "ALIREZA",
    "MAARAM",
    "ALIREZAMAR@GMAIL.COM",
    "024236%^98sbasdh^*&*h4dsadakljd390242364hsbbkj@kHJ!^jadhsdjhks",
    "2020-05-10 23:11:05",
    "0025877611",
    "1990-10-03",
    30
);*/
    
    
/* insert into users values(
	557744,
    "اميرحسين",
    "حسيني",
    "amirParishanHosain",
    "dsadaklj*&*hjadhsdbkj8sbas@kHJ!^%^9dh^jhksak@kHJ!^%^9dhaj@kHJ!^%^9sd",
    "2005-11-18 05:45:00",
    "0177899550",
    "1983-07-30",
    37
);*/



/* create table users_addre(
	serial int auto_increment primary key not null,
    user_id int unsigned,
    foreign key(user_id) references users(id),
    city varchar(10) null,
    address text
);*/

/* insert into users_addre values(
	null,
    445588,
    "TEHRAN",
    "تهران، تهران پارس، فکه سوم، ميدان پروين، خيابان 202، پلاک 50"
);*/

/* insert into users_addre values(
	null,
    557744,
    "PARDIS",
    "پرديس، فروردين جنوبي، خيابان ستاره، جنب کوروش"
); */ 




/* create table cars(
	serial_id int unsigned primary key not null,
    name varchar(10) not null,
    pure_price decimal(16, 3) null,
    entry_date date null,
    expire_date date null,
    status int(1) unsigned check(status in(-1, 0, 1))    
); */

-- DATA IN CARS

/* insert into cars values(
	123,
    "سمند",
    40000000,
    "2001-08-10",
    null,
    1
);*/

/* insert into cars values(
	125,
    "پژو 405",
    30000000 ,
    "2003-09-25",
    null,
    1
); */

/* insert into cars values(
	126,
    "پژو پارس",
     20000000,
    "2007-09-25",
    null,
    1
); */


-- Car Details
/*create table car_details(
	id int unsigned auto_increment primary key,
    serial_id int unsigned null,
    foreign key(serial_id) references cars(serial_id),
    production_number int null,
    production_color varchar(10) null,
    production_limit Text
);*/ 

/* insert into car_details values(
	null,
    123,
    50,
    "BLACK",
    "مه شکن ندارد، صندلي گرم کن ندارد، ضبط ندارد"
);*/

/* create table payment(
	tnx_id int unsigned primary key auto_increment,
    user_id int unsigned null,
    foreign key (user_id) references users(id),
    car_serial_id int unsigned null,
    foreign key (car_serial_id) references cars(serial_id),
    pay_date datetime null,
    main_price decimal(16, 3) null,
    price_with_vendor decimal(16, 3) null,
    pay_status int(1) check (pay_status in(-1, 0, 1))
)auto_increment = 20000;*/

-- DATA IN PAYMENT

/* insert into payment values(
	null,
	445588,
    123,
    "2020-12-09 12:30:58",
    40000000,
    45000000,
    1
); */

/* insert into payment values(
	null,
	445588,
    125,
    "2019-05-09 12:30:58",
    30000000,
    37000000,
    -1
); */ 

/*insert into payment values(
	null,
	557744,
    126,
    "2018-05-09 12:30:58",
    20000000,
    21000000,
    1
);*/

