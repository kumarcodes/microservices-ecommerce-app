-- ============================================
-- DROP TABLES (for easy re-running)
-- ============================================

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS users;


-- ============================================
-- DEPARTMENT TABLE
-- ============================================

CREATE TABLE departments (
                             department_id INT PRIMARY KEY,
                             department_name VARCHAR(100) NOT NULL UNIQUE
);


-- ============================================
-- EMPLOYEE TABLE
-- ============================================

CREATE TABLE employees (
                           employee_id INT PRIMARY KEY,
                           employee_name VARCHAR(100) NOT NULL,
                           email VARCHAR(150) UNIQUE,
                           salary DECIMAL(10,2),
                           department_id INT,
                           manager_id INT,
                           joining_date DATE,

                           CONSTRAINT fk_employee_department
                               FOREIGN KEY (department_id)
                                   REFERENCES departments(department_id),

                           CONSTRAINT fk_employee_manager
                               FOREIGN KEY (manager_id)
                                   REFERENCES employees(employee_id),

                           CONSTRAINT chk_salary
                               CHECK (salary >= 0)
);


-- ============================================
-- USERS TABLE
-- ============================================

CREATE TABLE users (
                       user_id INT PRIMARY KEY,
                       user_name VARCHAR(100) NOT NULL,
                       email VARCHAR(150),
                       city VARCHAR(100),
                       age INT,
                       created_date DATE
);


-- ============================================
-- ORDERS TABLE
-- ============================================

CREATE TABLE orders (
                        order_id INT PRIMARY KEY,
                        user_id INT,
                        order_date DATE,
                        amount DECIMAL(10,2),
                        status VARCHAR(30),

                        CONSTRAINT fk_order_user
                            FOREIGN KEY (user_id)
                                REFERENCES users(user_id)
);


-- ============================================
-- INDEXES
-- ============================================

CREATE INDEX idx_employee_salary
    ON employees(salary);

CREATE INDEX idx_employee_department
    ON employees(department_id);

CREATE INDEX idx_order_user
    ON orders(user_id);

CREATE INDEX idx_order_date
    ON orders(order_date);

INSERT INTO departments
(department_id, department_name)
VALUES
    (1, 'IT'),
    (2, 'HR'),
    (3, 'Finance'),
    (4, 'Sales'),
    (5, 'Operations');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (101, 'Amit', 'amit@company.com', 120000, 1, NULL, '2018-01-10');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (102, 'Rahul', 'rahul@company.com', 90000, 1, 101, '2019-03-15');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (103, 'Priya', 'priya@company.com', 85000, 1, 101, '2020-06-20');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (104, 'Sneha', 'sneha@company.com', 75000, 2, 105, '2021-02-11');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (105, 'Vikram', 'vikram@company.com', 110000, 2, NULL, '2017-08-05');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (106, 'Rohit', 'rohit@company.com', 95000, 3, 107, '2020-11-12');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (107, 'Neha', 'neha@company.com', 130000, 3, NULL, '2016-04-18');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (108, 'Karan', 'karan@company.com', 85000, 4, 109, '2022-01-25');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (109, 'Anjali', 'anjali@company.com', 100000, 4, NULL, '2018-09-30');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (110, 'Suresh', 'suresh@company.com', 75000, 5, 111, '2021-07-19');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (111, 'Meera', 'meera@company.com', 115000, 5, NULL, '2017-12-01');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (112, 'Arjun', NULL, 85000, 1, 101, '2023-01-10');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (113, 'Pooja', 'pooja@company.com', 95000, 1, 101, '2023-05-20');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (114, 'Raj', 'raj@company.com', 70000, 4, 109, '2024-02-15');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (115, 'Kavya', 'kavya@company.com', 85000, 1, 101, '2024-06-01');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (101, 'Amit', 'amit@company.com', 120000, 1, NULL, '2018-01-10');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (102, 'Rahul', 'rahul@company.com', 90000, 1, 101, '2019-03-15');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (103, 'Priya', 'priya@company.com', 85000, 1, 101, '2020-06-20');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (104, 'Sneha', 'sneha@company.com', 75000, 2, 105, '2021-02-11');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (105, 'Vikram', 'vikram@company.com', 110000, 2, NULL, '2017-08-05');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (106, 'Rohit', 'rohit@company.com', 95000, 3, 107, '2020-11-12');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (107, 'Neha', 'neha@company.com', 130000, 3, NULL, '2016-04-18');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (108, 'Karan', 'karan@company.com', 85000, 4, 109, '2022-01-25');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (109, 'Anjali', 'anjali@company.com', 100000, 4, NULL, '2018-09-30');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (110, 'Suresh', 'suresh@company.com', 75000, 5, 111, '2021-07-19');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (111, 'Meera', 'meera@company.com', 115000, 5, NULL, '2017-12-01');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (112, 'Arjun', NULL, 85000, 1, 101, '2023-01-10');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (113, 'Pooja', 'pooja@company.com', 95000, 1, 101, '2023-05-20');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (114, 'Raj', 'raj@company.com', 70000, 4, 109, '2024-02-15');

