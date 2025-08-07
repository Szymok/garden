---

title: "Normalizacja w Airbyte"  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- airbyte
- normalizacja
- integracja danych
- JSON
- relacyjne bazy danych  
aliases:
- normalizacja airbyte

---

# 🎯 Definicja

**Normalizacja w Airbyte** to automatyczny proces konwertowania zagnieżdżonych lub półstrukturalnych danych źródłowych (np. JSON z API) do postaci struktur relacyjnych, które można zapisać w bazach danych takich jak PostgreSQL, Snowflake czy BigQuery. Obejmuje rozbijanie złożonych struktur danych na zestaw tabel relacyjnych, w których zachowane są relacje i typy danych zgodne z miejscem docelowym.

# 🔑 Kluczowe punkty

- **Automatyzuje odwzorowanie danych JSON do relacyjnych struktur tabelarycznych.**
- **Stosowana w pipeline’ach ELT tuż po ekstrakcji, a przed transformacją w hurtowni.**
- Umożliwia łatwe przeszukiwanie, analizę i dalszą obróbkę danych źródłowych.
- Działa z wieloma docelowymi systemami analitycznymi (np. Postgres, Snowflake).
- Obsługuje wybór między pełną lub brakiem normalizacji – zależnie od potrzeb biznesowych.

# 📚 Szczegółowe wyjaśnienie

## Jak działa normalizacja w Airbyte?

1. **Źródło (np. REST API)** dostarcza dane zagnieżdżone (np. JSON-y z tablicami, obiektami).
2. Airbyte wykonuje **ekstrakcję** danych jako surowy JSON i zapisuje je (np. w kolumnie `_airbyte_data`).
3. Jeśli włączona jest normalizacja, Airbyte generuje schematy relacyjne i:
    - **Rozdziela kolekcje** do osobnych tabel.
    - **Mapuje typy pól**: string, int, timestamp itd.
    - **Utrzymuje relacje** między rekordami poprzez klucze techniczne (`_airbyte_ab_id`, `_airbyte_emitted_at`).
4. Tabele są ładowane do docelowej bazy danych jako gotowy model relacyjny.

## Przykład

🎯 Dane źródłowe (np. JSON z API):

```json
{
  "id": 1,
  "user": {
    "name": "Anna",
    "email": "anna@example.com"
  },
  "orders": [
    {"id": 1001, "product": "Shirt"},
    {"id": 1002, "product": "Book"}
  ]
}
```

Po normalizacji Airbyte utworzy:

- Tabela główna: `source_table_raw`
- Tabela `source_table_user` z kolumnami `name`, `email`
- Tabela `source_table_orders` z kolumnami `id`, `product` i kluczem do rekordu głównego

## Typowe systemy docelowe wspierające normalizację

- **PostgreSQL / MySQL**
- **Snowflake**
- **BigQuery**
- **Redshift**

## Rodzaje normalizacji w Airbyte

- **Basic normalization** (domyślna + prosty schemat relacyjny dla JSON)
- **Custom [[dbt]]-based normalization** — generuje projekt [[dbt]] i pozwala go dostosować do potrzeb

# 💡 Przykład zastosowania

Firma SaaS synchronizuje dane użytkowników z publicznego API do Snowflake. API zwraca dane jako zagnieżdżone JSON-y. Airbyte wykonuje regularne odczyty danych i po włączeniu opcji „Enable normalization”:

- Automatycznie przekształca rekordy do zestawu relacyjnych tabel.
- Każda podtabela (np. adresy, [[Roles|role]], statusy) ląduje w niezależnej tabeli z kluczem.
- Proces redukuje potrzebę ręcznego pisania parserów JSON, obniżając koszt integracji.

## 📌 Źródła

- [Airbyte Docs – Normalization](https://docs.airbyte.com/cloud/core-concepts#normalization)
- [Airbyte GitHub – [[dbt]]-normalization repository](https://github.com/airbytehq/airbyte/tree/master/airbyte-integrations/bases/base-normalization)
- Normalizacja Bazy Danych

## 👽 Brudnopis

- Normalizacja Airbyte ≠ klasyczna normalizacja bazy danych
- Przekształcanie JSON → tabele, automatycznie: flatten, typy, relacje
- Włączana per-connector jako opcja
- Custom [[dbt]] = advanced use → można overrideować przekształcenia
- Schemat działania: extract → (normalize) → load → (downstream [[dbt]]/[[Business Intelligence|BI]]/[[Uczenie Maszynowe|ML]])