create database ss11;
use ss11;

create table product(
id int auto_increment primary key,
`name` varchar(50),
price int,
`describe` varchar(50),
producer varchar(50)
);

INSERT INTO `ss11`.`product` (`name`, `price`, `describe`, `producer`)
VALUES ('giày', '12000', 'để mang', 'nike'),
('mũ', '10000', 'để đội', 'LV'),
('nước hoa', '24000', 'để thơm', 'dior'),
('áo', '15000', 'để mặc', 'HL');
