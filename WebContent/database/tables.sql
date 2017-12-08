// database bank username:- root and password ROOT port no:- 3308


    /*admin table*/
    CREATE TABLE t_admin_register(
    admin_id INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    gender VARCHAR(100) NOT NULL,
    mobileNumber VARCHAR(100) NOT NULL,
    dateofbirth VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    submission_date DATE,
    PRIMARY KEY (admin_id)
    );
    
    /*add update_date column in t_admin_register*/
    
    alter table t_admin_register add column update_date date;
    

    
    /* Bank customer table creation*/
	  
	CREATE TABLE t_customer_register(
    customer_id INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    gender VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    userName VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    adhaarNumber VARCHAR(100) NOT NULL,
    idProof VARCHAR(100) NOT NULL,
    mobileNumber VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    submission_date DATE,
    idNumber varchar(30),
    account_number bigint(20),
    referenceNumber bigint(20),
    PRIMARY KEY (customer_id)
    );
	  
  alter table t_customer_register modify idNumber varchar(100);	  
	  
  /*update referenceNumber and account_number columns  */
   ALTER TABLE t_customer_register MODIFY referenceNumber VARCHAR(653);
   
   ALTER TABLE t_customer_register MODIFY account_number VARCHAR(653);
  
  
  /*update password*/
   
    update t_customer_register set password='',confirmPassword=''
    where userName='';

   update t_customer_register set password=''  where userName='';
   



/*add new column */

  ALTER TABLE t_customer_register ADD COLUMN conformPassword VARCHAR(100) null AFTER password; 


/*admin username:- manikanta@gmail.com password:- manikanta*/

/*customer username:- manikanta password:- manikanta*/


/*July 13 2017*/

alter table t_customer_register add column oldPassword varchar(100);

/* july 14 2017  */

alter table t_admin_register add column newPassword varchar(100) after password;

alter table t_admin_register add column oldPassword varchar(100) after newPassword;

/*July 15 2017  table rename changes*/


alter table t_customer_register rename to t_customer_create;

alter table t_admin_register rename to t_admin_create;


/*July 16th 2017*/

/*add conformPassword in t_admin_create*/

alter table t_admin_create add column conformPassword varchar(200);

alter table t_admin_create drop column newPassword;

/*July 22 2017*/


 update t_customer_create set account_number='55656742543' where referenceNumber='4804710129';
 
 update t_customer_create set account_number='55656742544' where referenceNumber='1071951548';
 
 /* 24th july,2017 */
 /* modifying userName in the t_customer_create table to unique */
 
 ALTER TABLE t_customer_create ADD UNIQUE (userName);
 
 /* modifying userName in the t_customer_create table to unique */
 
 ALTER TABLE t_admin_create ADD UNIQUE (email);
 
 /*inserting values into cusomer*/
 insert into t_customer_create(customer_id,firstName,lastName,gender,email,userName,password,conformPassword,adhaarNumber,idProof,mobileNumber,address,city,state,country,idNumber,account_number,referenceNumber,oldPassword)
 values(3,"shahid","miya","male","shahid@gmail.com","shahid","shahid","shahid",67832837465,"adhaar",9578465872,"kukatpally","Hyderabad","Telangana","india",58745862548,20013578456,58462458,"shahid");
 
 insert into t_customer_create(customer_id,firstName,lastName,gender,email,userName,password,conformPassword,adhaarNumber,idProof,mobileNumber,address,city,state,country,idNumber,account_number,referenceNumber,oldPassword)
 values(4,"bharath","amanana","male","bharath@gmail.com","bharath","bharath","bharath",24572837465,"adhaar",8856465872,"kukatpally","Hyderabad","Andhrapradesh","india",35145862548,54213578456,34862458,"bharath");
 
 insert into t_customer_create(customer_id,firstName,lastName,gender,email,userName,password,conformPassword,adhaarNumber,idProof,mobileNumber,address,city,state,country,idNumber,account_number,referenceNumber,oldPassword)
 values(5,"srinath","palsa","male","srinath@gmail.com","srinath","srinath","srinath",65422837465,"adhaar",7708465872,"kukatpally","Hyderabad","Telangana","india",24765862548,45861578456,24862458,"srinath");
 
 
/*create table for customer_finance*/
 
 create table customer_finance(
  cus_finance_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  userName varchar(300) not null unique,
  account_number bigint(20),
  account_balance varchar(300) not null,
  demat varchar(300) not null,
  deposits varchar(300) not null,
  credit_cards varchar(300) not null,
  loans varchar(300) not null,
  insurance varchar(300) not null,
  PRIMARY KEY (cus_finance_id));
  
 
  FOREIGN KEY(customer_id) REFERENCES t_customer_create(customer_id),
  FOREIGN KEY(account_number) REFERENCES t_customer_create(account_number),
  FOREIGN KEY(userName) REFERENCES t_customer_create(userName),  
 
 /* July 29 2017 */
  
  SET PASSWORD FOR 'root'@'localhost' = PASSWORD('devInfoSec@999');
  
   
  /*Needs to be deployed*/
  
  august 9 2017
  
  
  ALTER TABLE customer_finance  ADD FOREIGN KEY customerId_fk(customer_id) REFERENCES t_customer_create(customer_id) ON UPDATE CASCADE ON DELETE RESTRICT;
  
alter table customer_finance modify account_balance varchar(300) null;	  

alter table customer_finance modify demat varchar(300) null;	 

alter table customer_finance modify deposits varchar(300) null;	 

alter table customer_finance modify credit_cards varchar(300) null;	 


alter table customer_finance modify insurance varchar(300) null;	 


alter table customer_finance modify loans varchar(300) null;	 

delete from t_customer_create where userName in ('shahid','bharath','srinath','Rajesh') ;





	  
 