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

# Clean up script
## This script delete all builds/logs of all jobs leave the last/latest 10 job
```shell
#!/bin/bash
# Run this script from /var/jenkins_home/jobs

# For each job directory
for job in */; do
    echo "Processing job: $job"
    
    # Check if builds directory exists
    if [ -d "${job}builds" ]; then
        cd "${job}builds"
        
        # List all build directories, sort numerically in reverse order
        # Keep the first 10, remove the rest
        ls -1d [0-9]* 2>/dev/null | sort -rn | tail -n +11 | while read build; do
            echo "Removing build #$build from $job"
            rm -rf "$build"
        done
        
        cd ../../
    fi
done

echo "Cleanup completed!"
```
