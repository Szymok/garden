---

title: Computed Content  
created: 2025-04-01  
status:  
category: metadata modeling / data catalog  
difficulty: zaawansowany  
language: pl  
tags:

- metadata
- computed content
- modele danych
- SQL
- modelowanie semantyczne  
aliases:
- zawartość obliczeniowa
- computed node
- wyliczane właściwości

---

# 🎯 Definicja

**Computed Content** (zawartość obliczeniowa) to specjalny typ węzła w modelu metadanych, który nie zawiera metadanych bezpośrednio, lecz uzyskuje swoje wartości poprzez wykonanie zapytania SQL na innych węzłach modelu. Służy do przeliczania zależnych wartości, generowania syntetycznych relacji lub agregatów bez fizycznego przechowywania danych.

# 🔑 Kluczowe punkty

- ⚙️ Zapytania są zdefiniowane w uproszczonym języku SQL i działają w kontekście metamodelu.
- 📊 Stosowane do wyliczania dynamicznych właściwości na podstawie statycznych danych modelu.
- 📦 Computed Content składa się z 3 sekcji:
    1. **Input Attributes** – które obiekty/węzły biorą udział w obliczeniach,
    2. **Query Section** – zapytanie SQL, które generuje wynikowe dane,
    3. **Computed Properties** – mapowanie wyników zapytania do właściwości obiektów w modelu.
- 🛠️ Obowiązkowe kolumny wyniku SELECT:
    - `parent_id_i` – ID obiektu nadrzędnego, do którego przypisany będzie wynik,
    - `id_i` – unikalny identyfikator rekordu wynikowego,
    - `from_h` – numer rewizji historii (history change versioning),
    - `path_i` – ścieżka komponentu w drzewie modelu,
    - `type_i` – typ encji przypisywanej.

# 📚 Szczegółowe wyjaśnienie

Computed Content pozwala na:

- tworzenie elementów modelu bez konieczności ich fizycznego istnienia w źródle danych,
- dynamiczne obliczanie liczby elementów podrzędnych dla danego obiektu (np. liczba atrybutów w encji),
- powiązania pomiędzy różnymi poziomami modelu (np. z obiektu „Child” pobrać nazwę „Parent”),
- generowanie niestandardowych indeksów, flag, etykiet lub etykiet zgodności.

## Typowa struktura zapytania

```sql
SELECT
  parent.id AS parent_id_i,
  CONCAT(parent.id, '-', child.id) AS id_i,
  CURRENT_HISTORY() AS from_h,
  parent.path AS path_i,
  'ChildSummary' AS type_i,
  COUNT(child.id) AS computed_total_children
FROM
  my_model.Entity parent
JOIN
  my_model.Attribute child ON child.parent_id = parent.id
GROUP BY
  parent.id, parent.path
```

## Obowiązkowe elementy wynikowego zbioru danych

|Kolumna|Opis|
|---|---|
|`parent_id_i`|ID obiektu, do którego odnosi się wynik|
|`id_i`|Unikalny identyfikator encji wynikowej|
|`from_h`|Numer rewizji historii (np. CURRENT_HISTORY())|
|`path_i`|Ścieżka encji nadrzędnej w drzewie modelu|
|`type_i`|Typ logiczny nowego obiektu|

Pozostałe kolumny (np. `computed_total_children`) są definiowane dowolnie i będą dostępne jako właściwości.

# 💡 Przykład zastosowania

Przykład: Stworzenie wyliczanej encji, która dla każdego obiektu typu „Tabela” podaje liczbę jej kolumn:

```sql
SELECT
  t.id AS parent_id_i,
  CONCAT(t.id, '-cc') AS id_i,
  CURRENT_HISTORY() AS from_h,
  t.path AS path_i,
  'ColumnCount' AS type_i,
  COUNT(c.id) AS total_columns
FROM
  catalog.Table t
JOIN
  catalog.Column c ON c.table_id = t.id
GROUP BY
  t.id, t.path
```

W ten sposób można dodać np. dynamiczne pole `total_columns` do tabel jako computed content — bez wprowadzania go do źródła danych.

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://help.collibra.com/docs/latest/Conceptual_Modeling](https://help.collibra.com/docs/latest/Conceptual_Modeling)
- [https://www.dataversity.net/semantic-modeling-and-logical-relationships/](https://www.dataversity.net/semantic-modeling-and-logical-relationships/)

# 👽 Brudnopis

- Computed Content = sposób na syntetyczny węzeł, nie istnieje fizycznie w bazie
- Mieszanka logicznego modelowania + SQL transformacji w katalogu
- Obowiązkowe: parent_id_i, id_i, path_i, from_h, type_i → kontrola nad pozycjonowaniem node’a
- Można tworzyć: label, alias, lineage links z detektywnych zależności
- Odciąża model główny — dynamiczne widoki + reguły do filtrowania/konsumpcji przez użytkownika