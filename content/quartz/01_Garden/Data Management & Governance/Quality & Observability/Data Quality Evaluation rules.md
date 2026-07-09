---
title: Data Quality Evaluation Rules (Reguły Jakości Danych)
created: 2026-02-04
status: evergreen
category: Ataccama/DQ
difficulty: intermediate
language: pl
tags:
  - dq-rules
  - evaluation
  - validation
  - conditions
aliases:
  - Reguły Jakości
  - Data Quality Rules
---
# 🎯 Definicja
**[[Data Quality|Data Quality]] Evaluation [[Rules|Rules]]** to logika walidacyjna, która ocenia dane pod kątem poprawności. Każda reguła zwraca wynik: `Passed` (Poprawny), `Failed` (Błędny) lub `Warning` (Ostrzeżenie). Reguły te są podstawą do obliczania wskaźników jakości danych w [[Data Catalog|Data Catalog]] i Monitoring Projects.

# 🔑 Kluczowe punkty
- **Poziom atrybutu:** Reguły przypina się do konkretnych kolumn lub, lepiej, do Terminów Słownika (wtedy działają wszędzie tam, gdzie ten Termin jest użyty).
- **Logika:** Mogą być proste (np. `value is not null`) lub złożone (np. `PESEL` jest poprawny cyfrowo i pasuje do daty urodzenia).
- **Wynik:** Przekłada się na *[[Data Quality|Data Quality]] Score* (np. 95% rekordów jest poprawnych).

# 📚 Szczegółowe wyjaśnienie
W [[Ataccama|Ataccama]] ONE możesz tworzyć reguły na kilka sposobów:
1.  **Condition Builder:** Wyklikiwanie warunków (np. `City IN {'Warsaw', 'Cracow'}`).
2.  **Expression:** Pisanie w języku [[Ataccama|Ataccama]] Expression (podobne do [[SQL|SQL]]/Java), np. `matches(value, "[0-9]{2}-[0-9]{3}")`.
3.  **Components:** Używanie gotowych bloków logicznych stworzonych w [[ONE Desktop|ONE Desktop]] (dla bardzo złożonej logiki).

Reguły nie zmieniają danych! One tylko je **oceniają**. Do naprawy danych służy *Data Remediation*.

# 💡 Przykład zastosowania
Reguła "Valid Email".
Logika: `value IS NOT NULL AND matches(value, "^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")`.
Jeśli w bazie masz e-mail `jan.kowalski@gmail`, reguła zwróci `Passed`.
Jeśli masz `jan.kowalski@.com`, reguła zwróci `Failed`.
Raport pokaże: "Valid Email Quality: 50%".

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Documentation - DQ [[Rules|Rules]].

## 👽 Brudnopis
- Najlepszą praktyką jest przypisywanie reguł do **[[Glossary Terms]]**, a nie bezpośrednio do fizycznych kolumn. Dzięki temu, gdy podepniesz termin "Email" do 50 tabel, wszędzie automatycznie zadziała ta sama reguła.