Create database learning;
CREATE TABLE learning.students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NULL,
    last_name VARCHAR(50) NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NULL,
    age integer DEFAULT 1,
    date_of_birth DATE NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO learning.students (first_name, last_name, email, contact, city,age,date_of_birth)
VALUES ('John', 'Doe', 'john.doe1@example.com', 2324124,'Thane', '24', '2000-01-01');

select * from learning.students;

update learning.students 
set first_name = 'Raj',
	last_name = 'Bhim',
    email = 'bhimraj@yopmail.com'
    where id = 1;
  
Alter table learning.students
Add column contact integer null after email;

Alter table learning.students
drop column contact;

delete from learning.students
where id = 2;

drop table learning.students;
drop database learning;

use learning;
show tables;
desc students;

create table customers(
id Int auto_increment primary key,
name varchar(100) null,
acc_type varchar(100) not null default 'savings'
);

insert into customers(name, acc_type) values ('raj', 'current'),('rohit','salary');

select name as 'customer_name', acc_type as 'type' from customers;