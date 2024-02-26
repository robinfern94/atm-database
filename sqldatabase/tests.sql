-- Script name:   tests.sql
-- Author:        Robin Fernando
-- Purpose:       Tests the integrity of this database system

-- the database used to insert the data into.
Use ATMmanagementDB;
SET SQL_SAFE_UPDATES = 0;
-- 1. Testing Registered User table
-- DELETE FROM RegisteredUser WHERE full_name = 'Bobby Bert';
-- UPDATE RegisteredUser SET user_id = 4 WHERE full_name = 'Gary Walter'; 

-- Error 1: DELETE FROM RegisteredUser WHERE full_name = 'Bobby Bert'	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`transaction`, CONSTRAINT `TRANSACTION_SESS_FK_PK` FOREIGN KEY (`sessions`) REFERENCES `session` (`session_id`))	0.000 sec
-- Error 2: UPDATE RegisteredUser SET user_id = 4 WHERE full_name = 'Gary Walter'	Error Code: 1062. Duplicate entry '4' for key 'registereduser.PRIMARY'	0.000 sec


-- 2. Testing Language table
DELETE FROM Language WHERE description = 'Spanish';
UPDATE Language SET description = 'Italian' WHERE language_id = 3;

-- 3. Testing Account table 
DELETE FROM Account WHERE reg_user = 1;
UPDATE Account SET languages = 3 WHERE account_id = 102;

-- 4. Testing Checking table
DELETE FROM Checking WHERE checking_balance < 200;
UPDATE Checking SET checking_acc_id = 4 WHERE account_id = 3;

-- 5. Testing Savings table 
DELETE FROM Savings WHERE savings_acc_id = 1;
UPDATE Savings SET savings_balance = 9999 WHERE account_id = 103;

-- 6. Testing Handprint Scanner table
-- DELETE FROM HandprintScanner WHERE scanner_id = 52;
UPDATE HandprintScanner SET status = 'Not Connected' WHERE scanner_id = 51;

-- ERROR 3: DELETE FROM HandprintScanner WHERE scanner_id = 52	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`transaction`, CONSTRAINT `TRANSACTION_SESS_FK_PK` FOREIGN KEY (`sessions`) REFERENCES `session` (`session_id`))	0.000 sec

-- 7. Testing Keypad table
-- DELETE FROM Keypad WHERE keypad_id = 51;
UPDATE Keypad SET status = 'Not Connected' WHERE keypad_id = 52;

-- ERROR 4: DELETE FROM Keypad WHERE keypad_id = 51	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`transaction`, CONSTRAINT `TRANSACTION_SESS_FK_PK` FOREIGN KEY (`sessions`) REFERENCES `session` (`session_id`))	0.016 sec


-- 8. Testing Debit Card table 
-- DELETE FROM DebitCard WHERE card_exp = '2022-01-01 00:00:01';
UPDATE DebitCard SET cvv = 123 WHERE debit_card_id = 25;

-- ERROR 5: DELETE FROM DebitCard WHERE card_exp = '2022-01-01 00:00:01'	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`transaction`, CONSTRAINT `TRANSACTION_SESS_FK_PK` FOREIGN KEY (`sessions`) REFERENCES `session` (`session_id`))	0.000 sec


-- 9. Testing Region table
-- DELETE FROM Region WHERE region_id = 1;
UPDATE Region SET description = 'Oakland' WHERE region_id = 2;

-- ERROR 6: DELETE FROM Region WHERE region_id = 1	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`atm`, CONSTRAINT `region_idx` FOREIGN KEY (`region`) REFERENCES `region` (`region_id`) ON UPDATE CASCADE)	0.000 sec


-- 10. Testing Network table 
-- DELETE FROM Network WHERE status = 'no';
UPDATE Network SET connection_name = 'atmcon4' WHERE network_id = 1;

-- ERROR 7: DELETE FROM Network WHERE status = 'no'	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`transaction`, CONSTRAINT `TRANSACTION_SESS_FK_PK` FOREIGN KEY (`sessions`) REFERENCES `session` (`session_id`))	0.000 sec


-- 11. Testing Police Station table
-- DELETE FROM PoliceStation WHERE pol_email = 'feds@gmail.com';
UPDATE PoliceStation SET pol_email = 'fedfed123@gmail.com' WHERE pol_station_id = 1;

-- ERROR 8: DELETE FROM PoliceStation WHERE pol_email = 'feds@gmail.com'	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`transaction`, CONSTRAINT `TRANSACTION_SESS_FK_PK` FOREIGN KEY (`sessions`) REFERENCES `session` (`session_id`))	0.000 sec


-- 12. Testing Bank table
-- DELETE FROM Bank WHERE bank_name = 'bank2';
UPDATE Bank SET bank_name = 'big bank' WHERE bank_address = 3;

-- ERROR 9: DELETE FROM Bank WHERE bank_name = 'bank2'	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`transaction`, CONSTRAINT `TRANSACTION_SESS_FK_PK` FOREIGN KEY (`sessions`) REFERENCES `session` (`session_id`))	0.000 sec


