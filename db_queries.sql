select * from users;

select * from user_roles;

select * from products;

select * from orders;

select * from order_product;

select sum(op.quantity * p.price) as total
from orders as o, order_product as op, products as p
where o.id = 3 and op.order_id = 3 and p.id = op.product_id
group by o.id;

select sum(op.quantity)
from order_product as op, orders as o
where op.order_id = o.id;

select *
from order_product as op
where op.order_id = 2 and op.product_id = 1 and op.size = "S";

select *
from order_product as op
where op.order_id = 3 and op.product_id = 1;

delete from order_product as op
where op.order_id = 2 and op.product_id = 1 and op.size = "S";



delete from users where id > 9;

delete from user_roles where user_id = 14;

insert into user_roles (user_id, role_name) values (15, "ADMIN");

select * from employees;

update employees set email = "jfirrelli1@classicmodelcars.com" where id = 1188;

select * from products where sports_team = "eagles";