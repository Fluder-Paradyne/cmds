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