INSERT INTO employees
(employee_id, employee_name, email, salary, department_id, manager_id, joining_date)
VALUES
    (115, 'Kavya', 'kavya@company.com', 85000, 1, 101, '2024-06-01');

INSERT INTO users
(user_id, user_name, email, city, age, created_date)
VALUES
    (1, 'Rohit', 'rohit@gmail.com', 'Kolkata', 30, '2022-01-10');

INSERT INTO users
(user_id, user_name, email, city, age, created_date)
VALUES
    (2, 'Amit', 'amit@gmail.com', 'Delhi', 28, '2022-03-15');

INSERT INTO users
(user_id, user_name, email, city, age, created_date)
VALUES
    (3, 'Priya', 'priya@gmail.com', 'Mumbai', 26, '2022-05-20');

INSERT INTO users
(user_id, user_name, email, city, age, created_date)
VALUES
    (4, 'Rahul', 'rahul@gmail.com', 'Kolkata', 32, '2022-07-12');

INSERT INTO users
(user_id, user_name, email, city, age, created_date)
VALUES
    (5, 'Sneha', 'sneha@gmail.com', 'Bangalore', 27, '2022-09-01');

INSERT INTO users
(user_id, user_name, email, city, age, created_date)
VALUES
    (6, 'Vikas', 'vikas@gmail.com', 'Delhi', 35, '2023-01-18');

INSERT INTO users
(user_id, user_name, email, city, age, created_date)
VALUES
    (7, 'Neha', 'neha@gmail.com', 'Pune', 29, '2023-02-25');

INSERT INTO users
(user_id, user_name, email, city, age, created_date)
VALUES
    (8, 'Arjun', 'arjun@gmail.com', 'Kolkata', 31, '2023-04-10');

INSERT INTO users
(user_id, user_name, email, city, age, created_date)
VALUES
    (9, 'Pooja', 'pooja@gmail.com', 'Mumbai', 25, '2023-06-15');

INSERT INTO users
(user_id, user_name, email, city, age, created_date)
VALUES
    (10, 'Karan', 'karan@gmail.com', 'Delhi', 33, '2023-08-20');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1001, 1, '2023-01-05', 5000, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1002, 1, '2023-02-10', 3000, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1003, 1, '2023-03-15', 7000, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1004, 2, '2023-01-20', 2500, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1005, 2, '2023-04-12', 4500, 'PENDING');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1006, 3, '2023-02-18', 8000, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1007, 3, '2023-05-21', 2000, 'CANCELLED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1008, 4, '2023-03-10', 6500, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1009, 4, '2023-06-15', 3500, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1010, 5, '2023-01-25', 9000, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1011, 6, '2023-07-05', 12000, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1012, 7, '2023-08-10', 4000, 'PENDING');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1013, 8, '2023-09-15', 5500, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1014, 9, '2024-01-10', 10000, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1015, 10, '2024-02-20', 7500, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1016, 1, '2024-03-05', 6000, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1017, 2, '2024-04-18', 3000, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1018, 3, '2024-05-22', 8500, 'COMPLETED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1019, 4, '2024-06-10', 2000, 'CANCELLED');

INSERT INTO orders
(order_id, user_id, order_date, amount, status)
VALUES
    (1020, 5, '2024-07-15', 11000, 'COMPLETED');

-- H2 SQL Interview Practice Database for the uploaded 75-question set
-- Run this as data.sql in Spring Boot, or paste it into IntelliJ's H2 SQL console.

DROP TABLE IF EXISTS friends;
DROP TABLE IF EXISTS experiment_events;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS activity;
DROP TABLE IF EXISTS logins;
DROP TABLE IF EXISTS customer_revenue;
DROP TABLE IF EXISTS monthly_sales;
DROP TABLE IF EXISTS daily_traffic;
DROP TABLE IF EXISTS table_b;
DROP TABLE IF EXISTS table_a;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS users;

CREATE TABLE employees (
                           employee_id INT PRIMARY KEY,
                           name VARCHAR(100) NOT NULL,
                           salary DECIMAL(12,2),
                           department VARCHAR(100),
                           manager_id INT,
                           joining_date DATE
);

