-- create database online_shop
-- use online_shop

-- Native products added base on following schema:
/* create table products(
	product_id int unsigned primary key,
    product_name varchar(100) null,
    product_brand varchar(15) null,
    product_rating int(1) check(product_rating in(1,5)),
    product_categories enum(
		"digital",
        "tools and instrument",
        "clothing",
        "cookware",
        "toys",
        "travel and exercise" ,
        "food and drink"
        ) null,
    product_type varchar(50) null,
    product_main_price float(10, 3),
    prodcut_available boolean,
    product_qty int unsigned null,
    product_input_date datetime,
    product_properties text    
);*/



-- more product detail table
/* create table product_details(
	serial int unsigned not null primary key auto_increment,
    product_id int unsigned,
    product_color varchar(15) null,
    product_vendor varchar(100) null,
    product_vendor_branch varchar(50) null,
    product_vendor_address varchar(200) null,
    product_vendor_price float(10, 3),
    product_vendor_product_qty int unsigned null,
    foreign key (product_id) references products(product_id)
);*/

-- Customers as users in online shop
/* create table customers (
	cust_id int unsigned primary key,
    cust_username varchar(100) not null unique,
    cust_password varchar(200) not null,
    cust_first_name varchar(50),
    cust_last_name varchar(50),
    cust_phone varchar(12),
    cust_input_date datetime
); */

-- more about users as customers
/*create table cust_details(
	cust_serial int unsigned primary key auto_increment,
    cust_id int unsigned,
    cust_address text,
    cust_phone varchar(12),
    foreign key (cust_id) references customers(cust_id)
);*/ 

-- more about favorites of customers 
/* create table cust_favorites (
	favorites_id int unsigned auto_increment primary key,
    cust_id int unsigned,
    product_id int unsigned,
	cust_rated_product int unsigned check(cust_rated_product in(1,5)),
	foreign key (cust_id) references customers(cust_id),
	foreign key (product_id) references products(product_id)
); */

-- more about products 
/* create table users_comment (
	comment_id int unsigned primary key auto_increment,
    product_id int unsigned,
    cust_id int unsigned,
    comment_content text,
    comment_date_time datetime,
    comment_rating int(1) check(comment_rating in(1,5)),
    
    foreign key (product_id) references products(product_id),
    foreign key (cust_id) references customers(cust_id)
) auto_increment = 1000; */


-- Payment transaction table :
/* create table payment(
	tnx_id int unsigned primary key auto_increment,
    cust_id int unsigned,
    product_id int unsigned,
    product_price_with_tax float(10, 3),
    tnx_accepted boolean,
    tnx_date datetime,
    tnx_success boolean,
    foreign key (cust_id) references customers(cust_id),
    foreign key (product_id) references products(product_id)
)auto_increment = 100000; */ 

