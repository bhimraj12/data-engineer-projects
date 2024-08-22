use bank_db;
select dept, sum(salary) from employees group by dept;
select dept, count(emp_id) from employees group by dept;

# exercise 5

#1
select count(emp_id) from employees;
#2
select dept, count(emp_id) as emp_count from employees group by dept;
select min(salary) from employees;
select max(salary) from employees;
select dept, sum(salary) as total_salary from employees where dept = 'loan';
select * from employees where salary = (select max(salary) from employees);
select dept, avg(salary) as average from employees group by dept;

######

create table num1 (
price decimal(5,2) default 0
);
insert into num1 values(124.39),(32.32);
select * from num1;

create table num2 (
f float default 0, 
d Double default 0
);

insert into num2 (f,d) values (23.39,23.39),(2393243.32,2393243.32),(88328423423432.32923,88328423423432.32923);
select * from num2;

create table person(
jd Date, jt Time, jdt DateTime
);

insert into person values ('2024-07-04','15:23:03','2024-07-04 15:23:23'),('2024-05/30', '21:02:29', '2023/02/12 12:29:12');
select * from person;

#current
select curdate();
select curtime();
select now();
insert into person values (curdate(),curtime(),now());

select dayname('2001-07-04');
select dayname(curdate());
select dayofmonth(curdate());
select dayofweek(curdate());
select dayofyear(curdate());
select monthname(curdate());
select jd, Monthname(jd) from person;
select jt, Hour(jt) from person;
select jt, minute(jt) from person;

#date format
select date_format(now(),'%D %a at %T'); # '5th Mon at 18:07:57'
select date_format(now(),'%d/%m/%Y'); #'05/08/2024'

select jdt, date_format(jdt, '%D %a at %k') from person;
select jdt, date_format(jdt, '%D %a at %r') from person;
select jdt, date_format(jdt, '%H:%i:%s') from person;

select datediff('2024-03-23','2014-03-31');
select date_add(now(),interval 5 day);
select date_add(now(),interval 3 month);
select date_add(now(),interval 5 year);
select date_add(now(),interval 2 week);
select timediff(date_format(now(), '%H:%i:%s'),'12:02:23');

create table blogs(
blog varchar(150),
ct Datetime default current_timestamp,
ut datetime on update current_timestamp
);
alter table blogs
modify column blog varchar(150);

insert into blogs (blog) values ('this is my first blog');
select * from blogs;
set sql_safe_updates = 0;
update blogs set blog = 'This is my first blog from india' ;

# exercise 6
# 1
select date_format(now(), '%H:%i:%s'); select curtime();
select date_format(now(), '%Y-%m-%d'); select curdate();
select dayname(curdate());
select date_format(now(), '%d:%m:%Y');
select date_format(now(),'%M %D at %T');

use bank_db;
select * from employees where salary > 50000;
select * from employees where salary <= 60000;

select * from employees where dept = 'Loan' and salary=30000;
select * from employees where dept = 'Loan' or salary=45000;
select * from employees where dept in ('tester','develop','loan');
select * from employees where dept not in ('tester','develop','loan');
select * from employees where salary between 40000 and 80000;
select emp_id, fname,salary, CASE when salary >= 50000 then 'Higher Salary'
when salary between 40000 and 50000 then 'Mid Salary'
else 'Lower Salary'
End as 'Salary category'
From employees;

#is null
select * from person;
insert into person (jd,jt,jdt) values (null,null,null),(null,curtime(),now()),(curdate(),null,now());
select * from person where jt is null;
select * from person where jd is not null;

# not like
select * from employees where fname not like 'R%';

# exercise - 7
#1. 
select * from employees where salary between 30000 and 40000;
#2.
select * from employees where fname like 'R%' or fname like 'S%';
#3.
select * from employees where salary = 43000 and dept = 'Accountant';
#4.
select * from employees where dept in ('tester','develop','loan');
#5. 
select emp_id, concat(fname,' ',lname) as name,dept,salary,
case when salary != 0 then salary/80 End as 'salary in $' from employees;

