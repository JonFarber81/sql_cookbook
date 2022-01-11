-- You want to display the names, jobs, and salaries of employees in department 10 in order based on their salary (from lowest to highest). 
-- You want to return the following result set
SELECT
	ename,
	job,
	sal
FROM
	emp
WHERE
	deptno = 10
ORDER BY
	sal ASC

-- Sort by multiple fields	
 SELECT
	empno,
	deptno,
	sal,
	ename,
	job
FROM
	emp
ORDER BY
	deptno,
	sal DESC
	

-- Sort by substring
SELECT
	ename,
	job
FROM
	emp
ORDER BY
	substr(job, LENGTH(job)-1);
	


-- Sorting mixed alphanumeric data
CREATE VIEW V
AS
SELECT
	ename || ' ' || deptno AS DATA
FROM
	emp;

select * from V;


-- The TRANSLATE and REPLACE functions remove either the numbers or characters from each row, allowing you to easily sort by one or the other.
-- The values passed to ORDER BY are shown in the following query results (using the Oracle solution as the example, as the same technique applies to all three vendors; 
-- only the order of parameters passed to TRANSLATE is what sets DB2 apart):
-- Use REPLACE and TRANSLATE to modify for sorting
SELECT
	DATA
FROM
	V
ORDER BY
	REPLACE(DATA,
          REPLACE(
        TRANSLATE(DATA, '0123456789', '##########'), '#', ''), '');
 
       

 
-- Oracle has specific functions to put nulls first or last       
SELECT
	ename,
	sal,
	comm
FROM
	emp
ORDER BY
	comm NULLS LAST;


-- Otherwise use an auxiliary column
SELECT
	ename,
	sal,
	comm,
	CASE
		WHEN comm IS NULL THEN 0
		ELSE 1
	END AS is_null
FROM
	emp



    