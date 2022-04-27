

-- Create and drop index
create index index1 on Customer(Age);
drop index index1 on Customer;

-- explain to demonstrate when using index to find C_ID faster than without using( see rows )
explain select C_ID from Customer where Age > 30;  

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
show grants;
