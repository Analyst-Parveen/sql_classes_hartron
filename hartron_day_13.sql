use temp;
select * from temp.tady;
alter table tady drop column row_s;
select * from temp.today_;
-- sets function----
--  union-----
select gender,name from tady union 
select id,name from today_;

-- unial all ---------------
select id,name from tady union all
select id,name from today_;

-- except -----

select id,name from tady except
select id,name from today_;
-- intersection

select id,name from tady intersect
select id,name from today_;

with a as(select id,name,email from temp.tady),
 b as(select id,name,email from temp.today_),
 c as (select gender,name,age from temp.today_)
 select * from a union select * from b union
 select * from c;
 
 
 create view acc as(select id,name,gender 
 from today_  where age>30);
 
 select id from acc;
 
 -- removing duplicated data------
 
 select * from temp.new1;
 select distinct student_age,row_ from new1;
 
 select * from new1 union select * from new1 union 
 

