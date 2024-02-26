-- Script name:   inserts.sql
-- Author:        Robin Fernando
-- Purpose:       Insert sample data to test the integrity of this database system

-- the database used to insert the data into.
USE sql3459708;

-- Address table inserts
INSERT INTO Address (address_id, address, city, state, zip_code) VALUES
-- for reg users 
(1, '1234 Scott Ln', 	'Sacramento', 		'CA', 94211),
(2, '2345 Schrute Dr', 	'San Francisco', 	'CA', 94015),
(3, '123 Halpert St', 	'Vallejo', 			'CA', 94591),
(4, '1235 Malone St', 	'San Francisco', 	'CA', 94015),
(5, '126 Martinez Dr', 	'Oakland', 			'CA', 94501),
(6, '122 Bratton St', 	'Sacramento', 		'CA', 94211),
(7, '123 Bernard St', 	'San Francisco', 	'CA', 94015),
(8, '321 Hudson St', 	'Oakland', 			'CA', 94501),
(9, '333 Vance Ln', 	'Tracy', 			'CA', 95304),
-- for police station
(91, '1 Police St', 	'San Francisco', 	'CA', 94015),
(92, '123 Federal Ln', 	'Oakland', 			'CA', 94501),
(93, '223 Piggy Dr', 	'Sacramento', 		'CA', 94211),
(94, '990 Govern St', 	'Vallejo', 			'CA', 94591),
(95, '984 Sherriff Ln', 'Tracy', 			'CA', 95304),
-- for banks
(41, '23 Polk St', 		'San Francisco', 	'CA', 94015),
(42, '123 Lammers Ln', 	'Oakland', 			'CA', 94501),
(43, '223 Old Dr', 		'Sacramento', 		'CA', 94211),
(44, '990 Springs St', 	'Vallejo', 			'CA', 94591),
(45, '984 Gable Ln', 	'Tracy', 			'CA', 95304);

-- Registered User table inserts
INSERT INTO RegisteredUser (user_id, full_name, user_email, dob, user_address) VALUES 
(1, 'Michael Scott', 	'michael@gmail.com', 	01021993, 1), 
(2, 'Dwight Schrute', 	'dwight@yahoo.com', 	01201966, 2), 
(3, 'Jim Halpert', 		'jim@gmail.com', 		11201979, 3),
(4, 'Pam Halpert', 		'pam@gmail.com', 		03071974, 3),
(5, 'Kevin Malone', 	'kevin@gmail.com', 		11291972, 4),
(6, 'Oscar Martinez', 	'oscar@yahoo.com', 		11181958, 5),
(7, 'Creed Bratton', 	'creed@yahoo.com', 		02081943, 6),
(8, 'Andy Bernard', 	'andy@gmail.com', 		01241974, 7),
(9, 'Stanley Hudson', 	'stanley@yahoo.com', 	02191958, 8),
(10, 'Bob Vance', 		'bob@yahoo.com', 		04101958, 9);

-- Language inserts
INSERT INTO Language (language_id, description) VALUES 
(1, 'English'), 
(2, 'Spanish'), 
(3, 'Tagalog'),
(4, 'Chinese');

-- Account table inserts
INSERT INTO Account (account_id, reg_user, languages, created, password) VALUES 
(101, 1, 1, '2005-10-01 16:00:01', 'password123'), 
(102, 2, 4, '2009-05-10 16:00:01', 'abc123'), 
(103, 3, 1, '2001-02-02 12:00:01', '1234abc'),
(104, 4, 1, '2000-07-07 10:00:01', 'pass1'),
(105, 5, 1, '2002-11-02 13:00:01', 'pass2'),
(106, 6, 2, '2003-03-03 12:00:01', 'pass3'),
(107, 7, 3, '2006-04-06 18:00:01', 'pass4'),
(108, 8, 1, '2006-09-02 13:00:01', 'pass5'),
(109, 9, 1, '2004-01-03 12:00:01', 'pass6'),
(110, 10, 1, '2001-02-05 08:00:01', 'pass7');

