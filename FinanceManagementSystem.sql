--Database Creation & using it

create database Finance
use FinanceDb

--Creating Users Table

create table Users(
user_id int identity(1,1) primary key,
username varchar(50) not null,
[password] varchar(255) not null,
email varchar(100) not null unique
);

--Creating ExpenseCategories Table

create table ExpenseCategories(
category_id int identity(1,1) primary key,
category_name varchar(100) not null
);

--Creating Expenses Table

create table Expenses(
expense_id int identity(1,1) primary key,
user_id int not null,
amount decimal(10,2) not null,
category_id int not null,
[date] date not null,
[description] varchar(255),
constraint fk_User foreign key (user_id) references Users(user_id),
constraint fk_Category foreign key (category_id) references ExpenseCategories(category_id)
);

--Inserting values into each table

insert into Users (username, password, email)
values
('arjun', 'password123', 'arjun@example.com'),
('anjali', 'password123', 'anjali@example.com'),
('rohit', 'password123', 'rohit@example.com'),
('priya', 'password123', 'priya@example.com'),
('karthik', 'password123', 'karthik@example.com'),
('lakshmi', 'password123', 'lakshmi@example.com'),
('vignesh', 'password123', 'vignesh@example.com'),
('anitha', 'password123', 'anitha@example.com'),
('balaji', 'password123', 'balaji@example.com'),
('shalini', 'password123', 'shalini@example.com');

insert into ExpenseCategories (category_name)
values 
('Food'),
('Transportation'),
('Rent'),
('Utilities'),
('Entertainment'),
('Health'),
('Clothing'),
('Education'),
('Travel'),
('Other');

insert into Expenses (user_id, amount, category_id, date, description)
values 
(1, 2000.00, 1, '2024-09-01', 'Groceries'),
(2, 1500.00, 2, '2024-09-02', 'Bus fare'),
(3, 8000.00, 3, '2024-09-03', 'Monthly Rent'),
(4, 3000.00, 4, '2024-09-04', 'Electricity Bill'),
(5, 2500.00, 5, '2024-09-05', 'Movie tickets'),
(6, 3500.00, 6, '2024-09-06', 'Health insurance'),
(7, 1500.00, 7, '2024-09-07', 'New clothes'),
(8, 5000.00, 8, '2024-09-08', 'Online course fees'),
(9, 4500.00, 9, '2024-09-09', 'Weekend trip'),
(10, 700.00, 10, '2024-09-10', 'Miscellaneous expenses');