-- 13. Testing ATM table
-- DELETE FROM ATM WHERE bank = 2;
UPDATE ATM SET region = 3 WHERE bank = 1;

-- ERROR 10: DELETE FROM ATM WHERE bank = 2	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`transaction`, CONSTRAINT `TRANSACTION_SESS_FK_PK` FOREIGN KEY (`sessions`) REFERENCES `session` (`session_id`))	0.000 sec


-- 14. Testing ATMupdatesAccount table
DELETE FROM ATMupdatesAccount WHERE account = 102;
UPDATE ATMupdatesAccount SET atm = 102 WHERE 103;

-- 15. Testing Checks table
-- DELETE FROM Checks WHERE check_amount = 100;
UPDATE Checks SET check_amount = 500 WHERE check_id = 2;

-- ERROR 11: DELETE FROM Checks WHERE check_amount = 100	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`cashchecks`, CONSTRAINT `CASHCHECK_CHECKS_FK_PK` FOREIGN KEY (`checks`) REFERENCES `checks` (`check_id`) ON UPDATE CASCADE)	0.000 sec


-- 16. Testing Cash table
DELETE FROM Cash WHERE cash_amount = 300;
-- UPDATE Cash SET cash_id = 50 WHERE cash_amount = 100;

-- ERROR 12: UPDATE Cash SET cash_id = 50 WHERE cash_amount = 100	Error Code: 1062. Duplicate entry '50' for key 'cash.PRIMARY'	0.000 sec


-- 17. Testing Cash Checks table
DELETE FROM CashChecks WHERE cash = 1;
UPDATE CashChecks SET checks = 2 WHERE cash = 3;

-- 18. Testing Bills table
DELETE FROM Bills WHERE bills_id = 20;
UPDATE Bills SET bills_amount = 30 WHERE cash = 20;

-- 19. Testing Coins table
DELETE FROM Coins WHERE coins_id = 1;
UPDATE Coins SET coins_amount = 20 WHERE cash = 10;

-- 20. Testing Employee table
DELETE FROM Employee WHERE bank = 3;
UPDATE Employee SET is_supervisor = 1 WHERE employee_name = 'ironman';

-- 21. Testing ATM Technician table
DELETE FROM ATMTechnician WHERE tech_id = 11;
UPDATE ATMTechnician SET tech_id = 15 WHERE employee = 71;

-- 22. Testing Teller table
DELETE FROM Teller WHERE teller_id = 13;
UPDATE Teller SET teller_id = 29 WHERE employee = 78;

-- 23. Testing Admin table
DELETE FROM Admin WHERE admin_id = 16;
UPDATE Admin SET admin_id = 27 WHERE employee = 76;

-- 24. Testing Supervisor table
DELETE FROM Supervisor WHERE supervisor = 1;
UPDATE Supervisor SET supervisor = 22 WHERE employee = 76;

-- 25. Testing Supply table
DELETE FROM Supply WHERE status = 'bad';
UPDATE Supply SET alarms_sent = 1 WHERE sup_id = 2;

-- 26. Testing System table
DELETE FROM `System` WHERE supply_status = 'bad';
UPDATE `System` SET supply = 1 WHERE system_id = 2;

-- 27. Testing Phone table
DELETE FROM Phone WHERE user_phone = 1;
UPDATE Phone SET phone_id = 4 WHERE user_phone = 2;

-- 28. Testing Session table
-- DELETE FROM Session WHERE reg_user = 3;
UPDATE Session SET atm = 3 WHERE phone = 1;

-- ERROR 13: DELETE FROM Session WHERE reg_user = 3	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`atmmanagementdb`.`transaction`, CONSTRAINT `TRANSACTION_SESS_FK_PK` FOREIGN KEY (`sessions`) REFERENCES `session` (`session_id`))	0.016 sec


-- 29. Testing Transaction table
DELETE FROM Transaction WHERE transaction_id = 94;
UPDATE Transaction SET transaction_id = 97 WHERE sessions = 2;

-- 30. Testing Inquire table
DELETE FROM Inquire WHERE inquire_id = 1;
UPDATE Inquire SET balance = 1000 WHERE transaction_id = 93;

-- 31. Testing Transfer table
DELETE FROM Transfer WHERE transfer_id = 1;
UPDATE Transfer SET amount = 700 WHERE transfer_id = 2;

-- 32. Testing Deposit table
DELETE FROM Deposit WHERE deposit_id = 1;
UPDATE Deposit SET amount = 500 WHERE transaction_id = 93;

-- 33. Testing Withdraw table
DELETE FROM Withdraw WHERE transaction_id = 91;
UPDATE Withdraw SET withdraw_limit = 4000 WHERE amount = 200;

-- 34. Testing Receipt table
DELETE FROM Receipt WHERE sessions = 1;
UPDATE Receipt SET receipt_id = 22 WHERE sessions = 2;