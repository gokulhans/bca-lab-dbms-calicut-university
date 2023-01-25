-- Create the following tables

-- Bank_customer (accno primary key, cust_name, place)
-- Deposit (accno foreign key, deposit_no, damount)
-- Loan (accno foreign key loan_no, Lamount)
-- Write the following queries
-- a) Display the details of the customers
-- b) Display the customers along with deposit amount who have only deposit
-- with the bank
-- c) Display the customers along with loan amount who have only loan with the
-- bank
-- d) Display the customers they have both loan and deposit with the bank
-- e) Display the customer who have neither a loan nor a deposit with the bank


create table bank_customer( accno integer primary key,cust_name varchar(10),place varchar(20));
insert into bank_customer values(101,'anu','vtk');
insert into bank_customer values(102,'anup','clt');
insert into bank_customer values(103,'appu','tvm');
insert into bank_customer values(104,'anupama','vtk');
insert into bank_customer values(105,'anusree','clt');
create table deposit(accno integer references bank_customer(accno),depositno integer primary key,depositamt integer);
insert into deposit values(101,201,10000);
insert into deposit values(102,202,50000);
insert into deposit values(103,203,10000);
select * from deposit;
create table loan(accno integer references bank_customer(accno),loanno integer primary key,loanamt integer);
insert into loan values(101,301,1000);
insert into loan values(102,302,5000);
insert into loan values(104,303,10000);  
select * from bank_customer;
select distinct bank_customer.accno,bank_customer.cust_name,deposit.depositamt from bank_customer,deposit,loan where bank_customer.accno=deposit.accno and deposit.accno not in(select accno from loan); 
select distinct bank_customer.accno,bank_customer.cust_name,loan.loanamt from bank_customer,deposit,loan where bank_customer.accno=loan.accno and loan.accno not in(select accno from deposit); 
select bank_customer.accno,bank_customer.cust_name from bank_customer where accno IN(select loan.accno from loan,deposit where loan.accno=deposit.accno);
select bank_customer.accno,bank_customer.cust_name from bank_customer where accno not IN(select loan.accno from loan) AND accno not IN(select deposit.accno from deposit);
