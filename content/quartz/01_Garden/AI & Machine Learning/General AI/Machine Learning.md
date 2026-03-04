---
title: Machine Learning (Uczenie Maszynowe)
created: 2026-02-04
status: evergreen
category: AI / Fundamentals
difficulty: basic
language: pl
tags:
  - ml
  - ai
  - algorithms
  - supervised
  - unsupervised
aliases:
  - Uczenie Maszynowe
  - ML
---
# 🎯 Definicja
**Machine Learning (ML)** to sztuka uczenia komputerów bez ich programowania.
Zamiast pisać instrukcję `if (x > 5) then y`, dajesz komputerowi 1000 przykładów X i Y, a on sam zgaduje zasadę (funkcję).

# 🔑 Kluczowe punkty
- **Dane:** Bez danych nie ma ML. Dane to paliwo.
- **Trening:** Proces szukania wzorców.
- **Generalizacja:** Celem nie jest wykucie przykładów na pamięć, ale zrozumienie zasady, by działać na nowych danych.

# 📚 Szczegółowe wyjaśnienie
Główne typy:
1.  **Supervised (Nadzorowane):** Masz pytania i odpowiedzi. (Nauczyciel pokazuje: "To jest kot, to jest pies"). Np. Klasyfikacja spamu, Przewidywanie ceny mieszkań.
2.  **Unsupervised (Nienadzorowane):** Masz tylko dane. (Nauczyciel rzuca klocki i mówi: "Poukładaj to sensownie"). Np. Segmentacja klientów, Wykrywanie anomalii.
3.  **Reinforcement (Wzmocnienie):** Metoda kija i marchewki. (Agent gra w grę, dostaje punkty za wygraną). Np. AI w grach, Robotyka.

# 💡 Przykład zastosowania
Filtry Spamu w Gmailu.
Kiedy klikasz "To jest spam", uczysz model (Supervised Learning).
Model "widzi", że słowa "Wygrałeś", "Viagra", "Książę z Nigerii" często występują w spamie. Uczy się wagi dla tych słów.
Następnym razem sam zablokuje podobny mail.

## 📌 Źródła
- Andrew Ng - Machine Learning Course (Coursera).

## 👽 Brudnopis
- ML to podzbiór AI. [[Deep Learning]] (Sieci neuronowe) to podzbiór ML. [[Base LLM|LLM]] to podzbiór Deep Learningu.
