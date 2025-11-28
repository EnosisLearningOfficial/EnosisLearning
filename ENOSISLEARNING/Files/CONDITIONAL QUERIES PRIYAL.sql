-- ###### IF - ELSE STATEMENT #########


-- comapring 3 varibles to find the greater one 
DECLARE @A INT , @B INT, @C INT 
SET @A=50
SET @B=10
SET @C=60
IF @A>@B AND @A>@C
PRINT '@A IS GREATER'
IF @B>@A AND @B>@C
PRINT '@B IS GREATER'
ELSE 
PRINT '@C IS GREATER'

-- comparing two variables to find the shorter one 
DECLARE @A INT , @B INT 
SET @A=100
SET @B=10
IF @A<@B 
PRINT '@A IS SMALLER'
ELSE 
PRINT '@B IS SMALLER'

-- To Find Even and Odd Numbers
DECLARE @Number int
SET @Number = 5
IF (@Number%2=0)
PRINT 'Number is EVEN'
ELSE 
PRINT 'Number is ODD'


-- Find the Vowels and Consonent

DECLARE @Char char
SET @Char = 'i'
IF @Char='a'or @Char='e'or @Char='i'or @Char='o'or @Char='u'
PRINT 'Number is VOWELS'
ELSE 
PRINT 'Number is CONSONENT'

--------Signal Program---------

declare @signal varchar(10)
set @signal = 'red'

if @signal = 'red'
print 'STOP'

else if @signal = 'orange'
print 'READY'

else if @signal = 'green'
print 'GO'

else 
print 'There is no signal'



-- ########### CASE STATEMENT #########

DECLARE @grade VARCHAR, @total INT 
set  @total=70
Set @grade=
CASE 

when @total > 80 then 'Excellent'
when @total between 60 and 80 then 'Good'


-- ##############  SET Concept ###############

-- Union
select  emp_id, emp_name from  EMP22
UNION
select empid, empname from emp7

-- UNION ALL
select  emp_id, emp_name from  EMP22
UNION ALL
select empid, empname from emp7

-- EXCEPT
select  emp_id, emp_name from  EMP22
EXCEPT
select empid, empname from emp7

-- INTERSECTION
select  emp_id, emp_name from  EMP22
INTERSECT
select empid, empname from emp7


create table emp(
emp_id int , emp_name varchar(50), 
)










