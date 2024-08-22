use bank_db;
select concat_ws(':',emp_id,name,desig,dept) from employees;
SELECT CONCAT_WS(':', emp_id, CONCAT('Mr ', name), desig, dept) AS formatted_info
FROM employees;
select concat_ws(':',emp_id,name,upper(desig),dept) from employees;
select concat(left(upper(dept),1),emp_id) as emp_id,name,upper(desig) from employees;

select distinct dept from employees;
select distinct name, dept from employees;
select emp_id, name,dept,desig from employees order by dept,name asc;
select * from employees where name like "%raj%";
select * from employees where name like "%____%";
select * from employees where name like "%S___%";

alter table employees
add column fname varchar(100) not null,
add column lname varchar(100) null,
add column salary integer not null default 25000;
alter table employees
drop column name;
insert into employees (fname,lname,dept,desig,salary) values ('Rohit','Sharma','Loan','Manager',60000)
,('Rajiv','Gandhi','Loan','Cashier',30000),('John','Poul','Accountant','Account',43000);

select * from employees limit 2,4;

select * from employees order by salary desc limit 2;

select count(*) from employees;
select count(distinct(dept)) from employees;
select count(emp_id) from employees where dept = 'loan';
# 1. 
select distinct(dept) from employees;
# 2. 
select * from employees order by salary desc;
# 3. 
select * from employees order by salary desc limit 3;
# 4. 
select * from employees where fname like "r%";
# 5. 
select * from employees where lname like "______";

#---

select dept from employees group by dept;
select dept,count(emp_id) as employees_count from employees group by dept;
select max(salary) from employees;
select min(salary) from employees;
select * from employees where salary = (select max(salary) from employees); 

select sum(salary) from employees;
select avg(salary) from employees;