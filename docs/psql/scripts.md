```sql
CREATE ROLE readonly;

GRANT CONNECT ON DATABASE <dbName> TO readonly;

GRANT USAGE ON SCHEMA public TO readonly;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO readonly;

CREATE ROLE readwrite

GRANT CONNECT ON DATABASE <dbName> TO readwrite;

GRANT USAGE ON SCHEMA public TO readwrite;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO readwrite;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO readwrite;

GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO readwrite;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE ON SEQUENCES TO readwrite;

CREATE USER reader WITH PASSWORD '<password>';

GRANT readonly TO reader;
```

#### List all columns and their datatypes
```sql
SELECT table_name,
       column_name,
       data_type,
       is_nullable,
       column_default
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, ordinal_position;
```