-- Checking table inserts
INSERT INTO Checking (checking_acc_id, account_id, checking_balance) VALUES 
(1, 101, 400), 
(2, 102, 4500), 
(3, 103, 4000),
(4, 104, 3500),
(5, 105, 1200),
(6, 106, 4300),
(7, 107, 450),
(8, 108, 3900),
(9, 109, 3200),
(10, 110, 3000);

-- Savings table inserts
INSERT INTO Savings (savings_acc_id, account_id, savings_balance) VALUES 
(1, 101, 40), 
(2, 102, 10500), 
(3, 103, 14000),
(4, 104, 13500),
(5, 105, 11200),
(6, 106, 14300),
(7, 107, 1450),
(8, 108, 13900),
(9, 109, 13200),
(10, 110, 13000);

-- Handprint Scanner table inserts
INSERT INTO HandprintScanner (scanner_id, status) VALUES 
(51, 'Connected'), 
(52, 'Connected'),
(53, 'Connected'), 
(54, 'Connected'),  
(55, 'Connected');

-- Keypad table inserts
INSERT INTO Keypad (keypad_id, status) VALUES 
(51, 'Connected'), 
(52, 'Connected'), 
(53, 'Connected'), 
(54, 'Connected'), 
(55, 'Connected');

-- Debit Card table inserts
INSERT INTO DebitCard (debit_card_id, user, card_num, card_pin, card_exp, cvv) VALUES 
(1, 1, 		1234567812341111, 1111, '2022-01-01 00:00:01', 000), 
(2, 2, 		1234567812342222, 2222, '2032-02-01 00:00:01', 123), 
(3, 3, 		1234567812343333, 3333, '2027-03-01 00:00:01', 222),
(4, 4, 		1234567812344444, 4444, '2029-04-01 00:00:01', 321),
(5, 5, 		1234567812345555, 5555, '2028-05-01 00:00:01', 456),
(6, 6, 		1234567812346666, 6666, '2025-06-01 00:00:01', 555),
(7, 7, 		1234567812347777, 7777, '2032-07-01 00:00:01', 654),
(8, 8, 		1234567812348888, 8888, '2024-08-01 00:00:01', 789),
(9, 9, 		1234567812349999, 9999, '2022-09-01 00:00:01', 888),
(10, 10, 	1234567812340000, 0000, '2024-10-01 00:00:01', 987);

-- Region table inserts
INSERT INTO Region (region_id, description, cities) VALUES 
(1, 'San Francisco Bay Area', 'San Francisco'),
(2, 'San Francisco Bay Area', 'Oakland'),
(3, 'Sacramento Valley', 'Sacramento'), 
(4, 'San Francisco Bay Area', 'Vallejo'),
(5, 'San Joaquin Valley', 'Tracy');

-- Network table inserts
INSERT INTO Network (network_id, status, connection_name) VALUES
(1, 'yes', 'atmcon1'), 
(2, 'yes', 'atmcon2'), 
(3, 'no', 'atmcon3');

-- Police Station table inserts
INSERT INTO PoliceStation (pol_station_id, pol_address, pol_email) VALUES 
(1, 91, 'sfpol@gmail.com'), 
(2, 92, 'oakpol@gmail.com'), 
(3, 93, 'sacpol@gmail.com'),
(4, 94, 'valpol@gmail.com'),
(5, 95, 'tracypol@gmail.com');

-- Bank table inserts
INSERT INTO Bank (bank_id, bank_name, bank_address) VALUES 
(1, 'SF Branch', 			41), 
(2, 'Oakland Branch', 		42), 
(3, 'Sacramento Branch', 	43),
(4, 'Vallejo Branch', 		44),
(5, 'Tracy Branch', 		45);

