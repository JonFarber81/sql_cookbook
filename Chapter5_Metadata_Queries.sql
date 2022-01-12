
-- You want to list the columns in a table, along with their data types, and their position in the table they are in.
select column_name, data_type, ordinal_position
from information_schema.columns
where table_schema = 'public'
and table_name   = 'dept';



-- You want list indexes, their columns, and the column position (if available) in the index for a given table.
  select
	a.tablename,
	a.indexname,
	b.column_name
from
	pg_catalog.pg_indexes a,
	information_schema.columns b
where
	a.schemaname = 'public'
	and a.tablename = b.table_name;
	

-- You want to list the constraints defined for a table in some schema and the columns they are defined on. 
-- For example, you want to find the constraints and the columns they are on for table EMP.
   select
	a.table_name,
	a.constraint_name,
	b.column_name,
	a.constraint_type
from
	information_schema.table_constraints a,
	information_schema.key_column_usage b
where
	a.table_name = 'dept'
	and a.table_schema = 'public'
	and a.table_name = b.table_name
	and a.table_schema = b.table_schema
	and a.constraint_name = b.constraint_name;