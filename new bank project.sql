CREATE DATABASE new_bank;
use new_bank;
CREATE TABLE customer(
custid VARCHAR(100),
fname VARCHAR(100),
mname VARCHAR(100),
ltname VARCHAR(100),
city VARCHAR(100),
mobileno VARCHAR(100),
occupation VARCHAR(100),
dob DATE,
CONSTRAINT customer_custid_pk PRIMARY KEY(custid));
INSERT INTO customer(custid,fname,mname,ltname,city,mobileno,occupation,dob)
VALUES('C00001','Ramesh','Chandra','Sharma','Delhi','9543198345','Service','1976-12-06'),
      ('C00002','Avinash','Sunder','Minha','Delhi','9876532109','Service','1974-10-16'),
      ('C00003','Rahul',null,'Rastogi','Delhi','9765178901','Student','1981-09-26'),
      ('C00004','Parul',null,'Gandhi','Delhi','9876532109','Housewife','1976-11-03'),
      ('C00005','Naveen','Chandra','Aedekar','Mumbai','8976523190','Service','1976-09-19'),
      ('C00006','Chitresh',null,'Barwe','Mumbai','7651298321','Student','1992-11-06'),
      ('C00007','Amit','Kumar','Borkar','Mumbai','9875189761','Student','1981-09-06'),
      ('C00008','Nisha',null,'Damle','Mumbai','7954198761','Service','1975-12-03'),
      ('C00009','Abhishek',null,'Dutta','Kolkata','9856198761','Service','1973-05-22'),
      ('C00010','Shankar',null,'Nair','Chennai','8765489076','Service','1976-07-12');
   
  
CREATE TABLE branch(
bid VARCHAR(100),
bname VARCHAR(100),
bcity VARCHAR(100),
CONSTRAINT branch_bid_pk PRIMARY KEY(bid));
insert into branch(bid,bname,bcity)
values('B00001','Asaf ali road','Delhi'),
      ('B00002','New delhi main branch','Delhi'),
      ('B00003','Delhi cantt','Delhi'),
      ('B00004','Jasola','Delhi'),
      ('B00005','Mahim','Mumbai'),
      ('B00006','Vile parle','Mumbai'),
      ('B00007','Mandvi','Mumbai'),
      ('B00008','Jadavpur','Kolkata'),
      ('B00009','Kodambakkam','Chennai');
   
CREATE TABLE account(
acnumber VARCHAR(100),
custid  VARCHAR(100),
bid VARCHAR(100),
opening_balance INT,
aod DATE,
atype VARCHAR(100),
astatus VARCHAR(100),
CONSTRAINT account_acnumber_pk PRIMARY KEY(acnumber),
CONSTRAINT account_custid_fk FOREIGN KEY(custid) REFERENCES customer(custid),
CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES branch(bid));
insert into account(acnumber,custid,bid,opening_balance,aod,atype,astatus)
values('A00001','C00001','B00001',1000,'2012-12-15','Saving','Active'),
      ('A00002','C00002','B00001',1000,'2012-06-12','Saving','Active'),
      ('A00003','C00003','B00002',1000,'2012-05-17','Saving','Active'),
      ('A00004','C00002','B00005',1000,'2013-01-27','Saving','Active'),
      ('A00005','C00006','B00006',1000,'2012-12-17','Saving','Active'),
      ('A00006','C00007','B00007',1000,'2010-08-12','Saving','Suspended'),
      ('A00007','C00007','B00001',1000,'2012-10-02','Saving','Active'),
      ('A00008','C00001','B00003',1000,'2009-11-09','Saving','Terminated'),
      ('A00009','C00003','B00007',1000,'2008-11-30','Saving','Terminated'),
      ('A00010','C00004','B00002',1000,'2013-03-01','Saving','Active');

     
