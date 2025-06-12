show databases;
use hartron;
show tables;
select * from data_analyst;
-- order by clause 
select * from data_analyst order by ph_number asc;
select * from data_analyst order by ph_number;
select * from data_analyst order by 
ph_number desc;

-- limit statment ---------------

select * from data_analyst order by 
ph_number desc  limit 2;
select * from data_analyst order by 
ph_number asc limit 3;

select * from data_analyst order by 
ph_number asc  limit 3, 2;

-- Aggregate function---------
-- min,max,sum,count,avg

select * from data_analyst;

select sum(ph_number) from data_analyst;
select count(ph_number) from data_analyst;
select avg(ph_number)  average from data_analyst;
select sum(ph_number) from data_analyst;
select min(roll_number) from data_analyst;
select min(student_name) from data_analyst;
select max(roll_number) from data_analyst;
select max(student_name) from data_analyst;
select sqrt(roll_number) from data_analyst;
select std(roll_number) from data_analyst;
select variance(roll_number) from data_analyst;


select roll_number,
sqrt(roll_number) from data_analyst;

-- alias or temporary_name ------

select *,
roll_number*roll_number as square
 from data_analyst;



