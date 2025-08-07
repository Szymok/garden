---

title: Business Hierarchy  
created: 2025-05-21  
status:  
category: data governance / business glossary  
difficulty: średni  
language: pl  
tags:

- hierarchia biznesowa
- data governance
- relacje terminów
- słownik biznesowy
- metadane  
aliases:
- hierarchia biznesowa
- business term hierarchy
- zależności terminów biznesowych

---

# 🎯 Definicja

**Business Hierarchy (hierarchia biznesowa)** to uporządkowana struktura relacji pomiędzy terminami (pojęciami) w słowniku biznesowym, umożliwiająca tworzenie logicznych zależności i powiązań między encjami, definicjami oraz obiektami metadanych. Pozwala przedstawiać relacje typu nadrzędność–podrzędność, dziedziczenie, pokrewieństwo lub zależność konceptualną.

# 🔑 Kluczowe punkty

- 🧭 Terminy w słowniku mogą być organizowane hierarchicznie, z nieograniczoną liczbą poziomów.
- 🔄 Obsługiwane są różne typy relacji: parent/child, copy of, derived from, defined in, linked via domain.
- 🔧 Użytkownicy mogą tworzyć własne typy relacji w ustawieniach globalnych (np. „zależy od”, „wersja X”, „odpowiednik w rynku X”).
- 🧠 Hierarchia biznesowa pomaga rozumieć kontekst i znaczenie terminów w różnych domenach organizacyjnych (np. sprzedaż, marketing, finanse).
- 🧩 Jest bazą do propagacji reguł jakości, klasyfikacji DQ, analiz lineage i polityk dostępu danych.

# 📚 Szczegółowe wyjaśnienie

## Jak działa hierarchia biznesowa?

Terminy w słowniku (Business Glossary) mogą być ze sobą logicznie powiązane. Dzięki hierarchii możemy:

- zorganizować pojęcia w dziedziny tematyczne (obszary biznesowe),
- ustalić kolejność dziedziczenia (np. "Klient biznesowy" dziedziczy po "Klient"),
- wskazać pochodzenie (np. "Średni przychód z klienta" → derived from → "Przychód całkowity"),
- mapować zależności między systemowymi reprezentacjami tego samego terminu.

### Przykładowe typy relacji:

|Relacja|Znaczenie|
|---|---|
|`parent of`|termin nadrzędny wobec innego|
|`derived from`|termin wyprowadzony kontekstowo|
|`defined in`|termin źródłowy dla innej definicji|
|`copy of`|powielony termin z innej domeny|
|`business equivalent`|odpowiednik w innym pionie/użytkowniku|

### Możliwości platform (np. Ataccama, Collibra):

- graficzne przedstawienie hierarchii w zakładce Overview,
- możliwość tworzenia wielu równoległych hierarchii,
- wspólne dziedziczenie obiektów, reguł jakości i klasyfikacji,
- relacje mogą być edytowalne i rozszerzalne.

## Wpływ na [[zarządzanie danymi]]

- 🧠 Ułatwia zrozumienie pojęć biznesowych i ich kontekstu organizacyjnego.
- 📘 Pomaga w jednoznacznym przypisaniu danych do definicji i terminów, nawet jeśli nazwy kolumn różnią się między systemami.
- 🔄 Umożliwia lepsze zarządzanie wielojęzycznymi, regionalnymi i domenowymi wersjami tych samych terminów.
- 🤖 Wspiera automatyczne klasyfikowanie danych na podstawie relacji — np. propagacja DQ i tagów (np. PII) po całej gałęzi.

# 💡 Przykład zastosowania

```python
# Przypisanie relacji "derived from" między terminami w słowniku
# Przykład: "ARPU" → derived from → "Total Revenue" + "User Count"

create_relation(
  source_term="ARPU",
  relation_type="derived_from",
  target_term="Total Revenue"
)

create_relation(
  source_term="ARPU",
  relation_type="derived_from",
  target_term="User Count"
)
```

W systemie typu Ataccama ONE użytkownik może tego dokonać wizualnie poprzez zakładkę **Overview** danego terminu, wybierając opcję „Add Relation”.

# 📌 Źródła

- [https://docs.ataccama.com/ONE/latest](https://docs.ataccama.com/ONE/latest)
- [https://help.collibra.com/docs/collibra/latest/Business_Glossary](https://help.collibra.com/docs/collibra/latest/Business_Glossary)
- [https://towardsdatascience.com/business-glossary-data-governance-explained-9f3ee15f7478](https://towardsdatascience.com/business-glossary-data-governance-explained-9f3ee15f7478)
- [https://dataconomy.com/2022/03/business-glossary-vs-data-catalog-difference/](https://dataconomy.com/2022/03/business-glossary-vs-data-catalog-difference/)

# 👽 Brudnopis

- Hierarchia ≠ klasyczna taksonomia – bardziej elastyczna i nazwalna zależność, nie tylko „dziedzina–podpojęcie”
- Platforma zwykle wspiera wiele relacji między tymi samymi obiektami (n-m), różnymi metrykami
- Słownik + katalog = pełna semantyka danych w organizacji
- Relacje = potencjał do workflow, wizualizacji lineage, DQ automatyki, zgodności językowej + organizacyjnej
- Przepływ typowy: tworzenie terminu → tworzenie relacji → przypisanie do danych/katalogów → propagacja klasyfikacji i reguł