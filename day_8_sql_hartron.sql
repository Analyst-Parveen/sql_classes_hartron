show databases;
use hero2;
show tables;
select*from hero_bikes;

select * from hero_bikes where price >2000;

update table hero_bikes set grade2="a";

create table gptdata(id int, name_ varchar(50),
age int,city varchar(50),score float);

select * from gptdata;

create table gptdata1(id int, name_ varchar(50),
age int,city varchar(50),score float);

load data infile "C:\Users\Mukul\OneDrive\Desktop\generated_data.csv"
into table gptdata1
fields terminated  by ','
enclosed  by '"'
lines terminated by "\n"
ignore 1 rows;

set global local_infile=0;

select * from gptdata;

select ucase(city) from gptdata;
select lcase(city) from gptdata;
select left(city,3) from gptdata;
select right(city,3) from gptdata;
select city,mid(city,3,2) from gptdata;
select city,length(city) from gptdata;
select score,round(score,1) from gptdata;

select sum(score) from gptdata;
select sum(score),round(sum(score),3) from gptdata;

select now();
select (now());











