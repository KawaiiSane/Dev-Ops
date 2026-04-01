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

```

