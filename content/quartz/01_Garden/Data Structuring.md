---
title: Data Structuring (Strukturyzacja Danych)
created: 2026-02-04
status: evergreen
category: Data Engineering / Processing
difficulty: basic
language: pl
tags:
  - structuring
  - nlp
  - parsing
  - regex
  - etl
aliases:
  - Strukturyzacja danych
  - Parsing
---
# 🎯 Definicja
**Strukturyzacja danych** to proces zamiany " chaotycznego tekstu" na "uporządkowane tabelki".
Przykład: Masz PDF z fakturą (Tekst). Chcesz mieć Excela z kolumnami: `Kwota`, `Data`, `Sprzedawca`. To jest strukturyzacja.

# 🔑 Kluczowe punkty
- **Unstructured -> Structured:** 80% danych w firmach to dane niestrukturalne (emaile, PDFy, rozmowy). Strukturyzacja pozwala je analizować.
- **Narzędzia:** Regex (dla prostych wzorców), NLP (dla tekstu), OCR (dla skanów), LLM (najnowsze i najskuteczniejsze).

# 📚 Szczegółowe wyjaśnienie
Dane dzielimy na:
1.  **Strukturalne:** Tabele SQL, CSV.
2.  **Półstrukturalne:** JSON, XML, Wypełnione Formularze.
3.  **Niestrukturalne:** Email: "Cześć, kupiłem 5 bułek za 10 zł".
Strukturyzacja (Parsing) to zamiana trójki w jedynkę.
Dawniej pisało się RegExy: `(\d+) zł`.
Dziś daje się to do LLM: "Wyciągnij kwotę i produkt jako JSON".

# 💡 Przykład zastosowania
Firma ubezpieczeniowa dostaje tysiące skanów dowodów rejestracyjnych.
Robienie tego ręcznie to koszmar.
Pipeline:
1. OCR (Czyta obrazek -> Tekst).
2. LLM (Czyta tekst -> JSON `{vin: "...", make: "..."}`).
3. Baza Danych (Insert JSON).
Teraz można filtrować: "Pokaż wszystkie Toyoty".

## 📌 Źródła
- "Unstructured Data Analysis" guides.

## 👽 Brudnopis
- Najważniejszy trend: LLM jako uniwersalny parser. Zamiast pisać 100 reguł if-else dla różnych faktur, dajesz jeden prompt.
