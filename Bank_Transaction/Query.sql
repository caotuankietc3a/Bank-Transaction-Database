use bank_transaction;

-- Find information (T_No, T_Date, Money, AccNum, TrType) about the 3 most recent online transaction
select 
	C.CName as 'Customer Name',
	OT.T_Date as 'Day', 
    OT.T_No as 'Transaction Number', 
    OT.Money as 'Amount', 
    OT.AccNum as 'Account Number', 
    OT.TrType as 'Type'
from OnlAccTransaction as OT, Customer as C 
where C.C_ID = '100000' and OT.AccNum = (select AccNum from BankAccount where C_ID = '100000')
order by T_Date desc limit 10;

-- Find date, deposit and withdraw when customer charges into or withdraws money from their cards
select 
	C.CName as 'Customer Name',
	OT.T_No, OT.T_Date, 
case when OT.TrType = 'CT' then Money end as Deposit,
case when OT.TrType = 'NT' then Money end as Transfer
from OnlAccTransaction as OT, Customer as C, BankAccount as AC
where OT.AccNum = AC.AccNum and C.C_ID = AC.C_ID
order by C.CName desc;

-- Find name of bank staffs who are reponsible for accounts having created date <= 2011-08-01
select BS.SName
from BankStaff as BS, OffAccTransaction as O, BankAccount As BA
where O.S_ID = BS.S_ID and O.AccNum = BA.AccNum and BA.CreateDate <= '2011-08-01';