/* creation of DATABASE */
create database ineuron;

/* 'use' is key word to select a particular database to perform operations */ 
use ineuron;

/* creation of table */
create table if not exists bank_details1 (
age int ,
job varchar(30) , 
marital varchar(30) , 
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30) , 
loan varchar(30) ,
contact varchar(30) , 
`day` int , 
`month` varchar(30) , 
duration int , 
campaign int , 
pdays int , 
previous int , 
poutcome varchar(30),
y varchar(30));

/* we use the below query to see how many tables are there in this particular database */
show tables;

describe bank_details;

/* Insertion of data into table */
insert into bank_details values(58,"management","married","tertiary","no",2143,"yes","no","unknown",5,"may",261,1,-1,0,"unknown","no");

insert into bank_details values 
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no");

/* To see complete table we use the below query */
select * from bank_details;

/* To select a particular column (or) columns query is */
select age,job from bank_details;

/* To select a limited records in a table query is*/
select * from bank_details limit 5;

/* performing filtering operations on the table */
select * from bank_details where job = 'retired' and balance > 100;

select * from bank_details where age =33;

select * from bank_details where age =33 and job = 'retired';

select * from bank_details where education = 'primary' or balance < 100;

select * from bank_details where(education = 'unknown' or marital = 'single' ) and balance < 500;

/* To the different types of jobs in a table we use the 'distinct' keyword */
select distinct job from bank_details;

/* To count the number of records in a table we use the 'count' keyword */
select count(*) from bank_details;

/* To find the sum of balance column */
select sum(balance) from bank_details ;

/* To find the minimum balance */
select min(balance) from bank_details;

/* To arrange the data in a ascending order according to age column then the query is */
select * from bank_details order by age;

/*  in descending order based on age column is */
select * from bank_details order by age desc;

/* performing 'group by' operations on particular columns */ 
select marital,count(*),sum(balance) from bank_details group by marital;

set sql_safe_updates = 0;

/* performing 'update' keyword on the bank_details table */
update bank_details set balance = 0 where job = 'unknown';

update bank_details set contact = 'known' , y = 'yes' where `month` = 'may';

update bank_details set `default` = 'null' where `default` = 'no';




	




