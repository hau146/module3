create database ss05_bai_tap;
use ss05_bai_tap;

create table products(
id int auto_increment primary key,
product_code varchar(50),
product_name varchar(50),
product_price int,
product_amount varchar(50),
prodcut_description varchar(50),
product_status varchar(50)
);
INSERT INTO `ss05_bai_tap`.`products` (`product_code`, `product_name`, `product_price`, `product_amount`, `prodcut_description`, `product_status`) VALUES 
('001', 'ca chua', '12000', '10', 'trai cay', 'moi nhap'),
('002', 'dua leo', '10000', '5', 'hoa qua', 'hong'),
('003', 'dua hau', '20000', '7', 'trai cay', 'moi nhap');


-- b3
create unique index index_product_code on products(product_code);
create index index_price_name on products(product_name, product_price);
-- sử dụng explain & so sánh
explain select *
from products
where product_code = '002';
explain select *
from products
where product_name = 'dua leo' and product_price = 10000;

-- b4
create view view_product as
select product_code, product_name, product_price, product_status
from products;

update view_product
set product_name = 'sau rieng'
where product_code = '001';

drop view view_product;

-- b5
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure fin_all_product()
begin
select *
from products;
end //
delimiter //
call fin_all_product;

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product(
new_id int,
new_product_code varchar(50), 
new_product_name varchar(50), 
new_product_price int, 
new_product_amount varchar(50),
new_prodcut_description varchar(50),
new_product_status varchar(50))
begin
insert into products values
(new_id, new_product_code, new_product_name, 
new_product_price, new_product_amount, 
new_prodcut_description, new_product_status);
end //
delimiter //

call add_product(4,'004', 'tao', 13000, 5, 'trai cay', 'hong');

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_product(
edit_by_id int, 
edit_product_code varchar(50), 
edit_product_name varchar(50), 
edit_product_price int, 
edit_product_amount varchar(50),
edit_prodcut_description varchar(50),
edit_product_status varchar(50))
begin
update products
set product_code = edit_product_code,
product_name = edit_product_name,
product_price = edit_product_price,
product_amount = edit_product_amount,
prodcut_description = edit_prodcut_description,
product_status = edit_product_status
where id = edit_by_id;
end //
delimiter //

call edit_product(1, '001', 'Thanh long', 30000, 9, 'hoa qua', 'bi hu');

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product(delete_by_id int)
begin
delete from products
where id = delete_by_id;
end //
delimiter //

call delete_product (4);
