create table contact(
id integer not null auto_increment primary key,
name varchar(50),
mob varchar(15) unique not null check (length(mob) >= 10)
);
insert into contact (name,mob) values ('Bhimraj',32432),('Raj',93242),('Suraj',9998);
drop table contact;
create table contact1(
id integer not null auto_increment primary key,
name varchar(50),
mob varchar(15) unique not null 
constraint mobno_less_than_10digits check(length(mob) >= 10)
);
insert into contact1 (name,mob) values ('Bhimraj',32432),('Raj',93242),('Suraj',9998);

use bank_db;
## alter / update
alter table contact
add column city varchar(50);

alter table contact 
drop column city;	

select * from contact;
alter table contact 
rename column name to fname;

alter table contact
rename to my_contacts;

alter table contact 
rename table contact to my_conatcts;