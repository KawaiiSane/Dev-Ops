# CLI Approach with ArgoCD (Apache Example)

In this approach, we will deploy an application using the **ArgoCD CLI**.  
We’ll use a simple **Apache HTTPD Deployment + Service** to understand how ArgoCD can be controlled from the terminal.

---

## Theory

- In the **CLI approach**, we use the `argocd app create` command to define applications.  
- This command creates an `Application` resource (CRD) inside the cluster on our behalf.  
- The app definition lives **only in the cluster**, not in Git.  
- It’s fast and powerful for admins, but still **not true GitOps**, because changes are not version-controlled.  

> ⚠️ Important: The ArgoCD **Server** (installed in the cluster) must always be running.  
> The **CLI is only a client tool** that talks to the server’s API (just like `kubectl` talks to the Kubernetes API).  
> Without the server, the CLI cannot deploy or sync applications.  

> ✅ Best practice: Use the **Declarative approach (CRDs in Git)** for production.  
> ❌ The CLI method is best for operators or quick testing.  

---

## Prerequisites

Before you begin, ensure you have:  
1. A **Kind cluster** running  
2. **ArgoCD installed & running** (via Helm or manifests)  
3. **ArgoCD CLI installed**  
4. `kubectl` installed to interact with your cluster  

> Follow this guide to set up ArgoCD: [ArgoCD Setup & Installation](../../../03_setup_installation/README.md)  

---

## Steps to Deploy Apache using ArgoCD CLI

### 1. Open a new VSCode editor & Open that `argocd-demos` repo that you had clonned

Just for manifest files, or making changes or pushing it to git - used while testing all approaches.

In below directory you can see the related manifest files:

  ```bash
  cd argocd-demos/cli_approach/apache
  ````

---

### 📂 Directory Structure

```
cli_approach/apache
├── apache_deployment.yml
└── apache_svc.yml
```

---

### 2. Login to ArgoCD (UI + CLI)

1. First, **login via ArgoCD UI** to make sure the server is running correctly.

   * Forward the argocd-server:

        ```bash
        kubectl port-forward svc/argocd-server -n argocd 8080:443 --address=0.0.0.0 &
        ```

   * Open: [http://\<instance\_public\_ip>:8080](http://<instance_public_ip>:8080)
   * Username: `admin`
   * Password: (fetched from secret)

2. Then, login to ArgoCD using CLI by replacing `<instance_public_ip>` and `<ADMIN_PASSWORD>` :

```bash
argocd login <instance_public_ip>:8080 \
  --username admin \
  --password <ADMIN_PASSWORD> \
  --insecure
```

Verify:

```bash
argocd account get-user-info
```

---

### 3. Add Your Cluster to ArgoCD (if not already added)

Check your config contexts:
```bash
kubectl config get-contexts
```

Identify your cluster context (e.g., `kind-argocd-cluster`).

Add the cluster to ArgoCD:

```bash
argocd cluster add kind-argocd-cluster --name argocd-cluster --insecure
```

Verify:

```bash
argocd cluster list
```

---

### 4. Create Application via CLI

Run this command to create an ArgoCD application:

```bash
argocd app create apache-app \
  --repo https://github.com/<your-username>/argocd-demos.git \
  --path cli_approach/apache \
  --dest-server https://<your_added_cluster_url> \
  --dest-namespace default \
  --sync-policy automated \
  --self-heal \
  --auto-prune
```

* Replace `<your-username>` with your GitHub username.
* Replace `<your_added_cluster_url>` with the cluster you registered (e.g., `https://172.31.xx.xx:port` or `https://kubernetes.default.svc`).


