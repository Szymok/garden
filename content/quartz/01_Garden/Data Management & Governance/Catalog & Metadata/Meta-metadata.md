---
title: Meta-Metadata (Kształt Metadanych)
created: 2026-02-04
status: evergreen
category: Data Architecture
difficulty: advanced
language: pl
tags:
  - metadata
  - abstraction
  - data-modeling
  - architecture
aliases:
  - Kształt Metadanych
  - Definition of Metadata
---
# 🎯 Definicja
**Meta-[[Metadata|Metadata]]** to opis **kształtu** metadanych. Jeśli Metadane mówią nam "To jest tabela z kolumną Email", to Meta-Metadane definiują: "W naszym systemie istnieją Tabele i Kolumny, a Kolumny mogą mieć Typy".

# 🔑 Kluczowe punkty
- **Data:** Zawartość (np. "jan@example.com").
- **[[Metadata|Metadata]]:** Kontekst (np. "Kolumna: Email, Typ: String").
- **Meta-[[Metadata|Metadata]]:** Struktura (np. "Obiekt Kolumna musi mieć Nazwę i Typ").

# 📚 Szczegółowe wyjaśnienie
Wyobraź sobie plik JSON.
- Plik (`data.json`) zawiera dane.
- Schemat (`schema.json`) opisuje, jakie pola mogą być w pliku data. To są metadane.
- Specyfikacja standardu JSON Schema (dokument RFC) opisuje, jak pisać schematy. To są meta-metadane.

W dużych organizacjach Meta-Metadane są kluczowe dla **interoperacyjności**. Jeśli jeden dział nazywa właściciela "Owner", a drugi "DataSteward", systemy się nie dogadają. Meta-metadane narzucają wspólny standard.

# 💡 Przykład zastosowania
System [[Data Catalog|Data Catalog]] (jak [[Ataccama|Ataccama]] cz Collibra).
Zanim wprowadzisz pierwszą tabelę, musisz zdefiniować Meta-Metadane:
"Każdy System ma Nazwę i Właściciela".
"Każda Tabela należy do Systemu".
To on definiuje "szkielet" katalogu.

## 📌 Źródła
- "DAMA-DMBOK" ([[Data Management|Data Management]] Body of Knowledge).

## 👽 Brudnopis
- Bez zdefiniowanych meta-metadanych tworzy się "[[[[Metadata|Metadata]] swamp|[[Metadata|Metadata]] Swamp]]" - bagno informacji, których nikt nie potrafi połączyć.