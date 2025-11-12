```shell
mysqldump -h <host> -u <uname> --password=<password> <db_name> <table_name> --where="id in (1)" > dump.sql
```

### query to list all tables and it's primary key 
```shell
SELECT 
    kcu.TABLE_NAME,
    kcu.COLUMN_NAME AS PRIMARY_KEY
FROM information_schema.TABLE_CONSTRAINTS tc
JOIN information_schema.KEY_COLUMN_USAGE kcu 
    ON tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
    AND tc.TABLE_SCHEMA = kcu.TABLE_SCHEMA
    AND tc.TABLE_NAME = kcu.TABLE_NAME
WHERE tc.CONSTRAINT_TYPE = 'PRIMARY KEY'
  AND tc.TABLE_SCHEMA = 'db_name'
ORDER BY kcu.TABLE_NAME, kcu.ORDINAL_POSITION;
```