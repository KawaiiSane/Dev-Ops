Types of Secrets:

1. Generic based Secrets
2. Docker Registry Based Secrets

```
minikube start
kubectl create secret generic demo-secret --from-literal=password=hellopass
kubectl get secrets
kubectl describe secret demo-secret
```

```
kubectl get secret demo-secret -o yaml

apiVersion: v1
data:
  password: aGVsbG9wYXNz
kind: Secret
metadata:
  creationTimestamp: "2026-05-05T18:59:25Z"
  name: demo-secret
  namespace: default
  resourceVersion: "15921"
  uid: b11d10a3-4772-4d75-9621-2c8d8aa258c6
type: Opaque

## To encode decode and encode the password
```
echo "aGVsbG9wYXNz" | base64 --decode
echo "hellopass" | base64
```
