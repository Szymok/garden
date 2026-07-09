---
title: Transfer Learning
created: 2026-02-04
status: evergreen
category: AI / ML
difficulty: intermediate
language: pl
tags:
  - transfer-learning
  - fine-tuning
  - pretrained-models
  - efficency
aliases:
  - Uczenie transferowe
  - Fine-tuning
---
# 🎯 Definicja
**Transfer Learning** to recykling wiedzy.
Bierzesz model, który uczył się na milionach obrazków (np. rozpoznawać koty, psy, samoloty) i douczasz go na małym zbiorze (np. rozpoznawanie rzadkich grzybów).
Model już "umie patrzeć" (zna kształty, krawędzie). Musi się tylko nauczyć nowej nazwy.

# 🔑 Kluczowe punkty
- **Pre-trained Model:** Model bazowy (np. BERT, ResNet), który "widział wszystko".
- **Fine-tuning:** Lekkie douczanie modelu bazowego na Twoich danych.
- **Oszczędność:** Trenowanie od zera kosztuje $10M. Transfer Learning kosztuje $100.

# 📚 Szczegółowe wyjaśnienie
Większość dzisiejszego AI to Transfer Learning.
[[GPT-4|GPT-4]] to model pre-trenowany na całym internecie.
Kiedy robisz [[RAG|RAG]] albo Few-Shot prompt, korzystasz z jego ogólnej wiedzy.
Kiedy robisz Fine-Tuning GPT na swoich mailach, robisz Transfer Learning, żeby mówił Twoim stylem.

# 💡 Przykład zastosowania
Medycyna.
Nie masz miliona zdjęć rentgenowskich rzadkiej choroby. Masz 500.
Model trenowany od zera na 500 zdjęciach nie zadziała.
Bierzesz model, który widział miliony zdjęć "zwykłych rzeczy". On już wie, jak rozpoznawać tekstury i plamy.
Pokazujesz mu te 500 rentgenów. On uczy się bardzo szybko.
To jak uczenie pianisty gry na organach. Nie musisz go uczyć, gdzie jest "C". Musisz go nauczyć pedałów.

## 📌 Źródła
- Hugging Face Docs - Fine-tuning.

## 👽 Brudnopis
- "Standing on the shoulders of giants". To jest esencja ML dzisiaj. Nikt nie trenuje modeli od zera (chyba że Google/OpenAI).