---
title: Deployment Modeli ML (Wdrażanie Modeli)
created: 2026-02-04
status: evergreen
category: MLOps
difficulty: intermediate
language: pl
tags:
  - mlops
  - deployment
  - inference
  - production
aliases:
  - Wdrażanie Modeli
  - Model Serving
  - Produkcyjne ML
---
# 🎯 Definicja
**Deployment Modeli** to proces przenoszenia modelu uczenia maszynowego ze środowiska badawczego (Jupyter Notebook) na środowisko produkcyjne, gdzie może on generować predykcje (Inference) dla realnych użytkowników lub systemów. To moment, w którym model zaczyna przynosić wartość biznesową.

# 🔑 Kluczowe punkty
- **Tryby:**
    - **Batch:** Model przelicza miliony rekordów raz na noc (np. Scoring klienta).
    - **Real-Time (Online):** Model wystawiony jako API (REST/gRPC), odpowiada w milisekundach (np. rekomendacja filmu, detekcja fraudu przy płatności).
    - **Edge:** Model działa na urządzeniu (telefon, kamera), bez internetu.
- **Monitoring:** Wdrożenie to nie koniec. Trzeba monitorować **Data Drift** (czy dane się zmieniły?) i **Model Decay** (czy model "głupieje"?).

# 📚 Szczegółowe wyjaśnienie
Samo wytrenowanie modelu (`model.fit()`) to prosta część. Deployment wymaga:
1.  **Konteneryzacji:** Spakowania modelu i zależności (Docker).
2.  **Orkiestracji:** Zarządzania skalowaniem (Kubernetes/KServe).
3.  **Wersjonowania:** Jaka wersja modelu działa? (MLflow Model Registry).
4.  **Testowania:** Shadow Deployment (model działa "na cicho", porównujemy go ze starym), Canary Deployment (tylko 5% ruchu idzie na nowy model).

# 💡 Przykład zastosowania
System rekomendacji Netflixa.
1.  Data Scientists trenują model na historii oglądania.
2.  Nowy model trafia do Model Registry.
3.  Pipeline CI/CD pakuje go do kontenera i wrzuca na serwery.
4.  Gdy odpalasz aplikację, strzela ona do API z Twoim ID.
5.  Model w czasie rzeczywistym zwraca listę "Polecane dla Ciebie".

## 📌 Źródła
- "Machine Learning Engineering" - Andriy Burkov.
- "Designing Machine Learning Systems" - Chip Huyen.

## 👽 Brudnopis
- MLOps to DevOps dla ML.
- Częsty błąd: skrypt Pythona z notebooka wrzucony na produkcję ("To działa u mnie").