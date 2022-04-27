drop database bank_transaction;
create database if not exists bank_transaction;
use bank_transaction;

create table Customer 
	(C_ID			int					not null,
    CName			varchar(45) 		not null,
    Age 			int							,
    Email			varchar(45)					,
    Phone 			char(10)			not null,
    Address			varchar(100) 		not null,
	primary key (C_ID));

create table BankStaff
	(S_ID			varchar(7)			not null,
    SName			varchar(45) 		not null,
    Age 			int,
    Email			varchar(45),
    Phone 			char(10)			not null,
    Address			varchar(100) 		not null,
    StartDate		date,
    WLoc			varchar(100) 		not null,
	primary key (S_ID));

create table BankAccount
	(AccNum			char(12)			not null,
    CreateDate 		date				not null,
    InterestRate	int,
    Balance			int					not null,
    AccType 		varchar(1)			not null,
    C_ID			int					not null,
	primary key (AccNum),
    foreign key (C_ID) references Customer(C_ID)
				on delete cascade on update cascade);

create table BankCard
	(CardNum		char(12)			not null,
	StartDate 		date				not null,
    ExpDate 		date	 			not null,
    AccNum			char(12)			not null,
    C_ID			int					not null,
	primary key (CardNum),
    foreign key (C_ID) references Customer(C_ID)
				on delete cascade on update cascade,
    foreign key (AccNum) references BankAccount(AccNum)
				on delete cascade on update cascade);

create table CreditCard
	(CardNum		char(12)			not null,
	WithdrawnAmount int 				default 0,
    SecCode 		char(3) 			not null,
    InterestRate 	int 				not null,
	primary key (CardNum),
    foreign key (CardNum) references BankCard(CardNum)
				on delete cascade on update cascade);

create table DebitCard
	(CardNum		char(12)			not null,
    PINCode			char(4)			    not null,
	Balance 		int 				not null,
	primary key (CardNum),
    foreign key (CardNum) references BankCard(CardNum)
				on delete cascade on update cascade);
                
create table CardTransaction
	(T_No				int				not null,
	Money 				int 			not null,
    Dest				char(12),
    T_Date 				datetime 		not null,
    PaymentMachine		varchar(45)		not null,
    CardNum				char(12)		not null,
    TrType				varchar(2)		not null,
	primary key (CardNum,T_No),
    foreign key (CardNum) references BankCard(CardNum)
				on delete cascade on update cascade);

create table OnlAccTransaction
	(T_No				int				not null,
	Money 				int 			not null,
    Dest				char(12),
    T_Date 				datetime 		not null,
    App					varchar(45)		not null,
    AccNum				char(12)		not null,
    TrType				varchar(2)		not null,
	primary key (AccNum,T_No),
    foreign key (AccNum) references BankAccount(AccNum)
				on delete cascade on update cascade);

create table OffAccTransaction
	(T_No				int				not null,
	Money 				int 			not null,
    Dest				char(12),
    T_Date 				datetime 		not null,
    T_Loc				varchar(45)		not null,
    AccNum				char(12)		not null,
    S_ID				varchar(7)		not null,
    TrType				varchar(2)		not null,
	primary key (AccNum,T_No),
    foreign key (AccNum) references BankAccount(AccNum)
				on delete cascade on update cascade,
	foreign key (S_ID) references BankStaff(S_ID)
				on delete cascade on update cascade);


insert into Customer values (100000, 'Keigh', 23, 'Keigh@gmail.com', '0923451131', '731 Fondren, Houston,TX');
insert into Customer values (100001, 'David', 25, 'David@gmail.com', '0922454331', '638 Voss, Houston,TX');
insert into Customer values (100002, 'Michael', 30, 'Michael@gmail.com', '0928743331', '975 Fire Oak, Humble,TX');
insert into Customer values (100003, 'Kiet', 20, 'kiet.cao@hcmut.edu.com', '0928373738', '90 Ly Thuong Kiet, District 10, Ho Chi Minh');
insert into Customer values (100004, 'Hieu', 25, 'Hieuhieu@outlook.com', '0909344355', '120 Ly Thuong Kiet, District 10, Ho Chi Minh');
select * from Customer;


