-- stored procedure-------------------
delimiter &&
create procedure jack()
begin
select * from day2;
end &&;

call jack();

delimiter && 
create procedure sparrow1()
begin
select * from day2 where 
(math>75 or grade="second") and percentage>75;
end &&

call sparrow1();

delimiter &&
create procedure meon(in a int,in b varchar(50))
begin
select * from day2 where math>a or grade=b;
end; &&

call meon(95,"second");