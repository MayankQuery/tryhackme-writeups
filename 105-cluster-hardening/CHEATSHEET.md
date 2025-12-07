# Cluster Hardening Cheatsheet

## CIS Benchmarks
- Disable Kubelet anonymous auth → 4.2.1  
- Ensure TLS cert/key on API server → 1.2.25  
- Ensure all namespaces have NetworkPolicies → 5.3.2  
- Use kube-bench to validate compliance  

Command:
```
kube-bench run
```

---

## Kubelet Security
Disable anonymous traffic:
```
authentication:
  anonymous:
    enabled: false
```

Two authentication methods:
- X509 Client Certificate
- API Bearer Token

Kubelet API Port:
- 10250 (full access)

---

## API TLS Security
Generate cert:
```
openssl genrsa -out key.key 2048
openssl req -new -key key.key -subj "/CN=<component>" -out csr.csr
openssl x509 -req -in csr.csr -signkey key.key -out cert.crt -days 365
```

API server config:
```
--client-ca-file=/var/lib/certs/ca.crt
--tls-cert-file=/var/lib/certs/server.crt
--tls-private-key-file=/var/lib/certs/server.key
```

---

## Admission Controllers
Types:
- Mutating
- Validating

Callers:
- ValidatingAdmissionWebhook
- MutatingAdmissionWebhook

Enable built-in:
```
--admission-control=AlwaysPullImages,EventRateLimit,ServiceAccount
```

---

## Network Policies
Basic deny ingress:
```
kind: NetworkPolicy
spec:
  podSelector:
    matchLabels:
      app: target
  policyTypes:
  - Ingress
```

Allow only specific pod traffic:
```
ingress:
- from:
  - podSelector:
      matchLabels:
        app: allowed-pod
  ports:
  - port: 8080
```

Apply:
```
kubectl apply -f policy.yaml
```

Check:
```
kubectl describe networkpolicy <name>
```
