create view customer_view as
select customerNumber, customerName, phone
from customer;

select * from customer_view;

create or replace view view_name as
select customerNumber, customerName, contactFirstName, contactLasName, phone
from customers
where city = 'Nantes';

drop view view_name;