create database stores;
use stores;
create table customers(
cust_id int auto_increment primary key,
name varchar(100),
email varchar(100)
);
create table orders(
ord_id int auto_increment primary key,
date Date,
amount decimal(10,2),
cust_id int,
foreign key (cust_id) references customers(cust_id) on delete cascade
);
insert into customers (name,email) values ('Vipin','vipin@gmail.com'),('Ravi','ravi@gmail.com'),('Ganesh','ganesh@gmail.com');

insert into orders (date,amount,cust_id) values (curtime(),923.13,2),(curtime(),293,1),(curtime(),9932.444,3),(curtime(),003,2),(curtime(),9435435.4359,1);
select * from orders;

#cross join (show all the possible combinations)
select * from customers,orders;
select * from orders,customers;

# inner join (only the match related / foreign key data)
select * from customers inner join orders on orders.cust_id = customers.cust_id;
select * from orders inner join customers on orders.cust_id = customers.cust_id;

select customers.cust_id,customers.name,SUM(orders.amount) from customers inner join orders on orders.cust_id = customers.cust_id group by customers.cust_id;

# left join (all data from the left table and matching data from the right table)
select * from customers left join orders on orders.cust_id = customers.cust_id;
select customers.cust_id,customers.name, IFNULL (SUM(orders.amount),0) as total from customers left join orders on orders.cust_id = customers.cust_id group by customers.cust_id;

# right join (all data from the right table and matching data from the left table)
select * from customers right join orders on orders.cust_id = customers.cust_id;
select * from orders right join customers on orders.cust_id = customers.cust_id;

#cascade
alter table orders
add CONSTRAINT cust_id foreign key (cust_id) references customers(cust_id) on delete cascade;

delete from customers where cust_id = 2;

# exercise 8
# Q1
use stores; 
create table authors(
author_id integer auto_increment primary key,
author_name varchar(100)
);

create table books(
book_id int auto_increment primary key,
title varchar(250),
ratings float,
au_id integer ,
foreign key (au_id) references authors(author_id) on delete cascade
);

Insert into authors (author_name) values ('Raju'),('Shyam'),('Baburao'),('Pal');
Insert into books (title,ratings,au_id) values ('Story of Shyam',4,2),('Story of Baburao',5,3),('Love story of pal',4,4),('Shyam is a good boy',3,2);

select authors.author_id,authors.author_name,books.title,books.ratings from authors inner join books on  books.au_id = authors.author_id;
select authors.author_id,authors.author_name,IFNULL (books.title,'Not Found'),books.ratings from authors left join books on  books.au_id = authors.author_id;

select authors.author_id,authors.author_name,books.ratings,
 case 
 when ifnull(books.ratings,0) >= 3 then 'Good'
 Else 'Average' End as 'Average Rating'
 from authors left join books on  books.au_id = authors.author_id;