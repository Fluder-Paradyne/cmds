```shell
printf $(kubectl get secret --namespace jenkins jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
```

# clean up jenkins master
```shell
kubectl run cleanup-jenkins --image=busybox --restart=Never -n jenkins --overrides='
{
  "spec": {
    "containers": [
      {
        "name": "cleanup",
        "image": "busybox",
        "command": ["/bin/sh", "-c", "sleep 3600"],
        "volumeMounts": [
          {
            "name": "jenkins-home",
            "mountPath": "/var/jenkins_home"
          }
        ]
      }
    ],
    "volumes": [
      {
        "name": "jenkins-home",
        "persistentVolumeClaim": {
          "claimName": "jenkins"
        }
      }
    ]
  }
}'
```

# Wait for the pod to be ready
```shell
kubectl wait --for=condition=Ready pod/cleanup-jenkins -n jenkins
```

# Exec into the cleanup pod
```shell
kubectl exec -it cleanup-jenkins -n jenkins -- /bin/sh
```
