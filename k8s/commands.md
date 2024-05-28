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