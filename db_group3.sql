create database case_study_web_group3;
use case_study_web_group3;

create table product_type(
product_type_id int primary key auto_increment,
product_type_name varchar(255) not null
);
create table `role`(
role_id int primary key auto_increment,
role_name varchar(255) not null
);
create table `account`(
account_user_name varchar(255) primary key,
account_password varchar(55) not null,
role_id int not null,
foreign key (role_id) references `role`(role_id)
);
create table type_of_customer(
type_of_customer_id int primary key auto_increment,
type_of_customer_name varchar(255) not null unique
);
create table `user`(
user_id int primary key auto_increment,
user_name varchar(255) not null,
user_dob date not null,
user_gender bit(1) not null,
user_id_card varchar(20) not null,
user_phone_number varchar(20) not null,
user_mail varchar(55) not null,
user_address varchar(255) not null,
type_of_customer_id int,
account_user_name varchar(255) not null unique,
foreign key(type_of_customer_id) references type_of_customer(type_of_customer_id),
foreign key(account_user_name) references `account`(account_user_name)
);
create table voucher(
voucher_id int auto_increment primary key,
voucher_name varchar(55) not null unique,
voucher_rate float not null unique
);
create table `order`(
order_id int primary key auto_increment,
order_date datetime not null,
user_id int not null,
voucher_id int not null,
foreign key(user_id) references `user`(user_id),
foreign key(voucher_id) references voucher(voucher_id)
);

create table product(
 product_id int primary key auto_increment,
 product_name varchar(255) not null,
 product_price double not null,
 product_description varchar(255),
 product_type_id int not null,
 product_inventory int not null,
 foreign key (product_type_id) references product_type(product_type_id)
);

create table order_detail(
order_detail_id int auto_increment primary key,
order_id int not null,
product_id int not null,
order_detail_price double not null,
product_quantity int not null,
foreign key(order_id) references `order`(order_id),
foreign key(product_id) references product(product_id)
);

create table product_images(
product_images_id int primary key auto_increment,
images_url varchar(100) not null,
product_id int not null,
foreign key(product_id) references product(product_id)
);