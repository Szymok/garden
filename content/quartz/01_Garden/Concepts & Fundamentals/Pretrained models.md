---
title: Pretrained Models (Modele Wstępnie Wytrenowane)
created: 2026-02-04
status: evergreen
category: Artificial Intelligence
difficulty: intermediate
language: pl
tags:
  - machine-learning
  - deep-learning
  - transfer-learning
  - bert
  - gpt
aliases:
  - Pretrained models
  - Modele fundacyjne
---
# 🎯 Definicja
**Pretrained Model** to model AI, który "już coś umie". Został nauczony na ogromnych zbiorach danych (np. całym internecie lub milionach zdjęć) przez giganta technologicznego (Google, Meta, OpenAI). Pobierasz go i używasz, zamiast uczyć własny model od zera przez 100 lat.

# 🔑 Kluczowe punkty
- **Fundament:** To baza dla [[Transfer Learning]]. Bierzesz model, który umie "rozpoznawać kształty" (ImageNet) i douczasz go "rozpoznawać raka płuc" (Twoje dane).
- **Przykłady:** BERT (tekst), ResNet (obraz), GPT (generacja tekstu), Whisper (mowa).
- **Oszczędność:** Nie potrzebujesz superkomputera, żeby zacząć.

# 📚 Szczegółowe wyjaśnienie
Trenowanie modelu takiego jak GPT-4 kosztuje miliony dolarów.
Użycie modelu pretrained kosztuje grosze (lub zero, jeśli jest open-source na Hugging Face).
Możesz go użyć w trybie:
1.  **Zero-Shot:** Bez zmian ("Opisz to zdjęcie").
2.  **Fine-Tuning:** Lekkie douczenie na Twoich danych.

# 💡 Przykład zastosowania
Chcesz zbudować system do analizy sentymentu recenzji hoteli po polsku.
Zamiast budować sieć neuronową od zera:
1.  Pobierasz **HerBERT** (polski model BERT) z Hugging Face.
2.  Pokazujesz mu 500 przykładowych recenzji (Pozytywna/Negatywna).
3.  Gotowe. Masz system o skuteczności 95%.

## 📌 Źródła
- Hugging Face Model Hub.

## 👽 Brudnopis
- "Don't be a hero". W 99% przypadków nie powinieneś trenować modelu od zera. Zacznij od pretrained.