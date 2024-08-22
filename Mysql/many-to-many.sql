create database institute;
use institute;

create table students(
id int auto_increment primary key,
student_name varchar(200)
);

create table courses(
id int auto_increment primary key,
course_name varchar(200),
fees int
);

create table student_course(
student_id int,
course_id int,
foreign key (student_id) references students(id),
foreign key (course_id) references courses(id)
);

Insert into students (student_name) values ('Raj'),('Ravi'),('Suraj'),('Aman');
Insert into courses (id,course_name,fees) values (101,'Java',15000),(102,'Python',20000),(103,'PHP',49000),(104,'Html',12000);
Insert into student_course (student_id,course_id) values (1,104),(1,101),(2,101),(1,102),(4,103),(2,104),(4,102);

# join many to many relationship
select student_name, course_name from students join student_course on student_course.student_id = students.id
join courses on student_course.course_id = courses.id;

select course_name,count(student_name) from students join student_course on student_course.student_id = students.id
join courses on student_course.course_id = courses.id group by course_name;

select student_name,count(course_name) from students join student_course on student_course.student_id = students.id
join courses on student_course.course_id = courses.id group by student_name;

select student_name,sum(fees) from students join student_course on student_course.student_id = students.id
join courses on student_course.course_id = courses.id group by student_name;

#create view
create view inst_info as 
select student_name, course_name, fees from students join student_course on student_course.student_id = students.id
join courses on student_course.course_id = courses.id;

select * from inst_info;
drop view inst_info;

select student_name , sum(fees) from inst_info group by student_name;

#having
select student_name , sum(fees) from inst_info group by student_name
having sum(fees) > 40000;
use institute;
#rollup
select ifnull (student_name,"Total") , sum(fees) from inst_info group by student_name
with rollup;