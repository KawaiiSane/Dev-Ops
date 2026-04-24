```
kubectl create deploy nginx --image=anur07xd/hello-app:3.0 --replicas=2 --dry-run=client -o yaml > deploy.yaml


docker build -t anu07xd/hello-app:3.0 .


docker images

docker tag anu07xd/hello-app:3.0 anur07xd/hello-app:3.0

docker push anu07xd/hello-app:3.0


minikube status
kubectl config current-context
minikube start


kubectl apply -f deployment.yaml

kubectl get pods

kubectl expose deploy deploy-nginx --type=NodePort --port=3000

kubectl get svc

kubectl get ep


# to start the actual service
minikube service deploy-nginx 

# to enter the pod 
kubectl exec -it deploy-nginx-6c77d4dcbf-257xq -- sh

# to print all the env
kubectl exec -it deploy-nginx-6c77d4dcbf-257xq -- printenv

```