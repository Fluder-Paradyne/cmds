## Get iam profile based with userId
aws iam list-users --profile prod --output json | jq '.Users[] | select(.UserId == "xxxxxxxxxxxx")'
