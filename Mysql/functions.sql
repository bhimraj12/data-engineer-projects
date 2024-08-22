delimiter $$

create function emp_name_max_salary() returns varchar(50) 
deterministic no sql reads sql data
begin
declare v_max int;
declare v_emp_name varchar(50);
select max(salary) into v_max from employees;
select fname into v_emp_name from employees where salary = v_max;
return v_emp_name;
end$$
delimiter :
select bank_db.emp_name_max_salary();

# window function
select emp_id,fname,salary,sum(salary) over(order by emp_id) as sum_salary from employees;
select emp_id,fname,salary,sum(salary),dept  over(partition by dept) as sum_salary from employees;
select emp_id,fname,salary,max(salary),dept  over(partition by dept) as sum_salary from employees;
select row_number() over() as row_no,emp_id,salary,dept from employees;
select row_number() over(order by salary) as row_no,emp_id,salary,dept from employees;
