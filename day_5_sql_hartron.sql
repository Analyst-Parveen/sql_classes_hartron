set sql_safe_updates=0;
use day2;
select * from cricket_2;


-- drop column using alter ----
alter table cricket_2 add column group_s varchar(50);
alter table cricket_2 drop column  group_s;

-- modify ------(changing data type)
alter table cricket_2 modify column runs varchar(50);
alter table cricket_2 modify column runs int;
alter table cricket_2 modify column name_s int;

-- renaming of a column---

alter table cricket_2 rename column Player_Name to name_s;

-- adding constraint using alter command ------
alter table cricket_2 add constraint first_constraint check(runs>20);
alter table cricket_2 add constraint second_constraints unique(player_id);

-- removing constraint -----
alter table cricket_2 drop  constraint  first_constraint;
alter table cricket_2 drop  constraint  second_constraints;

-- udpate command --- using sql ---
select * from cricket_2;

update cricket_2 set name_s="parveen" where player_id="pl1";
update cricket_2 set name_s="virat" where player_id="pl1" or player_id="pl2";
update cricket_2 set name_s="shreya" where player_id in("pl1","pl2","pl3");

alter table cricket_2 add column grade varchar(30);
update cricket_2 set grade="a";
alter table cricket_2 add column marks int;
update cricket_2 set marks=if(runs>40,10,12);
alter table cricket_2 add column dates date;
update cricket_2 set dates=curdate();




