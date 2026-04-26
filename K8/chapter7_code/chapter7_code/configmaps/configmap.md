this will allow us to manage the multiple variables


In config map we create the object of the env variable known as configmap

cm = configmap
```
kubectl create cm sample-cm --from-literal=first=anurag --from-literal=last=sharma

kubectl describe cm sample-cm 
// this will show a key-value pair 

### using menifest 
kubectl create cm sample-cm --from-literal=first=anurag --from-literal=last=sharma --dry-run=client -o yaml > cm1.yml


kubectl exec -t deploy-nginx-6c77d4dcbf-257xq -- printenv

```