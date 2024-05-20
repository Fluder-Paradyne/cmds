[//]: # (Title: Jenkins)
[//]: # (Categories: jenkins)
[//]: # (Tags: jenkins, kubernetes)
printf $(kubectl get secret --namespace jenkins jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo