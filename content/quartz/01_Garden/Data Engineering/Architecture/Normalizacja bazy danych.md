---

title: Normalizacja bazy danych  
created: 2025-07-15  
status: 🌱 draft
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- normalizacja
- relacyjne bazy danych
- projektowanie danych
- modelowanie relacyjne  
aliases:
- normal forms
- normalizacja relacyjna

---

# 🎯 Definicja

**Normalizacja [[Bazy danych|bazy danych]]** to proces systematycznego organizowania danych w relacyjnych bazach danych w taki sposób, aby zredukować redundancję i zapewnić integralność danych. Opiera się na zestawie reguł (tzw. form normalnych) zdefiniowanych przez Edgara F. Codda, twórcę modelu relacyjnego. Dzięki normalizacji struktura [[Bazy danych|bazy danych]] staje się klarowna, spójna i łatwa w utrzymaniu.

# 🔑 Kluczowe punkty

- Normalizacja eliminuje duplikaty danych i zapewnia spójność informacji.
- Każdy etap normalizacji (1NF, 2NF, 3NF itp.) eliminuje określony typ nieoptymalnej zależności.
- Proces bazuje na kluczach głównych, zależnościach funkcjonalnych i dekompozycji tabel.
- Nadmiarowa dekompozycja może prowadzić do złożonych zapytań – dlatego czasami stosuje się denormalizację.
- Normalizacja jest fundamentem projektowania [[OLTP|OLTP]] (Online Transaction Processing), a nie OLAP.

# 📚 Szczegółowe wyjaśnienie

## Kluczowe formy normalne

### 🔹 Pierwsza Forma Normalna (1NF)

- Tabela nie zawiera powtarzających się grup (żadnych kolumn tablicowych).
- Każde pole zawiera tylko jedną wartość (atomowość).
- Każdy wiersz ma unikalny identyfikator (klucz główny).

**Przykład naruszenia**:

|ID|Produkty|
|---|---|
|1|Mleko, Chleb, Masło|

**Po 1NF**:

|ID|Produkt|
|---|---|
|1|Mleko|
|1|Chleb|
|1|Masło|

### 🔹 Druga Forma Normalna (2NF)

- Spełnia 1NF.
- Wszystkie atrybuty nieprymarne są w pełni zależne od całego klucza głównego (nie tylko części, jeśli klucz jest złożony).
- Usuwa zależności częściowe.

**Przykład naruszenia**: jeśli mamy tabelę z kluczem złożonym (np. <NumerZamówienia, ProduktID>), a kolumna ProduktNazwa zależy tylko od ProduktID, to konieczna jest dekompozycja.

### 🔹 Trzecia Forma Normalna (3NF)

- Spełnia 2NF.
- Żaden atrybut nieprymarny nie zależy tranzytywnie od klucza głównego.
- Eliminuje zależności przechodnie.

**Przykład naruszenia**:  
Jeśli kolumna `Miasto` zależy od kolumny `KodPocztowy`, która z kolei zależy od `IDKlienta`, to mamy zależność przechodnią i należy wyodrębnić `KodPocztowy` do osobnej tabeli.

## Denormalizacja – celowe naruszenie reguł

**Denormalizacja** to intencjonalne wprowadzenie nadmiarowości danych w celu poprawy wydajności odczytu lub uproszczenia modelu. Jest standardem w projektach analitycznych (OLAP, hurtownie danych), gdzie kluczowe są szybkość zapytań i prostota modelu, a nie pełna spójność transakcyjna.

**Kiedy stosować:**

- W modelach faktów i wymiarów (np. schemat gwiazdy).
- W narzędziach BI i dashboardach (eliminacja wielu joinów).
- Gdy dane są rzadko aktualizowane, a często odczytywane (np. raporty).

# 💡 Przykład zastosowania

W systemie sprzedaży detalicznej tabela zamówień zawiera informacje o kliencie, adresie dostawy oraz zamówionych produktach. W ramach 3NF dane o kliencie, adresie i produktach są trzymane w osobnych tabelach i dołączane przy pomocy kluczy. W hurtowni danych te same dane są denormalizowane do jednej tabeli analitycznej, zawierającej powielenie nazw produktów i danych klientów – wszystko po to, by umożliwić szybkie agregacje bez potrzeby joinów.

## 📌 Źródła

- [Wikipedia: Database Normalization](https://en.wikipedia.org/wiki/Database_normalization)
- [Vertabelo: What is Database Normalization?](https://vertabelo.com/blog/database-normalization-what-it-is-and-why-you-should-care/)
- [Kimball Group – Denormalization in Dimensional Modeling](https://www.kimballgroup.com/)

# 👽 Brudnopis

- 1NF: atomowość, bez kolumn list
- 2NF: pełna zależność od całego klucza
- 3NF: bez przechodnich zależności
- [[OLTP|OLTP]]: normalizacja dobra do aktualizacji, spójności
- OLAP: denormalizacja → uproszczenie i wydajność raportowania
- Denormalizacja jako świadome złamanie reguł → korzyści w hurtowniach i BI
- Przykład: tabele faktów sprzedaży z nazwami produktów = duplicate but faster joins