use temp;
select * from temp.today_;

-- subquery ----
-- higest age

select * from today_ order by age desc limit 1;
select * from today_ order by age desc limit 4,1;

--  First highest age person data 
select max(Age) from today_;
select * from today_ where age=(select max(age) from today_);

-- second highest age person data ------
select * from today_ where age=(
select age from today_ where age<(select max(age) from today_) order
 by age desc limit 1);
 
 -- windowing function ----------
 -- row_number(),rank(),dense_rank(),lead(),lag()
 
 select * from temp.today_;
-- Row_number-----
select *,row_number() over(order by age desc) as row_ from today_;

  with A as (select *,row_number() over(order by age desc) 
 as row_ from today_ )
 select * from A where row_=7;

-- rank() function------
select *,rank() over(order by age desc) as row_ from today_;

 with A as (select *,rank() over(order by age desc) 
 as row_ from today_ )
 select * from A where row_=1;
 
-- dense_rank() -------

select *,dense_rank() over( partition by gender order  by age desc) 
as row_ from today_;

with A as (select *,dense_rank() 
over( partition by gender order by age desc) 
 as row_ from today_ )
 select * from A where row_=4;
 
 alter table today_ add column row_ int;
 set sql_safe_updates=0;
alter table today_ drop column row_;

create table today1 as select *,dense_rank() over( partition by gender order  by age desc) 
as row_ from today_;
select * from today1 where row_=1;
select * from today1;


-- lead----- 
select row_,lag(row_) over(order by row_) from  today1;