INSERT INTO employees VALUES
                          (101,'Amit',120000,'IT',NULL,'2018-01-10'),
                          (102,'Rahul',90000,'IT',101,'2019-03-15'),
                          (103,'Priya',85000,'IT',101,'2020-06-20'),
                          (104,'Sneha',75000,'HR',105,'2021-02-11'),
                          (105,'Vikram',110000,'HR',NULL,'2017-08-05'),
                          (106,'Rohit',95000,'Finance',107,'2020-11-12'),
                          (107,'Neha',130000,'Finance',NULL,'2016-04-18'),
                          (108,'Karan',85000,'Sales',109,'2022-01-25'),
                          (109,'Anjali',100000,'Sales',NULL,'2018-09-30'),
                          (110,'Suresh',75000,'Operations',111,'2021-07-19'),
                          (111,'Meera',115000,'Operations',NULL,'2017-12-01'),
                          (112,'Arjun',85000,'IT',101,'2023-01-10'),
                          (113,'Pooja',95000,'IT',101,'2023-05-20'),
                          (114,'Raj',70000,'Sales',109,'2024-02-15'),
                          (115,'Kavya',85000,'IT',101,'2024-06-01');

CREATE TABLE customers (
                           customer_id INT PRIMARY KEY,
                           name VARCHAR(100) NOT NULL,
                           email VARCHAR(150),
                           phone VARCHAR(30),
                           age INT,
                           income DECIMAL(12,2)
);

INSERT INTO customers VALUES
                          (1,'Rohit','rohit@gmail.com','9876500001',30,90000),
                          (2,'Amit','amit@gmail.com',NULL,28,75000),
                          (3,'Priya','priya@yahoo.com','9876500003',26,NULL),
                          (4,'Rahul','rahul@gmail.com','9876500004',32,120000),
                          (5,'Sneha','sneha@gmail.com',NULL,27,65000),
                          (6,'Vikas','vikas@outlook.com','9876500006',35,150000),
                          (7,'Neha','neha@gmail.com','9876500007',29,82000),
                          (8,'Arjun','arjun@yahoo.com','9876500008',31,95000),
                          (9,'Pooja','pooja@gmail.com',NULL,24,55000),
                          (10,'Karan','karan@gmail.com','9876500010',42,180000),
                          (11,'Meera','meera@gmail.com','9876500011',52,210000),
                          (12,'Sanjay','sanjay@yahoo.com',NULL,22,NULL);

CREATE TABLE products (
                          product_id INT PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          product_name VARCHAR(100),
                          category VARCHAR(50),
                          price DECIMAL(10,2)
);

INSERT INTO products VALUES
                         (1,'Laptop Pro','Laptop Pro','Electronics',1200),
                         (2,'Wireless Mouse','Wireless Mouse','Electronics',50),
                         (3,'Keyboard','Keyboard','Electronics',80),
                         (4,'Monitor','Monitor','Electronics',300),
                         (5,'T-Shirt','T-Shirt','Clothing',35),
                         (6,'Jeans','Jeans','Clothing',70),
                         (7,'Jacket','Jacket','Clothing',150),
                         (8,'Running Shoes','Running Shoes','Footwear',110),
                         (9,'Backpack','Backpack','Accessories',60),
                         (10,'Headphones','Headphones','Electronics',200),
                         (11,'Smart Watch','Smart Watch','Electronics',250),
                         (12,'Formal Shirt','Formal Shirt','Clothing',90),
                         (13,'Office Chair','Office Chair','Furniture',180),
                         (14,'Water Bottle','Water Bottle','Accessories',25),
                         (15,'Unused Product','Unused Product','Accessories',75);

CREATE TABLE orders (
                        order_id INT PRIMARY KEY,
                        customer_id INT NOT NULL,
                        order_date DATE NOT NULL,
                        amount DECIMAL(12,2) NOT NULL,
                        status VARCHAR(30),
                        region VARCHAR(50),
                        category VARCHAR(50)
);

