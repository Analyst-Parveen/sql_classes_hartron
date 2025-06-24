SELECT * FROM temp.tady;
use temp;
select * from tady;

select * from tady where  gender="female" and student_age>50;

delimiter &&
create procedure conditon()
begin
select * from tady where  gender="female" and student_age>50;
end &&

call conditon();

delimiter &&
create procedure dynamics(in a varchar(50),in b int)
begin
select * from tady where  gender=a and student_age<b;
end &&

call dynamics("female",50);

select gender,student_age from tady;
select gender,count(student_age) from  tady where student_age>20  group by gender having 
count(student_age)>45;


select sum(coalesce(student_age,0)) as updated from tady;

select percent,isnull(percent) from tady;
select nullif("parveen",2);

select * from tady;
set sql_safe_updates=0;
update tady set marks=rand()*100;
select * from tady;
-- highest data ---
 select * from tady order by student_age desc limit 3,1;
 select * from tady where student_age=(select max(student_age) from tady);
select max(student_age) from tady where student_age<(select max(student_age) from tady);

select * from tady where student_age=(select max(student_age) 
from tady where student_age<(select max(student_age) from tady));

select student_age,row_number() over(order by student_age desc)  as row_ from tady;
select student_age,rank() over(order by student_age desc)  as row_ from tady;

select gender,student_age,dense_rank() 
over(partition by gender order by student_age desc) 
 as row_ from tady;


with a as (select *,dense_rank() over(order by student_age desc)
  as row_s from tady)
  select * from a where row_s=3;

update tady set row_s=(dense_rank() over(order by student_age));
insert into  tady(row_s) values(dense_rank() over(order by student_age));

create table new1 as select student_age,
dense_rank() over(order by student_age desc)  as row_ from tady;
select * from new1;

select marks,lead(marks)over(order by marks),
lag(marks) over(order by marks ) from tady;

select marks,sum(marks) over(order by marks desc) from tady;















