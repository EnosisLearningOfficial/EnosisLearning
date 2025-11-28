/* Use Of Different Constraint */

use test

select * from example

alter table example
add constraint uk_FullName Unique (FullName)


insert into example values('Khushi','Male',22)

alter table example
add Join_Date date

alter table example
add constraint d_JoinDate default('10/10/2020')



/*########### Aggregate Functions ############*/
use priyal
select * from emp


SELECT AVG(Salary) as Averag_Salary        /* Average() Function */
from emp

SELECT MAX(Salary) as Max_Salary,          /* MIN() & MAX() Functions */
MIN(Salary) as Min_Salary
FROM emp


SELECT SUM(Salary) as SumOFSalary          /* SUM() Function */
from emp


SELECT COUNT(Emp_ID) AS TotalCountOfEmployees           /* Count() Function */
from emp



/* ############### Numeric Functions ############*/
use priyal

select * from Employee


select name,Salary, Log(Salary) AS LOG_ValuesOfSalary
from Employee

select log(5) as LOG_Value            /*LOG */

Select POWER(4,3) AS POWER_Value     /* 2^4 */

Select DEGREES(0.75) AS Degree           /* DEGREE */
SELECT DEGREES(PI()/2) AS Degree

select PI() AS PI_VALUE    /* PI()= 3.14 OR 22/7  */

select SQUARE(8) AS SQUARE   /* Square= 64 */

SELECT SQRT(64)    AS  SQUARE_ROOT      /* Square_Root == 8 */ 


/* ROUND(n,p,[t]) Function */

SELECT ROUND(240.89,2)           /* Make the changes on RIGHT side of DECIMAL POINT */
SELECT ROUND(346.870,-1)         /* Make the changes on LEFT side of DECIMAL POINT */
SELECT ROUND (876.450,-1,1)      /* HERE the '[t]' will be  truncated  */


/* ############# DATE FUNCTION ###########*/

SELECT GETDATE() AS DATE_and_TIME

SELECT DATENAME(WEEKDAY,'12.16.2001')  /* (MM.DD.YYYY) */
SELECT DATENAME(month,'12.16.2001')
SELECT DATEPART(month,'12.16.2001')
SELECT DATEPART(MONTH, '01.16.2002') AS MONTH_COUNT   /* 1=JANUARY */
SELECT DATEPART(WEEKDAY, '01.16.2002') AS WEEK_COUT   /* 4 = WEDNESDAY */
SELECT DATENAME (WEEKDAY, '11.24.2005')

/* ASCII VALUES */
SELECT ASCII ('E')
SELECT ASCII('a')
Select Ascii('Z')
SELECT ASCII (65)

SELECT CHAR(66) 
SELECT CHAR(97)  /* CHAR() */


SELECT LEN('RAVI  SINGH')  /* LEN() FUNCTION = IT WILL COUNT EACH CHARACTER AS WELL AS SPACES */


ALTER TABLE emp
add Joining_Date DATE

select * from emp

UPDATE emp
SET Joining_Date = '01/01/2022' 
where Emp_ID = 101



