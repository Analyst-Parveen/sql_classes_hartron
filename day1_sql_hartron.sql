-- creating database
create database hartron;
-- showing database
show databases;
-- selecting database to use
use hartron;
-- creating a table
create table data_analyst(student_name varchar(50),ph_number int,roll_number int,order_date date);
-- displaying tables of database
show tables;
-- inserting values into table
insert into data_analyst values("shreya",288,14,"2025-05-14"),("ritika",122,15,"2025-05-15"),
("muskan",788,16,"2025-05-16"),
("vishesh",288,17,"2025-05-17"),
("shreya",388,18,"2025-05-18"),
("shreya",488,19,"2025-05-19"),
("shreya",588,20,"2025-05-20");

-- displaying all data
select *  from data_analyst;

-- opertaor 
-- logicals operator  and using where clause
select roll_number, student_name from data_analyst where roll_number=14;
select * from data_analyst where roll_number=14 or roll_number=15;
select * from data_analyst where roll_number=14 and student_name="muskan";
select * from data_analyst where  not roll_number=14;
select * from data_analyst where roll_number in(15,14,16);
select * from data_analyst where  roll_number between 14 and 17 ;
select * from data_analyst where student_name like "%a";
select * from data_analyst where student_name like "m%";
select * from data_analyst where student_name like "__sk%";

-- arithmatics operators

select roll_number, roll_number+5 from data_analyst;
select roll_number, roll_number-5 from data_analyst;
select roll_number, roll_number/5 from data_analyst;
select roll_number, roll_number%5 from data_analyst;

-- comparison operator 

select * from data_analyst where  roll_number=14;
select * from data_analyst where  roll_number>14;
select * from data_analyst where  roll_number<17;
select * from data_analyst where  roll_number>=16;
select * from data_analyst where  roll_number<=16;
select * from data_analyst where  roll_number<>14;

















