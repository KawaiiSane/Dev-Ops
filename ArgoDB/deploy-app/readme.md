# Chapter 4: First App Deployment with ArgoCD

In this chapter, we will learn how to deploy applications with ArgoCD using **three different approaches**:  

1. **UI Approach** → NGINX example  
2. **CLI Approach** → Apache example  
3. **Declarative Approach** → Online Shop example  

Each method has its use cases, but only the **Declarative approach** aligns with the principles of GitOps.  

---

## Fork and Clone this Git Repository into local system

1. First Fork it into your GitHub Account:

   Go to below url, and fork it:

      ```bash
      https://github.com/Amitabh-DevOps/argocd-demos.git
      ```

2. Then clone it, into your Local system

      ```bash
      git clone https://github.com/<your-username>/argocd-demos.git
      ```   

Replace `<your-username>` with your GitHub Username.

This repo contains the manifest files that are need to apply all three approaches

---

##  Learning Paths

We will explore three different methods to deploy applications using ArgoCD. Each method has its own advantages and is suited for different scenarios.

👉 Click below to explore each approach step by step:

1. [UI Approach (NGINX Example)](./ui_approach/nginx/README.md)  
   - Deploy app via ArgoCD Dashboard  
   - Good for beginners and demos  

2. [CLI Approach (Apache Example)](./cli_approach/apache/README.md)  
   - Deploy app via ArgoCD CLI (`argocd app create`)  
   - Good for admins and operators  

3. [Declarative Approach (Online Shop Example)](./declarative_approach/online_shop/README.md)  
   - Deploy app via **Application CRD (YAML in Git)**  
   - True GitOps → reproducible, auditable, production-ready  

---

##  Comparison: UI vs CLI vs Declarative Approaches

| Approach       | How App is Created | Where Config Lives | Best For | Limitations |
|----------------|-------------------|--------------------|----------|-------------|
| **UI** (NGINX) | Create app via **ArgoCD Dashboard** | In **Cluster only** | Learning, demos, POCs | Not reproducible, not version-controlled |
| **CLI** (Apache) | `argocd app create ...` via **CLI** | In **Cluster only** | Operators, quick scripting | Still imperative, config not in Git |
| **Declarative** (Online Shop) | Apply **Application CRD YAML** | In **Git + Cluster** | Production, teams, real GitOps | Initial setup effort needed |

---

##  Key Takeaways

- **UI** → Fast & visual → great for learning, but **not GitOps**.  
- **CLI** → Scriptable & powerful → better than UI, but still **imperative**.  
- **Declarative** → Version-controlled & reproducible → the **true GitOps way** (what you’ll use in production).  

---

Happy Learning