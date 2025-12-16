set these configs

wal_level = logical
max_replication_slots = 10 (or higher)
max_wal_senders = 10 (or higher)

### get details of replication slot
```sql
SELECT
    slot_name,
    plugin,
    slot_type,
    database,
    active,
    restart_lsn,
    confirmed_flush_lsn
FROM pg_replication_slots;
```

### list publications
```sql
SELECT pubname, puballtables
FROM pg_publication;
```

### show what publication is attached to what tables
```sql
SELECT
    pubname,
    schemaname,
    tablename
FROM pg_publication_tables;
```

### Check if WAL is piling up
```sql
SELECT
    slot_name,
    pg_size_pretty(pg_wal_lsn_diff(pg_current_wal_lsn(), restart_lsn)) AS retained_wal
FROM pg_replication_slots;
```

### check config values
```sql
SHOW wal_level;
SHOW max_replication_slots;
SHOW max_wal_senders;
```


count rows in current db
```sql
SELECT 
    schemaname,
    relname as tablename,
    n_tup_ins - n_tup_del as row_count
FROM pg_stat_user_tables
ORDER BY row_count DESC;
```