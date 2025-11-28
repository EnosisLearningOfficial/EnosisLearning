use test
select * from EmpDetails
create table EmpDetails(
[EMPID] [int] ,
[EMPNAME] [varchar](100) ,
[SALARY] [float] ,
[DOJ] [datetime] ,
[DEPT] [varchar](100) ,
[DESG] [varchar](100) ,
[DEPTLOCATION] [varchar](100) 
)
DROP TABLE EmpDetails
INSERT EmpDetails VALUES (1, N'AKASH', 70000,  CAST(N'2017-05-20' AS DateTime), N'IT',
N'SOFTWARE DEVELOPER',  N'PUNE'),
(2, N'AKSHAY', 69000,  CAST(N'2017-07-14' AS DateTime), N'IT', N'ARCHITECT',  N'PUNE'),
(3, N'ASHWIN', 77000,  CAST(N'2017-09-14' AS DateTime), N'IT',N'ARCHITECT', N'PUNE'),
(4, N'CHINMAY', 88000,  CAST(N'2017-09-10' AS DateTime), N'HR',N'MANAGER', N'MUMBAI'),
(5, N'DEBAYAN', 65000,CAST(N'2017-10-18' AS DateTime), N'HR',N'EXECUTIVE', N'MUMBAI'),
(6, N'MANGESH', 99000,  CAST(N'2017-10-10T00:00:00.000' AS DateTime), N'HR', N'MANAGER',  N'MUMBAI')

select * from EmpDetails

select * from EmpDetails where DEPTLOCATION IN ('PUNE')


-- LIKE CLAUSE

SELECT * FROM EmpDetailS WHERE  EMPNAME  LIKE 'A%'  -- STARTING WITH

SELECT * FROM EmpDetailS WHERE  EMPNAME  LIKE '%Y'  --ENDING WITH

SELECT * FROM EmpDetailS WHERE EMPNAME LIKE 'A____'  

SELECT * FROM EmpDetailS WHERE EMPNAME LIKE '__S___'

SELECT * FROM EmpDetailS WHERE EMPNAME LIKE '__S__Y'

SELECT * FROM EmpDetailS WHERE  EMPNAME  LIKE '%[^a]'   -- NOT ENDING WITH

SELECT * FROM EmpDetailS WHERE  EMPNAME  LIKE '[^A]%'     --NOT STARTING WITH 

select * from EmpDetailS where DESG != 'ARCHITECT'     -- NOT EQUAL TO (!=)

SELECT * FROM EmpDetails 
where Salary BETWEEN 60000 and 90000    -- BETWEEN 100 AND 200 (RANGE)


select * from EmpDetailS     -- IN OPEARTOR
WHERE DEPT IN ('IT','HR')

SELECT * FROM EmpDetailS     --ORDER BY 
ORDER BY SALARY DESC

SELECT DISTINCT(DESG)     --DISTINCT VALUES
FROM EmpDetailS

select max(Salary) as Max_Value from EmpDetailS     -- ALIS FUNCTION OR KEYWORD (AS)

select * from EmpDetailS

select top 2* from EmpDetailS  --FINDING TOP VALUES (TOP 2*)
order by Salary DESC

select * from EmpDetailS

SELECT DEPT,SUM(SALARY) AS SUM_OF_SAL FROM EmpDetailS    -- GRUOP BY CLAUSE
GROUP BY  DEPT;

select * from EmpDetailS

SELECT EMPNAME,SALARY AS TOTALSALARY FROM EmpDetailS     -- HAVING CLAUSE 
GROUP BY EMPNAME, SALARY
HAVING SUM(SALARY)>70000


SELECT EMPNAME,COUNT(*) AS TOTALSALARY FROM EmpDetailS     -- HAVING CLAUSE 
                                                          --(HERE THE COUNT WILL COUNT THE DUPLICATE VALUES)
GROUP BY EMPNAME, SALARY
HAVING SUM(SALARY)>70000

SELECT * FROM EmpDetailS

SELECT EMPNAME, SALARY FROM EmpDetailS 
ORDER BY SALARY DESC

SELECT EMPNAME, SALARY FROM EmpDetailS      --OFFSET AND FETCH VALUES
ORDER BY SALARY DESC

SELECT EMPNAME, SALARY FROM EmpDetailS      --OFFSET AND FETCH VALUES
ORDER BY SALARY DESC
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY

--##################### Constraint ##########################################3

create table emp(Emp_ID INT CONSTRAINT pk_empid Primary Key,
Emp_Name varchar(50) CONSTRAINT u_emp Unique,
Salary float CONSTRAINT C_salary check (salary>5000.00),
City varchar(20) CONSTRAINT d_city default('Pune'),
Mobile_Number varchar(10) CONSTRAINT nn_mobile NOT NULL)

drop table emp
SELECT * FROM emp

INSERT INTO emp values(101,'Priyal Dhawale',10000.89,'Mumbai','9657141406')
INSERT INTO emp values(102,'Shruti Joshi',15000.00,'aurangabad','9876543239')
INSERT INTO emp values(103,'Sakshi Waghmare',5000.90,'Nashik','9011846505')
INSERT INTO emp values(104,'Anurag Nair',9500.23,'Pune', '7796792339')
INSERT INTO emp values(105,'Ayush Kumar',13000.30,' Nagpur','9028990766')

