---
title: Data Reconciliation (Rekonsyliacja Danych)
created: 2026-02-04
status: evergreen
category: Data Quality
difficulty: intermediate
language: pl
tags:
  - reconciliation
  - migration
  - consistency
  - validation
aliases:
  - Uzgadnianie Danych
  - Porównywanie Danych
---
# 🎯 Definicja
**Data Reconciliation** (Rekonsyliacja) to proces porównywania dwóch zbiorów danych w celu upewnienia się, że są one zgodne. Najczęściej stosowany podczas migracji danych (np. z Oracle do Snowflake) lub weryfikacji procesów finansowych, aby potwierdzić, że "to co wyszło" jest tym samym, "co dotarło".

# 🔑 Kluczowe punkty
- **Porównanie:** Sprawdza liczbę rekordów (Row Count), sumy kontrolne (Aggregates) oraz rozkłady wartości.
- **Wykrywanie różnic:** Wskazuje braki (orphans), duplikaty i niezgodności wartości.
- **Zastosowanie:** Testy regresji, migracje, audyty finansowe.

# 📚 Szczegółowe wyjaśnienie
W Ataccama ONE funkcja "Reconciliation" pozwala porównać metadane i statystyki profilowania między systemem źródłowym (Origin) a docelowym (Target).
Nie zawsze trzeba porównywać każdy rekord (co jest kosztowne). Często wystarczy:
1.  Czy liczba wierszy się zgadza?
2.  Czy suma kolumny `kwota_transakcji` jest taka sama?
3.  Czy `min/max` daty są takie same?
Jeśli te metryki się zgadzają, istnieje wysokie prawdopodobieństwo, że migracja się udała.

# 💡 Przykład zastosowania
Migracja hurtowni danych z on-premise do chmury.
Tabela `Faktury` ma 10 mln wierszy.
Po skopiowaniu do chmury uruchamiasz Reconciliation.
Wynik:
- Row Count: Zgodny (10 mln).
- Suma Netto: Niezgodna (różnica o 0.01 PLN).
Wniosek: Błąd zaokrągleń przy konwersji typów danych (np. float vs decimal). Bez rekonsyliacji mógłbyś tego nie zauważyć.

## 📌 Źródła
- "Data Quality Assessment" - Arkady Maydanchik.
- Ataccama ONE Documentation.

## 👽 Brudnopis
- Fingerprinting: Technika tworzenia skrótów (haszy) z danych, aby szybko porównywać duże zbiory bez przesyłania ich całej zawartości.
- W One Desktop można zrobić `Record Level Reconciliation` (porównanie każdego wiersza ID do ID), ale jest to zasobożerne.