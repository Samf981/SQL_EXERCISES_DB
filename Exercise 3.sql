--TASK1 CREATE statement

/*CREATE TABLE PETSALE (
        ID INTEGER NOT NULL,
        PET CHAR(20),
        SALEPRICE DECIMAL(6,2),
        PROFIT DECIMAL(6,2),
        SALEDATE DATE
        );
CREATE TABLE PET (
        ID INTEGER NOT NULL,
        ANIMAL VARCHAR(20),
        QUANTITY INTEGER
        );*/
        
--TASK2 INSERT statement
/*     INSERT INTO PETSALE VALUES
        (1,'Cat',450.09,100.47,'2018-05-29'),
        (2,'Dog',666.66,150.76,'2018-06-01'),
        (3,'Parrot',50.00,8.9,'2018-06-04'),
        (4,'Hamster',60.60,12,'2018-06-11'),
        (5,'Goldfish',48.48,3.5,'2018-06-14');
        
INSERT INTO PET VALUES
        (1,'Cat',3),
        (2,'Dog',4),
        (3,'Hamster',2);
SELECT * FROM PETSALE;
SELECT * FROM PET; */

--Task 3: ALTER statement
--ALTER TABLE PETSALE ADD COLUMN QUANTITY INTEGER;
--SELECT * FROM PETSALE;

/*UPDATE PETSALE SET QUANTITY = 9 WHERE ID = 1;
UPDATE PETSALE SET QUANTITY = 3 WHERE ID = 2;
UPDATE PETSALE SET QUANTITY = 2 WHERE ID = 3;
UPDATE PETSALE SET QUANTITY = 6 WHERE ID = 4;
UPDATE PETSALE SET QUANTITY = 24 WHERE ID = 5;
SELECT * FROM PETSALE;*/

 --Deleting a column
 --ALTER TABLE PETSALE DROP COLUMN PROFIT;
--SELECT * FROM PETSALE;
 
 
 --Modify a column
--ALTER TABLE PETSALE MODIFY PET VARCHAR(20);
--SELECT * FROM PETSALE;
 
 --Rename a Column
--ALTER TABLE `PETSALE` CHANGE `PET` `ANIMAL` varchar(20);
--SELECT * FROM PETSALE

--Task 4: TRUNCATE statement
--TRUNCATE TABLE PET ;
--SELECT * FROM PET;

--Task 5: DROP statement
--DROP TABLE PET;
--SELECT * FROM PET;

--Use key and foreign keys - Author ID is the primary key in the original table
--This means every AUTHOR_ID in BookShop must exist in BookShop_AuthorDetails.
--Trying to insert a book with an AUTHOR_ID that doesn't exist in BookShop_AuthorDetails will fail.


CREATE TABLE BookShop_AuthorDetails (
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(100)
);
CREATE TABLE BookShop (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(100),
    AUTHOR_ID INT,
    FOREIGN KEY (AUTHOR_ID) REFERENCES BookShop_AuthorDetails(AUTHOR_ID)
);

--Domain integrity constraint - values stored in a column fall within a defined domain ( data type, nullanility, format,...

CREATE TABLE BookShop (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(100) NOT NULL,
    PRICE DECIMAL(5, 2) CHECK (PRICE >= 0),
    PUBLISHED_DATE DATE
);

--Check constraint - The price column must have values bigger than zero
--Not NULL - Column must contain a value
