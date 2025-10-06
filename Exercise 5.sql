--TASK1 retrieve the first names F_NAME and last names L_NAME of all employees who live in Elgin, IL
SELECT F_NAME, L_NAME FROM EMPLOYEES WHERE ADDRESS LIKE '%Elgin,IL%';

--TASK2 retrieve all employee records in department 5 where salary is between 60000 and 70000
SELECT * FROM EMPLOYEES WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;

--Sorting by ascending order
SELECT F_NAME, L_NAME, DEP_ID  FROM EMPLOYEES ORDER BY DEP_ID;
--Sorting by descending order and with multiple conditions to order
SELECT F_NAME, L_NAME, DEP_ID FROM EMPLOYEES ORDER BY DEP_ID DESC, L_NAME DESC;

--Grouping - Functions: AVG, COUNT
SELECT AVG(SALARY) FROM EMPLOYEES;
--for each department, retrieve the number of employees in the department and the average employee salary in the department. (COUNT(*) gives the total count of the column)
SELECT DEP_ID, COUNT(*), AVG(SALARY) FROM EMPLOYEES GROUP BY DEP_ID;

--Rename columns
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY" FROM EMPLOYEES GROUP BY DEP_ID;

--Combine Order ID and Group ID
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY" FROM EMPLOYEES GROUP BY DEP_ID ORDER BY AVG_SALARY;

--Filter the grouped response (limit the number of rows) - HAVING
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY" FROM EMPLOYEES GROUP BY DEP_ID HAVING count(*) < 4 ORDER BY AVG_SALARY;


--Built in functions: SUM, AVG,MAX,MIN
SELECT SUM (column_name) from table_name;
SELECT SUM (column_name) as Total_sum from table_name;           --to get the result in the variable Total_sum
SELECT MIN (column_name) from table_name WHERE salary = 60000;


--Built in functions: Scalar: ROUND(), LENGTH();UCASE,LCASE
SELECT LENGTH (column_name) from table_name;
SELECT * from table_name WHERE LCASE(column_name) ='cat'        --To search the word 'cat' but you do not know if it's lower case or upercase: Cat, cat, CAT...
SELECT DISTINCT UCASE(column_name) from table_name

--Built in functions: Date and Time
--DATE: YYYYMMDD
--TIME: HHMMSS
--TIMESTAMP: YYYYXXDDHHMMSSZZZZZ       -XX -month; ZZZZZZ-micro-seconds
SELECT DAY(column_name) from table_name WHERE other_column='green%'
SELECT COUNT(*) from table_name WHERE month(column_name)='05'
--To do arithmic functions with
SELECT DATE_ADD(column_name, INTERVAL 3 DAY) FROM table_name    --this adds 3 days to the date
SELECT DATE_ADD(column_name, INTERVAL 5 month) FROM table_name 
SELECT DATE_SUB(RESCUEDATE, INTERVAL 3 DAY)
--Dif between current date and other
SELECT DATEDIFF(CURRENT_DATE, column_name) FROM table_name      --To get ub format YYYY-MM-DD use: FROM_DAYS(DATEDIFF(...))


-- Sub-queries and Nested Selects
SELECT * FROM EMPLOYEES  WHERE salary < AVG(salary); --ERROR--   --We have to use a subquery, because AVG(column_name) is a group and canno«'t be used directly in the condition
SELECT * FROM table_name WHERE condition1 < (SELECT AVG(column_name) FROM table_name);          --We use a subquery: (SELECT AVG(column_name) FROM table_name)
--Subquery to create a derived table: -- Example bellow: It will make the avg of the collumn but this column is from new table that we created from a condition 
SELECT AVG(column_name) FROM (SELECT column_name FROM table_name ORDER BY column_name DESC LIMIT 5) AS NEW_TABLE;
--Example:      SELECT EMPL_ID, Year(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE))), (SELECT AVG(Year(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE)))) FROM job_history) From job_history;

--Acessing multiple tables with sub-queries
SELECT * FROM table_name WHERE column_name IN (SELECT column_name2 FROM table_name2);  
SELECT * FROM table_name T, table_name2 J WHERE T.column_name = J.column_name2;             --Using Alias and implicit join
--Example: SELECT E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE FROM EMPLOYEES E, JOBS J WHERE E.JOB_ID = J.JOB_IDENT;
--SELECT * FROM EMPLOYEES E, JOBS J WHERE E.JOB_ID = J.JOB_IDENT AND J.JOB_TITLE= 'Jr. Designer';           --Using AND, OR