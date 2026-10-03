--1. Find all employees earning more than $70,000.
SELECT * FROM EMPLOYEES WHERE SALARY > 70000;

--2. Find the most 5 recent orders
SELECT * FROM ORDERS ORDER BY ORDER_DATE DESC LIMIT 5;

--3. Find all customers whose email is a Gmail address.
SELECT * FROM CUSTOMERS WHERE EMAIL LIKE  '%gmail.com';

--4 Find all orders with status either 'shipped' or 'delivered'.
SELECT * FROM ORDERS WHERE STATUS IN ('shipped' ,'delivered');

--5. Find customers with a missing phone number.
SELECT * FROM CUSTOMERS WHERE PHONE IS NULL;

--6. Find all distinct product categories.
SELECT DISTINCT CATEGORY FROM PRODUCTS;

-- 7. Find orders placed in the last 30 days.
SELECT * FROM orders WHERE order_date >= CURRENT_DATE-30;
