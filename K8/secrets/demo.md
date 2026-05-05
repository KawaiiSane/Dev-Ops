Types of Secrets:

1. Generic based Secrets
2. Docker Registry Based Secrets

```
minikube start
kubectl create secret generic demo-secret --from-literal=password=hellopass
kubectl get secrets
kubectl describe secret demo-secret
```