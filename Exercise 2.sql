--CREATE TABLE - VARCHAR IS A VARIABLE FIELD UP TO 24 CARACHTERS LONG; not null ensure that that field dosen't have a null value
--In this case I create a table with 2 collumns and then add 3 lines
/*CREATE TABLE table_name (id char(2) PRIMARY KEY NOT NULL, name VARCHAR(24));
INSERT INTO table_name (id, name) VALUES (1,'AB');
INSERT INTO table_name (id, name) VALUES (2,'CD');
INSERT INTO table_name (id, name) VALUES (3,'EF');*/


--ALTER, DROP, TRUNCATE TABLES
--Add a collumn with numbers. bigint for integer values
--ALTER TABLE table_name add COLUMN 'number1' bigint;
--ALTER TABLE table_name add COLUMN 'number2' bigint;
--Remove column
--Alter TABLE table_name DROP COLUMN 'number2';
--This will delete the table from memory
--DROP TABLE table_name;

--Truncate Table - Deletes all rows of data in table
--TRUNCATE TABLE table_name IMMEDIATE; -- TRUNCATE dosen't exist in SQL ONline use: 
--DELETE FROM table_name;
--SELECT * FROM table_name;

