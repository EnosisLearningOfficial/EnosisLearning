use DB
create table Bank_Ac (
Account_No int Primary key identity(1,1),
Account_Name Varchar(50),
Balance float
)

INSERT INTO Bank_Ac values('Priyal Dhawale', 20045.00),
('Pranav Pawar', 40000),
('Praj Jadhav', 35000.87),
('Sakshi Shinde', 23000.90),
('Kunal Kadu', 87070.00)

select * from Bank_Ac

create table Acc_History(
Account_No int ,
Transaction_Type varchar(10),
Amount float, 
Last_Balance float,
Transaction_DateTime datetime
)

create trigger Bank_Trigger 
on Bank_Acc
INSTEAD OF Insert
AS
declare @acc_no int, @tran_type varchar(10), @amount float, @last_bal float;
select @tran_type=i.Account_No from inserted i;
select @amount=i.Amount from inserted i;
select @last_bal=i.Last_Balance from inserted i;
select @acc_no=i.Account_No from inserted i;
select @acc_no=i.Account_No from inserted i;

