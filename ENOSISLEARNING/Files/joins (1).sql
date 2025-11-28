
JOINS: JOINS are used to combine rows from two or more tables.
1) inner join
2)outer join : left outer join 
3)right outer join 
4)full outer join 
5) cross join 
6)self join  
-----------------------

create table EMP22
(emp_id int primary key,
emp_name varchar(10),
emp_city varchar(10),
emp_sal float);
select *from EMP22
insert into EMP22
values(1,'pallu', 'pune', 350000),
(2,'kartik', 'nashik', 20000),
(3,'bhakti', 'pune', 20000),
(4,'neha', 'nashik', 40000),
(5,'bhavna', 'delhi', 70000),
(6,'mina', 'nashik', 30000);

-----------------------
 create table emp7
 ( empid int primary key,
 empname varchar(10),
 empdesig varchar(20),
 empsal float);
 select *from emp7

insert into emp7
values(2,'pranavi', 'manager', 500000),
(3,'karitika', 'assi manager', 30000),
(4,'bhakti', 'salesman', 20000),
(5,'neha', 'buisness analyst', 40000),
(6,'bhavna', 'data analyst', 70000),
(7,'mina', 'salesman', 30000),
(8,'rina','employee',2500);
 select * from emp7
 --------------------
 select *from EMP22----1ST TABLE
 select * from emp7---2ND TABLE

 /* syntax of inner join
 select * from table1(left) inner join table2(right)on table1.colname(p.k)=
 table2.colname(f.k)*/
 EMP22-----e1
 emp7----e2
 
---------inner join------------------
select* from EMP22 e1 inner join 
 emp7 e2 on e1.emp_id=e2.empid   
 ----------------------------------
 select * from EMP22
 select * from emp7
 ---------left outer join--------------
 select* from EMP22 e1 left outer join 
 emp7 e2 on e1.emp_id=e2.empid   
 ---------right outer join---------------
 select* from EMP22 e1 right outer join 
 emp7 e2 on e1.emp_id=e2.empid
 ------------full outer-------------------
 select* from EMP22 e1 full outer join 
 emp7 e2 on e1.emp_id=e2.empid
 ------------cross join-----
select* from EMP22 e1 cross join 
 emp7 e2 
 ----------self join----------
 select * from EMP22 emp_id join EMP22 on EMP22.emp_id = EMP22.emp_id
 ---------------------------
 SELECT * FROM emp7 empid join emp7 on emp7.empid = emp7.empid
 select *from EMP22 --e1
 select *from emp7 -- e2

