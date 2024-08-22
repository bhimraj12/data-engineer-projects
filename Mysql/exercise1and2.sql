create database bank_db;
use bank_db;
create table employees(
emp_id int primary key auto_increment,
name varchar(100) not null,
desig varchar(100) not null default 'Probation',
dept varchar(100) null
);
insert into employees (name,desig,dept) value ('bhimraj','develop','it'),('yugant','tester','it'),
('suraj','marketing','sales');
select * from employees;
set sql_safe_updates = 0;
update employees set dept='marketing' where dept = 'sales';
delete from employees where emp_id = 4;
select emp_id, concat('Mr. ',name) as fullname from employees;
select emp_id, concat_ws(' - ',name,desig,dept) as fullname from employees;
select substring('Hey Buddy',1,5);
select substring('Hey Buddy',5,9);
select substring('Hey Buddy',5);
select substring('Hey Buddy, Wassup Raju',-4);
select emp_id,substring(name,1,1) as first_letter,name,dept from employees;
select replace('Hello Buddy!','hello','Hey');
select emp_id, reverse(name) as reverse_name, dept from employees;
select upper('abcd'); select ucase('abcd');
select lower('ABCD'); select lcase('ABCD');
select emp_id, char_length(name) as name_length, name from employees;
select insert('Hey Wassup',5,0, 'Raju ');