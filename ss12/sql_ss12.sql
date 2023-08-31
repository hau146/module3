create database ss12;
use ss12;

create table users(
id int(3) not null auto_increment,
name varchar(50) not null,
email varchar(50) not null,
country varchar(50),
primary key(id)
);

create table permision(
id int not null auto_increment,
name varchar(50),
primary key(id)
);

create table user_permision(
id_users int,
id_permision int,
primary key(id_users,id_permision),
foreign key (id_users) references users(id),
foreign key (id_permision) references permision(id)
);

insert into Permision(id, name) 
values(1, 'add'),(2, 'edit'),(3, 'delete'),(4, 'view');

insert into users(name, email, country) values ('Minh','minh@codegym.vn','Viet Nam'),
('Kante','kante@che.uk','Kenia');

select * from users;

update users set name = "longgg", email = "long@gmail.com", country = "viet nam" where id = 1;

alter table users add delete_users bit default 0;

select * from users where country like "v%";

select * from users where delete_users = 0 order by country asc;
select * from users where delete_users = 0 order by country desc;

delimiter //
create procedure get_user()
begin
select * from users where delete_users = 0;
end //
delimiter ;
call get_user;

delimiter //
create procedure edit_user(edit_name varchar(50),edit_email varchar(50),edit_country varchar(50), by_id int)
begin
update users set name = edit_name, email = edit_email, country = edit_country where id = by_id;
end //
delimiter ;
call edit_user("hưng","hung@gmail.com","viet nam",6);

delimiter //
create procedure delete_user(by_id int)
begin
update users set delete_users = 1
where id = by_id;
end //
delimiter ;
call delete_user(1);
