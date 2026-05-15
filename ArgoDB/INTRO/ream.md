
# Chapter 1: Intro to GitOps & ArgoCD

## 1.1 What is GitOps?

GitOps is a modern approach to **continuous delivery (CD)** for Kubernetes and cloud-native applications. It uses Git repositories as the single source of truth for declaring the desired state of your system.

Instead of manually deploying or configuring applications, everything (apps, infrastructure, policies) is written as **declarative code** (YAML/JSON) and stored in Git. A GitOps operator (like ArgoCD) continuously ensures the cluster matches what’s in Git.

**Simple analogy:** Think of Git as your “recipe book” for infrastructure and applications. ArgoCD is the “chef” that ensures the cluster (kitchen) always follows the latest recipe from Git.

---

## 1.2 GitOps Principles

GitOps is built on four key principles: (DVAO Principle)

1. **Declarative**

   * The desired state of the system is described declaratively (e.g., YAML manifests).
   * Example: A Deployment manifest defines how many replicas and which container image.

2. **Versioned & Immutable**

   * Desired state is stored in Git (or another versioned system).
   * Every change is auditable and traceable.

3. **Automated**

   * A controller (like ArgoCD) continuously watches Git and the cluster.
   * If there’s drift (difference), it automatically applies changes.

4. **Observable**

   * System health and deployment status are visible.
   * Git history + dashboards + alerts provide observability.

---

## 1.3 GitOps vs Traditional CI/CD

| Feature                | Traditional CI/CD (Jenkins, GitLab CI)            | GitOps (ArgoCD, FluxCD)                               |
| ---------------------- | ------------------------------------------------- | ----------------------------------------------------- |
| **Pipeline Direction** | CI/CD pipelines push changes into cluster (push)  | Cluster pulls changes from Git (pull)                 |
| **Source of Truth**    | CI/CD pipeline definitions                        | Git repo (manifests, Helm charts, Kustomize, etc.)    |
| **Security Model**     | CI/CD needs cluster credentials (risk of leakage) | GitOps tools run in-cluster, no external creds needed |
| **Rollback**           | Re-run pipeline with old commit (manual)          | Checkout old Git commit → cluster auto-rolls back     |
| **Drift Detection**    | Manual, often missed                              | Continuous monitoring, auto-healing                   |
| **Auditability**       | Logs in CI/CD server                              | Git history (clear, versioned, signed if needed)      |

**In short:** GitOps reduces manual errors, improves security, and ensures production always matches Git.

---

Happy Learning!