use bank_db;
Delimiter $$
create procedure emp_info()
begin
select * from employees order by salary;
end$$
delimiter ;

call bank_db.emp_info();
Delimiter $$
create procedure get_empid(IN p_fname Varchar(50))
begin
select emp_id from employees 
where fname = p_fname;
end$$
delimiter ;

call bank_db.emp_info();
call bank_db.get_empid('John');

delimiter $$
create procedure get_sum_by_dept(IN p_dept varchar(50), OUT p_sum decimal(10,2))
begin
select sum(salary) into p_sum from employees where dept= p_dept;
end$$
delimiter ;
drop procedure get_sum_by_dept;
call bank_db.get_sum_by_dept('Develop',@p_sum);
select @p_sum;

set @emp_sum =0;
call bank_db.get_sum_by_dept('Develop',@emp_sum);
select @emp_sum;