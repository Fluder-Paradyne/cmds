## Commands to start opensearch dashboard
```shell
nvm use 20.18.3
```

```shell
yarn start --no-base-path 
```


#### check when opensearch certificates are going to expire
```shell
echo "=== OpenSearch Certificate Expiration Dates ===" && echo "" && for cluster in logs emails crm-v2 crm-staging prospect tasks; do echo "[$cluster]" && kubectl get secret ${cluster}-http-cert -n opensearch -o jsonpath='{.data.tls\.crt}' 2>/dev/null | base64 -d | openssl x509 -noout -enddate 2>/dev/null | sed 's/notAfter=/  Expires: /' && echo ""; done
```