-- ATM table inserts
INSERT INTO ATM (atm_id, bank, region, keypad, handprint_scanner, debit, network, police_station, status, polAlerts) VALUES 
(1, 1, 1, 51, 51, 1, 1, 1, 'yes', 1), 
(2, 2, 2, 52, 52, 2, 2, 2, 'yes', 2), 
(3, 3, 3, 53, 53, 3, 3, 3, 'yes', 6),
(4, 4, 4, 54, 54, 4, 2, 4, 'yes', 2),
(5, 5, 5, 55, 55, 5, 2, 5, 'yes', 10);

-- ATMupdatesAccount table inserts
INSERT INTO AtmUpdatesAccount (account, atm) VALUES 
(101, 1), 
(102, 2), 
(103, 3);

-- Checks table inserts
INSERT INTO Checks (check_id, check_amount) VALUES 
(1, 100), 
(2, 200), 
(3, 300),
(4, 400),
(5, 500);

-- Cash table inserts
INSERT INTO Cash (cash_id, cash_amount) VALUES 
(1, 100), 
(2, 200), 
(3, 300),
(4, 10000),
(5, 500),
(6, 30000),
(10, 100),
(20, 200);

-- Cash Checks table inserts
INSERT INTO CashChecks (cash, checks) VALUES 
(1, 1), 
(2, 2), 
(3, 3);

-- Bills table inserts
INSERT INTO Bills (bills_id, cash, bills_amount) VALUES 
(1, 1, 99), 
(2, 2, 200), 
(20, 20, 200);

-- Coins table inserts
INSERT INTO Coins (coins_id, cash, coins_amount) VALUES 
(1, 1, 100), 
(5, 5, 100), 
(10, 10, 100);

-- Employee table inserts
INSERT INTO Employee (bank, employee_id, is_supervisor, employee_name, employee_email, employee_salary, employee_dob) VALUES 
(1, 11, 0, 	'Ross Geller', 		'bemp1@gmail.com', 		40000, 01021990), 
(1, 12, 0, 	'Rachel Green', 	'bemp2@yahoo.com', 		50000, 02031990), 
(1, 13, 1, 	'Monica Geller', 	'bemp3@outlook.com', 	60000, 03041990),
(1, 14, 0, 	'Joey Tribbiani', 	'bemp4@aol.com', 		30000, 04051991), 
(2, 21, 0, 	'Sponge Bob', 		'sponge1@gmail.com', 	40000, 05061991), 
(2, 22, 0, 	'Squid Ward', 		'sponge2@yahoo.com', 	50000, 06071991), 
(2, 23, 1, 	'Eugene Krabs', 	'sponge3@outlook.com', 	60000, 07081990), 
(2, 24, 0, 	'Patrick Star', 	'sponge4@aol.com', 		30000, 08091990), 
(3, 31, 0, 	'Stan Marsh', 		'south1@gmail.com', 	40000, 01011990), 
(3, 32, 0, 	'Kenny McCormick', 	'south2@yahoo.com', 	50000, 02021980), 
(3, 33, 3, 	'Kyle Brof', 		'south3@outlook.com', 	65000, 01021990), 
(3, 34, 0, 	'Eric Cartman', 	'south4@aol.com', 		30000, 10101994),
(4, 41, 0, 	'Ted Moseby', 		'himym1@gmail.com', 	40000, 02031985),
(4, 42, 0, 	'Marshall Eriksen', 'himym2@yahoo.com', 	50000, 01071970),
(4, 43, 4, 	'Barney Stinson', 	'himym3@outlook.com', 	60000, 11011990),
(4, 44, 0,	'Robin Sherbatsky', 'himym4@aol.com', 		30000, 05021965),
(5, 51, 0,	'Leonardo', 		'tmnt1@gmail.com', 		40000, 04021990),
(5, 52, 0,	'Michaelangelo', 	'tmnt2@yahoo.com', 		50000, 02041994),
(5, 53, 5, 	'Raphael', 			'tmnt3@outlook.com', 	60000, 02061986),
(5, 54, 0, 	'Donatello', 		'tmnt4@aol.com', 		30000, 01021965);

