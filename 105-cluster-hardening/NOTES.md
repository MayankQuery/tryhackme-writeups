# Notes – Cluster Hardening (TryHackMe)

## 1. Cluster Hardening
- A Kubernetes cluster is the highest component of the architecture.
- Hardening means reducing vulnerabilities, misconfigurations, and insecure defaults.
- A security-first mindset is recommended while building clusters.

---

## 2. Security Benchmarks (CIS)
- CIS provides industry-standard benchmarks.
- Kubernetes CIS examples:
  - 4.2.1 Disable anonymous-auth on Kubelet.
  - 1.2.25 Configure TLS cert and key for API server.
  - 5.3.2 Ensure each namespace has NetworkPolicies.
- Kube-bench:
  - Open-source tool to automate CIS benchmark checks.
  - Detects Kubernetes version and maps to CIS automatically.

---

## 3. Securing Kubelet
Ports:
- **10250** – Full kubelet API access (must be secured).
- **10255** – Read-only (deprecated, unauthenticated).

Key settings:
- `authentication: anonymous: enabled: false`
- Authentication methods:
  - X509 Client Certificate
  - API Bearer Token
- Kubelet must only accept traffic from the API server.

---

## 4. Securing API Traffic
API communication is entirely TLS-based.

Components acting as:
- **Both client & server**: kube-apiserver
- **Server only**: etcd, kubelet
- **Clients**: scheduler, controller-manager, users, kube-proxy

TLS implementation:
- Generate CA, server cert, client certs.
- Configure in the component YAML (`--client-ca-file`, `--tls-private-key-file`, etc.).
- Implements CIS benchmarks 1.2.24–1.2.27.

---

## 5. Admission Controllers
Types:
- **Mutating**: Modify request objects before persistence.
- **Validating**: Approve or reject objects based on policies.

Built-in examples:
- AlwaysPullImages
- EventRateLimit
- ServiceAccount

Custom Admission Controllers:
- Implemented via **Admission Webhooks**.
- Called by:
  - ValidatingAdmissionWebhook
  - MutatingAdmissionWebhook

---

## 6. Securing Network Traffic
Pods in a Kubernetes cluster share a virtual network.
Not all should communicate.

Use **NetworkPolicy** to restrict:
- Ingress (incoming traffic)
- Egress (outgoing traffic)

Example structure:
```
spec:
  podSelector:
    matchLabels:
      app: target-app
  policyTypes:
    - Ingress
  ingress:
    - from:
      - podSelector:
          matchLabels:
            app: allowed-app
      ports:
        - port: 8080
```

CIS 5.3.2: Ensure all namespaces have NetworkPolicies.

---

## 7. Practical Task Summary
Objective:
- Restrict ingress to backend-service2, allowing only backend-service1.

Final encoded answer:
```
U3BlYzoKICBQb2RTZWxlY3RvcjogICAgIGFwcD1iYWNrZW5kLXNlcnZpY2UyCiAgQWxsb3dpbmcgaW5ncmVzcyB0cmFmZmljOgogICAgVG8gUG9ydDogODg4OC9UQ1AKICAgIEZyb206CiAgICAgIFBvZFNlbGVjdG9yOiBhcHA9YmFja2VuZC1zZXJ2aWNlMQogIE5vdCBhZmZlY3RpbmcgZWdyZXNzIHRyYWZmaWMKICBQb2xpY3kgVHlwZXM6IEluZ3Jlc3M=
```
