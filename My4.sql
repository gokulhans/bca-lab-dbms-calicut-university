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

CREATE TABLE Bank_customer (
    accno INT PRIMARY KEY, 
    cust_name VARCHAR(255), 
    place VARCHAR(255)
);

CREATE TABLE Deposit (
    accno INT, 
    deposit_no INT, 
    damount DECIMAL(10,2),
    PRIMARY KEY(accno, deposit_no),
    FOREIGN KEY (accno) REFERENCES Bank_customer(accno)
);

CREATE TABLE Loan (
    accno INT,
    loan_no INT, 
    Lamount DECIMAL(10,2),
    PRIMARY KEY(accno, loan_no),
    FOREIGN KEY (accno) REFERENCES Bank_customer(accno)
);

SELECT * FROM Bank_customer;

SELECT Bank_customer.cust_name, Deposit.damount FROM Bank_customer
JOIN Deposit ON Bank_customer.accno = Deposit.accno
WHERE Bank_customer.accno NOT IN (SELECT accno FROM Loan);

SELECT Bank_customer.cust_name, Loan.Lamount FROM Bank_customer
JOIN Loan ON Bank_customer.accno = Loan.accno
WHERE Bank_customer.accno NOT IN (SELECT accno FROM Deposit);

SELECT Bank_customer.cust_name, Deposit.damount, Loan.Lamount FROM Bank_customer
JOIN Deposit ON Bank_customer.accno = Deposit.accno
JOIN Loan ON Bank_customer.accno = Loan.accno;

SELECT Bank_customer.cust_name FROM Bank_customer
WHERE Bank_customer.accno NOT IN (SELECT accno FROM Deposit)
AND Bank_customer.accno NOT IN (SELECT accno FROM Loan);
