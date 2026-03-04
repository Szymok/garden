---
title: AWS Compute Services
created: 2026-02-04
status: evergreen
category: AWS / Compute
difficulty: basic
language: en
tags:
  - aws
  - compute
  - ec2
  - lambda
  - ecs
  - eks
aliases:
  - Usługi Obliczeniowe AWS
  - Cloud Compute
---
# 🎯 Definicja
**AWS Compute Services** to "silniki" chmury.
Zamiast kupować fizyczny serwer, wynajmujesz moc obliczeniową (procesor, RAM) na żądanie.

# 🔑 Kluczowe punkty
- **EC2:** Wirtualne maszyny (Czysty serwer).
- **Lambda:** Serverless (Tylko kod, nie obchodzą Cię serwery).
- **ECS/EKS:** Kontenery (Docker/Kubernetes).

# 📚 Szczegółowe wyjaśnienie
1.  **EC2 (Elastic Compute Cloud):** Jak wynajęty laptop. Masz pełną kontrolę nad systemem operacyjnym. Dobry do wszystkiego, ale musisz zarządzać systemem.
2.  **Lambda:** Jak funkcja w Excelu. Uruchamia się, gdy coś się stanie (np. ktoś wgra plik), robi swoje i znika. Płacisz za milisekundy pracy. Idealne do przetwarzania zdarzeń.
3.  **ECS (Elastic Container Service):** Łatwy sposób na uruchomienie Dockerów.
4.  **EKS (Elastic Kubernetes Service):** Trudny sposób na uruchomienie Dockerów (Kubernetes), ale daje pełną kontrolę nad orkiestracją.

# 💡 Przykład zastosowania
- Strona internetowa WordPress -> **EC2**.
- Przetwarzanie miniaturki zdjęcia po wgraniu -> **Lambda**.
- Mikroserwisy banku (setki usług) -> **EKS**.

## 📌 Źródła
- AWS Compute Blog.

## 👽 Brudnopis
- Compute to zazwyczaj największa część rachunku za chmurę. Wybór odpowiedniego modelu (Serverless vs EC2) decyduje o kosztach.
