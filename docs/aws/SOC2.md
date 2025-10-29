Get all RDS which have less than 7 days of backup retension
```shell
aws rds --profile <profile-name> --region us-east-1 describe-db-clusters --query 'DBClusters[*].{ClusterIdentifier: DBClusterIdentifier, BackupRetentionPeriod: BackupRetentionPeriod}' --output json | jq '[.[] | select(.BackupRetentionPeriod < 7)]'
```

enable deletion protection on for all loadbalancers
```shell
aws elbv2 --profile prod --region us-east-1 describe-load-balancers --query 'LoadBalancers[*].LoadBalancerArn' --output text | tr '\t' '\n' | while IFS= read -r alb_arn; 
do echo "Enabling deletion protection for ALB: $alb_arn"; 
aws elbv2 --profile contlo-prod --region us-east-1 modify-load-balancer-attributes --load-balancer-arn "$alb_arn" --attributes Key=deletion_protection.enabled,Value=true; 
done
```

Update all BackupRetentionPeriod to 35 days
```shell
#!/bin/bash

aws rds --profile devops --region us-east-1 describe-db-clusters --query 'DBClusters[*].DBClusterIdentifier' --output text | tr '\t' '\n' | while IFS= read -r cluster_id; do
  backup_retention=$(aws rds --profile devops@superagi.com --region us-east-1 describe-db-clusters --db-cluster-identifier "$cluster_id" --query 'DBClusters[0].BackupRetentionPeriod' --output text)

  if [[ -n "$backup_retention" ]] && [[ "$backup_retention" -lt 35 ]]; then
    echo "Cluster: $cluster_id has backup retention period of $backup_retention days. Updating to 35 days..."
    aws rds --profile devops@superagi.com --region us-east-1 modify-db-cluster --db-cluster-identifier "$cluster_id" --backup-retention-period 35 --apply-immediately
    echo "Backup retention period updated for cluster: $cluster_id"
  else
    if [[ -z "$backup_retention" ]]; then
      echo "Error: Could not retrieve backup retention period for cluster: $cluster_id. Skipping."
    else
      echo "Cluster: $cluster_id already has a backup retention period of $backup_retention days or more. Skipping."
    fi
  fi
done

echo "Finished checking and updating backup retention period for relevant RDS clusters."
```
