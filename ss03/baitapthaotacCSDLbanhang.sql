use bai_tap_ss2_quan_ly_ban_hang;

insert into customers (`customer_name`, `customer_age`) values 
('Minh Quan', '10'),
('Ngoc Oanh', '20'),
('Hong Ha', '50');

insert into `orders` (`order_date`, `customer_id`) values 
('2006-03-21', 1),
('2006-03-23', 2),
('2006-03-16', 1);


insert into products (product_name, product_price) values
('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

insert into orders_detail (order_id, product_id, order_quantity) values 
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);


select order_id, order_date, order_total_price
from `orders`;

select c.customer_id, c.customer_name, p.product_name
from customers c
join orders o on c.customer_id = o.customer_id
join orders_detail od on o.order_id = od.order_id
join products p on od.product_id = p.product_id;

select * 
from customers
where customer_id not in (select customer_id from orders);

select o.order_id, o.order_date, sum(order_quantity * p.product_price) as "invoice_price"
from orders_detail od
join orders o on od.order_id = o.order_id
join products p on od.product_id = p.product_id
group by o.order_id; 
