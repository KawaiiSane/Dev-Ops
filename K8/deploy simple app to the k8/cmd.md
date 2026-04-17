```
login to the docker hub

        ||
build the image of the project using the command
        ||
docker build -t <image_name> .
        ||
docker images
        ||
docker push image_name
        ||
create deployement yml
        ||
kubectl create deploy --image=<image_name> --dry-run=client -o yaml > deployment.yaml
        ||
kubectl apply -f deployment.yaml
        ||
kubectl get pods
        ||
kubectl get po
        ||
create service 
        ||
kubectl create svc --help
        ||
expose deployment <deployement_name > --dry-run=client -o yaml >service.yaml
        ||
ls -lrt
        ||
kubectl apply -f service.yml
        || 
k get svc
        || 
minikube service <serivce_name>
        || 
k get po
        || 
k describe po <po_name>

```