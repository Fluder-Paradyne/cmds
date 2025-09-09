```shell
kubectl delete pod <pod-name> -n <namespace> --grace-period=0
```

```shell
amd64_nodes=$(kubectl get nodes -o jsonpath='{range .items[?(@.status.nodeInfo.architecture=="amd64")]}{.metadata.name}{"\n"}{end}')
for node in $amd64_nodes; do
    echo "Pods running on node: $node"
    kubectl get pods --all-namespaces --field-selector spec.nodeName="$node"
    echo ""
done
```

Delete all failed pods in current namespace
```shell
kubectl get pods --field-selector=status.phase=Failed -o name | xargs -P 10 -n 1 kubectl delete
```


Delete all failed pods across all namespaces

### (for completed status is Succeeded)

```shell
kubectl get pods --all-namespaces --field-selector=status.phase=Failed -o custom-columns=NAME:.metadata.name,NAMESPACE:.metadata.namespace --no-headers | \
awk '{print $2, $1}' | \
xargs -P 10 -n 2 sh -c 'kubectl delete pod $1 -n $0'
```


### Search for a string in config map

```shell
for cm in $(kubectl get configmap -o name); do   echo "--- Processing $cm ---";   kubectl get "$cm" -o yaml | grep -q 'test string' && echo "Found 'AKIAYX2ZQI577ABR6GSM' in $cm"; done
```

### Get all the envs set while masking values, also skips some service/k8s related envs
```shell
kubectl -n super-crm-staging exec -it <pod-name> -- printenv \
  | tr -d '\r' \
  | grep -vE '(_TCP_PROTO=|_TCP=|_PORT_HTTP=|_TCP_ADDR=|_TCP_PORT=|_HOST=|_PORT=)' \
  | sed 's/=.*/=****/' \
  | sort
```

### Get PVC usage 
```shell
kubectl df-pv -n <namespace>
```
