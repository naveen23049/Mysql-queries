create database sales;

use sales;

CREATE TABLE sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

set session sql_mode = '';

/* to load the bulk data at a time*/

load data infile 'D:/sales_data_final.csv'
into table sales1
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from sales1;

/* convertion of string format to date format--- because while we are uploading the bulk data we have to observe the date format */

select str_to_date(order_date, '%m/%d/%Y') from sales1; 

/* to add new columns into the table */
alter table sales1
add column order_date_new date after order_date;

/* while we are uploading the bulk data we may face the issue called -SAFE UPDATES then we have to use the below query*/
SET SQL_SAFE_UPDATES = 0;

/* updating data to the newly created column */
update sales1
set order_date_new = str_to_date(order_date,'%m/%d/%Y');

select * from sales1;

alter table sales1
add column ship_date_new date after ship_date;

update sales1
set ship_date_new = str_to_date(ship_date,'%m/%d/%Y');

/* Queries based on date */
select * from sales1 where ship_date_new = '2011-01-05';

select * from sales1 where ship_date_new > '2011-01-05';

select * from sales1 where ship_date_new < '2011-01-05';

/* To find the records between dates */
select * from sales1 where ship_date_new between '2011-01-05' and '2011-08-30';

/* To know thw current date in our system */
select now();

/* To find the current date*/
select curdate();

/* for current time*/
select curtime();

/*To find all the shipment records before 1 week*/
select * from sales1 where ship_date_new < date_sub(now(), interval 1 week);

select date_sub(now(), interval 3 day);

select date_sub(now(), interval 3 year);

select year(now());

select dayname(now());

/* for whatever the date we want to know*/
select dayname('2022-10-16  21:10:30');

/* Adding current date into the table in a separate column*/
alter table sales1
add column flag date after order_id;

select * from sales1;

update sales1
set flag = now();

/* PROBLEM STATEMENT-- 2011-01-05--- we have to create 3 separate columns for year,month,day*/

Alter table sales1
add column month_new int;

Alter table sales1
add column day_new int;

Alter table sales1
add column year_new int;

update sales1
set month_new = month(order_date_new);

update sales1
set day_new = day(order_date_new);

update sales1
set year_new = year(order_date_new);

select *from sales1;

/* PROBLEM STATEMENT-- Find the average sales in every year*/
select year_new,avg(sales) from sales1 group by year_new;

/* find the sum of the sales in every year*/
select year_new,sum(sales) from sales1 group by year_new;

/* Find the minimum and maximum sales every year*/

select year_new,min(sales) from sales1 group by year_new;

select year_new,max(sales) from sales1 group by year_new;

/* Find the quantity of every year sold*/
select year_new,sum(quantity) from sales1 group by year_new;

/*Operations on multiple columns at a time*/
select (sales*discount+shipping_cost) as CTC from sales1;

/* Write a query  if discount > 0 ---yes , if discount < 0 ----No*/
select order_id,discount, if(discount > 0, 'yes', 'no') as discount_flag from sales1;

/* Now, creating a new column called discount_flag and adding data into that column*/
alter table sales1
add column discount_flag varchar(20) after flag;

select * from sales1;

update sales1
set discount_flag = if(discount>0,'yes','no');

/*counting how many records having discount and how many records not having discount*/
select discount_flag,count(*) from sales1 group by discount_flag;

/* Another way of writing the above query to get the same result and without using the 'group by'*/
select count(*) from sales1 where discount>0;
select count(*) from sales1 where discount=0;
