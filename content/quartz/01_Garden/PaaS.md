---
title: PaaS (Platform as a Service)
created: 2026-02-04
status: seedling
category: Cloud Computing
difficulty: basic
language: en
tags:
  - cloud
  - azure
  - aws
  - deployment
  - infrastructure
aliases:
  - Platform as a Service
  - Platforma jako Usługa
---
# 🎯 Definicja
**PaaS (Platform as a Service)** to model chmurowy, w którym dostawca daje Ci gotowe środowisko do uruchamiania aplikacji (np. bazę danych, serwer WWW), a Ty martwisz się tylko o swój kod i dane. Nie zarządzasz systemem operacyjnym ani sprzętem.

# 🔑 Kluczowe punkty
- **Odpowiedzialność:** Dostawca dba o OS, poprawki (patche), sieć i hardware. Ty dbasz o Aplikację.
- **Szybkość:** Wrzucasz kod i działa. Nie instalujesz Linuxa.
- **Przykłady:** Ataccama ONE PaaS, Azure SQL Database, AWS Elastic Beanstalk, Heroku.

# 📚 Szczegółowe wyjaśnienie
To środek drogi między **IaaS** (gdzie dostajesz pustego wirtualnego peceta i robisz wszystko sam) a **SaaS** (gdzie dostajesz gotowy program jak Gmail i nic nie możesz zmienić w środku).
PaaS jest idealny dla programistów.

# 💡 Przykład zastosowania
Chcesz postawić stronę w Wordpressie.
**IaaS:** Kupujesz VPS, instalujesz Linuxa, Apache, PHP, MySQL, konfigurujesz firewall...
**PaaS:** Klikasz "Create MySQL" i "Create Web App". Wrzucasz pliki Wordpressa. Gotowe.
**SaaS:** Zakładasz konto na WordPress.com.

## 📌 Źródła
- Microsoft Azure - What is PaaS?

## 👽 Brudnopis
- Trend: Serverless to rozwinięcie PaaS, gdzie płacisz tylko za czas wykonania funkcji (np. 100ms), a nie za "włączony serwer".