insert into BankStaff values ('200000', 'Wallace', 43, 'Wallace@gmail.com', '0987453621', '5631 Rice, Houston, TX', '1978-07-19', 'John Daly Law, LLC');
insert into BankStaff values ('200001', 'Jennifer', 26, 'Jennifer@gmail.com', '0988573621', '3321Castle, Spring, TX', '1995-08-19', 'Scranton Whitepages');
insert into BankStaff values ('200002', 'Zelaya', 27, 'Zelaya@gmail.com', '0964733621', '56 Rice, Spring, CS', '1994-09-21', 'Scranton Whitepages');
select * from BankStaff;

insert into BankAccount values ('001221051555', '2006-05-21', null, 2900000, 'C', 100000), 
('000820005493', '2012-05-26', null, 2600000, 'C', 100001), 
('001211226765', '2011-04-26', null, 4400000, 'C', 100002),
('001211226777', '2012-04-22', 6, 0, 'S', 100002),
('001211226606', '2012-05-20', null, 0, 'C', 100003),
('004411221212', '2015-06-20', null, 10600000, 'C', 100004);
select * from BankAccount;

insert into BankCard values('037828224631', '2006-06-21', '2040-05-24', '001221051555', 100000), 
('037144963539', '2012-06-26', '2045-05-26','000820005493', 100001), 
('037873449367', '2011-05-26', '2039-02-26','001211226765', 100002),
('037873449999', '2011-06-26', '2039-03-26','001211226765', 100002),
('044883449999', '2015-07-20', '2039-03-26','004411221212', 100004);
select * from BankCard;

insert into CreditCard values ('037873449999', 500000, '134', 4);
select * from CreditCard;

insert into DebitCard values('037828224631', '5051', 2900000), 
('037144963539', '1590', 2600000), 
('037873449367', '1357', 4400000),
('044883449999', '1520', 10600000);     
select * from DebitCard;

insert into CardTransaction values(1, 100000, '044883449999', '2002-04-12', 'ATM', '037828224631', 'CT'), 
(1, 200000, '044883449999', '2003-02-12', 'ATM', '037144963539', 'CT'), 
(1, 300000, '044883449999', '2004-04-12', 'ATM', '037873449367', 'CT'),
(1, 200000, null, '2004-04-12', 'ATM', '037873449999', 'RT'),
(2, 300000, null, '2004-04-12', 'ATM', '037873449999', 'RT');
select * from CardTransaction;

insert into OnlAccTransaction values (1, 5000000, null, '2002-04-12', 'Viettin', '001221051555', 'NT'), 
(2, 1000000, '004411221212', '2002-04-12', 'Viettin', '001221051555', 'CT'), 
(1, 5000000, null, '2002-04-12', 'OCB', '000820005493', 'NT'), 
(2, 200000, '004411221212', '2003-02-12', 'OCB', '000820005493', 'CT'), 
(1, 10000000, null, '2002-04-12', 'OCB', '001211226765', 'NT'), 
(2, 3000000, '004411221212', '2004-04-12', 'OCB', '001211226765', 'CT'),
(1, 1000000, null, '2004-03-12', 'OCB', '004411221212', 'NT');
select * from OnlAccTransaction;

insert into OffAccTransaction values(1, 10000000, '004411221212', '2002-04-12', 'Scranton Whitepages', '001221051555', '200000', 'CT'), 
(1, 2000000, '004411221212', '2003-02-12', 'Scranton Whitepages', '000820005493', '200001', 'CT'), 
(1, 3000000, '004411221212', '2004-04-12', 'Scranton Whitepages', '001211226765', '200002', 'CT');
select * from OffAccTransaction;


