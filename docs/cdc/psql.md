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