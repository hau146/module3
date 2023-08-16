delimiter //
create procedure finAllCustomers()
begin
select * from customers;
end //
delimiter 

call finAllCustomers();

delimiter //
drop procedure if exists finAllCustomers //
create procedure finAllCustomers()
begin
select * from customers where customerNumber = 175;
end //
