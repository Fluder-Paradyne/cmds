set these configs
- binlog_format = ROW
- binlog_row_image = FULL
- binlog_backup = 1

### Query to see which indices are being used on a table ( useful to figure out dropable indices  )
```sql
SELECT 
    OBJECT_NAME AS 'Table', 
    INDEX_NAME AS 'Index', 
    COUNT_FETCH, 
    COUNT_INSERT, 
    COUNT_UPDATE 
FROM performance_schema.table_io_waits_summary_by_index_usage 
WHERE OBJECT_NAME = '<table name>';
```
