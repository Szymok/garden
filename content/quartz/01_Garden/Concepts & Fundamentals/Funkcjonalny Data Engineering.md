---
title: Funkcjonalny Data Engineering (Functional Data Engineering)
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: advanced
language: pl
tags:
  - functional-programming
  - immutability
  - idempotency
  - reproducibility
aliases:
  - Functional Data Engineering
  - Maxine Beauchemin methodology
---
# 🎯 Definicja
**Funkcjonalny Data Engineering** to filozofia budowania pipeline'ów danych inspirowana programowaniem funkcyjnym. Traktuje przetwarzanie danych jako czystą funkcję: `Output = f(Input)`. Kluczowe zasady to **Immutability** (nie zmieniaj danych, twórz nowe wersje) i **Idempotency** (wielokrotne uruchomienie tego samego procesu daje ten sam wynik).

# 🔑 Kluczowe punkty
- **Reprodukowalność:** Zawsze możesz odtworzyć stan tabeli z przeszłości, przeliczając dane funkcją.
- **Idempotencja:** Jeśli pipeline wywali się w połowie, możesz go bezpiecznie puścić jeszcze raz od początku.
- **Nowoczesne narzędzia:** Apache Airflow, dbt, Dagster – zostały zbudowane na tych zasadach.

# 📚 Szczegółowe wyjaśnienie
W starym stylu (Proceduralnym): "Weź tabelę A, skasuj wiersze z błędami, nadpisz kolumnę X". (Ryzykowne! Jak coś pójdzie nie tak, dane stracone).
W stylu Funkcjonalnym: "Weź tabelę A (tylko do odczytu), przefiltruj, zapisz wynik jako Tabela B". Tabela A pozostaje nienaruszona. Tabela B jest wynikiem deterministycznej transformacji.

# 💡 Przykład zastosowania
Partycjonowanie w Data Lake.
Każdy dzień to osobny folder (partycja).
Przetwarzanie dnia 2024-01-01 to funkcja, która czyta `Raw/2024-01-01` i zapisuje `Silver/2024-01-01`.
Jeśli odkryjesz błąd w kodzie, kasujesz `Silver/2024-01-01`, poprawiasz kod i puszczasz funkcję jeszcze raz.

## 📌 Źródła
- "Functional Data Engineering" - Maxime Beauchemin (twórca Airflow i Superset).

## 👽 Brudnopis
- Zasada: "Compute is cheap, Storage is cheap, Human time is expensive". Funkcjonalne podejście zużywa więcej zasobów (więcej kopii danych), ale oszczędza masę czasu przy debugowaniu.