-- ATM Technician table inserts
INSERT INTO ATMTechnician (tech_id, employee) VALUES 
(1, 11),
(2, 21),
(3, 31),
(4, 41),
(5, 51);

-- Teller table inserts
INSERT INTO Teller (teller_id, employee) VALUES 
(1, 14),
(2, 24),
(3, 34),
(4, 44),
(5, 54);

-- Admin table inserts
INSERT INTO Admin (admin_id, employee) VALUES 
(1, 12),
(2, 22),
(3, 32),
(4, 42),
(5, 52);

-- Supervisor table inserts
INSERT INTO Supervisor (employee, supervisor) VALUES 
(13, 1),
(23, 2),
(33, 3),
(43, 4),
(53, 5);

-- Supply table inserts
INSERT INTO Supply (sup_id, atm, admin, tech, cash, checks, status, alarms_sent ) VALUES 
(1, 1, 1, 1, 1, 1, 'bad', 1), 
(2, 2, 2, 2, 2, 2, 'good', 0), 
(3, 3, 3, 3, 3, 3, 'good', 2),
(4, 4, 4, 4, 4, 4, 'good', 0), 
(5, 5, 5, 5, 6, 5, 'good', 0);

-- System table inserts
INSERT INTO `System` (system_id, supply, supply_status) VALUES 
(1, 1, 'bad'), 
(2, 2, 'good'), 
(3, 3, 'good'),
(4, 4, 'good'),
(5, 5, 'good');

-- Phone table inserts
INSERT INTO Phone (phone_id, user_phone) VALUES 
(1, 1), 
(2, 2), 
(3, 3);

-- Session table inserts
INSERT INTO Session (session_id, session_create, reg_user, atm, phone) VALUES 
(1, '2021-10-01 16:00:01', 1, 1, 1), 
(2, '2021-02-03 17:02:01', 2, 2, 2), 
(3, '2020-04-05 11:00:01', 3, 3, 3),
(4, '2020-05-07 12:00:01', 4, 4, null),
(5, '2016-11-02 09:05:01', 5, 5, null),
(6, '2015-01-07 19:50:01', 6, 5, null),
(7, '2015-07-09 16:30:01', 7, 4, null),
(8, '2014-03-10 08:05:01', 8, 3, null),
(9, '2011-02-08 11:30:01', 9, 2, null),
(10, '2010-03-01 14:00:01', 10, 1, null);

-- Transaction table inserts
INSERT INTO Transaction (transaction_id, sessions) VALUES 
(1, 1), 
(2, 2), 
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inquire table inserts
INSERT INTO Inquire (inquire_id, transaction_id, balance) VALUES 
(1, 6, 100), 
(2, 5, 200), 
(3, 4, 300);

-- Transfer table inserts
INSERT INTO Transfer (transfer_id, transaction_id, amount) VALUES 
(1, 1, 100), 
(2, 2, 100), 
(3, 3, 200);

-- Deposit table inserts
INSERT INTO Deposit (deposit_id, transaction_id, amount) VALUES 
(1, 1, 100), 
(2, 2, 100), 
(3, 3, 200),
(4, 4, 1500),
(5, 5, 1000),
(6, 6, 900),
(7, 7, 800),
(8, 8, 1000),
(9, 9, 1300),
(10, 10, 700);

-- Withdraw table inserts
INSERT INTO Withdraw (withdraw_id, transaction_id, withdraw_limit, amount) VALUES 
(1, 1, 2000, 300), 
(2, 2, 2000, 200), 
(3, 3, 2000, 100);

-- Receipt table inserts
INSERT INTO Receipt (receipt_id, sessions) VALUES 
(1, 1), 
(2, 2), 
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);