INSERT INTO orders VALUES
                       (1001,1,'2026-01-03',1200,'completed','East','Electronics'),
                       (1002,1,'2026-01-15',850,'completed','East','Clothing'),
                       (1003,1,'2026-02-05',450,'completed','East','Electronics'),
                       (1004,1,'2026-02-18',1500,'completed','East','Electronics'),
                       (1005,1,'2026-03-10',700,'completed','East','Clothing'),
                       (1006,1,'2026-04-12',1100,'completed','East','Electronics'),
                       (1007,2,'2026-01-08',500,'shipped','North','Clothing'),
                       (1008,2,'2026-01-20',900,'delivered','North','Electronics'),
                       (1009,2,'2026-02-12',1200,'completed','North','Electronics'),
                       (1010,2,'2026-03-15',400,'completed','North','Clothing'),
                       (1011,2,'2026-04-20',750,'completed','North','Clothing'),
                       (1012,3,'2026-01-10',600,'completed','West','Clothing'),
                       (1013,3,'2026-02-16',1400,'completed','West','Electronics'),
                       (1014,3,'2026-03-21',300,'cancelled','West','Accessories'),
                       (1015,4,'2026-01-12',2000,'completed','East','Electronics'),
                       (1016,4,'2026-02-25',950,'delivered','East','Clothing'),
                       (1017,4,'2026-04-05',1700,'completed','East','Electronics'),
                       (1018,5,'2026-01-18',350,'completed','South','Clothing'),
                       (1019,5,'2026-02-28',800,'completed','South','Accessories'),
                       (1020,5,'2026-03-17',1300,'completed','South','Electronics'),
                       (1021,6,'2026-01-22',3000,'completed','North','Electronics'),
                       (1022,6,'2026-03-02',2500,'completed','North','Electronics'),
                       (1023,7,'2026-02-01',450,'completed','West','Clothing'),
                       (1024,7,'2026-03-05',900,'completed','West','Electronics'),
                       (1025,8,'2026-01-25',1100,'completed','East','Electronics'),
                       (1026,8,'2026-02-22',650,'completed','East','Clothing'),
                       (1027,9,'2026-03-10',250,'completed','West','Accessories'),
                       (1028,10,'2026-01-30',4000,'completed','North','Electronics'),
                       (1029,10,'2026-04-01',2500,'completed','North','Electronics'),
                       (1030,10,'2025-12-15',1800,'completed','North','Clothing');

CREATE TABLE order_items (
                             item_id INT PRIMARY KEY,
                             order_id INT NOT NULL,
                             product_id INT NOT NULL,
                             quantity INT NOT NULL,
                             price DECIMAL(10,2) NOT NULL
);

INSERT INTO order_items VALUES
                            (1,1001,1,1,1200),(2,1001,2,1,50),(3,1002,6,1,70),
                            (4,1002,12,2,90),(5,1003,3,1,80),(6,1004,4,2,300),
                            (7,1005,7,1,150),(8,1006,10,1,200),(9,1007,5,2,35),
                            (10,1008,1,1,1200),(11,1009,11,1,250),(12,1010,6,2,70),
                            (13,1011,12,1,90),(14,1012,7,1,150),(15,1013,1,1,1200),
                            (16,1014,14,2,25),(17,1015,1,1,1200),(18,1016,6,1,70),
                            (19,1017,4,1,300),(20,1018,5,1,35),(21,1019,9,2,60),
                            (22,1020,10,1,200),(23,1021,1,2,1200),(24,1022,4,2,300),
                            (25,1023,12,1,90),(26,1024,3,2,80),(27,1025,1,1,1200),
                            (28,1026,6,1,70),(29,1027,14,1,25),(30,1028,1,2,1200),
                            (31,1029,11,2,250),(32,1030,7,1,150);

CREATE TABLE students (
                          id INT PRIMARY KEY,
                          name VARCHAR(100),
                          class_id INT,
                          score INT
);

INSERT INTO students VALUES
                         (1,'Aarav',101,92),(2,'Diya',101,88),(3,'Kabir',101,76),
                         (4,'Ishita',102,95),(5,'Aditya',102,82),(6,'Ananya',102,78),
                         (7,'Riya',103,91),(8,'Dev',103,85),(9,'Simran',103,73),(10,'Manav',104,89);

CREATE TABLE sales (
                       sale_id INT PRIMARY KEY,
                       product_id INT,
                       region VARCHAR(50),
                       revenue DECIMAL(12,2),
                       month VARCHAR(20)
);

INSERT INTO sales VALUES
                      (1,1,'East',8000,'Jan'),(2,1,'East',9500,'Feb'),
                      (3,2,'West',4500,'Jan'),(4,2,'West',6000,'Feb'),
                      (5,3,'North',7000,'Jan'),(6,3,'North',8200,'Feb'),
                      (7,4,'South',3000,'Jan'),(8,4,'South',5200,'Feb'),
                      (9,5,'East',6500,'Jan'),(10,5,'East',7100,'Feb');

CREATE TABLE daily_traffic (
                               visit_date DATE PRIMARY KEY,
                               visits INT
);

