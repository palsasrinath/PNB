/* Insert Admin tables*/

insert into admin_register(first_name,last_name,email,password,gender,qualification) 
values ('durga prasad','veera','durgaprasad@yahoo.com','durga','male','M.tech');

/*select Admin tables*/

select email,password from admin_register where email='durgaprasad@yahoo.com' and password='durga';

/* Insert Staff tables*/

insert into staff_register(first_name,last_name,email,password,gender,qualification,date,experience) 
values ('prasad','veera','durgaprasad@gmail.com','prasad','male','M.tech','23-05-1990','4');

/*select Staff tables*/

select email,password from admin_register where email='durgaprasad@gmail.com' and password='prasad';

/* Insert Student tables */

insert into student_register(First_name,Last_name,email,password,gender,dob) 
values('anil','mote','anil@gmail.com','mktechno','male','25-07-1993');

/* select Student tables */

select email,password from student_register where email='anil@gmail.com' and password='mkechno';

/*Tables column modify*/


alter table admin_register change column First_name first_name varchar(30);


alter table admin_register change column Last_name last_name varchar(30);



alter table staff_register change column First_name first_name varchar(30);



alter table staff_register change column Last_name last_name varchar(30);



alter table student_register change column First_name first_name varchar(30);


alter table student_register change column Last_name last_name varchar(30);


/*Truncate used to delete all the rows from the table*/

Truncate table admin_register;

Truncate table staff_register;

Truncate table student_register;

/*Change column datatype*/

alter table tablename modify  coumnname newdatatype;

alter table admin_register change column qualify qualification varchar(30);

alter table staff_register change column qualify qualification varchar(30);


/*delete to all the rows from the table*/

delete from staff_register;

/* Date Mar 22 2017 */

 select first_name,last_name from staff_register table

 select first_name,last_name from staff_register where email=? and password=?;


/*Change column name datatype size*/

ex:- ALTER TABLE <table_name> MODIFY <col_name> VARCHAR(65353);
alter table t_questions modify ques_name VARCHAR(65353);


/*update password*/



UPDATE Customers
SET ContactName='Juan'
WHERE Country='Mexico';



