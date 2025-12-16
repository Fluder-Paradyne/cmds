set these configs

wal_level = logical
max_replication_slots = 10 (or higher)
max_wal_senders = 10 (or higher)

### get details of replication slot
```shell
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
```shell
SELECT pubname, puballtables
FROM pg_publication;
```

### show what publication is attached to what tables
```shell
SELECT
    pubname,
    schemaname,
    tablename
FROM pg_publication_tables;
```

### Check if WAL is piling up
```shell
SELECT
    slot_name,
    pg_size_pretty(pg_wal_lsn_diff(pg_current_wal_lsn(), restart_lsn)) AS retained_wal
FROM pg_replication_slots;
```

### check config values
```shell
SHOW wal_level;
SHOW max_replication_slots;
SHOW max_wal_senders;
```