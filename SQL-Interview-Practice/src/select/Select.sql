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

--8 Find products priced between $50 and $200.

SELECT * FROM PRODUCTS WHERE PRICE BETWEEN 50 AND 200;

--9 Sort employees by department, then by salary descending within each department.
SELECT * FROM EMPLOYEES ORDER BY DEPARTMENT ASC, SALARY DESC;

--10. Rename name column to full name 
SELECT NAME AS "FULL NAME" FROM EMPLOYEES;

--11 Find the 3 highest-priced products.
SELECT * FROM PRODUCTS ORDER BY PRICE DESC LIMIT 3;

--12 Find employees whose name starts with "A"
SELECT * FROM EMPLOYEES WHERE NAME LIKE 'A%';

--13 Second-Highest Salary
SELECT NAME, SALARY, SALARY_RANK  FROM (SELECT NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS SALARY_RANK FROM EMPLOYEES) E WHERE SALARY_RANK =2 ;

--14 Top 3 earners in each department

SELECT * FROM(SELECT NAME, SALARY,DEPARTMENT, DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RNK FROM EMPLOYEES) E WHERE RNK <=3 order by department, rnk