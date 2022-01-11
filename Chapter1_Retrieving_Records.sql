select *
from emp;

select *
from dept;

select *
from emp
where deptno = 10
   or comm is not null
   or sal <= 2000 and deptno = 20;

select *
from emp
where (deptno = 10
    or comm is not null
    or sal <= 2000
    )
  and deptno = 20;

-- By wrapping your query as an inline view, you can reference the aliased columns:
select *
from (
         select sal as salary, comm as commission
         from emp
     ) x
where salary < 5000

-- Oracle uses || to concatenate, SQL Server users +, and MySQL uses CONCAT
select ename || ' WORKS AS A ' || job as msg
from emp
where deptno = 10;

-- Use the CASE expression to perform conditional logic directly in your SELECT statement:
select ename,
       sal,
       case
           when sal <= 2000 then 'UNDERPAID'
           when sal >= 4000 then 'OVERPAID'
           else 'OK'
           end as status
from emp;

-- Limit the number of records returned. Varies by DB, Postgres uses limit, Oracle uses rownum
select *
from emp
where rownum <= 5;

-- Return a random set 5 records from Oracle
-- Postgres allows you to order by random()
select *
from (
         select ename, job
         from emp
         order by dbms_random.value()
     )
where rownum <= 5;


-- Return all records where commision field is null
select *
from emp
where comm is null;

-- Change those nulls into real VALUES
select coalesce(comm, 0)
from emp;

-- Of the employees in departments 10 and 20,
-- you want to return only those that have either an “I” somewhere in their name or a job title ending with “ER”:
select ename, job
from emp
where deptno in (10, 20)
    and (ename like '%I%' or job like '%ER');