---
title: Generowanie Danych (Data Generation)
created: 2026-02-04
status: evergreen
category: Data Engineering / AI
difficulty: intermediate
language: pl
tags:
  - synthetic-data
  - testing
  - simulation
  - augmentation
aliases:
  - Dane Syntetyczne
  - Mock Data
  - Synthetic Data
---
# 🎯 Definicja
**Generowanie Danych** (Synthetic Data Generation) to proces tworzenia sztucznych zbiorów danych, które naśladują statystyczne właściwości danych rzeczywistych, ale nie zawierają informacji o prawdziwych osobach ani zdarzeniach. Wykorzystuje się do tego [[Generatywna Sztuczna Inteligencja|GenAI]], proste algorytmy losowe lub specjalistyczne narzędzia (np. Faker).

# 🔑 Kluczowe punkty
- **Prywatność:** Idealne do testów, bo nie zawierają PII (Zero RODO risk).
- **Augmentacja:** Pozwala powiększyć mały zbiór treningowy dla ML.
- **Edge Cases:** Pozwala symulować rzadkie błędy, które na produkcji zdarzają się raz na rok.

# 📚 Szczegółowe wyjaśnienie
Sposoby generowania:
1.  **Rule-based:** "Wylosuj imię z listy A, nazwisko z listy B". (Tanie, szybkie).
2.  **Model-based (GenAI):** "Stwórz realistyczną historię choroby pacjenta z cukrzycą". (Drogie, ale uwzględnia korelacje między polami, np. leki pasują do diagnozy).

Dobre dane syntetyczne muszą zachować **Utility** (być użyteczne analitycznie) i **Privacy** (być nieodwracalne do oryginału).

# 💡 Przykład zastosowania
Bank chce przetestować nowy system wykrywania fraudów. Nie może użyć prawdziwych danych klientów na środowisku testowym (bezpieczeństwo).
Generuje 1 milion syntetycznych transakcji, w tym 5000 "fraudów" o specyficznych wzorcach (np. wypłata w Meksyku 5 min po wypłacie w Polsce). System testowy uczy się na tym wykrywać te wzorce.

## 📌 Źródła
- "Synthetic Data for [[Deep Learning|Deep Learning]]" (Arxiv).

## 👽 Brudnopis
- Gartner przewiduje, że do 2030 większość danych używanych w AI będzie syntetyczna.
- Narzędzia: SDV (Synthetic Data Vault), Gretel.ai, Mostly AI.