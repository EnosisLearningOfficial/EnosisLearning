use Enosis

select * from Std
-- ALTER TABLE

ALTER table Std             --ADD COLUMN
add  City Varchar(20)

ALTER table Std             --CHANGE DATATYPE OF EXISTING COLUMN
ALTER COLUMN ID VARCHAR(10);

ALTER TABLE Std              --DROP COLUMN
drop column City;

UPDATE Std
set ID = 'E001'
WHERE NAME = 'Neil';

--UPDATE
--Insert single value
UPDATE Std
SET City = 'Mumbai'
where ID = 1;

-- Insert multiple values 
UPDATE Std
SET City = 'Mumbai'
where ID in (3,4);

-- Insert values between the range
UPDATE Std
SET City = 'Pune'
where NAME = 'Jerry'

select * from Std

---------------------------------------------------------------------------------------------
USE priyal
select * from student

drop table student      -- It will delete the entire table from database

truncate table Std      --It will delete all the records from table but structure will remain in DB.

select * from Std

insert into Std values(1,'John',25),
(2,'Neil', 29);

delete from Std WHERE Age= 29;  --Deleting specific record

--AGGREGATE FUNCTIONS 
use priyal
SELECT * FROM EMP1

select sum(emp_sal) AS Sum_of_Salary
from EMP22

SELECT * FROM EMP22
select max(emp_sal) AS Maximum
from EMP22


select SQUARE(emp_sal) AS Minimum
from EMP1


select count(emp_id) AS Total_Count
from EMP22

--Numeric Functions
select log(4)

select power(2,3) as POWER  --3^2

SELECT PI()

SELECT SQRT(16)

SELECT ROWCOUNT_BIG() FROM EMP22

SELECT SQUARE(8)

--DATE-TIME

SELECT GETDATE()

SELECT DATEPART(MONTH, '10.01.2005') --MM.DD.YYYY

SELECT DATENAME(MONTH, '10.01.2005') --MM.DD.YYYY

SELECT DATENAME(WEEKDAY, '12.01.2005') --MM.DD.YYYY

SELECT DATEPART(YEAR, '12.01.2005') --MM.DD.YYYY

--DATE DIFFERENCE
SELECT DATEDIFF(YEAR, '01/16/2002',GETDATE());
SELECT DATEDIFF(MONTH, '01/16/2002',GETDATE());
SELECT DATEDIFF(WEEK, '01/16/2002',GETDATE());
SELECT DATEDIFF(DAY, '01/16/2002',GETDATE());

SELECT DAY('01/16/2003')
SELECT MONTH ('01/16/2003')
SELECT YEAR ('01/16/2003')

--ASCII & CHAR
SELECT ASCII('A') AS A
SELECT ASCII('a') AS a

SELECT CHAR (66)
select char(99)

--lower & upper
select * from emp1
select upper(emp_name) as Lower from Emp1
SELECT UPPER('hello world') as Upper


--TRIM(IT WILL REMOVE ALL THE EXTRA SPACES FROM THE GIVEN TEXT)
select LTRIM('    HELLO')

USE priyal
select * from EMP22

alter table EMP22
ADD Gender varchar(10)

update EMP22
SET Gender = 'Female'
where emp_id IN (3,4,5,6);

update EMP22
SET Gender = 'Male'
where emp_id IN (1,2);

select * from EMP22


--------------------------------CLAUSES--------------------------------------------------


/* WHERE CLAUSE*/
select Salary , Emp_Name
from emp 
where Salary>6000


/* ORDER BY USING ASC & DESC */
SELECT  * FROM emp 
ORDER BY Emp_Name ASC

SELECT Emp_Name, Salary, Emp_ID
FROM emp 
ORDER BY Salary DESC


/*  AS CLAUSE */
SELECT Emp_ID,city,Emp_Name as Full_Name 
from emp

select City+' '+Emp_Name as CITY_and_NAME    /* Example: FirstName+' '+LastName AS FULLNAME */
from emp


/* IN CLAUSE */
SELECT * FROM emp
where City IN ('Nashik','Mumbai')

update emp 
set Joining_Date = '01/12/2024'
where Emp_ID IN (102,103,104,105)

SELECT * FROM emp


/* DISTINCT */
SELECT DISTINCT City
FROM emp


/* TOP CLAUSE */

SELECT TOP 3 * 
FROM emp
order by Salary DESC

--Group by clause 
select * from EMP22

select Gender, sum(emp_sal) as Total_Salary from EMP22
Group by Gender;


select Gender, min(emp_sal) as Min_Salary from EMP22
Group by Gender;


select Gender, max(emp_sal) as Max_Salary from EMP22
Group by Gender;


select Gender, count(emp_id) as Total_Count from EMP22
Group by Gender;

--Having Clause
select Gender, sum(emp_sal) as Total_Salary from EMP22
Group by Gender
Having sum(emp_sal) > 20000;

select emp_name, Gender, sum(emp_sal) as Total_Salary from EMP22
Group by Gender, emp_name
Having sum(emp_sal) > 20000;

--OFFSET & FETCH

SELECT *  FROM EMP22
ORDER BY emp_sal DESC
OFFSET 2 ROWS FETCH NEXT 2 ROWS ONLY;









