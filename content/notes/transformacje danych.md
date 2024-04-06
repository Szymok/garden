---
title: "transformacja danych"
tags:
- inżynieria danych
---
Transformacja danych to proces konwertowania danych z jednego formatu na inny. Powodem takiej transformacji może być optymalizacja danych do innego przypadku użycia niż pierwotnie zakładano, lub dostosowanie ich do wymagań przechowywania w innym systemie. Transformacja danych może obejmować kroki takie jak oczyszczanie, normalizacja, [strukturyzacja](notes/strukturyzacja%20danych.md), walidacja, sortowanie, łączenie lub [wzbogacanie](notes/data%20enrichment.md) danych.

## Jak jest wykonywana transformacja danych
Dane często są przekształcane jako część podejścia [ETL (Extract, Transform, Load)](notes/etl.md) lub [ELT (Extract, Load, Transform)](notes/elt.md) do [integracji danych](notes/integracja%20danych.md).

Zobacz [ETL vs. ELT](notes/etl%20vs%20elt.md) dla porównania tych dwóch podejść.

Dodatkowo, niedawno pojawiło się hybrydowe podejście znane jako [EtLT (Extract, "tweak", Load, Transform)](notes/etlt.md). Kombinuje ono aspekty zarówno ETL, jak i ELT.

## Korzyści z transformacji danych
Poprawnie stosowana transformacja danych może dostarczyć następujące korzyści:

- Poprawiona efektywność i szybkość zapytań.
- Konwersja danych na format wymagany przez system docelowy.
- Wzbogacenie danych o dodatkowe informacje umożliwiające łatwiejsze uzyskiwanie wniosków.
- Poprawiona jakość danych poprzez walidację, naprawianie i usuwanie duplikatów.

## Przykłady transformacji danych
Poniżej znajdują się przykłady, jak można przekształcić dane, aby osiągnąć niektóre z wymienionych wyżej korzyści.

### Poprawiona efektywność i szybkość
Jednym rodzajem transformacji może być wyciągnięcie strukturyzowanych danych z danych przechowywanych w postaci tekstu. Wyobraź sobie dane w następującej postaci:

```
input_string: "Bob ma 29 lat"
```

Aby w przyszłości efektywnie przetwarzać te dane, warto przekształcić je w dodatkowe/nowe pola i przechowywać jako:

```
imię: "Bob"
wiek: 29
```

Przechowywanie danych w ten sposób znacznie ułatwia analizę za pomocą operacji takich jak:

```sql
SELECT * FROM X WHERE Age=29
```

### Wzbogacanie danych
[Wzbogacanie danych](data%20enrichment.md) to transformacja danych, która dodaje dodatkowe informacje do danych, umożliwiając wykonywanie nowych rodzajów zapytań.