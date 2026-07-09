---
title: Kubernetes (K8s)
created: 2026-05-06
status: 🌱 draft
category: DevOps
difficulty: zaawansowany
language: pl
tags:
  - kubernetes
  - k8s
  - orkiestracja
  - konteneryzacja
  - devops
  - cloud
aliases:
  - K8s
  - Container Orchestration
  - Orkiestracja kontenerów
---

# 🎯 Definicja

**Kubernetes** (K8s) to system orkiestracji kontenerów open-source, który automatyzuje wdrażanie, skalowanie i zarządzanie aplikacjami kontenerowymi ([[Docker|konteneryzowanymi]]). Kubernetes decyduje gdzie uruchomić kontenery, restartuje je przy awarii i skaluje w górę/dół zgodnie z obciążeniem.

# 🔑 Kluczowe punkty

- **Pod**: najmniejsza jednostka — jeden lub kilka powiązanych kontenerów
- **Node**: fizyczna/wirtualna maszyna w klastrze
- **Cluster**: zbiór node'ów zarządzanych przez K8s
- **Deployment**: deklaratywny opis pożądanego stanu aplikacji
- **Service**: stały endpoint sieciowy do grupy podów
- **Helm**: menedżer pakietów dla K8s (jak apt/brew dla K8s)
- **[[Ataccama|Ataccama]] ONE** na produkcji wdraża się przez Helm charts na K8s

# 📚 Szczegółowe wyjaśnienie

## Architektura klastra

```
┌─────────────────────────────┐
│        Control Plane         │
│  API Server | etcd | Scheduler│
└──────────────┬───────────────┘
               │
    ┌──────────┼──────────┐
    ▼          ▼          ▼
┌────────┐ ┌────────┐ ┌────────┐
│ Node 1 │ │ Node 2 │ │ Node 3 │
│ Pod A  │ │ Pod B  │ │ Pod C  │
│ Pod B  │ │ Pod D  │ │ Pod A  │
└────────┘ └────────┘ └────────┘
```

## Kluczowe obiekty

```yaml
# Deployment — 3 repliki aplikacji
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ataccama-web
spec:
  replicas: 3
  selector:
    matchLabels:
      app: ataccama-web
  template:
    spec:
      containers:
      - name: web
        image: ataccama/one:14.0
        resources:
          requests:
            memory: "2Gi"
            cpu: "500m"
          limits:
            memory: "4Gi"
            cpu: "2000m"
```

## kubectl — kluczowe komendy

```bash
kubectl get pods                    # lista podów
kubectl describe pod <name>         # szczegóły poda
kubectl logs <pod-name>             # logi
kubectl exec -it <pod> -- bash      # wejście do poda
kubectl apply -f deployment.yaml    # zastosowanie manifestu
kubectl scale deployment/app --replicas=5  # skalowanie
```

## Helm — instalacja Ataccamy

```bash
helm repo add ataccama https://charts.ataccama.com
helm install ataccama-one ataccama/one \
  --namespace ataccama \
  --values my-values.yaml
```

# 💡 Przykład zastosowania

**[[Ataccama|Ataccama]] w chmurze klienta**: klient instaluje [[Ataccama|Ataccama]] ONE na AWS EKS (Elastic Kubernetes Service). Helm chart definiuje wszystkie komponenty (DPE, web aplikacja, [[Keycloak|Keycloak]], PostgreSQL). K8s restartuje automatycznie pody które się zawiesiły i skaluje DPE w górę gdy rosnie wolumen danych do przetworzenia.

# 📌 Źródła

- [[Docker]]
- [[DevOps]]
- [[Self-Managed Deployment (Ataccama)]]
- [[Ataccama Infrastructure Environment - Cloud-Managed Databases]]
- [[CI/CD]]

# 👽 Brudnopis
