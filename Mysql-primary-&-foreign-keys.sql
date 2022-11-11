create database key_prime;

use key_prime;

/*crating new table*/

create table ineuron(
course_id int not null,
course_name varchar(60),
course_status varchar(60),
number_of_enrol int,
primary key(course_id));

insert into ineuron values(01,'FSDS','active','100');

insert into ineuron values(02,'FSDS','active','101');

insert into ineuron values(3,'fsds','active','102');

select * from ineuron;

/* creating child table */

create table student_ineuron(
student_id int,
student_name varchar(60),
student_mail varchar(60),
student_status varchar(60),
course_id1 int,
foreign key(course_id1) references ineuron(course_id));

insert into student_ineuron values(101,'fsds','student@gmail.com','active',05);

insert into student_ineuron values(101,'fsds','student@gmail.com','active',01);

insert into student_ineuron values(102,'fsds','student@gmail.com','active',02);
select * from student_ineuron;

create table payment(
course_id int,
course_name varchar(60),
course_live_status varchar(60),
course_launch_date varchar(60),
foreign key(course_id) references ineuron(course_id));

insert into payment values(01,'fsds','not-active','7th August');

insert into payment values(2,'fsds','not-active','7th August');

insert into payment values(3,'fsds','not-active','7th August');

select * from payment;

/* Here we are going to use both primary key and Foreign in the same table*/

create table class(
course_id int,
class_name varchar(60),
class_topic varchar(60),
class_duration int,
primary key(course_id),
foreign key(course_id) references ineuron(course_id));

insert into class values(01,'fsds class','Mysql','5');

insert into class values(3,'fsds class2','Mysql',4);
insert into class values(2,'fsds class2','Mysql',4);

/* Here we will get the error because the 'course_id- 04' not available in the parent table*/ 
insert into class values(04,'fsds class2','Mysql',4);

select * from class;

/* In modeling if we have seen the doted lines '------' like this means then it is having a weak relatioship with parent table*/

/* In modeling if we have seen the non-doted lines '_________' like this means then it is having a strong relationship with the parent table */

/* To drop the primary key:-
        i)if primary key is there in the table, we have to see whether that primary key is associated with any other table (or) not.
        ii)if it is associated with table then first we have to drop that child table first, then after we can able to drop the parent table.
 */
 
 /* Query to drop Primary Key---the below query will be executed only if the primary key is not associated with any other table */
 
 alter table class drop primary key;
 
 /* To drop the table here also we have to see whether the table is associated with any another table
    i)if associated we have to drop that table first.
    ii) if not associated we can easily drop the table.
----Query to drop the table */

drop table class;   

/* creating new table */

create table test(
id int not null,
name varchar(60),
email_id varchar(60),
mobile_no varchar(60),
address varchar(60)) 

select * from test;

/* if we want to declare the primary key in the later stage then follow the below query */

alter table test add primary key(id); 

/* To remove the primary key */

alter table test drop primary key; 

/* To declare a primary key for multiple columns at a time */

alter table test add constraint test_prim primary key(id,email_id);

/*creating New Table to perform different operations */

create table parent(
id int not null,
primary key(id));

create table child(
id int,
parent_id int,
foreign key(parent_id) references parent(id));

/* In the child table 'parent_id' column is associated 
   with the 'id' column in the parent table   
*/

insert into parent values(1);  
insert into parent values(2); 
select * from parent;

insert into child values(1,1);
select * from child;

/* Here we will get error because of child table association with the
  parent table and there is no record with '2' */

insert into child values(2,2);

/* delete operation */

delete from parent where id = 1;

delete from child where parent_id =1;  

/* Another way of deleting the record in the parent table 
   without deleting record in the child as shown below
   */
   
drop table child;

/* creating new table */

create table child(
id int,
parent_id int,
foreign key(parent_id) references parent(id) on delete cascade);

/* In the above table by using the --' ON DELETE CASCADE ' we can able to
  delete the record even it is having the association with the child table,
  Then it will delete the particular record in the parent table as well as
  in the child table automatically.
*/

insert into child values(1,1),(1,2),(3,2),(2,2);

select * from child;

select * from parent;

drop table child;

/* creating a new table */

create  table child(
id int,
parent_id int,
foreign key(parent_id) references parent(id) on update cascade);

/* In the above table by using the --- 'ON UPDATE CASCADE'--- we can 
  update the parent table even it has the ssociation with the child table
  and also automatically updated in the child table as well
*/

insert into child values(1,1),(1,2),(3,2),(2,2) ;

select * from child;

select * from parent;

update parent set id = 3 where id = 2;

/* we can also use both 'ON UPDATE CASCADE' and  'ON DELETE CASCADE'
   at a time as shown below.
*/

create table child1(
id int,
parent_id int,
foreign key(parent_id) references parent(id) on update cascade on delete cascade);



