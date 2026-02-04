---
title: Metadata Swamp (Bagno Metadanych)
created: 2026-02-04
status: evergreen
category: Data Governance / Anti-Patterns
difficulty: basic
language: en
tags:
  - anti-pattern
  - chaos
  - metadata-management
  - standardization
aliases:
  - Bałagan w metadanych
  - Unmanaged Metadata
---
# 🎯 Definicja
**Metadata Swamp** to sytuacja, w której organizacja gromadzi ogromne ilości metadanych (logi, schematy, definicje), ale są one tak nieuporządkowane, niespójne i nieopisane, że stają się bezużyteczne. To Data Lake, o które nikt nie zadbał.

# 🔑 Kluczowe punkty
- **Przyczyna:** Importowanie wszystkiego "jak leci" bez strategii i modelu (MMDM).
- **Objaw:** Użytkownik szuka "Sprzedaży" i dostaje 50 tabel o nazwie `sales_v1`, `sales_final`, `sales_new`, i nie wie, która jest prawdziwa.
- **Koszt:** Utrata zaufania do danych. Analitycy wracają do pytania kolegów zamiast korzystać z katalogu.

# 📚 Szczegółowe wyjaśnienie
Jak uniknąć bagna?
1.  **Standaryzacja:** Zdefiniuj, co to znaczy "Dobra Tabela" (musi mieć Opis i Właściciela).
2.  **Curation:** Automaty mogą pobrać dane, ale ludzie (Stewards) muszą je zatwierdzić.
3.  **Lifecycle:** Usuwaj stare, nieużywane metadane.

# 💡 Przykład zastosowania
Firma włączyła "Automatyczny skaner" dla wszystkich swoich serwerów plików.
Katalog zassał 10 milionów plików Excel, w tym "Lista zakupów na grilla 2019".
Kiedy CEO szuka "Budżet 2024", wyszukiwarka tonie w śmieciach.
To jest klasyczny Metadata Swamp.

## 📌 Źródła
- "Data Lake vs Data Swamp".

## 👽 Brudnopis
- "Garbage In, Garbage Out". Katalog Danych jest tylko tak dobry, jak jakość metadanych, które do niego wpuścisz.