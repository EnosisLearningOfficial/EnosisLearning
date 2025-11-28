create table dept(
  deptno int,
  dname  nvarchar(14),
  loc    nvarchar(13),
  constraint pk_dept primary key (deptno)
)

insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');


create table emp
(
  empno    int,
  ename    nvarchar(10),
  job         nvarchar(9),
  mgr       int,
  hiredate date,
  sal      float,
  comm     int,
  deptno   int,
  constraint pk_emp primary key (empno),
  constraint fk_deptno foreign key (deptno) references dept (deptno)
)


insert into emp values(7839, 'KING', 'PRESIDENT', null, '11-17-1981', 5000, null, 10);
insert into emp values(7698, 'BLAKE', 'MANAGER', 7839, '5-1-1981', 2850, null, 30);
insert into emp values(7782, 'CLARK', 'MANAGER', 7839, '6-9-1981', 2450, null, 10);
insert into emp values(7566, 'JONES', 'MANAGER', 7839, '4-2-1981', 2975, null, 20);
insert into emp values(7788, 'SCOTT', 'ANALYST', 7566, '7-13-1987' , 3000, null, 20);
insert into emp values(7902, 'FORD', 'ANALYST', 7566, '12-3-1981', 3000, null, 20);
insert into emp values(7369, 'SMITH', 'CLERK', 7902, '12-17-1980', 800, null, 20);
insert into emp values(7499, 'ALLEN', 'SALESMAN', 7698, '2-20-1981', 1600, 300, 30);
insert into emp values(7521, 'WARD', 'SALESMAN', 7698, '2-22-1981', 1250, 500, 30);
insert into emp values(7654, 'MARTIN', 'SALESMAN', 7698, '9-28-1981',1250, 1400, 30);
insert into emp values(7844, 'TURNER', 'SALESMAN', 7698, '9-8-1981', 1500, 0, 30);
insert into emp values(7876, 'ADAMS', 'CLERK', 7788, '7-13-1987', 1100, null, 20);
insert into emp values(7900, 'JAMES', 'CLERK', 7698,'12-3-1981', 950, null, 30);
insert into emp values( 7934, 'MILLER', 'CLERK', 7782, '1-23-1982', 1300, null, 10);
