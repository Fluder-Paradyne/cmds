Get all RDS which have less than 7 days of backup retension
```shell
aws rds --profile <profile-name> --region us-east-1 describe-db-clusters --query 'DBClusters[*].{ClusterIdentifier: DBClusterIdentifier, BackupRetentionPeriod: BackupRetentionPeriod}' --output json | jq '[.[] | select(.BackupRetentionPeriod < 7)]'
```