-- Trigger for Customer to detect age < 0 and invalid email
create table message (
	messageID 		int 		not null,
    message			varchar(100),
    primary key (messageID));


drop trigger if exists check_age_email;

delimiter //
create trigger check_age_email before insert on Customer
for each row 
begin 
if new.Age < 0 then insert into message (messageID, message)
values (new.C_ID, concat('Please update Age of ', new.CName,'\'s customer'));
end if;
if new.Email not regexp '^[A-Z0-9][A-Z0-9.]*@[A-Z0-9][A-Z0-9.]*\.[A-Z]{2,4}$' then insert into message (messageID, message)
	values (new.C_ID, concat('Please update Email of ', new.CName,'\'s customer'));
    end if;
end //
delimiter ;

-- Test
insert into Customer values (100004, 'Keigh', -1, 'keigh@gmail.com', '0923451131', '731 Fondren, Houston,TX');
select * from message;
drop trigger if exists check_age_email;



drop procedure if exists validate_staff;

delimiter //
create procedure validate_staff(
	in age int,
	in email varchar(45)
)
begin
	if age <= 18 then signal sqlstate '45000' set message_text = 'Age must be greater than 18';
	end if;
	if not (select email regexp '^[A-Z0-9][A-Z0-9.]*@[A-Z0-9][A-Z0-9.]*\.[A-Z]{2,4}$') then
		signal sqlstate '45000' set message_text = 'Wrong email';
	end if;
end//
delimiter ;

drop trigger if exists validate_staff_insert;

delimiter //
create trigger validate_staff_insert
before insert on BankStaff for each row
begin
    call validate_staff(new.Age, new.Email);
end//
delimiter ;
	
insert into BankStaff values ('200021', 'Mile', 1, 'Mile@gmail.com', '0987123621', '12 Rice, Houston, TX', '1977-07-15', 'John Daly Law, LLC');
insert into BankStaff values ('200021', 'Mile', 19, 'Mile@hcmut.edu.vn', '0987123621', '12 Rice, Houston, TX', '1977-07-15', 'John Daly Law, LLC');
select * from BankStaff;

-- Create and drop index
create index index1 on Customer(Age);
drop index index1 on Customer;

-- explain to demonstrate when using index to find C_ID faster than without using( see rows )
explain select C_ID from Customer where Age > 30;  



-- Find information (T_No, T_Date, Money, AccNum, TrType) about the 3 most recent online transaction
select 
	T_Date as 'Day', 
    T_No as 'Transaction Number', 
    Money as 'Amount', 
    AccNum as 'Account Number', 
    TrType as 'Type'
from OnlAccTransaction
order by T_Date desc limit 3;

-- Find date, deposit and withdraw when customer charges into or withdraws money from their cards

select T_No, T_Date, 
case when CardTransaction.Money > 0 then Money end as Charge,
case when CardTransaction.Money < 0 then abs(Money) end as Withdraw
from CardTransaction
order by T_Date desc;

-- Find name of bank staffs who are reponsible for accounts having created date <= 2011-08-01
select BS.SName
from BankStaff as BS, OffAccTransaction as O, BankAccount As BA
where O.S_ID = BS.S_ID and O.AccNum = BA.AccNum and BA.CreateDate <= '2011-08-01';

-- Code for security database
use bank_transaction;

-- Create user A1, A2, A3
create user 'A1'@'localhost','A2'@'localhost','A3'@'localhost';
grant select, delete on Customer to 'A1'@'localhost';
grant select, delete on BankStaff to 'A1'@'localhost';

-- grant select privilege to A2 with grant option privilege
grant select on Customer to 'A2'@'localhost' with grant option;
grant select on BankStaff to 'A2'@'localhost' with grant option;

-- revoke select privilege from A2
revoke select on Customer from 'A2'@'localhost';

use bank_transaction;
grant select on Customer to 'A3'@'localhost';
grant select on BankStaff to 'A3'@'localhost';
show grants;https://jitpack.io/p/fitraditya/rtmp-rtsp-stream-client-java
