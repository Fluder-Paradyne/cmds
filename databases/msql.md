```shell
mysqldump -h <host> -u <uname> --password=<password> <db_name> <table_name> --where="id in (1)" > dump.sql
```
