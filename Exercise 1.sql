--Show full table
--SELECT * FROM Countries_1;

-- Show specific collumn
--SELECT ID, Name FROM Countries_1 ;

--Show specific lines
--SELECT * FROM Countries_1 WHERE ID <= 5 ;
--SELECT * FROM Countries_1 WHERE ccode='CA';

--COUNTC number lines of collumn
--SELECT COUNT (name) FROM Countries_1;

--DISTINCT - retrieves unique values in a collumn (don't get duplicate values
--SELECT DISTINCT name FROM Countries_1 WHERE ccode='US';
--SELECT COUNT(DISTINCT Title) FROM FilmLocations;	--Retrieves the number of unique title values (no duplicates)

--Retrive just first 4 rows:
--SELECT * FROM Countries_1 LIMIT 4
--SELECT * FROM FilmLocations LIMIT 15 OFFSET 10;		--Retrieve 15 rows, starting in line 11

--Insert, update, delete Rows in Database
--INSERT INTO Countries_1 (id, name, ccode )VALUES (11,'Portugal', 'PT');
--INSERT INTO Countries_1 (id, name, ccode )VALUES (11,'Portugal', 'PT');
--UPDATE Countries_1 SET id = 11, name = 'Aveiro' where ccode='PT';
--DELETE FROM Countries_1 WHERE id = 11;


SELECT * FROM Countries_1;

