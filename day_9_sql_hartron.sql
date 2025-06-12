SELECT * FROM amazon.data_analyst;
create table temp(percentage float,
name varchar(50),age int);
insert into temp values(75.2222,"shreya",18),
(70.2072,"harshit",19),
(75.2345,"nidhi",28),
(71.22,"jatin",38),
(61.0022,"neha",15),
(81.1122,"mukul",17),
(23.2222,"mehak",22);
select * from temp;
select round(percentage,2) from temp;
select percentage,ceil(percentage) from temp;
select percentage,floor(percentage)
 as floor from temp;
select percentage,sqrt(percentage) from temp;
alter table temp add column marks int;
set sql_safe_updates=0;
update temp set marks=rand()*200;
alter table temp add column dates date;
insert into temp(dates) values("2025-05-25"),
("2025-06-30"),("2021-03-29"),("2019-08-20"),
("2021-05-11"),("2020-06-25");
select * from temp;
select dates,day(dates) from temp;
select dates,month(dates) from temp;
select dates,year(dates) from temp;
select dates,dayname(dates) from temp;
select dayname("2025-07-09");
select curdate();
select dates,
date_add(dates,interval 2 month) from temp;
select dates,
date_add(dates,interval 2 year) from temp;
select dates,
date_add(dates,interval -2 day) from temp;
select dates,
date_sub(dates,interval 2 month) from temp;
select current_timestamp();
select user();
select @@version;

select coalesce(null,2);
select sum(marks) from temp;
select sum(coalesce(marks,10)) from temp;
select nullif(null,2);
select coalesce(null,2);
select isnull(null);
select name,isnull(name) from temp;
select coalesce(dates,curdate()) from temp;
update temp set
 dates=coalesce(dates,curdate());







