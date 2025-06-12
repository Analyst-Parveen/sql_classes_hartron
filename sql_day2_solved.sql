-- --------------------------------------------------------
# Datasets Used: cricket_1.csv, cricket_2.csv
-- cricket_1 is the table for cricket test match 1.
-- cricket_2 is the table for cricket test match 2.
-- --------------------------------------------------------
set sql_safe_updates=0;
create database day2;
use day2;
create table if not exists cricket_1(Player_Id varchar(20),
Player_Name varchar(20),
Runs int,
Popularity int
);

select @@secure_file_priv;

load data infile "D:/sql-homework/Day 2-20201105T114013Z-001/Day 2/DataSet/cricket_1.csv"
into table cricket_1
columns terminated by ","
enclosed by '"'
lines terminated by "\n"
ignore 1 rows;

select * from cricket_1;

create table cricket_2(Player_Id varchar(20),
Player_Name varchar(20),
Runs int,
Charisma int
);

load data infile "D:/sql-homework/Day 2-20201105T114013Z-001/Day 2/DataSet/cricket_2.csv"
into table cricket_2
columns terminated by ","
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from cricket_2;

# Q1. Find all the players who were present in the test match 1 as well as in the test match 2.
select * from cricket_1 a inner join cricket_2 b on a.Player_Id=b.Player_Id;
 
# Q2. Write a query to extract the player details player_id, runs and player_name from the table “cricket_1” who
#  scored runs more than 50
select Player_Id,Player_Name,Runs from cricket_1 where Runs>50;

# Q3. Write a query to extract all the columns from cricket_1 where player_name starts with ‘y’ and ends with ‘v’.
select * from cricket_1 where Player_Name like "y%v";
# Q4. Write a query to extract all the columns from cricket_1 where player_name does not end with ‘t’.
 select * from cricket_1 where Player_Name not like "%t";
-- --------------------------------------------------------
# Dataset Used: cric_combined.csv 

create table cric_combined(Player_Id varchar(20),
Player_Name	varchar(20),
Runs int,
Popularity int,
Charisma int
);
load data infile "D:/sql-homework/Day 2-20201105T114013Z-001/Day 2/DataSet/cric_combined.csv"
into table cric_combined
columns terminated by ","
enclosed by '"'
lines terminated by "\n"
ignore 1 rows;
select * from cric_combined;

-- --------------------------------------------------------

# Q5. Write a MySQL query to add a column PC_Ratio to the table that contains the divsion ratio 
# of popularity to charisma .(Hint :- Popularity divide by Charisma)

alter table cric_combined add column pc_ratio float;
update cric_combined set pc_ratio=(Popularity/Charisma);

# Q6. Write a MySQL query to find the top 5 players having the highest popularity to charisma ratio.

select * from cric_combined order by Charisma desc limit 5; 

# Q7. Write a MySQL query to find the player_ID and the name of the player that contains the character “D” in it.
select Player_Id,Player_Name from cric_combined  where Player_Name like "%d%";

# Q8. Extract Player_Id  and PC_Ratio where the PC_Ratio is between 0.12 and 0.25.
select Player_ID,pc_ratio from cric_combined where pc_ratio between 0.12 and 0.25;

-- --------------------------------------------------------
# Dataset Used: new_cricket.csv

create table if not exists new_cricket(Player_Id varchar(20),
Player_Name varchar(20),
Runs int,
Popularity int,
Player_Id2 varchar(20),
Player_Name2 varchar(20),
Runs2 int,
Charisma int
);
select * from new_cricket;
describe new_cricket;

-- --------------------------------------------------------
# Q9. Extract the Player_Id and Player_name of the players where the charisma value is null.
select Player_Id,Player_Name from new_cricket where Charisma is Null;
 
# Q10. Write a MySQL query to display all the NULL values  in the column Charisma imputed with 0.
update new_cricket set charisma=0 where charisma is null;
select * from new_cricket where charisma=0;
 
# Q11. Separate all Player_Id into single numeric ids (example PL1 to be converted as 1, PL2 as 2 , ... PL12 as 12 ).
 select Player_id,mid(Player_Id,3) seperate from new_cricket;

# Q12. Write a MySQL query to extract Player_Id , Player_Name and charisma where the charisma is greater than 25.
select player_id,player_name,charisma from new_cricket where charisma>25;
-- --------------------------------------------------------
# Dataset Used: churn1.csv 
-- --------------------------------------------------------
create table if not exists churn1(
customerID varchar(100),
gender varchar(100),
SeniorCitizen int,
Partner varchar(100),
Dependents varchar(100),
tenure int,
CallService varchar(100),
MultipleConnections varchar(100),
InternetConnection varchar(100),
OnlineSecurity varchar(100),
OnlineBackup varchar(100),
DeviceProtectionService varchar(100),
TechnicalHelp varchar(100),
OnlineTV varchar(100),
OnlineMovies varchar(100),
Agreement varchar(100),
BillingMethod varchar(100),
PaymentMethod varchar(100),
MonthlyServiceCharges float,
TotalAmount float,
Churn varchar(100)
);
load data infile "D:/sql-homework/Day 2-20201105T114013Z-001/Day 2/DataSet/churn1.csv"
into table churn1
columns terminated by ","
enclosed by '"'
lines terminated by "\n"
ignore 1 rows;

select count(*) from churn1;
select * from churn1;

# Q13. Write a query to display the rounding of lowest integer value of monthlyservicecharges and rounding of higher integer value of totalamount 
# for those paymentmethod is through Electronic check mode.
select floor(MonthlyServiceCharges),ceil(TotalAmount),PaymentMethod
 from churn1 where PaymentMethod="electronic check";
 
# Q14. Rename the table churn1 to “Churn_Details”.
rename table churn1 to churn_details;

# Q15. Write a query to create a display a column new_Amount that contains the sum of TotalAmount and MonthlyServiceCharges.

alter table churn_details add column new_amount float;
update churn_details set new_amount=(TotalAmount+MonthlyServiceCharges);
select * from churn_details;

# Q16. Rename column new_Amount to Amount.
alter table churn_details change new_amount  amount float;

# Q17. Drop the column “Amount” from the table “Churn_Details”.
alter table churn_details drop column amount;

# Q18. Write a query to extract the customerID, InternetConnection and gender 
# from the table “Churn_Details ” where the value of the column “InternetConnection” has ‘i’ 
# at the second position.
select customerid,InternetConnection,gender from Churn_Details where InternetConnection like "_i%";

# Q19. Find the records where the tenure is 6x, where x is any number.
select * from churn_details where tenure%6=0 order by tenure;

# Q20. Write a query to display the player names in capital letter and arrange in alphabatical order along with the charisma, display 0 for whom the charisma value is NULL.
select * from NEW_CRICKET;
update new_cricket set charisma=0 where charisma is null;
select upper(player_name) as nme,charisma from new_cricket order by nme;