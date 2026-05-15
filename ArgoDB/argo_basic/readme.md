# Chapter 2: ArgoCD Basics

## 2.1 Why ArgoCD for GitOps?

* **Purpose-built for Kubernetes**: ArgoCD is a Kubernetes controller, native to the ecosystem.
* **Declarative + GitOps**: Uses Git repos as the source of truth.
* **Multi-cluster ready**: Manage multiple clusters from one ArgoCD instance.
* **UI + CLI + API**: Rich user interface and automation APIs.
* **Security**: In-cluster controller, supports RBAC, SSO, audit logs.
* **Ecosystem**: Part of Argo Project (with Workflows, Rollouts, Events).

ArgoCD makes GitOps adoption beginner-friendly and production-grade.

---

## 2.2 ArgoCD vs FluxCD vs Jenkins X

| Tool          | Strengths                                                             | Weaknesses                                                         |
| ------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------ |
| **ArgoCD**    | UI, multi-cluster support, app-centric model, notifications, rollouts | Slightly heavier footprint, mainly K8s-focused                     |
| **FluxCD**    | Lightweight, GitOps-first, good Helm/Kustomize support                | No UI (only CLI/alerts), app model less visual                     |
| **Jenkins X** | GitOps + CI/CD combined, integrates with Tekton pipelines             | Complex, heavy, opinionated, less adoption compared to ArgoCD/Flux |

---

## 2.3 ArgoCD Architecture

![ArgoCD Architecture](https://argo-cd.readthedocs.io/en/stable/assets/argocd_architecture.png)

**Core components:**

1. **API Server**

   * Frontend for CLI/UI/REST/gRPC.
   * Handles RBAC, authentication, and API requests.

2. **Repo Server**

   * Connects to Git repos.
   * Fetches manifests (raw YAML, Helm templates, Kustomize overlays).
   * Caches and serves manifests to the Application Controller.

3. **Application Controller**

   * The brain of ArgoCD.
   * Continuously compares desired state (from Git) with live state (in cluster).
   * Applies changes (sync), monitors health, handles rollbacks.

4. **UI / CLI**

   * **UI**: Visual dashboard for apps, sync status, health.
   * **CLI (`argocd`)**: Automation and scripting support.

---

## 2.4 Key ArgoCD Concepts

### 1. **Application**

* The core ArgoCD object.
* Links a Git repo → path → cluster → namespace.
* Represents a deployed app.

### 2. **Project**

* Logical grouping of Applications.
* Defines RBAC, repo access, cluster targets.
* Example: `team-a` project can only deploy apps to `team-a-*` namespaces.

### 3. **Repositories**

* Git repos registered with ArgoCD.
* Can store Helm charts, Kustomize overlays, or raw manifests.

### 4. **Health Status**

* **Healthy**: Desired state = live state.
* **Degraded**: App not working (e.g., CrashLoopBackOff).
* **Progressing**: App is deploying.
* **Missing**: Resource expected but not found.

### 5. **Rollbacks**

* ArgoCD keeps app history. 
* You can rollback to a previous healthy revision.

### 6. **Auto-Healing**

* If drift is detected (e.g., a pod deleted manually), ArgoCD restores it.
* Demo: `kubectl delete pod <pod>` → ArgoCD recreates it.

### 7. **Sync & Sync Policies**

* **Manual**: User clicks/CLI `argocd app sync`.
* **Automatic**: ArgoCD auto-applies Git changes.
* **Sync Waves**: Control order of resource sync (e.g., DB before App).
* **Sync Hooks**: Custom scripts/jobs at sync phases:

  * **PreSync** → before sync.
  * **Sync** → during sync.
  * **PostSync** → after sync.
  * **SyncFail** → if sync fails.

* **Flags**:

  * `--prune` → delete resources not in Git.
  * `--replace` → force re-create instead of patch.

### 8. **Sync Options**

* **Skip Schema Validation**: Skip Kubernetes schema validation.
* **Auto-Create Namespace**: If namespace doesn’t exist, create it.
* **Prune Last**: Delete resources at end of sync (safer order).
* **Apply Out of Sync Only**: Only apply changed resources.
* **Respect Ignore Differences**: Don’t overwrite ignored fields.
* **Server-Side Apply**: Use Kubernetes server-side apply for merges.

---

## 2.5 Summary

* GitOps makes Git the source of truth.
* ArgoCD implements GitOps with continuous reconciliation.
* Core components: API Server, Repo Server, App Controller, UI/CLI.
* Key concepts: Applications, Projects, Health, Sync, Rollbacks, Auto-healing.
* Compared to Flux and Jenkins X, ArgoCD provides the most visual and app-centric GitOps experience.


---

Happy Learning!