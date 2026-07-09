---
title: Understanding Key Features of EC2
created: 2026-01-15
status: 🌱 draft
category: 
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# 🎯 Definicja
**Amazon EC2** (Elastic Compute Cloud) to usługa chmurowa udostępniająca skalowalną moc obliczeniową w formie wirtualnych serwerów. Pozwala firmom na wynajmowanie mocy obliczeniowej zamiast posiadania i utrzymywania własnego sprzętu fizycznego.

# 🔑 Kluczowe punkty
- **Typy instancji:**
  - **General Purpose:** Balans procesora, pamięci i sieci.
  - **Compute Optimized:** Dla zadań wymagających dużej mocy obliczeniowej (np. serwery gier).
  - **Memory Optimized:** Dla aplikacji operujących na dużych zbiorach danych w pamięci RAM.
  - **Storage Optimized:** Dla szybkich operacji wejścia/wyjścia (bazy danych).
  - **Accelerated Computing:** Wykorzystuje GPU (machine learning, renderowanie 3D).
- **Elastyczność:** Możliwość uruchamiania i zatrzymywania instancji w dowolnym momencie.
- **Model płatności:** Pay-as-you-go (płacisz tylko za to, co faktycznie wykorzystasz).

# 📚 Szczegółowe wyjaśnienie
EC2 zapewnia pełną kontrolę nad systemem operacyjnym i konfiguracją aplikacji, podczas gdy AWS zarządza warstwą fizyczną. Kluczowe funkcje wspierające to:
- **Autoscaling:** Automatyczne dostosowywanie liczby serwerów do aktualnego zapotrzebowania.
- **Load Balancing:** Rozdzielanie ruchu na wiele instancji w celu zwiększenia wydajności i niezawodności aplikacji.

# 💡 Przykład zastosowania
- **Hosting stron www:** Uruchomienie serwera Apache/Nginx na instancji typu General Purpose.
- **Analiza Big Data:** Użycie instancji Memory Optimized do szybkiego przetwarzania danych w Sparku.
- **Machine Learning:** Wykorzystanie instancji Accelerated Computing do trenowania modeli sieci neuronowych.

## 📌 Źródła

## 👽 Brudnopis
EC2 is one of the most widely used AWS services because it gives businesses flexible and scalable computing power. Now, we'll break down what EC2 is, the different instance types, key features, and pricing models. Amazon EC2, or Elastic Compute Cloud, is a cloud‑based virtual server service. So instead of you owning physical servers, you can rent computing power as needed. With EC2, you get control over how your applications run, while AWS handles the underlying infrastructure. And you can start and stop instances when you want, making it flexible for different workloads. And if you have different traffic patterns, you can scale to make your applications highly available. Now AWS offers different EC2 instance types based on your workload required. Now we have general purpose. This is a balance of compute, memory, and networking for everyday applications. We have compute optimized. This is best for applications that need high processing power like gaming servers. Then we have memory optimized. This is ideal for applications that need a lot of memory like big data processing. We have storage optimized. This is designed for workloads that need fast and large‑scale storage, such as databases. And last, we have accelerated computing. This uses GPUs or other hardware for machine learning and 3D rendering. So as you can see, choosing the right instance type helps optimize cost and performance. AWS EC2 includes several features to boost efficiency and performance. You have autoscaling, so this ensures that your application has the right number of servers to handle the right demand. We have load balancing, and this spreads traffic across multiple instances to improve the performance and reliability of your application. And the great thing about this is you have pay‑as‑you‑go pricing, so you only pay for the computing power you use, making it very cost effective for you or your business. Now these features help businesses run applications smoothly while keeping costs manageable. Now, AWS offers different EC2 pricing models to match different businesses' needs. We have on‑demand instances, so you pay only for what you use with no long‑term commitment. We have reserved instances. You can commit to a longer term contract for up to 75% savings. We have spot instances. So this is where you buy unused capacity at a lower cost, but the instances may be interrupted. And then you have savings plan. Now this is flexible pricing with discounts for consistent uses of your instances. So selecting the right pricing model here helps optimize cloud spending based on how frequently you need computing power because EC2 is a powerful service that gives your business control over their computing needs without the hassle of maintaining the physical hardware. So with the different instance types, the built in performance features, and flexible pricing models, EC2 is a very scalable solution for a wide range of applications.