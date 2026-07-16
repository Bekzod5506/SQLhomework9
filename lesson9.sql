create database Sql_lesson9

use Sql_lesson9;

CREATE TABLE Employees
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);

INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');

	select * from Employees;

	
	--Task1

;With employee_depth as (
   Select
   EmployeeID,
	ManagerID,
	JobTitle,
	0 as depth
	from Employees
	where ManagerID is null
	union all
	Select 
	e.EmployeeID,
	e.ManagerID,
	e.JobTitle,
	d.depth+1
	from employees e
	join employee_depth d
	on e.managerid = d.employeeid)
	select * from employee_depth
	order by depth, employeeid;

	--Task2
	
	declare @n int = 10;

;with factorials as (
	select 
	1 as num,
	1 as factorial
	union all
	select 
	num+1,
	factorial *(num+1)
	from factorials
	where num < @n
	) 
	select factorial from factorials
	order by num; 

--Task3

WITH fib AS (
    SELECT 
        n = 1,
        fib_n = CAST(1 AS BIGINT),
        prev = CAST(0 AS BIGINT)
    UNION ALL
    SELECT 
        n + 1,
        fib_n + prev,
        fib_n
    FROM fib
    WHERE n < 10     -- N = 10
)
SELECT 
    n,
    fib_n AS Fibonacci_Number
FROM fib;

--Done
 