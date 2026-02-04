---
title: Dane Referencyjne (ONE Data)
created: 2026-02-04
status: sapling
category: Data Quality
difficulty: intermediate
language: pl
tags:
  - ataccama
  - one-data
  - reference-data
  - deduplication
  - remediation
aliases:
  - Tabele ONE Data
  - Zarządzanie słownikami
  - Deduplikacja w ONE Data
---
# 🎯 Definicja
Moduł platformy Ataccama ONE umożliwiający przechowywanie, edycję i zarządzanie danymi referencyjnymi (słownikami) bezpośrednio w aplikacji, zintegrowany z silnikiem jakości danych (DQ) oraz funkcjami deduplikacji.

# 🔑 Kluczowe punkty
- **Edytowalność:** W przeciwieństwie do zwykłych elementów katalogu (Catalog Items), dane w ONE Data są fizycznie przechowywane i edytowalne w bazie platformy.
- **Deduplikacja:** Wbudowany mechanizm grupowania rekordów i tworzenia unikalnych wpisów referencyjnych (Golden Records).
- **Remediacja:** Używany do naprawy błędnych rekordów (Invalid Records) pochodzących z innych systemów.

# 📚 Szczegółowe wyjaśnienie
ONE Data to "Excel na sterydach" wbudowany w platformę. Pozwala data stewardom na:
1. **Tworzenie słowników:** Np. lista kodów krajów, mapowania produktów.
2. **Import danych:** Z plików CSV, z katalogu danych (Catalog Items) lub z wyników reguł DQ.
3. **Deduplikację:** Jeśli zaimportujesz listę klientów z duplikatami, ONE Data potrafi je zgrupować po kluczu (np. Email) i stworzyć tabelę "czystą".

**Tryby Importu:**
- *Full:* Dane + wyniki DQ.
- *Data Only:* Same dane.
- *Deduplicated:* Import z logiką łączenia rekordów.

# 💡 Przykład zastosowania
Scenariusz naprawy danych (Remediation):
1. System DQ wykrył 500 błędnych adresów w systemie CRM.
2. Rekordy są ładowane do tabeli ONE Data.
3. Data Steward poprawia literówki w przeglądarce.
4. Dane są walidowane ponownie (przycisk "Run DQ").
5. Poprawione dane są eksportowane z powrotem do CRM lub używane jako tabela lookup.

## 📌 Źródła
1. Get Started with ONE Data
2. Import Data from a Catalog Item
3. 14.5 Updates/Release Notes

## 👽 Brudnopis
- ONE Data = edytowalne tabele w aplikacji; służą do referencji i remediacji.
- Tworzenie: pusta, z pliku, z Catalog Item (Full/Invalid/Data only/Deduplicated).
- Deduplikacja: klucz 1/n atrybutów, reguły null, preferencja niepustych, przeniesienie termów/reguł; użycie jako referencja w DQ.
- Remediacja: import invalid, filtry DQ, edycja, auto-odświeżanie metadanych DQ, eksport.
- Różnice: Catalog Items = metadane + próbka; ONE Data = realne dane, edycja.
- Widoki: Data/Overview/History/Lineage/DQ Results/Relationships.