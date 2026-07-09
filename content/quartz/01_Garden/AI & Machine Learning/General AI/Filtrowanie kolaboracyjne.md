---
title: Filtrowanie Kolaboracyjne (Collaborative Filtering)
created: 2026-02-04
status: evergreen
category: Machine Learning
difficulty: intermediate
language: pl
tags:
  - recommendations
  - recommender-systems
  - matrix-factorization
  - user-item
aliases:
  - Collaborative Filtering
  - Systemy Rekomendacyjne
---
# 🎯 Definicja
**Filtrowanie Kolaboracyjne** to metoda używana w systemach rekomendacyjnych (np. Netflix, Spotify), która przewiduje, co spodoba się użytkownikowi, na podstawie opinii **innych, podobnych użytkowników**. Nie analizuje treści produktu (np. "to jest horror"), tylko zachowania ludzi ("Ludzie, którzy lubią to, co ty, lubią też X").

# 🔑 Kluczowe punkty
- **Assumption (Założenie):** Jeśli zgadzaliśmy się w przeszłości, będziemy zgadzać się w przyszłości.
- **Macierz:** Opiera się na gigantycznej macierzy Użytkownik x Produkt.
- **Problem zimnego startu:** Nie działa dla nowych użytkowników (bo nie wiemy, do kogo są podobni).

# 📚 Szczegółowe wyjaśnienie
Dwa główne typy:
1.  **User-based:** "Znajdź mi bliźniaka". Jacek lubi A i B. Agata lubi A i B. Jacek lubi C. -> Poleć C Agacie.
2.  **Item-based:** "Znajdź mi podobny produkt". Klienci często kupują Piwo i Chipsy razem. Ktoś kupił Piwo -> Poleć Chipsy.

Technicznie realizowane często przez **Matrix Factorization** (rozkład macierzy), co pozwala odkryć ukryte cechy (Latent Factors).

# 💡 Przykład zastosowania
Amazon: "Klienci, którzy kupili ten produkt, kupili również...".
To klasyczne Item-based Collaborative Filtering. Nie analizuje, że to "Lampa", tylko analizuje, że występuje w koszykach z "Żarówką".

## 📌 Źródła
- "Matrix Factorization Techniques for Recommender Systems" - Netflix Prize papers.

## 👽 Brudnopis
- Nowoczesne systemy łączą to z Content-Based Filtering (analizą treści), tworząc systemy hybrydowe, aby ominąć problem zimnego startu.
- [[Deep Learning|Deep Learning]] (NCF - Neural Collaborative Filtering) zastępuje klasyczne metody macierzowe.