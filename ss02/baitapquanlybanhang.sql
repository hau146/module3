create database bai_tap_ss2_quan_ly_ban_hang;
use bai_tap_ss2_quan_ly_ban_hang;

create table customer(
customer_id int auto_increment primary key,
customer_name varchar(50),
customer_age int check(customer_age > 0)
);

create table `order`(
order_id int auto_increment primary key,
order_date date not null,
order_total_price int,
customer_id int,
foreign key(customer_id) references customer(customer_id)
);

create table product(
product_id int auto_increment primary key,
product_name varchar(50),
product_price int
);

create table order_detail(
order_id int,
product_id int,
order_quantity int,
primary key(order_id,product_id),
foreign key(order_id) references `order`(order_id),
foreign key(product_id) references product(product_id)
);