create table	Emp1
(emp_id int primary key,
emp_name varchar(10),
emp_city varchar(10),
emp_sal float);
select *from EMP1

insert into EMP1
values(1,'pallu', 'pune', 350000),
(2,'kartik', 'nashik', 20000),
(3,'bhakti', 'pune', 20000),
(4,'neha', 'nashik', 40000),
(5,'bhavna', 'delhi', 70000),
(6,'mina', 'nashik', 30000);

-----------------------
 create table emp2
 ( empid int primary key,
 empname varchar(10),
 empdesig varchar(20),
 empsal float);


insert into emp2
values(2,'pranavi', 'manager', 500000),
(3,'karitika', 'assi manager', 30000),
(4,'bhakti', 'salesman', 20000),
(5,'neha', 'buisness analyst', 40000),
(6,'bhavna', 'data analyst', 70000),
(7,'mina', 'salesman', 30000),
(8,'rina','employee',2500);

select * from EMP1 

select * from emp2
---------view---------------------

--
--A simple view is created from a single table and does not include aggregate functions, joins, or groupings.
---syntax of views
/*CREATE VIEW ViewName AS  
SELECT column1, column2 FROM TableName WHERE condition;*/

---------simple view--------------
use priyal
select * from emp1

create view view_emp
as 
select emp_id, emp_name
from emp1

select * from emp1
select *from  view_emp
select * from vw_emp3
/* we cannot create more than one simple view*/
---------complex view----------------
--A complex view is created using multiple tables, joins, aggregate functions, or grouping operations.
create view view_employee
as
select e1.emp_id,e1.emp_name,e2.empid , e2.empname from emp1 e1
inner join emp2 e2
on e1.emp_id=e2.empid

drop view view_employee
select * from EMP1

select * from EMP2

go 
select * from view_employee
/* we can create more than one complex view*/
select* from emp7

---------------simple view--------------------
create view vw_em
AS
select emp_id, emp_name
from EMP1

SELECT * FROM vw_em

--------------complec view------

create view vw_employee
AS
SELECT e1.emp_id, e2.empid from EMP1 e1
INNER JOIN emp2 e2
on e1.emp_id = e2.empid


SELECT * FROM EMP1
SELECT * FROM emp2
select * from vw_employee



SELECT * FROM EMP1
SELECT * FROM emp2
