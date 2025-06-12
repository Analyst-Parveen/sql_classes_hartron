set sql_safe_updates=0;
use day2;
select * from student;
alter table student add
 column grade varchar(20);
 start transaction;
 update student set grade="a";
 rollback;
 -- if statement---- 
  update student set grade=if(fee>30,"A","B");
  -- nested if-------
  
alter table student add
column grade2 varchar(20);
update student set 
grade2
=if(fee>20 and fee<30,"A",
if(fee>=30 and fee<40,"B",if(fee>40,"C","nan")));

select * from student; 
start transaction;
-- case statement-----
alter table student add
column full_cource varchar(20);

update student set full_cource= case
when cource="d.a" then "data analyst"
when cource="d.s" then "data science"
when cource="m.l" then "macine learning"
when cource= "w.d" or cource="c.d" 
then "combined_cource"
else "not_defined" end;
select * from student;

 select cource, case
when cource="d.a" then "data analyst"
when cource="d.s" then "data science"
when cource="m.l" then "macine learning"
when cource= "w.d" or cource="c.d" 
then "combined_cource"
else "not_defined" end as "full_cource" from student;
  