INSERT INTO daily_traffic VALUES
                              ('2026-09-01',120),('2026-09-02',150),('2026-09-03',130),
                              ('2026-09-04',180),('2026-09-05',200),('2026-09-06',175),
                              ('2026-09-07',220),('2026-09-08',210),('2026-09-09',240),('2026-09-10',230);

CREATE TABLE monthly_sales (
                               month DATE PRIMARY KEY,
                               revenue DECIMAL(12,2)
);

INSERT INTO monthly_sales VALUES
                              ('2026-01-01',25000),('2026-02-01',28000),('2026-03-01',31000),
                              ('2026-04-01',29500),('2026-05-01',34000),('2026-06-01',37000);

CREATE TABLE logins (
                        login_id INT PRIMARY KEY,
                        user_id INT,
                        login_date DATE
);

INSERT INTO logins VALUES
                       (1,1,'2026-08-01'),(2,1,'2026-08-02'),(3,1,'2026-08-03'),(4,1,'2026-08-04'),(5,1,'2026-08-07'),
                       (6,2,'2026-08-01'),(7,2,'2026-08-03'),(8,2,'2026-08-04'),
                       (9,3,'2026-08-10'),(10,3,'2026-08-11'),(11,3,'2026-08-12'),(12,3,'2026-08-15');

CREATE TABLE activity (
                          activity_id INT PRIMARY KEY,
                          user_id INT,
                          activity_date DATE
);

INSERT INTO activity VALUES
                         (1,1,'2026-01-05'),(2,1,'2026-02-05'),(3,1,'2026-02-06'),(4,1,'2026-02-07'),
                         (5,2,'2026-01-10'),(6,2,'2026-02-10'),(7,3,'2026-01-15'),(8,3,'2026-02-15'),
                         (9,4,'2026-02-01'),(10,4,'2026-02-02'),(11,4,'2026-02-03'),
                         (12,5,'2026-03-01'),(13,5,'2026-03-15'),(14,6,'2026-03-20'),(15,6,'2026-04-20');

CREATE TABLE customer_revenue (
                                  customer_id INT PRIMARY KEY,
                                  revenue DECIMAL(12,2)
);

INSERT INTO customer_revenue VALUES
                                 (1,12500),(2,7800),(3,3200),(4,15600),(5,6400),(6,27500),
                                 (7,4500),(8,9800),(9,1200),(10,31000),(11,42000),(12,2500);

CREATE TABLE attendance (
                            attendance_id INT PRIMARY KEY,
                            user_id INT,
                            activity_date DATE
);

INSERT INTO attendance VALUES
                           (1,1,'2026-09-01'),(2,1,'2026-09-02'),(3,1,'2026-09-04'),(4,1,'2026-09-05'),
                           (5,2,'2026-09-01'),(6,2,'2026-09-03'),(7,2,'2026-09-05'),
                           (8,3,'2026-09-02'),(9,3,'2026-09-03'),(10,3,'2026-09-04');

CREATE TABLE experiment_events (
                                   event_id INT PRIMARY KEY,
                                   user_id INT,
                                   variant VARCHAR(20),
                                   clicked INT
);

INSERT INTO experiment_events VALUES
                                  (1,1,'A',1),(2,2,'A',0),(3,3,'A',1),(4,4,'A',0),(5,5,'A',1),
                                  (6,6,'B',1),(7,7,'B',1),(8,8,'B',0),(9,9,'B',1),(10,10,'B',0);

CREATE TABLE friends (
                         user_id INT,
                         friend_id INT,
                         PRIMARY KEY (user_id, friend_id)
);

INSERT INTO friends VALUES
                        (1,2),(1,3),(1,4),(1,5),
                        (2,1),(2,3),(2,4),(2,6),
                        (3,1),(3,2),(3,5),(3,7),
                        (4,1),(4,2),(4,6),(4,8),
                        (5,1),(5,3),(5,7),
                        (6,2),(6,4),(6,8),
                        (7,3),(7,5),(7,9),
                        (8,4),(8,6),(8,10);

CREATE TABLE table_a (
                         id INT PRIMARY KEY,
                         value VARCHAR(100)
);

CREATE TABLE table_b (
                         id INT PRIMARY KEY,
                         value VARCHAR(100)
);

INSERT INTO table_a VALUES (1,'A'),(2,'B'),(3,'C'),(4,'Only A');
INSERT INTO table_b VALUES (3,'C'),(4,'D'),(5,'Only B');

CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_orders_region ON orders(region);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);
CREATE INDEX idx_employees_department ON employees(department);
CREATE INDEX idx_employees_salary ON employees(salary);
CREATE INDEX idx_logins_user_date ON logins(user_id, login_date);
CREATE INDEX idx_activity_user_date ON activity(user_id, activity_date);
