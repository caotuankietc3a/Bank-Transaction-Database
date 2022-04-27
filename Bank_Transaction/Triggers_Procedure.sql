use bank_transaction;

drop trigger if exists check_balance_CT;

delimiter //
create trigger check_balance_CT before insert on OnlAccTransaction
for each row 
begin 
if new.TrType = 'CT' and new.Money > (select Balance from BankAccount where AccNum = new.AccNum) 
then signal sqlstate '45000' set message_text = 'Not enough Money';
	end if;
end //
delimiter ;

-- insert into OnlAccTransaction values (3, 50000000, null, '2002-04-12', 'Viettin', '001221051555', 'CT');
-- select * from OnlAccTransaction

delimiter //
create trigger Onl_Transaction_After after insert on OnlAccTransaction
for each row 
begin 
if new.TrType = 'CT' then
-- Minus the balance of sender
	update BankAccount as A
	set A.balance = A.balance - new.Money 
    where A.AccNum = new.AccNum;
-- Add the balance of receiver  
    update BankAccount as A
	set A.balance = A.balance + new.Money 
    where A.AccNum = new.Dest;
-- Make Debit Card consistent
    update DebitCard as DC, BankCard as BC
	set DC.balance = DC.balance - new.Money 
    where BC.AccNum = new.AccNum and DC.CardNum = BC.CardNum;
    update DebitCard as DC, BankCard as BC
	set DC.balance = DC.balance + new.Money 
    where BC.AccNum = new.Dest and DC.CardNum = BC.CardNum;
end if;
if new.TrType = 'NT' then
-- Add the balance of sender
	update BankAccount as A
	set A.balance = A.balance + new.Money 
    where A.AccNum = new.AccNum;

-- Make Debit Card consistent
    update DebitCard as DC, BankCard as BC
	set DC.balance = DC.balance + new.Money 
    where BC.AccNum = new.AccNum and DC.CardNum = BC.CardNum;

end if;
end //
delimiter ;

insert into OnlAccTransaction values (3, 50000, '004411221212', '2002-04-12', 'Viettin', '001221051555', 'CT');
insert into OnlAccTransaction values (3, 500000, null, '2002-04-12', 'Viettin', '000820005493', 'NT');
select * from OnlAccTransaction;
select * from BankAccount;
select * from DebitCard;

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
insert into Customer values (100010, 'Keigh', -1, 'keigh@gmail.com', '0923451131', '731 Fondren, Houston,TX');
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