#### Explanation of Flags

  - --repo → Git repo with your manifests.
  - --path → Path in repo where manifests live (manifests/).
  - --dest-server → Target cluster (inside ArgoCD, e.g: https://kubernetes.default.svc = in-cluster).
  - --dest-namespace → Namespace to deploy (e.g., default).
  - --sync-policy automated → Auto-sync enabled.
  - --self-heal → Fix drift if someone changes/deletes resources manually.
  - --auto-prune → Remove resources if they’re deleted from Git.


Verify the app creation:

```bash
argocd app list
```

You should see `apache-app` in the list.

```
NAME               CLUSTER                      NAMESPACE  PROJECT  STATUS  HEALTH   SYNCPOLICY  CONDITIONS  REPO                                                PATH                 TARGET
argocd/apache-app  https://172.31.19.178:33893  default    default  Synced  Healthy  Auto-Prune  <none>      https://github.com/Amitabh-DevOps/argocd-demos.git  cli_approach/apache 
```

and in UI, you can check it is creating:

![apache-app-creating](../output_images/image-5.png)

---

### 5. Verify Application

Check app details:

```bash
argocd app get apache-app
```

Expected output: Shows repo, path, destination, sync status, and health.

![apache-app](../output_images/image-1.png)

---

### 6. Sync the Application

If the app shows **OutOfSync**, run:

```bash
argocd app sync apache-app
```

Expected output:

![apache-sync-app](../output_images/image-6.png)

---

### 7. Verify Deployment in Kubernetes

From CLI:

```bash
kubectl get pods -n default
kubectl get svc -n default
```

You should see:

* Apache pods running (`apache-deployment-xxxx`).
* `apache-service` of type ClusterIP exposing port 80.

![apache-pod-svc-running](../output_images/image-2.png)

---

### 8. Access Apache via Browser

1. Port-forward the Apache service:

```bash
kubectl port-forward svc/apache-service 8082:80 --address=0.0.0.0 &
```

2. Open inbound rule for port `8082` on your EC2 instance.

3. Access the Apache app at:

```
http://<EC2-Public-IP>:8082
```

You should see the default **Apache HTTPD test page**.

![apache-httpd-page](../output_images/image-3.png)

---

## Testing

### Make a Change in Git

1. Open `apache_deployment.yml`.
2. Change the replicas, e.g., `3 → 4`:

```yaml
spec:
  replicas: 4
```

3. Commit & push:

```bash
git add apache_deployment.yml
git commit -m "Scale Apache replicas to 4"
git push origin main
```

### Observe in ArgoCD

```bash
argocd app get apache-app
```

* You’ll see the app go **OutOfSync**, then ArgoCD will sync automatically (because of `--sync-policy automated`).

Verify in Kubernetes:

Refresh the ArgoCD - apache-app using command:

```bash
argocd app get apache-app --hard-refresh
```

```bash
kubectl get pods -n default
```

Now 4 Apache pods should be running.

![apache-4-pod-running](../output_images/image-4.png)

---

## Common ArgoCD CLI Commands

Here are some frequently used argocd commands with their descriptions:

| Command                                                                   | Description                                          |
| ------------------------------------------------------------------------- | ---------------------------------------------------- |
| `argocd login <host>:<port> --username admin --password <pwd> --insecure` | Log in to the ArgoCD API server                      |
| `argocd account get-user-info`                                            | Show info about the currently logged-in user         |
| `argocd cluster list`                                                     | List all clusters registered with ArgoCD             |
| `argocd cluster add <context-name>`                                       | Add a Kubernetes cluster from kubeconfig to ArgoCD   |
| `argocd repo list`                                                        | List connected Git repositories                      |
| `argocd repo add <repo-url>`                                              | Connect a Git repo to ArgoCD                         |
| `argocd app list`                                                         | List all ArgoCD applications                         |
| `argocd app create <app-name> --repo <url> --path <dir> ...`              | Create a new ArgoCD application                      |
| `argocd app get <app-name>`                                               | Get details of an application (status, sync, health) |
| `argocd app sync <app-name>`                                              | Synchronize (deploy) an application                  |
| `argocd app delete <app-name>`                                            | Delete an application from ArgoCD                    |
| `argocd app rollback <app-name> <revision>`                               | Rollback an application to a previous revision       |
| `argocd app set <app-name> --sync-policy automated`                       | Update app settings (e.g., enable auto-sync)         |
| `argocd logout <host>`                                                    | Logout from ArgoCD server                            |


> Tip: You can always run `argocd <command> --help` to see detailed usage and flags.

---

## Destroy 

For complete destroy, you can directly deleter the cluster by using below command:

```bash
kind delete cluster --name argocd-cluster
```

---

## Wrap-Up

* You successfully deployed an app via **ArgoCD CLI**.
* Key takeaway:

  * CLI is powerful for admins/operators.
  * It requires **ArgoCD server to be running** in the cluster.
  * Always login via **UI first → then CLI**.
  * Real GitOps requires **declarative Application CRDs in Git** (covered in the next approach).

Happy Learning!