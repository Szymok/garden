---
title: Notacja Big-O (Złożoność Obliczeniowa)
created: 2026-02-04
status: evergreen
category: Computer Science
difficulty: intermediate
language: pl
tags:
  - algorithms
  - complexity
  - optimization
  - performance
aliases:
  - Big O Notation
  - Złożoność Algorytmów
---
# 🎯 Definicja
**Notacja Big-O** (O duże) to sposób zapisu, jak szybko rośnie czas wykonania algorytmu (lub zużycie pamięci) wraz ze wzrostem ilości danych (`n`). To język inżynierów do mówienia o "skalowalności".

# 🔑 Kluczowe punkty
- **O(1) - Stała:** Czas jest zawsze ten sam (np. wyciągnij element z HashMapy). Najszybsze.
- **O(n) - Liniowa:** Przejdź przez listę raz (np. znajdź max w nieposortowanej liście).
- **O(log n) - Logarytmiczna:** Dziel problem na pół (np. Binary Search). Bardzo szybkie.
- **O(n^2) - Kwadratowa:** Pętla w pętli (np. porównaj każdy z każdym). Wolne dla dużych danych.

# 📚 Szczegółowe wyjaśnienie
Big-O opisuje **Najgorszy Przypadek (Worst Case)**.
Dlaczego to ważne w Inżynierii Danych?
Jeśli piszesz skrypt, który przetwarza 100 rekordów, O(n^2) zadziała w ułamku sekundy.
Jeśli wrzucisz tam 1 milion rekordów (Big Data), O(n^2) będzie się liczyć latami. O(n) policzy się w minuty.

# 💡 Przykład zastosowania
Masz dwie listy Klientów (po 10k rekordów) i chcesz znaleźć wspólnych.
- Algorytm naiwny (pętla w pętli): Sprawdź każdego z każdym. 10k * 10k = 100 mln operacji. (O(n^2)).
- Algorytm Hash Set: Wrzuć jedną listę do zbioru (Hash Set). Przejdź przez drugą i sprawdzaj obecność. 10k + 10k = 20 tys. operacji. (O(n)).
Różnica: Sekundy vs Godziny.

## 📌 Źródła
- "Cracking the Coding Interview".

## 👽 Brudnopis
- Pamiętaj: Przedwczesna optymalizacja to zło, ale ignorowanie złożoności przy Big Data to samobójstwo.