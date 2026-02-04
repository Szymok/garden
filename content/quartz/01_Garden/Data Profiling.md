---
title: Data Profiling (Profilowanie Danych)
created: 2026-02-04
status: evergreen
category: Data Quality
difficulty: basic
language: pl
tags:
  - profiling
  - data-exploration
  - quality
  - statistics
  - ataccama
aliases:
  - Profiling
  - Profilowanie
  - Analiza struktury danych
---
# 🎯 Definicja
**Data Profiling** to "rentgen danych". To proces automatycznego skanowania tabeli w celu zrozumienia, co w niej siedzi. Profilowanie mówi Ci: "Masz 10% nulli w kolumnie Email, a w kolumnie Wiek ktoś wpisał -50".

# 🔑 Kluczowe punkty
- **Statystyki:** Min, Max, Średnia, Odchylenie, Liczba Unikalnych Wartości.
- **Wzorce (Patterns):** Wykrywa, że telefony mają format "XXX-XXX-XXX" a nie "+48...".
- **Typy danych:** Sprawdza, czy kolumna "Data Urodzenia" to na pewno Data, a nie String.

# 📚 Szczegółowe wyjaśnienie
Profilowanie to PIERWSZY krok w każdym projekcie migracji lub jakości danych.
Nie możesz naprawić danych, jeśli nie wiesz, co jest zepsute.
Narzędzia (jak Ataccama ONE) robią to automatycznie po podpięciu źródła.

# 💡 Przykład zastosowania
Dostajesz plik CSV z "bazą klientów" od partnera.
Zanim wgrasz go do swojego CRM, puszczasz Profilowanie.
Wynik:
- Kolumna `Email`: 30% duplikatów (Oho! Trzeba deduplikować).
- Kolumna `Kraj`: Wartości "Polska", "PL", "Poland", "Polsza". (Trzeba ustandaryzować słownikiem).
Bez profilowania te śmieci trafiłyby do Twojego systemu.

## 📌 Źródła
- DAMA DMBOK.

## 👽 Brudnopis
- Profilowanie ≠ Monitoring. Profilowanie to "zdjęcie" (Snapshot) w danym momencie. Monitoring to "film" (ciągła kontrola zmian w czasie).