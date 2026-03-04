---
title: How Does AWS Support Containerized Applications (Konteneryzacja w AWS)
created: 2026-02-04
status: evergreen
category: Cloud Computing
difficulty: intermediate
language: pl
tags:
  - aws
  - docker
  - ecs
  - eks
  - fargate
aliases:
  - Kontenery w AWS
  - ECS vs EKS
---
# 🎯 Definicja
AWS oferuje trzy główne sposoby uruchamiania aplikacji w kontenerach (Docker):
1.  **ECS (Elastic Container Service):** Prosty, natywny orkiestrator AWS.
2.  **EKS (Elastic Kubernetes Service):** Zarządzany Kubernetes (dla tych, którzy potrzebują K8s).
3.  **Fargate:** Model "Serverless" dla kontenerów (nie zarządzasz serwerami, płacisz za CPU/RAM dla kontenera).

# 🔑 Kluczowe punkty
- **ECS:** Idealny dla firm "All-in on AWS". Głęboka integracja z innymi usługami AWS. Prostszy niż K8s.
- **EKS:** Standard przemysłowy. Pozwala na przenoszenie aplikacji między chmurami (AWS <-> Azure <-> On-premise). Trudniejszy w obsłudze.
- **Fargate:** To nie orkiestrator, to "typ uruchomienia" (Launch Type). Możesz użyć ECS z Fargate lub EKS z Fargate. Odpada martwienie się o patchowanie serwerów (EC2).

# 📚 Szczegółowe wyjaśnienie
W klasycznym podejściu (EC2) musisz dbać o system operacyjny (Updaty, Security patche).
W kontenerach pakujesz aplikację ze wszystkimi bibliotekami.
- Jeśli wybierzesz **ECS na EC2**: Ty zarządzasz klastrem maszyn, AWS zarządza kontenerami.
- Jeśli wybierzesz **ECS na Fargate**: AWS zarządza maszynami I kontenerami. Ty dostarczasz tylko obraz Dockera.

# 💡 Przykład zastosowania
Startup buduje mikroserwisy.
Nie chcą zatrudniać sztabu DevOpsów do Kubernetesa.
Wybierają **ECS + Fargate**.
Wrzucają obrazy Dockerowe do ECR (Elastic Container Registry), definiują Task Definition (ile RAM/CPU) i AWS odpala to automatycznie, skalując w górę przy dużym ruchu.

## 📌 Źródła
- AWS Containers documentation.

## 👽 Brudnopis
- Fargate jest zazwyczaj droższy niż EC2 (Spot Instances), ale oszczędza masę czasu ludzkiego (TCO - Total Cost of Ownership).