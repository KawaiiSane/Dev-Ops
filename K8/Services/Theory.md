# Kubernetes Services (README)

## 📌 What is a Service in Kubernetes?

In Kubernetes, a **Service** is an abstraction that exposes a set of Pods as a network service.

Pods are ephemeral (they can die and get recreated with new IPs), so Services provide:

* A **stable IP address**
* **Load balancing** across Pods
* **Service discovery**

---

## 🎯 Why Services Exist

* Pods change IPs frequently
* Need a stable way to communicate
* Need internal & external access
* Need load balancing

---

# 🔥 Types of Kubernetes Services

## 1. ClusterIP (Default)

### ✅ What it does

* Exposes the service **internally within the cluster only**

### ⚙️ How it works

* Assigns a **virtual IP (ClusterIP)**
* Other Pods use this IP to communicate

### 📌 Use Case

* Backend services (API ↔ DB communication)

### 🧾 Example

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: ClusterIP
  selector:
    app: my-app
  ports:
    - port: 80
      targetPort: 8080
```

---

## 2. NodePort

### ✅ What it does

* Exposes the service on a **port of every node**

### 🌐 Access

```
http://<NodeIP>:<NodePort>
```

### ⚙️ Port Range

* Default: `30000–32767`

### 📌 Use Case

* Development/testing environments

### 🧾 Example

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: NodePort
  selector:
    app: my-app
  ports:
    - port: 80
      targetPort: 8080
      nodePort: 30007
```

---

## 3. LoadBalancer

### ✅ What it does

* Exposes the service using a **cloud provider's load balancer**
* Assigns a **public IP**

### 🔁 Traffic Flow

```
User → LoadBalancer → NodePort → Pods
```

### 📌 Use Case

* Production applications (public APIs, websites)

### ⚠️ Note

* Works on cloud platforms (AWS, GCP, Azure)
* Not available by default in local setups (Minikube, Kind)

### 🧾 Example

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: LoadBalancer
  selector:
    app: my-app
  ports:
    - port: 80
      targetPort: 8080
```

---

## 4. ExternalName

### ✅ What it does

* Maps a Kubernetes service to an **external DNS name**

### 📌 Use Case

* Access external APIs or databases

### 🧾 Example

```yaml
apiVersion: v1
kind: Service
metadata:
  name: external-service
spec:
  type: ExternalName
  externalName: api.google.com
```

---

# 🧠 Comparison Table

| Type         | Internal/External | Use Case             | Complexity   |
| ------------ | ----------------- | -------------------- | ------------ |
| ClusterIP    | Internal          | Microservices        | Easy         |
| NodePort     | External          | Testing / Dev        | Medium       |
| LoadBalancer | External          | Production           | Easy (Cloud) |
| ExternalName | External (DNS)    | Third-party services | Easy         |

---

# 🧠 Mental Model

* **ClusterIP** → Internal communication
* **NodePort** → Expose via node IP + port
* **LoadBalancer** → Public entry point
* **ExternalName** → External DNS mapping

---

# ⚡ Tips for Local Kubernetes (Minikube)

### 🚫 LoadBalancer won’t work directly

### ✅ Use alternatives:

#### Option 1: Minikube Service

```bash
minikube service <service-name>
```

#### Option 2: Port Forwarding

```bash
kubectl port-forward service/<service-name> 8080:80
```

---

# 🚀 Summary

Kubernetes Services are essential for:

* Stable networking
* Load balancing
* Exposing applications

Choose the right type based on your use case:

* Internal → ClusterIP
* Dev/Test → NodePort
* Production → LoadBalancer
* External APIs → ExternalName

---

💡 *Understanding Services is key to mastering Kubernetes networking.*
