-- tcl command(commit,rollback,savepoint)----- 
set sql_safe_updates=0;
use day2;
create table student1(name_s varchar(50),
surname varchar(50),cource varchar(50),fee int);
insert into student1 values
("shreya","budhwart","d.a",20),
("mehak","tanwar","d.a",24),
("neha","shekhwat","d.s",28),
("ritika","tanwar","w.d",12),
("nidhi","shekhwat","d.s",17),
("tushar","attri","w.d",16),
("harshit","chauhan","c.d",20),
("jatin","panwar","c.d",16),
("ritesh","panwar","m.l",30),
("yogesh","verma","m.l",28),
("parveen","sharma","instructor",50);
select * from student;
-- use of rollback-------- 
start transaction;
insert into student1
 values("abihnav","gautam","c.c",30);
 select * from student1;
 rollback;
update student1 set cource="data_analytsics"
where name_s="parveen";

delete from student1 where name_s="parveen";

-- use of commit
insert into student1
 values("abihnav","gautam","c.c",30);
 commit;
 select * from student1;
 rollback;
 
 -- savepoint ------
 insert into student1
 values("jaikishan","gautam","f.c",30);
 savepoint first_savepoint;
 update  student1 set fee=45 where 
 name_s="jaikishan";
 savepoint second_savepoint;
 delete from student1 where name_s="harshit";
 select * from student1;
 rollback to savepoint second_savepoint;
 rollback to savepoint first_savepoint;
 rollback;
 
 
--  Groups BY clause----
select * from student;

select name_s,sum(fee) from student
 group by name_s;
 select cource,sum(fee) from student
 group by cource;
 select cource,sum(fee) from student
 group by cource having 
 sum(fee)>40 order by sum(fee) asc limit 1,2;
 