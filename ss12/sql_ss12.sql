create database ss12;
use ss12;

create table users(
id int(3) not null auto_increment,
name varchar(50) not null,
email varchar(50) not null,
country varchar(50),
primary key(id)
);

insert into users(name, email, country) values ('Minh','minh@codegym.vn','Viet Nam'),
('Kante','kante@che.uk','Kenia');

select * from users;

update users set name = "longgg", email = "long@gmail.com", country = "viet nam" where id = 1;

alter table users add delete_users bit default 0;
