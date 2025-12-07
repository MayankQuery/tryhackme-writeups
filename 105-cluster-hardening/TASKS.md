# TryHackMe – Cluster Hardening  
## Task Answers

### **Task 1 – Introduction**
No answer needed.

---

### **Task 2 – Kubernetes Cluster Hardening**
Q: What lives at the highest level of Kubernetes architecture?  
A: Kubernetes cluster

Q: What mindset is always beneficial?  
A: Security-first

---

### **Task 3 – Security Benchmarks**
Q: What standards check a cluster’s level of security?  
A: security benchmarks

Q: Which CIS benchmark disables anonymous traffic?  
A: 4.2.1

Q: What tool performs automated Kubernetes security checks?  
A: Kube-bench

---

### **Task 4 – Securing Kubelet**
Q: Which port serves kubelet-api?  
A: 10250

Q: What value should be set to false?  
A: authentication:anonymous:enabled

Q: Other authentication method besides X509?  
A: API Bearer Token

---

### **Task 5 – Securing API Traffic**
Q: Which component is both server and client?  
A: Kube-apiserver

Q: CIS benchmarks implemented by TLS?  
A: 1.2.24 - 27

---

### **Task 6 – Admission Controllers**
Q: Which type can modify objects?  
A: Mutating

Q: Which built-in prevents event flooding?  
A: EventRateLimit

Q: What enforces custom security standards?  
A: Admission Controller Webhooks

Q: Names of two webhook callers?  
A: ValidatingAdmissionWebhook, MutatingAdmissionWebhook

---

### **Task 7 – Securing Network Traffic**
Q: Resource to restrict pod-to-pod communication?  
A: NetworkPolicy

Q: Field to restrict traffic to database label?  
A: spec:PodSelector:matchLabels:app

---

### **Task 8 – Practical**
Q: Encoded Policy?  
A:
```
U3BlYzoKICBQb2RTZWxlY3RvcjogICAgIGFwcD1iYWNrZW5kLXNlcnZpY2UyCiAgQWxsb3dpbmcgaW5ncmVzcyB0cmFmZmljOgogICAgVG8gUG9ydDogODg4OC9UQ1AKICAgIEZyb206CiAgICAgIFBvZFNlbGVjdG9yOiBhcHA9YmFja2VuZC1zZXJ2aWNlMQogIE5vdCBhZmZlY3RpbmcgZWdyZXNzIHRyYWZmaWMKICBQb2xpY3kgVHlwZXM6IEluZ3Jlc3M=
```
