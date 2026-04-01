## k8 reading

kind cluster is the way to run the kubernetes

check out the https://kind.sigs.k8s.io/



```bash
kind --version
kind create cluster --name first-cluster
kuberctl cluster-info --context kind-first-cluster

# constainer act as a node(small vm)

if you do docker ps
CONTAINER ID   IMAGE                  COMMAND                  CREATED      STATUS       PORTS                       NAMES
33858a541e6c   kindest/node:v1.35.0   "/usr/local/bin/entr…"   9 days ago   Up 7 hours   127.0.0.1:38197->6443/tcp   first-cluster-control-plane

Now that this is working as a node. You can go inside it like you do in ssh to access the os
for that you use :=

docker exec -it first-cluster-control-plane sh
# ls
LICENSES  bin  boot  dev  etc  home  kind  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
# pwd 
/
# ls -lrt 
total 56

cd /etc/kubernetes/manifests
# ls -lrt
total 16
-rw------- 1 root root 2622 Mar 23 19:22 etcd.yaml
-rw------- 1 root root 3968 Mar 23 19:22 kube-apiserver.yaml
-rw------- 1 root root 3502 Mar 23 19:22 kube-controller-manager.yaml
-rw------- 1 root root 1726 Mar 23 19:22 kube-scheduler.yaml

```

```bash

kind get cluster 


for multi clusters running we will use a config file 

kind create cluster --name=multi-node --config=config.yml
Creating cluster "multi-node" ...
 ✓ Ensuring node image (kindest/node:v1.35.0) 🖼
 ✓ Preparing nodes 📦 📦 📦 📦  
 ✓ Writing configuration 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
 ✓ Joining worker nodes 🚜 
Set kubectl context to "kind-multi-node"
You can now use your cluster with:

kubectl cluster-info --context kind-multi-node

Thanks for using kind! 😊

```

```
kubectl cluster-info --context kind-multi-node
Kubernetes control plane is running at https://127.0.0.1:46803
CoreDNS is running at https://127.0.0.1:46803/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

```