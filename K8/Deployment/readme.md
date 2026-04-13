So here are some challenges of the POD

Note:- Pod is nothing but it encapsulated the container with it, which means when ever a pod is crashes, when ever a pod is stops, How do we make sure that a new pod is restarted itself.

```
    kubectl create --help

    kubectl create deployment --help

    kubectl create deploy nginx-deploy --image=nginx --replicas=3
        deployment.apps/nginx-deploy created

    kubectl get pods
        NAME                           READY   STATUS    RESTARTS       AGE
        nginx-deploy-8b9dbd8c9-64w7v   1/1     Running   0              19s
        nginx-deploy-8b9dbd8c9-6nnxx   1/1     Running   0              19s
        nginx-deploy-8b9dbd8c9-sx7xp   1/1     Running   0              19s
        nginx-pod                      1/1     Running   27 (64s ago)   10d

## So in that case what will happened is that even if some pod is delted and not working it will still maintain that 3 replicas of the pods always. Which means deployment controller will make sure that our replicas available all the time.

    kubectl get deploy
    kubectl describe  deploy

## Scale deployment

    kubectl scale --help
    kubectl scale deployment nginx-deploy --replicas=2 # scale down to the 2 replicas from 2

    kubectl edit deploy nginx-deploy

    # this command will create a deploy.yml file
    kubectl create deploy sample --image=ngix --dry-run=client -o yaml > deploy.yml 

    kubectl explain deployment

    kubectl rollout --help
    
    // this will restart all the pods
    kubectl rollout restart deploy nginx-deploy

    kubectl rollout history

    kubectl rollout undo deployment nginx-deploy

    kubectl rollout status deploy