CREATE TABLE trandetails(   
tnumber VARCHAR(100),
acnumber VARCHAR(100),
dot DATE,
medium_of_transaction VARCHAR(100),
transaction_type VARCHAR(100),
transaction_amount INT,    
CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(tnumber),
CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(acnumber) REFERENCES account(acnumber));
insert into trandetails
values('T00001','A00001','2013-01-01','Cheque','Deposit',2000),
                  ('T00002','A00001','2013-02-01','Cash','Withdrawal',1000),
   ('T00003','A00002','2013-01-01','Cash','Deposit',2000),
   ('T00004','A00002','2013-02-01','Cash','Deposit',3000),
    ('T00005','A00007','2013-01-11','Cash','Deposit',7000),
  ('T00006','A00007','2013-01-13','Cash','Deposit',9000),
   ('T00007','A00001','2013-03-13','Cash','Deposit',4000),
   ('T00008','A00001','2013-03-14','Cheque','Deposit',3000),
   ('T00009','A00001','2013-03-21','Cash','Withdrawal',9000),
   ('T00010','A00001','2013-03-22','Cash','Withdrawal',2000),
    ('T00011','A00002','2013-03-25','Cash','Withdrawal',7000),
   ('T00012','A00007','2013-03-26','Cash','Withdrawal',2000);

CREATE TABLE loan(
custid VARCHAR(100),
bid VARCHAR(100),
loan_amount INT,
CONSTRAINT loan_customer_custid_bid_pk PRIMARY KEY(custid,bid),
CONSTRAINT loan_custid_fk FOREIGN KEY(custid) REFERENCES  customer(custid),
CONSTRAINT loan_bid_fk FOREIGN KEY(bid) REFERENCES  branch(bid));
INSERT INTO loan(custid,bid,loan_amount)
VALUES('C00001','B00001',100000),
('C00002','B00002',200000),
('C00009','B00008',400000),
('C00010','B00009',500000),
('C00001','B00003',600000),
('C00002','B00001',600000);

select * from customer;
select * from branch;
select * from account;
select * from trandetails;
select * from loan;

 
-- All tables with records are created, now we will perform queries on these tables:

-- Problem#1:
-- 1)Write a query to display the customer number, firstname, customer’s date of birth. Display in sorted order of date of birth year and within that sort by firstname.
     select custid,fname,dob from customer order by year(dob),fname;

-- Problem#2:
-- 2)Write a query to display the customer’s number, first name, and middle name. The customer’s who don’t have a middle name, for them display the last name. Give the alias name as Cust_Name.
     select custid,fname, coalesce(mname,ltname) as Customer_Name from customer;

-- Problem#3:
-- 3)Write a query to display account number, customer’s number, customer’s firstname,lastname,account opening date.
     select acnumber,custid,fname,ltname,aod from account;

-- Problem # 4:
-- 4)Write a query to display the number of customer’s from Delhi. Give the count an alias name of Cust_Count.
     select count(*) as Cust_Count from customer where city="Delhi";

-- Problem # 5:
-- 5)Write a query to display  the customer number, customer firstname,account number for the customer’s whose accounts were created after 15th of any month.
     select c.custid,c.fname,a.acnumber from customer c join account a on c.custid=a.custid where day(a.aod)> 15;

-- Problem # 6:
-- 6)Write a query to display the female customers firstname, city and account number who are not into business, service or studies.
     select distinct customer.fname,customer.city,account.acnumber from account,customer where account.custid=customer.custid
and not (occupation="Business" or occupation="Service" or occupation="student");

-- Problem # 7:
-- 7)Write a query to display city name and count of branches in that city. Give the count of branches an alias name of Count_Branch.
     select bcity, count(*) as Count_Branch from branch group by bcity;

-- Problem # 8:
-- 8)Write a query to display account id, customer’s firstname, customer’s lastname for the customer’s whose account is Active.
     select account.acnumber,customer.fname,customer.ltname from account,customer where account.custid=customer.custid and astatus ="Active";

-- Problem # 9:
-- 9)Write a query to display the customer’s number, customer’s firstname, branch id and loan amount for people who have taken loans.
     select customer.custid,customer.fname,branch.bid,loan.loan_amount from ((loan inner join customer on loan.custid=customer.custid)
     inner join branch on loan.bid=branch.bid);


-- Problem # 10:
-- 10)Write a query to display customer number, customer name, account number where the account status is terminated.
      select customer.custid,customer.fname,account.acnumber from account,customer where account.custid=customer.custid and astatus="Terminated";


