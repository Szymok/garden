---
title: GraphQL w Ataccama (API Dostępowe)
created: 2026-02-04
status: evergreen
category: API & Integration
difficulty: intermediate
language: pl
tags:
  - ataccama
  - api
  - graphql
  - integration
  - automation
aliases:
  - Ataccama API
  - ONE API
---
# 🎯 Definicja
**GraphQL w [[Ataccama|Ataccama]]** to główny interfejs programistyczny (API) platformy [[Ataccama|Ataccama]] ONE. Służy do automatyzacji zadań, integracji z innymi systemami (np. Power BI, Jira) oraz budowania niestandardowych aplikacji. W przeciwieństwie do REST, pozwala pobrać dokładnie te dane, których potrzebujesz (np. tylko nazwy tabel, bez ich kolumn).

# 🔑 Kluczowe punkty
- **Single Endpoint:** Wszystkie zapytania lecą na jeden adres (zazwyczaj `/graphql`).
- **Elastyczność:** Klient decyduje, jakie pola chce dostać w odpowiedzi (brak Over-fetching).
- **Zasięg:** Daje dostęp do Katalogu (Catalog), Słownika (Glossary), Reguł DQ, Użytkowników i Schedulerów.

# 📚 Szczegółowe wyjaśnienie
Przykładowe obiekty dostępne przez API:
- `catalogItem`: Tabele, pliki, systemy.
- `glossaryTerm`: Terminy biznesowe.
- `dqRule`: Definicje reguł jakości.
- `processingTask`: Statusy zadań przetwarzania.

Zapytania mogą być filtrowane (np. `where: { name: { eq: "Customer" } }`) i stronicowane.

# 💡 Przykład zastosowania
Scenariusz: Chcesz wygenerować raport "Top 10 najgorszych tabel w systemie" i wysłać go mailem.
Skrypt Python:
1. Łączy się z GraphQL.
2. Wysyła Query o `catalogItems` posortowane rosnąco po `qualityScore`.
3. Pobiera pola `name`, `owner`, `qualityScore`.
4. Formatuje wynik i wysyła maila.

## 📌 Źródła
- [[Ataccama|Ataccama]] Developer Guide.

## 👽 Brudnopis
- [[Ataccama|Ataccama]] udostępnia też stare API SOAP/REST dla niektórych funkcji Legacy, ale GraphQL jest standardem dla "ONE".
- GenAI w [[Ataccama|Ataccama]] często pod spodem generuje właśnie zapytania GraphQL.