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
